<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/11 0011
  Time: 22:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/plug-in.jsp"></jsp:include>
</head>
<body>
<div id="addParameterHiddenDiv" style="display: none;">
    <form id="parameterGroupFormId">
        <table class="table table-bordered" bordercolor="#D2E9FF" cellspacing="0" border="1" style="width: 100%;height: 90%;">
            <tr>
                <td align="right" width="200px" bgcolor="#ECECFF">绑定分类：</td>
                <td colspan="3"><input type="hidden" id="parameterTypeHiddenId" name="productCategory"/><input type="text" class="form-control" onclick="$('#parameterTypeTreeShow').show()" id="parameterTypeName" readonly="readonly" placeholder="绑定分类"/><div id="parameterTypeTreeShow" style="display: none;"></div></td>
            </tr>
            <tr>
                <td align="right" bgcolor="#ECECFF">*名称：</td>
                <td colspan="3"><input type="hidden" name="createDate" id="parameterCreateDateId"/><input type="hidden" name="id" id="parameterGroupId"/><input type="text" class="form-control" name="name"  id="parameterNameId" placeholder="名称"></td>
            </tr>
            <tr>
                <td align="right" bgcolor="#ECECFF">排序：</td>
                <td colspan="3"><input type="number" class="form-control" name="orders"  id="parameterOrdersId" placeholder="排序"></td>
            </tr>
            <tr>
                <td colspan="4" align="center">
                    <button type="button" class="btn btn-success" id="addParameter" onclick="add_parameterTr(this)">
                        <span class="glyphicon glyphicon-plane">添加参数</span>
                    </button>
                </td>
            </tr>
            <tr>
                <td bgcolor="#ECECFF"></td>
                <td bgcolor="#ECECFF">名称</td>
                <td bgcolor="#ECECFF">排序</td>
                <td bgcolor="#ECECFF">删除</td>
            </tr>
            <tr id="addParameterTr" name="parameterTr">
                <td bgcolor="#ECECFF"></td>
                <td><input type="text" class="form-control" name='parameterName' placeholder="名称"></td>
                <td><input type="text" class="form-control" name='parameterOrders' placeholder="排序"></td>
                <td><a href='javascript:void(0);' onclick='deleteParameterTr(this)'>【删除】</a></td>
            </tr>
            <tr>
                <td colspan="4" align="center">
                    <button type="button" class="btn btn-success" id="editOrInsert" onclick="insertParameterGroup()">
                        <span class="glyphicon glyphicon-plane">确定</span>
                    </button>
                    <button type="button" class="btn btn-success" onclick="returnParameter()">
                        <span class="glyphicon glyphicon-plane">返回</span>
                    </button>
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="parameterTabAndTabToolBar">
    <table class="table table-bordered" id="parameterTab"></table>
    <div id="parameterTabToolBar">
        <div class="btn-group">
            <button type="button" class="btn btn-success" onclick="addParameter()">
                <span class="glyphicon glyphicon-plane">新增</span>
            </button>
            <button type="button" class="btn btn-danger">
                <span class="glyphicon glyphicon-scissors" onclick="deleteParameters()">删除</span>
            </button>
            <button type="button" class="btn btn-warning" onclick="refreshParameter()">
                <span class="glyphicon glyphicon-wrench">刷新</span>
            </button>
        </div>
    </div>
