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
    <title>收款 </title>
    <jsp:include page="/plug-in.jsp"></jsp:include>
</head>
<body>
<div id="paymenttabToolBar">
    <div class="btn-group">
        <button type="button" class="btn dropdown-toggle" id="dropdownMenu1"
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



            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
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
<table class="table" id="memberrank-table" border="1"></table>

<script type="text/javascript">

    $(function () {
        $("#memberrank-table").bootstrapTable({
            url:"<%=request.getContextPath()%>/orderController/queryPaymentList.jhtml",
            toolbar: "#paymenttabToolBar",
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
                        return "<input type='checkbox' value="+value+" name='chk'/>";
                    }
                },
                {
                    field: 'sn',
                    title: '编号',
                    idField:true,
                    width: 100
                },{
                    field: 'type',
                    title: '类型',
                    width: 100,
                    formatter:function(value,row,index){
                        if(value==1) {
                            return "订单支付";
                        }
                    }
                },{
                    field: 'method',
                    title: '方式',
                    width: 100,
                    formatter:function(value,row,index){
                        if(value==1) {
                            return "在线支付";
                        }
                    }
                },{
                    field: 'paymentMethod',
                    title: '支付方式',
                    width: 100
                },{
                    field: 'amount',
                    title: '付款金额',
                    width: 100
                }]
        })
    })

    //添加
    function addMemberRank() {
        //跳转添加页面
        location.href="<%=request.getContextPath()%>/memberRank/toaddMemberRank.do";
    }

    //修改
    function updatememberrank(mrid) {
        //跳转修改页面
        location.href="<%=request.getContextPath()%>/memberRank/queryMemberRankById.do?id="+mrid;
    }

    //删除
    function deleteMemberRank() {
        var ids="";
        $("[name=chk]").each(function () {
            if(this.checked){
                ids+=","+this.value;
            }
        })
        ids=ids.substring(1);

        var a=confirm("确定要删除么");
        if(a){
            $.ajax({
                url:"<%=request.getContextPath()%>/memberRank/deleteMemberRank.do",
                type:"post",
                data:{"ids":ids},
                dataType:"text",//json   text
                success:function (msg){
                    if(msg>0){
                        $("#memberrank-table").bootstrapTable("refresh");
                    }else{
                        alert("删除失败")
                    }
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
