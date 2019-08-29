<template>
    <ul class="list-group" style="height:600px;" >
        <li class="list-group-item active" ><h1 style="text-align:center;">Create your group</h1></li>
        <li class="list-group-item" >
            <h2 style="font-family: 'Nunito', sans-serif;">Create your group and chat with your best friends...</h2>
            <input v-model="groupname" type="text" class="form-control" plecholder="Group Name" style="width:220px; margin-top:20px;">
            <button @click="addgroup" type="button" class="btn btn-light" style="width:150px; margin-top:20px;">Add Group</button>
        </li>
        <li class="list-group-item" :data-id="group.id" v-for="(group, index) in groups">
            <ul class="list-group list-group-horizontal" :id="group.id">
                <li class="list-group-item gr">{{group.name}}</li>
                <li class="list-group-item gr">{{group.created_at}}</li>
                <a style="text-decoration: none; color:white;">
                    <li @click="delgroup(group.id)" class="list-group-item delusi">Delete Group</li>
                </a>
                <a :href="group.url" style="text-decoration: none; color: white;">
                    <li class="list-group-item addusi">Add users</li>
                </a>
            </ul>
        </li>
    </ul>
</template>
<script>
    export default{
        props: ['groups','myuserid'],

        data() {
            return {
                groupname:'',
                mygroups:[]
            }
        },
    created: function () {
        this.fetchGroups();
    },
        mounted(){
            console.log('Component mounted.')
        },
        methods:{
            addgroup(){
                axios.post('groupsadd', {
                    name:this.groupname,
                    creator:this.myuserid
                });
                location.reload();
            },
            fetchGroups(){
                axios.get('groupsadd').then(response => {
                    this.mygroups = response.data;
                })
            },
            delgroup(groupid){
                axios.post('groupsdel',{
                    id:groupid
                });
                var thisp = document.querySelector('li[data-id="'+groupid+'"]');
                thisp.remove();
            },
        }
    }
</script>


























