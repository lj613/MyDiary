<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>    
<title>日记本系统</title>
<style type="text/css">
html {
    background: url(../images/snap_1537698639290.png);
}
</style>
</head>
    <frameset rows="30,*,20" >
          <frame name="topFrame"  src="../system/top"  scrolling="no"  />
          <!--  <frameset  id="body"> -->
          <frameset  id="body" cols="250,*"  >
               <frame name="leftFrame" id ="leftFrame" src="../system/left" scrolling="no" />
               <frame name="body" id="body"  src="../system/welcome"  scrolling="yes"/>
               
              <!--   <frame name="rightFrame" src="rightFrame.html"/>  src="mainFrame.html"-->
          </frameset>
       <!--    <frame name="bottomFrame"  src="bottomFrame.html" scrolling="yes"/> -->
     </frameset>
     <noframes>
<body background="tupian/homeright.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%; 
background-attachment: fixed;">
        该浏览器不支持框架集！
</body>
      </noframes>



</html>