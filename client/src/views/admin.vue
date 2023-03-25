<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-3">
        <input type="checkbox" id="toggler" />
        <aside class="aside-wrapper">
          <h1 class="logo-text"><span>Nhóm 3</span> <label for="toggler"><i
                class="fas fa-bars sidebar-toggle"></i></label></h1>
          <ul>
            <a href="/admin/users" class="nav-link li" ><i class="fas fa-building"></i> Quản lý khách hàng</a>
            <a href="/admin/menu" class="nav-link li" ><i class="fas fa-dollar-sign"></i> Quản lý danh mục</a>
            <a href="/admin/product" class="nav-link li" ><i class="fas fa-dollar-sign"></i> Quản lý sản phẩm</a>
            <a href="/admin/bill" class="nav-link li" ><i class="fas fa-credit-card"></i> Quản lý hóa đơn</a>
          </ul>
          <ul>
            <li v-show="appear=='1'" class="li"><a @click="handleButtonClick" class="nav-link  text-dark">
              <i class="fas fa-credit-card"></i>Đăng xuất</a>
            </li>
          </ul>
        </aside>
      </div>
      <div class="col-9">
        
        <router-view />
      </div>
    </div>
  </div>

       
</template>

<script>
import "../assets/css/admin.css";



export default {

  data(){
    return{
      appear:""
    };
  },  


  mounted()
    {
     let admin=localStorage.getItem("admin-info");
     if(admin)
     {
      this.appear='1';
      console.log('oke')  
     }
     else
     {
      this.appear='0';

      alert('Bạn chưa đăng nhập');
      this.$router.push('loginadmin')
     }
    },

  methods: {


    handleButtonClick()
      {
        
          localStorage.removeItem('admin-info')
          this.$router.go({ name:'loginadmin'})
        
      },
  }
}
</script>