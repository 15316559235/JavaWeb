<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="a" type="demo.s" scope="session"/>
<html><head> <title>显示信息</title></head>
<body>
<h4>信息如下</h4>
<table border="1">
<tr>
<td>长:</td>
<td><jsp:getProperty name="a" property="chang"/></td>
</tr>
<tr>
<td>宽:</td>
<td><jsp:getProperty name="a" property="kuan"/></td>
</tr>
<tr>
<td>面积:</td>
<td><jsp:getProperty name="a" property="s"/></td>
</tr>
</table>
</body></html>