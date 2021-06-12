<template>
    <div>
        <div class="card card-style bg-11 mt-3" :key="Math.random()" data-card-height="160" style="height: 160px;">
            <div class="card-bottom ps-3 pb-3">
                <h1 class="font-17 color-white mb-n3">At a Glance</h1>
                <h4 class="font-13 color-white mb-4 opacity-50"></h4>
                <div class="d-flex">
                    <div class="pe-3">
                        <!-- <h5 class="color-white">15k</h5>
                        <h6 class="color-white opacity-60">Visits</h6> -->
                    </div>
                    <div class="pe-3">
                        <!-- <h5 class="color-white">14k</h5>
                        <h6 class="color-white opacity-60">Sales</h6> -->
                    </div>
                    <div class="ms-auto text-end pe-3">
                        <h5 class="color-white">{{get_admin_expense_info.total_give_amount}} /-</h5>
                        <h6 class="color-white opacity-60">Total Expenses</h6>
                    </div>
                </div>
            </div>
            <div class="card-overlay bg-black opacity-80"></div>
        </div>

        <div class="content mb-0 mt-3" :key="Math.random()">
            <div class="row mb-0">
                <div class="col-6 pe-1">
                    <div class="card card-style mx-0 mb-2 p-3">
                        <h6 class="font-14">Total Expense</h6>
                        <h3 class="color-green-dark mb-0">{{get_admin_expense_info.total_expense_amount}} /-</h3>
                    </div>
                </div>
                <div class="col-6 ps-1">
                    <div class="card card-style mx-0 mb-2 p-3">
                        <h6 class="font-14">Total Remaining </h6>
                        <h3 class="color-red-dark mb-0">{{get_admin_expense_info.total_remaining_amount}} /-</h3>
                    </div>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
    import { mapGetters, mapActions } from 'vuex';
    export default {
        methods: {
            numberWithCommas: function(x) {
                return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            }
        },
        methods: {
            ...mapActions(['fetch_admin_expense_info'])
        },
        created: function(){
            this.fetch_admin_expense_info();
        },
        computed: {
            ...mapGetters([
                    'get_admin_expense_info',
                ]),
        },
    };
</script>

<style></style>
