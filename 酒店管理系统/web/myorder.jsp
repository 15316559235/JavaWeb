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
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
		  rel='stylesheet'>
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
<div class="container">

<div class="span11">
<div class="module message">
	<div class="module-head">
		<h3>我的订单</h3>
	</div>
<div class="module-body table">
<table class="table table-message">
	<thead>
	<tr>
		<th>订单编号</th>
		<th>用户名</th>
		<th>姓名</th>
		<th>身份证号</th>
		<th>用户联系方式</th>
		<th>订单信息</th>
		<th>订单总价</th>
		<th>房间号</th>
		<th>开始时间</th>
		<th>结束时间</th>
		<th>订单状态</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="list" items="${requestScope.orderbeanlist}"  varStatus="status">
		<tr>
			<td>${list.getOid()}</td>
			<td>${list.getOcid()}</td>
			<td>${list.getOcname()}</td>
			<td>${list.getOcnum()}</td>
			<td>${list.getOctel()}</td>
			<td>${list.getOinf()}</td>
			<td>${list.getOprice()}</td>
			<td>${list.getOrnum()}</td>
			<td>${list.getStarttime()}</td>
			<td>${list.getEndtime()}</td>
			<td>${list.getOstatus()}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>
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