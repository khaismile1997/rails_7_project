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
import {useBrandsStore} from "@/store/brands";
import {onMounted, ref} from "vue";
const store = useBrandsStore()
const brands = ref(store.getBrands)

onMounted(() => {
  store.fetchingBrandsData()
})

</script>
<style scoped>
.branch-containers{
  margin-top: 60px;
  display: flex;
  justify-content: space-evenly;
  flex-wrap: wrap;
}
</style>
