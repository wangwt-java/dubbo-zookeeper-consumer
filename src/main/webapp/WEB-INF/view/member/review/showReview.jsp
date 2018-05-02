<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/04/16
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>评论管理</title>
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
    <table class="table" id="review-table" border="1"></table>

    <script type="text/javascript">
        
        $(function () {
            $("#review-table").bootstrapTable({
                url:"<%=request.getContextPath()%>/review/queryReviewListPager.do",
                method: 'get', //请求方式（*）
                toolbar:"#tabToolBar", //工具按钮用哪个容器
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
                height: 543, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
//                uniqueId: "ID", //每一行的唯一标识，一般为主键列
                showToggle:true, //是否显示详细视图和列表视图的切换按钮
                cardView: false, //是否显示详细视图
                detailView: false, //是否显示父子表
//                pagination:true,//显示分页条
//                pageNumber:1,//初始化 页数
//                pageSize:10,//初始化 条数
//                pageList:[10,20,30,40],//初始化 可选择的条数
//                paginationHAlign:"left",//上一页下一页等在左边
                paginationLoop:false,//关闭分页的无限循环
                paginationPreText:"上一页",
                paginationNextText:"下一页",
//                height:400,//高度
//                striped: true,//隔行变色
//                showColumns:true,//是否显示 内容列下拉框
//                minimumCountColumns:1,//最小留下一个
//                toolbar:"#tabToolBar",
//                sidePagination:"server",//
//                clickToSelect: true,//点击行即可选中单选/复选框
//                method:'post',//发送请求的方式
//                contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
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
                        field: 'productname',
                        title: '商品',
                        width: 280,
                        formatter:function(value,row,index){
                            if(value.length>23){
                                return value.substring(0,23)+"...";
                            }else{
                                return value;
                            }
                        }
                    },{
                        field: 'score',
                        title: '评分',
                        width: 17,
                    },{
                        field: 'content',
                        title: '内容',
                        width: 280,
                        formatter:function(value,row,index){
                            if(value.length>20){
                                return value.substring(0,20)+"...";
                            }else{
                                return value;
                            }
                        }
                    },{
                        field: 'membername',
                        title: '会员',
                        width: 40,
                        formatter:function(value,row,index){
                            if(value==null){
                                return "游客";
                            }else{
                                return value;
                            }
                        }
                    },{
                        field: 'isShow',
                        title: '是否显示',
                        width: 20,
                        formatter:function(value,row,index){
                            if(value==0){
                                return "<font color=\"red\">×</font>";
                            }else{
                                return "<font color=\"green\">√</font>";
                            }
                        }
                    },{
                        field: 'createDate',
                        title: '创建日期',
                        width: 60,
                    },{
                        field: 'bb',
                        title: '操作',
                        width: 100,
                        formatter:function(value,row,index){
                            return "<a href=\"javascript:updatereview("+row.id+")\">[编辑]</a>&nbsp;"+
                                "<a href=\"javascript:updatereview("+row.id+")\">[查看]</a>";
                        }
                    }]
            })
        })

        function updatereview(id){
            //跳转修改页面
            location.href="<%=request.getContextPath()%>/review/queryReviewById.do?id="+id;
        }
        
        
    </script>
</body>
</html>
