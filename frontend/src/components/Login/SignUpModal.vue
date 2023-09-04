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
        <v-text-field
          v-model="signUpInfo.user.email"
          placeholder="johndoe@gmail.com"
          type="email"
          label="Email"
        />
        <div class="style-text password">
          Password
        </div>
        <v-text-field
          v-model="signUpInfo.user.password"
          type="password"
          label="Password"
        />
        <span
          v-if="signUpInfo.user.password.length < 6 && signUpInfo.user.password.length"
          class="text-red"
        >Minimum 6 characters</span>
        <v-text-field
          v-model="signUpInfo.user.password_confirmation"
          type="password"
          label="Password"
        />
        <span
          v-if="signUpInfo.user.password!== signUpInfo.user.password_confirmation && signUpInfo.user.password.length && signUpInfo.user.password_confirmation.length "
          class="text-red"
        >Password is not match!</span>
        <div class="sign-up-btn">
          <v-btn
            :disabled="signUpInfo.user.password.length < 6 || signUpInfo.user.password!== signUpInfo.user.password_confirmation"
            class="bg-primary"
            variant="outlined"
            @click="signUp"
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
import {useSessionStore} from "@/store/sessionManager";
import {reactive, ref} from "vue";
const modal = ref()
const emits = defineEmits(['login'])
const store = useSessionStore()
const signUpInfo = reactive({
  user:{
    password: '',
    email: '',
    password_confirmation: ''
  }
})

const show  = () => {
  modal.value.show()
}

const hide = () => {
  signUpInfo.user = {
    password: '',
    email: '',
    password_confirmation: ''
  }
  modal.value.hide()
}
const login = () => {
  emits('Login')
  hide()
}

const signUp = async () => {
 await store.registerUser(signUpInfo)
 login()
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
