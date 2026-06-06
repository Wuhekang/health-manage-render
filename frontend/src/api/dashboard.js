import request from '@/utils/request'

export function getAdminStats() {
  return request.get('/dashboard/admin-stats')
}

export function getUserStats() {
  return request.get('/dashboard/user-stats')
}
