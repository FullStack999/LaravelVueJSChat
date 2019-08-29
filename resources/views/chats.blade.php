@extends('layouts.app')

@section('content')
<div class="container">

   <chats :myuserid="{{auth()->user()->id}}" :user="{{auth()->user()}}" :groups="{{$yourGroup}}"></chats>
</div>
@endsection
