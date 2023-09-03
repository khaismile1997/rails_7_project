import { createApp } from "vue";
import App from "./App.vue";
import store from "./store";
import Router from "@/router";
// Vuetify
import 'vuetify/styles'
import { createVuetify } from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'
import '@mdi/font/css/materialdesignicons.css'
const vuetify = createVuetify({
  components,
  directives,
})

createApp(App)
    .use(store)
    .use(Router)
    .use(vuetify)
    .mount('#app')
