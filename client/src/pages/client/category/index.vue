<template>
    <section id="collection" class="py-5" style="margin-top: 150px;">
      <div class="container">
  
        <div class="title text-center" v-show="product.length > 0">
          <h2 class="position-relative d-inline-block">DANH MỤC SẢN PHẨM</h2>
        </div>
        <div class="title text-center" v-show="product.length === 0">
          <h2 class="position-relative d-inline-block">TẠM THỜI HẾT SẢN PHẨM</h2>
        </div>
        
        <div class="row g-0 ">
          <div class="collection-list mt-4 row gx-0 gy-3">
  
            <div class="col-md-6 col-lg-4 col-xl-3 p-2 best" v-for="item in product" :key="item.id">
              <div class="collection-img position-relative">
                <img :src="path + '/upload/' + item.image" alt="image" style=" width: 250px;"  >
              </div>
              <div class="text-center" style="padding-right: 10px;">
                <p class="text-capitalize mt-3 mb-1">{{ item.name_product }}</p>
                <span class="fw-bold d-block">Giá: {{ item.price }}</span>
                <p class="card-text">
                <span class="fw-bold d-block">Số lượng: {{ item.qty }}</span>
                </p>
                
              </div>
  
            </div>
  
          </div>
        </div>
      </div>
    </section>
</template>
<script>
import axios from 'axios';


export default{
    data(){
        return{
            product:[],
            path: 'http://localhost:8000',

        };
    },
    
    created(){
        this.getProduct();
    },
    methods: {
        
        async getProduct(id) {
        try {
          const response = await axios.get(`http://localhost:8000/api/catproducts/${this.$route.params.id}`);
          this.product = response.data;
        } catch (err) {
          console.log(err);
        }
      },
    }
}
</script>