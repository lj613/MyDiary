<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- <script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script> -->
<title>侧边栏</title>
<!--  <style type="text/css">
        #tree a:link{text-decoration:none;}
    </style> -->
<link href="../static/css/bootstrap.min.css" rel="stylesheet">
	<script src="../static/js/jquery-3.4.1.min.js"></script>
	<script src="../static/js/bootstrap.min.js"></script>
	<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

html, body {
	font-family: Arial;
	height: 100%;
	background-color: rgba(66, 65, 71, 0.3);
	/* 取消y轴的滚动条 */
	/* overflow: hidden; */
}

a, a:hover, a:focus {
	color: #ffffff;
	text-decoration: none;
}

#menu {
	width: 260px;
	background-color: rgba(66, 65, 71, 0.3);
	height: calc(100% - 85px);
}

#menu .panel {
	color: #fff;
	background-color: rgba(66, 65, 71, 0);
}

#menu .panel-group {
	width: 260px;
	height: 600px;
	overflow-y: auto;
}

#menu .panel-group .panel {
	border: none;
}

#menu .panel-heading {
	border-top-left-radius: 0px;
	border-top-right-radius: 0px;
}

#menu .panel-default>.panel-heading {
	color: #fff;
	border: none;
	background-color: rgba(66, 65, 71, 0);
}

#menu .panel-default>.panel-heading>span {
	font-size: 10px;
}

#menu .panel-default>.panel-heading:active, #menu .panel-default>.panel-heading:hover
	{
	color: greenyellow;
}

#menu .panel-default>.panel-heading:hover a {
	color: greenyellow;
}

#menu .panel-default>.panel-heading>a:hover {
	text-decoration: none;
	color: greenyellow;
}

#menu .panel-group .panel-heading+.panel-collapse>.panel-body {
	border: none;
}

#menu .panel-body {
	padding: 0px;
}

.nav>li {
	padding: 1px 0px 0px 0px;
}

.nav>li>a {
	text-decoration: none;
	padding: 10px 10px 10px 35px;
}

