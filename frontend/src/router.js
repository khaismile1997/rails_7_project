import { createRouter, createWebHistory } from 'vue-router'

import Home from '@/views/HomePage.vue'
import About from "@/views/About.vue";
import Brands from "@/views/Brands.vue";
import Products from "@/views/Products.vue";
const routes = [
  {
    path: '/',
    component: Home
  },
  {
    path: '/brands',
    component: Brands
  },
  {
    path: '/brand/:id',
    component: About
  },
  {
    path: '/products',
    component: Products
  },
  {
    path: '/product/:id',
    component: About
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes: routes
})

export default router
