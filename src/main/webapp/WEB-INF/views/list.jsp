<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>

<title>list</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${APP_PATH  }/static/js/jquery.1.12.4.min.js"></script>
<!-- Bootstrap -->
<link href="${APP_PATH  }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${APP_PATH  }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>

<body>


	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>SSM CRUD</h1>	
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary btn-sm">新增</button>
				<button class="btn btn-danger btn-sm"></button>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>编号</th>
						<th>姓名</th>
						<th>性别</th>
						<th>邮箱</th>
						<th>部门</th>
					</tr>
					<tr>
						<th>1</th>
						<th>刘备</th>
						<th>男</th>
						<th>1@sanguo.com</th>
						<th>采购部</th>
					</tr>
				</table>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6">
			</div>
			
			<div class="col-md-6">
				<nav aria-label="Page navigation">
					  <ul class="pagination">
					  	  <li><a href="#">首页</a></li>
					    <li>
					      <a href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <li><a href="#">1</a></li>
					    <li><a href="#">2</a></li>
					    <li><a href="#">3</a></li>
					    <li><a href="#">4</a></li>
					    <li><a href="#">5</a></li>
					    <li>
					      <a href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					      <li><a href="#">末页</a></li>
					  </ul>
				</nav>
			</div>
		</div>
	</div>

	
	
	<div class="dropup">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Dropup
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
    <li><a href="#">Action</a></li>
    <li><a href="#">Another action</a></li>
    <li><a href="#">Something else here</a></li>
    <li role="separator" class="divider"></li>
    <li><a href="#">Separated link</a></li>
  </ul>
</div>
</body>
</html>
