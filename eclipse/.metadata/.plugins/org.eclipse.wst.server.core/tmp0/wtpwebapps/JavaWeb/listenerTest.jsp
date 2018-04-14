<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*,javax.sql.*" %>
<% 
   DataSource dataSource =
      (DataSource)application.getAttribute("dataSource");
   Connection conn = dataSource.getConnection();
   Statement stmt = conn.createStatement();
   ResultSet rs = stmt.executeQuery("SELECT * FROM student");
%>
<html><head><title>Listener Demo</title></head>
<body>
<h4>商品表中信息</h4>
<table border="1">
<tr><td>id号</td><td>姓名</td><td>班级ID</td></tr>
<% while(rs.next()){%>
	
<tr>
	<td> <%=  rs.getInt("id") %></td>
	<td> <%= rs.getString("stuname") %></td>
	<td> <%= rs.getInt("classid")%></td>
	
<% } %>

        
        
</table>
</body>
</html>
