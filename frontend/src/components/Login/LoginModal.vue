<template>
  <CommonModal ref="modal">
    <template #body>
      <div class="modal-container">
        <div class="title">
          <div>Login</div>
        </div>
        <div class="style-text email">Email</div>
        <v-text-field
          v-model="loginInfo.user.email"
          label="Email"
          placeholder="johndoe@gmail.com"
          type="email"
        />
        <div class="style-text password">Password</div>
        <v-text-field
          v-model="loginInfo.user.password"
          label="Password"
          type="password"
        />
        <div class="sign-up-btn">
          <v-btn class="bg-primary" variant="outlined" @click.prevent="login">
            Login
          </v-btn>
          <v-btn class="ml-2" @click="signUp"> Sign up </v-btn>
        </div>
      </div>
    </template>
  </CommonModal>
</template>

<script setup>
import CommonModal from "@/components/common/Modal/CommonModal.vue";
import { reactive, ref } from "vue";
import { useSessionStore } from "@/store/sessionManager";
const store = useSessionStore();
const modal = ref();
const emits = defineEmits(["signUp"]);
const loginInfo = reactive({
  user: {
    email: "",
    password: "",
  },
});

const show = () => {
  modal.value.show();
};

const hide = () => {
  loginInfo.user = {
    email: "",
    password: "",
  };
  modal.value.hide();
};

const login = () => {
  store.loginUser(loginInfo);
};
const signUp = () => {
  emits("signUp");
  hide();
};

defineExpose({
  show,
  hide,
});
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

.style-text {
  color: cornflowerblue;
  margin-bottom: 2px;
  font-weight: bold;
  font-size: 16px;
}

.sign-up-btn {
  display: flex;
  justify-content: center;
}
</style>
