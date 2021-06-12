@extends('website.layouts.website')
@section('content')

    <div id="page">

        @if (Auth::user()->role_id == 4)
            @include('website.layouts.employee-nav')
        @endif

        @if (Auth::user()->role_id == 2)
            @include('website.layouts.admin-nav')
        @endif

        <div class="page-content">
            <div class="card card-style shadow-xl content_wraper">
                <div class="content-loader content-loader-hide"></div>
                <div class="content">
                    {{-- @if (Auth::user()->role_id <= 2)
                        <script>window.location = "/admin";</script>
                    @endif --}}

                    @if (Auth::user()->role_id == 4)
                        <employee></employee>
                    @endif

                    @if (Auth::user()->role_id == 2)
                        <admin></admin>
                    @endif
                </div>
            </div>

            {{-- <div class="card card-full-left card-style">
                <div class="content">
                </div>
            </div> --}}

        </div>
    </div>

@endsection

