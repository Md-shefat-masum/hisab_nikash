<template>
    <div>
        <ul class="d-flex expense_btn">
            <li><a href="#" @click="fetch_user_expenses(1)" class="btn btn-sm btn-outline-info active mx-2 text-dark">All <span>({{get_user_expense_info.total_expense}})</span></a></li>
            <li><a href="#" @click.prevent="fetch_user_deposit_expenses(1)" class="btn btn-sm btn-outline-info mx-2 text-dark">Deposit <span>({{get_user_expense_info.total_deposit_expense}})</span></a></li>
            <li><a href="#" @click.prevent="fetch_user_expense_expenses(1)" class="btn btn-sm btn-outline-secondary mx-2 text-dark">Expense <span>({{get_user_expense_info.total_expense_expense}})</span></a></li>
        </ul>
        <table class="table table-bordered">
            <thead class="text-center">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Amount</th>
                    <th scope="col">action</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="( expense, index) in get_user_expenses.data" :key="expense.id">
                    <th scope="row"  class="text-center">{{index+1}}</th>
                    <td class="text-center">{{expense.employee.first_name}}</td>
                    <td>
                        <span class="d-block mx-1 text-info">{{expense.formated_date}}</span>
                        <span class="d-block mx-1 text-primary">{{expense.expense_type}}</span>
                        <span class="d-block mx-1">{{expense.description}}</span>
                    </td>
                    <td class="text-center">{{expense.amount}}/-</td>
                    <td class="text-center"><a href="#" @click.prevent="show_details(expense.id)" class="btn btn-xs btn-secondary"><i class="fa fa-eye"></i></a></td>
                </tr>
            </tbody>
        </table>

        <pagination :data="get_user_expenses" :show-disabled="true" @pagination-change-page="load_expense">
            <span slot="prev-nav"><i class="fa fa-angle-left"></i> Previous</span>
	        <span slot="next-nav">Next <i class="fa fa-angle-right"></i></span>
        </pagination>

        <div class="modal fade" id="viewModal" tabindex="-1" aria-labelledby="viewModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="viewModalLabel">Expense Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="content">
                            <!-- <p class="font-600 color-highlight mb-n1 text-uppercase">{{selected_expense.guest.first_name}}</p> -->
                            <h6 class="">Employee: {{selected_expense.employee.first_name}}</h6>
                            <div class="row mb-0 mt-n2">
                                <div class="col-12">
                                    <ul class="icon-list font-500 color-theme font-13 mt-4 line-height-l">
                                        <li>
                                            <span class="d-inline-block w-100px">
                                                <i class="fa opacity-40 fa-calendar-minus-o me-2"></i>Date:
                                            </span>
                                            <span>
                                                <span> {{selected_expense.formated_date}}</span>
                                            </span>
                                        </li>
                                        <li>
                                            <span class="d-inline-block w-100px">
                                                <i class="fa opacity-40 fa-gg me-2"></i>Amount:
                                            </span>
                                            <span>
                                                <span> {{selected_expense.amount}} /-</span>
                                            </span>
                                        </li>
                                        <li>
                                            <span class="d-inline-block w-100px">
                                                <i class="fa opacity-40 fa-gg me-2"></i>Type:
                                            </span>
                                            <span>
                                                <span> {{selected_expense.expense_type}}</span>
                                            </span>
                                        </li>
                                        <li class="d-flex flex-wrap">
                                            <span class="d-inline-block w-100px">
                                                <i class="fa opacity-40 fa-comment-o me-2"></i>Description:
                                            </span>
                                            <span>
                                                <span> {{selected_expense.description}}</span>
                                            </span>
                                        </li>
                                        <li class="d-flex flex-wrap">
                                            <span class="d-inline-block w-100px">
                                                <i class="fa opacity-40 fa-comment-o me-2"></i>File:
                                            </span>
                                            <span>
                                                <span>
                                                    <a :href="'/'+selected_expense.file" target="_blank" download="">
                                                        <img :src="'/'+selected_expense.file" class="w-100" alt="related file">
                                                    </a>
                                                </span>
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" v-if="selected_expense.expense_type!='deposit'" @click="update_expense(selected_expense.id)" class="btn btn-primary"><i class="fa fa-pencil"></i> Update</button>
                        <button type="button" v-if="selected_expense.expense_type!='deposit'" @click="delete_expense(selected_expense.id)" class="btn btn-danger"><i class="fa fa-trash-o"></i> Delete</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
export default {
    data: function(){
        return {
            selected_expense: {
                amount: '',
                amount_bangla: '',
                approved: '',
                expense_type: '',
                date: '',
                description: '',
                employee: {
                    name: '',
                },
                user: {
                    name: '',
                },
            },
            filter_info: {
                approved: 0,
                page: 1,
                from: null,
                to: null,
            }
        }
    },
    methods:{
        ...mapActions(['fetch_user_expenses','fetch_user_deposit_expenses','fetch_user_expense_expenses','fetch_user_expense_info']),
        load_expense: function(slug){
            this.fetch_user_expenses(slug);
        },
        // filter: function(){
        //     this.fetch_guest_filter_expense(this.filter_info);
        // },
        show_details: function(id){
            axios.get('/json/expense-details/'+id)
                .then((res)=>{
                    // console.log(res.data);
                    this.selected_expense = res.data;
                    $('#viewModal').modal('show');
                })
        },
        update_expense: function(id){
            this.$router.push({ name: 'userUpdateExpense', params: { id: id } });
        },
        delete_expense: function (id) {
            let that = this;
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.value) {
                    axios.post('/delete-expense',{id:id})
                    .then((res) => {
                        $('#viewModal').modal('hide')
                        Toast.fire({
                            icon: 'success',
                            title: 'Deleted successfully'
                        });
                        this.fetch_user_expenses({page:1});
                        this.fetch_user_expense_info();
                    }).catch(() => {
                        Toast.fire({
                            icon: 'error',
                            title: 'Something went wrong'
                        });
                    });
                }
            })
        },
    },
    mounted: function(){
        this.fetch_user_expenses({page:1});
        this.fetch_user_expense_info();
        setTimeout(() => {
            $('.expense_btn li a').on('click',function(){
                $('.expense_btn li a').removeClass('active');
                $(this).addClass('active');
            })
        }, 500);
    },
    computed: {
        ...mapGetters([
                'get_user_expenses',
                'get_user_expense_info',
            ]),
    },
}
</script>

<style>

</style>
