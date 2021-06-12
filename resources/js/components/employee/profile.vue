<template>
    <div>
        <div class="card card-style bg-6 mt-3" :key="Math.random()" data-card-height="160" style="height: 160px;">
            <div class="card-center ps-3 pb-3">
                <h1 class="font-17 color-white mb-n3">User Profile</h1>
            </div>
            <div class="card-overlay bg-black opacity-80"></div>
        </div>

        <div class="content mb-0 mt-3">
            <div class="row mb-0">
                <div class="col-12 pe-1">
                    <div class="card card-style mx-0 mb-2 p-3">
                        <table class="profile_table">
                            <tr>
                                <td><b>First Name</b></td>
                                <td>:</td>
                                <td><input v-model="user.first_name" type="text" class="form-control"></td>
                            </tr>
                            <tr>
                                <td><b>Last Name</b></td>
                                <td>:</td>
                                <td><input v-model="user.last_name" type="text" class="form-control"></td>
                            </tr>
                            <tr>
                                <td><b>User Name</b></td>
                                <td>:</td>
                                <td><input v-model="user.username" type="text" class="form-control"></td>
                            </tr>
                            <tr>
                                <td><b>Mobile Number</b></td>
                                <td>:</td>
                                <td><input v-model="user.phone" type="text" class="form-control"></td>
                            </tr>
                            <tr>
                                <td><b>Password</b></td>
                                <td>:</td>
                                <td><input v-model="user.password" type="password" class="form-control"></td>
                            </tr>
                            <tr>
                                <td><b>Confirm Password</b></td>
                                <td>:</td>
                                <td><input v-model="user.confirm_password" type="password" class="form-control"></td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <button @click.prevent="update_user_info" class="btn btn-success btn-sm p-1">Update Profile</button>
                                </td>
                            </tr>
                        </table>
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
                user: {
                    'first_name': '',
                    'last_name': '',
                    'username': '',
                    'phone': '',
                    'password': '',
                    'confirm_password': '',
                },
            }
        },
        created: function(){
            this.get_user_info();
        },
        methods: {
            get_user_info: function(){
                axios.get('/json/user-info')
                    .then((res)=>{
                        this.user = res.data;
                    })
            },
            update_user_info: function(){
                if(this.user.password == this.user.confirm_password){
                    axios.post('/json/user-info-update',this.user)
                        .then((res)=>{
                            toaster('success','profile updated');
                        })
                }else{
                    alert('password does not matched');
                }

            },
        },
    };
</script>

<style scoped>
    .profile_table td{
        padding: 10px 5px;
    }
    .profile_table td:first-child{
        width: 40%;
    }
    button{
        margin-top: 10px;
    }
</style>
