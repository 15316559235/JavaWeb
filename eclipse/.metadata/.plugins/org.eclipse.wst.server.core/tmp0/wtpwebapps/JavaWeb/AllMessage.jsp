<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.ArrayList" %>
<%@ page import="demo.messagebean" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>查看留言</title>
    <style type="text/css">
        .background{
            background:url(back9.jpg);
        }
        .text{
            overflow:auto;
            border:0;
        }
    </style>
</head>
<body>
<table border=""1>
<ul>
    <%
        ArrayList<messagebean> messagelist = (ArrayList<messagebean>)session.getAttribute("messagebeanlist");
        for(messagebean message:messagelist){
    %>
    <tr><td><%= message.getName() %></td>
        <td><%= message.getTitle() %></td>
        <td><%= message.getMessage() %></td></tr>
    <%
        }
    %>
</table>
</body>
</html>