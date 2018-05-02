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
<div id="addAttributeHiddenDiv" style="display: none;">
    <form id="attributeFormId">
        <table class="table table-bordered" bordercolor="#D2E9FF" cellspacing="0" border="1" style="width: 100%;height: 90%;">
            <tr>
                <td align="right" width="200px" bgcolor="#ECECFF">绑定分类：</td>
                <td colspan="2"><input type="hidden" id="attributeTypeHiddenId" name="productCategory"/><input type="text" class="form-control" onclick="$('#attributeTypeTreeShow').show()" id="attributeTypeName" readonly="readonly" placeholder="绑定分类"/><div id="attributeTypeTreeShow" style="display: none;"></div></td>
            </tr>
            <tr>
                <td align="right" bgcolor="#ECECFF">*名称：</td>
                <td colspan="2"><input type="hidden" name="createDate" id="attributeCreateDateId"/><input type="hidden" name="id" id="attributeId"/><input type="text" class="form-control" name="name"  id="attributeNameId" placeholder="名称"></td>
            </tr>
            <tr>
                <td align="right" bgcolor="#ECECFF">排序：</td>
                <td colspan="2"><input type="number" class="form-control" name="orders"  id="attributeOrdersId" placeholder="排序"></td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <button type="button" class="btn btn-success" id="addParameter" onclick="add_optionsTr(this)">
                        <span class="glyphicon glyphicon-plane">添加可选项</span>
                    </button>
                </td>
            </tr>
            <tr>
                <td bgcolor="#ECECFF"></td>
                <td bgcolor="#ECECFF">可选项</td>
                <td bgcolor="#ECECFF">删除</td>
            </tr>
            <tr id="addOptionsTr" name="optionsTr">
                <td bgcolor="#ECECFF"></td>
                <td><input type="text" class="form-control" name='optionsName' placeholder="名称"></td>
                <td><a href='javascript:void(0);' onclick='deleteOptionsTr(this)'>【删除】</a></td>
            </tr>
            <tr>
                <td colspan="4" align="center">
                    <button type="button" class="btn btn-success" id="editOrInsert" onclick="insertAttribute()">
                        <span class="glyphicon glyphicon-plane">确定</span>
                    </button>
                    <button type="button" class="btn btn-success" onclick="returnAttribute()">
                        <span class="glyphicon glyphicon-plane">返回</span>
                    </button>
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="attributeTabAndTabToolBar">
    <table class="table table-bordered" id="attributeTab"></table>
    <div id="attributeTabToolBar">
        <div class="btn-group">
            <button type="button" class="btn btn-success" onclick="addAttribute()">
                <span class="glyphicon glyphicon-plane">新增</span>
            </button>
            <button type="button" class="btn btn-danger">
                <span class="glyphicon glyphicon-scissors" onclick="deleteAttributes()">删除</span>
            </button>
            <button type="button" class="btn btn-warning" onclick="refreshAttribute()">
                <span class="glyphicon glyphicon-wrench">刷新</span>
            </button>
        </div>
    </div>
