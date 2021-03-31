<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人中心</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%
	pageContext.setAttribute("url", request.getSession().getAttribute("url"));
%>
<%
	String url = (String)request.getSession().getAttribute("url");
%>
<script src="../static/js/jquery-3.4.1.min.js"></script>
<script src="//res.layui.com/layui/dist/layui.js" charset="utf-8"></script>
<link rel="stylesheet" href="//res.layui.com/layui/dist/css/layui.css"  media="all">
<link rel="stylesheet" type="text/css" href="../static/css/easyui.css">
<link rel="stylesheet" type="text/css" href="../static/css/icon.css">
<link rel="stylesheet" type="text/css" href="../static/css/demo.css">
<link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.5/css/layui.css" media="all">
<script src="https://www.layuicdn.com/layui-v2.5.5/layui.js" charset="utf-8"></script>
<style type="text/css">
.main {
	margin: 20px;
	width: 100%;
	height: 100%;
	background-color:white;
}

.personTitle {
	padding: 10px 20px;
	height: 54px;
	background-color: #f1f9fc;
	border-top: 1px solid #e0eaef;
	border-bottom: 1px solid #dbe7ed;
}
.personTitle h2 {
	font-size: 24px;
	line-height: 25px;
}

.person_info {
	border: 1px solid black;
	background-color: #f1f9fc;
	margin-top: 20px;
	padding: 20px 30px;
	width: 100%;
	height: 100%;
}
.left {
	margin: 10px;
	padding:10px;
	width: 100%;
	height: 700px;
	flexWrap: wrap;
	display: flex;

}
.left1 {
	margin: 10px;
	padding:10px;
	width: 80%;
	height: 400px;
	display: -webkit-flex;
	display: flex;
	justify-content: end;
}


.img{
	width: 13%;
	height: 150px;
	margin: 10px;
	padding:10px;
	border-radius: 20%;
	border-style: solid;
    border-color: green;
}
.time{
	width: 20%;
	height: 0px;
	margin: 10px;
	padding:10px;
}

.item {
 	position: relative;
	width: 50%;
	height: 150px;
	margin: 10px;
	padding:10px;
	border-radius: 10%;
	border-style: solid;
    border-color: green;
}
.rl{
	width: 25%;
	height: 150px;
	margin: 10px;
	padding:10px;
	border-radius: 20%;
	border-style: solid;
    border-color: green;
}
.font{
	font-style:normal ;
	font-variant:normal;
	font-weight:bold;
	font-size:25px;
	font-family:Sans-serif;
}
.font1{
	font-style:normal ;
	font-variant:normal;
	font-weight:normal;
	font-size:25px;
	font-family:Sans-serif;
}
.f {
  position: absolute;
  top: 10px;
  right: 40px;
  width: 90px;
  border: 3px solid #73AD21;
}


</style>
</head>
<body style="background-color:white;">
<div class="main">
	
	 <!-- 标题部分 -->
	<div class="personTitle">
		<h2>个人中心</h2>
	</div>

	<div class="person_info">
		<div class="left">
		<div class="time">
				<ul class="layui-timeline">
				  <li class="layui-timeline-item">
				    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
				    <div class="layui-timeline-content layui-text">
				      <h3 class="layui-timeline-title">8月18日</h3>
				      <p class="title">标题： </p>
				      <span class="content">内容：</span>
				    </div>
				  </li>
				  <li class="layui-timeline-item">
				    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
				    <div class="layui-timeline-content layui-text">
				      <h3 class="layui-timeline-title">8月16日</h3>
				      <p class="title">标题： </p>
				      <span class="content">内容：</span>
				    </div>
				  </li>
				  <li class="layui-timeline-item">
				    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
				    <div class="layui-timeline-content layui-text">
				      <h3 class="layui-timeline-title">X月X日</h3>
				      <p class="title">标题： </p>
				      <span class="content">内容：</span>
				    </div>
				  </li>
				  <li class="layui-timeline-item">
				    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
				    <div class="layui-timeline-content layui-text">
				      <h3 class="layui-timeline-title">X月X日</h3>
				     <p class="title">标题： </p>
				      <span class="content">内容：</span>
				    </div>
				  </li>
				  <li class="layui-timeline-item">
				    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
				    <div class="layui-timeline-content layui-text">
				      <h3 class="layui-timeline-title">X月X日</h3>
				     <p class="title">标题： </p>
				      <span class="content">内容：</span>
				    </div>
				  </li>
				</ul>
			</div>
			<div class="item">
				<div class="font">
					姓名：<span class="font1" id="name"></span></br>
					编号：<span class="font1" id="number"></span></br>
					性别：<span class="font1" id="sex"></span></br>
					签名：<span class="font1" id="signature"></span></br>
						  <div id="bj"></div>
				</div>
				<div id="layerDemo" class="f">
					<button data-method="offset" data-type="auto" class="layui-btn layui-btn-normal" style="background-color: tomato;width: 90px;height: 40px;">编辑资料</button>
				</div>
			</div>
			<div class="img">
					<img class="col-sm-10" id="photo" alt="照片"
						style="max-width: 150px; max-height: 150px;" title="照片"
						src="#" />
			</div>	
					
		</div>
	</div>
