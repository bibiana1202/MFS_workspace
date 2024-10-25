<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Cookie</title>
</head>
<body>
	<%
		Cookie[] cookies = request.getCookies();

		for (int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals("userID")){
				cookies[i].setMaxAge(0);			
			}
			response.addCookie(cookies[i]);
		}
		response.sendRedirect("cookie02.jsp");
	%>
</body>
</html>