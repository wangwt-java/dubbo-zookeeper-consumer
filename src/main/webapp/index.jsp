<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<jsp:include page="plug-in.jsp"></jsp:include>
<body>
<div class="container-fluid">
    <div class="row clearfix">
                <div class="col-md-4 column">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br><br>
                    <img src="\upload\logo.gif">
                </div>
                <div class="col-md-7 column">
                    <div class="page-header">
                        <h1>
                            SHOP++后台管理系统 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<small>一组展示</small>
                        </h1>
                    </div>
                </div>
                <div class="col-md-1 column">
                    <br> <br> <br>
                    你好:<font color="red">${loginName}</font>
                    <a href="#">[账号设置]</a>
                    <a href="<%=request.getContextPath()%>/userController/logout.jhtml">[注销]</a>
                </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-2 column"></div>
        <div class="col-md-10 column">
            <ul class="nav nav navbar-nav">
                <li>
                    <a href="javascript:treeShow(1)">商品</a>
                </li>
                <li>
                    <a href="javascript:treeShow(2)">订单</a>
                </li>
                <li>
                    <a href="javascript:treeShow(3)">会员</a>
                </li>
                <li>
                    <a href="javascript:treeShow(4)">内容</a>
                </li>
                <li>
                    <a href="javascript:treeShow(5)">营销</a>
                </li>
                <li>
                    <a href="javascript:treeShow(6)">统计</a>
                </li>
                <li>
                    <a href="javascript:treeShow(7)">系统</a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/userController/userList.jhtml">freemarker</a>
                </li>
                <li>
                    <a href="http://demo.b2b2c.shopxx.net/">首页</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="row clearfix">
            <div class="col-md-2  col-xl-2 column">
                <div id="tree-div"></div>
            </div>
            <div class="col-md-10  col-xl-10 column">
                <!-- 选项卡  tabs -->
                <ul id="myTab" class="nav nav-tabs">

                </ul>
                <!--想要打开tab页内容，需要把对应的ul和要打开的内容tab放在一个div里  -->
                <div class="tab-content">
                </div>
            </div>
       <%-- <div class="col-md-10  col-xl-10 column">
                <ul id="myTab" class="nav nav-tabs">
                <!--想要打开tab页内容，需要把对应的ul和要打开的内容tab放在一个div里  -->
                </ul>
            <div class="tab-content">
                <div class="jumbotron">
                    <h1>
                        Hello, ${loginName}!
                    </h1>
                    <p>
                        自己选择的路，趴着也要走完！
                    </p>
                    <p>
                        加油，努力学习！
                    </p>
                    <p>
                        争取拿个20K！
                    </p>
                </div>
            </div>
        </div>--%>
    </div>
</div>
<script>
    function treeShow(selectedpid){
        //获取数据
        function getTreeData(){
            var tree_data = "";
            $.ajax({
                url:"<%=request.getContextPath()%>/tree/queryTree.jhtml",
                data:{"selectedpid":selectedpid},//根据父节点id查询子节点
                type:"post",
                dataType:"json",
                async:false,
                success:function(data){
                    tree_data = data;
                },
                error:function(){
                    alert("查询出错");
                }
            });
            return tree_data;
        }
        $(function(){
            //调用treeview方法
            $('#tree-div').treeview({
                data:getTreeData(),
                onNodeSelected:function(event,node){
                    if(node.url != null && node.url !=""){
                        addTabs(node.text,node.url);
                    }
                }
            })
        })
        function addTabs(titleStr,urlStr){
            $.ajax({
                url:"<%=request.getContextPath() %>/"+urlStr,
                success:function(info){
                    $.addtabs.add({
                        id:titleStr,
                        title:titleStr,
                        content:info,
                    })
                }

            })
        }
    }


    //function toFreemarker(){
        //location.href="<%=request.getContextPath()%>/userController/userList.jhtml";
       /* $.ajax({
            url:"<%=request.getContextPath()%>/userController/userList.jhtml",
            type:"post",
            success:function(){},
            error:function(){
                alert("测试freemarker模板，请联系开发人员")
            }
        })*/
   // }


</script>
</body>
</html>
