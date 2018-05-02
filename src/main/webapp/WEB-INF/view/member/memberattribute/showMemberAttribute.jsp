<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/04/12
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>会员注册项</title>
    <jsp:include page="/plug-in.jsp"></jsp:include>
</head>
<body>
    <div id="tabToolBar">
        <div class="btn-group">
            <button type="button" class="btn btn-success" onclick="addMemberAttribute()">
                <span class="glyphicon glyphicon-plane">新增</span>
            </button>
            <%--<button type="button" class="btn btn-warning" onclick="updateProduct()">--%>
            <%--<span class="glyphicon glyphicon-wrench">修改</span>--%>
            <%--</button>--%>
            <button type="button" class="btn btn-danger">
                <span class="glyphicon glyphicon-scissors" onclick="deleteMemberAttribute()">删除</span>
            </button>
        </div>
    </div>
    <!-- 数据表格 -->
    <table class="table" id="memberattribute-table"></table>

    <script type="text/javascript">
        $(function () {
            //页面刷新，查询
            $("#memberattribute-table").bootstrapTable({
                url:"<%=request.getContextPath()%>/memberAttribute/queryMemberAttributeListPager.do",
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
                        field: 'type',
                        title: '类型',
                        width: 100,
                        formatter:function(value,row,index){

                            if(value<8){
                                return row.name;
                            }else{
                                if(value==8){
                                    return "文本";
                                }else if(value==9){
                                    return "单选项";
                                }else{
                                    return "多选项";
                                }
                            }

//                            if(value==0){
//                                return "姓名";
//                            }else if(value==1){
//                                return "性别";
//                            }else if(value==2){
//                                return "出生日期";
//                            }else if(value==3){
//                                return "地区";
//                            }else if(value==4){
//                                return "地址";
//                            }else if(value==5){
//                                return "邮编";
//                            }else if(value==6){
//                                return "电话";
//                            }else if(value==7){
//                                return "手机";
//                            }else if(value==8){
//                                return "文本";
//                            }else if(value==9){
//                                return "单选项";
//                            }else{
//                                return "多选项";
//                            }
                        }
                    },{
                        field: 'is_Required',
                        title: '是否必填',
                        width: 100,
                        formatter:function(value,row,index){
                            if(value==0){
                                return "否";
                            }else{
                                return "是";
                            }
                        }
                    },{
                        field: 'is_Enabled',
                        title: '是否启用',
                        width: 100,
                        formatter:function(value,row,index){
                            if(value==0){
                                return "<font color=\"red\">×</font>";
                            }else{
                                return "<font color=\"green\">√</font>";
                            }
                        }
                    },{
                        field: 'orders',
                        title: '排序',
                        width: 100,
                    },{
                        field: 'bb',
                        title: '操作',
                        width: 100,
                        formatter:function(value,row,index){
                            return "<a href=\"javascript:updatememberAttribute("+row.id+")\">[编辑]</a>";
                        }
                    }]
            })
        })

        //跳转添加页面
        function addMemberAttribute() {
            location.href="<%=request.getContextPath()%>/memberAttribute/toaddMemberAttribute.do";
        }

        //跳转修改页面
        function updatememberAttribute(id) {
            location.href="<%=request.getContextPath()%>/memberAttribute/toupdateMemberAttribute.do?id="+id;
        }

        //删除
        function deleteMemberAttribute() {
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
                    url:"<%=request.getContextPath()%>/memberAttribute/deleteMemberAttribute.do",
                    type:"post",
                    data:{"ids":ids},
                    dataType:"text",//json   text
                    success:function (msg){
                        if(msg>0){
                            $("#memberattribute-table").bootstrapTable("refresh");
                        }else{
                            alert("删除失败")
                        }
                    },
                    error:function (){
                        alert("程序发生错误");
                    }
                });
            }else{
            }

        }

    </script>
</body>
</html>
