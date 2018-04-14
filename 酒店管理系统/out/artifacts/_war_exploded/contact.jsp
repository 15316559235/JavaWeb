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
	<!-- grow -->
	<div class="grow">
		<div class="container">
			<h2>联系我们</h2>
		</div>
	</div>
	<!-- grow -->
<!--content-->
<div class="contact">
			
			<div class="container">
			<div class="contact-form">
				
				<div class="col-md-8 contact-grid">
					<form method="post" action="message.do">
						<input type="text" value="您的称呼" name="Name" >
						<input type="text" value="Email" name="Mail" >
						<input type="text" value="主题" name="Subject" >
						
						<textarea cols="77" rows="6" name="Message" ></textarea>
						<div class="send">
							<input type="submit" value="发送">
						</div>
					</form>
				</div>
				<div class="col-md-4 contact-in">

						<div class="address-more">
						<h4>地址</h4>
							<p>上海理工大学</p>
							<p>军工路516号、580号</p>
							<p>第三学生公寓3号楼. </p>
						</div>
						<div class="address-more">
						<h4>联系方式</h4>
							<p>Tel:+86153-1606-9007</p>
							<p>QQ：782851065</p>
							<p>Email:<a href="mailto:782851065@qq.com"> 782851065@qq.com</a></p>
						</div>
					
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="map">
				<iframe src="map.html" width="600" height="600" frameborder="0" scrolling="no"></iframe>
			</div>
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
			