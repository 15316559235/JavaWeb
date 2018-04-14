<%--
  Created by IntelliJ IDEA.
  User: sc
  Date: 2017/12/18
  Time: 下午10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>行业信息</title>
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
            <li class="selected"><a href="STmessage.do">信息</a></li>
            <li class= "hidden-xs hidden-sm">
                <a rel="home" href="index.html"><img class="logo" src="img/logo.png" width="200" alt="logo"></a>
            </li>
            <li><a href="search_servlet.do">成绩查询</a></li>
            <li><a href="course_servlet.do">选课查询</a></li>
            <li><a href="newtest.do">测试</a></li>
            <li><a href="contact.html">留言板</a></li>
        </ul>
    </div>
</div>
<div class="divider col-sm-12 col-xs-12 col-md-12">
    <div class="header-text"><span>行业</span> 信息</div>
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
        <th>姓名</th><th>联系方式</th><th>留言内容</th>
    </tr>
    <c:forEach var="list" items="${requestScope.messagebeanlist}"  varStatus="status">
        <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
            <td>${list.getName()}</td><td>${list.getMail()}</td><td>${list.getMessage()}</td>
        </tr>
    </c:forEach>

</table>

<div class="container">
    <div class="col-md-4">
        <div class="service-features">
            <div class="img-container">
                <img src="images/paperplane.png" alt="Service Features">
            </div>
            <h3>信息1</h3>
            <p> 12月19日在海口召开的2017年度中国游戏产业年会上，发布了《2017年中国游戏产业报告》(下称《报告》)。报告显示，今年中国游戏产业在整体收入的增长方面逐渐回暖。2017年中国游戏市场实际销售收入达到2036.1亿元，同比增长23.0%（编注：首次突破2千亿元）。</p>
        </div>
    </div><!-- END ONE THIRD COLUMN -->

    <div class="col-md-4">
        <div class="service-features service-features2">
            <div class="img-container">
                <img src="images/lab.png" alt="Service Features">
            </div>

            <h3>信息2</h3>
            <p> 12月19日，世界银行发布报告，将中国2017年的经济增长预期上调至6.8%。这比世界银行在10月预测的6.7%提高了0.1个百分点。基于中国个人消费和外贸对于经济增长的支持，世界银行做出了这一上调。</p>
        </div>

    </div><!-- END ONE THIRD COLUMNS -->

    <div class="col-md-4">
        <div class="service-features">
            <div class="img-container">
                <img src="images/like.png" alt="Service Features">
            </div>
            <h3>信息3</h3>
            <p> 农业部日前提出，到2020年，全国远洋渔船总数稳定在3000艘以内，渔船专业化、标准化、现代化程度显着提升；远洋渔业企业数量在2016年基础上保持“零增长”，培育一批有国际竞争力的现代化远洋渔业企业。</p>
        </div>

    </div><!-- END ONE THIRD COLUMNS -->
    <td>

    </td>
</div>


</section>

</section>

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
