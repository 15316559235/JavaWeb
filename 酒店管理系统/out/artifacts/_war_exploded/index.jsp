<%--
  Created by IntelliJ IDEA.
  User: sc
  Date: 2017/12/28
  Time: 下午9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>As Home</title>
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

                <%
                    String Cname=(String) session.getAttribute("Cname");
                    if(session.getAttribute("total")!=null) {
                        int total = (int) session.getAttribute("total");
                    }
                    if(Cname!=null){
                %>

                <li><a class="total" href="logout.do" >欢迎登录：<%=Cname%></a></li>

                <%
                    }
                %>

                <div class="ca-r">
                    <div class="cart box_1">
                        <a href="checkout.jsp">
                            <h3> <div class="total">
                                ¥
                                ${total}
                                <img src="images/cart.png" alt=""/></h3>
                        </a>


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

                    <li class="grid"><a class="color2" href="products.jsp">房间选择</a>
                    </li>
                    <li><a class="color6" href="contact.jsp">联系我们</a></li>
                    <%
                        if(Cname==null){
                    %>
                    <li><a class="color4" href="login.jsp">登录/注册</a></li>
                    <%
                        }else{
                    %>
                    <li><a class="color4" href="my.do">我的订单</a></li>
                    <%
                        }
                    %>

                    <li>&nbsp;</li>
                    <li>&nbsp;</li>
                </ul>
            </div>

            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<div class="banner">
    <div class="container">
        <script src="js/responsiveslides.min.js"></script>
        <script>
            $(function () {
                $("#slider").responsiveSlides({
                    auto: true,
                    nav: true,
                    speed: 500,
                    namespace: "callbacks",
                    pager: true,
                });
            });
        </script>
        <div  id="top" class="callbacks_container">
            <ul class="rslides" id="slider">
                <li>

                    <div class="banner-text">
                        <h3>欢迎预定AsHome精品酒店 </h3>
                        <p>AsHome精品酒店作为如家精品酒店的姊妹品牌，拥有着长达3个月的辉煌历史，期间接客无数，是您小寝一下的圣地</p>

                    </div>

                </li>
                <li>

                    <div class="banner-text">
                        <h3>多种房型供您选择</h3>
                        <p>AsHome精品酒店提供多达8种房型，无论您想找个地方偷偷释放自己，还是约到了同学和您大吉大利晚上吃鸡，我们都有合适的房间提供给您</p>


                    </div>

                </li>
                <li>
                    <div class="banner-text">
                        <h3>得天独厚的地理位置</h3>
                        <p>AsHome精品酒店是一个坐落于上海理工大学军工路校区内的小窝，只要你充钱，我们便可让您享受如同足不出户般的开房体验</p>


                    </div>

                </li>
            </ul>
        </div>

    </div>
</div>

<!--content-->
<div class="container">
    <div class="cont">
        <div class="content">
            <div class="content-top-bottom">
                <h2>多种房间任您选择</h2>
                <div class="col-md-6 men">
                    <a href="single1.jsp" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="images/t1.jpg" alt="">
                        <div class="b-wrapper">
                            <h3 class="b-animate b-from-top top-in   b-delay03 "> <span>舒适双人房</span> </h3>
                        </div>
                    </a>


                </div>
                <div class="col-md-6">
                    <div class="col-md1 ">
                        <a href="single2.jsp" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="images/t2.jpg" alt="">
                            <div class="b-wrapper">
                                <h3 class="b-animate b-from-top top-in1   b-delay03 "> <span>精品大床房</span> </h3>
                            </div>
                        </a>

                    </div>
                    <div class="col-md2">
                        <div class="col-md-6 men1">
                            <a href="single3.jsp" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="images/t3.jpg" alt="">
                                <div class="b-wrapper">
                                    <h3 class="b-animate b-from-top top-in2   b-delay03 ">
                                        <span>精品单人间</span>
                                    </h3>
                                </div>
                            </a>

                        </div>
                        <div class="col-md-6 men2">
                            <a href="single4.jsp" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="images/t4.jpg" alt="">
                                <div class="b-wrapper">
                                    <h3 class="b-animate b-from-top top-in2   b-delay03 ">
                                        <span>舒适大床房</span>
                                    </h3>
                                </div>
                            </a>

                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="content-top">
                <h1>更多选择</h1>
                <div class="grid-in">
                    <div class="col-md-3 grid-top simpleCart_shelfItem">
                        <a href="single5.jsp" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="images/pi.jpg" alt="">
                            <div class="b-wrapper">
                                <h3 class="b-animate b-from-left    b-delay03 "> <span>欧式大床房</span> </h3>
                            </div>
                        </a>
                        <p><a href="single5	.jsp">欧式大床房</a></p>
                        <a href="#" class="item_add"><p class="number item_price"><i> </i>¥400.00</p></a>
                    </div>
                    <div class="col-md-3 grid-top simpleCart_shelfItem">
                        <a href="single6.jsp" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="images/pi1.jpg" alt="">
                            <div class="b-wrapper">
                                <h3 class="b-animate b-from-left    b-delay03 "> <span>经典大床房</span> </h3>
                            </div>
                        </a>
                        <p><a href="single6.jsp">经典大床房</a></p>
                        <a href="#" class="item_add"><p class="number item_price"><i> </i>¥300.00</p></a>
                    </div>
                    <div class="col-md-3 grid-top simpleCart_shelfItem">
                        <a href="single7.jsp" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="images/pi2.jpg" alt="">
                            <div class="b-wrapper">
                                <h3 class="b-animate b-from-left    b-delay03 "> <span>经典单人间</span> </h3>
                            </div>
                        </a>
                        <p><a href="single7.jsp">经典单人间</a></p>
                        <a href="#" class="item_add"><p class="number item_price"><i> </i>¥250.00</p></a>
                    </div>
                    <div class="col-md-3 grid-top">
                        <a href="single8.jsp" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="images/pi4.jpg" alt="">
                            <div class="b-wrapper">
                                <h3 class="b-animate b-from-left    b-delay03 "> <span>舒适单人间</span> </h3>
                            </div>
                        </a>
                        <p><a href="single8.jsp">舒适单人间</a></p>
                        <a href="#" class="item_add"><p class="number item_price"><i> </i>¥250.00</p></a>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!----->
    </div>
    <!---->
</div>
<div class="footer">
    <div class="container">
        <div class="footer-top-at">

            <div class="col-md-3 amet-sed">
                <h4>更多信息</h4>
                <ul class="nav-bottom">
                    <li><a href="#">如何预订</a></li>
                    <li><a href="#">常见问题</a></li>
                    <li><a href="contact.jsp">酒店地址</a></li>
                    <li><a href="login.jsp">会员信息</a></li>
                </ul>
            </div>
            <div class="col-md-3 amet-sed">
                <h4>目录</h4>
                <ul class="nav-bottom">
                    <li><a href="index.jsp">回到首页</a></li>
                    <li><a href="products.jsp">房间信息</a></li>
                    <li><a href="login.jdp">登录注册</a></li>
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
</body>
</html>

