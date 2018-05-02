<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/04/16
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>修改评论</title>
    <link href="/shopxx/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <div class="path">
        <a href="/shopxx/admin/common/index.jhtml">首页</a> &raquo; 编辑评论
    </div>
    <form id="updatereview-form" method="post">
        <input type="hidden" name="id" value="${review.id}" />
        <table class="input">
            <tr>
                <th>
                    商品:
                </th>
                <td>
                    <a href="/shopxx/product/content/201804/150.html" target="_blank">${review.productname}</a>
                </td>
            </tr>
            <tr>
                <th>
                    会员:
                </th>
                <td>
                    ${review.membername}
                    <c:if test="${review.membername==null}">游客</c:if>
                </td>
            </tr>
            <tr>
                <th>
                    IP:
                </th>
                <td>
                    ${review.ip}
                </td>
            </tr>
            <tr>
                <th>
                    评分:
                </th>
                <td>
                    ${review.score}
                </td>
            </tr>
            <tr>
                <th>
                    内容:
                </th>
                <td>
                    ${review.content}
                </td>
            </tr>
            <tr>
                <th>
                    是否显示:
                </th>
                <td>
                    <input type="checkbox" id="reviewcheckbox" />
                    <input type="hidden" id="isshowhideen" name="isShow" value="${review.isShow}" />
                </td>
            </tr>
            <tr>
                <th>
                    &nbsp;
                </th>
                <td>
                    <input type="button" class="button" value="确&nbsp;&nbsp;定" onclick="updatereview()" />
                    <input type="button" class="button" value="返&nbsp;&nbsp;回" onclick="location.href='list.jhtml'" />
                </td>
            </tr>
        </table>
    </form>

    <script type="text/javascript" src="/shopxx/resources/admin/js/jquery.js"></script>
    <script type="text/javascript" src="/shopxx/resources/admin/js/common.js"></script>
    <script type="text/javascript" src="/shopxx/resources/admin/js/input.js"></script>
    <script type="text/javascript">
        $(function () {
            var str = $("#isshowhideen").val();
            if(str==1){
                $("#reviewcheckbox").prop("checked","checked");
            }else{
                $("#reviewcheckbox").prop("checked","");
            }
        })
        
        function updatereview() {
            //判断
            if($("#reviewcheckbox").prop("checked")){
                $("#isshowhideen").val(1);
            }else{
                $("#isshowhideen").val(0);
            }
            $.ajax({
                url:"<%=request.getContextPath()%>/review/updateReview.do",
                type:"post",
                data:$("#updatereview-form").serialize(),//将表单序列化为key value的形式
                dataType:"text",//json   text
                success:function (msg){
                    if(msg==1){
                        location.href="<%=request.getContextPath()%>/review/toShowReview.do";
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
