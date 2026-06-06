<template>
  <el-card shadow="hover">
    <el-form :inline="true" :model="search" style="margin-bottom: 16px">
      <el-form-item>
        <el-date-picker v-model="search.dateRange" type="daterange" range-separator="至" start-placeholder="开始日期" end-placeholder="结束日期" value-format="YYYY-MM-DD" style="width: 260px" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="loadData">搜索</el-button>
        <el-button @click="resetSearch">重置</el-button>
      </el-form-item>
      <el-form-item style="float: right">
        <el-button type="success" @click="openDialog()">记录数据</el-button>
      </el-form-item>
    </el-form>

    <el-table :data="tableData" border stripe>
      <el-table-column prop="recordDate" label="日期" width="120" />
      <el-table-column prop="height" label="身高(cm)" width="90" />
      <el-table-column prop="weight" label="体重(kg)" width="90" />
      <el-table-column prop="bmi" label="BMI" width="100">
        <template #default="{ row }">
          <el-tag v-if="row.bmi" :type="bmiTagType(row.bmi)" size="small">{{ row.bmi }} {{ bmiLabel(row.bmi) }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="systolicPressure" label="收缩压" width="80" />
      <el-table-column prop="diastolicPressure" label="舒张压" width="80" />
      <el-table-column prop="heartRate" label="心率" width="70" />
      <el-table-column prop="bloodSugar" label="血糖" width="70" />
      <el-table-column prop="bodyTemperature" label="体温" width="70" />
      <el-table-column prop="sleepHours" label="睡眠(h)" width="80" />
      <el-table-column prop="remark" label="备注" min-width="120" show-overflow-tooltip />
      <el-table-column label="操作" width="150" fixed="right">
        <template #default="{ row }">
          <el-button size="small" @click="openDialog(row)">编辑</el-button>
          <el-popconfirm title="确定删除？" @confirm="handleDelete(row.id)">
            <template #reference>
              <el-button size="small" type="danger">删除</el-button>
            </template>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>

    <el-pagination style="margin-top: 16px; justify-content: flex-end" v-model:current-page="pageNum" v-model:page-size="pageSize" :total="total" :page-sizes="[10, 20, 50]" layout="total, sizes, prev, pager, next" @current-change="loadData" @size-change="loadData" />

    <el-dialog v-model="dialogVisible" :title="isEdit ? '编辑健康数据' : '记录健康数据'" width="620px">
      <el-form ref="formRef" :model="form" :rules="rules" label-width="90px">
        <el-row :gutter="16">
          <el-col :span="12"><el-form-item label="记录日期" prop="recordDate"><el-date-picker v-model="form.recordDate" value-format="YYYY-MM-DD" style="width: 100%" /></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="身高(cm)"><el-input-number v-model="form.height" :min="100" :max="250" :precision="1" style="width: 100%" /></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="体重(kg)"><el-input-number v-model="form.weight" :min="20" :max="300" :precision="1" style="width: 100%" /></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="收缩压"><el-input-number v-model="form.systolicPressure" :min="60" :max="300" style="width: 100%" /></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="舒张压"><el-input-number v-model="form.diastolicPressure" :min="30" :max="200" style="width: 100%" /></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="心率"><el-input-number v-model="form.heartRate" :min="30" :max="220" style="width: 100%" /></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="血糖"><el-input-number v-model="form.bloodSugar" :min="1" :max="40" :precision="1" style="width: 100%" /></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="体温(℃)"><el-input-number v-model="form.bodyTemperature" :min="34" :max="42" :precision="1" style="width: 100%" /></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="睡眠(h)"><el-input-number v-model="form.sleepHours" :min="0" :max="24" :precision="1" style="width: 100%" /></el-form-item></el-col>
          <el-col :span="24"><el-form-item label="备注"><el-input v-model="form.remark" type="textarea" :rows="2" /></el-form-item></el-col>
        </el-row>
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
import { getHealthRecordList, addHealthRecord, updateHealthRecord, deleteHealthRecord } from '@/api/healthRecord'

const tableData = ref([])
const pageNum = ref(1)
const pageSize = ref(10)
const total = ref(0)
const search = reactive({ dateRange: null })
const dialogVisible = ref(false)
const isEdit = ref(false)
const submitLoading = ref(false)
const formRef = ref()

const defaultForm = { id: null, recordDate: new Date().toISOString().slice(0, 10), height: null, weight: null, systolicPressure: null, diastolicPressure: null, heartRate: null, bloodSugar: null, bodyTemperature: null, sleepHours: null, remark: '' }
const form = reactive({ ...defaultForm })

const rules = { recordDate: [{ required: true, message: '请选择记录日期', trigger: 'change' }] }

const bmiTagType = (bmi) => { if (bmi < 18.5) return 'info'; if (bmi < 24) return 'success'; if (bmi < 28) return 'warning'; return 'danger' }
const bmiLabel = (bmi) => { if (bmi < 18.5) return '偏瘦'; if (bmi < 24) return '正常'; if (bmi < 28) return '偏胖'; return '肥胖' }

const loadData = async () => {
  const params = { pageNum: pageNum.value, pageSize: pageSize.value }
  if (search.dateRange && search.dateRange.length === 2) {
    params.startDate = search.dateRange[0]
    params.endDate = search.dateRange[1]
  }
  const res = await getHealthRecordList(params)
  tableData.value = res.data.records
  total.value = Number(res.data.total)
}

const resetSearch = () => { search.dateRange = null; pageNum.value = 1; loadData() }

const openDialog = (row) => {
  isEdit.value = !!row
  Object.assign(form, row ? { ...row } : { ...defaultForm, recordDate: new Date().toISOString().slice(0, 10) })
  dialogVisible.value = true
}

const handleSubmit = () => {
  formRef.value.validate(async (valid) => {
    if (!valid) return
    submitLoading.value = true
    try {
      if (isEdit.value) {
        await updateHealthRecord(form)
        ElMessage.success('修改成功')
      } else {
        await addHealthRecord(form)
        ElMessage.success('记录成功')
      }
      dialogVisible.value = false
      loadData()
    } finally { submitLoading.value = false }
  })
}

const handleDelete = async (id) => {
  await deleteHealthRecord(id)
  ElMessage.success('删除成功')
  if (tableData.value.length === 1 && pageNum.value > 1) pageNum.value--
  loadData()
}

onMounted(() => loadData())
</script>
