import axios from "axios";

// state list
const state = {
    user_info : {},
    user_expense_info: {},
    user_expenses:{}
}

// get state
const getters = {
    get_user_info: state => state.user_info,
    get_user_expense_info: state => state.user_expense_info,
    get_user_expenses: state => state.user_expenses,
}

// actions
const actions = {
    fetch_user_expense_info: function(state){
        axios.get('/json/user-expenses-info')
            .then((res)=>{
                this.commit('set_user_expense_info',res.data);
            })
    },
    fetch_user_deposit_expenses: async function(state,slug){
        // console.log(slug);
        const response = await axios.get('/json/user-deposit-expenses?page='+slug);
        this.commit('set_user_expenses',response.data);

    },
    fetch_user_expense_expenses: async function(state,slug){
        // console.log(slug);
        const response = await axios.get('/json/user-expense-expenses?page='+slug);
        this.commit('set_user_expenses',response.data);

    },
    fetch_user_expenses: async function(state,slug){
        // console.log(slug);
        sessionStorage.setItem('status',slug.status);
        if(typeof slug === 'object'){
            const response = await axios.get('/json/user-expensess?page='+slug.page);
            this.commit('set_user_expenses',response.data);
        }
        else{
            const response = await axios.get('/json/user-expensess?page='+slug);
            this.commit('set_user_expenses',response.data);
        }
    },

}

// mutators or set state
const mutations = {
    set_user_expenses: function(state, user_expenses){
        state.user_expenses = user_expenses;
    },
    set_user_expense_info: function(state, user_expense_info){
        state.user_expense_info = user_expense_info;
    },



}

export default {
    state,
    getters,
    actions,
    mutations
}