</div>
<script src="//res.layui.com/layui/dist/layui.js" charset="utf-8"></script>
<script>
        layui.use('laydate', function () {
            var laydate = layui.laydate;
            laydate.render({
                elem: '#test'
                , position: 'static',
                done: function (value, date, endDate) {
                    window.location.href = www.baidu.com //
                    console.log(value); //得到日期生成的值，如：2017-08-18
                    console.log(date); //得到日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}
                    console.log(endDate); //得结束的日期时间对象，开启范围选择（range: true）才会返回。对象成员同上。
                }
            });
            laydate.render({
          	  elem: '#test'
          	  ,calendar: true
          	});
          	//自定义重要日
          	laydate.render({
          	  elem: '#test'
          	  ,mark: {
          	    '0-10-14': '生日'
          	    ,'0-12-31': '跨年' //每年的日期
          	    ,'0-0-10': '工资' //每月某天
          	    ,'0-0-15': '月中'
          	    ,'2017-8-15': '' //如果为空字符，则默认显示数字+徽章
          	    ,'2099-10-14': '呵呵'
          	  }
          	  ,done: function(value, date){
          	    if(date.year === 2017 && date.month === 8 && date.date === 15){ //点击2017年8月15日，弹出提示语
          	      alert('这一天是：中国人民抗日战争胜利72周年');
          	    }
          	  }
          	}); 
        });
        
    </script>

<script >
$(document).ready(function () {
    $("#layerDemo").click(function (){
        tanchuang();//添加相册弹窗
    });
});

function tanchuang() {
    layui.use('layer', function () {
        var $ = layui.jquery, layer = layui.layer;
        layer.ready(function () {
            layer.msg('', {
                type: 2,
                content: "../user/personal",
                shadeClose: true,
                time:60000,
                shade: [0.1, '#393D49'],
                area: ['550px', '650px'],
                anim: 1,
                skin: 'myskin',
                btnAlign: 'c',
                end:function (){
                    location.reload();//关闭弹窗的时候刷新相册界面
                }
            });
        })
    });
}
</script>
<script>
layui.use('layer', function(){ //独立版的layer无需执行这一句
	  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
	  
	  var active = {
	    setTop: function(){
	      var that = this; 
	      layer.open({
	    	  type: 1,
	    	  skin: 'layui-layer-rim', //加上边框
	    	  area: ['420px', '240px'], //宽高
	    	  content: 'html内容'
	    	});
	    }
	  }
	  $('#layerDemo .layui-btn').on('click', function(){
		    var othis = $(this), method = othis.data('method');
		    active[method] ? active[method].call(this, othis) : '';
		  });
});
</script>
<script type="text/javascript">
	
        var userId = ${user.id};
		console.log(userId);
		
		var valiFlag = true;
		$(function() {
			/* 页面加载完成后，直接发送一个ajax请求 获取分页数据  显示数据列表的首页*/
			getUser(userId);
			getList();
		});
        function getUser(id) {
			console.log("调用获取用户信息的方法");
			$.ajax({
				url : "${APP_PATH}/user/" + id,
				type : "GET",
				success : function(result) {
					console.log(result);
					//获取查询到的管理员数据
					var user = result.datalist.user;
					//将查询到的数据填充到对应位置
					$("#photo").attr("src", user.photo);
					$("#name").append(user.username);
					$("#number").append(user.un);
					$("#signature").append(user.signature);
					$("#sex").append(user.sex);
					
				}
			});
		}
        function getList() {
			console.log("调用获取最近五篇日记的方法");
			$.ajax({
				url : "${APP_PATH}/diary/getList" ,
				type : "GET",
				success : function(result) {
					console.log(result);
		        	var diary= result.datalist.diary;
		        
		        	var title = new Array();
		        	var content =new Array();
		        	var date = new Array();
		        	$.each(diary,
							function(index, diary) { 
				                title.push(diary.title);
				                content.push(diary.content);
								date.push(toDates(diary.releaseDate));
					}); 
		        	
		        	console.log(content[0]);
		        	console.log(content[1]);console.log(content[2]);console.log(content[3]);console.log(content[4]);
		        	 var a=$('.layui-timeline-title');
		        	 var b=$('.title');
		        	 var c=$('.content');
		             a.each(function(index,element){
		                 $(element).html(date[index]);
		             });
		             b.each(function(index,element){
		                 $(element).append(title[index]);
		             });
		             c.each(function(index,element){
		                 $(element).append(cutString2(content[index],70));
		             });
				}
			});
		}
        //转换成时间格式
        function toDates(times) {
			const date = new Date(times)
			const Y = date.getFullYear()
			const M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1)
					: date.getMonth() + 1)
			const D = (date.getDate() < 10 ? '0' + date.getDate() : date
					.getDate())
			const H = date.getHours() < 10 ? '0' + date.getHours() : date
					.getHours()
			const Min = date.getMinutes() < 10 ? '0' + date.getMinutes() : date
					.getMinutes()
			const S = date.getSeconds() < 10 ? '0' + date.getSeconds() : date
					.getSeconds()
			const dateTime = Y + '年' + M + '月' + D + '日'
			/*  const dateTime = Y + '年' + M + '月' + D + '日' + H + '时' + Min + '分' + S + '秒' */
			return dateTime
		}
        function cutString2(text, length) {
			//全为中文
			if (text.replace(/[\u4e00-\u9fa5]/g, 'aa').length <= length) {
				return text
			} else {
				var _length = 0
				var outputText = ''
				for (var i = 0; i < text.length; i++) {
					if (/[\u4e00-\u9fa5]/.test(text[i])) {
						_length += 2
					} else {
						_length += 1
					}
					if (_length > length) {
						break
					} else {
						outputText += text[i]
					}
				}
				return outputText + '...'
			}
		}
    </script>

</body>
</html>