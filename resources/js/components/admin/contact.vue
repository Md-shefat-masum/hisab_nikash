<template>
    <div class="content mb-0">
        <span v-for="item in employee" :key="item.id">
            <a href="#" class="d-flex mb-3 align-content-center align-items-center">
                <div>
                    <img src="/avatar.png" width="60" class="rounded-xl me-3" />
                </div>
                <div style="flex:1">
                    <h5 class="font-16 font-600 bangla_name">{{ item.first_name + ' ' + item.last_name  }}</h5>
                    <p class="line-height-s mt-1 opacity-70 text-primary">
                        <span class="d-block my-1">Given Money: {{item.given_money}}</span>
                        <span class="d-block my-1">Expensed: {{item.expense_money}}</span>
                        <span class="d-block my-1">Remaining: {{item.remaining_money}}</span>
                    </p>
                </div>
                <div class="align-self-center ps-3">
                    <a :href="'tel:'+item.phone"></a><i class="fa fa-phone btn btn-info"></i>
                </div>
                <div class="align-self-center ps-3" v-if="item.status == 1" title="de-activate user">
                    <a href="#" @click.prevent="deactivate_user(item.id)"><i class="fa fa-trash-o btn btn-danger"></i></a>
                </div>
                <div class="align-self-center ps-3" v-else title="activate user">
                    <a href="#" @click.prevent="deactivate_user(item.id)"><i class="fa fa-redo btn btn-success"></i></a>
                </div>
            </a>
            <div class="divider mb-3"></div>
        </span>

    </div>

</template>

<script>
import { mapGetters, mapActions } from 'vuex';
export default {
    methods: {
        // ...mapActions([
        //         'fetch_sakha_list'
        //     ]),
        telegram: function(name){
            // const value = e.target.attributes.getNamedItem('data-telegram');
            // console.log(name);
            var protoUrl="tg:\/\/resolve?domain="+name;
            window.location=protoUrl;
        },
        deactivate_user: function(id){
            let confirm = window.confirm('Are you sure');
            if(confirm){
                axios.post('/delete-user',{id:id})
                    .then((res)=>{
                        if(res.data){
                            toaster('success','user has been deactivated.');
                            this.load_user();
                        }
                    })
            }
        },
        load_user: function(){
            axios.get('/json/employee-list')
            .then((res)=>{
                this.employee = res.data;
            })
        }
    },
    data: function(){
        return {
            employee: [],
        }
    },
    created: function(){
        this.load_user();
    },
    computed: {
        // ...mapGetters([
        //         'get_sakha_list'
        //     ]),
    },
}
</script>

<style scoped>
    @font-face{
        src: url('/bangla.ttf');
        font-family: bangla;
    }
    .bangla_name{
        font-family: 'bangla',sans-serif!important;
        font-size: 20px!important;
    }
</style>
