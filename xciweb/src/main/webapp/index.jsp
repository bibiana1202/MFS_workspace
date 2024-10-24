<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ol>
	<li><a href ="basic/calendar.jsp">달력</a></li>
	<li><a href ="hello">첫번째 서블릿</a></li>
	<li><a href ="greeting">Greeting 서블릿</a></li>
</ol>
<% response.sendRedirect("hello"); %>
</body>
</html>