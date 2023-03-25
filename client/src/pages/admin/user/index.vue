<template>

      <table class="table table-hover">
        <thead>
          <th scope="col">Email</th>
          <th scope="col">Tên</th>
        </thead>
        <tbody>
          <tr v-for="user in users" :key="user.id">
          <td>{{ user.email }}</td>
          <td>{{ user.name }}</td>
          <td class="has-text-centered">
              
              <a class="btn btn-danger "
                @click="deleteUser(user.id)"
                >xóa</a>

            </td>
        </tr>
        </tbody>
      </table>
  
  
  
  

  
  
    </template>
  
  
  
  <script>
  
  import axios from 'axios';

  
  export default {
      data(){
        return{
          name:'',
          users:[],
          username:"",
          password:"",
          avatar:"",
          id:""
        };
      },
  
      created() {
      this.getUsers();
    },
  
   
    methods: {
      // Get All User
      async getUsers() {
        try {
          const response = await axios.get("http://localhost:8000/api/users");
          this.users = response.data;
        } catch (err) {
          console.log(err);
        }
      },
   
      // Delete User
      async deleteUser(id) {
        try {
          await axios.delete(`http://localhost:8000/api/users/${id}`);
          this.getUsers();
        } catch (err) {
          console.log(err);
        }
      },
  
      
      
    }
   
  };
  </script>
  
  