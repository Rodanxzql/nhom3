<template>
      <navbar/>
 
      <router-view />
      <footers/>


      
</template>
<script>
import "../assets/css/client.css";
import navbar from "../pages/client/component/navbar.vue";
import footers from "../pages/client/component/footer.vue";

export default {
   
   components:
   {
       footers,
       navbar,
    
   },
  
}    
</script>

