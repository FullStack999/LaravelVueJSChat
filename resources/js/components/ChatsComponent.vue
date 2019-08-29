<template>
    <div class="row"  style="box-shadow: 0 0.125rem 0.25rem black !important;">
        <div class="col-9">
            <div class="card card-default" style="box-shadow:1px 50px 50px #000000b5 !important;">
                <div  class="list-group-item active"><h5 v-for="(rname, index) in roomname"
                      v-if="myid"  style="text-shadow: 1px 2px 1px rgba(2,1,1,0.91); font-family: 'Nunito', sans-serif; color: white;">
                    Your private chat room, with` {{rname.name}}</h5>
                    <h5 v-for="(rname, index) in roomname" v-if="grid" style="text-shadow: 1px 2px 1px rgba(2,1,1,0.91); font-family: 'Nunito', sans-serif; color: white;">
                        Your group chat room` {{rname.name}}</h5>
                   </div>
                <div v-if="myid || grid" class="card-body p-0">
                    <ul  class="list-group" style="height: 600px; overflow-y: scroll;"  v-chat-scroll>
                        <li :id="message.id"  class="list-group-item" v-for="(message, index) in messages">
                            <h3 class="create-message" v-for="(allus, index) in allusers" v-if="message.user_id===allus.id">{{allus.name}}: <div style="padding:0; margin-left:5px;" v-if="message.user_id === myuserid" class="btn-group float-right" role="group">
                                <button id="btnGroupDrop1" type="button" class="btn dropdown-toggle eddel" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    . . .
                                </button>
                                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                    <a class="dropdown-item" style="cursor: pointer;" @click="updatetext(message.id)">Edit</a>
                                    <a class="dropdown-item" style="cursor: pointer;" @click="deletemessage(message.id)">Delete</a>
                                </div>
                            </div></h3>
                            <h3 class="create-message" v-if="!message.user_id">{{message.user.name}}: <div style="padding:0; margin-left:5px;" v-if="message.user_id === myuserid" class="btn-group float-right" role="group">
                                <button id="btnGroupDrop1" type="button" class="btn dropdown-toggle eddel" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    . . .
                                </button>
                                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                    <a class="dropdown-item" style="cursor: pointer;" @click="updatetext(message.id)">Edit</a>
                                    <a class="dropdown-item" style="cursor: pointer;" @click="deletemessage(message.id)">Delete</a>
                                </div>
                            </div></h3>
                            <p :data-id="message.id"  class="create-message" >{{message.message}}</p>
                            <input style="width: 85%; height: 80px;" type="text" v-model='editMessage' @keyup.enter='edittoMessage(message.id)' :data-id="message.id" class="editmes">
<!--                            <textarea v-model='editMessage' @keyup.enter='edittoMessage(message.id)' placeholder="Edit Your Message..." name="text" :data-id="message.id" class="editmes" cols="80" rows="4"></textarea>-->

                            <p style="text-align: right;" v-if="message.messageDate" class="create-message">{{message.messageDate}}</p>
                            <p style="text-align: right;" v-if="!message.messageDate"class="create-message">New Message!!!</p>
                            <div class="floating-div">
                            </div>
                        </li>
                    </ul>
                </div>
                <div v-else class="card-body p-0">
                    <ul  class="list-group" style="height: 600px; overflow-y: scroll;" v-chat-scroll>
                        <li class="list-group-item" style="margin-top:250px;">
                            <h1 style="text-align: center;">Chat with your online friends</h1>
                        </li>
                    </ul>
                </div>
                <textarea v-if="myid || grid" style="height: 80px;  border-radius: 0;" placeholder="Type Your Message..." name="message"
                          v-model='newMessage' @keyup.enter='sendMessage' @keydown="sendTypingEvent"
                          class="form-control" rows="5" id="comment">
                </textarea>
            </div>

            <span class="text-muted" v-if="activeUser"><p
                    style="color: white;">{{activeUser.name}} is typing...</p></span>
        </div>

        <div class="col-3" style="box-shadow: -1px 0.400rem 0.400rem black !important;">
            <div class="card card-default">
                <div class="list-group-item onlines">
                    <div class="row">
                        <div class="col-12">
                            <h5 @click="onlinetable = !onlinetable" style="cursor:pointer; text-align:center; font-family: 'Nunito', sans-serif; color: white; text-shadow: 1px 2px 1px rgba(2,1,1,0.91);">
                                All Users / Online Users.</h5>
                        </div>
                    </div>
                </div>
                <div class="card-body p-0">
                    <ul class="list-group">
                        <li class="list-group-item"><div class="btn-group dropleft">
                            <button type="button" class="btn btn-secondary dropdown-toggle gru" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Groups
                            </button>
                            <div class="dropdown-menu">
                                <button v-for="(ygr, index) in groups" style="cursor: pointer;" class="dropdown-item" :groid="ygr.id" type="button" @click="fetchgrMessages(ygr.id)" >{{ygr.name}}</button>
                            </div>
                        </div></li>
                    </ul>
                    <ul v-if="onlinetable"  class="list-group" style="height: 526px; overflow-y: scroll;">
                        <li @click="fetchMessages(user.id)"  class="list-group-item" style="cursor: pointer;list-style-type: none;"
                             v-for="(user, index) in users" :key="index" v-if="user.id !== myuserid"><p
                                style="color: #196919a6; display: inline-block;">► </p> <h5 :id="user.id" class="onlinners" style="color: white; display:inline-block;">
                            {{ user.name }}</h5></li>
                    </ul>
                    <ul  v-else class="list-group" style="height: 526px; overflow-y: scroll;">
                        <li @click="fetchMessages(alluser.id)" class="list-group-item" style="cursor: pointer;list-style-type: none;"
                                                            v-for="(alluser, index) in allusers" :key="index" v-if="alluser.id !== myuserid"><p
                            style="color: darkred; display: inline-block;">► </p> <h5   :id="alluser.id" class="onlinners" style="display:inline-block;">
                        {{ alluser.name }}</h5></li>

                    </ul>
                </div>
                <div  style="height: 80px!important; background-color:white!important;" class="list-group-item active">
                    <h5 v-if="onlinetable" style="color:#212121!important; font-family: 'Nunito', sans-serif;">Online Users :
                        {{users.length-1}}</h5>
                <h5 v-if="!onlinetable" style="color:#212121!important; font-family: 'Nunito', sans-serif;">All Users :
                    {{allusers.length-1}}</h5></div>
                </div>
        </div>
    </div>
