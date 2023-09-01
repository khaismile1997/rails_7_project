<template>
  <v-dialog
    v-model="isShow"
    class="dialog"
    width="800"
  >
    <slot>
      <div class="white">
        Body content
      </div>
    </slot>
  </v-dialog>
</template>

<script setup>
import {ref} from "vue";
const isShow = ref(false)
</script>
<style scoped>

</style>
