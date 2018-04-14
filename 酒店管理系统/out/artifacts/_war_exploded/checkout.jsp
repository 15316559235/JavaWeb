<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
					int total=0;
					if(session.getAttribute("total")!=null) {
						total = (int) session.getAttribute("total");
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
			<h2>结算</h2>
		</div>
	</div>
	<!-- grow -->
<div class="container">
	<div class="check">	 
			 <h1>我的订单</h1>

		<c:forEach var="list" items="${sessionScope.singlebeanlist}"  varStatus="status">

		  <div class="col-md-9 cart-items">

				 <div class="cart-sec simpleCart_shelfItem">
						<div class="cart-item cyc">
							 <img src=${list.getRimg()} class="img-responsive" alt=""/>
						</div>
					   <div class="cart-item-info">
						   <li><p>${list.getRname()}</p></li>

						    <form action="delete.do" method="post" >
							   <input type = "hidden" name = "Rid" value=${list.getRid()}>
							   <input type = "image" src = "images/close_1.png" onClick="submit()" align="right">
						   </form>

						<ul class="qty">
							<li><p>数量 : 1</p></li>
						</ul>

						
							 <div class="delivery">
							 <p>服务费 : RMB¥100.00</p>
							 <span>预定成功后不退不换，请安排好自己的行程</span>
							 <div class="clearfix"></div>
				        </div>	
					   </div>
					   <div class="clearfix"></div>
											
				  </div>
			 </div>
		  </div>

		</c:forEach>



		  <div class="col-md-3 cart-total">
			 <a class="continue" href="products.jsp">再逛逛</a>
			 <div class="price-details">
				 <h3>价格明细</h3>
				 <span>总价</span>
				 <span class="total1">--${total}-</span>
				 <span>服务费</span>
				 <%
					 if(total==0){
				 %>
				 <span class="total1">--0-</span>
				 <%
				 }
				 else{
				 %>
				 <span class="total1">--100-</span>
				 <%
					 }
				 %>
				 <div class="clearfix"></div>				 
			 </div>	
			 <ul class="total_price">
			   <li class="last_price"> <h4>TOTAL</h4></li>
				 <%
					 if(total==0){
				 %>
			   <li class="last_price"><span>--0-</span></li>
				 <%
					 }
					 else{
				 %>
				 <li class="last_price"><span>--${total+100}-</span></li>
				 <%
					 }
				 %>
			   <div class="clearfix"> </div>
			 </ul>

			  <form method="post" action="check.do">
			  <div class="clearfix"></div>
			 <a class="order" onclick="submit()">我已确认价格信息</a>
			 <div class="total-item">
			 </div>
			  </form>


			 </div>
			</div>
		
			<div class="clearfix"> </div>
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

<%
	String mess=(String)session.getAttribute("checkmessage");
	if(mess!=null) {%>
<script type="text/javascript">
    alert("<%=mess%>");
</script>
<%
		session.removeAttribute("checkmessage");}
%>

</body>
</html>
			