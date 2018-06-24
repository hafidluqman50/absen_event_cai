<?php

namespace App\Http\Middleware;

use Closure;
use Auth;

class isAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (Auth::check()) {
            if (Auth::user()->level == 1) {
                $user = 'admin';
            }
            elseif(Auth::user()->level == 0) {
                $user = 'petugas';
            }
            return redirect('/'.$user.'/dashboard');
        }
        return $next($request);
    }
}
