<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/04/13
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>会员注册项修改</title>
    <link href="/shopxx/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="path">
    <a href="/shopxx/admin/common/index.jhtml">首页</a> &raquo; 编辑会员注册项
</div>
    <form id="updateMemberAttribute-form" method="post">
        <%--隐藏域--%>
        <input type="hidden" name="id" value="${id}" />
        <input type="hidden" name="property_index" />
        <input type="hidden" name="kxxoptions" />
        <input type="hidden" name="type" />
        <table id="update-memberAttributeTable" class="input">
            <tr>
                <th>
                    类型:
                </th>
                <td>
                    <span id="type-span"></span>
                </td>
            </tr>
            <tr>
                <th>
                    <span class="requiredField">*</span>名称:
                </th>
                <td>
                    <input type="text" name="name" class="text" maxlength="200" />
                </td>
            </tr>
            <tr>
                <th>
                    排序:
                </th>
                <td>
                    <input type="text" name="orders" class="text" maxlength="9" />
                </td>
            </tr>
            <tr>
                <th>
                    设置:
                </th>
                <td>
                    <label>
                        <input type="checkbox" name="isEnabled" />是否启用
                        <input type="hidden" name="is_Enabled" />
                    </label>
                    <label>
                        <input type="checkbox" name="isRequired" />是否必填
                        <input type="hidden" name="is_Required" />
                    </label>
                </td>
            </tr>
            <tr id="addOptionTr" class="hidden">
                <th>
                    &nbsp;
                </th>
                <td>
                    <a href="javascript:;" id="addOptionButton" class="button" onclick="addKXXtr()">添加</a>
                </td>
            </tr>
        </table>
        <table class="input">
            <tr>
                <th>
                    &nbsp;
                </th>
                <td>
                    <input type="button" onclick="updateMemberAttribute()" class="button" value="确&nbsp;&nbsp;定" />
                    <input type="button" class="button" value="返&nbsp;&nbsp;回" onclick="location.href='list.jhtml'" />
                </td>
            </tr>
        </table>
    </form>

    <script type="text/javascript" src="/shopxx/resources/admin/js/jquery.js"></script>
    <script type="text/javascript" src="/shopxx/resources/admin/js/common.js"></script>
    <script type="text/javascript" src="/shopxx/resources/admin/js/input.js"></script>
    <script type="text/javascript">

        $(function(){
            //页面刷新，根据id查询
            $.ajax({
                url:"<%=request.getContextPath()%>/memberAttribute/queryMemberAttributeByid.do",
                type:"post",
                data:{"id":$("[name='id']").val()},
                dataType:"json",//json   text
                success:function (data){
                    //显示类型
                    $("[name='type']").val(data.type);
                    if(data.type<8){
                        $("#type-span").html(data.name);
                    }else{
                        if(data.type==8){
                            $("#type-span").html("文本");
                        }else if(data.type==9){
                            $("#type-span").html("单选项");
                        }else{
                            $("#type-span").html("多选项");
                        }
                    }

                    $("[name='name']").val(data.name);
                    $("[name='orders']").val(data.orders);
                    $("[name='property_index']").val(data.property_index);

                    if(data.is_Enabled==1){
                        $("[name='isEnabled']").prop("checked","checked");
                    }else{
                        $("[name='isEnabled']").prop("checked","");
                    }

                    if(data.is_Required==1){
                        $("[name='isRequired']").prop("checked","checked");
                    }else{
                        $("[name='isRequired']").prop("checked","");
                    }

                    if(data.type>8){
                        //放开隐藏
                        $("#addOptionTr").prop("class","");
                        var strarray = data.kxxoptions.split(",")
                        for(var i = 0 ; i<strarray.length ; i++){
                            var trHtml = '<tr class="optionTr"> <th>可选项:<\/th> <td> <input type="text" value="'+strarray[i]+'" name="options" class="text options" maxlength="200" \/> <a href="javascript:;" onclick="deleteKXXtr(this)" class="deleteOption">[删除]<\/a> <\/td> <\/tr>';
                            $("#update-memberAttributeTable").append(trHtml);
                        }
                    }
                },
                error:function (){
                    alert("程序发生错误");
                }
            });
        })

        //修改
        function updateMemberAttribute() {
            //判断
            if($("#isEnabled").prop("checked")){
                $("[name='is_Enabled']").val(0);
            }else{
                $("[name='is_Enabled']").val(1);
            }

            if($("#isRequired").prop("checked")){
                $("[name='is_Required']").val(0);
            }else{
                $("[name='is_Required']").val(1);
            }

            //拼接输入的可选项
            var optionstr = "";
            //如果不为‘文本’，再拼接
            if($("#matype").val()!='8'){
                $("[name='options']").each(function () {
                    optionstr += ","+$(this).val();
                })
                //拼接
                optionstr=optionstr.substring(1);
                $("[name='kxxoptions']").val(optionstr);
            }

            //修改
            $.ajax({
                url:"<%=request.getContextPath()%>/memberAttribute/updateMemberAttribute.do",
                type:"post",
                data:$("#updateMemberAttribute-form").serialize(),//将表单序列化为key value的形式
                dataType:"text",//json   text
                success:function (msg){
                    if(msg==1){
                        location.href="<%=request.getContextPath()%>/memberAttribute/toShowMemberAttribute.do";
                    }else{
                        alert("添加失败");
                    }
                },
                error:function (){
                    alert("程序发生错误");
                }
            });


        }

        //添加可选项
        function addKXXtr() {
            var trHtml = '<tr class="optionTr"> <th>可选项:<\/th> <td> <input type="text" name="options" class="text options" maxlength="200" \/> <a href="javascript:;" onclick="deleteKXXtr(this)" class="deleteOption">[删除]<\/a> <\/td> <\/tr>';
            $("#update-memberAttributeTable").append(trHtml);
        }

        //删除可选项
        function deleteKXXtr(obj) {
            var a=0;
            $("[class='deleteOption']").each(function () {
                a++;
            })
            if(a<=1){
                alert("请确保有一个可选项！");
            }else{
                $(obj).closest("tr").remove();
            }
        }

    </script>

</body>
</html>
