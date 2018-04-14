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

				<li><a class="total" href="logout.do">欢迎登录：<%=Cname%></a></li>

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
<!-- products -->
	<!-- grow -->
	<div class="grow">
		<div class="container">
			<h2>房间选择</h2>
		</div>
	</div>
	<!-- grow -->
	<div class="pro-du">
		<div class="container">
			<div class="col-md-9 product1">
				<div class=" bottom-product">
					<div class="col-md-6 bottom-cd simpleCart_shelfItem">
						<div class="product-at ">
							<a href="single1.jsp"><img class="img-responsive" src="images/t1.jpg" alt="">
							<div class="pro-grid">
										<span class="buy-in">查看</span>
							</div>
						</a>	
						</div>
						<p class="tun"><span>舒适双人房</span><br>Standard Room</p>
						<div class="ca-rt">
							<a href="#" class="item_add"><p class="number item_price"><i> </i>¥500.00</p></a>						
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="col-md-6 bottom-cd simpleCart_shelfItem">
						<div class="product-at ">
							<a href="single2.jsp"><img class="img-responsive" src="images/pi5.jpg" alt="">
							<div class="pro-grid">
										<span class="buy-in">查看</span>
							</div>
						</a>	
						</div>
						<p class="tun"><span>精品大床房</span><br>Classic Room</p>
						<div class="ca-rt">
							<a href="#" class="item_add"><p class="number item_price"><i> </i>¥500.00</p></a>						
						</div>
						<div class="clearfix"></div>					
					</div>
						<div class="clearfix"> </div>
				</div>
				<div class=" bottom-product">
					<div class="col-md-6 bottom-cd simpleCart_shelfItem">
						<div class="product-at ">
							<a href="single3.jsp"><img class="img-responsive" src="images/t3.jpg" alt="">
							<div class="pro-grid">
										<span class="buy-in">查看</span>
							</div>
						</a>	
						</div>
						<p class="tun"><span>精品单人间</span><br>Single-Room</p>
						<div class="ca-rt">
							<a href="#" class="item_add"><p class="number item_price"><i> </i>¥500.00</p></a>						
						</div>
						<div class="clearfix"></div>					
					</div>
					<div class="col-md-6 bottom-cd simpleCart_shelfItem">
						<div class="product-at ">
							<a href="single4.jsp"><img class="img-responsive" src="images/t4.jpg" alt="">
							<div class="pro-grid">
										<span class="buy-in">查看</span>
							</div>
						</a>	
						</div>
						<p class="tun"><span>舒适大床房</span><br>Suite</p>
						<div class="ca-rt">
							<a href="#" class="item_add"><p class="number item_price"><i> </i>¥500.00</p></a>						
						</div>
						<div class="clearfix"></div>					
					</div>
					<div class="clearfix"> </div>
				</div>
					
				
				</div>
			<div class="col-md-3 prod-rgt">
				<div class=" pro-tp">
					<div class="pl-lft">
						<a href="single5.jsp"><img class="img-responsive" src="images/pi.jpg" alt=""></a>
					</div>
					<div class="pl-rgt">
						<h6><a href="single5.jsp">欧式大床房</a></h6>
						<p><a href="single5.jsp">¥400.00</a></p>
					</div>
						<div class="clearfix"></div>
				</div>
				<div class=" pro-tp">
					<div class="pl-lft">
						<a href="single6.jsp"><img class="img-responsive" src="images/pi1.jpg" alt=""></a>
					</div>
					<div class="pl-rgt">
						<h6><a href="single6.jsp">经典大床房</a></h6>
						<p><a href="single6.jsp">¥300.00</a></p>
					</div>
						<div class="clearfix"></div>
				</div>
				<div class=" pro-tp">
					<div class="pl-lft">
						<a href="single7.jsp"><img class="img-responsive" src="images/pi2.jpg" alt=""></a>
					</div>
					<div class="pl-rgt">
						<h6><a href="single7.jsp">经典单人间</a></h6>
						<p><a href="single7.jsp">¥250.00</a></p>
					</div>
						<div class="clearfix"></div>
				</div>
				<div class="pr-btm">
				<h4>看看住过的人怎么说</h4>
					<img class="img-responsive" src="images/timg.jpg" alt="">
					<h6>猪嬲的</h6>
					<p>AsHome的精品大床房是我住过最舒服的大床房，无论是它枕头的质地，还是床板的结实程度，都让我一生难忘。希望下次还能住到这么好的大床房哼</p>
				</div>
			</div>
				<div class="clearfix"></div>
		</div>
	</div>
<!-- products -->
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
</body>
</html>
			