<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mongodb日志记录列表</title>
</head>
<jsp:include page="plug-in.jsp"></jsp:include>
<body>
	<!-- 展示表格 -->
	<table id="logListId"></table>
	<script type="text/javascript">
		$(function(){
			$('#logListId').bootstrapTable({
				url:'<%=request.getContextPath()%>/userController/queryLog.jhtml',
				striped: true,//隔行变色
				showPaginationSwitch:true,//是否显示 数据条数选择框
				minimumCountColumns:1,//最小留下一个
				pagination:true,//开启分页
				//paginationLoop:true,//开启分页无限循环
				pageNumber:1,//当前页数
				pageSize:10,//每页条数
				pageList:[10,20,30,40],//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
				sidePagination:"server",//
				method:'post',//发送请求的方式
				contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
				queryParams:function(data){
					return {
						page:this.pageNumber,//当前页
						rows:this.pageSize //每页条数
					}
				},
				columns:[[
					{field:'logid',title:'编号',width:100,align:'center'},
					{field:'methodname',title:'方法名',width:100,align:'center'},
					{field:'methodname',title:'方法名称',width:100,align:'center',
						formatter:function(value,row){
							var str = row.methodname;
							var str1 = str.substring(0,2);
							if(str1 == "qu"){
								str1 = "查询";
							}else if(str1 == "ad"){
								str1 = "新增";
							}else if(str1 == "de"){
								str1 = "删除";
							}else if(str1 == "to"){
								str1 = "跳转页面";
							}else if(str1 == "up"){
								str1 = "修改";
							}else if(str1 == "lo"){
								str1 = "登陆";
							}else{
								str1 = "未定义";
							};
							return str1;
						}
					},
					{field:'params',title:'参数',width:100,align:'center'},
					{field:'actMan',title:'操作人',width:100,align:'center',
						formatter:function(value,row){
							return "${loginName}";
						}
					},
					{field:'urlstr',title:'请求地址',width:100,align:'center'},
					{field:'acttime',title:'请求时间',width:100,align:'center'},
				]]
			});
		})

	</script>
</body>
</html>