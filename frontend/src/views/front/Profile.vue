<template>
  <div>
    <el-card shadow="hover" style="margin-bottom: 20px">
      <template #header><span style="font-weight: bold">个人信息</span></template>
      <el-form ref="profileRef" :model="profileForm" label-width="80px" style="max-width: 500px">
        <el-form-item label="用户名"><el-input :model-value="profileForm.username" disabled /></el-form-item>
        <el-form-item label="昵称" prop="nickname"><el-input v-model="profileForm.nickname" /></el-form-item>
        <el-form-item label="性别">
          <el-select v-model="profileForm.gender" style="width: 100%">
            <el-option label="未知" :value="0" /><el-option label="男" :value="1" /><el-option label="女" :value="2" />
          </el-select>
        </el-form-item>
        <el-form-item label="年龄"><el-input-number v-model="profileForm.age" :min="1" :max="150" style="width: 100%" /></el-form-item>
        <el-form-item label="手机"><el-input v-model="profileForm.phone" /></el-form-item>
        <el-form-item label="邮箱"><el-input v-model="profileForm.email" /></el-form-item>
        <el-form-item><el-button type="primary" :loading="profileLoading" @click="handleProfileSave">保存修改</el-button></el-form-item>
      </el-form>
    </el-card>

    <el-card shadow="hover">
      <template #header><span style="font-weight: bold">修改密码</span></template>
      <el-form ref="pwdRef" :model="pwdForm" :rules="pwdRules" label-width="80px" style="max-width: 500px">
        <el-form-item label="旧密码" prop="oldPassword"><el-input v-model="pwdForm.oldPassword" type="password" show-password /></el-form-item>
        <el-form-item label="新密码" prop="newPassword"><el-input v-model="pwdForm.newPassword" type="password" show-password /></el-form-item>
        <el-form-item label="确认密码" prop="confirmPassword"><el-input v-model="pwdForm.confirmPassword" type="password" show-password /></el-form-item>
        <el-form-item><el-button type="primary" :loading="pwdLoading" @click="handlePasswordSave">修改密码</el-button></el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { getUserInfo, updateProfile, updatePassword } from '@/api/user'

const profileRef = ref()
const pwdRef = ref()
const profileLoading = ref(false)
const pwdLoading = ref(false)

const profileForm = reactive({ username: '', nickname: '', gender: 0, age: null, phone: '', email: '' })
const pwdForm = reactive({ oldPassword: '', newPassword: '', confirmPassword: '' })

const pwdRules = {
  oldPassword: [{ required: true, message: '请输入旧密码', trigger: 'blur' }],
  newPassword: [{ required: true, message: '请输入新密码', trigger: 'blur' }, { min: 6, max: 20, message: '长度6-20个字符', trigger: 'blur' }],
  confirmPassword: [{ required: true, message: '请确认新密码', trigger: 'blur' }, {
    validator: (rule, value, callback) => { value !== pwdForm.newPassword ? callback(new Error('两次密码不一致')) : callback() }, trigger: 'blur'
  }]
}

onMounted(async () => {
  const res = await getUserInfo()
  Object.assign(profileForm, res.data)
})

const handleProfileSave = async () => {
  profileLoading.value = true
  try {
    await updateProfile({ nickname: profileForm.nickname, gender: profileForm.gender, age: profileForm.age, phone: profileForm.phone, email: profileForm.email })
    const user = JSON.parse(localStorage.getItem('user') || '{}')
    user.nickname = profileForm.nickname; user.gender = profileForm.gender; user.age = profileForm.age; user.phone = profileForm.phone; user.email = profileForm.email
    localStorage.setItem('user', JSON.stringify(user))
    ElMessage.success('保存成功')
  } finally { profileLoading.value = false }
}

const handlePasswordSave = () => {
  pwdRef.value.validate(async (valid) => {
    if (!valid) return; pwdLoading.value = true
    try {
      await updatePassword({ oldPassword: pwdForm.oldPassword, newPassword: pwdForm.newPassword })
      ElMessage.success('密码修改成功，请重新登录')
      localStorage.removeItem('token'); localStorage.removeItem('user')
      setTimeout(() => location.href = '/login', 1000)
    } finally { pwdLoading.value = false }
  })
}
</script>
