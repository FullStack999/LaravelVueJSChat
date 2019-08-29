<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
use App\Events\WebsocketDemoEvent;
use App\Yourgroup;
Route::get('/', function () {
	broadcast(new WebsocketDemoEvent('some data'));
    return view('welcome');
});

Route::get('/chats', 'ChatsController@index');
Route::get('/groups', 'GroupsController@index');
Route::post('/groupsadd', 'GroupsController@sendGroup');
Route::post('/addus', 'GroupsController@adduser');
Route::post('/delus', 'GroupsController@deluser');
Route::get('/groupsadd', 'GroupsController@fetchGroups');
Route::get('/users', 'GroupsController@users');
Route::post('/groupsdel', 'GroupsController@delGroups');
Route::post('/messagedel', 'ChatsController@delmessage');
Route::post('/messagesedit', 'ChatsController@editmessage');
Route::get('/messages/{id}', 'ChatsController@fetchMessagesByUser');
Route::get('/message/{id}', 'ChatsController@fetchMessagesByGroup');
Route::get('/messages', 'ChatsController@fetchUsers');
Route::get('/creategroup', 'GroupsController@index');
Route::post('/messages', 'ChatsController@sendMessages');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
