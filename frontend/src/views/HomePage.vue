<template>
  <div class="branch-containers w-100">
    <Brand />
    <Brand />
    <Brand />
    <Brand />
  </div>
</template>
<script setup>
import Brand from "@/components/Brand/Brand.vue";


</script>
<style scoped>
.branch-containers{
  margin-top: 60px;
  display: flex;
  justify-content: space-evenly;
  flex-wrap: wrap;
}
</style>
