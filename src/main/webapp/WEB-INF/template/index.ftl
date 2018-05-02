<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title><h1>shop++后台管理页面</h1></title>
</head>
<body>
<center>
<h1>测试free marker生成模板</h1>
<table class="table" border="1" cellpadding="1">
	<tr>
		<th>id</th>
    	<th>name</th>
        <th>pwd</th>
        <th>createdatetime</th>
        <th>modefydatetime</th>
	</tr>
	<#list users as user>
	<tr>
		<td>${user.id}</td>
		<td>${user.name}</td>
		<td>${user.pwd}</td>
		<td>${user.createdatetime}</td>
        <td>${user.modifydatetime}</td>
	</tr>
 	</#list>
</table>
</center>
</body>
</html>