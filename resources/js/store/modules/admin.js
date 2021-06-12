import axios from "axios";

// state list
const state = {
    admin_info : {},
    employee_list: [],
    admin_expenses: {},
    admin_expense_info: {},
}

// get state
const getters = {
    get_admin_info: state => state.admin_info,
    get_employee_list: state => state.employee_list,
    get_admin_expenses: state => state.admin_expenses,
    get_admin_expense_info: state => state.admin_expense_info,
}

// actions
const actions = {
    fetch_admin_expense_info: function(state){
        axios.get('/json/admin-expenses-info')
            .then((res)=>{
                this.commit('set_admin_expense_info',res.data);
            })
    },
    fetch_employee_list: function(state){
        axios.get('/json/employee-list')
            .then((res)=>{
                this.commit('set_employee_list',res.data);
            })
    },
    fetch_admin_deposit_expenses: async function(state,slug){
        // console.log(slug);
        const response = await axios.get('/json/admin-deposit-expenses?page='+slug);
        this.commit('set_admin_expenses',response.data);

    },
    fetch_admin_expense_expenses: async function(state,slug){
        // console.log(slug);
        const response = await axios.get('/json/admin-expense-expenses?page='+slug);
        this.commit('set_admin_expenses',response.data);

    },
    fetch_admin_expenses: async function(state,slug){
        // console.log(slug);
        sessionStorage.setItem('status',slug.status);
        if(typeof slug === 'object'){
            const response = await axios.get('/json/admin-expenses?page='+slug.page);
            this.commit('set_admin_expenses',response.data);
        }
        else{
            const response = await axios.get('/json/admin-expenses?page='+slug);
            this.commit('set_admin_expenses',response.data);
        }
    },
}

// mutators or set state
const mutations = {
    set_guest_expenses: function(state, expenses){
        state.guest_expenses = expenses;
    },
    set_employee_list: function(state, employee_list){
        state.employee_list = employee_list;
    },
    set_admin_expenses: function(state, admin_expenses){
        state.admin_expenses = admin_expenses;
    },
    set_admin_expense_info: function(state, admin_expense_info){
        state.admin_expense_info = admin_expense_info;
    },
}

export default {
    state,
    getters,
    actions,
    mutations
}
