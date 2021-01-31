<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<title>用户登录界面</title>
<style>
body{font-size:14px}

.header,.footer{ position:absolute; left:0; right:0; width:100%; z-index:99}
.header{top:0; height:60px; background:#426374; padding: 0;}

.loginWraper{
 position:absolute;width:100%; left:0; top:0; bottom:0; right:0; z-index:1; background: url(../images/snap_1537698639290.png) no-repeat center}
.loginBox{ position:absolute; width:617px; height:330px; background:url(images/timg.jpg) no-repeat; left:50%; top:50%; margin-left:-309px; margin-top:-184px; padding-top:38px}
@media (max-width:617px) {
	.loginbox{ width:100%; position:static; margin-top:0; margin-left:0;}
}
.loginBox .row{margin-top:20px;}
.loginBox .row .form-label .Hui-iconfont{ font-size:24px}
.loginBox .input-text{ width:360px}
@media (max-width:617px) {
	.loginBox .input-text{ width:80%}
}
	.yzm a{ color:#426374; font-size:12px}

#span_msg{ font-size:14px; color:Red; line-height:40px; height:40px; margin-left:10px; width:160px;; float:left}

.hd_msg{font-size:12px; color:#fff; height:30px; z-index:100;position: absolute; padding-left:50px; padding-top:5px}
.hd_msg a{ color:#fff}
.hd_msg a:hover{ color:#fff; text-decoration:underline}
.radio-box{display:inline-block;box-sizing:border-box;cursor:pointer;position:relative;padding-left:30px;padding-right:20px}
.footer{ height:46px; line-height:46px; bottom:0; text-align:center; color:#fff; font-size:12px; background-color:#426374}

</style>
<script type="text/javascript" src="../js/jquery.min.js"></script> <!-- 修改路径 添加    ../ -->
<script type="text/javascript" src="../js/H-ui.js"></script> <!-- 修改路径 添加    ../ -->
<script type="text/javascript" src="../js/jquery.icheck.min.js"></script> <!-- 修改路径 添加    ../ -->

<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>  <!-- 修改路径 添加    ../ -->

<script type="text/javascript">
	$(function(){
		
		//登录
		$("#submitBtn").click(function(){
			var data = $("#form").serialize();
			$.ajax({
				type: "post",
				url: "login",//LoginServlet?method=Login
				data: data, 
				dataType: "json", //返回数据类型text
				success: function(data){
					if("success" == data.type){
						window.parent.location.href = "index";
					} else{
						alert( data.msg );
						//$.messager.alert("消息提醒", data.msg, "warning");
					} 
					
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

<div class="header" style="padding: 0;">
	<h2 style="color: white; width: 400px; height: 60px; line-height: 60px; margin: 0 0 0 30px; padding: 0;">学生信息管理系统</h2>
</div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <form id="form" class="form form-horizontal" method="post">
      <div class="row cl">
        <!--  <label class="form-label col-3"><i class="Hui-iconfont">&#xe60d;</i></label>-->
        <div class="formControls col-8">
          <input id="username" name="username" type="text" placeholder="账户" class="input-text size-L"> <!-- value = "admin" 让他默认用户为admin -->
        </div>
      </div>
      <div class="row cl">
          <!-- <label class="form-label col-3"><i class="Hui-iconfont">&#xe60e;</i></label>-->
        <div class="formControls col-8">
          <input id="password" name="password" type="password" placeholder="密码" class="input-text size-L"> <!-- value = "admin" 让他默认密码为admin -->
        </div>
      </div>
      <div>
		<div class="radio-box">
			<input type="radio" id="radio-2" name="type" checked value="2" /><!--添加了 checked 默认选中学生 -->
			<label for="radio-1">学生</label>
		</div>
		<div class="radio-box">
			<input type="radio" id="radio-3" name="type" value="3" />
			<label for="radio-2">老师</label>
		</div>
        <div class="radio-box">
			<input type="radio" id="radio-1" name="type" value="1" />
			<label for="radio-3">管理员</label>
       </div>
	</div>
      
      <div class="row">
        <div class="formControls col-8 col-offset-3">
          <input id="submitBtn" type="button" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>

</body>
</html>