import request from '@/utils/request'

export function evaluateHealth() {
  return request.post('/health-assessment/evaluate', {}, { timeout: 60000 })
}

export function getAssessmentList(params) {
  return request.get('/health-assessment/list', { params })
}

export function getAssessmentDetail(id) {
  return request.get(`/health-assessment/${id}`)
}
