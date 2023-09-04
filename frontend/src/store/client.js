import axios from "axios";
import {defineStore} from "pinia";
import {computed, ref} from "vue";
const BASE_URL = "http://localhost:3001/api/v1";

export const useClientStore = defineStore('clientStore',() => {
  const clients = ref([])

  const getClients = computed(() => {
    return clients.value
  })

  const fetchingClientData =  async () => {
    return new Promise((resolve) => {
      axios.get(`${BASE_URL}/clients`)
          .then((res) => {
            console.log('res', res)
            resolve(res)
          })
          .catch((err) => {
            console.log('err')
          })
    })
  }
  const createClientData =  async (payload) => {
    return new Promise((resolve) => {
      axios.post(`${BASE_URL}/clients`, payload)
          .then((res) => {
            console.log('res', res)
            resolve(res)
          })
          .catch((err) => {
            console.log('err')
          })
    })
  }
  const updateClientData =  async (payload) => {
    return new Promise((resolve) => {
      axios.put(`${BASE_URL}/clients/${payload.id}`, payload)
          .then((res) => {
            console.log('res', res)
            resolve(res)
          })
          .catch((err) => {
            console.log('err')
          })
    })
  }

  const deleteClient =  async (payload) => {
    return new Promise((resolve) => {
      axios.delete(`${BASE_URL}/clients/${payload.id}`)
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
    getClients,
    fetchingClientData,
    createClientData,
    updateClientData,
    deleteClient
  }
})
