<template>
  <div class="brand d-flex flex-column justify-content-center align-content-center">
    <div class="logo">
      <img
        class="w-100 h-100"
        src="https://amis.misa.vn/wp-content/uploads/2022/10/y-nghia-logo-cua-nike-1.jpg"
      >
    </div>
    <div class="name">
      Nike
    </div>
  </div>
</template>
<script setup>

const props = defineProps(['brand'])

</script>

<style lang="scss" scoped>
.brand{
  margin: 30px 60px;
  width: 100px;
  height: 100px;
  border-radius: 8px;
  padding: 5px;
  box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
  cursor: pointer;
}
</style>
