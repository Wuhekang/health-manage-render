import request from '@/utils/request'

export function getHealthRecordList(params) {
  return request.get('/health-record/list', { params })
}

export function getHealthRecordAll(params) {
  return request.get('/health-record/all', { params })
}

export function addHealthRecord(data) {
  return request.post('/health-record', data)
}

export function updateHealthRecord(data) {
  return request.put('/health-record', data)
}

export function deleteHealthRecord(id) {
  return request.delete(`/health-record/${id}`)
}

export function getLatestRecord() {
  return request.get('/health-record/latest')
}

export function getHealthTrend(days) {
  return request.get('/health-record/trend', { params: { days } })
}
