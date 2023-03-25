<template>
  <div id="space">
        <div class="container-fluid h-custom">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
              <form v-on:submit.prevent="handleSubmit">
                <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
                  <p class="lead fw-normal mb-0 me-3">Đăng ký bằng</p>
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
                <!--Name-->
                <div class="form-outline mb-4">
                  <input type="Text" id="form3Example3" v-model="username" class="form-control form-control-lg"
                    placeholder="Username" />
                  <label class="form-label" for="form3Example3">Username</label>
                </div>

      
                <!-- Password input -->
                <div class="form-outline mb-3">
                  <input type="password" id="form3Example4" v-model="password" class="form-control form-control-lg"
                    placeholder="Mật khẩu" />
                  <label class="form-label" for="form3Example4">Mật khẩu</label>
                </div>
                <div class="form-outline mb-3">
                  <input type="password" id="form3Example4" v-model="password_repeat" class="form-control form-control-lg"
                    placeholder="Nhập lại mật khẩu" />
                  <label class="form-label" for="form3Example4">Nhập lại mật khẩu</label>
                </div>
      

      
                <div class="text-center text-lg-start mt-4 pt-2">
                  <button  class="btn btn-primary btn-block"
                    style="padding-left: 2.5rem; padding-right: 2.5rem;">Đăng ký</button>
                  <p class="small fw-bold mt-2 pt-1 mb-0">Đã có tài khoản rồi? <a href="/login"
                      class="link-danger">Đăng nhập</a></p>
                </div>
              </form>
            </div>
          </div>
        </div>
  </div>  
  </template> 
<script>
  import axios from 'axios'

  export default{
    data(){
      return{
        username:'',
        password:'',
        password_repeat:'',
        
      }
    },
    methods:{
     
      async handleSubmit(){

        const response = await axios.post('http://localhost:8000/api/sign-up',{
        username: this.username,
        password: this.password,
        password_repeat: this.password_repeat,
        
      });
        this.$router.push('/login')
      },
    }
  }
</script>


    <style>
    #space{
      padding-top: 150px;
    }
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