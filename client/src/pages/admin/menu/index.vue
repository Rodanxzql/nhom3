<template>
    <button type="button" class="btn btn-primary"
            data-bs-toggle="modal" data-bs-target="#staticBackdrop">
            Thêm phân loại
    </button>
      <table class="table table-hover">
        <thead>
          <th scope="col">Tên</th>
        </thead>
        <tbody>
          <tr v-for="item in category" :key="item.id">
          <td><router-link id="link" :to="`/cateinfor/${item.id}`">{{ item.cat_name }}</router-link></td>
          <td class="has-text-centered">
              <a class="btn btn-danger "
                @click="deleteCategory(item.id)"
                >xóa</a>
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
                        <h4 class="modal-title">Thêm phân loại</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Tên sản phẩm:</label>
                            <input type="text" class="form-control" v-model="cat_name" required>
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

  
    
  
</template>
  
  
  
<script > 
  
  import axios from 'axios';
  
  
  export default {
      data(){
        return{
          name:'',
          category:[],
          cat_name:"",
          
        };
      },
  
      created() {
      this.getCategory();
    },
  
   
    methods: {
    

      // Get All category
      async getCategory() {
        try {
          const response = await axios.get("http://localhost:8000/api/category");
          this.category = response.data;
        } catch (err) {
          console.log(err);
        }
      },
      // Delete category
      async deleteCategory(id) {
        try {
          await axios.delete(`http://localhost:8000/api/category/${id}`);
          this.getCategory();
        } catch (err) {
          console.log(err);
        }
      },
      
      async onSubmit(){
        const data = {
            cat_name:this.cat_name
        }
        axios.post('http://localhost:8000/api/category',data,{
        }).then((res)=>{
          console.log(res)
        })
      },  

 
    },
   
  };
</script>
  
<style>
#link:link, #link:visited{
    background-color: #a79c9c;
  color: white;
  padding: 14px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  width: 150px;
}
#link:hover, #link:active{
    background-color: rgb(178, 216, 201);
}

</style>