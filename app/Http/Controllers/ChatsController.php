<?php

namespace App\Http\Controllers;

use App\Yourgroup;
use Illuminate\Http\Request;
use App\Message;
use App\Events\MessageSent;
use App\User;
use Illuminate\Support\Facades\Auth;

class ChatsController extends Controller
{
    public function __construct(){
    	$this->middleware('auth');
    }

    public function index(){
        $yourGroup = Yourgroup::select('yourgroups.name','yourgroups.id')
            ->join('addtogroups', 'addtogroups.groupID', '=' ,'yourgroups.id')
            ->where('addtogroups.userID', '=', Auth::user()->id)
            ->get();
    	return view('chats', compact('yourGroup'));
    }

    public function fetchMessagesByUser($id)
    {
        $roomname = User::select('name')
            ->where('id','=', $id)
            ->get();
        $usersMessage = Message::select('messages.id','message','users.name','user_id', 'to_user_id', 'messages.created_at as messageDate', 'users.name')
            ->whereIn('user_id',[$id, Auth::user()->id])
            ->whereIn('to_user_id', [$id, Auth::user()->id])
            ->join('users', 'users.id', '=', 'messages.user_id')
            ->with('user')
            ->orderBy('id', 'asc')
            ->get();
        return [
            'usersMessage' => $usersMessage,
            'roomname' => $roomname,
            'status' => 'success'
        ];
    }
    public function fetchMessagesByGroup($id)
    {
        $roomname = Yourgroup::select('name')
            ->where('id','=', $id)
            ->get();
        $grMessage = Message::select('messages.id','message','users.name', 'user_id', 'gr_id', 'messages.created_at as messageDate', 'users.name')
            ->where('gr_id', '=', $id)
            ->join('users', 'users.id', '=', 'messages.user_id')
            ->with('user')
            ->orderBy('id', 'asc')
            ->get();

        return [
            'grMessage' => $grMessage,
            'roomname' => $roomname,
            'status' => 'success'
        ];
    }
//    public function groups(Request $request){
//        $grname = Yourgroup::select('name')
//            ->where('id','=',$request->grid)
//            ->get();
//        return view('chats',compact('grname'));
//    }
    public function fetchUsers(){
        return \App\user::select('name','id')->get();
    }
    public function delmessage(Request $request){
        return Message::where('id', $request->id)
            ->delete();
    }
    public function editmessage(Request $request){
        return Message::where('id',$request->messageid)
        ->update(['message' => $request->editmes]);
    }
    public function sendMessages(Request $request)
    {
    	$message = auth()->user()->messages()->create([
            'message' => $request->message,
            'gr_id' => $request->grId,
            'to_user_id' => $request->userId,
        ]);
    	broadcast(new MessageSent($message))->toOthers();

    	return [
    	    'status' => 'success',
            'name' => auth()->user()->name
        ];
    }
}
