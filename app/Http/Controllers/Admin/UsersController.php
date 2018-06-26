<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;

class UsersController extends Controller
{
    public function index() {
    	$title = 'Users';
    	$page = 'user';
    	$users = User::where('status_delete',0)->whereIn('level',[1,0])->get();
    	return view('Admin.user.main',compact('title','page','users'));
    }

    public function tambah() {
    	$title = 'Form Users';
    	$page = 'user';
    	return view('Admin.user.form-user',compact('title','page'));
    }

    public function edit($id) {
    	$title = 'Form Users';
    	$page = 'user';
    	$row = User::where('status_delete',0)->whereIn('level',[1,0])->where('id_users',$id)->firstOrFail();
    	return view('Admin.user.form-user',compact('title','page','row'));
    }

    public function delete($id) {
        User::where('id_users',$id)->update(['status_delete'=>1,'deleted_at'=>date('Y-m-d H:i:s')]);
    	return redirect('/admin/users')->with('message','Berhasil Hapus User');
    }

    public function save(Request $request) {
    	$name = $request->name;
    	$username = $request->username;
    	// if (User::where('username',$username)->count() == 1) {
    	// 	return redirect('')->with('log','Maaf User Sudah Ada');
    	// }
    	$password = $request->password;
    	$level = $request->level;
    	$status_akun = 1;
    	$id_users = $request->id_users;
    	if ($id_users == '') {
	    	$array = [
	    		'name' => $name,
	    		'username' => $username,
	    		'password' => bcrypt($password),
	    		'level' => $level,
	    		'status_akun' => $status_akun
	    	];
	    	User::create($array);
	    	$message = 'Berhasil Input User';
    	}
    	else {
    		if ($password == '') {
		    	$array = [
		    		'name' => $name,
		    		'username' => $username,
		    		'level' => $level,
		    		'status_akun' => $status_akun
		    	];
    		}
    		else {
		    	$array = [
		    		'name' => $name,
		    		'username' => $username,
		    		'password' => bcrypt($password),
		    		'level' => $level,
		    		'status_akun' => $status_akun
		    	];
    		}
	    	User::where('id_users',$id_users)->update($array);
	    	$message = 'Berhasil Update User';
    	}
    	return redirect('/admin/users')->with('message',$message);
    }

    public function statusAkun($id) {
    	$user = User::where('id_users',$id);
    	if ($user->firstOrFail()->status_akun == 1) {
    		$user->update(['status_akun' => 0]);
    		$message = 'Berhasil Nonaktifkan Akun';
    	}
    	else {
    		$user->update(['status_akun' => 1]);
    		$message = 'Berhasil Aktifkan Akun';	
    	}
    	return redirect('/admin/users')->with('message',$message);
    }
}
