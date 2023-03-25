<template>
    <nav class="navbar navbar-expand-lg navbar-light bg-white py-0 fixed-top">
      <div class="container ">
        <router-link :to="{ name: 'homepage' }" class="navbar-brand d-flex justify-content-between align-items-center order-lg-0">
          <img style="width:100px" src="../../../assets/image/logo.jpg" alt="site icon">
          <span class="text-uppercase fw-lighter ms-2">404Bike</span>
        </router-link>
  

  
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
          <span class="navbar-toggler-icon"></span>
        </button>
  
        <div class="collapse navbar-collapse order-lg-1" id="navMenu">
          <ul class="navbar-nav ">
  
            <li class="nav-item px-2 py-2">
                <router-link :to="{ name: 'homepage' }" class="nav-link li" ><i class="fas fa-credit-card"></i> Trang chủ</router-link>
            </li>
            <li class="nav-item px-2 py-2 border-0">
                <router-link :to="{ name: 'Productpage' }" class="nav-link li" ><i class="fas fa-credit-card"></i> Sản phẩm</router-link>
            </li>
            <li class="nav-item px-2 py-2 border-0">
              <a @click="handleButtonClick" class="nav-link  text-dark"><i class="fas fa-credit-card"></i>{{buttonLabel}}</a>
            </li>
            
            
            <li class="nav-item px-2 py-2 border-0">
              <i class="fas fa-credit-card"></i>
              <div class="dropdown">
                <button class="dropbtn">Danh mục</button>
                <div  class="dropdown-content">
                  <a v-for="item in category" :key="item.id" :href="'/category/'+item.id">{{ item.cat_name }}</a>

                </div>
              </div>
            </li>
            <li  v-show="this.buttonLabel =='Đăng xuất'" class="nav-item px-2 py-2 border-0">
              Xin Chào {{ username }}
            </li>
          </ul>
        </div>
      </div>
    </nav>
  
  
    
  </template>

<script>
 import axios from 'axios';


  export default {
      data(){
        return{
          name:'',
          category:[],
          cat_name:"",
          buttonLabel:'Đăng nhập',
          username:""

        };
      },
     
      created() {
      this.getCategory();
    },
    computed: {
    buttonLabel() {
      let user=localStorage.getItem("user-info");
      if (user) {
        this.buttonLabel= 'Đăng xuất'
        this.username = JSON.parse(user).name;
      } else {
        this.buttonLabel = 'Đăng nhập';
      }
      return this.buttonLabel
    },
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
      handleButtonClick()
      {
        if(this.buttonLabel == 'Đăng nhập')
        {
          this.$router.push({ name:'Loginpage'})
        }
        else if((this.buttonLabel == 'Đăng xuất'))
        {
          localStorage.removeItem('user-info')
          this.$router.push({ name:'Loginpage'})
        }
      },

     
 

 
    },
   
  };

</script>


  <style>
/* Style The Dropdown Button */
.dropbtn {
  background-color: #ffffff;
  color: #595959;
  padding: 8px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #f1f1f1}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
  display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
  background-color: #595959;
  color: #ffffff;
}
</style>