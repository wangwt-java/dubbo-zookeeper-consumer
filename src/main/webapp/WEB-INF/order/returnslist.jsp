<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/04/12
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>退货</title>
    <jsp:include page="/plug-in.jsp"></jsp:include>
</head>
<body>
<div id="returnstoolbar">
    <div class="btn-group">
        <button type="button" class="btn btn-info" >
            <span class="glyphicon glyphicon-scissors" onclick="deletesreturns()">删除</span></button>
        <button type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-scissors" onclick="deletesreturns()">刷新</span>
        </button>
        <button type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-scissors" onclick="deletesreturns()">订单</span>
        </button>
        <button type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-scissors" onclick="deletesreturns()">每页显示</span>
        </button>
    </div>
</div>
<!-- 数据表格 -->
<table class="table" id="returns-table" border="1"></table>

<script type="text/javascript">
    $(function (){
        searchreturns();
    })
    function searchreturns(){



        $("#returns-table").bootstrapTable({
            url:"<%=request.getContextPath()%>/returns/queryReturnsList.jhtml",
            toolbar: "#returnstoolbar",
            striped: true,//隔行变色
            showColumns: true,//是否显示 内容列下拉框
            showPaginationSwitch: true,//是否显示 数据条数选择框
            minimumCountColumns: 1,//最小留下一个
            showRefresh: true,//显示刷新按钮
            showToggle: true,//显示切换视图
            // search:true,//是否显示搜索框
            //  searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
            pagination: true,//开启分页
            paginationLoop: true,//开启分页无限循环
            pageNumber: 1,//当前页数
            pageSize: 2,//每页条数
            pageList: [1, 2, 3, 4],//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
            sidePagination: "server",//
            method: 'post',//发送请求的方式
            contentType: "application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
            queryParams: function () {

//	                 alert(name+","+sex);
//	                 return 的数据 是传递到  action类中的参数
                return {
                    /* 	timeStart:$("[name='timeStart']").val(),
                     timeEnd:$("[name='timeEnd']").val(),
                     lstatus:$("[name='lstatus']").val(),
                     llevelid:$("[name='llevelid']").val(),
                     "emp.empname":name,
                     "emp.sex":sex, */
                    page: this.pageNumber,//当前页
                    rows: this.pageSize //每页条数
                }
            },
            columns: [
                {field:'id',title:'',width:25,
                    formatter:function(value,row,index){
                        return "<input type='checkbox' value="+value+" name='returnscheck'/>";
                    }
                },
                {
                    field: 'sn',
                    title: '编号',
                    idField:true,
                    width: 100
                },{
                    field: 'shippingMethod',
                    title: '配送方式',
                    width: 100
                },{
                    field: 'shipper',
                    title: '发货人',
                    width: 100
                },{
                    field: 'createDate',
                    title: '创建日期',
                    width: 100
                },{
                    field: 'act',
                    title: '操作',
                    width: 100
                    /*formatter:function(value,row,index){
                        return "<a href='javascript:queryreturns()' >查看</a>";
                    }*/
                }]
        })
    }

    //添加
    function addreturns() {
        //跳转添加页面
        location.href="<%=request.getContextPath()%>/returns/toaddreturns.do";
    }

    //修改
    function updatereturns(mrid) {
        //跳转修改页面
        location.href="<%=request.getContextPath()%>/returns/queryreturnsById.do?id="+mrid;
    }

    //删除
    function deletesreturns() {
        var ids="";
        $("[name=returnscheck]").each(function () {
            if(this.checked){
                ids+=","+this.value;
            }
        })
        ids=ids.substring(1);

        var a=confirm("确定要删除么");
        if(a){
            $.ajax({
                url:"<%=request.getContextPath()%>/returns/deletereturnsbuids.jhtml",
                type:"post",
                data:{"ids":ids},

                success:function (){
                    searchreturns();
                   // $("#returns-table").bootstrapTable("refresh");
                   /* if(msg>0){
                        $("#returns-table").bootstrapTable("refresh");
                    }else{
                        alert("删除失败")
                    }*/
                },
                error:function (){
                    alert("程序发生错误");
                }
            });
        }else{
            alert(a);
        }

    }

</script>

</body>
</html>
