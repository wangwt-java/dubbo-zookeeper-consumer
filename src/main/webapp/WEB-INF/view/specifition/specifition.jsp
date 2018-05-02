<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/17 0017
  Time: 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/plug-in.jsp"></jsp:include>
</head>
<body>
<div id="addSpecifitionHiddenDiv" style="display: none;">
    <form id="specifitionFormId">
        <table class="table table-bordered" bordercolor="#D2E9FF" cellspacing="0" border="1" style="width: 100%;height: 90%;">
            <tr>
                <td align="right" bgcolor="#ECECFF">*名称：</td>
                <td colspan="4"><input type="hidden" name="createDate" id="specifitionCreateDateId"/><input type="hidden" name="id" id="specifitionId"/><input type="text" class="form-control" name="name"  id="specifitionNameId" placeholder="名称"></td>
            </tr>
            <tr>
                <td align="right" bgcolor="#ECECFF">类型:</td>
                <td colspan="4"><select id="specifitionTypeId" class="form-control" name="type" width="200px"><option value="0">文本</option><option value="1">图片</option></select></td>
            </tr>
            <tr>
                <td align="right" bgcolor="#ECECFF">备注：</td>
                <td colspan="4"><input type="number" class="form-control" name="memo"  id="specifitionMemoId" placeholder="备注"></td>
            </tr>
            <tr>
                <td align="right" bgcolor="#ECECFF">排序：</td>
                <td colspan="4"><input type="number" class="form-control" name="orders"  id="specifitionOrdersId" placeholder="排序"></td>
            </tr>
            <tr>
                <td colspan="5" align="center">
                    <button type="button" class="btn btn-success" id="addSpecifition" onclick="add_specifitionTr(this)">
                        <span>添加规格值</span>
                    </button>
                </td>
            </tr>
            <tr>
                <td bgcolor="#ECECFF"></td>
                <td bgcolor="#ECECFF">规格值名称</td>
                <td bgcolor="#ECECFF">规格值图片</td>
                <td bgcolor="#ECECFF">规格值排序</td>
                <td bgcolor="#ECECFF">删除</td>
            </tr>
            <tr id="addSpecifitionTr" name="specifitionTr">
                <td bgcolor="#ECECFF"></td>
                <td><input type="text" class="form-control" name='specifitionValueName' placeholder="规格值名称"></td>
                <td><input type="text" class="form-control" name='specifitionValueImage' placeholder="规格值图片"></td>
                <td><input type="text" class="form-control" name='specifitionValueOrders' placeholder="规格值排序"></td>
                <td><a href='javascript:void(0);' onclick='deleteSpecifitionTr(this)'>【删除】</a></td>
            </tr>
            <tr>
                <td colspan="5" align="center">
                    <button type="button" class="btn btn-success" id="editOrInsert" onclick="insertSpecifition()">
                        <span class="glyphicon glyphicon-plane">确定</span>
                    </button>
                    <button type="button" class="btn btn-success" onclick="returnSpecifition()">
                        <span class="glyphicon glyphicon-plane">返回</span>
                    </button>
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="specifitionTabAndTabToolBar">
    <table class="table table-bordered" id="specifitionTab"></table>
    <div id="specifitionTabToolBar">
        <div class="btn-group">
            <button type="button" class="btn btn-success" onclick="addSpecifition()">
                <span class="glyphicon glyphicon-plane">新增</span>
            </button>
            <button type="button" class="btn btn-danger">
                <span class="glyphicon glyphicon-scissors" onclick="deleteSpecifition()">删除</span>
            </button>
            <button type="button" class="btn btn-warning" onclick="refreshSpecifition()">
                <span class="glyphicon glyphicon-wrench">刷新</span>
            </button>
        </div>
    </div>
</div>
<script>
    $(function (){
        $("#specifitionTab").bootstrapTable({
            url:"<%=request.getContextPath() %>/specifitionController/selectSpecifitionList.jhtml",
            method: 'get', //请求方式（*）
            toolbar:"#specifitionTabToolBar", //工具按钮用哪个容器
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
                {field:'name',title:'名称',width:70},
                {field:'type',title:'类型',width:70,
                    formatter:function(value,row,index){
                       if(row.type==1){
                           return "图片";
                       }else{
                           return "文本";
                       }
                    }
                },
                {field:'specifitionValue',title:'规格值',width:500},
                {field:'orders',title:'排序',width:70},
                {field:'specifitionOperation',title:'操作',width:70,
                    formatter:function(value,row,index){
                        return "<a href='javascript:void(0);' target='_blank' style='text-decoration:none;' onclick='editAttributeById("+row.id+")'>【编辑】</a>";
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
    function addSpecifition(){
        $("#specifitionTabAndTabToolBar").hide();
        $("#addSpecifitionHiddenDiv").show();
    }
    //刷新
    function refreshSpecifition(){
        $("#specifitionTab").bootstrapTable('refresh');
    }
    //返回
    function returnSpecifition(){
        document.getElementById("specifitionFormId").reset();
        $("#specifitionTabAndTabToolBar").show();
        $("#addSpecifitionHiddenDiv").hide();
        $("#specifitionTab").bootstrapTable('refresh');
    }
    //批量删除
    function deleteSpecifition(){
        var ids = "";
        var specifitionIdsNum = 0;
        for (var i = 0; i < $("[name='chk']").length; i++) {
            if($("[name='chk']").eq(i).prop("checked")){
                ids += "," + $("[name='chk']").eq(i).val();
                specifitionIdsNum++;
            }
        }
        if(specifitionIdsNum>0){
            ids = ids.substring(1);
            var delSpecifitionIdsNum = "确定删除这"+specifitionIdsNum+"条数据吗?";
            if(confirm(delSpecifitionIdsNum)){
                $.ajax({
                    url:"<%=request.getContextPath()%>/specifitionController/deleteSpecifitionByPrimaryKeys.jhtml?ids="+ids,
                    success:function(){
                        alert("删除成功！！！");
                        $("#specifitionTab").bootstrapTable('refresh');
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
    //添加参数
    function add_specifitionTr(obj) {
        //var tr = $(obj).parent().parent();
        <%--<input type="text" class="form-control" name='specifitionValueOrders' placeholder="规格值排序">--%>
        $("#addSpecifitionTr").after("<tr name='specifitionTr'><td bgcolor='#ECECFF'></td><td><input type='text' class='form-control' name='specifitionValueName' placeholder='规格值名称'></td><td><input type='text' name='specifitionValueImage' class='form-control' placeholder='规格值图片'></td><td><input type='text' name='specifitionValueOrders' class='form-control' placeholder='规格值排序'></td><td><a href='javascript:void(0);' onclick='deleteSpecifitionTr(this)'>【删除】</a></td></tr>");
        //tr.after(tr.clone());
    }
    // 删除参数
    function deleteSpecifitionTr(obj){
        if ($("[name='specifitionTr']").length <= 1) {
            alert("必须至少保留一个规格");
        } else {
            $(obj).parent().parent().remove();
        }
    }
</script>
</body>
</html>
