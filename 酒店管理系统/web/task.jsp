<%@ page import="admin.orderbean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>As Home</title>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Edmin</title>
	<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
</head>
<body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                        <i class="icon-reorder shaded"></i></a><a class="brand" href="admin.do">主页 </a>
                        <div class="nav-collapse collapse navbar-inverse-collapse">
                        <ul class="nav nav-icons">
                            <li class="active"><a href="#"><i class="icon-envelope"></i></a></li>
                            <li><a href="#"><i class="icon-eye-open"></i></a></li>
                            <li><a href="#"><i class="icon-bar-chart"></i></a></li>
                        </ul>
                            <ul class="nav pull-right">

                                <li class="nav-user dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="images/user.png" class="nav-avatar" />
                                    <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="message.do">留言板</a></li>
                                        <li><a href="task.do">订单</a></li>
                                        <li><a href="form.jsp">注册管理</a></li>
										<li><a href="alluser.do">c 当前所有用户 </a></li>
                                        <li class="divider"></li>
                                        <li><a href="index.jsp">退出</a></li>
                                    </ul>
                                </li>
                            </ul>
                    </div>
                    <!-- /.nav-collapse -->
                </div>
            </div>
            <!-- /navbar-inner -->
        </div>
        <!-- /navbar -->
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="span2">
                        <div class="sidebar">
						   <ul class="widget widget-menu unstyled">
                                <li class="active"><a href="admin.do"><i class="menu-icon icon-dashboard"></i>住客信息
                                </a></li>
                                
                                <li><a href="message.do"><i class="menu-icon icon-inbox"></i>留言板</a></li>
                                <li><a href="task.do"><i class="menu-icon icon-tasks"></i>订单</a></li>
                            </ul>
                            <!--/.widget-nav-->
                            
                            
                            <ul class="widget widget-menu unstyled">
                          
                                <li><a href="form.jsp"><i class="menu-icon icon-paste"></i>注册管理 </a></li>
                                <li><a href="alluser.do"><i class="icon-inbox"></i>当前所有用户 </a></li>
                            </ul>
                            <!--/.widget-nav-->
                            <ul class="widget widget-menu unstyled">
                                <li><a href="index.jsp"><i class="menu-icon icon-signout"></i>退出 </a></li>
                            </ul>
                        </div>
                        <!--/.sidebar-->
                    </div>
                    <!--/.span3-->
				<div class="span10">
					<div class="content">
						<div class="module message">
							<div class="module-head">
								<h3>订单管理表</h3>
							</div>

							<div class="module-body table">

								<table class="table table-message">
									<thead>
									<tr>
										<th>订单编号                                               </th>
										<th>用户名                                                </th>
										<th>姓名                                                  </th>
										<th>身份证号                                             </th>
										<th>用户联系方式                                               </th>
										<th>订单信息                                                </th>
										<th>订单总价                                                </th>
										<th>房间号                                                </th>
										<th>开始时间</th>
										<th>结束时间</th>
										<th>订单状态                                                </th>
									</tr>
									</thead>

									<%
										int i=0;
									%>

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

											<%
												ArrayList<orderbean> orderbeanlist=new ArrayList<orderbean>();
												orderbeanlist=(ArrayList<orderbean>)request.getAttribute("orderbeanlist");

												if(orderbeanlist.get(i).getOstatus().equals("待审核")){

											%>

											<td>
											<form method="get" action="accept.do">
												<input type="hidden" name="Oid" value=${list.getOid()}>
												<a  onclick="submit()">接受</a>
											</form>
											</td>

											<td>
											<form method="get" action="refuse.do">
												<input type="hidden" name="Oid" value=${list.getOid()}>
												<a onclick="submit()">拒绝</a>
											</form>
											</td>

											<%
												}
												if (orderbeanlist.get(i).getOstatus().equals("已接收")){
											%>

											<td>
												<form method="get" action="checkout.do">
													<input type="hidden" name="Oid" value=${list.getOid()}>
													<a  onclick="submit()">退房</a>
												</form>
											</td>

											<%
												}else{}
												i++;
											%>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						
					</div><!--/.content-->
				</div><!--/.span9-->
			</div>
		</div><!--/.container-->
	</div><!--/.wrapper-->

	<div class="footer">
		<div class="container">
			 

		</div>
	</div>

	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
	<script src="scripts/datatables/jquery.dataTables.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.table-message tbody tr').click(
				function() 
				{
					$(this).toggleClass('resolved');
				}
			);
		} );
	</script>
</body>