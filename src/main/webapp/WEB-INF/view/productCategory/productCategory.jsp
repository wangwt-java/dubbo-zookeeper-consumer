<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/11 0011
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/plug-in.jsp"></jsp:include>
</head>
<body>
<div id="addProductCategoryHiddenDiv" style="display: none;">
    <form id="productCategoryFormId">
        <table class="table table-bordered" bordercolor="#D2E9FF" cellspacing="0" border="1" style="width: 100%;height: 90%;">
            <tr>
                <td align="right" bgcolor="#ECECFF">*名称：</td>
                <td><input type="hidden" name="createDate" id="productCategoryCreateDateId" /><input type="hidden" name="id" id="productCategoryIdId"/><input type="text" class="form-control" name="name"  id="productCategoryNameId" placeholder="名称"></td>
            </tr>
            <tr>

                <td align="right" width="200px" bgcolor="#ECECFF">上级分类：</td>
                <td><input type="hidden" id="productCategoryHiddenId" name="parent"/><input type="text" class="form-control" onclick="$('#productCategoryTreeShow').show()" id="productCategoryParentId" readonly="readonly" placeholder="上级分类"/><div id="productCategoryTreeShow" style="display: none;"></div></td>
            </tr>
            <tr>
                <td align="right" bgcolor="#ECECFF">筛选品牌：</td>
                <td><%--<input type="text" class="form-control" name="brandIds"  id="brandIdsId" placeholder="筛选品牌">--%>
                    <div id="brandDivId"></div>
                </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#ECECFF">页面标题：</td>
                <td><input type="text" class="form-control" name="seoTitle"  id="productCategorySeoTitleId" placeholder="页面标题"></td>
            </tr>
            <tr>
                <td align="right" bgcolor="#ECECFF">页面关键词：</td>
                <td><input type="text" class="form-control" name="seoKeywords"  id="productCategorySeoKeywordsId" placeholder="页面关键词"></td>
            </tr>
            <tr>
                <td align="right" bgcolor="#ECECFF">排序：</td>
                <td><input type="text" class="form-control" name="orders"  id="productCategoryOrdersId" placeholder="排序"></td>
            </tr>
            <tr>
                <td align="right" bgcolor="#ECECFF">页面描述：</td>
                <td><input type="text" class="form-control" name="seoDescription"  id="productCategorySeoDescriptionId" placeholder="页面描述"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="button" class="btn btn-success" id="editOrInsert" onclick="insertProductCategory()">
                        <span class="glyphicon glyphicon-plane">确定</span>
                    </button>
                    <button type="button" class="btn btn-success" onclick="returnProductCategoryTab()">
                        <span class="glyphicon glyphicon-plane">返回</span>
                    </button>
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="productCategoryTabAndTabToolBar">
    <table class="table table-bordered" id="productCategoryTab"></table>
    <div id="productCateTabToolBar">
        <div class="btn-group">
            <button type="button" class="btn btn-success" onclick="addProductCategory()">
                <span class="glyphicon glyphicon-plane">新增</span>
            </button>
            <button type="button" class="btn btn-warning" onclick="refreshProductGory()">
                <span class="glyphicon glyphicon-wrench">刷新</span>
            </button>
        </div>
    </div>
