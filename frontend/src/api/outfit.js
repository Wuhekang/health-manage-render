import request from '@/utils/request'

export function getOutfitSuggestion(data) {
  return request.post('/outfit/suggest', data, { timeout: 60000 })
}
