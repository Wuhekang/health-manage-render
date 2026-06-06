<template>
  <el-card shadow="hover">
    <el-form :inline="true" :model="search" style="margin-bottom: 16px">
      <el-form-item>
        <el-select v-model="search.mealType" placeholder="选择餐次" clearable style="width: 140px">
          <el-option label="早餐" :value="1" /><el-option label="午餐" :value="2" /><el-option label="晚餐" :value="3" /><el-option label="加餐" :value="4" />
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
        <el-button type="success" @click="openDialog()">记录饮食</el-button>
      </el-form-item>
    </el-form>

    <el-table :data="tableData" border stripe>
      <el-table-column prop="dietDate" label="日期" width="120" />
      <el-table-column prop="mealType" label="餐次" width="80">
        <template #default="{ row }">
          <el-tag :type="['', 'primary', 'success', 'warning', 'info'][row.mealType]" size="small">{{ mealLabels[row.mealType] }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="foodName" label="食物名称" min-width="200" />
      <el-table-column prop="calories" label="卡路里(kcal)" width="110" />
      <el-table-column prop="remark" label="备注" min-width="120" show-overflow-tooltip />
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

    <el-dialog v-model="dialogVisible" :title="isEdit ? '编辑饮食记录' : '记录饮食'" width="500px">
      <el-form ref="formRef" :model="form" :rules="rules" label-width="90px">
        <el-form-item label="饮食日期" prop="dietDate"><el-date-picker v-model="form.dietDate" value-format="YYYY-MM-DD" style="width: 100%" /></el-form-item>
        <el-form-item label="餐次" prop="mealType">
          <el-select v-model="form.mealType" style="width: 100%">
            <el-option label="早餐" :value="1" /><el-option label="午餐" :value="2" /><el-option label="晚餐" :value="3" /><el-option label="加餐" :value="4" />
          </el-select>
        </el-form-item>
        <el-form-item label="食物名称" prop="foodName"><el-input v-model="form.foodName" /></el-form-item>
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
import { getDietRecordList, addDietRecord, updateDietRecord, deleteDietRecord } from '@/api/dietRecord'

const mealLabels = { 1: '早餐', 2: '午餐', 3: '晚餐', 4: '加餐' }
const tableData = ref([])
const pageNum = ref(1)
const pageSize = ref(10)
const total = ref(0)
const search = reactive({ mealType: null, dateRange: null })
const dialogVisible = ref(false)
const isEdit = ref(false)
const submitLoading = ref(false)
const formRef = ref()

const defaultForm = { id: null, dietDate: new Date().toISOString().slice(0, 10), mealType: null, foodName: '', calories: null, remark: '' }
const form = reactive({ ...defaultForm })
const rules = {
  dietDate: [{ required: true, message: '请选择日期', trigger: 'change' }],
  mealType: [{ required: true, message: '请选择餐次', trigger: 'change' }],
  foodName: [{ required: true, message: '请输入食物名称', trigger: 'blur' }]
}

const loadData = async () => {
  const params = { pageNum: pageNum.value, pageSize: pageSize.value, mealType: search.mealType || undefined }
  if (search.dateRange?.length === 2) { params.startDate = search.dateRange[0]; params.endDate = search.dateRange[1] }
  const res = await getDietRecordList(params)
  tableData.value = res.data.records; total.value = Number(res.data.total)
}
const resetSearch = () => { search.mealType = null; search.dateRange = null; pageNum.value = 1; loadData() }
const openDialog = (row) => { isEdit.value = !!row; Object.assign(form, row ? { ...row } : { ...defaultForm, dietDate: new Date().toISOString().slice(0, 10) }); dialogVisible.value = true }
const handleSubmit = () => {
  formRef.value.validate(async (valid) => {
    if (!valid) return; submitLoading.value = true
    try { if (isEdit.value) { await updateDietRecord(form); ElMessage.success('修改成功') } else { await addDietRecord(form); ElMessage.success('记录成功') }; dialogVisible.value = false; loadData() } finally { submitLoading.value = false }
  })
}
const handleDelete = async (id) => { await deleteDietRecord(id); ElMessage.success('删除成功'); if (tableData.value.length === 1 && pageNum.value > 1) pageNum.value--; loadData() }
onMounted(() => loadData())
</script>