</div>
<script>
   $(function (){
        $("#attributeTab").bootstrapTable({
            url:"<%=request.getContextPath() %>/attributeController/selectAttributeList.jhtml",
            method: 'get', //请求方式（*）
            toolbar:"#attributeTabToolBar", //工具按钮用哪个容器
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
                {field:'attributeCategory',title:'绑定分类',width:70},
                {field:'attributeOption',title:'参数',width:500},
                {field:'orders',title:'排序',width:70},
                {field:'parameterOperation',title:'操作',width:70,
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


   $(function (){
       $.ajax({
           url:"<%=request.getContextPath()%>/productCategoryController/selectProductCategoryTree.jhtml",
           dataType:"json",
           async:false,
           success:function(data){
               $('#attributeTypeTreeShow').treeview({
                   data: data,
                   onNodeSelected: function (event, node) {
                       $("#attributeTypeName").val(node.text);
                       $("#attributeTypeHiddenId").val(node.id);
                       $('#attributeTypeTreeShow').hide();
                   }
               })
           },
           error:function(){
               alert("查询出错ccc");
           }
       });
   })


   function refreshAttribute(){
       $("#attributeTab").bootstrapTable('refresh');
   }

   function returnAttribute(){
       document.getElementById("attributeFormId").reset();
       $("#attributeTabAndTabToolBar").show();
       $("#addAttributeHiddenDiv").hide();
       $("#attributeTab").bootstrapTable('refresh');
   }

   function addAttribute(){
       $("#attributeTabAndTabToolBar").hide();
       $("#addAttributeHiddenDiv").show();
   }

   //添加可选项
   function add_optionsTr(obj) {
       //var tr = $(obj).parent().parent();
       $("#addOptionsTr").after("<tr name='optionsTr'><td bgcolor='#ECECFF'></td><td><input type='text' class='form-control' name='optionsName' placeholder='名称'></td><td><a href='javascript:void(0);' onclick='deleteOptionsTr(this)'>【删除】</a></td></tr>");
       //tr.after(tr.clone());
   }

   // 删除可选项
   function deleteOptionsTr(obj){
       if ($("[name='optionsName']").length <= 1) {
           alert("必须至少保留一个参数");
       } else {
           $(obj).parent().parent().remove();
       }
   }

   function insertAttribute(){
       var id = $("#attributeId").val();
       var createDate = $("#attributeCreateDateId").val();
       var productCategory = $("#attributeTypeHiddenId").val();
       var name = $("#attributeNameId").val();
       var orders = $("#attributeOrdersId").val();
       if($("#attributeId").val()==null || $("#attributeId").val()<=0 || $("#attributeId").val()==""){
           $.ajax({
               url:"<%=request.getContextPath()%>/attributeController/insertSelective.jhtml",
               type:'post',
               data: {"createDate":createDate,"productCategory":productCategory,"name":name,"orders":orders},
               success:function(data){
                   alert("保存成功");
                   /*$("#productTab").bootstrapTable('refresh');*/
                   returnAttribute();
               },
               error:function(){
                   alert("ajax失败");
               }
           });
       } else {
           $.ajax({
               url:"<%=request.getContextPath()%>/attributeController/updateByPrimaryKeySelective.jhtml",
               type:'post',
               data: {"createDate":createDate,"id":id,"productCategory":productCategory,"name":name,"orders":orders},
               success:function(data){
                   alert("修改成功");
                   returnAttribute();
               },
               error:function(){
                   alert("ajax失败");
               }
           });
       }
   }

   function editAttributeById(id){
       $.ajax({
           url:"<%=request.getContextPath()%>/attributeController/selectByPrimaryKey.jhtml?id="+id,
           success:function(data){
               $("#attributeId").val(data.id);
               $("#attributeNameId").val(data.name);
               $("#attributeCreateDateId").val(data.createDate);
               $("#attributeOrdersId").val(data.orders);
               $("#attributeTypeHiddenId").val(data.productCategory);
               var idds = data.productCategory;
               $.ajax({
                   url:"<%=request.getContextPath()%>/productCategoryController/selectByPrimaryKey.jhtml?id="+idds,
                   success:function(data2){
                       $("#attributeTypeName").val(data2.name);
                   }
               })
               $("#attributeTabAndTabToolBar").hide();
               $("#addAttributeHiddenDiv").show();
               //$("#productCategoryTab").bootstrapTable('refresh');
           },
           error:function(){
               alert("系统错误！！！请调试Debug检查！！！");
           }
       })

   }

   function deleteAttributes(){
        var ids = "";
        var attributeIdsNum = 0;
        for (var i = 0; i < $("[name='chk']").length; i++) {
            if($("[name='chk']").eq(i).prop("checked")){
                ids += "," + $("[name='chk']").eq(i).val();
                attributeIdsNum++;
            }
        }
        if(attributeIdsNum>0){
            ids = ids.substring(1);
            var delAttributeIdsNum = "确定删除这"+attributeIdsNum+"条数据吗?";
            if(confirm(delAttributeIdsNum)){
                $.ajax({
                    url:"<%=request.getContextPath()%>/attributeController/deleteAttributeByPrimaryKeys.jhtml?ids="+ids,
                    success:function(){
                        alert("删除成功！！！");
                        $("#attributeTab").bootstrapTable('refresh');
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
