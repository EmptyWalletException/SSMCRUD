<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>

<title>list</title>


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
				<button class="btn btn-danger btn-sm">删除</button>
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
					
					<c:forEach items="${pageInfo.list }" var="emp">
						<tr>
							<th>${emp.empId }</th>
							<th>${emp.empName }</th>
							<th>${emp.empGender=="M"?"男":"女" }</th>
							<th>${emp.empEmail }</th>
							<th>${emp.department.deptName }</th>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6">
				 当前第${pageInfo.pageNum }/${pageInfo.pages }页,当前页记录数:${pageInfo.size }条;总记录数:${pageInfo.total }条;
			</div>
			
			<div class="col-md-6">
				<nav aria-label="Page navigation">
					  <ul class="pagination">
					  
					     <!-- 首页 -->
					  	  <li><a href="${APP_PATH }/emps?pn=1">首页</a></li>
					  	  
					  	  <!-- 前一页 -->
					  	<c:if test="${pageInfo.hasPreviousPage }">
						    <li>
						      <a href="${APP_PATH }/emps?pn=${pageInfo.prePage}" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
					    </c:if>
					    
					    <!-- 分页条上显示的12345页码 -->
					    <c:forEach items="${pageInfo.navigatepageNums }" var="ngpn">
					    	<c:if test="${ngpn == pageInfo.pageNum }">
						    	<li class="active"><a href="${APP_PATH }/emps?pn=${ngpn}" >${ngpn }</a></li>
						    </c:if>
						    <c:if test="${ngpn != pageInfo.pageNum }">
						    	<li ><a href="${APP_PATH }/emps?pn=${ngpn}" >${ngpn }</a></li>
						    </c:if>
					    </c:forEach>
					    
					    <!-- 下一页 -->
					    <c:if test="${pageInfo.hasNextPage }">
					    <li>
					      <a href="${APP_PATH }/emps?pn=${pageInfo.nextPage}" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					    </c:if>
					    
					    <!-- 最后一页 -->
					      <li><a href="${APP_PATH }/emps?pn=${pageInfo.pages}">末页</a></li>
					      
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
