<template>
  <el-card shadow="hover">
    <el-form :inline="true" :model="search" style="margin-bottom: 16px">
      <el-form-item><el-input v-model="search.username" placeholder="搜索用户名" clearable style="width: 160px" /></el-form-item>
      <el-form-item><el-date-picker v-model="search.dateRange" type="daterange" range-separator="至" start-placeholder="开始日期" end-placeholder="结束日期" value-format="YYYY-MM-DD" style="width: 260px" /></el-form-item>
      <el-form-item>
        <el-button type="primary" @click="loadData">搜索</el-button>
        <el-button @click="resetSearch">重置</el-button>
      </el-form-item>
    </el-form>
    <el-table :data="tableData" border stripe>
      <el-table-column prop="username" label="用户" width="100" />
      <el-table-column prop="recordDate" label="日期" width="120" />
      <el-table-column prop="height" label="身高" width="70" />
      <el-table-column prop="weight" label="体重" width="70" />
      <el-table-column prop="bmi" label="BMI" width="80">
        <template #default="{ row }">
          <el-tag v-if="row.bmi" :type="row.bmi < 18.5 ? 'info' : row.bmi < 24 ? 'success' : row.bmi < 28 ? 'warning' : 'danger'" size="small">{{ row.bmi }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="systolicPressure" label="收缩压" width="70" />
      <el-table-column prop="diastolicPressure" label="舒张压" width="70" />
      <el-table-column prop="heartRate" label="心率" width="60" />
      <el-table-column prop="bloodSugar" label="血糖" width="60" />
      <el-table-column prop="bodyTemperature" label="体温" width="60" />
      <el-table-column prop="sleepHours" label="睡眠" width="60" />
      <el-table-column prop="remark" label="备注" min-width="100" show-overflow-tooltip />
    </el-table>
    <el-pagination style="margin-top: 16px; justify-content: flex-end" v-model:current-page="pageNum" v-model:page-size="pageSize" :total="total" :page-sizes="[10,20,50]" layout="total, sizes, prev, pager, next" @current-change="loadData" @size-change="loadData" />
  </el-card>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { getHealthRecordAll } from '@/api/healthRecord'

const tableData = ref([])
const pageNum = ref(1)
const pageSize = ref(10)
const total = ref(0)
const search = reactive({ username: '', dateRange: null })

const loadData = async () => {
  const params = { pageNum: pageNum.value, pageSize: pageSize.value, username: search.username }
  if (search.dateRange && search.dateRange.length === 2) { params.startDate = search.dateRange[0]; params.endDate = search.dateRange[1] }
  const res = await getHealthRecordAll(params)
  tableData.value = res.data.records
  total.value = Number(res.data.total)
}
const resetSearch = () => { search.username = ''; search.dateRange = null; pageNum.value = 1; loadData() }
onMounted(() => loadData())
</script>
