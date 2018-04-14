<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<% 
String username = request.getParameter("username");
String password = request.getParameter("password");
out.println("<html><body>");
if("admin".equals(username)&& "admin".equals(password)){
	out.println("登录成功！欢迎您， "+username);    
}else{
	out.println("对不起！您的用户名或密码不正确．");
	}   
%>

</body>
</html>