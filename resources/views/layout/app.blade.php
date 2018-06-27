<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    {{-- <title>Absen | @yield('title')</title> --}}
    <title>{{ $title }} | Absensi Online</title>
    <!-- Favicon-->
    <link rel="icon" href="{{ asset('frontend/images/ppg.png') }}" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="{{ asset('frontend/plugins/bootstrap/css/bootstrap.css') }}" rel="stylesheet">

    @yield('custom_css')

    <link href="{{ asset('frontend/plugins/bootstrap-select/css/bootstrap-select.css') }}" rel="stylesheet" />
    <!-- Waves Effect Css -->
    <link href="{{ asset('frontend/plugins/node-waves/waves.css') }}" rel="stylesheet" />
    {{-- <link rel="stylesheet" href="{{ asset('frontend/datatables/DataTables-1.10.16/css/jquery.dataTables.min.css') }}"> --}}
    <link rel="stylesheet" href="{{ asset('frontend/datatables/DataTables-1.10.16/css/dataTables.bootstrap.min.css') }}">

    <!-- Animation Css -->
    <link href="{{ asset('frontend/plugins/animate-css/animate.css') }}" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="{{ asset('frontend/css/style.css') }}" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="{{ asset('frontend/css/themes/all-themes.css') }}" rel="stylesheet" />
</head>

