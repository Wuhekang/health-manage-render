<template>
  <div>
    <el-row :gutter="16" style="margin-bottom: 20px">
      <el-col :span="6" v-for="(card, idx) in statCards" :key="idx">
        <el-card shadow="hover" style="text-align: center">
          <el-icon :size="32" :style="{ color: card.color }"><component :is="card.icon" /></el-icon>
          <div style="font-size: 28px; font-weight: bold; margin: 8px 0; color: #303133">{{ card.value }}</div>
          <div style="color: #909399; font-size: 14px">{{ card.label }}</div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="16" style="margin-bottom: 20px">
      <el-col :span="12">
        <el-card shadow="hover"><template #header><span style="font-weight: bold">近7天用户注册趋势</span></template><div ref="registerChartRef" style="height: 300px"></div></el-card>
      </el-col>
      <el-col :span="12">
        <el-card shadow="hover"><template #header><span style="font-weight: bold">近7天健康数据录入趋势</span></template><div ref="recordChartRef" style="height: 300px"></div></el-card>
      </el-col>
    </el-row>

    <el-card shadow="hover">
      <template #header><span style="font-weight: bold">最近注册用户</span></template>
      <el-table :data="recentUsers" border stripe size="small">
        <el-table-column prop="username" label="用户名" width="120" />
        <el-table-column prop="nickname" label="昵称" width="120" />
        <el-table-column prop="role" label="角色" width="100"><template #default="{ row }"><el-tag :type="row.role === 'admin' ? 'primary' : 'success'" size="small">{{ row.role === 'admin' ? '管理员' : '用户' }}</el-tag></template></el-table-column>
        <el-table-column prop="createTime" label="注册时间" />
      </el-table>
    </el-card>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted, nextTick } from 'vue'
import * as echarts from 'echarts'
import { getAdminStats } from '@/api/dashboard'

const statCards = reactive([
  { label: '用户总数', value: 0, icon: 'User', color: '#ff6b9d' },
  { label: '健康记录数', value: 0, icon: 'Document', color: '#98d4bb' },
  { label: '健康知识数', value: 0, icon: 'Reading', color: '#b06ab3' },
  { label: '公告数', value: 0, icon: 'Bell', color: '#ffd966' }
])
const recentUsers = ref([])
const registerChartRef = ref()
const recordChartRef = ref()

onMounted(async () => {
  try {
    const res = await getAdminStats()
    const d = res.data
    statCards[0].value = d.userCount || 0
    statCards[1].value = d.recordCount || 0
    statCards[2].value = d.knowledgeCount || 0
    statCards[3].value = d.noticeCount || 0
    recentUsers.value = d.recentUsers || []

    nextTick(() => {
      const regChart = echarts.init(registerChartRef.value)
      regChart.setOption({
        tooltip: { trigger: 'axis' },
        xAxis: { type: 'category', data: d.trendDates || [] },
        yAxis: { type: 'value', minInterval: 1 },
        series: [{ data: d.registerTrend || [], type: 'line', smooth: true, areaStyle: { opacity: 0.3, color: 'rgba(255,107,157,0.2)' }, itemStyle: { color: '#ff6b9d' }, lineStyle: { color: '#ff6b9d' } }]
      })

      const recChart = echarts.init(recordChartRef.value)
      recChart.setOption({
        tooltip: { trigger: 'axis' },
        xAxis: { type: 'category', data: d.trendDates || [] },
        yAxis: { type: 'value', minInterval: 1 },
        series: [{ data: d.recordTrend || [], type: 'bar', itemStyle: { color: '#c084fc', borderRadius: [6, 6, 0, 0] } }]
      })
    })
  } catch (e) { /* handled */ }
})
</script>
