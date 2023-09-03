<template>
  <div class="branch-containers w-100">
    <Brand />
    <Brand />
    <Brand />
    <Brand />
    <Brand />
    <Brand />
    <Brand />
    <Brand />
    <Brand />
    <Brand />
    <Brand />
  </div>
  <LoginModal
    ref="loginModalRef"
    @sign-up="signUp"
  />
  <SignUpModal
    ref="singUpModalRef"
    @login="login"
  />
</template>
<script setup>
import Brand from "@/components/Brand/Brand.vue";
import HeaderPage from "@/components/Header/HeaderPage.vue";
import { onMounted, ref} from "vue";
import store from "@/store";
import SignUpModal from "@/components/Login/SignUpModal.vue";
import LoginModal from "@/components/Login/LoginModal.vue";
import SideBar from "@/components/common/SideBar/SideBar.vue";
const loginModalRef = ref(null)
const singUpModalRef = ref(null)
onMounted(() => {
  //check session
  checkSession()
})
const login = () => {
  loginModalRef.value.show()
}
//sign up
const signUp = () => {
  singUpModalRef.value.show()
}

const checkSession = () => {
  let localAuthToken = localStorage.auth_token;
  let cookieExists = localAuthToken !== "undefined" && localAuthToken !== null;
  if (cookieExists) {
    const auth_token = localStorage.getItem("auth_token");
    const authTokenExists = auth_token !== "undefined" && auth_token !== null;
    if (authTokenExists) {
      store.dispatch("loginUserWithToken", { auth_token });
    }
  }

}

</script>
<style scoped>
.branch-containers{
  margin-top: 60px;
  display: flex;
  justify-content: space-evenly;
  flex-wrap: wrap;
}
</style>
