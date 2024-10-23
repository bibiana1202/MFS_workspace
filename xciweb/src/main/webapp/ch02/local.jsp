<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% int data = 0; %>
	<%
		data++; // 로컬 변수라 값 공유가 안됨.
		out.println("local variable of the variable is : "+data);
	%>
</body>
</html>