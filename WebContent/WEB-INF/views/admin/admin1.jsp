<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>学生成绩管理系统 管理员后台</title>
    <link rel="stylesheet" href="../static/css/manage.css">
    <link rel="stylesheet" href="../static/iconfont/iconfont.css">
</head>    
    <style>
        #projectTitle {
        /* width: 100%; */
    }

    #projectTitle .projectTitle_text {
        margin: 21px 0 0 22px;
        color: #333333;
    }

    #projectTitle .projectTitle_text h2 {
        font-size: 24px;
        line-height: 25px;
    }

    #projectTitle .projectTitle_text p {
        font-size: 14px;
        line-height: 30px;
        margin: 10px 0 13px 0;
    }

    #projectTitle .projectTitle_text span {
        color: #999999;
    }

    #projectTitle .projectTitle_text span.iconfont {
        font-size: 22px;
        color: #cccccc;
        margin-left: 30px;
    }

    #projectTitle .projectTitle_img img {
        width: 190px;
        height: 149px;
        margin: 20px 10px 0 0;
    }

    #projectList .projectList_btns {
        height: 54px;
        background-color: #f1f9fc;
        border-top: 1px solid #e0eaef;
        border-bottom: 1px solid #dbe7ed;
    }

    #projectList .projectList_btns ul {
        margin: 14px 0 0 20px;
    }

    #projectList .projectList_btns li {
        float: left;
        width: 108px;
        height: 39px;
        border: 1px solid #dbe7ed;
        border-bottom: none;
        background-color: #fbfeff;
        columns: #666666;
        text-align: center;
        line-height: 39px;
        margin-right: 12px;
        border-radius: 5px 5px 0 0;
        cursor: pointer;
    }

    #projectList .projectList_btns li.active {
        color: white;
        position: relative;
        background-color: #018ffb;
    }

    #projectList .projectList_btns li.active:after {
        content: "";
        display: block;
        position: absolute;
        width: 11px;
        height: 6px;
        background: url("./images/arrow.png") no-repeat;
        bottom: -6px;
        left: 50%;
        margin-left: -6px;
    }

    #projectList .projectList_cons {
        margin: 20px;
    }

    #projectList .projectList_cons>div {
        display: none;
    }

    #projectList .projectList_cons>div.show {
        display: block;
    }

    #projectList .sp_upload1,
    #projectList .sp_upload2 {
        width: 110px;
        height: 32px;
        line-height: 32px;
        font-size: 14px;
        color: white;
        border-radius: 5px;
        cursor: pointer;

    }

    #projectList .sp_upload1 input,
    #projectList .sp_upload2 input {
        display: none;
    }

    #projectList .sp_upload1 label,
    #projectList .sp_upload2 label {
        cursor: pointer;
    }

    #projectList .sp_upload1 {
        background-color: #5fd15c;
    }

    #projectList .sp_upload2 {
        background-color: #34c1da;
        margin-left: 20px;

    }

    #projectList .iconfont {
        margin-left: 7px;
        font-size: 16px;
    }

    #projectList .sp_search {
        width: 210px;
        height: 30px;
        border: 1px solid #dbe7ed;
        border-radius: 5px;
        overflow: hidden;
    }

    #projectList .sp_search input {
        border: none;
        width: 173px;
        height: 100%;
        color: #999999;
        font-size: 14px;
        text-indent: 9px;
        position: relative;
        top: -1px;
        /* 去掉默认的边框 */
        outline: none;
    }

    #projectList .sp_search button {
        width: 32px;
        height: 32px;
        border: none;
        border-left: 1px solid #dbe7ed;
        background-image: linear-gradient(#fcfdfd, #f1f9fc);
        cursor: pointer;
    }

    #projectList .sp_search span {
        font-size: 18px;
        font-weight: bold;
        color: #a1c6d4;
    }

    #projectList .sp_table {
        clear: both;
        width: 100%;
        border: 1px solid #dbe7ed;
        font-size: 12px;
        /* 合并表格边框 */
        border-collapse: collapse;
        /* 由于使用了浮动  使用margin-top会出现塌陷问题 这里采用定位*/
        position: relative;
        top: 20px;
    }

    #projectList .sp_table tr {
        height: 32px;
        border-bottom: 1px solid #e7eff3;

    }

    #projectList .sp_table tr:hover {
        background-color: #f1f9fc;
    }

    #projectList .sp_table th {
        border-right: 1px solid #dbe7ed;
        color: #666666;
        font-weight: normal;
        text-align: left;
        text-indent: 12px;
        background-color: #f1f9fc;
    }

    #projectList .sp_table th:first-child,
    #projectList .sp_table td:first-child {
        text-align: center;
        text-indent: 0;
    }

    #projectList .sp_table td {
        text-indent: 12px;
    }

    #projectList .sp_table .word {
        margin-right: 13px;
        color: #0173ca;
    }

    #projectList .sp_table .up {
        color: #3da2f0;

    }

    #projectList .sp_table .del {
        color: #d94141;
        margin-left: 10px;
    }

    #projectList .sp_footer {
        height: 70px;
        border: 1px solid #dbe7ed;
        border-top: none;
        margin-top: 20px;
        overflow: hidden;
    }

    #projectList .sp_remove,
    #projectList .sp_download {
        width: 78px;
        height: 24px;
        border: 1px solid #c9e4f1;
        border-radius: 3px;
        background-image: linear-gradient(#f7fcff, #e7f4fa);
        font-size: 12px;
        color: #1884ba;
        margin-top: 18px;
        cursor: pointer;
    }

    #projectList .sp_remove {
        margin-right: 15px;
        margin-left: 22px;
    }

    #projectList .sp_download {}
    #projectList .sp_page{
        /* 解决a标签间的空隙 */
       font-size: 0;
        line-height: 24px;
        margin: 22px 18px 0 0;
    }
    #projectList .sp_page a {
        border: 1px solid #e6e6e6;
        padding: 6px 9px;
        font-size: 12px;
        margin-left: 10px;
    }

    #projectList .sp_page a.active {
        border: 1px solid #3797e0;
        background-color: #42adff;
        color: white;
    }
    </style>
  <!--   <link rel="shortcut icon" href="favicon.ico"/>
	<link rel="bookmark" href="favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="easyui/css/default.css" />
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css" />
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src='easyui/js/outlook2.js'> </script> -->
    <!-- <script type="text/javascript">
	 var _menus = {"menus":[
						{"menuid":"1","icon":"","menuname":"成绩统计分析",
							"menus":[
									{"menuid":"11","menuname":"考试列表","icon":"icon-exam","url":"ExamServlet?method=toExamListView"}
								]
						},
						{"menuid":"2","icon":"","menuname":"学生信息管理",
							"menus":[
									{"menuid":"21","menuname":"学生列表","icon":"icon-user-student","url":"StudentServlet?method=toStudentListView"},
								]
						},
						{"menuid":"3","icon":"","menuname":"教师信息管理",
							"menus":[
									{"menuid":"31","menuname":"教师列表","icon":"icon-user-teacher","url":"TeacherServlet?method=toTeacherListView"},
								]
						},
						{"menuid":"4","icon":"","menuname":"基础信息管理",
							"menus":[
									{"menuid":"41","menuname":"年级列表","icon":"icon-world","url":"GradeServlet?method=toGradeListView"},
									{"menuid":"42","menuname":"班级列表","icon":"icon-house","url":"ClazzServlet?method=toClazzListView"},
									{"menuid":"43","menuname":"课程列表","icon":"icon-book-open","url":"CourseServlet?method=toCourseListView"}
								]
						},
						{"menuid":"5","icon":"","menuname":"系统管理",
							"menus":[
							        {"menuid":"51","menuname":"系统设置","icon":"icon-set","url":"SystemServlet?method=toAdminPersonalView"},
								]
						}
				]};


    </script> -->


