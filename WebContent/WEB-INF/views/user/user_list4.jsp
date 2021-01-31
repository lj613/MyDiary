<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<title>用户列表</title>
<!--  以服务器的路径为标准 http://localhost:3306/MyDiary -->
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%-- 使用如：
<link rel="stylesheet" type="text/css"  href="${APP_PATH}/static/css/user/user_list.css"> --%>
<link rel="stylesheet" type="text/css"
	href="../static/css/user/user_list.css">
<link href="../static/css/bootstrap.min.css" rel="stylesheet">
<link href="../static/css/bootstrapValidator.min.css" rel="stylesheet" />
<script src="../static/js/jquery-3.4.1.min.js"></script>
<script src="../static/js/bootstrap.min.js"></script>
<script src="../static/js/bootstrapValidator.min.js"></script>

<link rel="stylesheet" type="text/css" href="../static/css/easyui.css">
<link rel="stylesheet" type="text/css" href="../static/css/icon.css">
<link rel="stylesheet" type="text/css" href="../static/css/demo.css">
<!-- <script type="text/javascript" src="../static/js/jquery.min.js"></script> -->
<script type="text/javascript" src="../static/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../static/js/validateExtends.js"></script>
<!-- <script type="text/javascript">
		$(function () {
			var table;
			//datagrid初始化 
			$('#dataList').datagrid({
				title: '用户列表',
				iconCls: 'icon-more', //图标 
				border: true,
				collapsible: false, //是否可折叠的 
				fit: true, //自动大小 
				method: "post",
				url: "get_list?t=" + new Date().getTime(),
				idField: 'id',
				singleSelect: false, //是否单选 
				pagination: true, //分页控件 
				rownumbers: true, //行号 
				sortName: 'id',
				sortOrder: 'DESC',
				remoteSort: false,
				columns: [
					[{
							field: 'chk',
							checkbox: true,
							width: 50
						},
						{
							field: 'id',
							title: 'ID',
							width: 50,
							sortable: true
						},
						{
							field: 'username',
							title: '用户名',
							width: 150,
							sortable: true
						}, 
						/* sortable: true 用来排序 */
						{
							field: 'password',
							title: '密码',
							width: 100
						},
					]
				],
				toolbar: "#toolbar"
			});
			//设置分页控件 
			var p = $('#dataList').datagrid('getPager');
			$(p).pagination({
				pageSize: 10, //每页显示的记录条数，默认为10 
				pageList: [10, 20, 30, 50, 100], //可以设置每页记录条数的列表 
				beforePageText: '第', //页数文本框前显示的汉字 
				afterPageText: '页    共 {pages} 页',
				displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
			});
			//设置工具类按钮
			$("#add").click(function () {
				table = $("#addTable");
				$("#addDialog").dialog("open");
			});
			//修改
			$("#edit").click(function () {
				table = $("#editTable");
				var selectRows = $("#dataList").datagrid("getSelections");
				if (selectRows.length != 1) {
					$.messager.alert("消息提醒", "请选择一条数据进行操作!", "warning");
				} else {
					$("#editDialog").dialog("open");
				}
			});
			//删除
			$("#delete").click(function () {
				var selectRows = $("#dataList").datagrid("getSelections");
				var selectLength = selectRows.length;
				if (selectLength == 0) {
					$.messager.alert("消息提醒", "请选择数据进行删除!", "warning");
				} else {
					var ids = [];
					$(selectRows).each(function (i, row) {
						ids[i] = row.id;
					});
					$.messager.confirm("消息提醒", "将删除与用户相关的所有数据，确认继续？", function (r) {
						if (r) {
							$.ajax({
								type: "post",
								url: "delete",
								data: {
									ids: ids
								},
								dataType: 'json',
								success: function (data) {
									if (data.type == "success") {
										$.messager.alert("消息提醒", "删除成功!", "info");
										//刷新表格
										$("#dataList").datagrid("reload");
										$("#dataList").datagrid("uncheckAll");
									} else {
										$.messager.alert("消息提醒", data.msg, "warning");
										return;
									}
								}
							});
						}
					});
				}
			});

			//设置添加窗口
			$("#addDialog").dialog({
				title: "添加用户",
				width: 350,
				height: 200,
				iconCls: "icon-add",
				modal: true,
				collapsible: false,
				minimizable: false,
				maximizable: false,
				draggable: true,
				closed: true,
				buttons: [{
					text: '添加',
					plain: true,
					iconCls: 'icon-user_add',
					handler: function () {
						var validate = $("#addForm").form("validate");
						if (!validate) {
							$.messager.alert("消息提醒", "请检查你输入的数据!", "warning");
							return;
						} else {
							var data = $("#addForm").serialize();
							$.ajax({
								type: "post",
								url: "add",
								data: data,
								dataType: 'json',
								success: function (data) {
									if (data.type == "success") {
										$.messager.alert("消息提醒", "添加成功!", "info");
										//关闭窗口
										$("#addDialog").dialog("close");
										//清空原表格数据
										$("#add_username").textbox('setValue', "");
										$("#add_password").textbox('setValue', "");
										//重新刷新页面数据
										$('#dataList').datagrid("reload");

									} else {
										$.messager.alert("消息提醒", data.msg, "warning");
										return;
									}
								}
							});
						}
					}
				}, ],
				onClose: function () {
					$("#add_username").textbox('setValue', "");
					$("#add_password").textbox('setValue', "");
				}
			});

			//编辑用户信息
			$("#editDialog").dialog({
				title: "修改用户信息",
				width: 350,
				height: 200,
				iconCls: "icon-edit",
				modal: true,
				collapsible: false,
				minimizable: false,
				maximizable: false,
				draggable: true,
				closed: true,
				buttons: [{
					text: '提交',
					plain: true,
					iconCls: 'icon-edit',
					handler: function () {
						var validate = $("#editForm").form("validate");
						if (!validate) {
							$.messager.alert("消息提醒", "请检查你输入的数据!", "warning");
							return;
						} else {

							var data = $("#editForm").serialize();

							$.ajax({
								type: "post",
								url: "edit",
								data: data,
								dataType: 'json',
								success: function (data) {
									if (data.type == "success") {
										$.messager.alert("消息提醒", "修改成功!", "info");
										//关闭窗口
										$("#editDialog").dialog("close");

										//重新刷新页面数据
										$('#dataList').datagrid("reload");
										$('#dataList').datagrid("uncheckAll");

									} else {
										$.messager.alert("消息提醒", data.msg, "warning");
										return;
									}
								}
							});
						}
					}
				}, ],
				onBeforeOpen: function () {
					var selectRow = $("#dataList").datagrid("getSelected");
					//设置值
					$("#edit-id").val(selectRow.id);
					$("#edit_username").textbox('setValue', selectRow.username);
					$("#edit_password").textbox('setValue', selectRow.password);
				}
			});

			//搜索按钮
			$("#search-btn").click(function () {
				$('#dataList').datagrid('reload', {
					username: $("#search-username").textbox('getValue')
				});
			});
		});
	</script> -->

