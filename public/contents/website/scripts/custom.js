$(function(){
    $('.menu-toggle').on('click',function(){
        $('#menu-main').addClass('menu-active')
        $('.menu-hider').addClass('menu-active')
    })

    $('.menu-hider').on('click',function(){
        $('#menu-main').removeClass('menu-active')
        $('.menu-hider').removeClass('menu-active')
    })

    $('.close-menu').on('click',function(){
        $('#menu-main').removeClass('menu-active')
        $('.menu-hider').removeClass('menu-active')
    })

    $(window).on('scroll',function() {
        var windscroll = $(window).scrollTop();
        if (windscroll >= 20) {
            $('.header-auto-show').addClass('header-active');
        } else {
            $('.header-auto-show').removeClass('header-active');
        }
    });

    const footer_add_active = function(url){
        let active_html = `<strong><u></u></strong><em></em>`;
        $('#footer-bar a').removeClass('circle-nav active-nav');
        $('#footer-bar strong').remove();
        $('#footer-bar em').remove();
        $('#footer-bar a[href="'+url+'"]').append(active_html).addClass('circle-nav active-nav');
    }

    const loader = function(){
        $('.content-loader').removeClass('content-loader-hide');
        setTimeout(function () {
            var loader = document['getElementsByClassName']('content-loader');
            if (loader) {
                $('.content-loader').addClass('content-loader-hide')
            }
        }, 150);
    }

    $('#footer-bar a').on('click',function(){
        let url = $(this).attr('href');
        loader();
        footer_add_active(url);
    });

    $('#menu-main a').on('click',function(){
        let url = $(this).attr('href');
        loader();
        footer_add_active(url);
    });

    $('input').on('focus',function(){
        $(this).siblings('.error').html('');
    });

    

})
