<template>
  <el-container style="height: 100vh">
    <el-aside :width="isCollapse ? '64px' : '220px'" class="maid-sidebar">
      <div class="sidebar-logo">
        <span style="font-size: 22px">🎀</span>
        <span v-show="!isCollapse" class="logo-text">管家后台</span>
      </div>
      <el-menu
        :default-active="$route.path"
        :collapse="isCollapse"
        background-color="transparent"
        text-color="rgba(255,255,255,0.75)"
        active-text-color="#fff"
        router
        class="maid-menu"
      >
        <el-menu-item v-for="item in menuList" :key="item.path" :index="'/admin/' + item.path">
          <span v-if="isCollapse" style="font-size: 16px">{{ getEmoji(item.meta.title) }}</span>
          <span v-else>{{ item.meta.title }}</span>
        </el-menu-item>
      </el-menu>
      <div v-show="!isCollapse" class="sidebar-maid-section">
        <img src="/img/maid-character.png" class="sidebar-maid-img" />
        <div class="sidebar-maid-bubble">为主人服务中~ ♪</div>
      </div>
    </el-aside>

    <el-container>
      <el-header class="maid-header">
        <div style="display: flex; align-items: center">
          <el-icon :size="20" style="cursor: pointer; color: var(--maid-text)" @click="isCollapse = !isCollapse"><Fold v-if="!isCollapse" /><Expand v-else /></el-icon>
          <el-breadcrumb separator="/" style="margin-left: 16px">
            <el-breadcrumb-item :to="{ path: '/admin/dashboard' }">首页</el-breadcrumb-item>
            <el-breadcrumb-item>{{ $route.meta.title }}</el-breadcrumb-item>
          </el-breadcrumb>
          <el-tag effect="plain" round type="primary" style="margin-left: 16px; border-color: var(--maid-border); color: var(--maid-pink); background: rgba(255,107,157,0.06)">♡ 欢迎回来，主人~ ♪</el-tag>
        </div>
        <el-dropdown>
          <div style="display: flex; align-items: center; cursor: pointer">
            <el-avatar :size="32" class="maid-avatar-small">{{ nickname.charAt(0) }}</el-avatar>
            <span style="margin-left: 8px; font-size: 14px; color: var(--maid-text)">{{ nickname }}</span>
          </div>
          <template #dropdown>
            <el-dropdown-menu>
              <el-dropdown-item @click="handleLogout">👋 退出登录</el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </el-header>

      <el-main class="maid-main">
        <div class="floating-decor">
          <span v-for="i in 8" :key="i" class="decor-item" :style="decorStyle(i)">{{ decorEmojis[i % decorEmojis.length] }}</span>
        </div>
        <router-view />
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

const user = JSON.parse(localStorage.getItem('user') || '{}')
const nickname = computed(() => user.nickname || user.username || '管理员')

const adminRoutes = router.getRoutes().find(r => r.path === '/admin')
const menuList = computed(() => {
  if (!adminRoutes || !adminRoutes.children) return []
  return adminRoutes.children.filter(c => c.meta && c.meta.title)
})

const getEmoji = (title) => {
  const match = title.match(/^(\p{Emoji_Presentation}|\p{Extended_Pictographic})/u)
  return match ? match[0] : '♡'
}

const decorEmojis = ['♡', '✿', '♪', '⋆', '🎀', '✧', '♡', '⋆']
const decorStyle = (i) => ({
  left: (10 + i * 12) + '%',
  top: (15 + (i * 37) % 70) + '%',
  animationDelay: (i * 0.8) + 's',
  animationDuration: (6 + i * 1.5) + 's',
  fontSize: (10 + (i % 3) * 4) + 'px'
})

const handleLogout = () => {
  localStorage.removeItem('token')
  localStorage.removeItem('user')
  router.push('/login')
}
</script>

<style scoped>
.maid-sidebar {
  background: linear-gradient(180deg, #4a3548 0%, #2d1f2d 100%);
  transition: width 0.3s;
  overflow: hidden;
  display: flex;
  flex-direction: column;
}
.sidebar-logo {
  height: 60px;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  white-space: nowrap;
  border-bottom: 1px solid rgba(255,255,255,0.08);
}
.logo-text {
  margin-left: 8px;
  font-size: 16px;
  font-weight: bold;
  color: #ffb6c1;
  overflow: hidden;
}
.maid-menu {
  flex: 1;
  border-right: none !important;
}
.maid-menu .el-menu-item {
  border-radius: 8px;
  margin: 2px 8px;
}
.maid-menu .el-menu-item:hover {
  background: rgba(255, 107, 157, 0.15) !important;
}
.maid-menu .el-menu-item.is-active {
  background: linear-gradient(135deg, rgba(255,107,157,0.35), rgba(192,132,252,0.25)) !important;
  color: #fff !important;
  border-left: 3px solid #ff6b9d;
  font-weight: 600;
}

.sidebar-maid-section {
  padding: 8px 12px 16px;
  text-align: center;
  position: relative;
}
.sidebar-maid-img {
  width: 160px;
  height: 160px;
  object-fit: contain;
  filter: drop-shadow(0 4px 12px rgba(255,107,157,0.3));
  animation: maidIdle 4s ease-in-out infinite;
}
@keyframes maidIdle {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-5px); }
}
.sidebar-maid-bubble {
  background: rgba(255,182,193,0.2);
  border: 1px solid rgba(255,182,193,0.3);
  border-radius: 12px;
  padding: 4px 10px;
  font-size: 11px;
  color: rgba(255,255,255,0.6);
  margin-top: 4px;
}

.maid-header {
  background: rgba(255, 255, 255, 0.85);
  backdrop-filter: blur(12px);
  box-shadow: 0 2px 12px rgba(255,107,157,0.06);
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 20px;
  border-bottom: 2px solid rgba(243,213,232,0.5);
}
.maid-main {
  background: linear-gradient(135deg, #e8f4f8 0%, #fce4ec 50%, #e8eaf6 100%);
  padding: 20px;
  min-height: calc(100vh - 60px);
  position: relative;
  overflow: hidden;
}
.maid-avatar-small {
  background: linear-gradient(135deg, #ff6b9d, #c084fc) !important;
  color: #fff;
}

.floating-decor {
  position: absolute;
  inset: 0;
  pointer-events: none;
  z-index: 0;
  overflow: hidden;
}
.decor-item {
  position: absolute;
  color: rgba(255, 107, 157, 0.1);
  animation: floatDecor linear infinite;
}
@keyframes floatDecor {
  0% { transform: translateY(0) rotate(0deg); opacity: 0.08; }
  50% { opacity: 0.15; }
  100% { transform: translateY(-40px) rotate(20deg); opacity: 0.05; }
}
</style>
