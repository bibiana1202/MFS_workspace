<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Cookie</title>
</head>
<body>
	<%
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("passwd");

		if (user_id.equals("admin") && user_pw.equals("1234")) {
			Cookie cookie_id = new Cookie("userID", user_id);
			cookie_id.setMaxAge(10); // 쿠키의 유효기간을 결정하는
			Cookie cookie_pw = new Cookie("userPW", user_pw);
			cookie_pw.setMaxAge(40);
			response.addCookie(cookie_id);
			response.addCookie(cookie_pw);
			out.println("쿠기 생성이 성공했습니다<br>");
			out.println(user_id + "님 환영합니다");
		} else {
			out.println("쿠키 생성이 실패했습니다");
		}
	%>
</body>
</html>