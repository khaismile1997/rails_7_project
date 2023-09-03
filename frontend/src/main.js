import { createApp } from "vue";
import App from "./App.vue";
import store from "./store";
import Router from "@/router";
import mitt from "mitt";
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
app.use(store)
    .use(Router)
    .use(vuetify)
    .mount('#app')