</div>
<script>
    $(function (){
        $("#parameterTab").bootstrapTable({
            url:"<%=request.getContextPath() %>/parameterGroupController/selectParameterGroupList.jhtml",
            method: 'get', //请求方式（*）
            toolbar:"#parameterTabToolBar", //工具按钮用哪个容器
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
//                uniqueId: "ID", //每一行的唯一标识，一般为主键列
            showToggle:true, //是否显示详细视图和列表视图的切换按钮
            cardView: false, //是否显示详细视图
            detailView: false, //是否显示父子表
            paginationLoop:false,//关闭分页的无限循环
            paginationPreText:"上一页",
            paginationNextText:"下一页",
            columns:[
                {field:'id',title:'',width:25,
                    formatter:function(value,row,index){
                        return "<input type='checkbox' value="+value+" name='chk'/>";
                    }
                },
                {field:'name',title:'名称',width:70},
                {field:'parameterGroupCategory',title:'绑定分类',width:70},
                {field:'parameterGroupParameter',title:'参数',width:500},
                {field:'orders',title:'排序',width:70},
                {field:'parameterOperation',title:'操作',width:70,
                    formatter:function(value,row,index){
                        return "<a href='javascript:void(0);' target='_blank' style='text-decoration:none;' onclick='editParameterById("+row.id+")'>【编辑】</a>";
                    }
                },
            ],
            //传递参数（*）
            queryParams: function(params) {
                var whereParams = {
                    /*
                     分页  自定义的参数         默认传 limit（展示几条）    offset（从第几条开始    起始条数）
                     */
                    "name":params.search,//精确搜索产品名称
                }
                return whereParams;
            },
        });
    })

    $(function (){
        $.ajax({
            url:"<%=request.getContextPath()%>/productCategoryController/selectProductCategoryTree.jhtml",
            dataType:"json",
            async:false,
            success:function(data){
                $('#parameterTypeTreeShow').treeview({
                    data: data,
                    onNodeSelected: function (event, node) {
                        $("#parameterTypeName").val(node.text);
                        $("#parameterTypeHiddenId").val(node.id);
                        $('#parameterTypeTreeShow').hide();
                    }
                })
            },
            error:function(){
                alert("查询出错ccc");
            }
        });
    })

    //添加参数
    function add_parameterTr(obj) {
        //var tr = $(obj).parent().parent();
        $("#addParameterTr").after("<tr name='parameterTr'><td bgcolor='#ECECFF'></td><td><input type='text' class='form-control' name='parameterName' placeholder='名称'></td><td><input type='text' name='parameterOrders' class='form-control' placeholder='排序'></td><td><a href='javascript:void(0);' onclick='deleteParameterTr(this)'>【删除】</a></td></tr>");
        //tr.after(tr.clone());
    }

    // 删除参数
    function deleteParameterTr(obj){
        if ($("[name='parameterTr']").length <= 1) {
            alert("必须至少保留一个参数");
        } else {
            $(obj).parent().parent().remove();
        }
    }

    function addParameter(){
        $("#parameterTabAndTabToolBar").hide();
        $("#addParameterHiddenDiv").show();
    }

    //刷新
    function refreshParameter(){
        $("#parameterTab").bootstrapTable('refresh');
    }

    //添加
    function insertParameterGroup(){
        var id = $("#parameterGroupId").val();
        var createDate = $("#parameterCreateDateId").val();
        var productCategory = $("#parameterTypeHiddenId").val();
        var name = $("#parameterNameId").val();
        var orders = $("#parameterOrdersId").val();
        if($("#parameterGroupId").val()==null || $("#parameterGroupId").val()<=0 || $("#parameterGroupId").val()==""){
            $.ajax({
                url:"<%=request.getContextPath()%>/parameterGroupController/insertSelective.jhtml",
                type:'post',
                data: {"createDate":createDate,"productCategory":productCategory,"name":name,"orders":orders},
                success:function(data){
                    alert("保存成功");
                    /*$("#productTab").bootstrapTable('refresh');*/
                    returnParameter();
                },
                error:function(){
                    alert("ajax失败");
                }
            });
        } else {
            $.ajax({
                url:"<%=request.getContextPath()%>/parameterGroupController/updateByPrimaryKeySelective.jhtml",
                type:'post',
                data: {"createDate":createDate,"id":id,"productCategory":productCategory,"name":name,"orders":orders},
                success:function(data){
                    alert("修改成功");
                    returnParameter();
                },
                error:function(){
                    alert("ajax失败");
                }
            });
        }
    }
    //返回
    function returnParameter(){
        document.getElementById("parameterGroupFormId").reset();
        $("#parameterTabAndTabToolBar").show();
        $("#addParameterHiddenDiv").hide();
        $("#parameterTab").bootstrapTable('refresh');
    }


    function deleteParameters(){
        var ids = "";
        var parameterIdsNum = 0;
        for (var i = 0; i < $("[name='chk']").length; i++) {
            if($("[name='chk']").eq(i).prop("checked")){
                ids += "," + $("[name='chk']").eq(i).val();
                parameterIdsNum++;
            }
        }
        if(parameterIdsNum>0){
            ids = ids.substring(1);
            var delParameterIdsNum = "确定删除这"+parameterIdsNum+"条数据吗?";
            if(confirm(delParameterIdsNum)){
                $.ajax({
                    url:"<%=request.getContextPath()%>/parameterGroupController/deleteParametersByPrimaryKeys.jhtml?ids="+ids,
                    success:function(){
                        alert("删除成功！！！");
                        $("#parameterTab").bootstrapTable('refresh');
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

    function editParameterById(id){
        $.ajax({
            url:"<%=request.getContextPath()%>/parameterGroupController/selectByPrimaryKey.jhtml?id="+id,
            success:function(data){
                $("#parameterGroupId").val(data.id);
                $("#parameterNameId").val(data.name);
                $("#parameterCreateDateId").val(data.createDate);
                $("#parameterOrdersId").val(data.orders);
                $("#parameterTypeHiddenId").val(data.productCategory);
                var idd = data.productCategory;
                $.ajax({
                    url:"<%=request.getContextPath()%>/productCategoryController/selectByPrimaryKey.jhtml?id="+idd,
                    success:function(data1){
                        $("#parameterTypeName").val(data1.name);
                    }
                })

                $("#parameterTabAndTabToolBar").hide();
                $("#addParameterHiddenDiv").show();
                //$("#productCategoryTab").bootstrapTable('refresh');
            },
            error:function(){
                alert("系统错误！！！请调试Debug检查！！！");
            }
        })
    }
</script>
</body>
</html>
