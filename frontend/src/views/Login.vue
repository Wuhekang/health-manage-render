<template>
  <div class="login-bg">
    <div class="float-hearts">
      <span v-for="i in 12" :key="i" class="heart" :style="heartStyle(i)">♥</span>
    </div>

    <div class="login-card">
      <div class="maid-img-wrap">
        <img src="/img/maid-character.png" alt="maid" class="maid-img" />
      </div>
      <h2 class="maid-title">~ 小女仆健康管家 ~</h2>
      <p class="maid-subtitle">主人，欢迎回来 ♪(´▽｀)</p>

      <el-form v-if="!isRegister" ref="loginRef" :model="loginForm" :rules="loginRules" style="margin-top: 20px">
        <el-form-item prop="username">
          <el-input v-model="loginForm.username" size="large" placeholder="请输入用户名 ~" :prefix-icon="User" class="maid-input" />
        </el-form-item>
        <el-form-item prop="password">
          <el-input v-model="loginForm.password" size="large" type="password" show-password placeholder="请输入密码 ~" :prefix-icon="Lock" class="maid-input" @keyup.enter="handleLogin" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" size="large" class="maid-btn" :loading="loading" @click="handleLogin">♡ 登录 ♡</el-button>
        </el-form-item>
        <div style="text-align: center">
          <el-link type="primary" @click="isRegister = true" style="color: var(--maid-pink)">还没有账号？去注册 ～</el-link>
        </div>
      </el-form>

      <el-form v-else ref="registerRef" :model="registerForm" :rules="registerRules" style="margin-top: 20px">
        <el-form-item prop="username">
          <el-input v-model="registerForm.username" size="large" placeholder="请输入用户名 ~" :prefix-icon="User" class="maid-input" />
        </el-form-item>
        <el-form-item prop="password">
          <el-input v-model="registerForm.password" size="large" type="password" show-password placeholder="请输入密码 ~" :prefix-icon="Lock" class="maid-input" />
        </el-form-item>
        <el-form-item prop="confirmPassword">
          <el-input v-model="registerForm.confirmPassword" size="large" type="password" show-password placeholder="确认密码 ~" :prefix-icon="Lock" class="maid-input" />
        </el-form-item>
        <el-form-item prop="nickname">
          <el-input v-model="registerForm.nickname" size="large" placeholder="给主人取个昵称 ~" :prefix-icon="UserFilled" class="maid-input" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" size="large" class="maid-btn" :loading="loading" @click="handleRegister">♡ 注册 ♡</el-button>
        </el-form-item>
        <div style="text-align: center">
          <el-link type="primary" @click="isRegister = false" style="color: var(--maid-pink)">已有账号？去登录 ～</el-link>
        </div>
      </el-form>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import { User, Lock, UserFilled } from '@element-plus/icons-vue'
import request from '@/utils/request'

const router = useRouter()
const loading = ref(false)
const isRegister = ref(false)
const loginRef = ref()
const registerRef = ref()

const loginForm = reactive({ username: '', password: '' })
const registerForm = reactive({ username: '', password: '', confirmPassword: '', nickname: '' })

const loginRules = {
  username: [{ required: true, message: '主人，请输入用户名哦~', trigger: 'blur' }],
  password: [{ required: true, message: '主人，请输入密码哦~', trigger: 'blur' }]
}
const registerRules = {
  username: [{ required: true, message: '请输入用户名', trigger: 'blur' }, { min: 3, max: 20, message: '长度3-20个字符', trigger: 'blur' }],
  password: [{ required: true, message: '请输入密码', trigger: 'blur' }, { min: 6, max: 20, message: '长度6-20个字符', trigger: 'blur' }],
  confirmPassword: [{ required: true, message: '请确认密码', trigger: 'blur' }, {
    validator: (rule, value, callback) => {
      if (value !== registerForm.password) callback(new Error('两次密码不一致'))
      else callback()
    }, trigger: 'blur'
  }],
  nickname: [{ required: true, message: '请输入昵称', trigger: 'blur' }]
}

const roleRouteMap = { admin: '/admin/dashboard', user: '/home' }

