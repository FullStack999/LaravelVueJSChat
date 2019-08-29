<template>
    <div class="row" style="box-shadow: 0 0.125rem 0.25rem black !important;">
        <div class="col-9" style="padding: 0;">
            <ul class="list-group" style="height:600px;" >
                <li class="list-group-item active" ><h2 style="text-align:center;" v-for="(name, index) in groupname">Add your friends in group` {{name.name}}</h2></li>
                <li class="list-group-item" :data-id="user.id" v-for="(user, index) in users">
                    <ul style="box-shadow: 0px 0.400rem 0.400rem #3c3c3cd6 !important;" class="list-group list-group-horizontal" :id="user.id">
                        <li class="list-group-item gr">{{user.name}}</li>
                        <a style="cursor: pointer; text-decoration: none; color:white; font-size: 30px; text-align: center; " @click="addus(user.id)"><li  class="list-group-item addusii">+</li></a>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="col-3" style="padding: 0; box-shadow: -1px 0.400rem 0.400rem black !important;">
            <ul class="list-group" style="height:600px;" >
                <li class="list-group-item onlines" ><h2 style="text-align:center;">Connected users</h2></li>
                <li class="list-group-item"  v-for="(conuser, index) in conusers">
                    <ul style="box-shadow: 0px 0.400rem 0.400rem #3c3c3cd6 !important;" class="list-group list-group-horizontal" :id="conuser.id">
                        <li class="list-group-item gr">{{conuser.name}}</li>
                        <a style="cursor: pointer; text-decoration: none; color:white; font-size: 30px; text-align: center; " @click="del(conuser.id)"><li class="list-group-item delusii">X</li></a>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</template>

<script>
    export default{
        props: ['user', 'conusers','groupid','groupname','users'],
        data() {
            return {
                grID : this.groupid,
                grName:this.groupname
            }
        },
        mounted(){
            console.log('Component mounted.')
        },
        methods:{
            addus(userid){
                axios.post('addus', {
                    axgrid:this.grID,
                    userid:userid
                });
                location.reload();

            },
            del(userid){
                axios.post('delus', {
                    axgrid:this.grID,
                    userid:userid
                });
                location.reload();
            }
        }
    }
</script>





