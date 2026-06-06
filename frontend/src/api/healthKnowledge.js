import request from '@/utils/request'

export function getKnowledgeList(params) {
  return request.get('/health-knowledge/list', { params })
}

export function browseKnowledge(params) {
  return request.get('/health-knowledge/browse', { params })
}

export function getKnowledgeDetail(id) {
  return request.get(`/health-knowledge/detail/${id}`)
}

export function addKnowledge(data) {
  return request.post('/health-knowledge', data)
}

export function updateKnowledge(data) {
  return request.put('/health-knowledge', data)
}

export function deleteKnowledge(id) {
  return request.delete(`/health-knowledge/${id}`)
}
