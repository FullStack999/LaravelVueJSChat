@extends('layouts.app')

@section('content')
    <div class="container">

        <groups :myuserid="{{auth()->user()->id}}" :groups="{{$groups}}"></groups>
    </div>
@endsection
