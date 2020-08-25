import Vue from 'vue'
import VueRouter from 'vue-router'


/** import store from '@/store' */

Vue.use(VueRouter)

const router = new VueRouter({
    mode: 'history',
    // ログインが必要な画面には「requiresAuth」フラグを付けておく
    routes: [

        { path: '*', redirect: '/' }
    ]
})

export default router