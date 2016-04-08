//判断是否手机访问
$(document).ready(function() {
    var pk = document.body.clientWidth;
    document.getElementById('lbc_right').style.width = pk + "px";
//鼠标移动特效
$(function (){
    $('.hc_cont img').hover(function () {
        $(this).animate({opacity:'0.7'},300);
    },function(){
        $(this).animate({opacity:'1'},300);
    });

    if(navigator.userAgent.indexOf("MSIE")<0) {
        $('.morefw').hover(function () {
            $(this).animate({opacity: '0.5'}, 300);
        }, function () {
            $(this).animate({opacity: '1'}, 300);
        });

        $('.footh_wenzi a').hover(function(){
            $(this).animate({opacity:'0.5'},350);
        },function(){
            $(this).animate({opacity:'1'},350);
        });
    }

    $('.scroll_Top img').hover(function(){
        $(this).animate({opacity:'0.5'},350);
    },function(){
        $(this).animate({opacity:'1'},350);
    });

    $('.hccc_lefthover').hover(function(){
        $(this).animate({opacity:'0.5'},350);
    },function(){
        $(this).animate({opacity:'1'},350);
    });

    $('.qg_botton').hover(function(){
        $(this).animate({opacity:'0.5'});
    },function(){
        $(this).animate({opacity:'1'});
    });

    $('.guanggao img').hover(function(){
        $(this).animate({opacity:'0.5'});
    },function(){
        $(this).animate({opacity:'1'});
    });

    $('.guanggaos img').hover(function(){
        $(this).animate({opacity:'0.5'});
    },function(){
        $(this).animate({opacity:'1'});
    });

    $('.weixiukeng img').hover(function(){
        $(this).animate({opacity:'0.5'});
    },function(){
        $(this).animate({opacity:'1'});
    });

    $('.hcccr_juti').hover(function(){
        $(this).animate({top:'-10px'});
    },function(){
        $(this).animate({top:'0px'});
    });

    $('.meic_cont').hover(function(){
        this.style.border = "2px solid #39aef4";
    },function(){
        this.style.border = "1px solid #dcdcdc";
    });

    $('#jcl_cont').hover(function(){
        this.style.border = "8px solid #efefef";
        document.getElementById('jclccimg').src = "images/guzhangcheng.png";
    },function(){
        this.style.borderTop = "0px";
        this.style.borderRight = "0px";
        this.style.borderLeft = "1px solid #dcdcdc";
        this.style.borderBottom = "1px solid #dcdcdc";
        document.getElementById('jclccimg').src = "images/guzhangd.png";
    });

    $('#jcl_conts').hover(function(){
        this.style.border = "8px solid #efefef";
        document.getElementById('jclccimgs').src = "images/dongphcheng.png";
    },function(){
        this.style.borderTop = "0px";
        this.style.borderRight = "1px solid #dcdcdc";
        this.style.borderLeft = "1px solid #dcdcdc";
        this.style.borderBottom = "1px solid #dcdcdc";
        document.getElementById('jclccimgs').src = "images/dongphhui.png";
    });

    $('#jcl_contss').hover(function(){
        this.style.border = "8px solid #efefef";
        document.getElementById('jclccimgss').src = "images/guzhangcheng.png";
    },function(){
        this.style.borderTop = "0px";
        this.style.borderRight = "0px";
        this.style.borderLeft = "1px solid #dcdcdc";
        this.style.borderBottom = "1px solid #dcdcdc";
        document.getElementById('jclccimgss').src = "images/guzhangd.png";
    });

    $('#jcl_contsss').hover(function(){
        this.style.border = "8px solid #efefef";
        document.getElementById('jclccimgsss').src = "images/guzhangcheng.png";
    },function(){
        this.style.borderTop = "0px";
        this.style.borderRight = "1px solid #dcdcdc";
        this.style.borderLeft = "1px solid #dcdcdc";
        this.style.borderBottom = "1px solid #dcdcdc";
        document.getElementById('jclccimgsss').src = "images/guzhangd.png";
    });

    $('.yhc_cont').hover(function(){
        this.style.border = "2px solid #39aef4";
    },function(){
        this.style.border = "0px";
    });
});


});

