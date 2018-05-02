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
    <title>会员等级</title>
    <jsp:include page="/plug-in.jsp"></jsp:include>
</head>
<body>
    <div id="tabToolBar">
        <div class="btn-group">
            <button type="button" class="btn btn-success" onclick="addMemberRank()">
                <span class="glyphicon glyphicon-plane">新增</span>
            </button>
            <%--<button type="button" class="btn btn-warning" onclick="updateProduct()">--%>
                <%--<span class="glyphicon glyphicon-wrench">修改</span>--%>
            <%--</button>--%>
            <button type="button" class="btn btn-danger">
                <span class="glyphicon glyphicon-scissors" onclick="deleteMemberRank()">删除</span>
            </button>
        </div>
    </div>
    <!-- 数据表格 -->
    <table class="table" id="memberrank-table" border="1"></table>

    <script type="text/javascript">

        $(function () {
            $("#memberrank-table").bootstrapTable({
                url:"<%=request.getContextPath()%>/memberRank/queryMemberRankListPager.do",
                striped: true,//隔行变色
                showColumns:true,//是否显示 内容列下拉框
                minimumCountColumns:1,//最小留下一个
                toolbar:"#tabToolBar",
                sidePagination:"server",//
                clickToSelect: true,//点击行即可选中单选/复选框
                method:'post',//发送请求的方式
                contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
                queryParams:function(){
                    //return 的数据 是传递到  action类中的参数
                    return {
                    }
                },
                columns: [
                    {field:'id',title:'',width:25,
                        formatter:function(value,row,index){
                            return "<input type='checkbox' value="+value+" name='chk'/>";
                        }
                    },
                    {
                        field: 'name',
                        title: '名称',
                        idField:true,
                        width: 100
                    },{
                        field: 'scale',
                        title: '优惠比例',
                        width: 100,
                    },{
                        field: 'amount',
                        title: '消费金额',
                        width: 100,
                    },{
                        field: 'is_Default',
                        title: '是否默认',
                        width: 100,
                        formatter:function(value,row,index){
                            if(value==0){
                                return "否";
                            }else{
                                return "是";
                            }
                        }
                    },{
                        field: 'bb',
                        title: '操作',
                        width: 100,
                        formatter:function(value,row,index){
                            return "<a href=\"javascript:updatememberrank("+row.id+")\">[编辑]</a>";
                        }
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
