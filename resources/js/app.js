import Vue from "vue";

// import toaster
import Swal from "sweetalert2";
import VueRouter from "vue-router";

// inport routes
import routes from "./router";

/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */
require('./bootstrap');

window.Vue = require('vue').default;

Vue.use(VueRouter);

window.Swal = Swal;
const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 1500,
    timerProgressBar: true,
    onOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer);
        toast.addEventListener('mouseleave', Swal.resumeTimer);
    }
});
window.Toast = Toast;

// import vuex
const { default: store } = require('./store/index');

// import paginate
Vue.component('pagination', require('laravel-vue-pagination'));

const router = new VueRouter({
    routes: routes,
    mode: 'history',
})

Vue.component('employee', require('./components/employee/employee.vue').default);
Vue.component('admin', require('./components/admin/admin.vue').default);

import { mapGetters, mapActions } from 'vuex';

if (document.getElementById('vueApp')) {
    const app = new Vue({
        el: '#vueApp',
        router,
        store: store,
        created: function(){

        },
        mounted: function(){
            if(location.pathname === '/'){
                let link = $('.home_btn').attr('href');
                this.$router.push(link);
            }
        },
        methods: {
        },
        computed: {
            ...mapGetters(['get_user_info']),
        },
    });
}
