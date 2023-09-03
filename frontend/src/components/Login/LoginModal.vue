
<template>
  <CommonModal ref="modal">
    <template #body>
      <div class="modal-container">
        <div class="title">
          <div>
            Login
          </div>
        </div>
        <div class="style-text email">
          Email
        </div>
        <v-text-field
          v-model="data.email"
          label="Email"
        />
        <div class="style-text password">
          Password
        </div>
        <v-text-field
          v-model="data.password"
          label="Password"
        />
        <div class="sign-up-btn">
          <v-btn
            class="bg-primary"
            variant="outlined"
            @click.prevent="login"
          >
            Login
          </v-btn>
          <v-btn
            class="ml-2"
            @click="signUp"
          >
            Sign up
          </v-btn>
        </div>
      </div>
    </template>
  </CommonModal>
</template>

<script setup>
import CommonModal from "@/components/common/Modal/CommonModal.vue";
import {reactive, ref} from "vue";
const modal = ref()
const emits = defineEmits(['signUp'])
const data = reactive({
  password: '',
  email: ''
})
const show  = () => {
  modal.value.show()
}

const hide = () => {
  modal.value.hide()
}

const login = () => {
  this.registerUser(data);
}
const signUp  = () => {
  emits('signUp')
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
