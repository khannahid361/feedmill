@include('dealerpanel::includes.mobile-header')
<div class="d-flex flex-column flex-root">
    <div class="d-flex flex-row flex-column-fluid page">
       @include('dealerpanel::includes.sidebar')
        <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
           @include('dealerpanel::includes.header')
            <div class="content  d-flex flex-column flex-column-fluid" id="kt_content">
                @include('dealerpanel::includes.sub-header')
                @yield('content')
            </div>
           @include('dealerpanel::includes.footer')
        </div>
    </div>
</div>
@include('dealerpanel::includes.user-profile')
@include('dealerpanel::includes.scroll-top')
@include('dealerpanel::design.scripts')
