import { createRouter, createWebHistory } from 'vue-router'

import Home from '@/views/HomePage.vue'
import About from "@/views/About.vue";
import ClientManagement from "@/views/ClientManagement.vue";
import BrandManagement from "@/views/BrandManagement.vue";
import ProductManagement from "@/views/ProductManagement.vue";
const routes = [
  {
    path: '/',
    component: Home
  },
  {
    path: '/brands',
    component: BrandManagement
  },
  {
    path: '/brand/:id',
    component: About
  },
  {
    path: '/products',
    component: ProductManagement
  },
  {
    path: '/product/:id',
    component: About
  },
  {
    path: '/clients',
    component:ClientManagement
  },
  {
    path: '/client/:id',
    component: About
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes: routes
})

export default router
