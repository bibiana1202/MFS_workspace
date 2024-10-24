<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import ="java.io.*,java.util.*"%>
<html>
<head>
<title>Form Processing</title>
</head>
<body>
    <table border ="1">
        <tr>
            <th>요청 파라미터 이름</th>
            <th>요청 파라미터 값</th>
        </tr>
        <%-- <%
            Enumeration paramNames = request.getParameterNames();
            while (paramNames.hasMoreElements()) {
                String name = (String) paramNames.nextElement();
                out.print("<tr><td>" + name + " </td>\n");
                String paramValue = request.getParameter(name);
                out.println("<td> " + paramValue + "</td></tr>\n");
            }
        %> --%>
        
        <%
        	if(request.getParameter("reading") != null){
	        	String reading = request.getParameter("reading");
	        	out.print("<tr><td>독서 </td>\n");
	        	out.print("<td> " + reading + "</td></tr>\n");        		
        	}
        	if(request.getParameter("exercise") != null){
	        	String exercise = request.getParameter("exercise");
	        	out.print("<tr><td>운동 </td>\n");
	        	out.print("<td> " + exercise + "</td></tr>\n");        		
	    	}
        	if(request.getParameter("movie") != null){
	        	String movie = request.getParameter("movie");
	        	out.print("<tr><td>영화 </td>\n");
	        	out.print("<td> " + movie + "</td></tr>\n");        		
	    	}
        %>
    </table>
</body>
</html>