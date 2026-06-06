<template>
  <div>
    <div class="hero-section">
      <div class="hero-content">
        <div class="hero-greeting">主人，欢迎回来~ ♪</div>
        <div class="hero-sub">{{ user.nickname || user.username }}，今天也要好好关注健康哦！女仆会一直守护主人的~ 💕</div>
      </div>
      <img src="/img/maid-character.png" class="hero-maid" />
    </div>

    <div class="section-title">✦ 快捷入口</div>
    <el-row :gutter="16" style="margin-bottom: 24px">
      <el-col :span="6" v-for="(card, idx) in quickEntries" :key="idx">
        <div class="quick-card" :style="{ background: card.bg }" @click="$router.push(card.path)">
          <div class="quick-emoji">{{ card.emoji }}</div>
          <div class="quick-label">{{ card.label }}</div>
          <div class="quick-desc">{{ card.desc }}</div>
        </div>
      </el-col>
    </el-row>

    <div class="section-title">✦ 今日概览</div>
    <el-row :gutter="16" style="margin-bottom: 24px">
      <el-col :span="8">
        <div class="stat-card">
          <div class="stat-icon" style="background: linear-gradient(135deg, #ff6b9d, #ff8eb3)">✨</div>
          <div class="stat-info">
            <div class="stat-label">最近BMI</div>
            <div class="stat-value" :style="{ color: bmiColor }">{{ latestBmi || '--' }}</div>
            <el-tag v-if="latestBmi" :type="bmiTagType" size="small" round>{{ bmiLabel }}</el-tag>
          </div>
        </div>
      </el-col>
      <el-col :span="8">
        <div class="stat-card">
          <div class="stat-icon" style="background: linear-gradient(135deg, #98d4bb, #7ec8e3)">🏃</div>
          <div class="stat-info">
            <div class="stat-label">本月运动</div>
            <div class="stat-value" style="color: #3a8a80">{{ exerciseCount }}</div>
            <span style="font-size: 13px; color: var(--maid-text-light)">次</span>
          </div>
        </div>
      </el-col>
      <el-col :span="8">
        <div class="stat-card">
          <div class="stat-icon" style="background: linear-gradient(135deg, #b06ab3, #c084fc)">💖</div>
          <div class="stat-info">
            <div class="stat-label">健康评估</div>
            <div class="stat-value" style="color: #b06ab3">{{ assessmentCount }}</div>
            <span style="font-size: 13px; color: var(--maid-text-light)">次</span>
          </div>
        </div>
      </el-col>
    </el-row>

    <div class="section-title">✦ 最新健康知识</div>
    <el-row :gutter="16">
      <el-col :span="8" v-for="item in latestKnowledge" :key="item.id">
        <div class="knowledge-card" @click="$router.push('/health-knowledge')">
          <div class="knowledge-top" :style="{ background: categoryBg[item.category] || categoryBg.default }">
            <span style="font-size: 28px">{{ categoryEmoji[item.category] || '📄' }}</span>
          </div>
          <div class="knowledge-body">
            <div class="knowledge-title">{{ item.title }}</div>
            <div class="knowledge-meta">
              <el-tag :type="categoryTag[item.category]" size="small" round>{{ item.category }}</el-tag>
              <span>{{ item.viewCount }} 次浏览</span>
            </div>
          </div>
        </div>
      </el-col>
    </el-row>
    <el-empty v-if="!latestKnowledge.length" description="暂无内容哦~" />
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { getUserStats } from '@/api/dashboard'

const user = JSON.parse(localStorage.getItem('user') || '{}')

const quickEntries = [
  { label: '记录健康数据', desc: '录入今日指标', emoji: '📝', bg: 'linear-gradient(135deg, #fff5f7, #fce4ec)', path: '/health-record' },
  { label: '查看趋势图表', desc: '可视化分析', emoji: '📊', bg: 'linear-gradient(135deg, #f0f4ff, #e8eaf6)', path: '/health-chart' },
  { label: 'AI健康评估', desc: 'AI智能分析', emoji: '🩺', bg: 'linear-gradient(135deg, #f5fff0, #e8f5e9)', path: '/health-assessment' },
  { label: 'AI助手对话', desc: '有问必答', emoji: '🤖', bg: 'linear-gradient(135deg, #fff8e1, #ffecd2)', path: '/ai-chat' }
]

const categoryTag = { '运动': 'primary', '饮食': 'danger', '睡眠': 'success', '心理': 'warning', '疾病预防': '' }
const categoryBg = { '运动': 'linear-gradient(135deg, #ff6b9d, #ff8eb3)', '饮食': 'linear-gradient(135deg, #c084fc, #b06ab3)', '睡眠': 'linear-gradient(135deg, #7ec8e3, #a8d8ea)', '心理': 'linear-gradient(135deg, #ffd966, #ffb74d)', '疾病预防': 'linear-gradient(135deg, #98d4bb, #80cbc4)', default: 'linear-gradient(135deg, #ff6b9d, #c084fc)' }
const categoryEmoji = { '运动': '🏃', '饮食': '🍎', '睡眠': '😴', '心理': '🧠', '疾病预防': '🛡️' }

