<template>
  <button type="button" class="btn btn-primary"
          data-bs-toggle="modal" data-bs-target="#staticBackdrop">
          Thêm sản phẩm
  </button>
    <table class="table table-hover">
      <thead>
        <th scope="col">Tên</th>
        <th scope="col">Giá</th>
        <th scope="col">Số lượng</th>
        <th scope="col">Hình ảnh</th>
      </thead>
      <tbody>
        <tr v-for="item in product" :key="item.id">
        
        <td>{{ item.name_product }}</td>
        <td>{{ item.price }}</td>
        <td>{{ item.qty }}</td>
        <td><img :src="path + '/upload/' + item.image" alt="image" style=" width: 150px;"  ></td>
        <td class="has-text-centered">
            
            <a class="btn btn-danger "
              @click="deleteProduct(item.id)"
              >xóa</a>
              <button  type="button" class="btn btn-primary"
                      data-bs-toggle="modal" data-bs-target="#staticBackdrop-edit"
                      @click="takeID(item.id)">
                      Cập nhật
              </button>
          </td>
      </tr>
      </tbody>
    </table>

    <!-- Add Modal HTML -->
  <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
      aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog">
          <div class="modal-content">
              <form v-on:submit="onSubmit" >
                  <div class="modal-header">
                      <h4 class="modal-title">Thêm sản phẩm</h4>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                      <div class="form-group">
                          <label>Tên sản phẩm:</label>
                          <input type="text" class="form-control" v-model="name_product" required>
                      </div>
                      <div class="form-group">
                          <label>giá:</label>
                          <input type="text" class="form-control" v-model="price" required>
                      </div>
                      <div class="form-group">
                          <label>loại sản phẩm:</label>
                          <select id="cat_id" class="form-select" aria-label="Default select example" v-model="cat_id">
                            <option v-for="item in category" :value="item.id" >{{item.cat_name}}</option>
                          </select>
                      </div>
                      <div class="form-group" >
                        <label>Số lượng:</label>
                          <input  class="form-control" type="number" v-model="qty" required>
                      </div>
                      <div class="form-group">
                        <label>preview</label>
                        <img :src="previewImage" style=" width: 150px;">
                      </div>
                      <div class="form-group">
                          <label>Ảnh</label>
                          <input ref="file" class="form-control" type="file" accept="image/*" v-on:input="pickFile" v-on:change="fileUpload"  >
                      </div>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                      <div class="control">
                          <button class="btn btn-primary" >thêm</button>
                      </div>
                  </div>
              </form>
          </div>
      </div>
  </div>
<!-- Edit Modal HTML -->
<div class="modal fade" id="staticBackdrop-edit" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
      aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog">
          <div class="modal-content">
              <form v-on:submit="onSubmitupdate">
                  <div class="modal-header">
                      <h4 class="modal-title">Sửa sản phẩm</h4>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="form-group">
                          <label>Tên sản phẩm:</label>
                          <input type="text" class="form-control" v-model="name_product" required>
                      </div>
                      <div class="form-group">
                          <label>giá:</label>
                          <input type="text" class="form-control" v-model="price" required>
                      </div>
                      <div class="form-group">
                          <label>loại sản phẩm:</label>
                          <select id="cat_id" class="form-select" aria-label="Default select example" v-model="cat_id">
                            <option v-for="item in category" :value="item.id" >{{item.cat_name}}</option>
                          </select>
                      </div>
                      <div class="form-group" >
                        <label>Số lượng:</label>
                          <input  class="form-control" type="number" v-model="qty" required>
                      </div>
                      <div class="form-group">
                          <label>Ảnh</label>
                          <input type="file" class="form-control" v-on:change="fileUpload">
                      </div>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                      <div class="control">
                          <button class="btn btn-primary">Sửa</button>
                      </div>
                  </div>
              </form>
          </div>
      </div>
  </div>


  

  </template>



<script > 

import axios from 'axios';


export default {
    data(){
      return{
        name:'',
        product:[],
        category:[],
        name_product:"",
        price:"",
        qty:"",
        cat_id:"",
        image:"",
        productid:"",
        path: 'http://localhost:8000',
        previewImage : null,
        FILE:null,
        file:'',
        
      };
    },

    created() {
    this.getProducts();
    this.getCategory();
    
  },

 
  methods: {
  
    async selectImage(){
      this.$refs.file.click()
    },
    async pickFile(){
      let input = this.$refs.file
      let file = input.files
      if(file && file[0]){
        let reader = new FileReader
        reader.onload = e =>{
          this.previewImage = e.target.result
        }
        reader.readAsDataURL(file[0])
        this.$emit('input',file[0])
      }
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
    // Delete Product
    async deleteProduct(id) {
      try {
        await axios.delete(`http://localhost:8000/api/products/${id}`);
        this.getProducts();
      } catch (err) {
        console.log(err);
      }
    },
    // Create New product
    fileUpload(e){
      this.FILE = e.target.files[0]
    },
    onSubmit(){
      const formData = new FormData()
      formData.append('image',this.FILE, this.FILE.name)
      formData.append('name_product', this.name_product)
      formData.append('price', this.price)
      formData.append('qty', this.qty)
      formData.append('cat_id', this.cat_id)
      axios.post('http://localhost:8000/api/products',formData,{
      }).then((res)=>{
        console.log(res)
      })
    },  
    //update product
    async takeID(id){
      this.productid = id;
    },
    
    onSubmitupdate(){
      const formData = new FormData()
      formData.append('image',this.FILE, this.FILE.name)
      formData.append('name_product', this.name_product)
      formData.append('price', this.price)
      formData.append('qty', this.qty)
      formData.append('cat_id', this.cat_id)
      axios.put(`http://localhost:8000/api/products/${this.productid}`,formData,{
      }).then((res)=>{
        console.log(res)
      })
    },  

          // Get All category
          async getCategory() {
        try {
          const response = await axios.get("http://localhost:8000/api/category");
          this.category = response.data;
        } catch (err) {
          console.log(err);
        }
      },
  },
 
};
</script>

