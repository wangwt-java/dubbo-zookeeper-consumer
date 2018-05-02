<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/10 0010
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/plug-in.jsp"></jsp:include>
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
</head>
<body>
<div id="addProductHiddenDiv" style="display: none;">
    <ul id="myTab" class="nav nav-tabs">
        <li><a href="#productBasicInformation" data-toggle="tab">基本信息</a></li>
        <li><a href="#productIntroduction" data-toggle="tab">商品介绍</a></li>
        <li><a href="#productImage" data-toggle="tab">商品图片</a></li>
        <li><a href="#productParameter" data-toggle="tab">商品参数</a></li>
        <li><a href="#productAttribute" data-toggle="tab">商品属性</a></li>
        <li><a href="#productSpecifications" data-toggle="tab">商品规格</a></li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade" id="productBasicInformation">
            <form id="productBasicInformationFormId">
                <table class="table table-bordered" bordercolor="#D2E9FF" cellspacing="0" border="1" style="width: 100%;height: 90%;">
                    <tr>
                        <td align="right" width="200px" bgcolor="#ECECFF">商品分类：</td>
                        <td><select id="productCategoryId" class="form-control" name="productCategory" width="200px"><option>---请选择---</option></select></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#ECECFF">*名称：</td>
                        <td><input type="text" class="form-control" name="name"  id="nameId" placeholder="名称" ></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#ECECFF">编号：</td>
                        <td><input type="text" class="form-control" name="sn"  id="snId" placeholder="编号"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#ECECFF">*销售价：</td>
                        <td><input type="number" class="form-control" name="price"  id="priceId" placeholder="销售价"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#ECECFF">会员价：</td>
                        <td><input type="checkbox" name="" value=""/>是否启动会员价</td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#ECECFF" >成本价：</td>
                        <td><input type="number" class="form-control" name="cost"  id="costId" placeholder="成本价"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#ECECFF">市场价：</td>
                        <td><input type="number" class="form-control" name="marketPrice"  id="marketPriceId" placeholder="市场价"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#ECECFF">展示图片：</td>
                        <td><input type="text" class="form-control" name="image"  id="imageId" placeholder="展示图片"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#ECECFF">单位：</td>
                        <td><input type="text" class="form-control" name="unit"  id="unitId" placeholder="单位"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#ECECFF">重量：</td>
                        <td><input type="number" class="form-control" name="weight"  id="weightId" placeholder="重量"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#ECECFF">库存：</td>
                        <td><input type="number" class="form-control" name="stock"  id="stockId" placeholder="库存"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#ECECFF">库存备注：</td>
                        <td><input type="text" class="form-control" name="stockMemo"  id="stockMemo" placeholder="库存备注"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#ECECFF">赠送积分：</td>
                        <td><input type="number" class="form-control" name="point"  id="pointId" placeholder="赠送积分"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#ECECFF">品牌：</td>
                        <td><input type="number" class="form-control" name="brand"  id="brandId" placeholder="品牌"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#ECECFF">标签：</td>
                        <td><input type="text" class="form-control" name="snId"  id="sn3" placeholder="标签"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#ECECFF">设置：</td>
                        <td><input type="checkbox" name="isMarketable" value="1"/>是否上架&nbsp;&nbsp;<input type="checkbox" name="isList" value="1"/>是否列出&nbsp;&nbsp;<input type="checkbox" name="isTop" value="1"/>是否置顶&nbsp;&nbsp;<input type="checkbox" name="isGift" value="1"/>是否为赠品&nbsp;&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#ECECFF">备注：</td>
                        <td><input type="text" class="form-control" name="snId"  id="sn" placeholder="备注"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#ECECFF">搜索关键词：</td>
                        <td><input type="text" class="form-control" name="keyword"  id="keywordId" placeholder="搜索关键词"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#ECECFF">页面标题：</td>
                        <td><input type="text" class="form-control" name="seoTitle"  id="seoTitleId" placeholder="页面标题"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#ECECFF">页面关键词：</td>
                        <td><input type="text" class="form-control" name="seoKeywords"  id="seoKeywordsId" placeholder="页面关键词"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#ECECFF">页面描述：</td>
                        <td><input type="text" class="form-control" name="seoDescription"  id="seoDescriptionId" placeholder="页面描述"></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <button type="button" class="btn btn-success" onclick="insertProduct()">
                                <span class="glyphicon glyphicon-plane">确定</span>
                            </button>
                            <button type="button" class="btn btn-success" onclick="returnProductTab()">
                                <span class="glyphicon glyphicon-plane">返回</span>
                            </button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="tab-pane fade" id="productIntroduction">
            <table class="table table-bordered" bordercolor="#D2E9FF" cellspacing="0" border="1" style="width: 100%;height: 90%;">
                <tr>
                    <td><textarea name="introduction" style="width:700px;height:200px;visibility:hidden;display: block;"></textarea></td>
                </tr>
                <tr>
                    <td align="center">
                        <button type="button" class="btn btn-success" onclick="insertProduct()">
                            <span class="glyphicon glyphicon-plane">确定</span>
                        </button>
                        <button type="button" class="btn btn-success" onclick="returnProductTab()">
                            <span class="glyphicon glyphicon-plane">返回</span>
                        </button>
                    </td>
                </tr>
            </table>
        </div>
        <div class="tab-pane fade" id="productImage">
            <form id="productImageForm">
                <button type="button" class="btn btn-success" id="addParameter" onclick="add_productImageTr(this)">
                    <span>添加图片</span>
                </button>
                <table class="table table-bordered" bordercolor="#D2E9FF" cellspacing="0" border="1" style="width: 100%;height: 10%;">
                    <tr id="addProductImageTr">
                        <td bgcolor="#ECECFF">文件</td>
                        <td bgcolor="#ECECFF">标题</td>
                        <td bgcolor="#ECECFF">排序</td>
                        <td bgcolor="#ECECFF">删除</td>
                    </tr>
                    <tr>
                        <td align="center" colspan="4">
                            <button type="button" class="btn btn-success" onclick="insertProduct()">
                                <span class="glyphicon glyphicon-plane">确定</span>
                            </button>
                            <button type="button" class="btn btn-success" onclick="returnProductTab()">
                                <span class="glyphicon glyphicon-plane">返回</span>
                            </button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="tab-pane fade" id="productParameter">

        </div>
        <div class="tab-pane fade" id="productAttribute">

        </div>
        <div class="tab-pane fade" id="productSpecifications">

        </div>
    </div>
