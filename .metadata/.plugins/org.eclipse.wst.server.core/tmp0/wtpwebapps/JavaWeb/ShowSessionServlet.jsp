<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 

      String heading = null;
      // 从会话对象中检索accessCount属性
Integer accessCount = (Integer)session.getAttribute("accessCount");
      if(accessCount==null){
           accessCount = new Integer(1);
     	 heading = "欢迎您，首次登录该页面！";
      }else{
     	 heading = "欢迎您，再次访问该页面！";
     	 accessCount = accessCount+1;
      }
      // 将accessCount作为属性存储到会话对象中
      session.setAttribute("accessCount",accessCount);
      out.println("<html><head>");
      out.println("<title>会话跟踪示例</title></head>");
      out.println("<body><center>");
      out.println("<h4>"+heading
+"<a href='http://localhost:8080/JavaWeb/ShowSessionServlet.jsp'>再次访问</a>"+"</h4>");
      out.println("<table border='0'>");
      out.println("<tr bgcolor=\"ffad00\"><td>信息</td><td>值</td>\n");
      String state = session.isNew()?"新会话":"旧会话";
      out.println("<tr><td>会话状态：<td>"+state+"\n");
      out.println("<tr><td>会话ID:<td>"+session.getId()+"\n");
      out.println("<tr><td>创建时间:<td>");
      out.println(""+new Date(session.getCreationTime())+"\n");
      out.println("<tr><td>最近访问时间:<td>");
      out.println(""+new Date(session.getLastAccessedTime())+"\n");
      out.println("<tr><td>最大不活动时间:<td>"+
session.getMaxInactiveInterval()+"\n");
      out.println("<tr><td>Cookie:<td>"+request.getHeader("Cookie")+"\n");
      out.println("<tr><td>已被访问次数:<td>"+accessCount+"\n");
      out.println("</table>");
      out.println("</center></body></html>");
%>

</body>
</html>