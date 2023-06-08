<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>404</title>
    <style>
    .page_404 {
        padding: 40px 0;
        background: #fff;
        font-family: 'Arvo', serif;
    }

    .page_404 img {
        width: 100%;
    }

    .four_zero_four_bg {

        background-image: url(https://cdn.dribbble.com/users/285475/screenshots/2083086/dribbble_1.gif);
        height: 400px;
        background-position: center;
        background-repeat: no-repeat;
    }


    .four_zero_four_bg h1 {
        font-size: 80px;
    }

    .four_zero_four_bg h3 {
        font-size: 80px;
    }

    .link_404 {
        color: #fff !important;
        padding: 10px 20px;
        background: #39ac31;
        margin: 20px 0;
        display: inline-block;
    }

    .contant_box_404 {
        margin-top: -50px;
    }
    .text-center{
        text-align: center;
    }
    </style>
</head>
<body>
    <section class="page_404">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 ">
                    <div class="col-sm-10 col-sm-offset-1 text-center">
                        <div class="four_zero_four_bg">
                            <h1 class="text-center ">404</h1>

                        </div>

                        <div class="contant_box_404">
                            <h1 style="font-size: 50px;margin:0;">
                                Look like you're lost
                            </h1>

                            <h5 style="font-size: 25px;margin:0;">the page you are looking for not avaible!</h5>

                            <a href="<?php echo e(url('/')); ?>" class="link_404" style="text-decoration: none;">Go to Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html><?php /**PATH H:\laragon\www\insaf\resources\views/errors/404.blade.php ENDPATH**/ ?>