</template>

<script>
    export default {
        props: ['user','myuserid','groups'],
        data() {
            return {
                isActiveUser:true,
                color:'',
                allusers:[],
                messages: [],
                onlinetable:true,
                newMessage: '',
                editMessage: '',
                users: [],
                activeUser: false,
                typingTimer: false,
                created_at: '',
                myid : '',
                usname:'',
                mes:'',
                date: '',
                emoStatus:false,
                status:[],
                grid:'',
                roomname:''
            }
        },

        created: function () {
            this.fetchUsers();
            Echo.join('chat')
                .here(user => {
                    this.users = user;
                })
                .joining(user => {
                        this.users.push(user);
                })
                .leaving(user => {
                    this.users = this.users.filter(u => u.id !== user.id);
                })
                .listen('MessageSent', (event) => {
                    this.messages.push(event.message);
                })
                .listenForWhisper('typing', user => {
                    this.activeUser = user;

                    if (this.typingTimer) {
                        clearTimeout(this.typingTimer);
                    }

                    this.typingTimer = setTimeout(() => {
                        this.activeUser = false;
                    }, 1000)
                })
        },

        methods: {
            fetchMessages: function (userId) {
                axios.get('messages/' + userId).then(response => {
                    this.messages = response.data.usersMessage;
                    this.myid = userId;
                    this.grid = '';
                    this.roomname=response.data.roomname;
                    this.status = response.data.status;
                });
                var act = document.querySelector('h5[id="'+userId+'"]');
                var disact = document.getElementsByClassName("onlinners");
                for(var i=0;i<disact.length;i++){
                    disact[i].style.color = 'white';
                }
                act.style.color = '#E793ED';
            },
            fetchgrMessages: function (grId) {
                axios.get('message/' + grId).then(response => {
                    this.messages = response.data.grMessage;
                    this.grid = grId;
                    this.roomname=response.data.roomname;
                    this.myid = '';
                    this.status = response.data.status;
                });
                var disact = document.getElementsByClassName("onlinners");
                for(var i=0;i<disact.length;i++){
                    disact[i].style.color = 'white';
                }
            },
            fetchUsers(){
                axios.get('messages').then(response => {
                    this.allusers = response.data;
                })
            },
            deletemessage(messageid){
                axios.post('messagedel',{
                    id:messageid
                });
                var delli = document.getElementById(messageid);
                delli.remove();
                // location.reload();
            },
            updatetext(messageid){
                var thisp = document.querySelector('p[data-id="'+messageid+'"]');
                var thistext = document.querySelector('input[data-id="'+messageid+'"]');
                thisp.style.display='none';
                thistext.style.display='block';
            },
            checksenduser(users,messageuserid){
                if(messageuserid){
                    for(var i=0; i<users.length; i++){
                        if(users[i].id === messageuserid){
                            this.usname = users[i].name;

                        }
                    }
                }
            },
            checkdate(date){
                if(date){
                    return true;
                }
            },
            sendMessage() {
                axios.post('messages', {
                    message: this.newMessage,
                    userId: this.myid,
                    grId: this.grid,
                });
                this.messages.push({
                    user: this.user,
                    message: this.newMessage
                });
                this.newMessage = '';
            },
            edittoMessage(id) {
                if((this.editMessage).length>1){
                    axios.post('messagesedit', {
                        editmes: this.editMessage,
                        messageid: id
                    });
                    var thisp = document.querySelector('p[data-id="'+id+'"]');
                    var thistext = document.querySelector('input[data-id="'+id+'"]');
                    thisp.innerHTML = this.editMessage;
                    thisp.style.display='block';
                    thistext.style.display='none';
                    this.editMessage = '';
                }
            },
            sendTypingEvent() {
                Echo.join('chat')
                    .whisper('typing', this.user);
            },
            toggleEmo(){
                this.emoStatus = !this.emoStatus;
            }
        }
    }
</script>
