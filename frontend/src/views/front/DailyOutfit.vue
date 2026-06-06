<template>
  <div>
    <div class="outfit-hero">
      <div class="hero-left">
        <h2>👗 今日穿搭推荐</h2>
        <p>让小女仆根据天气和场合，为主人搭配最合适的衣服~ ♪</p>
      </div>
      <div style="font-size: 48px">🎀</div>
    </div>

    <el-row :gutter="20">
      <el-col :span="8">
        <el-card shadow="hover" class="condition-card">
          <template #header><span style="font-weight: bold; color: var(--maid-text)">🌤️ 穿搭条件</span></template>
          <el-form label-width="80px" :model="form">
            <el-form-item label="今日天气">
              <el-select v-model="form.weather" style="width: 100%">
                <el-option v-for="w in weathers" :key="w.value" :label="w.label" :value="w.value" />
              </el-select>
            </el-form-item>
            <el-form-item label="气温(℃)">
              <el-slider v-model="tempNum" :min="-10" :max="42" :marks="tempMarks" show-input input-size="small" />
            </el-form-item>
            <el-form-item label="今日场合">
              <el-select v-model="form.occasion" style="width: 100%">
                <el-option v-for="o in occasions" :key="o" :label="o" :value="o" />
              </el-select>
            </el-form-item>
            <el-form-item label="穿搭风格">
              <el-select v-model="form.style" style="width: 100%">
                <el-option v-for="s in styles" :key="s.value" :label="s.label" :value="s.value" />
              </el-select>
            </el-form-item>
            <el-form-item label="腿部搭配">
              <el-select v-model="form.legwear" style="width: 100%">
                <el-option v-for="l in legwears" :key="l.value" :label="l.label" :value="l.value" />
              </el-select>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" round style="width: 100%" :loading="loading" @click="handleSuggest">
                {{ loading ? '女仆搭配中...' : '♡ 让女仆搭配 ♡' }}
              </el-button>
            </el-form-item>
          </el-form>
        </el-card>
      </el-col>

      <el-col :span="16">
        <div v-if="!result && !loading" class="empty-state">
          <div style="font-size: 64px; margin-bottom: 16px">👗</div>
          <p style="color: var(--maid-text-light); font-size: 15px">选好条件后，点击按钮让女仆为主人搭配穿搭吧~ (◕ᴗ◕✿)</p>
        </div>

        <div v-if="loading" class="loading-state">
          <div class="loading-maid">🎀</div>
          <p style="color: var(--maid-pink); font-size: 15px; margin-top: 12px">女仆正在翻衣柜为主人搭配中... ♪</p>
        </div>

        <div v-if="result" class="result-area">
          <el-row :gutter="12" style="margin-bottom: 16px">
            <el-col :span="12" v-for="(item, idx) in outfitItems" :key="idx">
              <div class="outfit-item" :style="{ borderLeftColor: item.color }">
                <div class="outfit-item-icon">{{ item.emoji }}</div>
                <div>
                  <div class="outfit-item-label">{{ item.label }}</div>
                  <div class="outfit-item-value">{{ item.value }}</div>
                </div>
              </div>
            </el-col>
          </el-row>

          <el-row :gutter="12">
            <el-col :span="12">
              <div class="tip-card" style="background: linear-gradient(135deg, #fff5f7, #fce4ec)">
                <div style="font-weight: 600; color: var(--maid-pink); margin-bottom: 6px">💡 穿搭小贴士</div>
                <div style="font-size: 13px; color: var(--maid-text); line-height: 1.6">{{ parsed.tip || '暂无' }}</div>
              </div>
            </el-col>
            <el-col :span="12">
              <div class="tip-card" style="background: linear-gradient(135deg, #f0f8ff, #e8f4f8)">
                <div style="font-weight: 600; color: #3a8a80; margin-bottom: 6px">🏥 健康穿着提醒</div>
                <div style="font-size: 13px; color: var(--maid-text); line-height: 1.6">{{ parsed.healthTip || '暂无' }}</div>
              </div>
            </el-col>
          </el-row>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script setup>
import { ref, reactive, computed } from 'vue'
import { ElMessage } from 'element-plus'
import { getOutfitSuggestion } from '@/api/outfit'

const loading = ref(false)
const result = ref(null)
const parsed = ref({})

const form = reactive({
  weather: '晴天',
  temperature: '25',
  occasion: '日常上课',
  style: 'JK制服裙',
  legwear: '白丝'
})

const tempNum = computed({
  get: () => parseInt(form.temperature) || 25,
  set: (v) => { form.temperature = String(v) }
})

const tempMarks = { 0: '0℃', 15: '15℃', 30: '30℃' }

const weathers = [
  { label: '☀️ 晴天', value: '晴天' },
  { label: '⛅ 多云', value: '多云' },
  { label: '🌧️ 下雨', value: '下雨' },
  { label: '❄️ 下雪', value: '下雪' },
  { label: '🌬️ 大风', value: '大风' },
  { label: '🌫️ 雾霾', value: '雾霾' }
]

