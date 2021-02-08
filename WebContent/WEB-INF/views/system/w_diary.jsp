<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/jsp_diary/style/diary.css" rel="stylesheet">
<link href="/jsp_diary/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="/jsp_diary/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script src="/jsp_diary/bootstrap/js/jQuery.js"></script>
<script src="/jsp_diary/bootstrap/js/bootstrap.js"></script>
<script src="/jsp_diary/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	function checkForm(){
		var title=document.getElementById("title").value;
		var content=CKEDITOR.instances.content.getData();
		var typeId=document.getElementById("typeId").value;
		if(title==null||title==""){
			document.getElementById("error").innerHTML="标题不能为空！";
			return false;
		}
		if(content==null||content==""){
			document.getElementById("error").innerHTML="内容不能为空！";
			return false;
		}
		if(typeId==null||typeId==""){
			document.getElementById("error").innerHTML="请选择日志类别！";
			return false;
		}
		return true;
	}
</script>
<style type="text/css"> 
.data_list{
	border: 1px solid #E5E5E5;
	padding: 10px;
	background-color: #FDFDFD;
	margin-top: 15px;
}

.data_list .data_list_title{
	font-size: 15px;
	font-weight: bold;
	border-bottom: 1px solid #E5E5E5;
	padding-bottom: 10px;
	padding-top: 5px;
}

.data_list .data_list_title img{
	vertical-align: top;
}

.data_list .diary_datas{
	padding: 5px;
}

.data_list .diary_datas ul{
	list-style-type: none;
}

.data_list .diary_datas ul li{
	margin-top: 15px;
}

.data_list .datas{
	padding: 5px;
}

.data_list .datas ul {
	list-style-type: none;
}

.data_list .datas ul li {
	margin-top: 10px;
}

.data_list .user_image{
	text-align: center;
}

.data_list .user_image img{
	padding-top:10px;
	width: 200px;;
	height: 250px;;
}

.data_list .nickName , .data_list .userSign{
	text-align: center;
}

.data_list .diary_title{
	margin-top:20px;
	text-align: center;
}

.data_list .diary_info{
	text-align: center;
}

.data_list .diary_content{
	margin-top:20px;
}

.data_list .diary_action{
	margin-top:20px;
}

.data_list .diary_type{
	margin-top:10px;
}

.data_list .diary_title{
	margin-top:20px;
	text-align: center;
}

.data_list .data_list_title .diaryType_add{
	float: right;
	margin-right: 20px;
}

.data_list .diaryType_form{
	margin-top:20px;
}
</style>
</head>
<body>
<div class="data_list">

		<div class="data_list_title">
			<img src="${pageContext.request.contextPath}/images/diary_add_icon.png"/>
			写日记
		</div>
		
		<form action="diary?action=save" method="post" onsubmit="return checkForm()">
			<div>
				<div class="diary_title"><input type="text" id="title"  name="title" value="${diary.title }" class="input-xlarge"  style="margin-top:5px;height:30px;"  placeholder="日志标题..."/></div>
				<div>
					<textarea class="ckeditor" id="content" name="content">${diary.content }</textarea>
				</div>
				<div class="diary_type">
					<select id="typeId" name="typeId">
						<option value="">请选择日志类别...</option>
						<c:forEach var="diaryTypeCount" items="${diaryTypeCountList }">
							<option value="${diaryTypeCount.diaryTypeId }" ${diaryTypeCount.diaryTypeId==diary.typeId?'selected':'' }>${diaryTypeCount.typeName }</option>
						</c:forEach>
					</select>
				</div>
				<div>
					<input type="hidden" id="diaryId" name="diaryId" value="${diary.diaryId }"/>
					<input type="submit" class="btn btn-primary" value="保存"/>
					<button class="btn btn-primary" type="button" onclick="javascript:history.back()">返回</button>
					<font id="error" color="red">${error }</font>  
				</div>
			</div>
		</form>
</div>
</body>
</html>