import request from '@/utils/request'

export function getNoticeList(params) {
  return request.get('/notice/list', { params })
}

export function getLatestNotice() {
  return request.get('/notice/latest')
}

export function addNotice(data) {
  return request.post('/notice', data)
}

export function updateNotice(data) {
  return request.put('/notice', data)
}

export function deleteNotice(id) {
  return request.delete(`/notice/${id}`)
}
