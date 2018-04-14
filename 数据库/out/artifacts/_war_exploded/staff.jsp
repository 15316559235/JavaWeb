<%--
  Created by IntelliJ IDEA.
  User: sc
  Date: 2018/1/4
  Time: 下午2:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title></title>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>
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
                        <li class="active"><a href="#"><i class="menu-icon icon-dashboard"></i>线路信息
                        </a></li>

                        <li><a href="staff.do"><i class="menu-icon icon-inbox"></i>导游信息</a></li>
                        <li><a href="customer.do"><i class="menu-icon icon-tasks"></i>游客信息</a></li>
                    </ul>
                    <!--/.widget-nav-->


                    <ul class="widget widget-menu unstyled">

                        <li><a href="#"><i class="menu-icon icon-paste"></i>分类账 </a></li>
                        <li><a href="#"><i class="icon-inbox"></i>总账 </a></li>
                    </ul>
                    <!--/.widget-nav-->
                    <ul class="widget widget-menu unstyled">
                        <li><a href="#"><i class="menu-icon icon-signout"></i>退出 </a></li>
                    </ul>
                </div>
                <!--/.sidebar-->
            </div>
            <!--/.span3-->
            <div class="span9">
                <div class="content">
                    <div class="module message">
                        <div class="module-head">
                            <h3>订单管理表</h3>
                        </div>

                        <div class="module-body table">

                            <table class="table table-message">
                                <thead>
                                <tr>
                                    <th>guide_id                                              </th>
                                    <th>guide_name                                              </th>
                                    <th>ggrade                                                 </th>
                                    <th>identify                                            </th>
                                    <th>branch_id                                             </th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="list" items="${requestScope.staffbeanArrayList}"  varStatus="status">
                                    <tr>
                                        <td>${list.getid()}</td>
                                        <td>${list.getGname()}</td>
                                        <td>${list.getGgrade()}</td>
                                        <td>${list.getGidentify()}</td>
                                        <td>${list.getBranch_id()}</td>
                                        <td>
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
