<template>
  <div id="app">
    <HeaderPage />
    <router-view />
  </div>
</template>

<script>
import HeaderPage from "@/components/Header/HeaderPage.vue";

export default {
  name: "App",
  components: {HeaderPage}
};
</script>
