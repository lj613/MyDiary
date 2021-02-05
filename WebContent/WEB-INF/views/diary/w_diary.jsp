<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>写日记</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<!-- <link rel="stylesheet" type="text/css"
	href="../static/css/user/user_list.css"> -->
<link href="../static/css/bootstrap.min.css" rel="stylesheet">
<link href="../static/css/bootstrapValidator.min.css" rel="stylesheet" />
<script src="../static/js/jquery-3.4.1.min.js"></script>
<script src="../static/js/bootstrap.min.js"></script>
<script src="../static/js/bootstrapValidator.min.js"></script>

<link rel="stylesheet" type="text/css" href="../static/css/easyui.css">
<link rel="stylesheet" type="text/css" href="../static/css/icon.css">
<link rel="stylesheet" type="text/css" href="../static/css/demo.css">

<script type="text/javascript" src="../static/ueditor/ueditor.config.js"></script>
<script type="text/javascript"
	src="../static/ueditor/ueditor.all.min.js"></script>

<!-- 手动加载语言，避免在IE下有时因为加载语言导致编辑器加载失败    在这里加载的语言会覆盖配置项目里添加的语言类型 -->
<script type="text/javascript"
	src="../static/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="../static/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../static/js/validateExtends.js"></script>

<style>
.main {
	margin: 20px;
	width: 100%;
	height: 100%
}

.diaryTitle {
	padding: 10px 20px;
	height: 54px;
	background-color: #f1f9fc;
	border-top: 1px solid #e0eaef;
	border-bottom: 1px solid #dbe7ed;
}

.diaryTitle h2 {
	font-size: 24px;
	line-height: 25px;
}

.diary_container {
   background-color: #f1f9fc;
	margin-top: 20px;
	/* border: 1px solid red; */
	padding:20px 30px;
	width: 100%;
	height: 100%;
}


.save_container{
  margin-top:20px;
}
</style>
</head>
<body>
	<div class="main">
		<!-- 标题部分 -->
		<div class="diaryTitle">
			<h2>写日记</h2>
		</div>

		<!-- 内容部分 -->
		<div class="diary_container">
			<form class="form-horizontal" id="add_diary_form">
			     <!--   隐藏表单（提交日记内容）  -->
			    <input name="diaryContent" type="hidden" id="diaryContent">
				<div class="form-group">
					<label for="title" class="col-md-1 control-label" style="min-width:90px">日记标题：</label>
					<div class="col-md-5">
						<input type="text" class="form-control" id="title" name="title"
							placeholder="请输入日记标题" autoComplete="off"> <span
							class="help-block"></span>
					</div>
				</div>

				<div class="form-group">
					<label for="diaryTypeId" class="col-md-1 control-label" style="min-width:90px">日记类别：</label>
					<div class="col-md-5">
						<select class="form-control" name="diaryTypeId" id="diaryType">
							<option>工作</option>
							<option>学习</option>
							<option>生活</option>
							<option>人生感叹</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-1 control-label" style="min-width:90px">日记内容：</label>
					<div class="col-md-10">
						<script type="text/plain" id="editor"
							style="width:100%;height:400px;"></script>
					</div>
				</div>
				
			</form>
			<div class="save_container">
				   <button class="btn btn-success" id="diary_save_btn">保存日记</button>
				</div>
		</div>

	</div>

	<script type="text/javascript" charset="gb2312">
		//  实例化编辑器 
		var ue = UE.getEditor("editor");
		var valiFlag = true;
		//表单校验时的信息提示
		function show_validate_msg(ele, status, msg) {
			//清除当前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if ("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		
		$("#title").blur(function(){
			var title = $("#title").val();
			if(title == null || title == ''){
				valiFlag = false;
				show_validate_msg("#title","error","日记标题不能为空");
			}else{
				valiFlag = true;
				show_validate_msg("#title",
						"success", "");
				$("#title").parent().addClass(
						"has-success");
				$("#title").next("span").text("");
			}
			return valiFlag;
		})
		
		
		//提交新增用户模态框的信息 保存用户信息
		$("#diary_save_btn").click(
				function() {
					alert("点击了保存日记按钮");
					var diaryType = $("#diaryType option:selected").val();
					alert(diaryType);
					var title = $("#title").val();
					if(title == null || title == ""){
						valiFlag = false;
						alert('日记标题不能为空');
						return false;
					}else if(!diaryType){
						valiFlag = false;
						show_validate_msg("#diaryType","error","日记类型不能为空");
						return false;
					}else if (!UE.getEditor('editor').hasContents()){
						valiFlag = false;
						alert('请先填写日记内容!');
						return false;
					}else{
						valiFlag = true;
					}
					if(!valiFlag){
						alert("校验不通过")
					    return false;
				    } 
					var diaryContent = UE.getEditor('editor').getContent();
					$("#diaryContent").val(diaryContent);

					//1.将新增用户模态框中的数据提交给服务器进行保存
					//校验要提交的数据 input输入框失去焦点触发校验
					/* if(!validate_add_form()){
						return false;
					} */
					//校验不通过则不执行ajax请求
					/* if (!valiFlag) {
						show_validate_msg("#username_add_input",
								"error", "用户名不能为空");
						return false;
					} */
					//2.发送ajax请求保存用户  
					//序列表格内容为字符串
					alert($("#add_diary_form").serialize());
					 $.ajax({
						 url : "${APP_PATH}/diary/add",
						 type : "POST",
						 data : $("#addUserModal .addForm").serialize(),
						 success:function(result){
							 
						 }
					 })
					/* $.ajax({
						url : "${APP_PATH}/user/add",
						type : "POST",
						data : $("#addUserModal .addForm").serialize(), //提交序列化表格内容为字符串后的数据
						success : function(result) {
							if (result.code == 100) {
								//用户数据保存成功
								//alert(result.msg);
								//1.关闭添加数据模态框
								$("#addUserModal").modal('hide');
								//2.跳转到用户数据表格的最后一页 显示刚添加的数据
								// 发送ajax请求显示最后一页的数据  此分页插件会把大于总页码的数据看作最后一页的数据   则可以传一个大于总页码的数据
								to_page(totalRecord);
							} else if (result.code == 200) {
								if (result.datalist.user_msg != null) {
									//用户名不合法
									show_validate_msg("#username_add_input",
											"error", result.datalist.user_msg);
								} else if (result.datalist.pass_msg != null) {
									//密码不合法
									show_validate_msg("#password_add_input",
											"error", result.datalist.pass_msg);
								}
							}
						}
					}); */

				});
	</script>
</body>
</html>