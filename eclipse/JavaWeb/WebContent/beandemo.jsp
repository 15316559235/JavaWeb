<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>访问JavaBeans的属性</title></head>
<body>
<h4>使用EL访问JavaBeans的属性</h4>
<ul>
  <li>员工名：${employee.empName}</li>
  <li>Email地址：${employee.email}</li>
  <li>电话：${employee.phone}</li>
  <li>客户地址：
  <ul>
    <li>城市：${employee.address.city}</li>
   
    <li>邮编：${employee.address.zipCode}</li>
  </ul>
</ul>
</body></html> 
