<template>
    <div>
        <div class="d-flex mb-3">
            <router-link :to="{ name: 'adminAllProject'}" class="btn btn-primary mx-1 d-inline-block">All Labour</router-link>
            <router-link :to="{ name: 'adminCreateProject'}" class="btn btn-secondary mx-1 d-inline-block">Create Labour</router-link>
        </div>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Date</th>
                    <th scope="col">Name</th>
                    <th scope="col">Info</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(project,index) in projects" :key="project.id">
                    <th scope="row"> {{ index+1 }} </th>
                    <td> {{ project.date }} </td>
                    <td> <b>{{ project.name }}</b> <br> {{ project.project_area }} </td>
                    <td>
                        <b>Total espense:  0/-</b> <br>
                        Description: {{ project.description }} <br> <br>
                        <button type="button" @click="delete_expense(project.id)" class="btn btn-danger">
                            <i class="fa fa-trash-o"></i>
                            Delete
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>

    </div>
</template>

<script>
export default {
    data: function(){
        return {
            projects: [],
        }
    },
    created: function(){
        this.get_data();
    },
    methods: {
        get_data: function(){
            axios.get('/json/project-list')
                .then((res)=>{
                    this.projects = res.data;
                })
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
                    axios.post('/admin-delete-project',{id:id})
                        .then((res) => {
                            Toast.fire({
                                icon: 'success',
                                title: 'Deleted successfully'
                            });
                            that.get_data();
                        })
                        .catch(() => {
                            Toast.fire({
                                icon: 'error',
                                title: 'Something went wrong'
                            });
                        });
                }
            })
        },
    }
}
</script>

<style>

</style>
