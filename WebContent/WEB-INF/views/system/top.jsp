<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="../static/iconfont/iconfont.css">
<script type="text/javascript"
	src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
<title>无标题页</title>
<style type="text/css">
   img{
        width: 40px;
        height: 40px;
        border-radius: 50%;
        overflow: hidden;
      }
      a{
         text-decoration:none
      }
      .top{
         line-height:50px;
      }
      .left{
         padding-left: 10px; 
         font-family: 华文行楷; 
         font-size: x-large; 
         color: Blue;
      }
      .right{
          float: right; 
          padding-right: 20px;
          line-height:50px;
      }
      .info{
           float: right; 
           margin-left:5px;
           line-height:50px;
      }
</style>
</head>
<body>
	<form id="homeheader" runat="server">
		<div class="top">
			<span class="left" >日记本系统</span>
			<div  class="right">
			    <c:if test="${userType == 2}">
			         <img src="${user.photo}" alt="头像" ></img>
			   	</c:if>
			   	<c:if test="${userType == 1}">
			   	    <span class="iconfont icon-user"></span>
			   	</c:if>
			   	<div class="info">
			   	    <span class="" style="color: red; font-size: large;">${user.username}&nbsp;</span>您好
				<!-- &nbsp;&nbsp;&nbsp;<a href="login_out" id="loginOut">安全退出</a> -->
				&nbsp;&nbsp;&nbsp;<span class="iconfont icon-login-out"></span><a href="#" id="loginOut" onclick="logout()">安全退出</a>
			   	</div>
				
			</div>
		</div>
	</form>

	<script>
		function logout(){  
		    parent.window.location = "<%=request.getContextPath()%>/system/login_out";
		}
	</script>
</body>
</html>
