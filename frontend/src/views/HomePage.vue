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
</template>
<script setup>
import Brand from "@/components/Brand/Brand.vue";
import { onMounted} from "vue";
import store from "@/store";

onMounted(() => {
  checkSession()
})

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
