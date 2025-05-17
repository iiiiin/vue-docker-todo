<template>
    <li :class="{ completed: todo.completed }">
      <input type="checkbox" :checked="todo.completed" @change="$emit('toggle', todo.id)" />
      <span>{{ todo.text }}</span>
      <button @click="$emit('remove', todo.id)">❌</button>
    </li>
  </template>
  
  <script setup>
  defineProps({
    todo: Object
  })
  defineEmits(['toggle','remove'])
  </script>
  
  <style scoped>
  .completed span { text-decoration: line-through; color: #999; }
  li { display: flex; align-items: center; gap: 8px; }
  button { background: none; border: none; cursor: pointer; }
  </style>
  