//顶部滚动页面
function kuaisu_show(){
    document.getElementById('lbc_left').style.display = "block";
}
function kuaisu_hide(){
    document.getElementById('lbc_left').style.display = "none";
}

//鼠标移动效果
function kjsee(){
    document.getElementById("abs_kjsee").style.right = "-2px";
    document.getElementById('kuaijie_cont').style.display = "block";
    document.getElementById('anzhuang').style.border = "2px solid #6DBEFD";
}

function kjnone(){
    hideAbs();
    document.getElementById('kuaijie_cont').style.display = "none";
    document.getElementById('anzhuang').style.border = "0px";
}

function kjsees(){
    document.getElementById("abs_kjsees").style.right = "-2px";
    document.getElementById('kuaijie_conts').style.display = "block";
    document.getElementById('anzhuangs').style.border = "2px solid #6DBEFD";
}

function kjnones(){
    hideAbs();
    document.getElementById('kuaijie_conts').style.display = "none";
    document.getElementById('anzhuangs').style.border = "0px";
}

function kjseess(){
    document.getElementById("abs_kjseess").style.right = "-2px";
    document.getElementById('kuaijie_contss').style.display = "block";
    document.getElementById('anzhuangss').style.border = "2px solid #6DBEFD";
}

function kjnoness(){
    hideAbs();
    document.getElementById('kuaijie_contss').style.display = "none";
    document.getElementById('anzhuangss').style.border = "0px";
}
function kjseesss(){
    document.getElementById("abs_kjseesss").style.right = "-2px";
    document.getElementById('kuaijie_contsss').style.display = "block";
    document.getElementById('anzhuangsss').style.border = "2px solid #6DBEFD";
}

function kjnonesss(){
    hideAbs();
    document.getElementById('kuaijie_contsss').style.display = "none";
    document.getElementById('anzhuangsss').style.border = "0px";
}

function hideAbs() {
    var $abs_kjsee = document.getElementById("abs_kjsee");
    var $abs_kjsees = document.getElementById("abs_kjsees");
    var $abs_kjseess = document.getElementById("abs_kjseess");
    var $abs_kjseesss = document.getElementById("abs_kjseesss");

    $abs_kjsee.style.right = "3px";
    $abs_kjsees.style.right = "3px";
    $abs_kjseess.style.right = "3px";
    $abs_kjseesss.style.right = "3px";
}

function div1(ele, img_src) {
    var $div11 = document.getElementById("div11");
    var $div12 = document.getElementById("div12");
    var $div13 = document.getElementById("div13");
    var $div14 = document.getElementById("div14");
    var $div15 = document.getElementById("div15");
    var $div16 = document.getElementById("div16");

    $div11.getElementsByTagName("div")[0].style.color = "#979797";
    $div12.getElementsByTagName("div")[0].style.color = "#979797";
    $div13.getElementsByTagName("div")[0].style.color = "#979797";
    $div14.getElementsByTagName("div")[0].style.color = "#979797";
    $div15.getElementsByTagName("div")[0].style.color = "#979797";
    $div16.getElementsByTagName("div")[0].style.color = "#979797";

    $div11.getElementsByTagName("img")[0].setAttribute("src", "/images/fix_01.png");
    $div12.getElementsByTagName("img")[0].setAttribute("src", "/images/fix_02.png");
    $div13.getElementsByTagName("img")[0].setAttribute("src", "/images/fix_03.png");
    $div14.getElementsByTagName("img")[0].setAttribute("src", "/images/fix_04.png");
    $div15.getElementsByTagName("img")[0].setAttribute("src", "/images/fix_05.png");
    $div16.getElementsByTagName("img")[0].setAttribute("src", "/images/fix_06.png");


    ele.getElementsByTagName("div")[0].style.color = "#8EB6DD";
    ele.getElementsByTagName("img")[0].setAttribute("src", img_src);
}

function div1out(ele, img_src) {
    ele.getElementsByTagName("div")[0].style.color = "#979797";
    ele.getElementsByTagName("img")[0].setAttribute("src", img_src);
}