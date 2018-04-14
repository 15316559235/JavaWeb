<%--
  Created by IntelliJ IDEA.
  User: sc
  Date: 2017/12/28
  Time: 下午3:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>As Home</title>
    <meta name="content-type" content="text/html; charset=UTF-8">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Mattress Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- start menu -->
    <link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="js/memenu.js"></script>
    <script>$(document).ready(function(){$(".memenu").memenu();});</script>
    <script src="js/simpleCart.min.js"> </script>
</head>
<body>
<!--header-->
<div class="header">
    <div class="header-top">
        <div class="container">
            <div class="social">
                <ul>
                    <li><a href="#"><i class="facebok"> </i></a></li>
                    <li><a href="#"><i class="twiter"> </i></a></li>
                    <li><a href="#"><i class="inst"> </i></a></li>
                    <li><a href="#"><i class="goog"> </i></a></li>
                    <div class="clearfix"></div>
                </ul>
            </div>
            <div class="header-left">



                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>

        </div>
    </div>
    <div class="container">
        <div class="head-top">
            <div class="logo">
                <h1><a href="index.jsp">AsHome精品酒店</a></h1>
            </div>
            <div class=" h_menu4">
                <ul class="memenu skyblue">
                    <li><a class="color8" href="index.jsp">首页</a></li>
                    <li>&nbsp;</li>

                    <li class="grid"><a class="color2" href="#">房间选择</a>
                        <div class="mepanel">
                            <div class="row">
                                <div class="col1">
                                    <div class="h_nav">
                                        <ul>
                                            <li><a href="products.jsp">舒适双人房</a></li>
                                            <li><a href="products.jsp">精品大床房</a></li>
                                            <li><a href="products.jsp">舒适大床房</a></li>
                                            <li><a href="products.jsp">精品单人间</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <ul>
                                            <li><a href="products.jsp">欧式大床房</a></li>
                                            <li><a href="products.jsp">经典大床房</a></li>
                                            <li><a href="products.jsp">经典单人间</a></li>
                                            <li><a href="products.jsp">舒适单人间</a></li>

                                        </ul>
                                    </div>
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <ul>
                                            <li><a href="products.jsp">Classic Room</a></li>
                                            <li><a href="products.jsp">Standard Room</a></li>
                                            <li><a href="products.jsp">Single-Room</a></li>
                                            <li><a href="products.jsp">Suite</a></li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>&nbsp;</li>
                    <li>&nbsp;</li>
                    <li><a class="color6" href="contact.jsp">联系我们</a></li>
                </ul>
            </div>

            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- grow -->
<div class="grow">
    <div class="container">
        <h2>注册</h2>
    </div>
</div>
<!-- grow -->
<!--content-->
<div class=" container">
    <div class=" register">

        <form id="register" name="register" method="post" action="signin.do">
            <div class="col-md-6 register-top-grid">
                <h3>个人信息</h3>
                <div>
                    <span>姓名</span>
                    <input type="text" name="Cname" >
                </div>
                <div>
                    <span>联系方式</span>
                    <input type="text" name="Ctel">
                </div>
                <div>
                    <span>身份证号码</span>
                    <input type="text" name="Cnum">
                </div>
                <div>
                    <span>Email地址</span>
                    <input type="text" name="Cid">
                </div>
                <a class="news-letter" href="#">
                    <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>获取我们的最新通知</label>
                </a>
            </div>
            <div class="col-md-6 register-bottom-grid">
                <h3>登录信息</h3>
                <div>
                    <span>请输入密码</span>
                    <input type="password" name="Cpswd">
                </div>
                <div>
                    <span>请再次确认密码</span>
                    <input type="password" name="Crpswd">
                </div>
                <input type="submit" name="submit" value="注册">

            </div>
            <div class="clearfix"> </div>
        </form>
    </div>
</div>
<!--//content-->
<div class="footer">
    <div class="container">
        <div class="footer-top-at">

            <div class="col-md-3 amet-sed">
                <h4>更多信息</h4>
                <ul class="nav-bottom">
                    <li><a href="#">如何预订</a></li>
                    <li><a href="#">常见问题</a></li>
                    <li><a href="contact.jsp">酒店地址</a></li>
                    <li><a href="login.html">会员信息</a></li>
                </ul>
            </div>
            <div class="col-md-3 amet-sed">
                <h4>目录</h4>
                <ul class="nav-bottom">
                    <li><a href="index.jsp">回到首页</a></li>
                    <li><a href="products.jsp">房间信息</a></li>
                    <li><a href="login.jsp">登录注册</a></li>
                    <li><a href="contact.jsp">联系我们</a></li>
                </ul>

            </div>
            <div class="col-md-3 amet-sed">
                <h4>随时获取我们的信息</h4>
                <div class="stay">
                    <div class="stay-left">
                        <form>
                            <input type="text" placeholder="请输入你的邮箱地址 " required="">
                        </form>
                    </div>
                    <div class="btn-1">
                        <form>
                            <input type="submit" value="确定">
                        </form>
                    </div>
                    <div class="clearfix"> </div>
                </div>

            </div>
            <div class="col-md-3 amet-sed ">
                <h4>联系我们</h4>
                <p>QQ:782851065</p>
                <p>Email:782851065@qq.com</p>
                <p>Tel :+86 153-1606-9007</p>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <div class="footer-class">
        <p>Copyright &copy; 2017.Team of XiaoMing. All rights reserved.</p>
    </div>
</div>

<%
    String mess=(String)session.getAttribute("signinmessage");
    if(mess!=null) {%>
<script type="text/javascript">
    alert("<%=mess%>");
</script>
<%
        session.removeAttribute("signinmessage");}
%>

</body>
</html>

