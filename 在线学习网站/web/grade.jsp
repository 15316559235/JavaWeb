<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>成绩查询</title>
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
        <link href='' rel='stylesheet' type='text/css'>
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
					<li ><a href="STmessage.do">信息</a></li>
                    <li class= "hidden-xs hidden-sm">
                     <a rel="home" href="index.html"><img class="logo" src="img/logo.png" width="200" alt="logo"></a>
                    </li>
                    <li class="selected"><a href="search_servlet.do">成绩查询</a></li>
                    <li><a href="course_servlet.do">选课查询</a></li>
                    <li><a href="newtest.do">测试</a></li>
                    <li><a href="contact.html">留言板</a></li>
                </ul>
            </div>
        </div>
		<div class="divider col-sm-12 col-xs-12 col-md-12">
            <div class="header-text"><span>成绩</span> 查询</div>
        </div>

		
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
	<th>姓名</th><th>科目</th><th>成绩</th>
</tr>
   <c:forEach items = "${sessionScope.list}" var = "Show">
   <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
	<td><%= session.getAttribute("name") %></td><td> ${Show.getCourse()}</td><td> ${Show.getGrade()}</td>
   </tr>
   </c:forEach>
</tr>




    <!-- ============FOOTER============= -->

   <footer id="footer"> 
        <div class="footer-content container">
            <div class="footer-adress text-center col-xs-12 col-sm-4 col-md-4">
                <h4></h4>
                <ul class="footer-menus">
                 
                </ul>
            </div>
            <div class="footer-second col-xs-12 col-sm-4 col-md-4">
              <div class="social-block text-center">
                <div class="social-share">
                  
                </div>
             
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
