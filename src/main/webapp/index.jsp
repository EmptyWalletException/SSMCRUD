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
				<button class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-plus"></span> 新增</button>
				<button class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span> 删除</button>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emp_table">
					<thead>
						<tr>
							<th>编号</th>
							<th>姓名</th>
							<th>性别</th>
							<th>邮箱</th>
							<th>部门</th>
							<th>操作</th>
						</tr>
					</thead>
					
					<tbody>
					
					</tbody>					
				</table>
			</div>
		</div>
		
		<div class="row">
			<!-- 分页结果信息 -->
			<div class="col-md-6" id="page_info">
			</div>
			
			<!-- 导航条 -->
			<div class="col-md-6" id="page_nav">
				
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

	<!-- 当文档加载完成后会执行下面的script代码发送一个ajax请求 -->
	<script type="text/javascript">
		$(function(){
			to_page(1);
		});

		/* 抽取出来的跳转到指定页码页面的方法 */
		function to_page(pn){
			$.ajax({
				url:"${APP_PATH}/emps",
				data:"pn="+pn,
				type:"get",
				success:function(result){
					build_emps_table(result);
					build_page_info(result);
					build_page_nav(result);
				}
			});
		}
		/* 遍历并插入每一行员工信息数据 */
		function build_emps_table(result){
				/* 生成新的元素前一定要先清空掉以前的数据,否则会累加到页面上 */
				$("#emp_table tbody").empty();
				var emps = result.extend.pageInfo.list;
				$.each(emps,function(index,item){
					
					var empId = $("<td></td>").append(item.empId);
					var empName = $("<td></td>").append(item.empName);
					var empGender = $("<td></td>").append(item.empGender=="M"?"男":"女");
					var empEmail = $("<td></td>").append(item.empEmail);
					var empDept = $("<td></td>").append(item.department.deptName);
					
					/* <button class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-plus"></span>新增</button>
				<button class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span>删除</button> */
					var span_edit = $("<span></span>").addClass("glyphicon glyphicon-pencil");
					var button_edit = $("<button></button>").addClass("btn btn-primary btn-sm").append(span_edit).append(" 编辑");
					var span_del = $("<span></span>").addClass("glyphicon glyphicon-trash");
					var button_del = $("<button></button>").addClass("btn btn-danger btn-sm").append(span_del).append(" 删除");
					var button_td = $("<td></td>").append(button_edit).append(" ").append(button_del);
					
					$("<tr></tr>").append(empId).append(empName).append(empGender).append(empEmail).append(empDept).append(button_td).appendTo("#emp_table tbody");
				});
		}
		
		/*  当前第${pageInfo.pageNum }/${pageInfo.pages }页,当前页记录数:${pageInfo.size }条;总记录数:${pageInfo.total }条; */
		function build_page_info(result){
			/* 生成新的元素前一定要先清空掉以前的数据,否则会累加到页面上 */
			$("#page_info").empty();
			$("#page_info").append("当前第"+result.extend.pageInfo.pageNum+"/"+result.extend.pageInfo.pages+"页,当前页记录数:"+result.extend.pageInfo.size+"条;总记录数:"+result.extend.pageInfo.total+"条");
		} 
		
		/* 显示分页条 */
		function build_page_nav(result){
			/* 生成新的元素前一定要先清空掉以前的数据,否则会累加到页面上 */
			$("#page_nav").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			
			/* 生成首页按钮 */
			var li_frist = $("<li></li>").append($("<a></a>").attr("href","#").append("首页"));
			
			ul.append(li_frist);

			/* 生成上一页按钮 */
			var li_pre = $("<li></li>").append($("<a></a>").attr("href","#").append("&laquo;"));
			
			ul.append(li_pre);			
			
			/* 当没有上一页时则按钮不可点击,否则可以点击 */
			if(result.extend.pageInfo.hasPreviousPage == false){
				li_frist.addClass("disabled");
				li_pre.addClass("disabled");
			}else{
				/* 为首页按钮添加一个点击跳转到首页的绑定事件 */
				li_frist.click(function(){
					to_page(1);
				});	
				/* 为上一页按钮添加一个点击跳转到上一页的绑定事件 */
				li_pre.click(function(){
					to_page(result.extend.pageInfo.prePage);
				});
			}
			
			/* 遍历分页信息中是否有12345等页码数 */
			$.each(result.extend.pageInfo.navigatepageNums,function(index,nums){
				var a_nums = $("<a></a>").attr("href","#").append(nums)
				var li_nums = $("<li></li>").append(a_nums);
				
				if(result.extend.pageInfo.pageNum == nums){
					/* 当前页码高亮显示 ,如果不是当前页码,则会在else里添加点击功能*/
					li_nums.addClass("active");
				}else{
					/* 为每一个遍历后生成出来的li_nums添加一个点击跳转的绑定事件 */
					li_nums.click(function(){
						to_page(nums);
					});
				}
				ul.append(li_nums);
			});
			
			/* 生成下一页按钮 */
			var li_next = $("<li></li>").append($("<a></a>").attr("href","#").append("&raquo;"));
			
			ul.append(li_next);
			
			/* 生成末页按钮 */
			var li_last = $("<li></li>").append($("<a></a>").attr("href","#").append("末页"));
			
			ul.append(li_last);			
			
			/* 当没有下一页时按钮不可点击,否则可以点击 */
			if(result.extend.pageInfo.hasNextPage == false){
				li_next.addClass("disabled");
				li_last.addClass("disabled");
			}else{
				/* 为下一页按钮添加一个点击跳转到下一页的绑定事件 */
				li_next.click(function(){
					to_page(result.extend.pageInfo.nextPage);
				});
				/* 为末页按钮添加一个点击跳转到末页的绑定事件 */
				li_last.click(function(){
					to_page(result.extend.pageInfo.pages);
				});
			}
			
			var nav = $("<nav></nav>").attr("aria-label","Page navigation").append(ul);
			$("#page_nav").append(nav);
		}
	</script>
</body>
</html>
