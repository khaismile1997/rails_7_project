import axios from "axios";
import { defineStore } from "pinia";
import { computed, ref } from "vue";
const BASE_URL = "http://localhost:3001/api/v1";

export const useProductStore = defineStore("productStore", () => {
  const products = ref([]);

  const getProducts = computed(() => {
    return products.value;
  });

  const fetchingProductData = async () => {
    return new Promise((resolve) => {
      axios
        .get(`${BASE_URL}/products`)
        .then((res) => {
          console.log("res", res);
          resolve(res);
        })
        .catch((err) => {
          console.log("err");
        });
    });
  };
  const createProductData = async (payload) => {
    return new Promise((resolve) => {
      axios
        .post(`${BASE_URL}/products`, payload)
        .then((res) => {
          console.log("res", res);
          resolve(res);
        })
        .catch((err) => {
          console.log("err");
        });
    });
  };
  const updateProductData = async (payload) => {
    return new Promise((resolve) => {
      axios
        .put(`${BASE_URL}/products/${payload.id}`, payload)
        .then((res) => {
          console.log("res", res);
          resolve(res);
        })
        .catch((err) => {
          console.log("err");
        });
    });
  };

  const deleteProduct = async (payload) => {
    return new Promise((resolve) => {
      axios
        .delete(`${BASE_URL}/products/${payload.id}`)
        .then((res) => {
          console.log("res", res);
          resolve(res);
        })
        .catch((err) => {
          console.log("err");
        });
    });
  };

  return {
    getProducts,
    fetchingProductData,
    createProductData,
    updateProductData,
    deleteProduct,
  };
});
