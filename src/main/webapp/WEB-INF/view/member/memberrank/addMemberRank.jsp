<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/04/11
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link href="/shopxx/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="addmemberrank-form" method="post">
    <table class="input">
        <tr>
            <th>
                <span class="requiredField">*</span>名称:
            </th>
            <td>
                <input type="text" name="name" class="text" maxlength="100" />
            </td>
        </tr>
        <tr>
            <th>
                <span class="requiredField">*</span>优惠比例:
            </th>
            <td>
                <input type="text" name="scale" class="text" value="1" maxlength="7" />
            </td>
        </tr>
        <tr>
            <th>
                <span class="requiredField">*</span>消费金额:
            </th>
            <td>
                <input type="text" id="amount" name="amount" class="text" maxlength="16" />
            </td>
        </tr>
        <tr>
            <th>
                设置:
            </th>
            <td>
                <label>
                    <input type="checkbox" id="Default" />是否默认
                    <input type="hidden" name="is_Default" value="0" />
                </label>
                <label title="特殊会员等级不随消费金额变化">
                    <input type="checkbox" id="Special" />是否特殊
                    <input type="hidden" name="is_Special" value="0" />
                </label>
            </td>
        </tr>
        <tr>
            <th>
                &nbsp;
            </th>
            <td>
                <input type="button" class="button" value="确&nbsp;&nbsp;定" onclick="addMemberRank()" />
                <input type="button" class="button" value="返&nbsp;&nbsp;回" onclick="location.href='list.jhtml'" />
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript" src="/shopxx/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="/shopxx/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="/shopxx/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="/shopxx/resources/admin/js/common.js"></script>
<script type="text/javascript" src="/shopxx/resources/admin/js/input.js"></script>
<script type="text/javascript">
    $().ready(function() {

        var $inputForm = $("#inputForm");
        var $amount = $("#amount");
        var $isSpecial = $("#isSpecial");


        // 特殊会员等级修改
        $isSpecial.click(function() {
            if ($(this).prop("checked")) {
                $amount.val("").prop("disabled", true);
            } else {
                $amount.prop("disabled", false);
            }
        });

    });
    
    function addMemberRank() {
        //判断
        if($("#Default").prop("checked")){
            $("[name='is_Default']").val(1);
        }else{
            $("[name='is_Default']").val(0);
        }

        if($("#Special").prop("checked")){
            $("[name='is_Special']").val(1);
        }else{
            $("[name='is_Special']").val(0);
        }
        $.ajax({
            url:"<%=request.getContextPath()%>/memberRank/addMemberRank.do",
            type:"post",
            data:$("#addmemberrank-form").serialize(),//将表单序列化为key value的形式
            dataType:"text",//json   text
            success:function (msg){
                if(msg==1){
//                    alert("添加成功");
                    location.href="<%=request.getContextPath()%>/memberRank/toShowMemberRank.do";
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
