<template>
  <div>
    <el-card shadow="hover" style="margin-bottom: 20px">
      <template #header>
        <div style="display: flex; justify-content: space-between; align-items: center">
          <span style="font-weight: bold; font-size: 16px; color: var(--maid-text)">🤖 AI 模型配置</span>
          <div>
            <el-button type="primary" round :loading="saveLoading" @click="handleSave">♡ 保存配置</el-button>
            <el-button round @click="handleTest" :loading="testLoading">测试连接</el-button>
          </div>
        </div>
      </template>

      <el-alert type="info" :closable="false" style="margin-bottom: 20px">
        <template #title>
          当前接入：<b>豆包大模型（字节跳动 Ark 平台）</b>，兼容 OpenAI 协议。修改配置后需重启后端生效（API Key / Base URL / Model），温度和Token数实时生效。
        </template>
      </el-alert>

      <el-form label-width="140px" style="max-width: 700px">
        <el-form-item label="AI 功能开关">
          <el-switch v-model="configMap.ai_enabled" active-value="true" inactive-value="false" active-text="开启" inactive-text="关闭" />
        </el-form-item>
        <el-divider content-position="left">接入配置</el-divider>
        <el-form-item label="API 密钥">
          <el-input v-model="configMap.ai_api_key" show-password placeholder="请输入豆包 API Key" />
          <div class="form-tip">在火山引擎 Ark 平台创建，格式如 ark-xxxxxxxxxxxx</div>
        </el-form-item>
        <el-form-item label="API 基础地址">
          <el-input v-model="configMap.ai_base_url" placeholder="https://ark.cn-beijing.volces.com/api/v3" />
          <div class="form-tip">豆包 API 地址，一般无需修改</div>
        </el-form-item>
        <el-form-item label="模型名称">
          <el-input v-model="configMap.ai_model" placeholder="doubao-1-5-pro-256k-250115" />
          <div class="form-tip">Ark 平台的模型接入点 ID 或模型名称</div>
        </el-form-item>
        <el-divider content-position="left">生成参数</el-divider>
        <el-form-item label="最大 Token 数">
          <el-slider v-model="maxTokensNum" :min="256" :max="8192" :step="256" show-input input-size="small" style="padding-right: 20px" />
          <div class="form-tip">AI 单次回复的最大长度，越大回复越详细但更慢</div>
        </el-form-item>
        <el-form-item label="温度参数">
          <el-slider v-model="temperatureNum" :min="0" :max="100" :step="5" show-input input-size="small" style="padding-right: 20px" />
          <div class="form-tip">0 = 精确稳定，100 = 随机创意。健康评估建议 30-50，对话建议 60-80</div>
        </el-form-item>
      </el-form>
    </el-card>

    <el-card shadow="hover">
      <template #header><span style="font-weight: bold; color: var(--maid-text)">📋 所有配置项</span></template>
      <el-table :data="configList" border stripe size="small">
        <el-table-column prop="configKey" label="配置键" width="180" />
        <el-table-column prop="configValue" label="配置值" min-width="300">
          <template #default="{ row }">
            <span v-if="row.configKey === 'ai_api_key'">{{ maskValue(row.configValue) }}</span>
            <span v-else>{{ row.configValue }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="configDesc" label="描述" width="160" />
        <el-table-column prop="updateTime" label="更新时间" width="170" />
      </el-table>
    </el-card>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { getConfigList, batchUpdateConfig } from '@/api/sysConfig'

const configList = ref([])
const configMap = ref({})
const saveLoading = ref(false)
const testLoading = ref(false)

const maxTokensNum = computed({
  get: () => parseInt(configMap.value.ai_max_tokens) || 2048,
  set: (v) => { configMap.value.ai_max_tokens = String(v) }
})
const temperatureNum = computed({
  get: () => Math.round(parseFloat(configMap.value.ai_temperature || '0.7') * 100),
  set: (v) => { configMap.value.ai_temperature = (v / 100).toFixed(2) }
})

const maskValue = (val) => {
  if (!val || val.length < 8) return '****'
  return val.substring(0, 4) + '****' + val.substring(val.length - 4)
}

const loadData = async () => {
  const res = await getConfigList()
  configList.value = Array.isArray(res.data) ? res.data : []
  const map = {}
  configList.value.forEach(c => { map[c.configKey] = c.configValue })
  configMap.value = map
}

const handleSave = async () => {
  saveLoading.value = true
  try {
    const updates = configList.value.map(c => ({
      id: c.id,
      configKey: c.configKey,
      configValue: configMap.value[c.configKey] || c.configValue
    }))
    await batchUpdateConfig(updates)
    ElMessage.success('配置保存成功~ ♪')
    loadData()
  } finally { saveLoading.value = false }
}

const handleTest = async () => {
  testLoading.value = true
  try {
    const resp = await fetch(`${import.meta.env.VITE_API_BASE_URL ?? '/api'}/ai-chat/send`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', 'Authorization': 'Bearer ' + localStorage.getItem('token') },
      body: JSON.stringify({ message: '你好，请简单回复一句话测试连接' })
    })
    const data = await resp.json()
    if (data.code === 200) {
      ElMessage.success('AI 连接成功！回复：' + (data.data.reply || '').substring(0, 50))
    } else {
      ElMessage.error('连接失败：' + data.msg)
    }
  } catch (e) {
    ElMessage.error('连接失败：' + e.message)
  } finally { testLoading.value = false }
}

onMounted(() => loadData())
</script>

<style scoped>
.form-tip {
  font-size: 12px;
  color: var(--maid-text-light);
  margin-top: 4px;
}
</style>
