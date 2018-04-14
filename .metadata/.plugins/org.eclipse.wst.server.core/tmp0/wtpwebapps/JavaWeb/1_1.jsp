<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
int x=1,y=2,z=3,m=4;
application.setAttribute("1",x);
session.setAttribute("2",y);
request.setAttribute("3",z);
//pageContext.forward("1_2.jsp");
pageContext.setAttribute("4", m);
%>
</body>
</html>