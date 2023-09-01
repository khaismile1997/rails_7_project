<template>
  <v-dialog
    v-model="isShow"
    class="dialog"
    width="800"
  >
    <slot name="body">
      <div class="white">
        Body content
      </div>
    </slot>
  </v-dialog>
</template>

<script setup>
import {ref} from "vue";
const isShow = ref(false)

const show = () => {
  isShow.value = true
}

const hide = () => {
  isShow.value = false
}

defineExpose({
  show, hide
})

</script>
<style scoped>

</style>
