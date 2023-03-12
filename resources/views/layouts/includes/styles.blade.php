<link href="{{asset('css/global/plugins.bundle.css')}}" rel="stylesheet" type="text/css" />
<link href="{{asset('css/style.bundle.css')}}" rel="stylesheet" type="text/css" />
<link href="{{asset('css/customDesign.css')}}" rel="stylesheet" type="text/css" />
<link href="{{asset('plugins/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css" />
@stack('styles')
<style>
    #preloader {
      overflow: hidden;
      height: 100%;
      left: 0;
      position: fixed;
      top: 0;
      width: 100%;
      z-index: 100000000;
      background-color: #fff;
      display: table;
    }
    #preloader #loading {
      display: table-cell;
      vertical-align: middle;
      text-align: center;
    }
</style>
