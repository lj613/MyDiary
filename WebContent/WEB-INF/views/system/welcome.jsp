<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="../static/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="../static/js/bootstrap.min.js">
<script src="../static/js/jquery-3.4.1.min.js"></script>
 <script src="../static/iconfont/iconfont.js"></script>
<style type="text/css">
body {
	background-color: #eee;
}

.title_box {
	padding: 20px;
	overflow: hidden;
	color: red;
}

.title {
	font-size: 25px;
	line-height: 30px;
	height: 30px;
	color: red;
}
 .weather-box {
            width: 400px;
            /* height: 300px; */
        }
        .weather-left{
            flex: 1;
            margin-left:-15px;
            text-align: center;
        }
        .weather-img-box {
            width: 125px;
            height: 130px;
            margin:0 auto;
        }

        .weather-img-box img {
            width: 100%;
            height: 100%;
        }

         .type { 
           
            font-size: 16px;
            text-align: center;
            font-weight: bold;
        }
        .weather{
           display: flex;
           
        }
        .weather-right {
            flex: 1;
            margin-top: 26px;
        }
        .weather-bottom{
            margin-top:10px;
            margin-bottom: 5px;
        }
        .date{
            background-color: #9d9d9d;
            color: #fff;
            width: 160px;
            margin-left: 30px;
        }
         .icon {
            width: 125px;
            height: 130px;
            vertical-align: -0.15em;
            fill: currentColor;
            overflow: hidden;
        }
</style>
</head>
<body>
	<div class="main">
		<div class="title-box" title="欢迎使用">
			<p class="title">欢迎使用日记本系统</p>
		</div>
		<div class="content">
			<div class="panel panel-default weather-box">
				<div class="panel-heading" style="background-color:skyblue">
					<h3 class="panel-title" >
						今日天气(<span class="city"></span>)
					</h3>
				</div>
				<div class="panel-body">
					<div class="weather">
						<div class="weather-left">
							<div class="weather-img-box">
								 <svg class="icon" aria-hidden="true">
                                            <use id="use1" xlink:href="#icon-sunny"></use>
                                        </svg>
							</div>
						</div>
						<div class="weather-right ">
							<p class="low">
								<span>低温 -6℃</span>
							</p>
							<p class="high">
								<span>高温 4℃</span>
							</p>
							<p class="wind">
								风向：<span>北风 3级</span>
							</p>
						</div>
					</div>
					<div class="weather-bottom row">
						<div class="type col-md-6">多云</div>
						<div class="date col-md-6">2020年2月1日</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	 $(function () {
	        /* 页面加载完成后，直接发送一个ajax请求 获取分页数据  显示数据列表的首页*/
	        weather();
	        //设置时间
	        var time = new Date().Format("yyyy-MM-dd hh:mm:ss");
	        $(".date").html(time);
	    });
	   
	    //每个1秒修改时间
	    setInterval(function(){
	        var time = new Date().Format("yyyy-MM-dd hh:mm:ss");
	        $(".date").html(time);
	    },1000);

	    //获取天气
	    function  weather(){
	        $.ajax({
	            url: "http://wthrcdn.etouch.cn/weather_mini?city=重庆",
	            type: "get",
	            success: function (result) {
	                result = JSON.parse(result);
	                console.log(result); //打印后台返回的数据 */
	                $(".city").html(result.data.city);
	                $(".type").html(result.data.forecast[0].type);
	                $(".low span").html(result.data.forecast[0].low);
	                $(".high span").html(result.data.forecast[0].high);
	                $(".wind span").html(result.data.forecast[0].fengxiang);
	                if (result.data.forecast[0].type == "晴") {
	                    $(".weather-img-box svg use").attr("xlink:href", "#icon-sunny");
	                } else if (result.data.forecast[0].type == "多云") {
	                    $(".weather-img-box svg use").attr("xlink:href", "#icon-cloud");
	                } else if (result.data.forecast[0].type == "霾") {
	                    $(".weather-img-box svg use").attr("xlink:href", "#icon-haze");
	                } else if (result.data.forecast[0].type == "小雨") {
	                    $(".weather-img-box svg use").attr("xlink:href", "#icon-rain");
	                } else if (result.data.forecast[0].type == "阴") {
	                    $(".weather-img-box svg use").attr("xlink:href", "#icon-cloudy");
	                } else if (result.data.forecast[0].type == "小雪") {
	                    $(".weather-img-box svg use").attr("xlink:href", "#icon-snow");
	                } else {
	                    $(".weather-img-box svg use").attr("xlink:href", "#icon-cloudy");
	                }

	            }
	        })
	    }
	    
	  //格式化时间函数
	    Date.prototype.Format = function (fmt) { // author: meizz
	        var o = {
	            "M+": this.getMonth() + 1, // 月份
	            "d+": this.getDate(), // 日
	            "h+": this.getHours(), // 小时
	            "m+": this.getMinutes(), // 分
	            "s+": this.getSeconds(), // 秒
	            "q+": Math.floor((this.getMonth() + 3) / 3), // 季度
	            "S": this.getMilliseconds() // 毫秒
	        };
	        if (/(y+)/.test(fmt))
	            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	        for (var k in o)
	            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) :
	                (("00" + o[k]).substr(("" + o[k]).length)));
	        return fmt;
	    }
	</script>
</body>
</html>