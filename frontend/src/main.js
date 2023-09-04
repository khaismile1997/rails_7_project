import { createApp } from "vue";
import App from "./App.vue";
import Router from "@/router";
import { createPinia } from 'pinia'
import mitt from "mitt";
import VueBasicAlert from 'vue-basic-alert'
const pinia = createPinia()
const emitter = mitt()
// Vuetify
import 'vuetify/styles'
import { createVuetify } from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'
import '@mdi/font/css/materialdesignicons.css'
//
const vuetify = createVuetify({
  components,
  directives,
})
const app = createApp(App)
app.provide('emitter', emitter);
app.use(Router)
    .use(pinia)
    .use(VueBasicAlert)
    .use(vuetify)
    .mount('#app')
