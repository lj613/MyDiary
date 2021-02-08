<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.5/css/layui.css"  media="all">
<link href="../static/css/diary.css" rel="stylesheet">
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
					<textarea class="layui-textarea" id="LAY_demo1" style="display: none"></textarea>
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
<script src="https://www.layuicdn.com/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
layui.use('layedit', function(){
  var layedit = layui.layedit
  ,$ = layui.jquery;
  
  //构建一个默认的编辑器
  var index = layedit.build('LAY_demo1');
  
  //编辑器外部操作
  var active = {
    content: function(){
      alert(layedit.getContent(index)); //获取编辑器内容
    }
    ,text: function(){
      alert(layedit.getText(index)); //获取编辑器纯文本内容
    }
    ,selection: function(){
      alert(layedit.getSelection(index));
    }
  };
  
  $('.site-demo-layedit').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
  
  //自定义工具栏
  layedit.build('LAY_demo2', {
    tool: ['face', 'link', 'unlink', '|', 'left', 'center', 'right']
    ,height: 100
  })
});
</script>	

</body>
</html>