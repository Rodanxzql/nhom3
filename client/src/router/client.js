import home from '../pages/client/home/index.vue'
import Login from '../pages/client/login/index.vue'
import Register from '../pages/client/register/index.vue'
import Product from '../pages/client/product/index.vue'
import category from '../pages/client/category/index.vue'

const client =
[{
    path:'/',
    name: "client",
    component:()=>import('../views/client.vue'),
    children :[
       {
        path: '/',
        name: 'homepage',
        component: home
       },
       {
        path: 'Login',
        name: 'Loginpage',
        component: Login
       },
       {
        path: 'Register',
        name: 'Registerpage',
        component: Register
       },
       {
        path: 'Product',
        name: 'Productpage',
        component: Product
       },
       {
        path: '/category/:id',
        name: 'category',
        component: category
       },
        
    ]
}]
export default client;