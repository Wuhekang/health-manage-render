<template>
  <el-card shadow="hover">
    <el-form :inline="true" :model="search" style="margin-bottom: 16px">
      <el-form-item><el-input v-model="search.title" placeholder="搜索标题" clearable style="width: 160px" /></el-form-item>
      <el-form-item>
        <el-button type="primary" @click="loadData">搜索</el-button>
        <el-button @click="resetSearch">重置</el-button>
      </el-form-item>
      <el-form-item style="float: right"><el-button type="success" @click="openDialog()">新增公告</el-button></el-form-item>
    </el-form>

    <el-table :data="tableData" border stripe>
      <el-table-column prop="title" label="标题" min-width="200" show-overflow-tooltip />
      <el-table-column prop="status" label="状态" width="80">
        <template #default="{ row }"><el-tag :type="row.status === 1 ? 'success' : 'info'" size="small">{{ row.status === 1 ? '已发布' : '草稿' }}</el-tag></template>
      </el-table-column>
      <el-table-column prop="createTime" label="创建时间" width="170" />
      <el-table-column label="操作" width="150" fixed="right">
        <template #default="{ row }">
          <el-button size="small" @click="openDialog(row)">编辑</el-button>
          <el-popconfirm title="确定删除？" @confirm="handleDelete(row.id)">
            <template #reference><el-button size="small" type="danger">删除</el-button></template>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination style="margin-top: 16px; justify-content: flex-end" v-model:current-page="pageNum" v-model:page-size="pageSize" :total="total" :page-sizes="[10,20,50]" layout="total, sizes, prev, pager, next" @current-change="loadData" @size-change="loadData" />

    <el-dialog v-model="dialogVisible" :title="isEdit ? '编辑公告' : '新增公告'" width="600px">
      <el-form ref="formRef" :model="form" :rules="rules" label-width="70px">
        <el-form-item label="标题" prop="title"><el-input v-model="form.title" /></el-form-item>
        <el-form-item label="内容" prop="content"><el-input v-model="form.content" type="textarea" :rows="8" /></el-form-item>
        <el-form-item label="状态"><el-select v-model="form.status" style="width: 120px"><el-option label="已发布" :value="1" /><el-option label="草稿" :value="0" /></el-select></el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" :loading="submitLoading" @click="handleSubmit">确定</el-button>
      </template>
    </el-dialog>
  </el-card>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { getNoticeList, addNotice, updateNotice, deleteNotice } from '@/api/notice'

const tableData = ref([])
const pageNum = ref(1)
const pageSize = ref(10)
const total = ref(0)
const search = reactive({ title: '' })
const dialogVisible = ref(false)
const isEdit = ref(false)
const submitLoading = ref(false)
const formRef = ref()

const defaultForm = { id: null, title: '', content: '', status: 1 }
const form = reactive({ ...defaultForm })
const rules = { title: [{ required: true, message: '请输入标题', trigger: 'blur' }], content: [{ required: true, message: '请输入内容', trigger: 'blur' }] }

const loadData = async () => { const res = await getNoticeList({ pageNum: pageNum.value, pageSize: pageSize.value, title: search.title }); tableData.value = res.data.records; total.value = Number(res.data.total) }
const resetSearch = () => { search.title = ''; pageNum.value = 1; loadData() }
const openDialog = (row) => { isEdit.value = !!row; Object.assign(form, row ? { ...row } : { ...defaultForm }); dialogVisible.value = true }
const handleSubmit = () => { formRef.value.validate(async (valid) => { if (!valid) return; submitLoading.value = true; try { if (isEdit.value) { await updateNotice(form); ElMessage.success('修改成功') } else { await addNotice(form); ElMessage.success('新增成功') }; dialogVisible.value = false; loadData() } finally { submitLoading.value = false } }) }
const handleDelete = async (id) => { await deleteNotice(id); ElMessage.success('删除成功'); if (tableData.value.length === 1 && pageNum.value > 1) pageNum.value--; loadData() }
onMounted(() => loadData())
</script>
