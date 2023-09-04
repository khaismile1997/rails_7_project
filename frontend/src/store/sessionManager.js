import {defineStore} from "pinia";
import {computed, inject, ref} from "vue";
import axios from "axios";
const BASE_URL = "http://localhost:3001/api/v1";


export const useSessionStore = defineStore('sessionManager', () => {
  const auth_token = ref(null)
  const user = ref({
    id: null,
    username: null,
    email: null})
  const emitter = inject('emitter')
  const getAuthToken = computed (() => auth_token.value)
  const getUserEmail = computed(() => user.value.email,)
  const getUserId = computed(() =>  user.value.id)
  const isLoggedIn = computed(() => !(auth_token.value === null || auth_token.value === JSON.stringify(null)))
  function registerUser(payload) {
    return new Promise((resolve, reject) => {
      axios
          .post(`${BASE_URL}/auth`, payload)
          .then((response) => {
            emitter.emit('registerUserSuccess')
            setUserInfo(response)
            resolve(response);
          })
          .catch((error) => {
            emitter.emit('registerUserFailed', error)
          });
    });
  }
  function loginUser(payload) {
     return  new Promise((resolve, reject) => {
      axios
          .post(`${BASE_URL}/auth/sign_in`, payload)
          .then((response) => {
            setUserInfo(response)
            emitter.emit('loginSuccess', response.data)
            resolve(response);
          })
          .catch((error) => {
            emitter.emit('loginFailed', error)
          });
    });
  }

  function logoutUser() {
    const config = {
      headers: {
        authorization: auth_token.value,
      },
    };
     new Promise(() => {
      axios
          .delete(`${BASE_URL}/auth/sign_out`, config)
          .then(() => {
            resetUserInfo()
            emitter.emit('logOut')
          })
          .catch((error) => {
            console.log('error', error)
          });
    });
  }

  function loginUserWithToken() {
    const config = {
      headers: {
        Authorization: auth_token.value,
      },
    };
    new Promise((resolve, reject) => {
      axios
          .get(`${BASE_URL}/`, config)
          .then((response) => {
            setUserInfoFromToken(response)
            resolve(response);
          })
          .catch((error) => {
            console.log('error', error)
          });
    });
  }

 function setUserInfo(data) {
   console.log('data', data)
    user.value = data.data.user;
    auth_token.value = data.headers.authorization;
    axios.defaults.headers.common["Authorization"] = data.headers.authorization;
    localStorage.setItem("auth_token", data.headers.authorization);
  }
 function setUserInfoFromToken(data) {
    user.value = data.data.user;
    auth_token.value = localStorage.getItem("auth_token");
  }
 function resetUserInfo() {
    user.value = {
      id: null,
      username: null,
      email: null,
    };
    auth_token.value = null;
    localStorage.removeItem("auth_token");
    axios.defaults.headers.common["Authorization"] = null;
  }

  return {
    auth_token,
    user,
    getAuthToken,
    getUserEmail,
    getUserId,
    isLoggedIn,
    registerUser,
    loginUser,
    logoutUser,
    loginUserWithToken
}
})
