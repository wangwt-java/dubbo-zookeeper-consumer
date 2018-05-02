<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/17 0017
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/plug-in.jsp"></jsp:include>
</head>
<body>
<div id="productNotifyTabAndTabToolBar">
    <table class="table table-bordered" id="productNotifyTab"></table>
    <div id="productNotifyTabToolBar">
        <div class="btn-group">
            <button type="button" class="btn btn-success" onclick="adProductNotify()">
                <span class="glyphicon glyphicon-plane">发货通知</span>
            </button>
            <button type="button" class="btn btn-danger">
                <span class="glyphicon glyphicon-scissors" onclick="deleteProductNotify()">删除</span>
            </button>
            <button type="button" class="btn btn-warning" onclick="refreshProductNotify()">
                <span class="glyphicon glyphicon-wrench">刷新</span>
            </button>
        </div>
    </div>
</div>
<script>
    $(function (){
        $("#productNotifyTab").bootstrapTable({
            url:"<%=request.getContextPath() %>/productNotifyController/selectProductNotifyList.jhtml",
            method: 'get', //请求方式（*）
            toolbar:"#productNotifyTabToolBar", //工具按钮用哪个容器
            striped: true, //是否显示行间隔色
            cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true, //是否显示分页（*）
            sortable: false, //是否启用排序
            sortOrder: "asc", //排序方式
            pageNumber:1, //初始化加载第一页，默认第一页
            pageSize: 10, //每页的记录行数（*）
            pageList: [10, 25, 50, 100], //可供选择的每页的行数（*）
            search: true, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            showColumns: true, //是否显示所有的列
            showRefresh: true, //是否显示刷新按钮
            minimumCountColumns: 2, //最少允许的列数
            clickToSelect: true, //是否启用点击选中行
            height: $(window).height() - 100, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            showToggle:true, //是否显示详细视图和列表视图的切换按钮
            cardView: false, //是否显示详细视图
            detailView: false, //是否显示父子表
            paginationLoop:false,//关闭分页的无限循环
            paginationPreText:"上一页",
            paginationNextText:"下一页",
            columns:[
                {field:'id',title:'',width:10,
                    formatter:function(value,row,index){
                        return "<input type='checkbox' value="+value+" name='chk'/>";
                    }
                },
                {field:'productName',title:'商品名称',width:400},
                {field:'memberName',title:'会员',width:100},
                {field:'email',title:'E-MAIL',width:100},
                {field:'createDate',title:'登记日期',width:100},
                {field:'modifyDate',title:'通知日期',width:100},
                {field:'productState',title:'状态',width:100},
                {field:'hasSent',title:'已发送',width:50,
                    formatter:function(value,row,index){
                        if(row.hasSent==1){
                            return "<font color='#7CFC00' size='5'>√</font>";
                        } else {
                            return "<font color='red' size='5'>×</font>"
                        }
                    }
                },
            ],
            //传递参数（*）
            queryParams: function(params) {
                var whereParams = {
                    "name":params.search,//精确搜索产品名称

                }
                return whereParams;
            },
        });
    })

    //刷新
    function refreshProductNotify(){
        $("#productNotifyTab").bootstrapTable('refresh');
    }
    //批量删除
    function deleteProductNotify(){
        var ids = "";
        var productNotifyIdsNum = 0;
        for (var i = 0; i < $("[name='chk']").length; i++) {
            if($("[name='chk']").eq(i).prop("checked")){
                ids += "," + $("[name='chk']").eq(i).val();
                productNotifyIdsNum++;
            }
        }
        if(productNotifyIdsNum>0){
            ids = ids.substring(1);
            var delProductNotifyIdsNum = "确定删除这"+productNotifyIdsNum+"条数据吗?";
            if(confirm(delProductNotifyIdsNum)){
                $.ajax({
                    url:"<%=request.getContextPath()%>/productNotifyController/deleteProductNotifyByPrimaryKeys.jhtml?ids="+ids,
                    success:function(){
                        alert("删除成功！！！");
                        $("#productNotifyTab").bootstrapTable('refresh');
                    },
                    error:function(){
                        alert("系统错误！！！请调试Debug检查！！！");
                    }
                })
            }
        }
        else{
            alert("请至少选择一条您要删除的数据！！！");
        }
    }
</script>
</body>
</html>
