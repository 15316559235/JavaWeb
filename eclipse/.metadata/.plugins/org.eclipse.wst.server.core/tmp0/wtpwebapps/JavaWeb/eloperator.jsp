
<html><head>
<title>Expression Language Example</title>
</head>
<body>
<p>JSP Expression Language Example</p>
<table border="1">
  <tr><td>Expression</td><td>Value</td></tr>
  <tr><td>\${2+5}</td> <td>${2+5}</td></tr>
  <tr><td>\${4/5}</td><td>${4/5}</td></tr>
  <tr><td>\${5/6}</td><td>${5/6}</td></tr>
  <tr><td>\${5 mod 7}</td><td>${5 mod 7}</td></tr>
  <tr><td>\${2<3}</td><td>${2 < 3}</td></tr>
  <tr><td>\${2gt3}</td><td>${2 gt 3}</td></tr>
  <tr><td>\${3.1 le 3.2}</td><td>${3.1 le 3.2}</td></tr>
  <tr><td>\${(5>3)?5:3}</td><td>${(5>3)?5:3}</td></tr>
  <tr><td>\${empty null}</td><td>${empty null}</td></tr>
  <tr><td>\${empty param}</td><td>${empty param}</td></tr>
</table>
</body></html>
