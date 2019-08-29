<?php

namespace App\Http\Controllers;

use App\Yourgroup;
use App\Addtogroup;
use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class GroupsController extends Controller
{
    public function index(){
        $groups = Yourgroup::select('name','id','created_at')->
        where('creator', Auth::user()->id)
        ->get();

        $groups->transform(function ($item){
            $item->url = 'users?groupId='.$item->id;
            return $item;
        });

        return view('groups', [
            'groups'=>$groups]
        );
    }
    public function users(Request $request){

        $groupId = $request->groupId;
        $groupName = DB::table('yourgroups')
            ->select('name')
            ->where('id','=',$groupId)
            ->get();
        $conusers = DB::table('users')
            ->select( 'name','users.id','users.created_at')
            ->join('addtogroups', 'addtogroups.userID', '=', 'users.id')
            ->where('groupID','=', $groupId)
            ->get();
        $q=[];
        foreach ($conusers as $key=>$value) {
            $q[] = $value->id;
        }
            $users = DB::table('users')
                ->select('name','users.id','users.created_at')
                ->whereNotIn('users.id', $q)
                ->get();
            return view('users' , [
                'conusers'=>$conusers,
                'users'=>$users,
                'groupId'=>$groupId,
                'groupName'=>$groupName,
            ]);
        }
    public function adduser(Request $request){
        Addtogroup::insert([
            ['userID' => $request->userid, 'groupID' => $request->axgrid]
        ]);
    }

    public function deluser(Request $request){
        Addtogroup::where('userID', $request->userid)
            ->where('groupID', $request->axgrid)
            ->delete();
    }
    public function fetchGroups(){
        $YourGroup = Yourgroup::select('name','id','created_at')->
        where('creator', Auth::user()->id)
            ->get();

        return $YourGroup;
    }

    public function delGroups(Request $request){
        return Yourgroup::where('id', $request->id)
            ->delete();
    }

    public function sendGroup(Request $request){
        Yourgroup::create($request->all());
    }
}
