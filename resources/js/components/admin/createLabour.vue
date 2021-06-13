<template>
    <div>
        <form action="#" id="expense_form" enctype="multipart/form-data">

            <h3>Create Manpower</h3>
            <p></p>

            <div class="mb-4 custom_select2">
                <label for="select2" class="color-highlight font-500" style="position:absolute;background:white;top:-12px">Project</label>
                <em class="c_em" style="right:12px; top:-12px;">(required)</em>
                <select name="project_id" class="form-control employee" v-model="form_data.project_id" id="project_id">
                    <option v-for="item in projects" :key="item.id" :value="item.id">{{ item.name }}</option>
                </select>
                <div class="text-danger d-block error project_id" style="position: unset;"></div>
            </div>

            <div class="input-style has-borders no-icon validate-field input-style-always-active mb-4 custom_select2">
                <input type="text" name="name" v-model="form_data.name" class="form-control validate-text" id="name" placeholder="Name" />
                <label for="name" class="color-highlight font-500">Name</label>
                <em class="c_em">(required)</em>
                <div class="text-danger d-block error name" style="position: unset;"></div>
            </div>

            <div class="input-style has-borders no-icon validate-field input-style-always-active mb-4 custom_select2">
                <input type="email" name="email" v-model="form_data.email" class="form-control validate-text" id="email" placeholder="email" />
                <label for="email" class="color-highlight font-500">email</label>
                <em class="c_em">(required)</em>
                <div class="text-danger d-block error email" style="position: unset;"></div>
            </div>

            <div class="input-style has-borders no-icon validate-field input-style-always-active mb-4 custom_select2">
                <input type="text" name="phone" v-model="form_data.phone" class="form-control validate-text" id="phone" placeholder="phone" />
                <label for="phone" class="color-highlight font-500">Mobile No</label>
                <em class="c_em">(required)</em>
                <div class="text-danger d-block error phone" style="position: unset;"></div>
            </div>

            <div class="input-style has-borders no-icon validate-field input-style-always-active mb-4 custom_select2">
                <input type="number" name="amount" v-model="form_data.amount" class="form-control validate-text" id="Amount" placeholder="example: 700" />
                <label for="Amount" class="color-highlight font-500">Per day amount</label>
                <em class="c_em">(required)</em>
                <div class="text-danger d-block error amount" style="position: unset;"></div>
            </div>

            <div class="input-style has-borders no-icon validate-field input-style-always-active mb-4 custom_select2">
                <input type="password" value="@12345678" name="password" v-model="form_data.password" class="form-control validate-text" id="password" placeholder="password" />
                <label for="password" class="color-highlight font-500">Password ( dafault @12345678 )</label>
                <em class="c_em">(required)</em>
                <div class="text-danger d-block error password" style="position: unset;"></div>
            </div>

            <div class="input-style has-borders no-icon validate-field input-style-always-active mb-4 custom_select2">
                <input type="password" value="@12345678" name="password_confirmation" v-model="form_data.password_confirmation" class="form-control validate-text" id="password_confirmation" placeholder="password confirmation" />
                <label for="password_confirmation" class="color-highlight font-500">Re Type Password ( dafault @12345678 )</label>
                <em class="c_em">(required)</em>
                <div class="text-danger d-block error password_confirmation" style="position: unset;"></div>
            </div>

            <div class="input-style has-borders no-icon validate-field input-style-always-active mb-4">
                <textarea type="text" name="description" v-model="form_data.description" class="form-control validate-text" id="description" placeholder="" ></textarea>
                <label for="description" class="color-highlight font-500">Description</label>
            </div>
            <a href="#" @click.prevent="insert_data" class="close-menu btn btn-margins btn-full gradient-blue font-13 btn-l font-600 mt-3 rounded-sm">Submit</a>
        </form>
    </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
export default {
    data: function(){
        return {
            form_data : {
                name: '',
                project_id: '',
                email: '',
                phone: '',
                description: '',
                per_day_amount: '',
                password: '@12345678',
                password_confirmation: '@12345678',
            },
            projects: [],
        }
    },
    methods:{
        get_project: function(){
            axios.get('/json/project-list')
                .then((res)=>{
                    this.projects = res.data;
                })
        },
        insert_data: function(){
            let formData = new FormData($('#expense_form')[0]);
            axios.post('/admin-create-manpower',formData)
                .then((res)=>{
                    if(res.data){
                        toaster('success','new manpower inserted');
                        // this.$router.push({path:'/admin/expense-list'})
                        $('#expense_form')[0].reset();
                        this.form_data = {
                            name: '',
                            project_id: '',
                            email: '',
                            phone: '',
                            description: '',
                            per_day_amount: '',
                            password: '@12345678',
                            password_confirmation: '@12345678',
                        };
                    }else{
                        toaster('error','fill up required area');
                    }
                })
        }

    },
    mounted: function(){
        this.get_project();
        $('.employee').select2();
        $('.employee').on('change',function(){
            this.form_data.project_id = $('.employee').val();
        }.bind(this));
    },
    computed: {
        ...mapGetters([
                'get_employee_list',
            ]),
    },
}
</script>

<style scoped>
    ::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
        color: rgb(184, 184, 184);
        opacity: 1; /* Firefox */
    }

    :-ms-input-placeholder { /* Internet Explorer 10-11 */
        color: rgb(184, 184, 184);
    }

    ::-ms-input-placeholder { /* Microsoft Edge */
        color: rgb(184, 184, 184);
    }

    .c_em{
        position: absolute;
        background: white;
        top: -4px;
        right: 1px;
        opacity: 1;
        font-size: 13px;
        font-style: italic;
    }
</style>
