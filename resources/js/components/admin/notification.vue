<template>
    <div>
        <div class="timeline-body mt-0">
            <div class="timeline-deco"></div>
           <!--  <div class="drag-line"></div> -->
            <div class="timeline-item mt-4" v-for="item in notifications" :key="item.id">
                <i class="far fa-bell bg-blue-dark shadow-l timeline-icon"></i>
                <div class="timeline-item-content rounded-sm">
                    <h5 class="font-300 mb-3">{{ item.description }}</h5>
                    <p>{{new Date(item.created_at).toDateString()}}</p>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
    export default {
        data: function(){
            return {
                notifications: [],
            }
        },
        created: function(){
            $.get('/json/notification',res=>this.notifications=res);
        }
    }
</script>

<style>

</style>
