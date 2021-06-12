import Vue from "vue";

import Vuex from "vuex";

import admin from "./modules/admin";
import employee from "./modules/employee";

Vue.use(Vuex);

const store = new Vuex.Store({
    modules: {
        admin,
        employee,
    },
    state: {},
    getters: {},
    mutations: {},
    actions: {}
})

export default store;
