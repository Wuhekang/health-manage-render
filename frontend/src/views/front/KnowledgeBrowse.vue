<template>
  <div>
    <el-card shadow="hover" style="margin-bottom: 20px">
      <el-radio-group v-model="selectedCategory" @change="loadData" style="margin-bottom: 0">
        <el-radio-button label="">全部</el-radio-button>
        <el-radio-button v-for="c in categories" :key="c" :label="c">{{ c }}</el-radio-button>
      </el-radio-group>
    </el-card>

    <el-row :gutter="16">
      <el-col :span="6" v-for="item in dataList" :key="item.id" style="margin-bottom: 16px">
        <el-card shadow="hover" style="cursor: pointer" @click="showDetail(item)">
          <div :style="{ height: '100px', background: categoryColors[item.category] || '#4a6fa5', borderRadius: '4px', display: 'flex', alignItems: 'center', justifyContent: 'center', marginBottom: '12px' }">
            <el-icon :size="36" style="color: rgba(255,255,255,0.9)"><Reading /></el-icon>
          </div>
          <h4 style="margin: 0 0 8px; color: #303133; overflow: hidden; text-overflow: ellipsis; white-space: nowrap">{{ item.title }}</h4>
          <div style="font-size: 13px; color: #909399; display: flex; justify-content: space-between">
            <span>{{ item.author }}</span>
            <span>{{ item.viewCount }} 次浏览</span>
          </div>
          <el-tag :type="categoryTagType[item.category]" size="small" style="margin-top: 8px">{{ item.category }}</el-tag>
        </el-card>
      </el-col>
    </el-row>

    <el-empty v-if="dataList.length === 0" description="暂无健康知识" />
    <el-pagination v-if="total > 0" style="margin-top: 16px; justify-content: center" v-model:current-page="pageNum" :page-size="12" :total="total" layout="prev, pager, next" @current-change="loadData" />

    <el-dialog v-model="detailVisible" :title="detailData.title" width="700px">
      <div style="color: #909399; margin-bottom: 12px; font-size: 13px">
        <el-tag :type="categoryTagType[detailData.category]" size="small">{{ detailData.category }}</el-tag>
        <span style="margin-left: 12px">作者：{{ detailData.author }}</span>
        <span style="margin-left: 12px">浏览：{{ detailData.viewCount }}</span>
      </div>
      <el-divider />
      <div style="color: #606266; line-height: 1.8; white-space: pre-wrap">{{ detailData.content }}</div>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { browseKnowledge, getKnowledgeDetail } from '@/api/healthKnowledge'

const categories = ['运动', '饮食', '睡眠', '心理', '疾病预防']
const categoryColors = { '运动': '#ff6b9d', '饮食': '#c084fc', '睡眠': '#7ec8e3', '心理': '#ffd966', '疾病预防': '#98d4bb' }
const categoryTagType = { '运动': 'primary', '饮食': 'danger', '睡眠': 'success', '心理': 'warning', '疾病预防': '' }

const selectedCategory = ref('')
const dataList = ref([])
const pageNum = ref(1)
const total = ref(0)
const detailVisible = ref(false)
const detailData = reactive({ title: '', content: '', category: '', author: '', viewCount: 0 })

const loadData = async () => {
  const res = await browseKnowledge({ pageNum: pageNum.value, pageSize: 12, category: selectedCategory.value || undefined })
  dataList.value = res.data.records; total.value = Number(res.data.total)
}

const showDetail = async (item) => {
  const res = await getKnowledgeDetail(item.id)
  Object.assign(detailData, res.data)
  detailVisible.value = true
}

onMounted(() => loadData())
</script>
