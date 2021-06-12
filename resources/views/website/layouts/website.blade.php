<!DOCTYPE HTML>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, viewport-fit=cover" />
    <title>Dialy Expense</title>

    <link rel="stylesheet" type="text/css" href="/contents/website/styles/bootstrap.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/contents/website/fonts/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="/contents/website/custom.css">
    <!-- <link rel="manifest" href="_manifest.json"> -->
    {{-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script> --}}
</head>

<body class="theme-light" data-highlight="highlight-red">

    <div id="vueApp">
        <div id="preloader">
            <div class="spinner-border color-highlight" role="status"></div>
        </div>
        @yield('content')
    </div>


    <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
        @csrf
    </form>

    <script defer>
        setTimeout(function () {
            var loader = document['getElementById']('preloader');
            if (loader) {
                loader['classList']['add']('preloader-hide')
            }
        }, 150);
        function toaster(icon, message){
            Toast.fire({
                icon: icon,
                title: message,
            })
        }
    </script>

    <link href="/contents/website/styles/select2.css" rel="stylesheet" />
    <script src="/js/app.js"></script>
    <script src="/contents/website/scripts/custom.js"></script>

</body>
