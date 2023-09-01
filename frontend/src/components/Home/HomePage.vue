<template>
  <div class="branch-containers w-100">
    <Branch />
    <Branch />
    <Branch />
    <Branch />
    <Branch />
    <Branch />
    <Branch />
    <Branch />
    <Branch />
    <Branch />
    <Branch />
  </div>
  <CommonModal />
</template>
<script setup>
import Branch from "@/components/Branch/Branch.vue";
import CommonModal from "@/components/common/Modal/CommonModal.vue";
</script>
<style scoped>
.branch-containers{
  margin-top: 60px;
  display: flex;
  justify-content: space-evenly;
  flex-wrap: wrap;
}
</style>
