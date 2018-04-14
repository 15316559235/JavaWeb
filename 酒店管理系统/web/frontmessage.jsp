<%--
  Created by IntelliJ IDEA.
  User: sc
  Date: 2018/1/1
  Time: 下午2:41
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
                <i class="icon-reorder shaded"></i></a><a class="brand" href="front.do">主页 </a>
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

                        <li><a href="frontmessage.do"><i class="menu-icon icon-inbox"></i>留言板 </a></li>
                        <li><a href="fronttask.do"><i class="menu-icon icon-tasks"></i>订单</a></li>
                    </ul>
                    <!--/.widget-nav-->


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
                    <div class="module message">
                        <div class="module-head">
                            <h3>
                                留言板</h3>
                        </div>

                        <div class="module-body table">
                            <table class="table table-message">

                                <thead>
                                <tr>
                                    <th>姓名                                              </th>
                                    <th>邮箱                                                </th>
                                    <th>主题                                                  </th>
                                    <th>内容                                             </th>

                                </tr>
                                </thead>

                                <tbody>

                                <c:forEach var="list" items="${requestScope.messagebeanlist}"  varStatus="status">
                                    <tr>
                                        <td>${list.getName()}</td>
                                        <td>${list.getMail()}</td>
                                        <td>${list.getSubject()}</td>
                                        <td>${list.getMessage()}</td>

                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="module-foot">
                        </div>
                    </div>
                </div>
                <!--/.content-->
            </div>
            <!--/.span9-->
        </div>
    </div>
    <!--/.container-->
</div>
<!--/.wrapper-->
<div class="footer">
    <div class="container">

    </div>
</div>
<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</body>
