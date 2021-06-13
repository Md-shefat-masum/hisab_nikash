<template>
    <div>
        <ul class="d-flex flex-wrap expense_btn">
            <li><a href="#" @click.prevent="fetch_admin_expenses(1)" class="btn btn-xs btn-outline-info active m-2 text-dark">All <span>({{get_admin_expense_info.total_expense}})</span></a></li>
            <li><a href="#" @click.prevent="fetch_admin_deposit_expenses(1)" class="btn btn-xs btn-outline-info m-2 text-dark">Deposit <span>({{get_admin_expense_info.total_deposit_expense}})</span></a></li>
            <li><a href="#" @click.prevent="fetch_admin_expense_expenses(1)" class="btn btn-xs btn-outline-info m-2 text-dark">Expense <span>({{get_admin_expense_info.total_expense_expense}})</span></a></li>
            <li><a href="#" @click.prevent="load_project_data()" class="btn btn-xs btn-outline-info m-2 text-dark">Project Expense <span>({{get_admin_expense_info.total_project_expense}})</span></a></li>
            <li><a href="#" @click.prevent="load_user_data()" class="btn btn-xs btn-outline-info m-2 text-dark">User Expense <span>({{get_admin_expense_info.total_user_expense}})</span></a></li>
        </ul>
        <div class="table-responsive">
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
                    <tr v-for="( expense, index) in get_admin_expenses.data" :key="expense.id">
                        <th scope="row"  class="text-center">{{index+1}}</th>
                        <td class="text-center" v-if="expense.employee && expense.employee.first_name">{{expense.employee.first_name + ' ' + (expense.employee.last_name || '')}}</td>
                        <td class="text-center" v-else>{{expense.name}}</td>

                        <td>
                            <span class="d-block mx-1 text-info">{{expense.formated_date}}</span>
                            <span class="d-block mx-1 text-primary">{{expense.expense_type}}</span>
                            <span class="d-block mx-1">{{expense.description}}</span>
                        </td>

                        <td class="text-center">{{expense.amount}}/-</td>
                        <td class="text-center">
                            <a v-if="expense.name" href="#" @click.prevent="show_project_details(expense )" class="btn btn-xs btn-secondary">
                                <i class="fa fa-eye"></i>
                            </a>
                            <a href="#" v-else @click.prevent="show_details(expense.id)" class="btn btn-xs btn-secondary">
                                <i class="fa fa-eye"></i>
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <pagination :data="get_admin_expenses" :show-disabled="true" @pagination-change-page="load_expense">
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
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" v-if="selected_expense.expense_type=='deposit'" @click="update_expense(selected_expense.id)" class="btn btn-primary"><i class="fa fa-pencil"></i> Update</button>
                        <button type="button" v-if="selected_expense.expense_type=='deposit'" @click="delete_expense(selected_expense.id)" class="btn btn-danger"><i class="fa fa-trash-o"></i> Delete</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="viewProjectModal" tabindex="-1" aria-labelledby="viewProjectModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="viewProjectModalLabel">Project Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="content">
                            <!-- <p class="font-600 color-highlight mb-n1 text-uppercase">{{selected_expense.guest.first_name}}</p> -->
                            <h6 class="">Project: {{selected_project.name}}</h6>
                            <div class="row mb-0 mt-n2">
                                <div class="col-12">
                                    <ul class="icon-list font-500 color-theme font-13 mt-4 line-height-l">
                                        <li>
                                            <span class="d-inline-block w-100px">
                                                <i class="fa opacity-40 fa-calendar-minus-o me-2"></i>Date:
                                            </span>
                                            <span>
                                                <span> {{selected_project.formated_date}}</span>
                                            </span>
                                        </li>
                                        <li>
                                            <span class="d-inline-block w-100px">
                                                <i class="fa opacity-40 fa-gg me-2"></i>Amount:
                                            </span>
                                            <span>
                                                <span> {{selected_project.amount}} /-</span>
                                            </span>
                                        </li>
                                        <li class="d-flex flex-wrap">
                                            <span class="d-inline-block w-100px">
                                                <i class="fa opacity-40 fa-comment-o me-2"></i>Description:
                                            </span>
                                            <span>
                                                <span> {{selected_project.description}}</span>
                                            </span>
                                        </li>
                                    </ul>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Date</th>
                                                <th>Amount</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="expense in selected_project.expenses" :key="expense.id">
                                                <td>{{ expense.employee.first_name+' '+(expense.employee.last_name||'') }}</td>
                                                <td>{{ expense.date }}</td>
                                                <td>{{ expense.amount }}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" v-if="selected_expense.expense_type=='deposit'" @click="update_expense(selected_expense.id)" class="btn btn-primary">
                            <i class="fa fa-pencil"></i> Update
                        </button>
                        <button type="button" v-if="selected_expense.expense_type=='deposit'" @click="delete_expense(selected_expense.id)" class="btn btn-danger">
                            <i class="fa fa-trash-o"></i> Delete
                        </button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
import { mapGetters, mapActions, mapMutations } from 'vuex';
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
                admin: {
                    name: '',
                },
            },
            selected_project: {
                amount: '',
                name: '',
                formated_date: '',
                description: '',
                expenses: [],
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
        ...mapActions(['fetch_admin_expenses','fetch_admin_deposit_expenses','fetch_admin_expense_expenses','fetch_admin_expense_info']),
        ...mapMutations(['set_admin_expenses']),
        load_expense: function(slug){
            this.fetch_admin_expenses(slug);
        },
        filter: function(){
            this.fetch_guest_filter_expense(this.filter_info);
        },
        show_details: function(id){
            axios.get('/json/expense-details/'+id)
                .then((res)=>{
                    // console.log(res.data);
                    this.selected_expense = res.data;
                    $('#viewModal').modal('show');
                })
        },
        show_project_details: function(project){
            this.selected_project = project;
            $('#viewProjectModal').modal('show');
        },
        load_project_data: function(){
            axios.get('/json/project-expense')
                .then((res)=>{
                    this.set_admin_expenses(res.data);
                })
        },
        update_expense: function(id){
            this.$router.push({ name: 'updateAdminGiveMoney', params: { id: id } });
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
        this.fetch_admin_expenses({page:1});
        this.fetch_admin_expense_info();
        setTimeout(() => {
            $('.expense_btn li a').on('click',function(){
                $('.expense_btn li a').removeClass('active');
                $(this).addClass('active');
            })
        }, 500);
    },
    computed: {
        ...mapGetters([
                'get_admin_expenses',
                'get_admin_expense_info',
            ]),
    },
}
</script>

<style scoped>
    .btn-xs {
        padding: 7px 10px!important;
    }
</style>
