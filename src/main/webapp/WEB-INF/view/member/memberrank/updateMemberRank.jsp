<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/04/12
  Time: 13:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>会员等级修改</title>
    <link href="/shopxx/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <div class="path">
        <a href="/shopxx/admin/common/index.jhtml">首页</a> &raquo; 编辑会员等级
    </div>
    <form id="updatememberrank-form" method="post">
        <input type="hidden" name="id" value="${memberrank.id}" />
        <table class="input">
            <tr>
                <th>
                    <span class="requiredField">*</span>名称:
                </th>
                <td>
                    <input type="text" name="name" class="text" value="${memberrank.name}" maxlength="100" />
                </td>
            </tr>
            <tr>
                <th>
                    <span class="requiredField">*</span>优惠比例:
                </th>
                <td>
                    <input type="text" name="scale" class="text" value="${memberrank.scale}" maxlength="7" />
                </td>
            </tr>
            <tr>
                <th>
                    <span class="requiredField">*</span>消费金额:
                </th>
                <td>
                    <input type="text" name="amount" class="text" value="${memberrank.amount}" maxlength="16"  />
                </td>
            </tr>
            <tr>
                <th>
                    设置:
                </th>
                <td>
                    <label>
                        <input type="checkbox" id="Default"
                               <c:if test="${memberrank.is_Default==1}">checked="checked"</c:if>
                        />是否默认
                        <input type="hidden" name="is_Default" value="0" />
                    </label>
                    <label title="特殊会员等级不随消费金额变化">
                        <input type="checkbox" id="Special"
                               <c:if test="${memberrank.is_Special==1}">checked="checked"</c:if>
                        />是否特殊
                        <input type="hidden" name="is_Special" value="0" />
                    </label>
                </td>
            </tr>
            <tr>
                <th>
                    &nbsp;
                </th>
                <td>
                    <input type="submit" class="button" value="确&nbsp;&nbsp;定" onclick="updateMemberRank()" />
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

        function updateMemberRank() {
            //判断
            if($("#Default").prop("checked")){
                $("[name='is_Default']").val(1);
            }

            if($("#Special").prop("checked")){
                $("[name='is_Special']").val(1);
            }
            $.ajax({
                url:"<%=request.getContextPath()%>/memberRank/updateMemberRank.do",
                type:"post",
                data:$("#updatememberrank-form").serialize(),//将表单序列化为key value的形式
                dataType:"text",//json   text
                success:function (msg){
                    if(msg==1){
                        location.href="<%=request.getContextPath()%>/memberRank/toShowMemberRank.do";
                    }else{
                        alert("修改失败");
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
