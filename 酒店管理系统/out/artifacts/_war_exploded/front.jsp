<%--
  Created by IntelliJ IDEA.
  User: sc
  Date: 2018/1/1
  Time: 下午2:35
  To change this template use File | Settings | File Templates.
--%>
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
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
              rel='stylesheet'>
    </head>
<body>
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                <i class="icon-reorder shaded"></i></a><a class="brand" href="front.do">主页</a>
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
                            <li><a href="frontmessage.do">留言板</a></li>
                            <li><a href="fronttask.do">订单</a></li>
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
            <div class="span3">
                <div class="sidebar">
                    <ul class="widget widget-menu unstyled">
                        <li class="active"><a href="front.do"><i class="menu-icon icon-dashboard"></i>住客信息
                        </a></li>

                        <li><a href="frontmessage.do"><i class="menu-icon icon-inbox"></i>留言板
                        </a></li>
                        <li><a href="fronttask.do"><i class="menu-icon icon-tasks"></i>订单
                        </a></li>
                    </ul>
                    <!--/.widget-nav-->

                    </ul>
                    <!--/.widget-nav-->
                    <ul class="widget widget-menu unstyled">
                        <li><a href="index.jsp"><i class="menu-icon icon-signout"></i>退出 </a></li>
                    </ul>
                </div>
                <!--/.sidebar-->
            </div>
            <!--/.span3-->
            <div class="span9">
                <div class="content">
                    <div class="btn-controls">
                        <div class="btn-box-row row-fluid">

                            <a href="#" class="btn-box big span4"><i class="icon-user"></i><b>${requestScope.usernum}</b>
                                <p class="text-muted">
                                    用户</p>
                            </a><a href="#" class="btn-box big span4"><i class="icon-money"></i><b>${requestScope.messagenum}</b>
                            <p class="text-muted">
                                留言板</p>
                        </a>
                        </div>

                    </div>
                    <!--/#btn-controls-->
                    <div class="module">
                        <div class="module-head">
                            <h3>
                                图表形式</h3>
                        </div>
                        <div class="module-body">
                            <div class="chart inline-legend grid">
                                <div id="placeholder2" class="graph" style="height: 500px">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/.module-->
                    <div class="module hide">
                        <div class="module-head">
                            <h3>
                                Adjust Budget Range</h3>
                        </div>
                        <div class="module-body">
                            <div class="form-inline clearfix">
                                <a href="#" class="btn pull-right">Update</a>
                                <label for="amount">
                                    Price range:</label>
                                &nbsp;
                                <input type="text" id="amount" class="input-" />
                            </div>
                            <hr />
                            <div class="slider-range">
                            </div>
                        </div>
                    </div>

                    <div class="module">
                        <div class="module-head">
                            <h3>
                                表单</h3>
                        </div>
                        <div class="module-body table">
                            <table cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped	 display"
                                   width="100%">

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
                                    <th>订单状态                                                </th>
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
                                        <td>${list.getOstatus()}</td>
                                    </tr>
                                </c:forEach>

                                </tbody>

                            </table>
                        </div>
                    </div>
                    <!--/.module-->
                </div>
                <!--/.content-->
            </div>
            <!--/.span9-->
        </div>
    </div>
    <!--/.container-->
</div>
<!--/.wrapper-->
<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
<script src="scripts/flot/jquery.flot.resize.js" type="text/javascript"></script>
<script src="scripts/datatables/jquery.dataTables.js" type="text/javascript"></script>
<script src="scripts/common.js" type="text/javascript"></script>

</body>