</div>
<div id="productTabAndTabToolBar">
    <table class="table table-bordered" id="productTab"></table>
    <div id="tabToolBar">
        <div class="btn-group">
            <button type="button" class="btn btn-success" onclick="addProduct()">
                <span class="glyphicon glyphicon-plane">新增</span>
            </button>
            <button type="button" class="btn btn-danger">
                <span class="glyphicon glyphicon-scissors" onclick="deleteProducts()">删除</span>
            </button>
            <button type="button" class="btn btn-warning" onclick="refreshProduct()">
                <span class="glyphicon glyphicon-wrench">刷新</span>
            </button>
        </div>
    </div>
</div>
<script>
    $(function (){
        $("#productTab").bootstrapTable({
            url:"<%=request.getContextPath() %>/productController/selectProductList.jhtml",
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
            height: $(window).height() - 100, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
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
                {field:'sn',title:'编号',width:100},
                {field:'name',title:'名称',width:300},
                {field:'productCategory',title:'商品分类',width:70},
                {field:'price',title:'销售价',width:70},
                {field:'cost',title:'成本价',width:70},
                {field:'stock',title:'库存',width:70},
                {field:'isMarketable',title:'是否上架',width:50,
                    formatter:function(value,row,index){
                        if(row.isMarketable==1){
                            return "<font color='#7CFC00' size='5'>√</font>";
                        } else {
                            return "<font color='red' size='5'>×</font>"
                        }
                    }
                },
                {field:'createDate',title:'创建日期',width:100},
                {field:'productOperation',title:'操作',width:150,
                    formatter:function(value,row,index){
                        return "<a href='javascript:void(0);' target='_blank' style='text-decoration:none;' onclick='editProductById("+row.id+")'>【编辑】</a>&nbsp;&nbsp;<a href='javascript:void(0);' target='_blank' style='text-decoration:none;' onclick='js_method()'>【查看】</a>";
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
    function addProduct(){
        $("#productTabAndTabToolBar").hide();
        $("#addProductHiddenDiv").show();
        $('#myTab a:first').tab('show');
    }
    function refreshProduct(){
        $("#productTab").bootstrapTable('refresh');
    }
    $(function(){
        $.ajax({
            url:"<%=request.getContextPath() %>/productCategoryController/selectProductCategory.jhtml",
            type:'post',
            dataType: "json",
            success:function(data){
                for (var i = 0; i < data.length; i++) {
                     $("#productCategoryId").append("<option value="+data[i].id+">" + data[i].name + "</option>");
                }
            },
            error:function(){
                alert("ajax失败");
            }
        });
    })
    //返回
    function returnProductTab(){
        document.getElementById("productBasicInformationFormId").reset();
        /*$("#productBasicInformationFormId").reset();*/
        $("#productTabAndTabToolBar").show();
        $("#addProductHiddenDiv").hide();
        $("#productTab").bootstrapTable('refresh');
    }
    //获取所有form表单的值
    function getForm(){
        $("#productBasicInformationFormId").serialize();
    }

    //新增
    function insertProduct(){
        $.ajax({
            url:"<%=request.getContextPath()%>/productController/insertSelective.jhtml",
            type:'post',
            data: $("#productBasicInformationFormId").serialize(),
            success:function(data){
                alert("保存成功");
                $("#productTab").bootstrapTable('refresh');
            },
            error:function(){
                alert("ajax失败");
            }
        });
    }

    //批量删除
    function deleteProducts(){
        var ids = "";
        var productIdsNum = 0;
        for (var i = 0; i < $("[name='chk']").length; i++) {
            if($("[name='chk']").eq(i).prop("checked")){
                ids += "," + $("[name='chk']").eq(i).val();
                productIdsNum++;
            }
        }
        if(productIdsNum>0){
            ids = ids.substring(1);
            var delProductIdsNum = "确定删除这"+productIdsNum+"条数据吗?";
            if(confirm(delProductIdsNum)){
                $.ajax({
                    url:"<%=request.getContextPath()%>/productController/deleteByPrimaryKeys.jhtml?ids="+ids,
                    success:function(){
                        alert("删除成功！！！");
                        $("#productTab").bootstrapTable('refresh');
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

    function editProductById(id){
        $.ajax({
            url:"<%=request.getContextPath()%>/productController/editProductById.jhtml?id="+id,
            success:function(data){
                alert(data.id)
                alert("成功！！！");
            },
            error:function(){
                alert("系统错误！！！请调试Debug检查！！！");
            }
        })
    }
    //添加参数
    function add_productImageTr(obj) {
        //var tr = $(obj).parent().parent();
        $("#addProductImageTr").after("<tr name='productImageTr'><td bgcolor='#ECECFF'><input style='float: left' type='file' name='rankimg'/><input style='float: left' type='button' class='button' value='上传' onclick='uploadFiles()' /></td><td><input type='text' class='form-control' name='222' placeholder='标题'></td><td><input type='text' name='333' class='form-control' placeholder='排序'></td><td><a href='javascript:void(0);' onclick='deleteProductImageTr(this)'>【删除】</a></td></tr>");
        //tr.after(tr.clone());
    }
    // 删除参数
    function deleteProductImageTr(obj){
        $(obj).parent().parent().remove();
    }

    function uploadFiles() {
        var formData = new FormData(document.getElementById("productImageForm"));
        alert(formData)
        $.ajax({
            url:"<%=request.getContextPath()%>/uploadImage/fileuploadBrnadLogo.jhtml",
            type:"post",
            data: formData,
            async: false,
            contentType: false,
            processData: false,
            dataType:"text",//json   text
            success:function (msg){
                if(msg==1){
                    alert("success")
                }else{
                    alert("添加失败");
                }
            },
            error:function (){
                alert("程序发生错误");
            }
        });
    }
</script>
</body>
</html>
