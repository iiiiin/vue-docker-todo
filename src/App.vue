<script setup>

import { ref, onMounted } from 'vue'
import TodoItem from './components/TodoItem.vue'
import axios from 'axios'

const todos = ref([])
const newText = ref('')

// 초기 데이터 로드
onMounted(async () => {
  const res = await axios.get('/api/todos/')
  todos.value = res.data
})

async function addTodo() {
  if (!newText.value.trim()) return
  const res = await axios.post('/api/todos', {
    text: newText.value.trim(),
    completed: false
  })
  todos.value.push(res.data)
  newText.value = ''
}

async function toggleTodo(id) {
  const t = todos.value.find(t => t.id === id)
  if (!t) return
  const res = await axios.patch(`/api/todos/${id}`, {
    completed: !t.completed
  })
  t.completed = res.data.completed
}
async function removeTodo(id) {
  await axios.delete(`/api/todos/${id}`)
  todos.value = todos.value.filter(t => t.id !== id)
}

</script>

<template>
  <div class="todo-app">
  <h1>Vue Docker To-Do</h1>
  <div class="input-area">
    <input v-model="newText" @keyup.enter="addTodo" placeholder="할 일을 입력하세요" />
    <button @click="addTodo">추가</button>
  </div>
  <ul>
    <TodoItem
      v-for="t in todos"
      :key="t.id"
      :todo="t"
      @toggle="toggleTodo"
      @remove="removeTodo"
    />
  </ul>
</div>
</template>

<style scoped>
.todo-app {
  max-width: 400px;
  margin: 2rem auto;
  background: #fff;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  font-family: system-ui, sans-serif;
}

/* 헤더 */
.todo-app h1 {
  background-color: #1e3a8a;
  color: #fff;
  margin: 0;
  padding: 1rem;
  text-align: center;
  font-size: 1.5rem;
}

/* 입력 영역 */
.input-area {
  display: flex;
  gap: 0.5rem;
  padding: 1rem;
  background: #f9fafb;
}
.input-area input {
  flex: 1;
  padding: 0.5rem 1rem;
  border: 1px solid #d1d5db;
  border-radius: 6px;
  font-size: 1rem;
}
.input-area button {
  padding: 0.5rem 1rem;
  background-color: #3b82f6;
  color: #fff;
  border: none;
  border-radius: 6px;
  font-size: 1rem;
  cursor: pointer;
  transition: background-color 0.2s;
}
.input-area button:hover {
  background-color: #2563eb;
}

/* 리스트 */
ul {
  list-style: none;
  margin: 0;
  padding: 0;
}
li {
  display: flex;
  align-items: center;
  padding: 0.75rem 1rem;
  border-bottom: 1px solid #e5e7eb;
}
li:last-child {
  border-bottom: none;
}
li input[type="checkbox"] {
  width: 1.2rem;
  height: 1.2rem;
  accent-color: #3b82f6;
}
li span {
  flex: 1;
  margin: 0 0.75rem;
  font-size: 1rem;
}
li.completed span {
  text-decoration: line-through;
  color: #9ca3af;
}

/* 삭제 버튼 */
li button {
  background: none;
  border: none;
  font-size: 1.2rem;
  color: #9ca3af;
  cursor: pointer;
  transition: color 0.2s;
}
li button:hover {
  color: #ef4444;
}
</style>
