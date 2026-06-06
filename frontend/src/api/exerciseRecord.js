import request from '@/utils/request'

export function getExerciseRecordList(params) {
  return request.get('/exercise-record/list', { params })
}

export function addExerciseRecord(data) {
  return request.post('/exercise-record', data)
}

export function updateExerciseRecord(data) {
  return request.put('/exercise-record', data)
}

export function deleteExerciseRecord(id) {
  return request.delete(`/exercise-record/${id}`)
}

export function getExerciseStats() {
  return request.get('/exercise-record/stats')
}
