<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html lang="en">
<jsp:include page="plug-in.jsp"></jsp:include>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>shop++后台系统登陆页面</title>

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/form-elements.css">
    <link rel="stylesheet" href="assets/css/style.css">

        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="assets/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">

</head>

<body>

<!-- Content -->
<div class="top-content">

    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <a class="logo" href="login.jsp"></a>
                    <h1><strong>一组shop++</strong> 后台管理系统</h1>
                    <div class="description">
                        <p>
                            欢迎来到一组shop++后台系统
                        </p>
                    </div>
                    <div class="top-big-link">
                        <a class="btn btn-link-1 launch-modal" href="#" data-modal-id="modal-register">登陆</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- MODAL -->
<div class="modal fade" id="modal-register" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h3 class="modal-title" id="modal-register-label">登陆</h3>
                <p>请输入登陆信息</p>
            </div>

            <div class="modal-body">

                <form role="form" id="login-form" class="registration-form">
                    <div class="form-group">
                        <label class="sr-only" for="form-first-name">账号</label>
                        <input type="text" name="name" placeholder="请输入账号..." class="form-first-name form-control" id="form-first-name">
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="form-last-name">密码</label>
                        <input type="password" name="pwd" placeholder="请输入密码..." class="form-last-name form-control" id="form-last-name">
                    </div>
                   <div class="form-group">
                        <label class="sr-only" for="vali-id">验证码</label>
                        <input type="text" name="vali" placeholder="请输入验证码..." class="vali-id form-control" id="vali-id">
                        <img src="<%=request.getContextPath()%>/authImage" onclick="F5(this)"/><br/>
                    </div>
                    <button type="button" id="login-button" class="btn">登陆</button>
                </form>

            </div>

        </div>
    </div>
</div>


<!-- Javascript -->
<script src="assets/js/jquery-1.11.1.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/jquery.backstretch.min.js"></script>
<script src="assets/js/scripts.js"></script>

<!--[if lt IE 10]>
    <script src="assets/js/placeholder.js"></script>
<![endif]-->

<script>
    function F5(obj){
        obj.src = "<%=request.getContextPath()%>/authImage?"+Math.random();
    }

    $("#login-button").click(function (){
        $.ajax({
            url:"<%=request.getContextPath()%>/userController/login.jhtml",
            type:"post",
            data:$("#login-form").serialize(),
            success:function (msg){
                var str = "";
                if(msg == 0){
                    str = "用户名不存在";
                }else if(msg == 1){
                    str = "密码错误";
                }else if(msg == 2){
                    str = "登录成功";
                    location.href="<%=request.getContextPath()%>/userController/toIndex.jhtml";
                }else if(msg == 3){
                    str = "验证码输入错误";
                }

                BootstrapDialog.show({
                    title: '提示消息',
                    message: str
                });
            },
            error:function (){
                alert("登陆程序出现异常，请联系开发人员");
            }
        })
    })


</script>

</body>

</html>