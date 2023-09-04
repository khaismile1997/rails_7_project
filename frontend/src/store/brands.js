import axios from "axios";
import {defineStore} from "pinia";
import {computed, ref} from "vue";
const BASE_URL = "http://localhost:3001/api/v1";

export const useBrandsStore = defineStore('brandsStore',() => {
  const brands = ref([])

  const getBrands = computed(() => {
    return brands.value
  })

  const fetchingBrandsData =  async () => {
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

  return {
    getBrands,
    fetchingBrandsData
  }
})
