<template>
  <HeaderPage
    @login="login"
  />
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
  <LoginModal ref="loginRef" />
</template>
<script setup>
import Brand from "@/components/Brand/Brand.vue";
import LoginModal from "@/components/Login/LoginModal.vue";
import HeaderPage from "@/components/Header/HeaderPage.vue";
import { onMounted, ref} from "vue";
import store from "@/store";
const loginRef = ref<typeof LoginModal>(null)

onMounted(() => {
  //check session
  checkSession()
})
const login = () => {
  loginRef.value.show()
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
