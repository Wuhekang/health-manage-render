import request from '@/utils/request'

export function getHealthGoalList() {
  return request.get('/health-goal/list')
}

export function addHealthGoal(data) {
  return request.post('/health-goal', data)
}

export function updateHealthGoal(data) {
  return request.put('/health-goal', data)
}

export function deleteHealthGoal(id) {
  return request.delete(`/health-goal/${id}`)
}

export function completeHealthGoal(id) {
  return request.put(`/health-goal/complete/${id}`)
}

export function abandonHealthGoal(id) {
  return request.put(`/health-goal/abandon/${id}`)
}