const latestBmi = ref(null)
const exerciseCount = ref(0)
const assessmentCount = ref(0)
const latestKnowledge = ref([])

const bmiColor = computed(() => { const b = latestBmi.value; if (!b) return '#909399'; if (b < 18.5) return '#909399'; if (b < 24) return '#3a8a80'; if (b < 28) return '#e6a23c'; return '#f56c6c' })
const bmiTagType = computed(() => { const b = latestBmi.value; if (!b) return 'info'; if (b < 18.5) return 'info'; if (b < 24) return 'success'; if (b < 28) return 'warning'; return 'danger' })
const bmiLabel = computed(() => { const b = latestBmi.value; if (!b) return ''; if (b < 18.5) return '偏瘦'; if (b < 24) return '正常'; if (b < 28) return '偏胖'; return '肥胖' })

onMounted(async () => {
  try {
    const res = await getUserStats()
    const d = res.data
    if (d.latestRecord) latestBmi.value = d.latestRecord.bmi
    exerciseCount.value = d.exerciseCountThisMonth || 0
    assessmentCount.value = d.assessmentCount || 0
    latestKnowledge.value = d.latestKnowledge || []
  } catch (e) { /* handled */ }
})
</script>

<style scoped>
.hero-section {
  background: linear-gradient(135deg, #ff6b9d, #c084fc);
  border-radius: 20px;
  padding: 36px 40px;
  color: #fff;
  margin-bottom: 28px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  box-shadow: 0 10px 40px rgba(255, 107, 157, 0.3);
  position: relative;
  overflow: hidden;
}
.hero-section::before {
  content: '';
  position: absolute;
  top: -50px;
  right: -50px;
  width: 200px;
  height: 200px;
  background: rgba(255,255,255,0.08);
  border-radius: 50%;
}
.hero-section::after {
  content: '';
  position: absolute;
  bottom: -30px;
  left: 30%;
  width: 120px;
  height: 120px;
  background: rgba(255,255,255,0.06);
  border-radius: 50%;
}
.hero-content { position: relative; z-index: 1; }
.hero-greeting { font-size: 26px; font-weight: 700; margin-bottom: 8px; }
.hero-sub { font-size: 15px; opacity: 0.9; }
.hero-maid {
  width: 120px;
  height: 120px;
  object-fit: contain;
  filter: drop-shadow(0 6px 16px rgba(0,0,0,0.15));
  animation: heroFloat 3s ease-in-out infinite;
  position: relative;
  z-index: 1;
}
@keyframes heroFloat {
  0%, 100% { transform: translateY(0) rotate(-3deg); }
  50% { transform: translateY(-10px) rotate(3deg); }
}

.section-title {
  font-size: 16px;
  font-weight: 700;
  color: var(--maid-text);
  margin-bottom: 14px;
  padding-left: 4px;
}

.quick-card {
  border-radius: 16px;
  padding: 24px 20px;
  text-align: center;
  cursor: pointer;
  transition: all 0.3s ease;
  border: 1px solid var(--maid-border);
  box-shadow: 0 2px 12px rgba(255,107,157,0.06);
}
.quick-card:hover {
  transform: translateY(-6px);
  box-shadow: 0 12px 32px rgba(255,107,157,0.15);
}
.quick-emoji { font-size: 36px; margin-bottom: 10px; }
.quick-label { font-size: 15px; font-weight: 600; color: var(--maid-text); margin-bottom: 4px; }
.quick-desc { font-size: 12px; color: var(--maid-text-light); }

.stat-card {
  display: flex;
  align-items: center;
  gap: 16px;
  background: #fff;
  border-radius: 16px;
  padding: 22px 24px;
  border: 1px solid var(--maid-border);
  box-shadow: 0 2px 12px rgba(255,107,157,0.06);
  transition: all 0.3s ease;
}
.stat-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 8px 24px rgba(255,107,157,0.12);
}
.stat-icon {
  width: 52px;
  height: 52px;
  border-radius: 14px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 24px;
  flex-shrink: 0;
}
.stat-label { font-size: 13px; color: var(--maid-text-light); margin-bottom: 2px; }
.stat-value { font-size: 30px; font-weight: 700; line-height: 1.2; }

.knowledge-card {
  background: #fff;
  border-radius: 16px;
  overflow: hidden;
  cursor: pointer;
  border: 1px solid var(--maid-border);
  box-shadow: 0 2px 12px rgba(255,107,157,0.06);
  transition: all 0.3s ease;
}
.knowledge-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 10px 30px rgba(255,107,157,0.15);
}
.knowledge-top {
  height: 80px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.knowledge-body { padding: 14px 16px; }
.knowledge-title {
  font-size: 14px;
  font-weight: 600;
  color: var(--maid-text);
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  margin-bottom: 8px;
}
.knowledge-meta {
  display: flex;
  align-items: center;
  justify-content: space-between;
  font-size: 12px;
  color: var(--maid-text-light);
}
</style>
