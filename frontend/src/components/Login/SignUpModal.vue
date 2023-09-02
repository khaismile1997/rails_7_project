
<template>
  <CommonModal ref="modal">
    <template #body>
      <div class="modal-container">
        <div class="title">
          <div>
            Create Sign Up
          </div>
        </div>
        <div class="style-text email">
          Email
        </div>
        <v-text-field label="Email" />
        <div class="style-text password">
          Password
        </div>
        <v-text-field label="Password" />
        <div class="sign-up-btn">
          <v-btn
            variant="outlined"
          >
            Sign Up
          </v-btn>
          <v-btn
            class="ml-2"
            @click="login"
          >
            Login
          </v-btn>
        </div>
      </div>
    </template>
  </CommonModal>
</template>

<script setup>
import CommonModal from "@/components/common/Modal/CommonModal.vue";
import {ref} from "vue";
const modal = ref()
const emits = defineEmits(['login'])

const show  = () => {
  modal.value.show()
}

const hide = () => {
  modal.value.hide()
}
const login = () => {
  emits('Login')
  hide()
}

defineExpose({
  show
})


</script>

<style lang="scss" scoped>
.title {
  width: 100%;
  display: flex;
  justify-content: center;
  font-size: 20px;
  font-weight: bolder;
  color: #94b3ea;
}

.style-text{
  color: cornflowerblue;
  margin-bottom: 2px;
  font-weight: bold;
  font-size: 16px;
}

.sign-up-btn{
  display: flex;
  justify-content: center;
}
</style>
