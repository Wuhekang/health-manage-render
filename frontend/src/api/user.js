import request from '@/utils/request'

export function login(data) {
  return request.post('/login', data)
}

export function register(data) {
  return request.post('/register', data)
}

export function getUserList(params) {
  return request.get('/user/list', { params })
}

export function addUser(data) {
  return request.post('/user', data)
}

export function updateUser(data) {
  return request.put('/user', data)
}

export function deleteUser(id) {
  return request.delete(`/user/${id}`)
}

export function getUserInfo() {
  return request.get('/user/info')
}

export function updateProfile(data) {
  return request.put('/user/profile', data)
}

export function updatePassword(data) {
  return request.put('/user/password', data)
}
