<template>
  <div>
    <el-card shadow="hover" style="margin-bottom: 16px">
      <el-radio-group v-model="days" @change="loadData">
        <el-radio-button :label="30">近30天</el-radio-button>
        <el-radio-button :label="90">近90天</el-radio-button>
        <el-radio-button :label="180">近180天</el-radio-button>
      </el-radio-group>
    </el-card>

    <el-tabs v-model="activeTab" type="border-card">
      <el-tab-pane label="体重BMI" name="weight">
        <div ref="weightChartRef" style="height: 400px"></div>
      </el-tab-pane>
      <el-tab-pane label="血压" name="bp">
        <div ref="bpChartRef" style="height: 400px"></div>
      </el-tab-pane>
      <el-tab-pane label="心率" name="hr">
        <div ref="hrChartRef" style="height: 400px"></div>
      </el-tab-pane>
      <el-tab-pane label="睡眠" name="sleep">
        <div ref="sleepChartRef" style="height: 400px"></div>
      </el-tab-pane>
      <el-tab-pane label="综合" name="radar">
        <div ref="radarChartRef" style="height: 400px"></div>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script setup>
import { ref, watch, onMounted, nextTick } from 'vue'
import * as echarts from 'echarts'
import { getHealthTrend } from '@/api/healthRecord'

const days = ref(30)
const activeTab = ref('weight')
const records = ref([])
const weightChartRef = ref()
const bpChartRef = ref()
const hrChartRef = ref()
const sleepChartRef = ref()
const radarChartRef = ref()

let charts = {}

const loadData = async () => {
  const res = await getHealthTrend(days.value)
  records.value = Array.isArray(res.data) ? res.data : []
  nextTick(() => renderChart())
}

const renderChart = () => {
  const dates = records.value.map(r => r.recordDate)
  if (activeTab.value === 'weight' && weightChartRef.value) {
    if (charts.weight) charts.weight.dispose()
    charts.weight = echarts.init(weightChartRef.value)
    charts.weight.setOption({
      tooltip: { trigger: 'axis' }, legend: { data: ['体重(kg)', 'BMI'] },
      xAxis: { type: 'category', data: dates },
      yAxis: [{ type: 'value', name: '体重(kg)' }, { type: 'value', name: 'BMI' }],
      series: [
        { name: '体重(kg)', type: 'line', smooth: true, data: records.value.map(r => r.weight), itemStyle: { color: '#409eff' } },
        { name: 'BMI', type: 'line', smooth: true, yAxisIndex: 1, data: records.value.map(r => r.bmi), itemStyle: { color: '#e6a23c' } }
      ]
    })
  }
  if (activeTab.value === 'bp' && bpChartRef.value) {
    if (charts.bp) charts.bp.dispose()
    charts.bp = echarts.init(bpChartRef.value)
    charts.bp.setOption({
      tooltip: { trigger: 'axis' }, legend: { data: ['收缩压', '舒张压'] },
      xAxis: { type: 'category', data: dates }, yAxis: { type: 'value', name: 'mmHg' },
      series: [
        { name: '收缩压', type: 'line', smooth: true, data: records.value.map(r => r.systolicPressure), itemStyle: { color: '#f56c6c' }, markLine: { data: [{ yAxis: 140, name: '高血压线' }] } },
        { name: '舒张压', type: 'line', smooth: true, data: records.value.map(r => r.diastolicPressure), itemStyle: { color: '#409eff' }, markLine: { data: [{ yAxis: 90, name: '高血压线' }] } }
      ]
    })
  }
  if (activeTab.value === 'hr' && hrChartRef.value) {
    if (charts.hr) charts.hr.dispose()
    charts.hr = echarts.init(hrChartRef.value)
    charts.hr.setOption({
      tooltip: { trigger: 'axis' },
      xAxis: { type: 'category', data: dates }, yAxis: { type: 'value', name: '次/分' },
      series: [{ name: '心率', type: 'line', smooth: true, data: records.value.map(r => r.heartRate), itemStyle: { color: '#f56c6c' }, areaStyle: { opacity: 0.2 },
        markLine: { data: [{ yAxis: 60, name: '正常下限' }, { yAxis: 100, name: '正常上限' }] } }]
    })
  }
  if (activeTab.value === 'sleep' && sleepChartRef.value) {
    if (charts.sleep) charts.sleep.dispose()
    charts.sleep = echarts.init(sleepChartRef.value)
    charts.sleep.setOption({
      tooltip: { trigger: 'axis' },
      xAxis: { type: 'category', data: dates }, yAxis: { type: 'value', name: '小时' },
      series: [{ name: '睡眠时长', type: 'bar', data: records.value.map(r => ({ value: r.sleepHours, itemStyle: { color: r.sleepHours < 6 ? '#e6a23c' : r.sleepHours <= 8 ? '#67c23a' : '#409eff' } })) }]
    })
  }
  if (activeTab.value === 'radar' && radarChartRef.value) {
    if (charts.radar) charts.radar.dispose()
    charts.radar = echarts.init(radarChartRef.value)
    const latest = records.value.length > 0 ? records.value[records.value.length - 1] : null
    const radarData = latest ? [
      calcScore('bmi', latest.bmi), calcScore('bp', latest.systolicPressure),
      calcScore('hr', latest.heartRate), calcScore('sugar', latest.bloodSugar),
      calcScore('sleep', latest.sleepHours), 70
    ] : [0, 0, 0, 0, 0, 0]
    charts.radar.setOption({
      radar: { indicator: [{ name: 'BMI', max: 100 }, { name: '血压', max: 100 }, { name: '心率', max: 100 }, { name: '血糖', max: 100 }, { name: '睡眠', max: 100 }, { name: '运动', max: 100 }] },
      series: [{ type: 'radar', data: [{ value: radarData, name: '健康指标', areaStyle: { opacity: 0.3 } }] }]
    })
  }
}

const calcScore = (type, val) => {
  if (!val) return 50
  if (type === 'bmi') return val >= 18.5 && val < 24 ? 90 : val >= 24 && val < 28 ? 60 : 40
  if (type === 'bp') return val >= 90 && val <= 120 ? 90 : val <= 140 ? 70 : 40
  if (type === 'hr') return val >= 60 && val <= 100 ? 90 : 50
  if (type === 'sugar') return val >= 3.9 && val <= 6.1 ? 90 : 50
  if (type === 'sleep') return val >= 7 && val <= 8.5 ? 90 : val >= 6 ? 70 : 40
  return 50
}

watch(activeTab, () => nextTick(() => renderChart()))
onMounted(() => loadData())
</script>