<%-- <body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
	<noscript>
		<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
		    <img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
		</div>
	</noscript>
    <div region="north" split="true" border="false" style="overflow: hidden; height: 30px;
        background: url(images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
        line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
        <span style="float:right; padding-right:20px;" class="head"><span style="color:red; font-weight:bold;">${user.name}&nbsp;</span>您好&nbsp;&nbsp;&nbsp;<a href="SystemServlet?method=LoginOut" id="loginOut">安全退出</a></span>
        <span style="padding-left:10px; font-size: 16px; ">SWU学生信息管理系统</span>
    </div>
    <div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
        <div class="footer">Copyright &copy; SWU By artisan</div>
    </div>
    <div region="west" hide="true" split="true" title="导航菜单" style="width:180px;" id="west">
	<div id="nav" class="easyui-accordion" fit="true" border="false">
		<!--  导航内容 -->
	</div>
	
    </div>
    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
			<jsp:include page="/WEB-INF/views/admin/welcome.jsp" /> <!--   +s -->
		</div>
    </div>
	
	<iframe width=0 height=0 src="refresh.jsp"></iframe>
	
</body> --%>


<body>
    <header id="header">
        <div class="header_logo l">
            <h1 class="l"><img src="./images/logo.png" alt=""></h1>
            <h2 class="l">后台管理平台</h2>
        </div>
        <div class="header_nav r">
            <ul>
                <li>
                    <span class="iconfont">&#xe676;</span>欢迎您
                </li>
                <li>
                    <span class="iconfont">&#xe603;</span><a href="#">修改密码</a>
                </li>
                <li>
                    <span class="iconfont">&#xe630;</span><a href="#">公司官网</a>
                </li>
                <li>
                    <span class="iconfont">&#xe686;</span><a href="#">退出</a>
                </li>
            </ul>
        </div>
    </header>
    <!-- 使用BFC规范实现左侧固定  右侧自适应（menu添加左浮动 main添加overflow:hidden） -->
    <aside id="menu" class="l">
        <ul>
            <li class="active">
                <a href="#">
                    <span class="iconfont">&#xe635;</span>
                    <p>项目管理</p>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="iconfont">&#xe6ad;</span>
                    <p>用户管理</p>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="iconfont">&#xe611;</span>
                    <p>系统设置</p>
                </a>
            </li>
        </ul>
    </aside>
    <section id="main">
        <section class="main_container">
            <section id="projectTitle" class="clear">
                <div class="projectTitle_text l">
                    <h2>项目1 <span class="iconfont">&#xe6e5;</span></h2>
                    <br>
                    <p>
                        项目编号：<span>2983754395879</span></br>
                        项目类型：<span>工程</span></br>
                        项目负责人：<span>*******</span></br>
                        联系电话：<span>2983754395879</span></br>
                    </p>
                </div>
                <div class="projectTitle_img r">
                    <img src="./images/6.jpg" alt="">
                </div>
            </section>
            <section id="projectList">
                <div class="projectList_btns">
                    <ul>
                        <li class="active">视屏监控</li>
                        <li>考勤管理</li>
                        <li>安全巡查</li>
                        <li>资料管理</li>
                    </ul>
                </div>
                <div class="projectList_cons">
                    <div class="show">
                        <div class="sp_upload1 l">
                            <label for="">
                                <input type="file" name="" id="">
                                <span class="iconfont">&#xe64c;</span>&nbsp;&nbsp;&nbsp;单个上传
                            </label>
                        </div>
                        <div class="sp_upload2 l">
                            <label for="">
                                <input type="file" multiple name="" id="">
                                <span class="iconfont">&#xe612;</span>&nbsp;&nbsp;&nbsp;批量上传
                            </label>
                        </div>
                        <div class="sp_search r">
                            <input type="text" placeholder="请输入文字" name="" id="">
                            <button><span class="iconfont">&#xe627;</span></button>
                        </div>
                        <table class="sp_table">
                            <thead>
                                <tr>
                                    <th width="49"><input type="checkbox"></th>
                                    <th>文档名称</th>
                                    <th width="167">文档大小</th>
                                    <th width="148">上传者</th>
                                    <th width="168">上传时间</th>
                                    <th width="81">操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td><span class="iconfont word">&#xe604;</span>安全准测1.doc</td>
                                    <td>31.3KB</td>
                                    <td>****</td>
                                    <td>2020-08-03</td>
                                    <td><span class="iconfont up">&#xe623;</span><span
                                            class="iconfont del">&#xe785;</span></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td><span class="iconfont word">&#xe604;</span>安全准测1.doc</td>
                                    <td>31.3KB</td>
                                    <td>****</td>
                                    <td>2020-08-03</td>
                                    <td><span class="iconfont up">&#xe623;</span><span
                                            class="iconfont del">&#xe785;</span></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td><span class="iconfont word">&#xe604;</span>安全准测1.doc</td>
                                    <td>31.3KB</td>
                                    <td>****</td>
                                    <td>2020-08-03</td>
                                    <td><span class="iconfont up ">&#xe623;</span><span
                                            class="iconfont del">&#xe785;</span></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td><span class="iconfont word">&#xe604;</span>安全准测1.doc</td>
                                    <td>31.3KB</td>
                                    <td>****</td>
                                    <td>2020-08-03</td>
                                    <td><span class="iconfont up">&#xe623;</span><span
                                            class="iconfont del">&#xe785;</span></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td><span class="iconfont word ">&#xe604;</span>安全准测1.doc</td>
                                    <td>31.3KB</td>
                                    <td>****</td>
                                    <td>2020-08-03</td>
                                    <td><span class="iconfont up">&#xe623;</span><span
                                            class="iconfont del">&#xe785;</span></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td><span class="iconfont word">&#xe604;</span>安全准测1.doc</td>
                                    <td>31.3KB</td>
                                    <td>****</td>
                                    <td>2020-08-03</td>
                                    <td><span class="iconfont up">&#xe623;</span><span
                                            class="iconfont del">&#xe785;</span></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td><span class="iconfont word ">&#xe604;</span>安全准测1.doc</td>
                                    <td>31.3KB</td>
                                    <td>****</td>
                                    <td>2020-08-03</td>
                                    <td><span class="iconfont up">&#xe623;</span><span
                                            class="iconfont del">&#xe785;</span></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td><span class="iconfont word">&#xe604;</span>安全准测1.doc</td>
                                    <td>31.3KB</td>
                                    <td>****</td>
                                    <td>2020-08-03</td>
                                    <td><span class="iconfont up">&#xe623;</span><span
                                            class="iconfont del">&#xe785;</span></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td><span class="iconfont word ">&#xe604;</span>安全准测1.doc</td>
                                    <td>31.3KB</td>
                                    <td>****</td>
                                    <td>2020-08-03</td>
                                    <td><span class="iconfont up">&#xe623;</span><span
                                            class="iconfont del">&#xe785;</span></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td><span class="iconfont word">&#xe604;</span>安全准测1.doc</td>
                                    <td>31.3KB</td>
                                    <td>****</td>
                                    <td>2020-08-03</td>
                                    <td><span class="iconfont up">&#xe623;</span><span
                                            class="iconfont del">&#xe785;</span></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td><span class="iconfont word ">&#xe604;</span>安全准测1.doc</td>
                                    <td>31.3KB</td>
                                    <td>****</td>
                                    <td>2020-08-03</td>
                                    <td><span class="iconfont up">&#xe623;</span><span
                                            class="iconfont del">&#xe785;</span></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td><span class="iconfont word">&#xe604;</span>安全准测1.doc</td>
                                    <td>31.3KB</td>
                                    <td>****</td>
                                    <td>2020-08-03</td>
                                    <td><span class="iconfont up">&#xe623;</span><span
                                            class="iconfont del">&#xe785;</span></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td><span class="iconfont word ">&#xe604;</span>安全准测1.doc</td>
                                    <td>31.3KB</td>
                                    <td>****</td>
                                    <td>2020-08-03</td>
                                    <td><span class="iconfont up">&#xe623;</span><span
                                            class="iconfont del">&#xe785;</span></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td><span class="iconfont word">&#xe604;</span>安全准测1.doc</td>
                                    <td>31.3KB</td>
                                    <td>****</td>
                                    <td>2020-08-03</td>
                                    <td><span class="iconfont up">&#xe623;</span><span
                                            class="iconfont del">&#xe785;</span></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td><span class="iconfont word ">&#xe604;</span>安全准测1.doc</td>
                                    <td>31.3KB</td>
                                    <td>****</td>
                                    <td>2020-08-03</td>
                                    <td><span class="iconfont up">&#xe623;</span><span
                                            class="iconfont del">&#xe785;</span></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td><span class="iconfont word">&#xe604;</span>安全准测1.doc</td>
                                    <td>31.3KB</td>
                                    <td>****</td>
                                    <td>2020-08-03</td>
                                    <td><span class="iconfont up">&#xe623;</span><span
                                            class="iconfont del">&#xe785;</span></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td><span class="iconfont word ">&#xe604;</span>安全准测1.doc</td>
                                    <td>31.3KB</td>
                                    <td>****</td>
                                    <td>2020-08-03</td>
                                    <td><span class="iconfont up">&#xe623;</span><span
                                            class="iconfont del">&#xe785;</span></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td><span class="iconfont word">&#xe604;</span>安全准测1.doc</td>
                                    <td>31.3KB</td>
                                    <td>****</td>
                                    <td>2020-08-03</td>
                                    <td><span class="iconfont up">&#xe623;</span><span
                                            class="iconfont del">&#xe785;</span></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="sp_footer">
                            <button class="sp_remove">批量删除</button>
                            <button class="sp_download">批量ye下载</button>
                            <div class="sp_page r">
                                <a href="#">共12条</a>
                                <a href="#">首页</a>
                                <a href="#">上一页</a>
                                <a href="#" class="active">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#">下一页</a>
                                <a href="#">尾页</a>
                            </div>
                        </div>
                    </div>
                    <div>考勤管理zdvgadgvdg</div>
                    <div>安全巡查dsgasdfsdf</div>
                    <div>资料管理dfadsgdfdg</div>
                </div>

            </section>


        </section>
    </section>

    <footer id="footer">
        kfsjklashfklasfhfklj
    </footer>
</body>
</html>