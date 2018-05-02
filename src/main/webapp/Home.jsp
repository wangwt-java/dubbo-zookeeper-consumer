<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/25 0025
  Time: 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SHOP购物</title>
    <jsp:include page="plug-in.jsp"></jsp:include>
    <style type="text/css">
        body {padding-top:55px;}
        ul li{
            list-style: none;
        }
        .a_hover:hover{color: red;text-decoration: none;}
    </style>
</head>
<body style="background-color: #f9f9f9">
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">切换导航</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <!-- Brand and toggle get grouped for better mobile display -->
        <!-- 头部信息 -->
        <div class="navbar-header">
            <a class="navbar-brand glyphicon glyphicon-globe" href="#" id="menu-toggle">SHOP</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#" target='_blank'>你好，请登录</a></li>
                <li><a href="#" target='_blank'>免费注册</a></li>
                <li><a href="#" target='_blank'>我的订单</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">我的SHOP<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#" target='_blank'>待处理订单</a><a href="#" target='_blank'>消息</a></li>
                        <li><a href="#" target='_blank'>返修退换货</a><a href="#" target='_blank'>我的问答</a></li>
                        <li><a href="#" target='_blank'>降价商品</a><a href="#" target='_blank'>我的关注</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#" target='_blank'>我的京豆</a><a href="#" target='_blank'>我的优惠券</a></li>
                        <li><a href="#" target='_blank'>我的白条</a><a href="#" target='_blank'>我的理财</a></li>
                    </ul>
                </li>
                <li><a href="#">SHOP会员</a></li>
                <li><a href="#">企业采购</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" id="kehufuwu" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">客户服务<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="kehufuwu">
                        <li role="presentation" class="dropdown-header">客户</li>
                        <li role="presentation" >
                            <a role="menuitem" target='_blank' tabindex="-1" href="#">帮助中心</a>
                            <a role="menuitem" target='_blank' tabindex="-1" href="#">售后服务</a>
                        </li>
                        <li role="presentation">
                            <a role="menuitem" target='_blank' tabindex="-1" href="#">在线客服</a>
                            <a role="menuitem" target='_blank' tabindex="-1" href="#">意见建议</a>
                        </li>
                        <li role="presentation">
                            <a role="menuitem" target='_blank' tabindex="-1" href="#">电话客服</a>
                            <a role="menuitem" target='_blank' tabindex="-1" href="#">客服邮箱</a>
                        </li>
                        <li role="presentation">
                            <a role="menuitem" target='_blank' tabindex="-1" href="#">金融客服</a>
                            <a role="menuitem" target='_blank' tabindex="-1" href="#">全球售客服</a>
                        </li>
                        <li role="presentation" class="divider"></li>
                        <li role="presentation" class="dropdown-header">商户</li>
                        <li role="presentation">
                            <a role="menuitem" target='_blank' tabindex="-1" href="#">合作招商</a>
                            <a role="menuitem" target='_blank' tabindex="-1" href="#">学习中心</a>
                        </li>
                        <li role="presentation">
                            <a role="menuitem" target='_blank' tabindex="-1" href="#">商家后台</a>
                            <a role="menuitem" target='_blank' tabindex="-1" href="#">京麦工作台</a>
                        </li>
                        <li role="presentation">
                            <a role="menuitem" target='_blank' tabindex="-1" href="#">商家帮助</a>
                            <a role="menuitem" target='_blank' tabindex="-1" href="#">规则平台</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">网站导航<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#" class="glyphicon glyphicon-question-sign "> 客服中心</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#" class="glyphicon glyphicon-comment"> 预购店铺</a></li>
                        <li><a href="#" class="glyphicon glyphicon-picture"> 商场照片</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#" class="glyphicon glyphicon-leaf"> link</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- ======================================================================================== -->
<div class="row">
    <div class="col-md-3">
        <div style="float:left;width:100px;height:600px;background-color:#f9f9f9;"></div>
        <div style="float:left;">
            <div style="width:200px;height:200px;">
                <img width="200px" height="200px" src="/image/loveShop.jpg">
            </div>
            <div style="width:200px;height:400px;background-color:white;">
                <ul>
                    <li>
                        <a href="#" class="a_hover" target='_blank' style="text-decoration:none;">手机</a>/
                        <a href="#" class="a_hover" target='_blank' style="text-decoration:none;">运营商</a>/
                        <a href="#" class="a_hover" target='_blank' style="text-decoration:none;">数码</a>
                    </li>
                    <li>
                        <a href="#" class="a_hover" target='_blank' style="text-decoration:none;">电脑</a>/
                        <a href="#" class="a_hover" target='_blank' style="text-decoration:none;">办公</a>
                    </li>
                    <li>
                        <a href="#" class="a_hover" target='_blank' style="text-decoration:none;">家居</a>/
                        <a href="#" class="a_hover" target='_blank' style="text-decoration:none;">家具</a>/
                        <a href="#" class="a_hover" target='_blank' style="text-decoration:none;">家装</a>/
                        <a href="#" class="a_hover" target='_blank' style="text-decoration:none;">厨具</a>
                    </li>
                    <li>
                        <a href="#" class="a_hover" target='_blank' style="text-decoration:none;">男装</a>/
                        <a href="#" class="a_hover" target='_blank' style="text-decoration:none;">女装</a>/
                        <a href="#" class="a_hover" target='_blank' style="text-decoration:none;">童装</a>/
                        <a href="#" class="a_hover" target='_blank' style="text-decoration:none;">内衣</a>
                    </li>
                    <li>
                        <a href="#" class="a_hover" target='_blank' style="text-decoration:none;">男鞋</a>/
                        <a href="#" class="a_hover" target='_blank' style="text-decoration:none;">女鞋</a>/
                        <a href="#" class="a_hover" target='_blank' style="text-decoration:none;">箱包</a>/
                        <a href="#" class="a_hover" target='_blank' style="text-decoration:none;">运动</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="col-md-8">
        <div class="form-group" style="float: left;width: 800px;">
            <input type="text" class="form-control" placeholder="Search">
        </div>
        <div style="float: left">
            <button type="button" style="width: 55px;height: 33px;" class="btn btn-danger" onclick="aaa()">
                <span class="glyphicon glyphicon-search"></span>
            </button>
        </div>
        <div id="productShowDiv"></div>
    </div>
    <div class="col-md-1">

    </div>
</div>
<script>
    var productShow = "";
    $(function(){
        $.ajax({
            url:"<%=request.getContextPath() %>/productController/selectProductList.jhtml",
            type:'post',
            dataType: "json",
            success:function(data){
                for (var i = 0; i < data.length; i++) {
                    productShow+="<div style='float: left;width: 200px;height: 350px'><img style='width: 200px;height: 240px;border='0'' src='/image/clothes.jpg'><span><font color='red' size='4'>￥"+data[i].price+"</font></span><div style='height: 10px'>"+data[i].name+"</div></div>"
                }
                $("#productShowDiv").append(productShow);
            },
            error:function(){
                alert("ajax失败");
            }
        });
    })
</script>
</body>
</html>
