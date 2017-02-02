<%@page pageEncoding="UTF-8" import="java.sql.*, javax.sql.*, javax.naming.*, javax.persistence.*, java.util.* "%>
<!DOCTYPE HTML>
<html lang="pt-br">
<head>
	<meta charset="UTF-8"> 
	<title>Now are <%=new java.util.Date()%></title>
<head>
</head>
<body>
Hello <b><%="${UserName}"%></b>
</body>
</html>
