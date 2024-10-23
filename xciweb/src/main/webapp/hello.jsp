<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Hello Servlet/JSP, 뷁</h1>
<%
	out.println(dice());
	myprint(out);
%>
</body>
</html>
<%!
	public int dice(){
		return (int)(Math.random() * 6 ) + 1;
	}

	public void myprint(JspWriter out) throws IOException{
		out.println("Hello declaration");
	}
%>