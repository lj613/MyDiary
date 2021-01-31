<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript"
	src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
<title>无标题页</title>
<style type="text/css">
</style>
</head>
<body>
	<form id="homeheader" runat="server">
		<div>
			<span
				style="padding-left: 10px; font-family: 华文行楷; font-size: x-large; color: Blue">日记本系统</span>
			<span style="float: right; padding-right: 20px;" class="head">
				<span style="color: red; font-size: large;">${user.username}&nbsp;</span>您好
				<!-- &nbsp;&nbsp;&nbsp;<a href="login_out" id="loginOut">安全退出</a> -->
				&nbsp;&nbsp;&nbsp;<a href="#" id="loginOut" onclick="logout()">安全退出</a>
			</span>
		</div>
	</form>
	
	<script >
	function logout(){  
	    parent.window.location = "<%=request.getContextPath()%>/system/login_out";  
	} 
    </script>
</body>
</html>