const heartStyle = (i) => ({
  left: (i * 8.3) + '%',
  animationDelay: (i * 0.5) + 's',
  animationDuration: (3 + Math.random() * 4) + 's',
  fontSize: (12 + Math.random() * 16) + 'px',
  opacity: 0.15 + Math.random() * 0.2
})

const handleLogin = () => {
  loginRef.value.validate(async (valid) => {
    if (!valid) return
    loading.value = true
    try {
      const res = await request.post('/login', loginForm)
      const data = res.data
      localStorage.setItem('token', data.token)
      localStorage.setItem('user', JSON.stringify({ id: data.id, username: data.username, nickname: data.nickname, role: data.role, gender: data.gender, age: data.age, phone: data.phone, email: data.email }))
      ElMessage.success('欢迎回来，主人~ ♪')
      router.push(roleRouteMap[data.role] || '/')
    } catch (e) { /* handled */ }
    finally { loading.value = false }
  })
}

const handleRegister = () => {
  registerRef.value.validate(async (valid) => {
    if (!valid) return
    loading.value = true
    try {
      await request.post('/register', { username: registerForm.username, password: registerForm.password, nickname: registerForm.nickname })
      ElMessage.success('注册成功~ 请登录吧主人 ♡')
      isRegister.value = false
    } catch (e) { /* handled */ }
    finally { loading.value = false }
  })
}
</script>

<style scoped>
.login-bg {
  height: 100vh;
  background: linear-gradient(135deg, #a8d8ea 0%, #f3c4d7 40%, #fcb6d0 60%, #aac4e8 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  overflow: hidden;
}
.float-hearts {
  position: absolute;
  width: 100%;
  height: 100%;
  pointer-events: none;
}
.heart {
  position: absolute;
  bottom: -30px;
  color: #ff6b9d;
  animation: floatUp linear infinite;
}
@keyframes floatUp {
  0% { transform: translateY(0) rotate(0deg); opacity: 0; }
  10% { opacity: 0.3; }
  90% { opacity: 0.1; }
  100% { transform: translateY(-100vh) rotate(360deg); opacity: 0; }
}
.login-card {
  width: 420px;
  padding: 40px;
  padding-top: 140px;
  margin-top: 0;
  background: rgba(255, 255, 255, 0.92);
  backdrop-filter: blur(20px);
  border-radius: 24px;
  box-shadow: 0 8px 40px rgba(255, 107, 157, 0.15);
  border: 2px solid rgba(255, 107, 157, 0.15);
  text-align: center;
  position: relative;
  z-index: 1;
}
.maid-img-wrap {
  position: absolute;
  top: -210px;
  left: 50%;
  transform: translateX(-50%);
  width: 400px;
  height: 400px;
  pointer-events: none;
  animation: maidBounce 3s ease-in-out infinite;
}
.maid-img {
  width: 100%;
  height: 100%;
  object-fit: contain;
  filter: drop-shadow(0 8px 20px rgba(255, 107, 157, 0.3));
}
@keyframes maidBounce {
  0%, 100% { transform: translateX(-50%) translateY(0); }
  50% { transform: translateX(-50%) translateY(-8px); }
}
.maid-title {
  color: var(--maid-pink);
  font-size: 22px;
  font-weight: 700;
  margin: 0;
}
.maid-subtitle {
  color: var(--maid-text-light);
  font-size: 14px;
  margin: 6px 0 0;
}
.maid-btn {
  width: 100%;
  border-radius: 50px !important;
  font-size: 16px;
  letter-spacing: 2px;
  background: linear-gradient(135deg, #ff6b9d, #c084fc) !important;
  border: none !important;
}
.maid-btn:hover {
  background: linear-gradient(135deg, #ff8eb3, #d4a0ff) !important;
}
.maid-input :deep(.el-input__wrapper) {
  border-radius: 50px !important;
  border: 2px solid var(--maid-border) !important;
  box-shadow: none !important;
}
.maid-input :deep(.el-input__wrapper:focus-within) {
  border-color: var(--maid-pink) !important;
}
</style>
