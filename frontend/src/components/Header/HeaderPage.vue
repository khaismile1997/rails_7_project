<template>
  <div class="header-container">
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
</template>
<script setup>
const emits = defineEmits(['login', 'signUp'])
const login = () => {
  emits('login')
}

const signUp = () => {
  emits('signUp')
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
