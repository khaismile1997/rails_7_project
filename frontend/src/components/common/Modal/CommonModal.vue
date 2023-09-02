<template>
  <v-dialog
    v-model="isShow"
    class="dialog"
    width="800"
  >
    <v-card
      width="800"
    >
      <slot name="body" />
    </v-card>
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
<style lang="scss" scoped>
:deep(.v-card){
  padding: 40px;
}
</style>
