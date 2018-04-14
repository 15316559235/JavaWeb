<%--
  Created by IntelliJ IDEA.
  User: sc
  Date: 2018/3/28
  Time: 上午11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">


<head>
  <title>Bank</title>
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
      <div class="nav-collapse collapse navbar-inverse-collapse">
        <ul class="nav nav-icons">
          <li class="active"><a href="#"><i class="icon-envelope"></i></a></li>
          <li><a href="#"><i class="icon-eye-open"></i></a></li>
          <li><a href="#"><i class="icon-bar-chart"></i></a></li>
        </ul>
        <ul class="nav pull-right">
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
        <!--/.sidebar-->
      </div>
      <!--/.span3-->

      <div class="span6">
        <div class="content">

          <div class="module">
            <div class="module-head">
              <h3>添加</h3>
            </div>
            <div class="module-body">

              <form class="form-horizontal row-fluid" action="login.do" method="post">
                <div class="control-group">
                  <label class="control-label" for="basicinput">银行账户</label>
                  <div class="controls">
                    <input type="text" placeholder="请输入账户" class="span8 tip" name="Username">
                    <input type="password" placeholder="请输入密码" class="span8 tip" name="Password">
                  </div>
                </div>
                <div class="control-group">
                  <div class="controls">
                    <button type="submit" class="btn">提交</button>
                  </div>
                </div>
              </form>
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

<%
  String mess=(String)session.getAttribute("loginmessage");
  if(mess!=null) {%>
<script type="text/javascript">
    alert("<%=mess%>");
</script>
<%
    session.removeAttribute("loginmessage");}
%>

</body>
</html>