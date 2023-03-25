<template>

<div id="space">
  <section class="vh-100" >
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-9 col-lg-6 col-xl-5">
        <!-- <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
          class="img-fluid" alt="Sample image"> -->
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
        <form >
          <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
            <p class="lead fw-normal mb-0 me-3">Đăng nhập bằng</p>
            <button type="button" class="btn btn-primary btn-floating mx-1">
              <i class="fab fa-facebook-f"></i>
            </button>

            <button type="button" class="btn btn-primary btn-floating mx-1">
              <i class="fab fa-twitter"></i>
            </button>

            <button type="button" class="btn btn-primary btn-floating mx-1">
              <i class="fab fa-linkedin-in"></i>
            </button>
          </div>

          <div class="divider d-flex align-items-center my-4">
            <p class="text-center fw-bold mx-3 mb-0">Or</p>
          </div>

          <!-- Email input -->
          <div class="form-outline mb-4">
            <label class="form-label" for="form3Example3">Email</label>
            <input type="email" id="form3Example3" class="form-control form-control-lg"
              placeholder="Email" v-model="email"/>
          </div>

          <!-- Password input -->
          <div class="form-outline mb-3">
            <label class="form-label" for="form3Example4">Mật khẩu</label>
            <input type="password" id="form3Example4" class="form-control form-control-lg"
              placeholder="Mật khẩu" v-model="password" />
            
          </div>

          

          <div class="text-center text-lg-start mt-4 pt-2">
            <button @click.prevent="login()"  class="btn btn-primary btn-lg"
              style="padding-left: 2.5rem; padding-right: 2.5rem;">Đăng nhập</button>
            <p class="small fw-bold mt-2 pt-1 mb-0">Không có tài khoản? <a href="/register"
                class="link-danger">Đăng ký</a></p>
          </div>

        </form>
      </div>
    </div>
  </div>

</section>
</div>
</template> 

<script>
import axios from 'axios'


  export default{
    data(){
      return{
        email:'',
        password:''
      }
    },
    computed: {
        isValidEmail() {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return emailRegex.test(this.email);
        },
        isValidPassword() {
            return this.password.length >= 8;
        },
    },
  
    methods:{
      async login(){

        const data = {
          email: this.email,
          password: this.password,


        }
        const login = await axios.post('http://localhost:8000/users/login',data);
        if(login.data.user.length !=0)
        {
          localStorage.setItem("user-info", JSON.stringify(login.data.user));  
          this.$router.push({ name:'homepage'})


        }else
            {
                alert('Mật khẩu hoặc email không đúng !!!');
            }
      }
      
      }
  }

</script>






<style>
.divider:after,
.divider:before {
content: "";
flex: 1;
height: 1px;
background: #eee;
}
.h-custom {
height: calc(100% - 73px);
}
@media (max-width: 450px) {
.h-custom {
height: 100%;
}
}
</style>

