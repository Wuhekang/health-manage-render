import { createRouter, createWebHashHistory } from 'vue-router'

const routes = [
  {
    path: '/login',
    name: 'Login',
    component: () => import('@/views/Login.vue')
  },
  {
    path: '/admin',
    component: () => import('@/layout/Layout.vue'),
    redirect: '/admin/dashboard',
    children: [
      { path: 'dashboard', name: 'AdminDashboard', component: () => import('@/views/admin/Dashboard.vue'), meta: { title: '✨ 仪表盘', icon: 'DataBoard', roles: ['admin'] } },
      { path: 'user', name: 'UserList', component: () => import('@/views/admin/UserList.vue'), meta: { title: '👥 用户管理', icon: 'User', roles: ['admin'] } },
      { path: 'health-knowledge', name: 'KnowledgeList', component: () => import('@/views/admin/KnowledgeList.vue'), meta: { title: '📖 健康知识', icon: 'Reading', roles: ['admin'] } },
      { path: 'notice', name: 'NoticeList', component: () => import('@/views/admin/NoticeList.vue'), meta: { title: '📢 公告管理', icon: 'Bell', roles: ['admin'] } },
      { path: 'health-data', name: 'HealthDataList', component: () => import('@/views/admin/HealthDataList.vue'), meta: { title: '💊 健康数据', icon: 'Document', roles: ['admin'] } },
      { path: 'ai-config', name: 'AiConfigList', component: () => import('@/views/admin/AiConfigList.vue'), meta: { title: '🤖 AI配置', icon: 'Setting', roles: ['admin'] } }
    ]
  },
  {
    path: '/',
    component: () => import('@/layout/FrontLayout.vue'),
    redirect: '/home',
    children: [
      { path: 'home', name: 'Home', component: () => import('@/views/front/Home.vue'), meta: { title: '🏠 首页', icon: 'House', roles: ['user'] } },
      { path: 'health-record', name: 'HealthRecord', component: () => import('@/views/front/HealthRecord.vue'), meta: { title: '📋 健康数据', icon: 'EditPen', roles: ['user'] } },
      { path: 'health-chart', name: 'HealthChart', component: () => import('@/views/front/HealthChart.vue'), meta: { title: '📊 数据可视化', icon: 'TrendCharts', roles: ['user'] } },
      { path: 'health-assessment', name: 'HealthAssessment', component: () => import('@/views/front/HealthAssessment.vue'), meta: { title: '🩺 健康评估', icon: 'CircleCheck', roles: ['user'] } },
      { path: 'ai-chat', name: 'AiChat', component: () => import('@/views/front/AiChat.vue'), meta: { title: '🤖 AI助手', icon: 'ChatDotRound', roles: ['user'] } },
      { path: 'health-knowledge', name: 'KnowledgeBrowse', component: () => import('@/views/front/KnowledgeBrowse.vue'), meta: { title: '📚 健康知识', icon: 'Reading', roles: ['user'] } },
      { path: 'exercise', name: 'ExerciseRecord', component: () => import('@/views/front/ExerciseRecord.vue'), meta: { title: '🏃 运动记录', icon: 'Trophy', roles: ['user'] } },
      { path: 'diet', name: 'DietRecord', component: () => import('@/views/front/DietRecord.vue'), meta: { title: '🍱 饮食记录', icon: 'Bowl', roles: ['user'] } },
      { path: 'health-goal', name: 'HealthGoal', component: () => import('@/views/front/HealthGoal.vue'), meta: { title: '🎯 健康目标', icon: 'Flag', roles: ['user'] } },
      { path: 'outfit', name: 'DailyOutfit', component: () => import('@/views/front/DailyOutfit.vue'), meta: { title: '👗 今日穿搭', icon: 'Brush', roles: ['user'] } },
      { path: 'profile', name: 'Profile', component: () => import('@/views/front/Profile.vue'), meta: { title: '💖 个人中心', icon: 'UserFilled', roles: ['user'] } }
    ]
  }
]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

router.beforeEach((to, from, next) => {
  const token = localStorage.getItem('token')
  const user = JSON.parse(localStorage.getItem('user') || '{}')

  if (to.path === '/login') {
    next()
    return
  }

  if (!token) {
    next('/login')
    return
  }

  if (to.path.startsWith('/admin') && user.role !== 'admin') {
    next('/')
    return
  }

  if (!to.path.startsWith('/admin') && to.path !== '/login' && user.role === 'admin') {
    next('/admin/dashboard')
    return
  }

  next()
})

export default router
