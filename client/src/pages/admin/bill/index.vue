<template>
        <table class="table table-hover">
      <thead>
        <th scope="col">Tên khách hàng</th>
        <th scope="col">Địa chỉ</th>
        <th scope="col">Đã giao</th>
        <th scope="col">Đơn hàng</th>
        <th scope="col">Thời gian nhận đơn</th>
        <th scope="col">Thời gian xác nhận</th>
      </thead>
      <tbody>
        <tr v-for="item in bill" :key="item.id">
        
        <td>{{ item.client }}</td>
        <td>{{ item.diachi }}</td>
        <td>
            <p v-show="item.status==1">Đã giao</p>
            <p v-show="item.status==0">Chưa giao</p>
        </td>
        <td><textarea cols="15" rows="5" >{{ item.item }}</textarea></td>
        <td>{{ item.created_at }}</td>
        <td>{{ item.updated_at }}</td>
        <td class="has-text-centered">
            
            <a class="btn btn-danger "
              @click="deleteBill(item.id)"
              >xóa</a>
              <button v-show="item.status=='0'" type="button" class="btn btn-primary"
                      data-bs-toggle="modal" data-bs-target="#staticBackdrop-edit"
                      @click="takeID(item.id)">
                      Xác nhận
              </button>
          </td>
      </tr>
      </tbody>
    </table>
</template>

<script>
import axios from 'axios';

export default{
    data(){
        return{
            bill:[],
            
        }
    },

    created() {
    this.getBills();
    },  
    methods:{



    async getBills() {
        try {
         const response = await axios.get("http://localhost:8000/api/bills");
         this.bill = response.data;
         } catch (err) {
                console.log(err);
            }
    },
    //xóa bill
    async deleteBill(id) {
      try {

        await axios.delete(`http://localhost:8000/api/bills/${id}`);
        this.getBills();
      } catch (err) {
        console.log(err);
      }
    },
    //xác nhận bill
    async takeID(id){
        try {
          this.take="1"
        await axios.put(`http://localhost:8000/api/bills/${id}`);
        this.getBills();
      } catch (err) {
        console.log(err);
      }
    },
    }
}
</script>