<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지에 문제가 있습니다.</title>
</head>
<body>
	<h1 align="center"><%=msg%></h1>
</body>
</html>