<body class="theme-green">
    <!-- Page Loader -->
    <div class="page-loader-wrapper">
        <div class="loader">
            <div class="preloader">
                <div class="spinner-layer pl-green">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
            <p>Mohon Tunggu...</p>
        </div>
    </div>
    <!-- #END# Page Loader -->
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
    <!-- Search Bar -->
    <div class="search-bar">
        <div class="search-icon">
            <i class="material-icons">search</i>
        </div>
        <input type="text" placeholder="START TYPING...">
        <div class="close-search">
            <i class="material-icons">close</i>
        </div>
    </div>
    <!-- #END# Search Bar -->
    <!-- Top Bar -->
    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false"></a>
                <a href="javascript:void(0);" class="bars"></a>
                 <a class="navbar-brand" href="#">ABSEN - PPG SAMARINDA</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <!-- Call Search -->
                    <!-- #END# Call Search -->
                    <!-- Notifications -->
                    <!-- #END# Notifications -->
                    {{-- <li class="pull-right"><a href="javascript:void(0);" class="js-right-sidebar" data-close="true"><i class="material-icons"></i></a></li> --}}
                    {{-- <li class="pull-right"><a href="javascript:void(0);" class="js-right-sidebar" data-close="true"><i class="material-icons">more_vert</i></a></li> --}}
                </ul>
            </div>
        </div>
    </nav>
    <!-- #Top Bar -->
    <section>
        <!-- Left Sidebar -->
        <aside id="leftsidebar" class="sidebar">
            <!-- User Info -->
            <div class="user-info">
                <div class="image">
                    <img src="{{ asset('frontend/images/ppg.png') }}" width="48" height="48" alt="User" />
                </div>
                <div class="info-container">
                    <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{Auth::user()->name}}</div>
                    <div class="email">{{ Auth::user()->level == 2 ? 'Admin' : (Auth::user()->level == 1 ? 'Petugas' : 'Guest') }}</div>
                    <div class="btn-group user-helper-dropdown">
                        <i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
                        <ul class="dropdown-menu pull-right">
                            <li @if(isset($page)){!!$page == 'profile' ? 'class="active"' : ''!!}@endif>
                                <a href="{{ Auth::user()->level == 2 ? url('/admin/profile') : (Auth::user()->level == 1 ? url('/petugas/profile') : url('/guest/profile')) }}">
                                    <i class="material-icons">person</i>
                                    Profile
                                </a>
                            </li>
                            <li><a href="{{ url('/logout') }}"><i class="material-icons">input</i>Sign Out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- #User Info -->
            <!-- Menu -->
            <div class="menu">
                <ul class="list">
                    <li class="header">BERANDA</li>
                    <li @if(isset($page)){!!$page == 'beranda' ? 'class="active"' : ''!!}@endif>
                        <a href="{{ Auth::user()->level == 2 ? url('/admin/dashboard') : (Auth::user()->level == 1 ? url('/petugas/dashboard') : url('/guest/dashboard')) }}">
                            <i class="material-icons">home</i>
                            <span>Home</span>
                        </a>
                    </li>
                    <li class="header">KONTEN</li>
                    @if(Auth::user()->level == 2)
                    <li @if(isset($page)){!!$page == 'kegiatan' ? 'class="active"' : ''!!}@endif>
                        <a href="{{ url('/admin/kegiatan') }}">
                            <i class="material-icons">playlist_add_check</i>
                            <span>Kegiatan</span>
                        </a>
                    </li>
                    <li @if(isset($page)){!!$page == 'kelompok' ? 'class="active"' : ''!!}@endif>
                        <a href="{{ url('/admin/kelompok') }}">
                            <i class="material-icons">group</i>
                            <span>Kelompok</span>
                        </a>
                    </li>{{-- 
                    <li @if(isset($page)){!!$page == 'anggota' ? 'class="active"' : ''!!}@endif>
                        <a href="{{ url('/admin/anggota') }}">
                            <i class="material-icons">person</i>
                            <span>Anggota</span>
                        </a>
                    </li> --}}
                    <li @if(isset($page)){!!$page == 'user' ? 'class="active"' : ''!!}@endif>
                        <a href="{{ url('/admin/users') }}">
                            <i class="material-icons">build</i>
                            <span>Data User</span>
                        </a>
                    </li>
                    @elseif(Auth::user()->level == 1)
                    <li @if(isset($page)){!!$page == 'kegiatan' ? 'class="active"' : ''!!}@endif>
                        <a href="{{ url('/petugas/kegiatan') }}">
                            <i class="material-icons">playlist_add_check</i>
                            <span>Kegiatan</span>
                        </a>
                    </li>
                    {{-- <li @if(isset($page)){!!$page == 'anggota' ? 'class="active"' : ''!!}@endif>
                        <a href="{{ url('/petugas/anggota') }}">
                            <i class="material-icons">person</i>
                            <span>Anggota</span>
                        </a>
                    </li> --}}
                    @elseif(Auth::user()->level == 0)
                    <li @if(isset($page)){!!$page == 'kegiatan' ? 'class="active"' : ''!!}@endif>
                        <a href="{{ url('/guest/kegiatan') }}">
                            <i class="material-icons">playlist_add_check</i>
                            <span>Kegiatan</span>
                        </a>
                    </li>{{-- 
                    <li @if(isset($page)){!!$page == 'anggota' ? 'class="active"' : ''!!}@endif>
                        <a href="{{ url('/guest/anggota') }}">
                            <i class="material-icons">person</i>
                            <span>Anggota</span>
                        </a>
                    </li> --}}
                    @endif
                </ul>
            </div>
            <!-- #Menu -->
            <!-- Footer -->
            <div class="legal">
                <div class="copyright">
                    &copy; <?= date('Y') ?> <a href="javascript:void(0);">Absen - PPG Samarinda</a>.
                </div>
            </div>
            <!-- #Footer -->
        </aside>
        <!-- #END# Left Sidebar -->
        <!-- Right Sidebar -->
        {{-- <aside id="rightsidebar" class="right-sidebar">
            <ul class="nav nav-tabs tab-nav-right" role="tablist">
                <li role="presentation" class="active"><a href="#skins" data-toggle="tab">SKINS</a></li>
                <li role="presentation"><a href="#settings" data-toggle="tab">SETTINGS</a></li>
            </ul>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active in active" id="skins">
                    <ul class="demo-choose-skin">
                        <li data-theme="red" class="active">
                            <div class="red"></div>
                            <span>Red</span>
                        </li>
                        <li data-theme="pink">
                            <div class="pink"></div>
                            <span>Pink</span>
                        </li>
                        <li data-theme="purple">
                            <div class="purple"></div>
                            <span>Purple</span>
                        </li>
                        <li data-theme="deep-purple">
                            <div class="deep-purple"></div>
                            <span>Deep Purple</span>
                        </li>
                        <li data-theme="indigo">
                            <div class="indigo"></div>
                            <span>Indigo</span>
                        </li>
                        <li data-theme="blue">
                            <div class="blue"></div>
                            <span>Blue</span>
                        </li>
                        <li data-theme="light-blue">
                            <div class="light-blue"></div>
                            <span>Light Blue</span>
                        </li>
                        <li data-theme="cyan">
                            <div class="cyan"></div>
                            <span>Cyan</span>
                        </li>
                        <li data-theme="teal">
                            <div class="teal"></div>
                            <span>Teal</span>
                        </li>
                        <li data-theme="green">
                            <div class="green"></div>
                            <span>Green</span>
                        </li>
                        <li data-theme="light-green">
                            <div class="light-green"></div>
                            <span>Light Green</span>
                        </li>
                        <li data-theme="lime">
                            <div class="lime"></div>
                            <span>Lime</span>
                        </li>
                        <li data-theme="yellow">
                            <div class="yellow"></div>
                            <span>Yellow</span>
                        </li>
                        <li data-theme="amber">
                            <div class="amber"></div>
                            <span>Amber</span>
                        </li>
                        <li data-theme="orange">
                            <div class="orange"></div>
                            <span>Orange</span>
                        </li>
                        <li data-theme="deep-orange">
                            <div class="deep-orange"></div>
                            <span>Deep Orange</span>
                        </li>
                        <li data-theme="brown">
                            <div class="brown"></div>
                            <span>Brown</span>
                        </li>
                        <li data-theme="grey">
                            <div class="grey"></div>
                            <span>Grey</span>
                        </li>
                        <li data-theme="blue-grey">
                            <div class="blue-grey"></div>
                            <span>Blue Grey</span>
                        </li>
                        <li data-theme="black">
                            <div class="black"></div>
                            <span>Black</span>
                        </li>
                    </ul>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="settings">
                    <div class="demo-settings">
                        <p>GENERAL SETTINGS</p>
                        <ul class="setting-list">
                            <li>
                                <span>Report Panel Usage</span>
                                <div class="switch">
                                    <label><input type="checkbox" checked><span class="lever"></span></label>
                                </div>
                            </li>
                            <li>
                                <span>Email Redirect</span>
                                <div class="switch">
                                    <label><input type="checkbox"><span class="lever"></span></label>
                                </div>
                            </li>
                        </ul>
                        <p>SYSTEM SETTINGS</p>
                        <ul class="setting-list">
                            <li>
                                <span>Notifications</span>
                                <div class="switch">
                                    <label><input type="checkbox" checked><span class="lever"></span></label>
                                </div>
                            </li>
                            <li>
                                <span>Auto Updates</span>
                                <div class="switch">
                                    <label><input type="checkbox" checked><span class="lever"></span></label>
                                </div>
                            </li>
                        </ul>
                        <p>ACCOUNT SETTINGS</p>
                        <ul class="setting-list">
                            <li>
                                <span>Offline</span>
                                <div class="switch">
                                    <label><input type="checkbox"><span class="lever"></span></label>
                                </div>
                            </li>
                            <li>
                                <span>Location Permission</span>
                                <div class="switch">
                                    <label><input type="checkbox" checked><span class="lever"></span></label>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </aside> --}}
        <!-- #END# Right Sidebar -->
    </section>
    
    <section class="content">
        <div class="container-fluid">

            @yield('content')

        </div>
    </section>
    <!-- Jquery Core Js -->
    <script src="{{ asset('frontend/plugins/jquery/jquery.min.js') }}"></script>

    <!-- Bootstrap Core Js -->
    <script src="{{ asset('frontend/plugins/bootstrap/js/bootstrap.js') }}"></script>


    <!-- Select Plugin Js -->
    <script src="{{ asset('frontend/plugins/bootstrap-select/js/bootstrap-select.js') }}"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="{{ asset('frontend/plugins/jquery-slimscroll/jquery.slimscroll.js') }}"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="{{ asset('frontend/plugins/node-waves/waves.js') }}"></script>

    <!-- Custom Js -->
    <script src="{{ asset('frontend/js/admin.js') }}"></script>
    <script src="{{ asset('frontend/datatables/DataTables-1.10.16/js/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('frontend/datatables/DataTables-1.10.16/js/dataTables.bootstrap.min.js') }}"></script>

    <!-- Demo Js -->
    <script src="{{ asset('frontend/js/demo.js') }}"></script>
    {{-- <script src="{{ asset('frontend/js/script.js') }}"></script> --}}
    @yield('custom_js')
    <script>
        $(function(){
            $('#table').DataTable();
        });
    </script>
</body>

</html>