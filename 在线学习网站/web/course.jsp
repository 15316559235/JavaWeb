<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
]


<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>留言板</title>
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!--[if lt IE 9]>
            <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <link href="css/styles.css" rel="stylesheet">
        <link rel="stylesheet" href="css/demo.css" />
        <link rel="stylesheet" href="css/testimonial.css" />
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link href='http://fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
    </head>
    <body>
    <div class="header container">
      <div class="visible-xs visible-sm col-xs-12 col-sm-12 text-center sm-logo">
        <a rel="home" href="index.html">
          <img src="img/logo.png" width="200" alt="logo">
        </a>
      </div>
    </div>
        <div class="navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="Student.html">主页</a></li>
                    <li><a href="STmessage.do">信息</a></li>
                    <li class= "hidden-xs hidden-sm">
                     <a rel="home" href="index.html"><img class="logo" src="img/logo.png" width="200" alt="logo"></a>
                    </li>
                    <li><a href="search_servlet.do">成绩查询</a></li>
                    <li class="selected"><a href="course_servlet.do">选课查询</a></li>
                    <li ><a href="newtest.do">测试</a></li>
                    <li ><a href="contact.html">留言板</a></li>
                </ul>
            </div>
        </div>
     <div class="divider col-sm-12 col-xs-12 col-md-12">
            <div class="header-text"><span>选课</span> 查询</div>
        </div>

<tr><td><span style="font-size: 15px;">欢迎您：</span></td></tr>
<tr><td><span style="font-size: 15px;">学号：${sessionScope.username}</span></td></tr>
<tr><td><span style="font-size: 15px;">姓名：${sessionScope.name}</span></td></tr>
<table id="spacer1"width="40%"cellpadding="0"cellspacing="3"border="0">

    <form action="add_servlet" method="post">
    <tr><td>课程名称：</td>
    <td>教师名字：</td>
        <td>选课状态：</td></tr>
  <tr><td>操作系统</td>
        <td>李诚</td>
        <td><input type="radio" name="quest"value="1"></td></tr>
    <tr><td>计算机导论</td>
        <td>王萍</td>
        <td><input type="radio" name="quest"value="2"></td></tr>
    <tr><td>高等数学</td>
        <td>刘冰</td>
        <td><input type="radio" name="quest"value="3"></td></tr>
    <tr><td>数字电路</td>
        <td>张旭</td>
        <td><input type="radio" name="quest" value="4"></td></tr>

        <tr><td><input type="submit"value="确定选课"></td>
            <td><input type="reset"value="重新选择"></td>
        </tr>
    </form>
</table>

<style type="text/css">
table.hovertable {
	font-family: verdana,arial,sans-serif;
	font-size:30px;
	color:#333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
	align:center;
	
}
table.hovertable th {
	background-color:#c3dde0;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
table.hovertable tr {
	background-color:#d4e3e5;
}
table.hovertable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
</style>

<!-- Table goes in the document BODY -->

<table class="hovertable" >
<tr>
	<th>姓名</th><th>教师</th><th>课程</th>
</tr>
   <c:forEach items = "${sessionScope.clist}" var = "Show">
   <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
	<td><%= session.getAttribute("name") %></td><td> ${Show.getTeacher()}</td><td> ${Show.getCourse()}</td>
   </tr>
   </c:forEach>
</tr>
                </div><!-- End Contact Form Area -->
            </div><!-- End Inner -->
          </div>
            <!-- wrapper -->
        </section>
      <section class="map">
          <!-- CSS goes in the document HEAD or added to your external stylesheet -->


    <!-- ============FOOTER============= -->

    
    <footer id="footer"> 
        <div class="footer-content container">
          <div class="footer-adress text-center col-xs-12 col-sm-4 col-md-4">
                <h4></h4>
                <ul class="footer-menus">
                  
                </ul>
            </div>
            
           
           
        <div class="move-top-page">
      </div>
    </footer>

  <!-- script references -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/nav-hover.min.js"></script>
    <script type="text/javascript" src="js/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <!-- Place in the <head>, after the three links -->
    <script>
     $('.testimonials-slider').bxSlider({
      slideWidth: 800,
      minSlides: 1,
      maxSlides: 1,
      slideMargin: 32,
      auto: true,
      autoControls: true
      });
    </script>
    <script type="text/javascript">
    </script>
  </body>
</html>