</div>
<script>
    $(function (){
        $("#productCategoryTab").bootstrapTable({
            url:"<%=request.getContextPath() %>/productCategoryController/selectProductCategory.jhtml",
            method:"post",
            striped: true,  	// 斑马线效果     默认false
            //只允许选中一行
            singleSelect:true,
            //选中行是不选中复选框或者单选按钮
            clickToSelect:true,
            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            uniqueId: "id",                 //每一行的唯一标识，一般为主键列
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,     //  最少留两列
            detailView: false,                  //是否显示父子表
            //发送到服务器的数据编码类型
            contentType:'application/x-www-form-urlencoded;charset=UTF-8',   //数据编码纯文本  offset=0&limit=5
            toolbar:'#productCateTabToolBar',   //  工具定义位置
            columns:[
                {field:'name',title:'名称',width:100},
                {field:'orders',title:'排序',width:300},
                {field:'id',title:'操作',width:150,
                    formatter:function(value,row,index){
                        return "<a href='javascript:void(0);' target='_blank' style='text-decoration:none;' onclick='js_method()'>【查看】</a>&nbsp;<a href='javascript:void(0);' style='text-decoration:none;' target='_blank' onclick='editProductCategoryById("+row.id+")'>【编辑】</a>&nbsp;<a href='javascript:void(0);' target='_blank' onclick='daleteProductCategoryById("+row.id+")'>【删除】</a>";
                    }
                },
            ],
        });
    })

    //刷新
    function refreshProductGory(){
        $("#productCategoryTab").bootstrapTable('refresh');
    }
    $(function () {
        $.ajax({
            url:"<%=request.getContextPath()%>/brandController/selectBrandList.jhtml",
            dataType:"json",
            async:false,
            success:function(data){
                var divData = "";
                for (var i = 0;i <= data.length-1; i++){
                    divData += "<div style='float:left;width:150px;'><label><input type='checkbox' name='brandIds' value="+data[i].id+" id='brandIdsId'/>"+data[i].name+"</label></div>";
                }
                $("#brandDivId").html(divData);
            },
            error:function (){
                alert("品牌查询出错")
            }
        })
    })

    //上级tree
    $(function () {
        //调用treeview方法
        $.ajax({
            url:"<%=request.getContextPath()%>/productCategoryController/selectProductCategoryTree.jhtml",
            dataType:"json",
            async:false,
            success:function(data){
                $('#productCategoryTreeShow').treeview({
                    data: data,
                    onNodeSelected: function (event, node) {
                        $("#productCategoryParentId").val(node.text);
                        $("#productCategoryHiddenId").val(node.id);
                        $('#productCategoryTreeShow').hide();
                    }
                })
            },
            error:function(){
                alert("查询出错ccc");
            }
        });
    })

    function addProductCategory(){
        $("#productCategoryTabAndTabToolBar").hide();
        $("#addProductCategoryHiddenDiv").show();
    }

    function returnProductCategoryTab(){
        document.getElementById("productCategoryFormId").reset();
       /* $("#productCategoryFormId").reset();*/
        $("#productCategoryTabAndTabToolBar").show();
        $("#addProductCategoryHiddenDiv").hide();
        $("#productCategoryTab").bootstrapTable('refresh');
    }

    function getProductCategoryForm(){
        $("#productCategoryFormId").serialize();
        //alert($("#productCategoryFormId").serialize());
    }

    function insertProductCategory(){
        var brandIdss = "";
        $("input:checkbox[name='brandIds']:checked").each(function(i) {
            var val = $(this).val();
            brandIdss += val + ",";
        });
        var id = $("#productCategoryIdId").val();
        var name = $("#productCategoryNameId").val();
        var createDate = $("#productCategoryCreateDateId").val();
        var parent = $("#productCategoryHiddenId").val();
        var seoTitle = $("#productCategorySeoTitleId").val();
        var seoKeyworks = $("#productCategorySeoKeywordsId").val();
        var orders = $("#productCategoryOrdersId").val();//brandIds
        var seoDescription = $("#productCategorySeoDescriptionId").val();
        var treePath = ","+$("#productCategoryHiddenId").val()+","
        var brandIds = brandIdss;
        if ($("#productCategoryIdId").val()==null || $("#productCategoryIdId").val()<=0 || $("#productCategoryIdId").val()==""){
            $.ajax({
                url:"<%=request.getContextPath()%>/productCategoryController/insertSelective.jhtml",
                type:'post',
                data:{"treePath":treePath,"brandIds":brandIds,"name":name,"createDate":createDate,"parent":parent,"seoTitle":seoTitle,"seoKeyworks":seoKeyworks,"orders":orders,"seoDescription":seoDescription},
                success:function(data){
                    alert("保存成功");
                    $("#productCategoryTabAndTabToolBar").show();
                    $("#addProductCategoryHiddenDiv").hide();
                    $("#productCategoryTab").bootstrapTable('refresh');
                },
                error:function(){
                    alert("ajax失败");
                }
            });
        } else {
            $.ajax({
                url:"<%=request.getContextPath()%>/productCategoryController/updateByPrimaryKeySelective.jhtml",
                type:'post',
                data:{"id":id,"brandIds":brandIds,"treePath":treePath,"name":name,"createDate":createDate,"parent":parent,"seoTitle":seoTitle,"seoKeyworks":seoKeyworks,"orders":orders,"seoDescription":seoDescription},
                success:function(data){
                    alert("保存成功");
                    $("#productCategoryTabAndTabToolBar").show();
                    $("#addProductCategoryHiddenDiv").hide();
                    $("#productCategoryTab").bootstrapTable('refresh');
                },
                error:function(){
                    alert("ajax失败");
                }
            });
        }
    }

    function editProductCategoryById(id){
        $.ajax({
            url:"<%=request.getContextPath()%>/productCategoryController/selectProductCategorParentyByPrimaryKey.jhtml?id="+id,
            success:function(data){
                $("#productCategoryIdId").val(data.id);
                $("#productCategoryNameId").val(data.name);
                $("#productCategoryCreateDateId").val(data.createDate);
                $("#productCategoryHiddenId").val(data.parent);
                $("#productCategoryParentId").val(data.text);
                $("#productCategorySeoTitleId").val(data.seoTitle);
                $("#productCategorySeoKeywordsId").val(data.seoKeywords);
                $("#productCategoryOrdersId").val(data.orders);
                $("#productCategorySeoDescriptionId").val(data.seoDescription);

                $("#productCategoryTabAndTabToolBar").hide();
                $("#addProductCategoryHiddenDiv").show();
                //$("#productCategoryTab").bootstrapTable('refresh');
            },
            error:function(){
                alert("系统错误！！！请调试Debug检查！！！");
            }
        })
    }

    function daleteProductCategoryById(id){
        $.ajax({
            url:"<%=request.getContextPath()%>/productCategoryController/deleteByPrimaryKey.jhtml?id="+id,
            success:function(data){
                alert("删除成功！！！");
                $("#productCategoryTab").bootstrapTable('refresh');
            },
            error:function(){
                alert("系统错误！！！请调试Debug检查！！！");
            }
        })
    }
</script>
</body>
</html>