import request from '@/utils/request'

export function sendMessage(message) {
  return request.post('/ai-chat/send', { message }, { timeout: 60000 })
}

export function getChatHistory(params) {
  return request.get('/ai-chat/history', { params })
}

export function clearChat() {
  return request.delete('/ai-chat/clear')
}
