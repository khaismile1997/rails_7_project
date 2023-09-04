<template>
  <div class="header-container">
    <div class="sidebar">
      <SideBar />
    </div>
    <div v-if="isLogged">
      <user-avatar :user="user" />
    </div>
    <div
      v-else
      class="btn-group"
    >
      <v-btn
        class="login-btn mr-2 bg-primary"
        @click="login"
      >
        Login
      </v-btn>
      <v-btn @click="signUp">
        Sign up
      </v-btn>
    </div>
    <LoginModal
      ref="loginModalRef"
      @sign-up="signUp"
    />
    <SignUpModal
      ref="singUpModalRef"
      @login="login"
    />
  </div>
  <vue-basic-alert
    ref="alert"
    :close-in="1500"
  />
</template>
<script setup>
import SideBar from "@/components/common/SideBar/SideBar.vue";
import UserAvatar from "@/components/common/Avatar/UserAvatar.vue";
import {inject, onMounted, onUnmounted, ref} from "vue";
import SignUpModal from "@/components/Login/SignUpModal.vue";
import LoginModal from "@/components/Login/LoginModal.vue";
import {useSessionStore} from "@/store/sessionManager";
const emitter = inject('emitter');
const isLogged = ref(false)
const loginModalRef = ref(null)
const singUpModalRef = ref(null)
const alert = ref(null)
const store = useSessionStore()
const user = ref ({
   initials: 'WM',
   fullName: 'Windy Mai',
   email: 'windy_mai@gmail.com',
})
const loginUserWithToken = () => {
  let localAuthToken = localStorage.auth_token;
  let cookieExists = localAuthToken !== "undefined" && localAuthToken !== null;
  if (cookieExists) {
    const auth_token = localStorage.getItem("auth_token");
    const authTokenExists = auth_token !== "undefined" && auth_token !== null;
    if (authTokenExists) {
      store.loginUserWithToken({auth_token});
    }
  }
}

onMounted(() => {
  emitter.on('registerUserSuccess', () => registerUserSuccess())
  emitter.on('registerUserFailed', () => registerUserFailed())
  emitter.on('loginSuccess', (res) => loginSuccess(res))
  emitter.on('loginFailed', () => loginFailed())
  emitter.on('logOut', () => logOut())
})

onUnmounted(() => {
  emitter.off('registerUserSuccess')
  emitter.off('registerUserFailed')
  emitter.off('loginSuccess')
  emitter.off('loginFailed')
})
const login = () => {
  loginModalRef.value.show()
}

const updateUserInfo = (info) => {
  user.value.email = info.email
  user.value.fullName = info.email.slice(0, info.email.indexOf('@'));
  user.value.initials = info.email.slice(0,2)
}

const loginSuccess = (res) => {
  updateUserInfo(res.user)
  alert.value.showAlert(
    'success',
    'Login Success.'
  )
  isLogged.value = true
  loginModalRef.value.hide()
}
const loginFailed = () => {
  alert.value.showAlert(
    'error',
    'Invalid Email or password',
    'Login Failed.'
  )
  isLogged.value = false
}

const logOut = () => {
  isLogged.value = false
}

//sign up
const signUp = () => {
  singUpModalRef.value.show()
}
const registerUserSuccess = () => {
  alert.value.showAlert(
    'success',
    'Register Success.'
  )
}
const registerUserFailed = () => {
  alert.value.showAlert(
    'error',
    'Register Failed.'
  )
}

</script>
<style lang="scss" scoped>
.header-container{
  position: relative;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 20px;
  background-color: #94b3ea;
}

:deep(.v-container--fluid){
  height: auto !important;
}
</style>
