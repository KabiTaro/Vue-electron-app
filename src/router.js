import Vue from 'vue'
import VueRouter from 'vue-router'

import Task from "@/components/pages/Task";

/** import store from '@/store' */

Vue.use(VueRouter)

const router = new VueRouter({
    mode: 'history',
    // ログインが必要な画面には「requiresAuth」フラグを付けておく
    routes: [
        { path: '/', component: Task },

        { path: '*', redirect: '/' }
    ]
})

export default router