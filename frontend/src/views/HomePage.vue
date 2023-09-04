<template>
  <div class="branch-containers w-100">
    <Brand
      v-for="brand in brands"
      :key="brand.id"
    />
  </div>
</template>
<script setup>
import Brand from "@/components/Brand/Brand.vue";
import {ref} from "vue";
import {useBrandsStore} from "@/store/brands";
const brandsStore = useBrandsStore()
const brands = ref(brandsStore.getBrands)

</script>
<style scoped>
.branch-containers{
  margin-top: 60px;
  display: flex;
  justify-content: space-evenly;
  flex-wrap: wrap;
}
</style>
