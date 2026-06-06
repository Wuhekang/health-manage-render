<template>
  <el-card shadow="hover" style="height: calc(100vh - 180px); display: flex; flex-direction: column">
    <template #header>
      <div style="display: flex; justify-content: space-between; align-items: center">
        <span style="font-weight: bold; font-size: 16px; color: var(--maid-pink)">🎀 AI女仆管家 · 小健</span>
        <el-button size="small" round @click="handleClear">清空对话</el-button>
      </div>
    </template>

    <div ref="chatArea" style="flex: 1; overflow-y: auto; padding: 10px 0">
      <div v-if="messages.length === 0" style="text-align: center; color: var(--maid-text-light); padding: 60px 0">
        <div style="font-size: 56px; margin-bottom: 12px">🎀</div>
        <p style="font-size: 15px">主人好呀~ 我是AI女仆管家小健 ♪<br/>有什么健康问题都可以问我哦！(◕ᴗ◕✿)</p>
      </div>
      <div v-for="(msg, idx) in messages" :key="idx" :style="{ display: 'flex', justifyContent: msg.role === 'user' ? 'flex-end' : 'flex-start', marginBottom: '16px' }">
        <div :style="{ maxWidth: '70%', padding: '12px 16px', borderRadius: msg.role === 'user' ? '18px 18px 4px 18px' : '18px 18px 18px 4px', lineHeight: '1.6', fontSize: '14px', background: msg.role === 'user' ? 'linear-gradient(135deg, #ff6b9d, #c084fc)' : '#fff', color: msg.role === 'user' ? '#fff' : 'var(--maid-text)', whiteSpace: 'pre-wrap', boxShadow: '0 2px 8px rgba(255,107,157,0.1)', border: msg.role === 'user' ? 'none' : '1px solid var(--maid-border)' }">
          {{ msg.content }}
        </div>
      </div>
      <div v-if="loading" style="display: flex; margin-bottom: 16px">
        <div style="padding: 12px 16px; border-radius: 18px 18px 18px 4px; background: #fff; color: var(--maid-pink); border: 1px solid var(--maid-border)">女仆思考中... (◕ᴗ◕✿)</div>
      </div>
    </div>

    <div style="border-top: 1px solid #ebeef5; padding-top: 12px; display: flex; gap: 10px">
      <el-input v-model="inputMessage" type="textarea" :rows="2" placeholder="输入您的健康问题（Shift+Enter换行）" @keydown.enter.exact.prevent="handleSend" resize="none" />
      <el-button type="primary" :loading="loading" @click="handleSend" style="height: 54px">发送</el-button>
    </div>
  </el-card>
</template>

<script setup>
import { ref, onMounted, nextTick } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { sendMessage, getChatHistory, clearChat } from '@/api/aiChat'

const messages = ref([])
const inputMessage = ref('')
const loading = ref(false)
const chatArea = ref()

const scrollToBottom = () => { nextTick(() => { if (chatArea.value) chatArea.value.scrollTop = chatArea.value.scrollHeight }) }

const loadHistory = async () => {
  try {
    const res = await getChatHistory({ pageNum: 1, pageSize: 100 })
    const records = res.data?.records || []
    messages.value = []
    records.forEach(r => {
      messages.value.push({ role: 'user', content: r.userMessage })
      messages.value.push({ role: 'ai', content: r.aiResponse })
    })
    scrollToBottom()
  } catch (e) { /* ignore */ }
}

const handleSend = async () => {
  const msg = inputMessage.value.trim()
  if (!msg || loading.value) return
  messages.value.push({ role: 'user', content: msg })
  inputMessage.value = ''
  loading.value = true
  scrollToBottom()
  try {
    const res = await sendMessage(msg)
    messages.value.push({ role: 'ai', content: res.data.reply })
  } catch (e) {
    messages.value.push({ role: 'ai', content: '抱歉，AI服务暂时不可用，请稍后再试。' })
  } finally {
    loading.value = false
    scrollToBottom()
  }
}

const handleClear = async () => {
  await ElMessageBox.confirm('确定清空所有对话记录？', '提示', { type: 'warning' })
  await clearChat()
  messages.value = []
  ElMessage.success('已清空')
}

onMounted(() => loadHistory())
</script>
