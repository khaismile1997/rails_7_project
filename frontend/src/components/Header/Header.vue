<template>
  <div class="header-container">
    <v-btn class="login-btn mr-2 bg-primary">Login</v-btn>
    <v-btn>Sign up</v-btn>
  </div>
</template>
<script>
export default {
  name: "Header"
}
</script>
<style scoped>
.header-container{
  display: flex;
  justify-content: end;
  padding: 20px;
  background-color: #94b3ea;
}
</style>
