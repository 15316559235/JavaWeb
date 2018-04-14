<%--
  Created by IntelliJ IDEA.
  User: sc
  Date: 2017/12/18
  Time: 下午4:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>注册页面</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/login.css" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
</head>
<body>
<div class="page">
    <div class="loginwarrp">
        <div class="logo">注册</div>
        <div class="login_form">
            <form id="Login" name="Login" method="post" onsubmit="" action="signin.do">

                <li class="login-item">
                    <span>用户名：</span>
                    <input type="text" id="username" name="Username" class="login_input" >
                    <span id="count-msg" class="error"></span>
                </li>
                <li class="login-item">
                    <span>密　码：</span>
                    <input type="password" id="password" name="Password" class="login_input" >
                    <span id="password-msg" class="error"></span>
                </li>
                <li class="login-item">
                    <span>确认密码：</span>
                    <input type="password" id="repassword" name="Repassword" class="login_input" >
                    <span id="password-msg" class="error"></span>
                </li>
                <select name="Type" id="s1_text1_term">
                    <option selected="" value="0">公司用户</option>
                    <option value="1">个人用户</option>
                    <li class="login-item verify">
                        <input type="text" name="CheckCode" class="login_input verify_input">
                    </li>

                    <div class="clearfix"></div>
                    <li class="login-sub">
                        <input type="submit" name="Submit" value="注册" />
                        <input type="reset" name="Reset" value="重置" />
                    </li>
                </select>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    window.onload = function() {
        var config = {
            vx : 4,
            vy : 4,
            height : 2,
            width : 2,
            count : 100,
            color : "121, 162, 185",
            stroke : "100, 200, 180",
            dist : 6000,
            e_dist : 20000,
            max_conn : 10
        }
        CanvasParticle(config);
    }

</script>
<script type="text/javascript" src="js/canvas-particle.js"></script>

<%
    String mess=(String)session.getAttribute("message");
    if(mess!=null) {%>
<script type="text/javascript">
    alert("<%=mess%>");
</script>
<%
session.removeAttribute("message");}
%>

</body>
</html>


