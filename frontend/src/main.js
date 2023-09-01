import { createApp } from "vue";
import App from "./App.vue";
import store from "./store";
import Router from "@/router";
// Vuetify
import 'vuetify/styles'
import { createVuetify } from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'

/**
 * Load JWT from Local Storage on Refresh.
 */
let localAuthToken = localStorage.auth_token;
let cookieExists = localAuthToken !== "undefined" && localAuthToken !== null;
if (cookieExists) {
  const auth_token = localStorage.getItem("auth_token");
  const authTokenExists = auth_token !== "undefined" && auth_token !== null;
  if (authTokenExists) {
    store.dispatch("loginUserWithToken", { auth_token });
  }
}

const vuetify = createVuetify({
  components,
  directives,
})

createApp(App).use(store).use(Router).use(vuetify).mount('#app')
