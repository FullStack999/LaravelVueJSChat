@extends('layouts.app')

@section('content')
    <div class="container">

        <users :groupname="{{$groupName}}" :groupid="{{$groupId}}" :conusers="{{$conusers}}" :users="{{$users}}" :user="{{auth()->user()}}"></users>
    </div>
@endsection
