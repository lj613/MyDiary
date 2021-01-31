<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 对应userController2 -->
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
<script type="text/javascript">
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
						}, < !--sortable: true 用来排序-- > {
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
	</script>

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
				data-target="#addUser">
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
			<table class="sp_table">
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
					<c:forEach items="${userList}" var="user">
						<tr>
							<td><input type="checkbox" name="" id=""></td>
							<td>${user.id}</td>
							<td>${user.username}</td>
							<td>${user.password}</td>
							<td>
								<button class="btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-pencil"></span>编辑
								</button>
								<button class="btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-remove"></span>删除
								</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="sp_footer">
				<div class="row">

					<!-- 分页条信息 -->
					<div class="col-md-6">
						<nav aria-label="Page navigation">
						<ul class="pagination">
							<li><a href="${APP_PATH}/user/list?pn=1">首页</a></li>
							<!--   有上一页时才显示上一页的图标 -->
							<c:if test="${pageInfo.hasPreviousPage}">
								<li><a
									href="${APP_PATH}/user/list?pn=${pageInfo.pageNum-1}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>


							<!-- 连续显示的页码 -->
							<c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
								<c:if test="${page_Num == pageInfo.pageNum}">
									<li class="active"><a href="#">${page_Num}</a></li>
								</c:if>
								<c:if test="${page_Num != pageInfo.pageNum}">
									<li><a href="../user/list?pn=${page_Num}">${page_Num}</a></li>
								</c:if>

							</c:forEach>
							<!-- <li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li> -->
							<c:if test="${pageInfo.hasNextPage}">
								<li><a href="${APP_PATH}/user/list?pn=${pageInfo.pageNum+1}" aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>

							<li><a href="${APP_PATH}/user/list?pn=${pageInfo.pages}">末页</a></li>
						</ul>
						</nav>
					</div>


					<!-- 分页文字信息 -->
					<div class="col-md-6">当前${pageInfo.pageNum}页,
						总共${pageInfo.pages}页, 总共${pageInfo.total}条记录</div>



				</div>
				<!-- <button class="sp_remove">批量删除</button>
				<button class="sp_download">批量ye下载</button>
				<div class="sp_page r">
					<a href="#">共12条</a> <a href="#">首页</a> <a href="#">上一页</a> <a
						href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a>
					<a href="#">下一页</a> <a href="#">尾页</a>
				</div> -->
			</div>
		</div>
	</div>
	</section> <!-- 添加用户模态框 -->
	<div class="modal fade" id="addUser" tabindex="-1"
		aria-labelledby="addUser1" aria-hidden="true">
		<form class="modal-dialog addForm">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addUser1">添加用户</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group row">
						<label for="username" class="col-sm-2 col-form-label">用户名:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="add_username"
								name="add_username" value="" placeholder="请输入用户名">
						</div>
					</div>
					<div class="form-group row">
						<label for="password" class="col-sm-2 col-form-label">密码:</label>
						<div class="col-sm-7">
							<input type="password" class="form-control" id="add_password"
								name="add_password" placeholder="请输入密码">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary ">添加</button>
				</div>
			</div>
		</form>
	</div>

	</section> </section>


	<!-- <div id="toolbar">
		<div style="float: left;"><a id="add" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a></div>
			<div style="float: left;" class="datagrid-btn-separator"></div>
		<div style="float: left;"><a id="edit" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a></div>
			<div style="float: left;" class="datagrid-btn-separator"></div>
		<div>
			<a id="delete" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-some-delete',plain:true">删除</a>
			用户名：<input id="search-username" class="easyui-textbox" />
			<a id="search-btn" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
		</div>
	</div> -->

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

	<script>
		$(function () {
			//添加用户表单验证
			$('.addForm').bootstrapValidator({
				message: 'This value is not valid',
				feedbackIcons: {
					valid: 'glyphicon glyphicon-ok',
					invalid: 'glyphicon glyphicon-remove',
					validating: 'glyphicon glyphicon-refresh'
				},
				fields: {
					add_username: {
						message: '用户名验证失败',
						validators: {
							notEmpty: {
								message: '用户名不能为空'
							},
							stringLength: {
								min: 2,
								max: 12,
								message: '用户名由2-12位字符组成'
							},
						}
					},
					add_password: {
						validators: {
							notEmpty: {
								message: '密码不能为空'
							},
							stringLength: {
								min: 6,
								max: 18,
								message: '密码长度必须在6到18位之间'
							},
						}
					}
				}
			});
		});
	</script>
</body>

</html>