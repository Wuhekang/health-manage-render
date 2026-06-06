<template>
  <el-container style="height: 100vh">
    <el-aside :width="isCollapse ? '64px' : '220px'" class="maid-front-sidebar">
      <div class="sidebar-logo" @click="$router.push('/home')">
        <img src="/img/maid-character.png" class="logo-maid-img" />
        <span v-show="!isCollapse" class="logo-text">小女仆管家</span>
      </div>

      <el-menu
        :default-active="$route.path"
        :collapse="isCollapse"
        background-color="transparent"
        text-color="#7a5c7e"
        active-text-color="#ff6b9d"
        router
        class="front-menu"
      >
        <el-menu-item v-for="item in menuList" :key="item.path" :index="'/' + item.path">
          <span v-if="isCollapse" class="collapse-emoji">{{ getEmoji(item.meta.title) }}</span>
          <span v-else>{{ item.meta.title }}</span>
        </el-menu-item>
      </el-menu>

      <div v-show="!isCollapse" class="sidebar-bottom">
        <div class="maid-status">
          <div class="status-dot"></div>
          <span>女仆在线守护中~</span>
        </div>
      </div>
    </el-aside>

    <el-container>
      <el-header class="front-header">
        <div style="display: flex; align-items: center">
          <el-icon :size="20" style="cursor: pointer; color: var(--maid-text)" @click="isCollapse = !isCollapse">
            <Fold v-if="!isCollapse" /><Expand v-else />
          </el-icon>
          <el-breadcrumb separator="/" style="margin-left: 16px">
            <el-breadcrumb-item :to="{ path: '/home' }">首页</el-breadcrumb-item>
            <el-breadcrumb-item>{{ currentTitle }}</el-breadcrumb-item>
          </el-breadcrumb>
        </div>
        <div style="display: flex; align-items: center; gap: 12px">
          <el-tag effect="plain" round size="small" style="border-color: var(--maid-border); color: var(--maid-pink); background: rgba(255,107,157,0.06)">♡ {{ greeting }}</el-tag>
          <el-dropdown v-if="user.id">
            <div style="display: flex; align-items: center; cursor: pointer; white-space: nowrap">
              <el-avatar :size="32" class="user-avatar">{{ (user.nickname || user.username || '').charAt(0) }}</el-avatar>
              <span style="margin-left: 6px; font-size: 14px; color: var(--maid-text)">{{ user.nickname || user.username }}</span>
            </div>
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item @click="$router.push('/profile')">💖 个人中心</el-dropdown-item>
                <el-dropdown-item divided @click="handleLogout">👋 退出登录</el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </div>
      </el-header>

      <el-main class="front-main">
        <div class="floating-decor">
          <span v-for="i in 6" :key="i" class="decor-dot" :style="dotStyle(i)"></span>
        </div>
        <div style="max-width: 1200px; margin: 0 auto; position: relative; z-index: 1">
          <router-view />
        </div>
      </el-main>
    </el-container>
  </el-container>
</template>

<script setup>
import { ref, computed } from 'vue'
import { useRouter, useRoute } from 'vue-router'

const router = useRouter()
const route = useRoute()
const isCollapse = ref(false)
const user = ref(JSON.parse(localStorage.getItem('user') || '{}'))

const frontRoutes = router.getRoutes().find(r => r.path === '/')
const menuList = computed(() => {
  if (!frontRoutes || !frontRoutes.children) return []
  return frontRoutes.children.filter(c => c.meta && c.meta.title)
})

const currentTitle = computed(() => {
  const title = route.meta?.title || ''
  return title.replace(/^[\p{Emoji_Presentation}\p{Extended_Pictographic}]\s*/u, '')
})

const greeting = computed(() => {
  const h = new Date().getHours()
  if (h < 6) return '夜深了，主人早点休息哦~'
  if (h < 12) return '早上好，主人~'
  if (h < 14) return '中午好，记得吃饭哦~'
  if (h < 18) return '下午好，主人~'
  return '晚上好，主人~'
})

const getEmoji = (title) => {
  const match = title.match(/^(\p{Emoji_Presentation}|\p{Extended_Pictographic})/u)
  return match ? match[0] : '♡'
}

const dotStyle = (i) => ({
  left: (8 + i * 16) + '%',
  top: (15 + (i * 29) % 65) + '%',
  width: (5 + i % 3 * 3) + 'px',
  height: (5 + i % 3 * 3) + 'px',
  animationDelay: (i * 0.7) + 's',
  background: i % 2 === 0 ? 'rgba(255,107,157,0.12)' : 'rgba(168,216,234,0.15)'
})

const handleLogout = () => {
  localStorage.removeItem('token')
  localStorage.removeItem('user')
  user.value = {}
  router.push('/login')
}
</script>

