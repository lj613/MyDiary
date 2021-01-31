<!-- 成功1 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta charset="utf-8">
	<title>登录|学生信息管理系统</title>
	<meta name="keywords" content="学生信息管理系统">

	<style>
		body {
			margin: 0;
			padding: 0;
			font-family: sans-serif;
			background: url("../images/login_bg.jpg");
			background-size: cover;
			background-color: red;
		}

		.box {
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			width: 400px;
			padding: 40px;
			background: rgba(0, 0, 0, .8);
			box-sizing: border-box;
			box-shadow: 0 15px 25px rgba(0, 0, 0, .5);
			border-radius: 10px;
			/*登录窗口边角圆滑*/
		}

		.box h2 {
			margin: 0 0 30px;
			padding: 0;
			color: #fff;
			text-align: center;
		}

		.box .inputBox {
			position: relative;
		}

		.box .inputBox input {
			width: 100%;
			padding: 10px 0;
			font-side: 16px;
			color: #fff;
			letter-spacing: 1px;
			margin-bottom: 30px;
			/*输入框设置*/
			border: none;
			border-bottom: 1px solid #fff;
			outline: none;
			background: transparent;
		}

		.box .inputBox label {
			position: absolute;
			top: 0;
			left: 0;
			padding: 10px 0;
			font-size: 16px;
			color: #fff;
			pointer-events: none;
			transition: .5s;
		}

		.box .inputBox input:focus~label,
		.box .inputBox input:valid~label {
			top: -18px;
			left: 0;
			color: #03a9f4;
			font-size: 12px;
		}

		.box input[type="button"] {
			background: transparent;
			border: none;
			outline: none;
			color: #fff;
			background: #03a9f4;
			padding: 10px 20px;
			cursor: pointer;
			border-radius: 5px;
		}

		#loginBtn {
			margin-right: 150px;
		}
		.radio-wrap{
            display: flex;
			margin-bottom: 20px;

		}
		.radio-box{
			/* flex: 1; */
			padding-right: 60px;
			/* margin-right: 30px; */
			color: white;
		}
        .cpacha{
			display: flex;
		}
	</style>

	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport"
		content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="shortcut icon" href="favicon.ico" />
	<link rel="bookmark" href="favicon.ico" />

	<link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css"><!-- 修改路径 -->
	<link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css"><!-- 修改路径 添加    ../ -->


	<script type="text/javascript" src="../js/jquery.min.js"></script> <!-- 修改路径 添加    ../ -->
	<script type="text/javascript" src="../js/H-ui.js"></script> <!-- 修改路径 添加    ../ -->
	<script type="text/javascript" src="../js/jquery.icheck.min.js"></script> <!-- 修改路径 添加    ../ -->

	<script type="text/javascript" src="../js/jquery.easyui.min.js"></script> <!-- 修改路径 添加    ../ -->

	<script type="text/javascript">
		$(function () {
			//点击图片切换验证码
			$("#vcodeImg").click(function () {
				this.src = "get_cpacha?vl=4&w=160&h=40&t=" + new Date().getTime(); //修改
			});

			//登录
			$("#loginBtn").click(function () {
				
				/* if ($("#radio-2").attr("checked") && "${systemInfo.forbidStudent}" == 1) {
					$.messager.alert("消息提醒", "学生暂不能登录系统！", "warning");
					return;
				}
				if ($("#radio-3").attr("checked") && "${systemInfo.forbidTeacher}" == 1) {
					$.messager.alert("消息提醒", "教师暂不能登录系统！", "warning");
					return;
				}
				 */

				var data = $("#form").serialize();
				$.ajax({
					type: "post",
					url: "login", //LoginServlet?method=Login
					data: data,
					dataType: "json", //返回数据类型text
					success: function (data) {
						if ("success" == data.type) {
							window.parent.location.href = "index";
						} else {
							$.messager.alert("消息提醒", data.msg, "warning");
							$("#vcodeImg").click(); //切换验证码
							$("input[name='vcode']").val(""); //清空验证码输入框
						} 
						
						/* if ("vcodeError" == data) {
							$.messager.alert("消息提醒", "验证码错误!", "warning");
							$("#vcodeImg").click(); //切换验证码
							$("input[name='vcode']").val(""); //清空验证码输入框
						} else if ("loginError" == msg) {
							$.messager.alert("消息提醒", "用户名或密码错误!", "warning");
							$("#vcodeImg").click(); //切换验证码
							$("input[name='vcode']").val(""); //清空验证码输入框
						} else if ("admin" == msg) {
							window.location.href = "SystemServlet?method=toAdminView";
						} else if ("student" == msg) {
							window.location.href = "SystemServlet?method=toStudentView";
						} else if ("teacher" == msg) {
							window.location.href = "SystemServlet?method=toTeacherView";
						} */
						
					}

				});
			});

			//设置复选框
			$(".skin-minimal input").iCheck({
				radioClass: 'iradio-blue',
				increaseArea: '25%'
			});
		})
	</script>

</head>

<body>
	<div class="box">
		<h2>航空选座系统登录</h2>
		<form>
			<div class="inputBox">
				<input type="text" name="" required="">
				<label>用户名</label>
			</div>
			<div class="inputBox">
				<input type="password" name="" required="">
				<label>密码</label>
			</div>
			<div class="row cl">
				<div class="formControls col-8 col-offset-3 cpacha">
				  <input class="input-text size-L" name="vcode" type="text" placeholder="请输入验证码" style="width: 200px;">
				  <img title="点击图片切换验证码" id="vcodeImg" src="get_cpacha?vl=4&w=160&h=40"></div><!-- 修改 vl=5表示有5个字母-->
			  </div>
			<div class="radio-wrap">
				<div class="radio-box">
					<input type="radio" id="radio-1" name="type" checked value="1" />
					<!--添加了 checked 默认选中学生 -->
					<label for="radio-1">用户</label>
				</div>
				<div class="radio-box">
					<input type="radio" id="radio-2" name="type" value="2" />
					<label for="radio-2">管理员</label>
				</div>
			</div>
			<input id="loginBtn" type="button" name="" value="登录">
			<input id="rigisterBtn" type="button" name="" value="注册">
		</form>
	</div>
</body>

</html>