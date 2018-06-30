<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\KegiatanModel as Kegiatan;
use App\Model\AnggotaModel as Anggota;
use App\Model\KelompokModel as Kelompok;
use App\User;
use Auth;

class DashboardController extends Controller
{
    public function index() {
    	$title = 'Dashboard';
    	$page = 'beranda';
    	$kegiatan = Kegiatan::count();
    	$kelompok = Kelompok::count();
    	$anggota = Anggota::count();
    	$user = User::count();
    	return view('Admin.dashboard',compact('title','page','kegiatan','kelompok','anggota','user'));
    }

    public function profile() {
    	$title = 'Profile';
    	$page = 'profile';
    	$row = User::where('id_users',Auth::id())->firstOrFail();
    	return view('Admin.profile',compact('row','title','page'));
    }

    public function save(Request $request) {
		$username = $request->username;
		$password = $request->password;
		$name     = $request->name;
		if ($username == '' && User::where('username',$username)->count() == 1) {
			return redirect('/admin/profile')->with('log','Maaf User Sudah Ada');
		}
		if ($username == '' && $password == '') {
			$array = [
				'name' => $name
			];
		}
		elseif ($username == '') {
			$array = [
				'password' => bcrypt($password),
				'name' => $name
			];
		}
		elseif($password == '') {
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
		return redirect('/admin/profile')->with('message','Berhasil Update Profile');
    }
}
