import user from "../pages/admin/user/index.vue";
import product from "../pages/admin/product/index.vue";
import menu from "../pages/admin/menu/index.vue";
import bill from "../pages/admin/bill/index.vue";
import login from "../pages/admin/login/index.vue";
import cateinfor from "../pages/admin/cateinfor/index.vue";



const admin =
[
    {
        path:'/admin',
        name: "admin",
        component:()=>import("../views/admin.vue"),
        children: [
            {
              path: 'users',
              name: "admin-users",
              component: user,
            },
            {
              path: 'product',
              name: "admin-products",
              component: product,
            },
            {
              path: 'menu',
              name: "admin-menu",
              component: menu,
            },
            {
              path: 'bill',
              name: "admin-bill",
              component: bill,
            },
            {
              path: 'loginadmin',
              name: "admin-login",
              component: login,
            },
            {
              path: '/cateinfor/:id',
              name: "admin-cateinfor",
              component: cateinfor,
            },

            

        ]
    }
]
export default admin;