<style type="text/css">
/* 模态框居中样式 */
.modal {
	display: table;
	width: 500px;
	height: 100%;
	margin: 0 auto;
}

.modal-dialog {
	display: table-cell;
	vertical-align: middle;
}

/*  控制校验时右侧的图标位置 */
.form-control-feedback {
	right: 16px;
}
</style>
</head>

<body>
	<!-- 数据列表 -->
	<!-- <table id="dataList" cellspacing="0" cellpadding="0"> 
	    
	</table>  -->
	<!-- 工具栏 -->
	<section id="main"> <section class="main_container">
	<section id="projectTitle" class="clear">
	<div class="projectTitle_text l">
		<h2>用户管理</h2>
	</div>
	</section> <section id="projectList">
	<div class="projectList_cons">
		<div class="show">
			<button type="button" class="btn btn-success" data-toggle="modal"
				id="user_add_btn">
				<span class="glyphicon glyphicon-plus"></span> 添加用户
			</button>
			<button type="button" class="btn btn-success" data-toggle="modal"
				data-target="#editUser">
				<span class="glyphicon glyphicon-plus"></span> 修改用户
			</button>
			<button type="button" class="btn btn-success" data-toggle="modal"
				data-target="#deleteUser">
				<span class="glyphicon glyphicon-plus"></span> 删除用户
			</button>
			<div class="sp_search r">
				<input type="text" placeholder="请输入用户名" name="" id="">
				<button>
					<span class="iconfont">&#xe627;</span>
				</button>
			</div>
			<table class="sp_table" id="users_table">
				<thead>
					<tr>
						<th width="49"><input type="checkbox"></th>
						<th width="148">ID</th>
						<th width="167">用户名</th>
						<th width="148">密码</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<div class="sp_footer">
				<div class="row">
					<!-- 分页条信息 -->
					<div class="col-md-6" id="page_nav"></div>

					<!-- 分页文字信息 -->
					<div class="col-md-6" id="page_info"></div>

				</div>
			</div>
		</div>
	</div>
	</section> <!-- 添加用户模态框 -->
	<div class="modal fade" id="addUserModal" tabindex="-1"
		aria-labelledby="addUser1" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">添加用户</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form class="form-horizontal addForm">
						<div class="form-group">
							<label for="username_add_input" class="col-sm-2 control-label">用户名:</label>
							<div class="col-sm-7">
							    <!--  name 与实体类中的名字一致 -->
								<input type="text" class="form-control" id="username_add_input" name="username"
									placeholder="请输入用户名">
							    <span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="password_add_input" class="col-sm-2 control-label">密码:</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" id="password_add_input"  name="password"
									placeholder="请输入密码">
								 <span class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="user_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>

	</section> </section>

	<!-- 添加窗口 -->
	<!-- <div id="addDialog" style="padding: 10px;">  
   		<form id="addForm" method="post">
	    	<table id="addTable" cellpadding="8">
	    		<tr >
	    			<td>用户名:</td>
	    			<td>
	    				<input id="add_username"  class="easyui-textbox" style="width: 200px; height: 30px;" type="text" name="username" data-options="required:true, missingMessage:'请填写用户名'"  />
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>密码:</td>
	    			<td><input id="add_password" style="width: 200px; height: 30px;" class="easyui-textbox" type="password" name="password" data-options="required:true, missingMessage:'请填写密码'"  /></td>
	    		</tr>
	    	</table>
	    </form>
	</div>
	 -->

	<!-- 修改窗口 -->
	<!-- <div id="editDialog" style="padding: 10px">
    	<form id="editForm" method="post">
    		<input type="hidden" name="id" id="edit-id">隐藏域
	    	<table id="editTable" border=0 cellpadding="8" >
	    		<tr >
	    			<td>用户名:</td>
	    			<td>
	    				<input id="edit_username"  class="easyui-textbox" style="width: 200px; height: 30px;" type="text" name="username" data-options="required:true, missingMessage:'请填写用户名'"  />
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>密码:</td>
	    			<td><input id="edit_password" style="width: 200px; height: 30px;" class="easyui-textbox" type="password" name="password" data-options="required:true, missingMessage:'请填写密码'"  /></td>
	    		</tr>
	    	</table>
	    </form>
	</div> -->

	<script type="text/javascript">
	   
	   //全局变量 保存表格中数据的总记录数
	   var totalRecord;
	   var valiFlag;
		$(function() {
			/* 页面加载完成后，直接发送一个ajax请求 获取分页数据  显示数据列表的首页*/
			to_page(1);

			//添加用户表单验证
			/* $('.addForm').bootstrapValidator({
				message : 'This value is not valid',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					username : {
						message : '用户名验证失败',
						validators : {
							notEmpty : {
								message : '用户名不能为空'
							},
							stringLength : {
								min : 2,
								max : 12,
								message : '用户名由2-12位字符组成'
							},
						}
					},
					password : {
						validators : {
							notEmpty : {
								message : '密码不能为空'
							},
							stringLength : {
								min : 6,
								max : 18,
								message : '密码长度必须在6到18位之间'
							},
						}
					}
				}
			}); */
		});

		//页面跳转
		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH}/user/get_list",
				data : "pn=" + pn,
				type : "get",
				success : function(result) {
					/*  console.log(result);  //打印后台返回的数据 */
					//1.解析并显示用户数据
					build_users_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					//3.解析并显示分页条
					build_page_nav(result);
				}
			})
		}

		//1.解析并显示用户数据方法	用户数据表格
		function build_users_table(result) {
			//清除原来的数据
			$("#users_table tbody").empty();
			var users = result.datalist.pageInfo.list;
			$.each(users, function(index, user) {
				var checkbox = $("<td></td>").append(
						$("<input>").attr("type", "checkbox"));
				var userIdTd = $("<td></td>").append(user.id);
				var usernameTd = $("<td></td>").append(user.username);
				var passwordTd = $("<td></td>").append(user.password);

				var editBtn = $("<button></button>").addClass(
						"btn btn-primary btn-sm").append(
						$("<span></span>").addClass(
								"glyphicon glyphicon-pencil")).append("编辑");
				var delBtn = $("<button></button>").addClass(
						"btn btn-primary btn-sm").append(
						$("<span></span>").addClass(
								"glyphicon glyphicon-remove")).append("删除");
				var btnTd = $("<td></td>").append(editBtn).append(delBtn);
				$("<tr></tr>").append(checkbox).append(userIdTd).append(
						usernameTd).append(passwordTd).append(btnTd).appendTo(
						"#users_table tbody");
			})
		}
		//2.解析显示分页信息
		function build_page_info(result) {
			//清除原来的数据
			$("#page_info").empty();
			$("#page_info").append(
					"当前第 " + result.datalist.pageInfo.pageNum + " 页,总共 "
							+ result.datalist.pageInfo.pages + " 页，总共 "
							+ result.datalist.pageInfo.total + " 条记录");
			totalRecord = result.datalist.pageInfo.total; 
		}
		//3.解析并显示分页条
		function build_page_nav(result) {
			//清除原来的数据
			$("#page_nav").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			var firstPageLi = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));
			if (result.datalist.pageInfo.hasPreviousPage == false) {
				//如果为首页就禁用前一页的点击 
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				/* 只有没有禁用的才添加点击事件 */
				//为首页添加点击翻页事件
				firstPageLi.click(function() {
					to_page(1);
				});
				//为前一页添加点击翻页事件
				prePageLi.click(function() {
					to_page(result.datalist.pageInfo.pageNum - 1);
				});

			}

			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append(
					$("<a></a>").append("末页").attr("href", "#"));
			if (result.datalist.pageInfo.hasNextPage == false) {
				//如果为末页添加禁用的样式 
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			} else {
				/* 只有没有禁用的才添加点击事件 */
				//为末页添加点击翻页事件
				lastPageLi.click(function() {
					to_page(result.datalist.pageInfo.pages);
				});
				//为下一页添加点击翻页事件
				nextPageLi.click(function() {
					to_page(result.datalist.pageInfo.pageNum + 1);
				});
			}

			//构造首页和前一页
			ul.append(firstPageLi).append(prePageLi);

			//连续显示的页数  遍历添加连续显示的页码提示
			$.each(result.datalist.pageInfo.navigatepageNums, function(index,
					item) {
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.datalist.pageInfo.pageNum == item) {
					//给选中的添加样式
					numLi.addClass("active");
				}
				//为每一个页码添加点击跳转到对应页码的事件
				numLi.click(function() {
					to_page(item);
				})
				ul.append(numLi);

			});
			//构造前一页和末页
			ul.append(nextPageLi).append(lastPageLi);
			//将ul添加到nav中 
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav");
		}

		//清空表单样式和内容
		function reset_form(ele){
			//重置表单内容
			$(ele)[0].reset(); 
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		
		//点击添加弹出新增模态框  手动打开模态框
		$("#user_add_btn").click(function() {
			//清空表单数据(表单完整重置(表单数据，表单样式))  jquery没有这个方法 所以取dom 对象
			reset_form("#addUserModal .addForm");
			$("#addUserModal").modal({
				backdrop : "static" //设置点击背景空白处模态框不被关闭
			})
		});
		
		//表单校验时的信息提示
		function show_validate_msg(ele,status,msg){
			//清除当前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success" == status){
				$(ele).parent().addClass("has-success");
			    $(ele).next("span").text(msg);
			}else if("error" == status ){
				$(ele).parent().addClass("has-error");
			    $(ele).next("span").text(msg);
			}
		}
		//用户名校验(失去焦点时触发)
		$("#username_add_input").blur(function(){
			//1.获取要校验的数据
			var username = $("#username_add_input").val();
			var regName = /(^[a-zA-Z0-9_-]{5,16}$)|(^[\u2E80-\u9FFF]{2,5})/;  //中文2-5个
		    //用户名校验
			if(!regName.test(username)){
			   valiFlag = false;	
				/* alert("用户名可以是2-5位中文或者6-16位英文和数字，下划线，中划线的组合"); */
			   show_validate_msg("#username_add_input","error","用户名可以是2-5位中文或者5-16位英文和数字，下划线，中划线的组合");
			}else{
				 valiFlag = true;
				 show_validate_msg("#username_add_input","success","");
				 $("#username_add_input").parent().addClass("has-success");
				 $("#username_add_input").next("span").text("");
			};
			 return valiFlag;
		});
		//密码校验(失去焦点时触发)
		$("#password_add_input").blur(function(){
			//密码校验
			var password = $("#password_add_input").val();
			var regPassword = /^[a-zA-Z0-9_-]{5,18}$/;
			if(!regPassword.test(password)){
				 valiFlag = false;
				/* alert("密码为6-18位字母数字下划线中划线的组合"); */
				//清空这个元素之前的样式
				show_validate_msg("#password_add_input","error","密码为5-18位字母数字下划线中划线的组合");
				/*  $("#password_add_input").parent().addClass("has-error");
			   $("#password_add_input").next("span").text("密码为6-18位字母数字下划线中划线的组合"); */
			  
			}else{
				valiFlag = true;
				show_validate_msg("#password_add_input","success","");
				$("#password_add_input").parent().addClass("has-success");
				$("#password_add_input").next("span").text("");
			};
			  return valiFlag;
		});
		/* //检查用户名是否已存在
		$("#username_add_input").change(function(){
			//发送ajax请求校验用户名
		}); */
		
		
		
		//提交新增用户模态框的信息 保存用户信息
		$("#user_save_btn").click(function(){
			//1.将新增用户模态框中的数据提交给服务器进行保存
			  //校验要提交的数据 input输入框失去焦点触发校验
			/* if(!validate_add_form()){
				return false;
			} */
			//校验不通过则不执行ajax请求
			if(!valiFlag){
				return false;
			}
			//2.发送ajax请求保存用户  
			//序列表格内容为字符串
			//alert($("#addUserModal form").serialize());
			$.ajax({
				url:"${APP_PATH}/user/add",
				type:"POST",
				data:$("#addUserModal form").serialize(),  //提交序列化表格内容为字符串后的数据
			    success:function(result){
			    	if(result.code == 100){
			    		//用户数据保存成功
				    	//alert(result.msg);
				    	//1.关闭添加数据模态框
				    	$("#addUserModal").modal('hide');
				    	//2.跳转到用户数据表格的最后一页 显示刚添加的数据
				    	  // 发送ajax请求显示最后一页的数据  此分页插件会把大于总页码的数据看作最后一页的数据   则可以传一个大于总页码的数据
				    	  to_page(totalRecord);
			    	}else if(result.code == 200){
			    		if(result.datalist.user_msg != null){
			    			//用户名不合法
				    		show_validate_msg("#username_add_input","error",result.datalist.user_msg);
			    		}
			    		else if(result.datalist.pass_msg != null){
			    			//密码不合法
			    			show_validate_msg("#password_add_input","error",result.datalist.pass_msg);
			    		}
			    	}
			    }
			}) 
			
		})
	</script>
</body>

</html>