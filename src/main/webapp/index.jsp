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

	<!-- 添加员工的模态框 -->
	<div class="modal fade" id="modal_add" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h3 class="modal-title">新增员工</h3>
	      </div>
	      <div class="modal-body">
	       		 <form class="form-horizontal" id="modal_form">
	       		 	
	       		 	  <!-- 姓名Id提示,禁用框 -->
					  <div class="form-group">
					    <label for="inputName" class="col-sm-2 control-label">员工编号</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="inputID" placeholder="员工ID由系统自动生成" disabled>
					    </div>
					  </div>
	       		 	  <!-- 姓名输入框 -->
					  <div class="form-group">
					    <label for="inputName" class="col-sm-2 control-label">员工姓名</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="empName" id="inputName" placeholder="输入姓名">
					      <span id="helpBlock1" class="help-block"></span>
					    </div>
					  </div>
					  <!-- 邮箱输入框 -->
					  <div class="form-group">
					    <label for="inputEmail" class="col-sm-2 control-label">员工邮箱</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="empEmail" id="inputEmail" placeholder="输入邮箱">
					      <span id="helpBlock2" class="help-block"></span>
					    </div>
					  </div>
					  <!-- 姓名选择的单选框 -->
				  	  <div class="form-group">
					    <label for="inputEmail" class="col-sm-2 control-label">选择性别</label>
					    	<div class="col-sm-10">
							  <label class="radio-inline">
							  		<input type="radio" name="empGender" id="inlineRadio1" value="M" checked="checked"> 男
							  </label>
							  <label class="radio-inline">
									  <input type="radio" name="empGender" id="inlineRadio2" value="W"> 女
							  </label>
						    </div>
					  </div>
					  <!-- 部门选择的下拉框 -->
					  <div class="form-group">
					    <label for="dept_select" class="col-sm-2 control-label">选择部门</label>
					    <div class="col-sm-4">
							  <select class="form-control" name="empDeptId" id="depts_select">
								  <!-- 通过解析后台返回的json数据来动态插入option -->
							  </select>
						</div>
					  </div>
				</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" id="submit_button">提交</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


	<!-- 编辑员工的模态框 -->
	<div class="modal fade" id="modal_edit" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h3 class="modal-title">编辑员工</h3>
	      </div>
	      <div class="modal-body">
	       		 <form class="form-horizontal" id="modal_edit_form">
	       		 	
	       		 	  <!-- 姓名Id提示,禁用框 -->
					  <div class="form-group">
					    <label for="editName" class="col-sm-2 control-label">员工编号</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="editID" placeholder="员工编号无法修改" disabled>
					      <span id="helpBlock0" class="help-block"></span>
					    </div>
					  </div>
	       		 	  <!-- 姓名输入框 -->
					  <div class="form-group">
					    <label for="editName" class="col-sm-2 control-label">员工姓名</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="empName" id="editName" placeholder="输入姓名">
					      <span id="helpBlock1" class="help-block"></span>
					    </div>
					  </div>
					  <!-- 邮箱输入框 -->
					  <div class="form-group">
					    <label for="editEmail" class="col-sm-2 control-label">员工邮箱</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="empEmail" id="editEmail" placeholder="输入邮箱">
					      <span id="helpBlock2" class="help-block"></span>
					    </div>
					  </div>
					  <!-- 姓名选择的单选框 -->
				  	  <div class="form-group">
					    <label for="radio" class="col-sm-2 control-label">选择性别</label>
					    	<div class="col-sm-10">
							  <label class="radio-inline">
							  		<input type="radio" name="empGender" id="inlineRadio3" value="M"> 男
							  </label>
							  <label class="radio-inline">
									  <input type="radio" name="empGender" id="inlineRadio4" value="W"> 女
							  </label>
						    </div>
					  </div>
					  <!-- 部门选择的下拉框 -->
					  <div class="form-group">
					    <label for="dept_edit_select" class="col-sm-2 control-label">选择部门</label>
					    <div class="col-sm-4">
							  <select class="form-control" name="empDeptId" id="depts_edit_select">
								  <!-- 通过解析后台返回的json数据来动态插入option -->
							  </select>
						</div>
					  </div>
				</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" id="update_button">更新</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	
	<!-- 网页主体框架 -->
	
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>SSM CRUD</h1>	
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary btn-sm" id="button_add"><span class="glyphicon glyphicon-plus"></span> 新增员工</button>
				<button class="btn btn-danger btn-sm" disabled="disabled" id="button_delete_batch"><span class="glyphicon glyphicon-trash"></span> 批量删除</button>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emp_table">
					<thead>
						<tr>
							<th><input type="checkbox" class="check_all"/> 全选</th>
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

	
	
	

	<!-- 当文档加载完成后会执行下面的script代码发送一个ajax请求 -->
	<script type="text/javascript">
		
	/* 定义一个全局变量用于记录末页的页码,服务于页面自动跳转到最后一页 */
		var maxPage;
		var currentPage;
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
					maxPage = result.extend.pageInfo.pages;
					currentPage = result.extend.pageInfo.pageNum;
					/* 重新检查页面上需要发生状态改变的按钮,以免逻辑性bug */
					changeAllCheckedButton();
					changeBatchDeleteButton();
				}
			});
		}
		
		/* 遍历并插入每一行员工信息数据 */
		function build_emps_table(result){
				/* 生成新的元素前一定要先清空掉以前的数据,否则会累加到页面上 */
				$("#emp_table tbody").empty();
				var emps = result.extend.pageInfo.list;
				$.each(emps,function(index,item){
					var checkBox = $("<input></input>").attr("type","checkbox").addClass("check_one");
					var checkBoxs = $("<td></td>").append(checkBox).append(" ");
					var empId = $("<td></td>").append(item.empId);
					var empName = $("<td></td>").append(item.empName);
					var empGender = $("<td></td>").append(item.empGender=="M"?"男":"女");
					var empEmail = $("<td></td>").append(item.empEmail);
					var empDept = $("<td></td>").append(item.department.deptName);
					
					/* <button class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-plus"></span>新增</button>
				<button class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span>删除</button> */
					var span_edit = $("<span></span>").addClass("glyphicon glyphicon-pencil");
					var button_edit = $("<button></button>").addClass("btn btn-primary btn-sm edit_button").attr("empId",item.empId).append(span_edit).append(" 编辑");
					var span_del = $("<span></span>").addClass("glyphicon glyphicon-trash");
					var button_del = $("<button></button>").addClass("btn btn-danger btn-sm delet_button").attr("empId",item.empId).attr("empName",item.empName).append(span_del).append(" 删除");
					var button_td = $("<td></td>").append(button_edit).append(" ").append(button_del);
					
					$("<tr></tr>").append(checkBoxs).append(empId).append(empName).append(empGender).append(empEmail).append(empDept).append(button_td).appendTo("#emp_table tbody");
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

		/* 初始化表单,情况表单中残留的数据并恢复到原始状态 */
		function init_form(ele){
			/* 清空模态框,防止旧的员工名残留在输入框中而ajax失效,由于jquery没有重置方法,只能使用DOM操作 */
			$(ele)[0].reset();
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		
		/*弹出添加员工模态框 */
		$("#button_add").click(function(){
		/* 点击新增按钮将会发送一个ajax请求从数据库取出部门列表,将部门数据插入新增员工的模态框中,然后弹出这个模态框, */
			getDepts("#depts_select");
			init_form("#modal_form");
			$('#modal_add').modal({
				backdrop:'static'
			});
		});
		
		/*弹出修改员工模态框 */
		$(document).on("click",".edit_button",function(){
			getEmp($(this).attr("empId"));
			getDepts("#depts_edit_select");
			$("#update_button").attr("empId",$(this).attr("empId"));
			
			init_form("#modal_edit_form");
			$('#modal_edit').modal({
				backdrop:'static'
			});
		});
		
		
		/* 查询单个员工的信息 */
		function getEmp(empId){
			$.ajax({
				url:"${APP_PATH}/emp/"+empId,
				type:"GET",
				success:function(result){
					$("#editID").val(result.extend.emp.empId);
					$("#editName").val(result.extend.emp.empName);
					$("#editEmail").val(result.extend.emp.empEmail);
					$("#modal_edit_form input[name=empGender]").val([result.extend.emp.empGender]);
					$("#modal_edit_form delect").val([result.extend.emp.empDeptId]);
				}
			});
			
		}
		
		/* 更新按钮点击后保存 */
		 $("#update_button").click(function(){ 
			
			 /* 检查输入框是否符合正则表达式 */
	 		 if(!validatInput("#editName","#update_button","#editEmail")){
				return false;	
			} 
			 
			/* 这里不能检查用户名的重复性,因为员工可能不想修改名字*/
		 	 
			
		 var ser_form = $("#modal_edit_form").serialize(); 
			//alert(ser_form);
		 	$.ajax({
				url:"${APP_PATH}/emp/"+$(this).attr("empId"),
				type:"POST",
				data:ser_form+"&_method=PUT",
				success:function(result){
					alert(result.msg); 
					/* 这里要检查一下后端是否返回了错误报告信息 */
				 	if(100 == result.code){
						$("#modal_edit").modal("hide"); 
						/* 自动跳转到当前页,分页插件会自动将超出的页码替换为最后一页,这里其实传入一个超大的数也可以,但是那样的做法不够档次 */
					 	to_page(currentPage);
					}else{ 
						/* console.log(result); */
						/* 判断从后台返回的错误字段是哪个,如果有,则显示错误信息 */
						 if(undefined != result.extend.fieldMsg.empName ){
							showValidateInfo("#editName","error",result.extend.fieldMsg.empName);
						}
						
						if(undefined != result.extend.fieldMsg.empEmail){
							showValidateInfo("#editEmail","error",result.extend.fieldMsg.empEmail);
						}
					}
				}
			});  
			
		});
		
		/* 查询出所有部门,并添加进选择器中 */
		function getDepts(ele){
			$.ajax({
				url:"${APP_PATH}/depts",
				type:"GET",
				success:function(result){
				//	console.log(result);
				//	<option>1</option>
						var depts_select = $(ele);
						depts_select.empty();
					$.each(result.extend.depts, function(index,dept){
						depts_select.append($("<option></option>").attr("value",dept.deptId).append(dept.deptName));
					});  
				}	
			});
		}
		
		/* 抽取出来的输入框的前端校验 */
		function validatInput(nameEle,ajaxEle,emailEle){
			/* 验证用户名  /^[a-z0-9_-]{3,16}$/  */
			var inputName = $(nameEle).val();
			var regName = /(^[a-z0-9_-]{2,10}$)|(^[\u2E80-\u9FFF]{2,10})/;
			//alert(!regName.test(inputName));

			/* 先检查ajax校验用户名的结果,ajax通过后再进一步检查*/
			if($(ajaxEle).attr("ajaxCheckEmpName") != "error"){
				if(!regName.test(inputName)){
					//alert("用户名格式不正确,请输入2~10位字符,只能出现数字或英文或汉字的组合!");
					showValidateInfo(nameEle,"error","用户名格式不正确,请输入2~10位字符,只能出现数字或英文或汉字的组合!");
				}else{
					showValidateInfo(nameEle,"ok","");
				}
			}
			
			
			/* 验证邮箱 */
			var inputEmail = $(emailEle).val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(inputEmail)){
				//alert("邮箱格式不正确!");
				showValidateInfo(emailEle,"error","邮箱格式不正确");
			}else{
				showValidateInfo(emailEle,"ok","");
			}
			
			if(!regName.test(inputName) || !regEmail.test(inputEmail)){
				return false;
			}
			return true;
		}
		
		/* 新增模态框中输入框的后端校验,目前只校验用户名 */
		$("#inputName").change(function(){
			var inputEmpName = this.value;
			$.ajax({
				url:"${APP_PATH}/checkEmp",
				data:"empName="+inputEmpName,
				type:"POST",
				success:function(result){
					if(100 == result.code){
						showValidateInfo("#inputName","ok",result.extend.validateMsg);
						$("#submit_button").attr("ajaxCheckEmpName","success");
					}else{
						showValidateInfo("#inputName","error",result.extend.validateMsg);
						$("#submit_button").attr("ajaxCheckEmpName","error");
					}
				}
			});
		});
		
		
		/* 显示校验信息 */
		function showValidateInfo(ele,status,msg){
			
			$(ele).parent().removeClass("has-error has-success");

			if("ok" == status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else{
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		
		/* 提交按钮点击后保存 */
		$("#submit_button").click(function(){
			
			/* 检查输入框是否符合正则表达式 */
			 if(!validatInput("#inputName","#submit_button","#inputEmail")){
				return false;	
			} 
			
			/* 检查ajax校验用户名是否可用后的标记 */
			if($(this).attr("ajaxCheckEmpName") == "error"){
				return false;
			}
			
			var ser_form = $("#modal_form").serialize();
			//alert(ser_form);
			$.ajax({
				url:"${APP_PATH}/emps",
				type:"POST",
				data:ser_form,
				success:function(result){
					alert(result.msg);
					/* 这里要检查一下后端是否返回了错误报告信息 */
					if(100 == result.code){
						$("#modal_add").modal("hide");
						/* 自动跳转到最后一页,分页插件会自动将超出的页码替换为最后一页,这里其实传入一个超大的数也可以,但是那样的做法不够档次 */
						to_page(maxPage + 1);
					}else{
						/* console.log(result); */
						/* 判断从后台返回的错误字段是哪个,如果有,则显示错误信息 */
						if(undefined != result.extend.fieldMsg.empName){
							showValidateInfo("#inputName","error",result.extend.fieldMsg.empName);
						}
						
						if(undefined != result.extend.fieldMsg.empEmail){
							showValidateInfo("#inputEmail","error",result.extend.fieldMsg.empEmail);
						}
					}
				}
			});
			
		});
		
		/*弹出删除员工的确认框 */
		$(document).on("click",".delet_button",function(){
			var empId = $(this).attr("empId");
			var empName = $(this).attr("empName");
			if(confirm("确定要删除编号:"+empId+",姓名:"+empName+"的员工吗?")){
				$.ajax({
					url:"${APP_PATH}/emp/"+empId,
					type:"POST",
					data:"&_method=DELETE",
					success:function(result){
						alert(result.msg); 
						to_page(currentPage);
					}
				});  
			}
			
		});
		
		/* 用于控制页面上的批量删除按钮是否可用 ,此方法最好在页面发生任何事件时都调用一次,否则会出现逻辑bug,
		目前只在点击选择框时和页面加载后重新检查一次*/
		function changeBatchDeleteButton(){
			var checked_length = $(".check_one:checked").length;
			var checkBox_length = $(".check_one").length;
			if(0 == checked_length){
				$("#button_delete_batch").prop("disabled","disabled");
			}else{
				$("#button_delete_batch").prop("disabled","");
			}
		}
		
		/* 用于控制全选按钮是否被勾选 ,此方法最好在页面发生任何事件时都调用一次,否则会出现逻辑bug,
		目前只在点击选择框时和页面加载后重新检查一次*/
		function changeAllCheckedButton(){
			var checked_length = $(".check_one:checked").length;
			var checkBox_length = $(".check_one").length;
			if(checkBox_length == checked_length){
				$(".check_all").prop("checked","checked");
			}else{
				$(".check_all").prop("checked","");
			}
		}
		
		/* 全选和全不选的功能 */
		$(".check_all").click(function(){
			/* .attr()方法只能适用用自定义的值,prop方法适用于原生的属性 */
			$(".check_one").prop("checked",$(this).prop("checked"));
			changeBatchDeleteButton();
		});
		
		/* 当检测到手动点满所有单个选择按钮时,则自动勾选上全选按钮 */
		$(document).on("click",".check_one",function(){
			/* .check_one:checked 是一类筛选器,筛选所有属性值有checked的check_one元素   .length代表筛选出来的个数*/
			/* 检查选中的个数是否等于页面上所有选择框的总数 */
			changeBatchDeleteButton();
			changeAllCheckedButton();
		});
		
		/*弹出批量删除员工的确认框 */
		$(document).on("click","#button_delete_batch",function(){
			/* 注意这里的变量初始化时一定要设置为空字符,否则就会是默认保存了一个undefined */
			var empIds = "";
			$.each($(".check_one:checked"),function(){
				 empIds += $(this).parents("tr").find("td:eq(1)").text()+",";
			});
			empIds = empIds.substring(0,empIds.length-1);
			if(confirm("确定要删除选中的所有员工吗?")){
				$.ajax({
					url:"${APP_PATH}/emp/"+empIds,
					type:"POST",
					data:"&_method=DELETE",
					success:function(result){
						alert(result.msg); 
						to_page(currentPage);
					}
				});  
			}
		});
	</script>
</body>
</html>
