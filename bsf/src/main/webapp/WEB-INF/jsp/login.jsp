<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keys" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="${APP_PATH}/tools/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/tools/css/font-awesome.min.css">
    <link rel="stylesheet" href="${APP_PATH}/tools/css/login.css">
    <script src="${APP_PATH}/tools/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH}/tools/bootstrap/js/bootstrap.min.js"></script>
    <script src="${APP_PATH}/tools/layer/layer.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <div><a class="navbar-brand" href="index.html" style="font-size:32px;">校园基础设施维护</a></div>
        </div>
    </div>
</nav>

<div class="container">

    <form class="form-signin" role="form">
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-user"></i> 用户登录</h2>
        <div class="form-group has-success has-feedback">
            <input type="text" class="form-control" id="login_account_input" placeholder="请输入登录账号" autofocus>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-success has-feedback">
            <input type="password" class="form-control" id="login_password_input" placeholder="请输入登录密码" style="margin-top:10px;">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>

        <a class="btn btn-lg btn-success btn-block" onclick="dologin()" > 登录</a>
    </form>
</div>



<script>
    function dologin() {

        //1.非空校验
        var loginAccount=$("#login_account_input").val();
        if( loginAccount == "" ){
            layer.msg('用户的登录账号不能为空，请输入',{time:3000,icon:5,shift:6},function () {});
            return false;
        }
        var loginPassword=$("#login_password_input").val();
        if( loginPassword == "" ){
            layer.msg('用户的登录密码不能为空，请输入',{time:3000,icon:5,shift:6},function () {});
            return;
        }
        //声明一个变量，以方便关闭下面的加载效果
        var loadingIndex=null;
        $.ajax({
            url:"ajaxLogin",
            type:"post",
            data:{
                "account":loginAccount,
                "password":loginPassword
            },
            beforeSend:function () {
                loadingIndex=layer.msg('处理中',{icon:16});
            },
            success:function (result) {
                layer.close(loadingIndex);

                var href;
                if(result.success){

                    if(result.data==1){
                        href="user";
                    }else if (result.data==2){
                        href="manager";
                    }else if(result.data==3){
                        href="repairman";
                    }else {
                        href="error";
                    }
                    window.location.href=href;
                }else{
                    layer.msg(result.msg,{time:3000,icon:5,shift:6},function () {});
                }
            }
        })

    }

</script>

</body>
</html>
