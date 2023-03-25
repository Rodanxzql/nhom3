<template>
<div id="space-product">
  <button id="cart-button" type="button" style="width: 20%;" class="btn btn-primary"
          data-bs-toggle="modal" data-bs-target="#staticBackdrop">
          giỏ hàng({{ Totalitem }})
  </button>



    
<table class="table table-hover">
      <thead>
        <th scope="col">Tên</th>
        <th scope="col">Giá</th>
        <th scope="col">Hình ảnh</th>
      </thead>
      <tbody>
        <tr v-for="item in product" :key="item.id">
        
        <td>{{ item.name_product }}</td>
        <td>{{ item.price   }}</td>
        <td><img :src="path + '/upload/' + item.image" alt="image" style=" width: 150px;"  ></td>
        <td style="width: 20%;">
              <input v-model="item.cartqty" class="form-control input-qty" type="number" min="1" placeholder="Số lượng">
               <button style="font-size: 20px;" v-on:click="addToCart(item)" class="btn btn-sm btn-primary">Add to Cart</button>
        </td>
      </tr>
      </tbody>
    </table>
	

<!-- Modal --> 
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
      aria-labelledby="staticBackdropLabel" aria-hidden="true"   >
      <div class="modal-dialog"  >
          <div class="modal-content" style="width: 200%; ">
              <form v-on:submit="onSubmit" >
                
                  <div class="modal-header">
                      <h4 class="modal-title">Giỏ hàng</h4>
                     

                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>

                  <table class="table table-cart" >
                    
                    <thead v-show="cartItems.length > 0">
                      <td>Tên sản phẩm</td>
                      <td>hình ảnh</td>
                      <td>giá</td>
                      <td  style="padding-left: 100px;">số lượng có sẵn</td>
                      
                    </thead>
                    
                    <tbody>      
                    <tr v-for="(item, index) in cartItems" :key="item.id">
                      
                      <td>{{item.name_product}}</td>
                      <td><img :src="path + '/upload/' + item.image" alt="image" style=" width: 150px;"  ></td>
                      <td class="text-right">${{item.price }}</td>
                      <td ><p style="padding-left: 100px;">{{ item.qty }}</p>
                        <p style=" color: red;" v-if="item.cartqty>item.qty">Số lượng vượt mức có sẵn</p></td>

                      <td style="width: 15%;">
                              <input v-model="item.cartqty" class="form-control input-qty" type="number" min="1"> 
                              <button @click="removeItem(index)"><span class="btn btn-danger ">Xóa</span></button>
                      </td>
                      
                    </tr>
                    <tr v-show="cartItems.length === 0">
                           <h4 colspan="4" class="text-center">Giỏ hàng trống</h4>
                        </tr>
                  </tbody>
                  </table>
                  
                  <div v-show="cartItems.length > 0">
                    <h4 class="modal-title">Thông tin khách hàng</h4>
                    <div class="form-group" >
                        <label>Tên:</label>
                          <input  class="form-control" type="text" v-model="Ten" required style="width: 25%;">
                      </div>
                      <div class="form-group"  >
                        <label>Địa chỉ:</label>
                        <input  class="form-control" type="text" v-model="Diachi" required style="width: 25%;">
                      </div>
                  </div>
                
                  <div class="modal-footer footer" >
                    <h2 v-show="cartItems.length > 0">tổng: {{ Total }}</h2>
                      <div class="control">
                          <button v-show="cartItems.length > 0" class="btn btn-primary" >thêm</button>
                      </div>
                      <div class="control">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                      </div>
                  </div>
              </form>
          </div>
      </div>
  </div>
</div>


  
</template>
<script>

import axios from 'axios';



export default {
    data(){
      return{
        product:[],
        cartItems:[],
        name_product:"",
        price:"",
        cat_id:"",
        image:"",
        productid:"",
        path: 'http://localhost:8000',
        previewImage : null,
        FILE:null,
        file:'',
        total:'',
        cartqty:'',
        Ten:'',
        Diachi:'',

    

        selectedOption:null,

      };
    },

    computed:{
      Total(){
        let total = 0;
        this.cartItems.forEach(item =>{
          total +=(item.price *item.cartqty);
        });
        return total;
      },
      Totalitem(){
        return this.cartItems.reduce((accumulator, item)=>{
          return accumulator + item.cartqty;
        },0)
      },
    },
    
    created() {
    this.getProducts();
    },

  methods: {
    addToCart(itemToAdd){

      let itemInCart = this.cartItems.filter(item => item.id===itemToAdd.id);
      let isItemInCart = itemInCart.length > 0;
      if(isItemInCart === false){
        this.cartItems.push(itemToAdd);
      }else{
        itemInCart[0].cartqty += itemToAdd.cartqty
      }
    },
    removeItem(index){
      index.preventDefault;
      this.cartItems.splice(index,1);
    },

    
    async onSubmit(){
      var  data1;
      var data2;
      for(var i =0; i<this.cartItems.length;i++){
        
      
      data1=['Sản phẩm: ',this.cartItems[i].name_product,'số lượng: ', this.cartItems[i].cartqty];
      data2 = data2 + data1;
      }
      
      const data ={
       data: data2,
       Total: this.Total,
       Ten: this.Ten,
       Diachi: this.Diachi
      }
      
      axios.post('http://localhost:8000/api/bills',data,{
      }).then((res)=>{
        console.log(res)
      })
    },



    // Get All Products
    async getProducts() {
      try {
        const response = await axios.get("http://localhost:8000/api/products");
        this.product = response.data;
      } catch (err) {
        console.log(err);
      }
    },


  },
};
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Work+Sans:wght@300;400;500;600;700&display=swap');
#space-product{
  padding-top: 150px;
  font-size: x-large;
  
}
#space-product #cart-button{
  padding-bottom: 20px;

}
#staticBackdrop{
  padding-right: 500px;
}
</style>


