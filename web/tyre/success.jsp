<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
    String ctx = request.getContextPath();

%>
<!DOCTYPE html>
<html class="no-js">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>欢迎入驻轮胎点点</title>
    <link href="<%=ctx %>/assets/css/index.css" rel="stylesheet"/>
    <style>
        .mask {
            position: fixed;
            top:0;
            left: 0;
            right: 0;
            bottom:0;
            background-color: rgba(0,0,0,0.5);
        }
        .dialog-win {
            position: absolute;
            left:50%;
            top: 50%;
            width: 90%;
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
            background-color: white;
            -webkit-border-radius: 0.5em;
            -moz-border-radius: 0.5em;
            border-radius: 0.5em;
        }

        .dialog-win .dialog-head {
            padding-top: 1em;
        }

        .dialog-win .dialog-head p {
            color: #f74e52;
            font-size: 1.5em;
            margin: 0;
            text-align: center;
        }

        .dialog-win .dialog-body {
            border-bottom: 1px solid #b9b9b9;
            margin: 0 0.875em;
            padding: 0.5em 0;
        }

        .dialog-win .dialog-body p {
            color: #666666;
            margin:0 auto;
            text-align: center;
            line-height: 1.5;
        }

        .dialog-win .dialog-foot{
            padding: 1em 0;
            text-align: center;

        }

        .dialog-win .dialog-foot p {
            margin: 0 auto;
            font-size: 1.2em;
        }

        .dialog-win .dialog-foot  .close-btn{
            color: black;
            text-decoration: none;
        }
    </style>
</head>
<body>
<body>
<form id="store">
    <div class="mask">
        <div class="dialog-win">
            <div class="dialog-head">
                <p>入驻成功</p>
            </div>
            <div class="dialog-body">
                <p style="font-size: 0.875em;">您的入驻申请已提交，请等待平台审核;</p>
                <p style="font-size: 0.75em;">若有疑问请致电：400-665-8027咨询</p>
            </div>
            <div class="dialog-foot">
                <p><a href="javascript:void(0);" class="close-btn">关闭</a></p>
            </div>
        </div>
    </div>
</form>
</body>



<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<%=ctx%>/assets/js/jquery.min.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<![endif]-->
</body>
<script language="javascript" type="text/javascript">
    $(function(){
    });
    $('.dialog-win .dialog-foot').on('click',function() {
        window.location.href="<%=ctx%>/tyre/index.do";
    });
</script>
</html>