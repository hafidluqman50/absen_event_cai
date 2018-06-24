<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DashboardController extends Controller
{
    public function index() {
    	$title = 'Dashboard';
    	$page = 'beranda';
    	return view('Admin.dashboard',compact('title','page'));
    }
}
