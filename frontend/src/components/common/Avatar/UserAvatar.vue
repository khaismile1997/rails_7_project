<template>
  <v-container
    fluid
    style="height: 300px"
  >
    <v-row justify="center">
      <v-menu
        min-width="200px"
        rounded
      >
        <template #activator="{ props }">
          <v-btn
            icon
            v-bind="props"
          >
            <v-avatar
              color="brown"
              size="large"
            >
              <span class="text-h5">{{ user.initials }}</span>
            </v-avatar>
          </v-btn>
        </template>
        <v-card>
          <v-card-text>
            <div class="mx-auto text-center">
              <v-avatar
                color="brown"
              >
                <span class="text-h5">{{ user.initials }}</span>
              </v-avatar>
              <h3>{{ user.fullName }}</h3>
              <p class="text-caption mt-1">
                {{ user.email }}
              </p>
              <v-divider class="my-3" />
              <v-divider class="my-3" />
              <v-btn
                rounded
                variant="text"
                @click.prevent="logOut"
              >
                Log out
              </v-btn>
            </div>
          </v-card-text>
        </v-card>
      </v-menu>
    </v-row>
  </v-container>
</template>
<script  setup>
import {useSessionStore} from "@/store/sessionManager";
import {onMounted} from "vue";

const props = defineProps(['user'])
const store = useSessionStore()

const logOut = () => {
  store.logoutUser()
}

</script>
