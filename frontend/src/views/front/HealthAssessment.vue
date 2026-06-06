<template>
  <div>
    <el-card shadow="hover" style="margin-bottom: 20px">
      <div style="display: flex; align-items: center; justify-content: space-between">
        <div>
          <h3 style="margin: 0 0 8px; color: #303133">AI 健康评估</h3>
          <p style="color: #909399; margin: 0; font-size: 14px">基于您最近30天的健康数据，AI将为您生成个性化评估报告</p>
        </div>
        <el-button type="primary" size="large" :loading="evaluating" @click="handleEvaluate">
          {{ evaluating ? 'AI分析中...' : '开始评估' }}
        </el-button>
      </div>
    </el-card>

    <el-card v-if="currentAssessment" shadow="hover" style="margin-bottom: 20px">
      <template #header><span style="font-weight: bold; font-size: 16px">评估结果</span></template>
      <el-row :gutter="20">
        <el-col :span="8">
          <div style="text-align: center; padding: 20px">
            <div style="font-size: 48px; font-weight: bold" :style="{ color: scoreColor }">{{ currentAssessment.healthScore }}</div>
            <div style="color: #909399; margin-top: 4px">健康评分</div>
          </div>
        </el-col>
        <el-col :span="16">
          <el-descriptions :column="2" border size="small">
            <el-descriptions-item label="综合状态"><el-tag :type="statusTagType(currentAssessment.overallStatus)">{{ currentAssessment.overallStatus }}</el-tag></el-descriptions-item>
            <el-descriptions-item label="BMI状态"><el-tag>{{ currentAssessment.bmiStatus }}</el-tag></el-descriptions-item>
            <el-descriptions-item label="血压状态"><el-tag>{{ currentAssessment.bloodPressureStatus }}</el-tag></el-descriptions-item>
            <el-descriptions-item label="评估日期">{{ currentAssessment.assessmentDate }}</el-descriptions-item>
          </el-descriptions>
        </el-col>
      </el-row>
      <el-divider />
      <h4 style="color: #303133">AI 分析</h4>
      <p style="color: #606266; line-height: 1.8; white-space: pre-wrap">{{ currentAssessment.aiAnalysis }}</p>
      <el-divider />
      <h4 style="color: #303133">个性化建议</h4>
      <p style="color: #606266; line-height: 1.8; white-space: pre-wrap">{{ formatSuggestion(currentAssessment.aiSuggestion) }}</p>
    </el-card>

    <el-card shadow="hover">
      <template #header><span style="font-weight: bold">历史评估</span></template>
      <el-timeline>
        <el-timeline-item v-for="item in historyList" :key="item.id" :timestamp="item.assessmentDate" placement="top">
          <el-card shadow="never" style="cursor: pointer" @click="showDetail(item)">
            <div style="display: flex; align-items: center; gap: 16px">
              <span style="font-size: 24px; font-weight: bold; color: #409eff">{{ item.healthScore }}分</span>
              <el-tag :type="statusTagType(item.overallStatus)" size="small">{{ item.overallStatus }}</el-tag>
            </div>
          </el-card>
        </el-timeline-item>
      </el-timeline>
      <el-empty v-if="historyList.length === 0" description="暂无评估记录" />
    </el-card>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { evaluateHealth, getAssessmentList } from '@/api/healthAssessment'

const evaluating = ref(false)
const currentAssessment = ref(null)
const historyList = ref([])

const scoreColor = computed(() => {
  const s = currentAssessment.value?.healthScore || 0
  if (s >= 80) return '#67c23a'
  if (s >= 60) return '#e6a23c'
  return '#f56c6c'
})

const statusTagType = (status) => {
  const map = { '良好': 'success', '一般': 'warning', '需关注': 'danger', '需就医': 'danger' }
  return map[status] || 'info'
}

const formatSuggestion = (suggestion) => {
  if (!suggestion) return ''
  try {
    const arr = JSON.parse(suggestion)
    if (Array.isArray(arr)) return arr.map((s, i) => `${i + 1}. ${s}`).join('\n')
  } catch (e) { /* not JSON */ }
  return suggestion
}

const handleEvaluate = async () => {
  evaluating.value = true
  try {
    const res = await evaluateHealth()
    currentAssessment.value = res.data
    ElMessage.success('评估完成')
    loadHistory()
  } catch (e) { /* handled */ }
  finally { evaluating.value = false }
}

const loadHistory = async () => {
  const res = await getAssessmentList({ pageNum: 1, pageSize: 20 })
  historyList.value = res.data?.records || []
}

const showDetail = (item) => { currentAssessment.value = item }

onMounted(() => loadHistory())
</script>
