<template>
    <div class="content mb-0">
        <span v-for="item in get_sec_list" :key="item.id">
            <a href="#" class="d-flex mb-3 align-content-center align-items-center">
                <div>
                    <img src="/avatar.png" width="60" class="rounded-xl me-3" />
                </div>
                <div style="flex:1">
                    <h5 class="font-16 font-600 bangla_name">{{ item.first_name }}</h5>
                    <!-- <p class="line-height-s mt-1 opacity-70">This is a sample chat box, it looks pretty sweet and has text in it.</p> -->
                </div>
                <div @click="telegram(item.telegram_name)" class="align-self-center ps-3">
                    <i class="fa fa-envelope btn btn-info"></i>
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
        telegram: function(name){
            // const value = e.target.attributes.getNamedItem('data-telegram');
            // console.log(name);
            var protoUrl="tg:\/\/resolve?domain="+name;
            window.location=protoUrl;
        }
    },
    computed: {
        ...mapGetters([
                'get_sec_list'
            ]),
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
