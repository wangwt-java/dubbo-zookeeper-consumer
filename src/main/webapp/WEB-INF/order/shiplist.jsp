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
    <title>发货</title>
    <jsp:include page="/plug-in.jsp"></jsp:include>
</head>
<body>

<div id="shiptoolbar">
    <div class="btn-group">
        <button type="button" class="btn dropdown-toggle" id="dropdownMenuship" onchange="serarchship()"
                data-toggle="dropdown">
            每页显示
            <span class="caret"></span>
        </button>
        <button type="button" class="btn btn-info" >
            <span class="glyphicon glyphicon-scissors" onclick="deletepayment()">删除</span></button>
        <button type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-scissors" onclick="deletepayment()">刷新</span>
        </button>

        <button type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-scissors" onclick="deletepayment()">订单</span>
        </button>



        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenuship">
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#">3</a>
            </li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#">6</a>
            </li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#">9</a>
            </li>

        </ul>

    </div>


</div>
<!-- 数据表格 -->
<table class="table" id="ship-table" border="1"></table>

<script type="text/javascript">
    $(function (){


        serarchship();
    })
    function serarchship() {
        alert($("#dropdownMenuship").val());

        $("#ship-table").bootstrapTable({
            url: "<%=request.getContextPath()%>/shipping/queryPaymentList.jhtml",
            toolbar: "#shiptoolbar",
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
                {
                    field: 'id', title: '', width: 25,
                    formatter: function (value, row, index) {
                        return "<input type='checkbox' value=" + value + " name='shipcheck'/>";
                    }
                },
                {
                    field: 'sn',
                    title: '编号',
                    idField: true,
                    width: 100
                }, {
                    field: 'shippingMethod',
                    title: '配送方式',
                    width: 100
                }, {
                    field: 'deliveryCorp',
                    title: '物流公司',
                    width: 100
                }, {
                    field: 'createDate',
                    title: '创建日期',
                    width: 100
                }]
        })
    }

    //添加
    function addship() {
        //跳转添加页面
        location.href="<%=request.getContextPath()%>/ship/toaddship.do";
    }

    //修改
    function updateship(mrid) {
        //跳转修改页面
        location.href="<%=request.getContextPath()%>/ship/queryshipById.do?id="+mrid;
    }

    //删除
    function deleteship() {
        var ids="";
        $("[name=shipcheck]").each(function () {
            if(this.checked){
                ids+=","+this.value;
            }
        })
        ids=ids.substring(1);
       /* alert(ids)
        return false*/
        var a=confirm("确定要删除么");
        if(a){
            $.ajax({
                url:"<%=request.getContextPath()%>/shipping/deleteshipbuids.jhtml",
                type:"post",
                data:{"ids":ids},
                dataType:"text",//json   text
                success:function (){
                    $("#ship-table").bootstrapTable("refresh");
                   /* if(msg>0){

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
