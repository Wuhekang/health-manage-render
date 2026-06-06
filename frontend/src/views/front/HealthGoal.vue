<template>
  <div>
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px">
      <h3 style="margin: 0; color: #303133">我的健康目标</h3>
      <el-button type="success" @click="openDialog()">设定目标</el-button>
    </div>

    <el-row :gutter="16">
      <el-col :span="8" v-for="goal in goals" :key="goal.id" style="margin-bottom: 16px">
        <el-card shadow="hover">
          <template #header>
            <div style="display: flex; justify-content: space-between; align-items: center">
              <el-tag :type="goalTypeColor[goal.goalType] || 'primary'">{{ goal.goalType }}</el-tag>
              <el-tag :type="statusTagType[goal.status]" size="small">{{ statusLabels[goal.status] }}</el-tag>
            </div>
          </template>
          <div style="margin-bottom: 12px">
            <div style="display: flex; justify-content: space-between; font-size: 13px; color: #909399; margin-bottom: 4px">
              <span>目标：{{ goal.targetValue }}</span>
              <span>当前：{{ goal.currentValue || '未记录' }}</span>
            </div>
            <el-progress :percentage="calcProgress(goal)" :status="goal.status === 1 ? 'success' : ''" :stroke-width="10" />
          </div>
          <div style="font-size: 12px; color: #c0c4cc; margin-bottom: 12px">
            {{ goal.startDate }} ~ {{ goal.endDate }}
          </div>
          <div v-if="goal.status === 0" style="display: flex; gap: 8px">
            <el-button size="small" @click="openDialog(goal)">编辑</el-button>
            <el-button size="small" type="success" @click="handleComplete(goal.id)">完成</el-button>
            <el-button size="small" type="info" @click="handleAbandon(goal.id)">放弃</el-button>
            <el-popconfirm title="确定删除？" @confirm="handleDelete(goal.id)">
              <template #reference><el-button size="small" type="danger">删除</el-button></template>
            </el-popconfirm>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-empty v-if="goals.length === 0" description="还没有设定健康目标" />

    <el-dialog v-model="dialogVisible" :title="isEdit ? '编辑目标' : '设定目标'" width="500px">
      <el-form ref="formRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="目标类型" prop="goalType">
          <el-select v-model="form.goalType" style="width: 100%">
            <el-option v-for="t in ['减重','增肌','降压','控糖','改善睡眠','增加运动']" :key="t" :label="t" :value="t" />
          </el-select>
        </el-form-item>
        <el-form-item label="目标值" prop="targetValue"><el-input v-model="form.targetValue" placeholder="如: 65kg / 每周4次运动" /></el-form-item>
        <el-form-item label="当前值"><el-input v-model="form.currentValue" placeholder="如: 70kg / 每周2次" /></el-form-item>
        <el-form-item label="开始日期" prop="startDate"><el-date-picker v-model="form.startDate" value-format="YYYY-MM-DD" style="width: 100%" /></el-form-item>
        <el-form-item label="截止日期" prop="endDate"><el-date-picker v-model="form.endDate" value-format="YYYY-MM-DD" style="width: 100%" /></el-form-item>
        <el-form-item label="备注"><el-input v-model="form.remark" type="textarea" :rows="2" /></el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" :loading="submitLoading" @click="handleSubmit">确定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { getHealthGoalList, addHealthGoal, updateHealthGoal, deleteHealthGoal, completeHealthGoal, abandonHealthGoal } from '@/api/healthGoal'

const goals = ref([])
const dialogVisible = ref(false)
const isEdit = ref(false)
const submitLoading = ref(false)
const formRef = ref()

const statusLabels = { 0: '进行中', 1: '已完成', 2: '已放弃' }
const statusTagType = { 0: 'primary', 1: 'success', 2: 'info' }
const goalTypeColor = { '减重': 'danger', '增肌': 'warning', '降压': 'primary', '控糖': 'success', '改善睡眠': '', '增加运动': 'warning' }

const defaultForm = { id: null, goalType: '', targetValue: '', currentValue: '', startDate: '', endDate: '', remark: '' }
const form = reactive({ ...defaultForm })
const rules = {
  goalType: [{ required: true, message: '请选择目标类型', trigger: 'change' }],
  targetValue: [{ required: true, message: '请输入目标值', trigger: 'blur' }],
  startDate: [{ required: true, message: '请选择开始日期', trigger: 'change' }],
  endDate: [{ required: true, message: '请选择截止日期', trigger: 'change' }]
}

const calcProgress = (goal) => {
  if (goal.status === 1) return 100
  if (goal.status === 2) return 0
  const start = new Date(goal.startDate).getTime()
  const end = new Date(goal.endDate).getTime()
  const now = Date.now()
  if (now >= end) return 95
  return Math.min(Math.round(((now - start) / (end - start)) * 100), 95)
}

const loadData = async () => { const res = await getHealthGoalList(); goals.value = Array.isArray(res.data) ? res.data : [] }

const openDialog = (row) => { isEdit.value = !!row; Object.assign(form, row ? { ...row } : { ...defaultForm }); dialogVisible.value = true }

const handleSubmit = () => {
  formRef.value.validate(async (valid) => {
    if (!valid) return; submitLoading.value = true
    try { if (isEdit.value) { await updateHealthGoal(form); ElMessage.success('修改成功') } else { await addHealthGoal(form); ElMessage.success('设定成功') }; dialogVisible.value = false; loadData() } finally { submitLoading.value = false }
  })
}

const handleDelete = async (id) => { await deleteHealthGoal(id); ElMessage.success('删除成功'); loadData() }
const handleComplete = async (id) => { await completeHealthGoal(id); ElMessage.success('已完成'); loadData() }
const handleAbandon = async (id) => { await abandonHealthGoal(id); ElMessage.success('已放弃'); loadData() }

onMounted(() => loadData())
</script>
