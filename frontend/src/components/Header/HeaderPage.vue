<template>
  <div class="header-container">
    <div class="sidebar">
      <SideBar />
    </div>
    <div v-if="isLogged">
      <user-avatar />
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
</template>
<script setup>
import SideBar from "@/components/common/SideBar/SideBar.vue";
import UserAvatar from "@/components/common/Avatar/UserAvatar.vue";
import {inject, ref} from "vue";
import SignUpModal from "@/components/Login/SignUpModal.vue";
import LoginModal from "@/components/Login/LoginModal.vue";
const emitter = inject('emitter');
const isLogged = ref(false)
const loginModalRef = ref(null)
const singUpModalRef = ref(null)
const login = () => {
  loginModalRef.value.show()
}
//sign up
const signUp = () => {
  singUpModalRef.value.show()
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
