<template>
  <div class="text-center">
    <div class="d-flex align-content-center justify-content-center">
      <router-link
        to="/"
        class="logo-container"
      >
        <img
          class="logo w-100 h-100"
          src="https://img.freepik.com/free-vector/bird-colorful-logo-gradient-vector_343694-1365.jpg"
        >
      </router-link>
      <div>
        <v-btn
          class="ma-2"
          icon="mdi-menu"
          @click="showSidebar"
        />
      </div>
    </div>
    <div
      :class="{'show' : isShow}"
      class="sidebar-content"
    >
      <div class="mt-8">
        <v-btn
          variant="text"
          class="close-btn"
          icon="mdi-close"
          @click="hideSideBar"
        />
        <div class="menu-item">
          <v-btn
            variant="text"
            icon="mdi-menu"
          /> Menu
        </div>
        <div class="menu-item">
          <v-btn
            variant="text"
            icon="mdi-sale"
            color="blue-lighten-2"
          />
          <router-link
            to="/brands"
            @click="() => hideSideBar()"
          >
            Brand Management
          </router-link>
        </div>
        <div class="menu-item">
          <v-btn
            variant="text"
            icon="mdi-account"
            color="blue-lighten-2"
          />
          <router-link
            to="/brands"
            @click="() => hideSideBar()"
          >
            Client Management
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup>
import { onMounted, ref} from "vue";
const isShow = ref(false)
const hideSideBar = () => {
  isShow.value = false
}

// const getBrand = async () => {
//   const res = await fetch('http://localhost:3001/api/v1/brands')
//   if(!res.ok){
//     console.log('error!!')
//   }
//   console.log(res)
// }

onMounted(() => {
  // getBrand()
})

const showSidebar = () => {
  isShow.value = true
}


</script>

<style lang="scss" scoped>
.sidebar-content {
  height: 100vh;
  width: 250px;
  background-color: white;
  position: absolute;
  top: 0;
  left: 0;
  padding: 10px;
  box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
  display: none;
  z-index: 99;

}

.close-btn{
  position: absolute;
  top: 0;
  right: 0;
}

.menu-item{
  text-align: left;
  font-size: 14px;
  font-weight: bold;
  cursor: pointer;
}

.show{
  display: block;
}

.logo {
  border-radius: 100%;
}

.logo-container{
  cursor: pointer;
  display: inline-block;
  width: 60px;
  height: 60px;
  border: 1px solid #0d5c8a;
  border-radius: 100%;
}
</style>
