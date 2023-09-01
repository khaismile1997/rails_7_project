import { createRouter, createWebHistory } from 'vue-router'

import Home from '@/components/Home/Home.vue'
import Login from '@/components/Login/Login.vue'
const routes = [
  {
    path: '/',
    component: Home
  },
  {
    path: '/login',
    component: Login
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes: routes
})

export default router
