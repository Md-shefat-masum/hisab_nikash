<template>
    <div>
        <router-view></router-view>
    </div>
</template>

<script>
    import { mapGetters, mapActions } from 'vuex';
    export default {
        created: function(){
            // this.fetch_guest_expense_info();
        },
        methods: {
            // ...mapActions(['fetch_guest_expense_info']),
        },
        computed: {
        },
    }
</script>

<style>

</style>
