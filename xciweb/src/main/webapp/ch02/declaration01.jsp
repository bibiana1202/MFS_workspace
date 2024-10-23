<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%! int data = 0; %>
	<%
		data++; // 내부 쓰레드로 처리되며 값 공유됨.
		out.println("Value of the variable is : "+data);
	%>
</body>
</html>