const occasions = ['日常上课', '约会', '运动健身', '面试/正式场合', '逛街购物', '图书馆自习', '社团活动', '宿舍休闲', '户外公园', '野外露营', '夜间散步', '海边度假']

const styles = [
  { label: '🎀 JK制服裙', value: 'JK制服裙' },
  { label: '👸 洛丽塔', value: '洛丽塔' },
  { label: '🏯 汉服', value: '汉服' },
  { label: '⚔️ 战国袍', value: '战国袍' },
  { label: '💼 OL制服', value: 'OL制服' },
  { label: '🎀 女仆装', value: '女仆装' },
  { label: '🌸 清新甜美', value: '清新甜美' },
  { label: '🖤 暗黑哥特', value: '暗黑哥特' },
  { label: '✨ 日系简约', value: '日系简约' }
 // , { label: '🔒 私密穿搭', value: '私密穿搭' }, { label: '⛓️ 重度SM', value: '重度SM' }, { label: '🧸 轻度调教', value: '轻度调教' }, { label: '👠 女仆调教', value: '女仆调教' }, { label: '📏 教师调教', value: '教师调教' }
]

const legwears = [
  { label: '🤍 白丝', value: '白丝' },
  { label: '🖤 黑丝', value: '黑丝' },
  { label: '🩰 肉丝', value: '肉丝' },
  { label: '🧦 过膝袜', value: '过膝袜' },
  { label: '🩲 光腿', value: '光腿' },
  { label: '👖 打底裤', value: '打底裤' }
]

const outfitItems = computed(() => {
  const p = parsed.value
  return [
    { emoji: '👚', label: '上装', value: p.top || '--', color: '#ff6b9d' },
    { emoji: '👗', label: '下装/裙子', value: p.bottom || '--', color: '#c084fc' },
    { emoji: '🩰', label: '腿部搭配', value: p.legwear || '--', color: '#ffb6c1' },
    { emoji: '👠', label: '鞋子', value: p.shoes || '--', color: '#7ec8e3' },
    { emoji: '💎', label: '配饰', value: p.accessory || '--', color: '#ffd966' },
    { emoji: '🎨', label: '配色方案', value: p.color || '--', color: '#98d4bb' },
  ]
})

const handleSuggest = async () => {
  loading.value = true
  result.value = null
  try {
    const res = await getOutfitSuggestion(form)
    const raw = res.data.suggestion
    result.value = raw
    try {
      let jsonStr = raw
      if (jsonStr.includes('```json')) {
        jsonStr = jsonStr.substring(jsonStr.indexOf('```json') + 7)
        jsonStr = jsonStr.substring(0, jsonStr.indexOf('```'))
      } else if (jsonStr.includes('```')) {
        jsonStr = jsonStr.substring(jsonStr.indexOf('```') + 3)
        jsonStr = jsonStr.substring(0, jsonStr.indexOf('```'))
      }
      parsed.value = JSON.parse(jsonStr.trim())
    } catch (e) {
      parsed.value = { top: raw, bottom: '', shoes: '', accessory: '', color: '', tip: '', healthTip: '' }
    }
    ElMessage.success('穿搭方案已生成~ ♪')
  } catch (e) {
    ElMessage.error('AI 服务暂时不可用，请稍后再试')
  } finally { loading.value = false }
}
</script>

<style scoped>
.outfit-hero {
  background: linear-gradient(135deg, #ff6b9d, #c084fc);
  border-radius: 20px;
  padding: 28px 36px;
  color: #fff;
  margin-bottom: 20px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  box-shadow: 0 8px 30px rgba(255,107,157,0.25);
}
.outfit-hero h2 { margin: 0 0 6px; font-size: 22px; }
.outfit-hero p { margin: 0; opacity: 0.9; font-size: 14px; }

.condition-card :deep(.el-card__body) { padding: 16px 20px; }

.empty-state, .loading-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 400px;
  background: rgba(255,255,255,0.6);
  border-radius: 20px;
  border: 2px dashed var(--maid-border);
}
.loading-maid {
  font-size: 56px;
  animation: spin 2s ease-in-out infinite;
}
@keyframes spin {
  0%, 100% { transform: rotate(-15deg) scale(1); }
  50% { transform: rotate(15deg) scale(1.1); }
}

.result-area { animation: fadeIn 0.5s ease; }
@keyframes fadeIn { from { opacity: 0; transform: translateY(12px); } to { opacity: 1; transform: translateY(0); } }

.outfit-item {
  display: flex;
  align-items: center;
  gap: 12px;
  background: #fff;
  border-radius: 14px;
  padding: 16px;
  margin-bottom: 12px;
  border-left: 4px solid;
  box-shadow: 0 2px 12px rgba(255,107,157,0.06);
  transition: transform 0.2s;
}
.outfit-item:hover { transform: translateX(4px); }
.outfit-item-icon { font-size: 28px; }
.outfit-item-label { font-size: 12px; color: var(--maid-text-light); margin-bottom: 2px; }
.outfit-item-value { font-size: 14px; color: var(--maid-text); font-weight: 500; }

.tip-card {
  border-radius: 14px;
  padding: 16px;
  min-height: 100px;
}
</style>
