import axios from "axios";
import {defineStore} from "pinia";
import {computed, ref} from "vue";
const BASE_URL = "http://localhost:3001/api/v1";

export const useBrandStore = defineStore('brandStore',() => {
  const brands = ref([])

  const getBrands = computed(() => {
    return brands.value
  })

  const fetchingBrandData =  async () => {
    return new Promise((resolve) => {
      axios.get(`${BASE_URL}/brands`)
          .then((res) => {
            console.log('res', res)
            resolve(res)
          })
          .catch((err) => {
            console.log('err')
          })
    })
  }
  const createBrandData =  async (payload) => {
    return new Promise((resolve) => {
      axios.post(`${BASE_URL}/brands`, payload)
          .then((res) => {
            console.log('res', res)
            resolve(res)
          })
          .catch((err) => {
            console.log('err')
          })
    })
  }
  const updateBrandData =  async (payload) => {
    return new Promise((resolve) => {
      axios.put(`${BASE_URL}/brands/${payload.id}`, payload)
          .then((res) => {
            console.log('res', res)
            resolve(res)
          })
          .catch((err) => {
            console.log('err')
          })
    })
  }

  const deleteBrand =  async (payload) => {
    return new Promise((resolve) => {
      axios.delete(`${BASE_URL}/brands/${payload.id}`)
          .then((res) => {
            console.log('res', res)
            resolve(res)
          })
          .catch((err) => {
            console.log('err')
          })
    })
  }

  return {
    getBrands,
    fetchingBrandData,
    createBrandData,
    updateBrandData,
    deleteBrand
  }
})
