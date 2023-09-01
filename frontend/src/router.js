import { createRouter, createWebHistory } from 'vue-router'

import Home from '@/components/Home/HomePage.vue'
import About from "@/views/About.vue";
const routes = [
  {
    path: '/',
    component: Home
  },
  {
    path: '/brands',
    component: About
  },
  {
    path: '/brand/:id',
    component: About
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes: routes
})

export default router
