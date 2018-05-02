<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/04/12
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加会员注册项</title>
    <link href="/shopxx/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <div class="path">
        <a href="/shopxx/admin/common/index.jhtml">首页</a> &raquo; 添加会员注册项
    </div>

    <form id="addMemberAttribute-form" method="post">
        <%--可选项的隐藏域--%>
        <input type="hidden" name="kxxoptions" />
        <table id="memberAttribute-table" class="input">
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
                    类型:
                </th>
                <td>
                    <select id="matype" onchange="changeMemberAttributeType(this)" name="type">
                        <option value="8">文本</option>
                        <option value="9">单选项</option>
                        <option value="10">多选项</option>
                    </select>
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
                        <input type="checkbox" id="isEnabled" value="true" checked="checked" />是否启用
                        <input type="hidden" name="is_Enabled" value="0" />
                    </label>
                    <label>
                        <input type="checkbox" id="isRequired" value="true" />是否必填
                        <input type="hidden" name="is_Required" value="0" />
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
            <tr id="inputTr" class="hidden">
                <th>
                    可选项:
                </th>
                <td>
                    <input type="text" name="options" class="text options" maxlength="200" /> <a href="javascript:;" onclick="deleteKXXtr(this)" class="deleteOption">[删除]</a>
                </td>
            </tr>
        </table>
        <table class="input">
            <tr>
                <th>
                    &nbsp;
                </th>
                <td>
                    <input type="button" onclick="addMemberAttribute()" class="button" value="确&nbsp;&nbsp;定" />
                    <input type="button" class="button" value="返&nbsp;&nbsp;回" onclick="location.href='list.jhtml'" />
                </td>
            </tr>
        </table>
    </form>


    <script type="text/javascript" src="/shopxx/resources/admin/js/jquery.js"></script>
    <script type="text/javascript" src="/shopxx/resources/admin/js/common.js"></script>
    <script type="text/javascript" src="/shopxx/resources/admin/js/input.js"></script>
    <script type="text/javascript">

        //全局变量，用来存储页面加载的代码
        var fromstr="";

        $(function(){
            //给全局变量赋值
            fromstr = $("#memberAttribute-table").html();
        })

        function changeMemberAttributeType(obj) {
            if(obj.value=='8'){
                $("#memberAttribute-table").html(fromstr);
            }else{
                //更新表格
                $("#memberAttribute-table").html(fromstr);
                //因为更新成‘文本’字段，将下拉列表设置为你选的值
                $("#matype").val(obj.value);
                //放开隐藏
                $("#addOptionTr").prop("class","");
                $("#inputTr").prop("class","");
            }
        }
        
        //添加可选项
        function addKXXtr() {
            var trHtml = '<tr class="optionTr"> <th>可选项:<\/th> <td> <input type="text" name="options" class="text options" maxlength="200" \/> <a href="javascript:;" onclick="deleteKXXtr(this)" class="deleteOption">[删除]<\/a> <\/td> <\/tr>';
            $("#memberAttribute-table").append(trHtml);
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

        //添加会员注册项
        function addMemberAttribute() {
            //判断
            if($("#isEnabled").prop("checked")){
                $("[name='is_Enabled']").val(1);
            }else{
                $("[name='is_Enabled']").val(0);
            }

            if($("#isRequired").prop("checked")){
                $("[name='is_Required']").val(1);
            }else{
                $("[name='is_Required']").val(0);
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

            $.ajax({
                url:"<%=request.getContextPath()%>/memberAttribute/addMemberAttribute.do",
                type:"post",
                data:$("#addMemberAttribute-form").serialize(),//将表单序列化为key value的形式
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

    </script>

</body>
</html>
