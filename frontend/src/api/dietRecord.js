import request from '@/utils/request'

export function getDietRecordList(params) {
  return request.get('/diet-record/list', { params })
}

export function addDietRecord(data) {
  return request.post('/diet-record', data)
}

export function updateDietRecord(data) {
  return request.put('/diet-record', data)
}

export function deleteDietRecord(id) {
  return request.delete(`/diet-record/${id}`)
}
