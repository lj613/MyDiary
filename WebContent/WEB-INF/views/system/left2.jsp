<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>    
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
    <title>无标题页</title>
    <style type="text/css">
        #tree a:link{text-decoration:none;}
    </style>
</head>
<body>
    <form id="homeleft" runat="server" >
    
    <div id="tree">
        <button type="button">系统导航</button> 
        <ul class="menu">
         <%--    <c:if test="${userType == 1|| userType == 2}">  --%>
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
           <%--   </c:if> --%>
           <%--  <c:if test="${userType == 1 || userType == 2}">  --%>
             <li><a href="#">我的日记本</a>
                <ul>
                    <li><a href="../teacher/list" target="body">记录日记</a></li>
                     <li><a href="../teacher/list" target="body">我的日记</a></li>
                      <li><a href="../teacher/list" target="body">所有日记</a></li>
                </ul>
            </li>
           <%--  </c:if> --%>
            <li><a href="#">我的资料</a>
                <ul>
                    <li><a href="../student/list" target="body">我的头像</a></li>
                    <li><a href="../student/list" target="body">个人资料</a></li>
                </ul>
            </li>
       <%--      <c:if test="${userType == 1 || userType == 3}">  --%>
            <li><a href="#">安全设置</a>
                <ul>
                    <li><a href="../clazz/list" target="body">密码修改</a></li>
                </ul>
            </li>
       <%--      </c:if> --%>
           <%--   <c:if test="${userType == 1 || userType == 3}">  --%>
            <li><a href="#">安全退出</a>
                <ul>
                    <li><a href="../course/list" target="body">课程列表</a></li>
                </ul>
            </li>
           <%--  </c:if> --%>
           <%--  <c:if test="${userType == 1}"> --%>
            <li><a href="#">管理员管理</a>
                <ul>
                <li><a href="../user/list" target="body">管理员列表</a></li>
                </ul>
            </li>
           <%--  </c:if> --%>
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
    </script>
</body>
</html>
