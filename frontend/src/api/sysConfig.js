import request from '@/utils/request'

export function getConfigList() {
  return request.get('/sys-config/list')
}

export function getAiConfig() {
  return request.get('/sys-config/ai')
}

export function updateConfig(data) {
  return request.put('/sys-config', data)
}

export function batchUpdateConfig(data) {
  return request.put('/sys-config/batch', data)
}
