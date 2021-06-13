<template>
    <div>
        <form action="#" id="expense_form" enctype="multipart/form-data">
            <div class="d-flex mb-3">
                <router-link :to="{ name: 'adminAllProject'}" class="btn btn-primary mx-1 d-inline-block">All Labour</router-link>
                <router-link :to="{ name: 'adminCreateProject'}" class="btn btn-secondary mx-1 d-inline-block">Create Labour</router-link>
            </div>
            <h3>Create Project</h3>
            <p></p>
            <div class="input-style has-borders no-icon validate-field input-style-always-active mb-4 custom_select2">
                <input type="date" name="date" v-model="form_data.date" class="form-control validate-text" id="form1" placeholder="United States" />
                <label for="form1" class="color-highlight font-500">Date</label>
                <em class="c_em">(required)</em>
                <div class="text-danger d-block error date" style="position: unset;"></div>
            </div>

            <div class="input-style has-borders no-icon validate-field input-style-always-active mb-4 custom_select2">
                <input type="text" name="name" v-model="form_data.name" class="form-control validate-text" id="name" placeholder="project name" />
                <label for="name" class="color-highlight font-500">Name</label>
                <em class="c_em">(required)</em>
                <div class="text-danger d-block error name" style="position: unset;"></div>
            </div>

            <div class="input-style has-borders no-icon validate-field input-style-always-active mb-4 custom_select2">
                <input type="text" name="project_area" v-model="form_data.project_area" class="form-control validate-text" id="project_area" placeholder="project area name" />
                <label for="project_area" class="color-highlight font-500">Place/Area Name</label>
                <em class="c_em">(required)</em>
                <div class="text-danger d-block error project_area" style="position: unset;"></div>
            </div>

            <!-- <div class="input-style has-borders no-icon validate-field input-style-always-active mb-4">
                <input type="file" name="file" class="form-control validate-text" id="file" />
                <label for="description" class="color-highlight font-500">Related file</label>
                <em class="c_em">(required)</em>
                <div class="text-danger d-block error file" style="position: unset;"></div>
            </div> -->

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
                date: new Date().toISOString().slice(0,10),
                employee_id: 1,
                amount: '',
                description: '',
            }
        }
    },
    methods:{
        ...mapActions(['fetch_employee_list']),
        insert_data: function(){
            let formData = new FormData($('#expense_form')[0]);
            axios.post('/admin-create-project',formData)
                .then((res)=>{
                    if(res.data){
                        toaster('success','new project inserted');
                        this.$router.push({path:'/admin/all-project'})
                    }else{
                        toaster('error','fill up required area');
                    }
                })
        }
    },
    mounted: function(){
        // this.fetch_employee_list();
        $('.employee').select2();
        $('.employee').on('change',function(){
            this.form_data.employee_id = $('.employee').val();
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