<style scoped>
.maid-front-sidebar {
  background: linear-gradient(180deg, #fff8fa 0%, #fef0f5 50%, #f5eefa 100%);
  border-right: none;
  box-shadow: 4px 0 24px rgba(255,107,157,0.08);
  transition: width 0.3s;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  position: relative;
}
.maid-front-sidebar::after {
  content: '';
  position: absolute;
  right: 0;
  top: 20%;
  bottom: 20%;
  width: 3px;
  background: linear-gradient(180deg, transparent, rgba(255,107,157,0.2), rgba(192,132,252,0.2), transparent);
  border-radius: 3px;
}

.sidebar-logo {
  height: 68px;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0;
  cursor: pointer;
  overflow: hidden;
  white-space: nowrap;
  gap: 10px;
  position: relative;
}
.sidebar-logo::after {
  content: '· · · · · · · · · · · · · · · · ·';
  position: absolute;
  bottom: 0;
  left: 16px;
  right: 16px;
  text-align: center;
  font-size: 10px;
  color: rgba(255,107,157,0.2);
  letter-spacing: 2px;
  overflow: hidden;
  height: 10px;
  line-height: 10px;
}
.logo-maid-img {
  width: 38px;
  height: 38px;
  object-fit: contain;
  flex-shrink: 0;
  animation: logoWiggle 4s ease-in-out infinite;
  filter: drop-shadow(0 2px 6px rgba(255,107,157,0.2));
}
@keyframes logoWiggle {
  0%, 100% { transform: rotate(-5deg) scale(1); }
  50% { transform: rotate(5deg) scale(1.05); }
}
.logo-text {
  font-size: 17px;
  font-weight: 700;
  background: linear-gradient(135deg, #ff6b9d, #c084fc);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  overflow: hidden;
  text-align: center;
}

.front-menu {
  flex: 1;
  border-right: none !important;
  padding: 10px 0;
}
.front-menu .el-menu-item {
  border-radius: 14px;
  margin: 4px 12px;
  height: 44px;
  line-height: 44px;
  font-size: 13.5px;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  position: relative;
  overflow: hidden;
}
.front-menu .el-menu-item::before {
  content: '';
  position: absolute;
  inset: 0;
  background: linear-gradient(135deg, rgba(255,107,157,0.1), rgba(192,132,252,0.08));
  opacity: 0;
  transition: opacity 0.3s;
  border-radius: 14px;
}
.front-menu .el-menu-item:hover {
  background: transparent !important;
  transform: translateX(4px);
  color: var(--maid-pink) !important;
}
.front-menu .el-menu-item:hover::before {
  opacity: 1;
}
.front-menu .el-menu-item.is-active {
  background: linear-gradient(135deg, rgba(255,107,157,0.18), rgba(192,132,252,0.12)) !important;
  color: var(--maid-pink) !important;
  font-weight: 600;
  box-shadow: 0 3px 12px rgba(255,107,157,0.1);
  border-left: none;
}
.front-menu .el-menu-item.is-active::after {
  content: '♡';
  position: absolute;
  right: 12px;
  font-size: 10px;
  color: var(--maid-pink);
  opacity: 0.6;
}
.collapse-emoji {
  font-size: 18px;
}

.sidebar-bottom {
  padding: 14px 16px;
  position: relative;
}
.sidebar-bottom::before {
  content: '~ · ~ · ~ · ~ · ~';
  display: block;
  text-align: center;
  font-size: 10px;
  color: rgba(255,107,157,0.15);
  letter-spacing: 2px;
  margin-bottom: 10px;
}
.maid-status {
  display: flex;
  align-items: center;
  gap: 6px;
  font-size: 11px;
  color: var(--maid-text-light);
  justify-content: center;
  background: rgba(255,255,255,0.5);
  padding: 6px 12px;
  border-radius: 20px;
  border: 1px dashed rgba(255,107,157,0.15);
}
.status-dot {
  width: 7px;
  height: 7px;
  border-radius: 50%;
  background: linear-gradient(135deg, #67c23a, #98d4bb);
  animation: pulse 2s ease-in-out infinite;
  box-shadow: 0 0 6px rgba(103,194,58,0.4);
}
@keyframes pulse {
  0%, 100% { opacity: 1; transform: scale(1); }
  50% { opacity: 0.5; transform: scale(0.85); }
}

.front-header {
  background: rgba(255, 255, 255, 0.9);
  backdrop-filter: blur(16px);
  box-shadow: 0 2px 16px rgba(255,107,157,0.06);
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 24px;
  border-bottom: none;
  height: 60px;
  position: relative;
}
.front-header::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 24px;
  right: 24px;
  height: 2px;
  background: linear-gradient(90deg, transparent, rgba(255,107,157,0.15), rgba(192,132,252,0.15), transparent);
}
.user-avatar {
  background: linear-gradient(135deg, #ff6b9d, #c084fc) !important;
  color: #fff;
  box-shadow: 0 2px 8px rgba(255,107,157,0.25);
}

.front-main {
  background: linear-gradient(135deg, #e8f4f8 0%, #fce4ec 50%, #e8eaf6 100%);
  padding: 20px;
  min-height: calc(100vh - 60px);
  position: relative;
  overflow-y: auto;
}
.floating-decor {
  position: absolute;
  inset: 0;
  pointer-events: none;
  z-index: 0;
  overflow: hidden;
}
.decor-dot {
  position: absolute;
  border-radius: 50%;
  animation: pulseDot 5s ease-in-out infinite;
}
@keyframes pulseDot {
  0%, 100% { transform: scale(1); opacity: 0.15; }
  50% { transform: scale(1.8); opacity: 0.06; }
}
</style>
