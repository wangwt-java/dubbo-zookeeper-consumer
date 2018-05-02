<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/10
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <jsp:include page="/plug-in.jsp"></jsp:include>
    <title>Title</title>
</head>
<body>
<div id="ordertabToolBar">
    <div class="btn-group">
        <button type="button" class="btn btn-info" >
            <span class="glyphicon glyphicon-scissors" onclick="deletepayment()">删除</span></button>
        <button type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-scissors" onclick="deletepayment()">刷新</span>
        </button>
        <button type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-scissors" onclick="deletepayment()">订单</span>
        </button>
        <button type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-scissors" onclick="searchorder()">每页显示</span>
        </button>
        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#">2</a>
            </li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#">4</a>
            </li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#">6</a>
            </li>
            <li role="presentation" class="divider"></li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#">8</a>
            </li>
        </ul>
    </div>
</div>
<table class="table" id="order-table" border="1"></table>
<script>
    //批量删除
  function deleteorderlist() {
        //获取所有被选中的记录
        var rows = $("#order-table").bootstrapTable('getSelections');
        if (rows.length== 0) {
            alert("请先选择要删除的记录!");
            return;
        }
        var ids = '';
        for (var i = 0; i < rows.length; i++) {
            ids += rows[i]['id'] + ",";
        }
        ids = ids.substring(0, ids.length - 1);
        deleteorder(ids);
        alert(ids)
    }
    //删除
    function deleteorder(ids) {
        var msg = "您真的确定要删除吗？";
        if (confirm(msg) == true) {
            $.ajax({
                url: "<%=request.getContextPath()%>/orderController/deleteorder.jhtml",
                type: "post",
                data: {
                    ids: ids
                },
                success: function (data) {
                    alert(data.msg);
                    //重新加载记录
                    //重新加载数据
                    $("#order-table").bootstrapTable('refresh');
                }
            });
        }
    }

    function addorder(){
            BootstrapDialog.show({
                title: '新增',
                message: $('<div></div>').load('<%=request.getContextPath()%>/orderController/toaddorder.jhtml'),
                buttons: [{
                    label: '保存',
                    action: function(dialog) {
                        $.ajax({
                            url:"<%=request.getContextPath()%>/orderController/saveorder.jhtml",
                            data:$("#addForm").serialize(),
                            dataType:"text",
                            success:function(flag){
                                dialog.close();
                                $("#file-table").bootstrapTable("refresh");
                            },
                            error:function(){
                                alert("添加程序出错！")
                            }
                        })
                    }
                },{
                    label: '关闭',
                    action: function(dialog) {
                        //更改弹框标题
//			                dialog.setTitle('Title 2');
                        dialog.close();
                    }
                }]
            });

    }
    $(function(){
        searchorder();
    })
    function  searchorder(){

       $('#order-table').bootstrapTable({
            url:"<%=request.getContextPath()%>/orderController/orderlist.jhtml",
           toolbar:"#ordertabToolBar",
            striped: true,//隔行变色
//          showColumns:true,//是否显示 内容列下拉框
            showPaginationSwitch:true,//是否显示 数据条数选择框
            minimumCountColumns:1,//最小留下一个
            showRefresh:true,//显示刷新按钮
            showToggle:true,//显示切换视图
 //           search:true,//是否显示搜索框
  //          searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
            pagination:true,//开启分页
            paginationLoop:true,//开启分页无限循环
            pageNumber:1,//当前页数
            pageSize:3,//每页条数
            pageList:[3,5,7,10],//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
           sidePagination:"server",//
            method:'post',//发送请求的方式
            contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
          queryParams:function(data){
                console.info(data);
                return {
                /*timeStart:$("#timeStart").val(),
                timeEnd:$("#timeEnd").val(),
                 name:data.search,*/
                page:this.pageNumber,//当前页
                rows:this.pageSize //每页条数
                }
            },
            columns: [
                {
                    checkbox:true,
                },{
                    field: 'id',
                    title: '编号',
                    idField:true,
                    width: 100
                },{
                    field: 'member',
                    title: '会员',
                    width: 100
                } ,{
                    field: 'consignee',
                    title: '收货人',
                    width: 100

                },{
                    field: 'paymentMethodName',
                    title: '支付方式名称',
                    width: 100,
                },{
                    field: 'shippingMethodName',
                    title: '配送方式名称',
                    width: 100,
                },{
                    field: 'orderStatus',
                    title: '订单状态',
                    width: 100
                },{
                    field: 'paymentStatus',
                    title: '支付状态',
                    width: 100
                },{
                    field: 'shippingStatus',
                    title: '配送状态',
                    width: 100
                },{
                    field: 'createDate',
                    title: '创建日期起',
                    width: 100
                },{
                    field: 'aaa',
                    title: '打印',
                    width: 100
                },{
                    field: 's',
                    title: '操作',
                    width: 100,
                    formatter:function(value,row,index){

                        return "<input type='button' class='btn btn-success' value='**' onclick='getjilu(\""+row.id+"\")'/> ";
                    }
                }
             ]
        })
    }


</script>
</body>
</html>
