<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Session</title>
</head>
<body>
	<%
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("passwd");

		if (user_id.equals("admin") && user_pw.equals("1234")) {
			session.setMaxInactiveInterval(10); // 10초 동안 세션 정보가 남아있음 => 10초뒤에 다시 새로고침하면 세션값이 달라져있음!
			session.setAttribute("userID", user_id);
			session.setAttribute("userPW", user_pw);
			out.println("세션 설정이 성공했습니다<br>");
			out.println(user_id+"님 환영합니다");
		} else {
			out.println("세션 설정이 실패했습니다");
		}
	%>
</body>
</html>