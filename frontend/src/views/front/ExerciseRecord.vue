<template>
  <el-card shadow="hover">
    <el-form :inline="true" :model="search" style="margin-bottom: 16px">
      <el-form-item>
        <el-select v-model="search.exerciseType" placeholder="运动类型" clearable style="width: 140px">
          <el-option v-for="t in typeOptions" :key="t" :label="t" :value="t" />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-date-picker v-model="search.dateRange" type="daterange" range-separator="至" start-placeholder="开始" end-placeholder="结束" value-format="YYYY-MM-DD" style="width: 260px" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="loadData">搜索</el-button>
        <el-button @click="resetSearch">重置</el-button>
      </el-form-item>
      <el-form-item style="float: right">
        <el-button type="success" @click="openDialog()">记录运动</el-button>
      </el-form-item>
    </el-form>

    <el-table :data="tableData" border stripe>
      <el-table-column prop="exerciseDate" label="日期" width="120" />
      <el-table-column prop="exerciseType" label="运动类型" width="100">
        <template #default="{ row }"><el-tag size="small">{{ row.exerciseType }}</el-tag></template>
      </el-table-column>
      <el-table-column prop="duration" label="时长(min)" width="100" />
      <el-table-column prop="calories" label="卡路里(kcal)" width="110" />
      <el-table-column prop="remark" label="备注" min-width="150" show-overflow-tooltip />
      <el-table-column label="操作" width="150" fixed="right">
        <template #default="{ row }">
          <el-button size="small" @click="openDialog(row)">编辑</el-button>
          <el-popconfirm title="确定删除？" @confirm="handleDelete(row.id)">
            <template #reference><el-button size="small" type="danger">删除</el-button></template>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>

    <el-pagination style="margin-top: 16px; justify-content: flex-end" v-model:current-page="pageNum" v-model:page-size="pageSize" :total="total" :page-sizes="[10,20,50]" layout="total, sizes, prev, pager, next" @current-change="loadData" @size-change="loadData" />

    <el-dialog v-model="dialogVisible" :title="isEdit ? '编辑运动记录' : '记录运动'" width="500px">
      <el-form ref="formRef" :model="form" :rules="rules" label-width="90px">
        <el-form-item label="运动日期" prop="exerciseDate"><el-date-picker v-model="form.exerciseDate" value-format="YYYY-MM-DD" style="width: 100%" /></el-form-item>
        <el-form-item label="运动类型" prop="exerciseType">
          <el-select v-model="form.exerciseType" style="width: 100%">
            <el-option v-for="t in typeOptions" :key="t" :label="t" :value="t" />
          </el-select>
        </el-form-item>
        <el-form-item label="时长(min)" prop="duration"><el-input-number v-model="form.duration" :min="1" :max="600" style="width: 100%" /></el-form-item>
        <el-form-item label="卡路里"><el-input-number v-model="form.calories" :min="0" :max="5000" style="width: 100%" /></el-form-item>
        <el-form-item label="备注"><el-input v-model="form.remark" type="textarea" :rows="2" /></el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" :loading="submitLoading" @click="handleSubmit">确定</el-button>
      </template>
    </el-dialog>
  </el-card>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { getExerciseRecordList, addExerciseRecord, updateExerciseRecord, deleteExerciseRecord } from '@/api/exerciseRecord'

const typeOptions = ['跑步', '游泳', '骑行', '健身', '球类', '瑜伽', '散步', '其他']
const tableData = ref([])
const pageNum = ref(1)
const pageSize = ref(10)
const total = ref(0)
const search = reactive({ exerciseType: '', dateRange: null })
const dialogVisible = ref(false)
const isEdit = ref(false)
const submitLoading = ref(false)
const formRef = ref()

const defaultForm = { id: null, exerciseDate: new Date().toISOString().slice(0, 10), exerciseType: '', duration: null, calories: null, remark: '' }
const form = reactive({ ...defaultForm })
const rules = {
  exerciseDate: [{ required: true, message: '请选择日期', trigger: 'change' }],
  exerciseType: [{ required: true, message: '请选择运动类型', trigger: 'change' }],
  duration: [{ required: true, message: '请输入时长', trigger: 'blur' }]
}

const loadData = async () => {
  const params = { pageNum: pageNum.value, pageSize: pageSize.value, exerciseType: search.exerciseType }
  if (search.dateRange?.length === 2) { params.startDate = search.dateRange[0]; params.endDate = search.dateRange[1] }
  const res = await getExerciseRecordList(params)
  tableData.value = res.data.records; total.value = Number(res.data.total)
}
const resetSearch = () => { search.exerciseType = ''; search.dateRange = null; pageNum.value = 1; loadData() }
const openDialog = (row) => { isEdit.value = !!row; Object.assign(form, row ? { ...row } : { ...defaultForm, exerciseDate: new Date().toISOString().slice(0, 10) }); dialogVisible.value = true }
const handleSubmit = () => {
  formRef.value.validate(async (valid) => {
    if (!valid) return; submitLoading.value = true
    try { if (isEdit.value) { await updateExerciseRecord(form); ElMessage.success('修改成功') } else { await addExerciseRecord(form); ElMessage.success('记录成功') }; dialogVisible.value = false; loadData() } finally { submitLoading.value = false }
  })
}
const handleDelete = async (id) => { await deleteExerciseRecord(id); ElMessage.success('删除成功'); if (tableData.value.length === 1 && pageNum.value > 1) pageNum.value--; loadData() }
onMounted(() => loadData())
</script>
