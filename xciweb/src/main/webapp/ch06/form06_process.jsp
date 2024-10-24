<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.*,java.util.*"%>
<html>
<head>
<title>Form Processing</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>요청 파라미터 이름</th>
			<th>요청 파라미터 값</th>
		</tr>
		<%--
		
			request.setCharacterEncoding("UTF-8");
			
 			Enumeration paramNames = request.getParameterNames();
			while (paramNames.hasMoreElements()) {
				String name = (String) paramNames.nextElement();
				out.print("<tr><td>" + name + " </td>\n");
				String paramValue = request.getParameter(name);
				out.println("<td> " + paramValue + "</td></tr>\n");
			} */
		--%>
		<%	
		    Map<String,String[]> paramMap = request.getParameterMap();
		    for(String key:paramMap.keySet()) {
		        String[] values = paramMap.get(key);
		        if(values.length == 1){
	                out.println("<tr><td>" +key + " :</td><td> " + values[0] + "</td></tr>");                

		        }
		        else if(values.length >1){
		           for(int i=0; i < values.length; i++) {
		                out.println("<tr><td>" +key + "[" + i + "] :</td><td> " + values[i] + "</td></tr>");                
		            }		        	
		        }
		       
		    }
		%>
	</table>
</body>
</html>