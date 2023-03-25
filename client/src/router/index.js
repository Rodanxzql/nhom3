import {createRouter,createWebHistory} from 'vue-router';
import admin from "./admin.js";
import client from './client.js';
const routes=[...admin,...client];
const router = createRouter(
    (
        {
            history:createWebHistory(),
            routes
        }
    )
);
export default router;