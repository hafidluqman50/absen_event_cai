<?php

namespace App\Http\Controllers\Guest;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Auth;

class DashboardController extends Controller
{
    public function index() {
    	$title = 'Dashboard';
    	$page = 'beranda';
    	return view('Guest.dashboard',compact('title','page'));
    }

    public function profile() {
    	$title = 'Profile';
    	$page = 'profile';
    	$row = User::where('id_users',Auth::id())->firstOrFail();
    	return view('Guest.profile',compact('row','title','page'));
    }

    public function save(Request $request) {
		$username = $request->username;
		$password = $request->password;
		// dd($password);
		$name     = $request->name;
		// if (User::where('username',$username)->count() == 1) {
		// 	return redirect('/petugas/profile')->with('log','Maaf User Sudah Ada');
		// }
		if ($password == '') {
			$array = [
				'username' => $username,
				'name' => $name
			];
		}
		else {
			$array = [
				'username' => $username,
				'password' => bcrypt($password),
				'name' => $name
			];
		}
		User::where('id_users',Auth::id())->update($array);
		return redirect('/petugas/profile')->with('message','Berhasil Update Profile');
    }
}
