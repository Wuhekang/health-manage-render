<template>
  <router-view />
</template>

<script setup>
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+SC:wght@400;500;700&display=swap');
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
body {
  font-family: 'Noto Sans SC', 'PingFang SC', 'Microsoft YaHei', sans-serif;
}

:root {
  --maid-pink: #ff6b9d;
  --maid-pink-light: #ff8eb3;
  --maid-pink-bg: linear-gradient(135deg, #e8f4f8 0%, #fce4ec 50%, #e8eaf6 100%);
  --maid-bg-color: #f5f0fa;
  --maid-purple: #b06ab3;
  --maid-lavender: #e8d5f5;
  --maid-cream: #fff8f0;
  --maid-blue: #7ec8e3;
  --maid-mint: #98d4bb;
  --maid-yellow: #ffd966;
  --maid-dark: #4a3548;
  --maid-text: #5c3d5e;
  --maid-text-light: #9b7a9e;
  --maid-border: #f3d5e8;
  --maid-card-shadow: 0 4px 16px rgba(255, 107, 157, 0.12);
}

.el-button {
  border-radius: 10px !important;
  font-weight: 500 !important;
  transition: all 0.25s ease !important;
}
.el-button:hover {
  transform: translateY(-1px);
}
.el-button--primary {
  --el-button-bg-color: var(--maid-pink) !important;
  --el-button-border-color: var(--maid-pink) !important;
  --el-button-hover-bg-color: var(--maid-pink-light) !important;
  --el-button-hover-border-color: var(--maid-pink-light) !important;
  box-shadow: 0 3px 12px rgba(255,107,157,0.25) !important;
}
.el-button--success {
  --el-button-bg-color: var(--maid-mint) !important;
  --el-button-border-color: var(--maid-mint) !important;
  box-shadow: 0 3px 12px rgba(152,212,187,0.25) !important;
}
.el-button--danger {
  --el-button-bg-color: #f56c6c !important;
  box-shadow: 0 3px 12px rgba(245,108,108,0.2) !important;
}

.el-menu--horizontal .el-menu-item.is-active {
  border-bottom-color: var(--maid-pink) !important;
  color: var(--maid-pink) !important;
}
.el-pagination .el-pager li.is-active {
  background: var(--maid-pink) !important;
}
.el-tag--primary {
  --el-tag-bg-color: var(--maid-pink-bg) !important;
  --el-tag-border-color: var(--maid-border) !important;
  --el-tag-text-color: var(--maid-pink) !important;
}

.el-card {
  border-radius: 16px !important;
  border: 1px solid var(--maid-border) !important;
  box-shadow: 0 2px 16px rgba(255,107,157,0.06) !important;
  transition: box-shadow 0.3s ease !important;
}
.el-card:hover {
  box-shadow: 0 6px 24px rgba(255,107,157,0.1) !important;
}
.el-card .el-card__header {
  border-bottom: 2px dashed rgba(255,107,157,0.15) !important;
  position: relative;
  background: linear-gradient(135deg, rgba(255,107,157,0.03), rgba(168,216,234,0.04)) !important;
}
.el-card .el-card__header::after {
  content: '🎀';
  position: absolute;
  right: 16px;
  top: 50%;
  transform: translateY(-50%);
  font-size: 14px;
  opacity: 0.3;
}
.el-dialog {
  border-radius: 20px !important;
  overflow: hidden;
}
.el-dialog__header {
  background: linear-gradient(135deg, rgba(255,107,157,0.08), rgba(192,132,252,0.06)) !important;
  border-bottom: 2px dashed rgba(255,107,157,0.12);
  position: relative;
}
.el-dialog__header::before {
  content: '✿';
  position: absolute;
  left: 16px;
  top: 50%;
  transform: translateY(-50%);
  font-size: 16px;
  color: var(--maid-pink);
  opacity: 0.5;
}
.el-input__wrapper, .el-textarea__inner {
  border-radius: 10px !important;
}
.el-table {
  border-radius: 12px !important;
  overflow: hidden;
  --el-table-border-color: var(--maid-border) !important;
}
.el-table th.el-table__cell {
  background: linear-gradient(135deg, rgba(255,107,157,0.06), rgba(168,216,234,0.08)) !important;
  color: var(--maid-text) !important;
  font-weight: 600;
  font-size: 13px;
}
.el-table .el-table__row:hover > td {
  background: rgba(255,107,157,0.04) !important;
}
.el-pagination .el-pager li {
  border-radius: 8px !important;
}
.el-tag {
  border-radius: 20px !important;
}
.el-empty__description p {
  color: var(--maid-text-light) !important;
}
.el-empty__description p::after {
  content: ' (◕ᴗ◕✿)';
}

::-webkit-scrollbar {
  width: 6px;
}
::-webkit-scrollbar-track {
  background: rgba(255,107,157,0.05);
}
::-webkit-scrollbar-thumb {
  background: rgba(255,107,157,0.2);
  border-radius: 3px;
}
::-webkit-scrollbar-thumb:hover {
  background: rgba(255,107,157,0.35);
}
</style>