.nav>li>a:hover, .nav>li>a:focus {
	background-color: rgba(66, 65, 71, .5);
	color: greenyellow;
}
</style>
</head>
<body>
	<div id="menu">
		<div class="panel-group" id="panelContainer">
		    <div class="panel panel-default">
				<div id="header1" class="panel-heading" data-toggle="collapse"
					data-target="#sub0" data-parent="#panelContainer">
					<i class="glyphicon glyphicon-list-alt"></i> <a href="#">后台首页</a> 
					<!-- <span
						class="glyphicon glyphicon-triangle-right pull-right"></span> -->
				</div>
			</div>
			
			<c:if test="${userType == 1 }">
			<div class="panel panel-default">
				<div id="header1" class="panel-heading" data-toggle="collapse"
					data-target="#sub1" data-parent="#panelContainer">
					<i class="glyphicon glyphicon-list-alt"></i> <a href="#">管理员中心</a> <span
						class="glyphicon glyphicon-triangle-right pull-right"></span>
				</div>
				<div id="sub1" class="collapse panel-collapse">
					<div class="panel-body">
						<ul class="nav">
							<li><a href="../admin/list" target="body"><span></span>管理员列表</a></li>
						</ul>
					</div>
				</div>
			</div>
			</c:if>
			
			<div class="panel panel-default">
				<div id="header2" class="panel-heading" data-toggle="collapse"
					data-target="#sub2" data-parent="#panelContainer">
					<i class="glyphicon glyphicon-leaf"></i> <a href="#">用户中心</a> <span
						class="glyphicon glyphicon-triangle-right pull-right"></span>
				</div>
				<div id="sub2" class="collapse panel-collapse">
					<div class="panel-body">
						<ul class="nav">
							<li><a href="../user/list" target="body">用户列表</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div id="header3" class="panel-heading" data-toggle="collapse"
					data-target="#sub3" data-parent="#panelContainer">
					<i class="glyphicon glyphicon-list-alt"></i> <a href="#">栏目菜单 3</a>
					<span class="glyphicon glyphicon-triangle-right pull-right"></span>
				</div>
				<div id="sub3" class="collapse panel-collapse">
					<div class="panel-body">
						<ul class="nav">
							<li><a href="#"><span></span>添加栏目3</a></li>
							<li><a href="#">添加栏目2</a></li>
							<li><a href="#">添加栏目3</a></li>
							<li><a href="#">添加栏目4</a></li>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div id="header2" class="panel-heading" data-toggle="collapse"
					data-target="#sub4" data-parent="#panelContainer">
					<i class="glyphicon glyphicon-leaf"></i> <a href="#">系统管理</a> <span
						class="glyphicon glyphicon-triangle-right pull-right"></span>
				</div>
				<div id="sub4" class="collapse panel-collapse">
					<div class="panel-body">
						<ul class="nav">
							<li><a href="#" onclick="logout()">退出登陆</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	
		$(function() {
			$(".panel-heading")
					.on(
							"click",
							function(e) {
								var idLength = e.currentTarget.id.length;
								var index = e.currentTarget.id.substr(
										idLength - 1, idLength);
								$("#sub" + index)
										.on(
												'hidden.bs.collapse',
												function() {
													$(e.currentTarget)
															.find("span")
															.removeClass(
																	"glyphicon glyphicon-triangle-bottom");
													$(e.currentTarget)
															.find("span")
															.addClass(
																	"glyphicon glyphicon-triangle-right");
												})
								$("#sub" + index)
										.on(
												'shown.bs.collapse',
												function() {
													$(e.currentTarget)
															.find("span")
															.removeClass(
																	"glyphicon glyphicon-triangle-right");
													$(e.currentTarget)
															.find("span")
															.addClass(
																	"glyphicon glyphicon-triangle-bottom");
												})
							})

			/* $(".panel-body > .nav > li > a").on("click", function(e) {
				alert(e.currentTarget.textContent);
			}); */
		});
		
		function logout(){  
		    parent.window.location = "<%=request.getContextPath()%>/system/login_out";  
		} 
	</script>

	<%--  <form id="homeleft" runat="server" >
    
    <div id="tree">
        <button type="button">系统导航</button> 
        <ul class="menu">
            <c:if test="${userType == 1|| userType == 2}"> 
            <li><a href="#">用户中心</a>
                <ul>
                    <li><a href="../user/list" target="body">用户列表</a></li>
                </ul>	<div class="panel panel-default">
				<div id="header1" class="panel-heading" data-toggle="collapse" data-target="#sub1" data-parent="#panelContainer">
					<i class="glyphicon glyphicon-list-alt"></i>
					<a href="#">栏目菜单 1</a>
					<span class="glyphicon glyphicon-triangle-right pull-right"></span>
				</div>
				<div id="sub1" class="collapse panel-collapse">
					<div class="panel-body">
						<ul class="nav">
							<li>
								<a href="#"><span></span>添加栏目1</a>
							</li>
							<li>
								<a href="#">添加栏目2</a>
							</li>
							<li>
								<a href="#">添加栏目3</a>
							</li>
							<li>
								<a href="#">添加栏目4</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
            </li>
             </c:if>
            <c:if test="${userType == 1 || userType == 2}"> 
             <li><a href="#">我的日记本</a>
                <ul>
                    <li><a href="../teacher/list" target="body">记录日记</a></li>
                     <li><a href="../teacher/list" target="body">我的日记</a></li>
                      <li><a href="../teacher/list" target="body">所有日记</a></li>
                </ul>
            </li>
            </c:if>
            <li><a href="#">我的资料</a>
                <ul>
                    <li><a href="../student/list" target="body">我的头像</a></li>
                    <li><a href="../student/list" target="body">个人资料</a></li>
                </ul>
            </li>
            <c:if test="${userType == 1 || userType == 3}"> 
            <li><a href="#">安全设置</a>
                <ul>
                    <li><a href="../clazz/list" target="body">密码修改</a></li>
                </ul>
            </li>
            </c:if>
             <c:if test="${userType == 1 || userType == 3}"> 
            <li><a href="#">安全退出</a>
                <ul>
                    <li><a href="../course/list" target="body">课程列表</a></li>
                </ul>
            </li>
            </c:if>
            <c:if test="${userType == 1}">
            <li><a href="#">管理员管理</a>
                <ul>
                <li><a href="../user/list" target="body">管理员列表</a></li>
                </ul>
            </li>
            </c:if>
        </ul>
        </div>
    </form>
    <script type="text/javascript">
    $(document).ready(function(){
        $(".menu ul").css("display","none");    //文件准备好后，ul的样式为隐藏
        $(".menu a").on("click",function(){       //点击a的时候就执行以下函数
            $(this).next().toggle();                      //toggle提供为隐藏和显示相互转换的方法    意思是点击的这个 元素的下一个元素是显示的话就隐藏，是隐藏的话就显示
        })
    })
    </script> --%>
</body>
</html>
