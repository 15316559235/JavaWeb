<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="test.testbean" %>
<!DOCTYPE html>
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
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/login.css" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
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
            <li><a href="course_servlet.do">选课查询</a></li>
            <li class="selected"><a href="newtest.do">测试</a></li>
            <li ><a href="contact.html">留言板</a></li>
        </ul>
    </div>
</div>
<div class="divider col-sm-12 col-xs-12 col-md-12">
    <div class="header-text"><span>综合</span> 测试</div>
</div>

<form id="Test" name="Test" method="post" onsubmit="" action="testcheck.do">
    <ol><c:forEach var="list" items="${requestScope.testbeanlist}"  varStatus="status">
        <li>
            <div>
                <input name="Id" type="hidden" value=${list.getId()}>
                <p>${list.getQuestion()}</p>
                <div class="AnswerA">
                    <input type="radio" id="AnswerA" name="Answer" value="A" />
                    <label for="AnswerA">${list.getAnswerA()}</label>
                </div>
                <div class="AnswerB">
                    <input type="radio" id="AnswerB" name="Answer" value="B"/>
                    <label for="AnswerB">${list.getAnswerB()}</label>
                </div>
                <div class="AnswerC">
                    <input type="radio" id="AnswerC" name="Answer" value="C"/>
                    <label for="AnswerC">${list.getAnswerC()}</label>
                </div>
                <div class="AnswerD">
                    <input type="radio" id="AnswerD" name="Answer" value="D"/>
                    <label for="AnswerD">${list.getAnswerD()}</label>
                </div>
            </div>
        </li>
    </c:forEach>
    </ol>


    <div class="loginwarrp">
        <li class="login-sub">
            <input type="submit" name="Submit" value="提交" />
        </li>
    </div>

</form>

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
                <h4>项目管理第九组制作</h4>
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
        <%
    String mess=(String)session.getAttribute("message");
    if(mess!=null) {%>
    <script type="text/javascript">
        alert("<%=mess%>");
    </script>
        <%
session.removeAttribute("message");}
%>
</body>
</html>
