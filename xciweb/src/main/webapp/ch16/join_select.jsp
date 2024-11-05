<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>				
		<table width="500" border="1">
			<tr>
				<th>사원명</th>
				<th>사수명</th>
				<th>급여</th>
				<th>등급</th>
				<th>부서명</th>
			</tr>
			<%
			ResultSet rs = null;			
			PreparedStatement pstmt = null;

			try {
				String sql = 
						"SELECT a.first_name       name"+
					    "  	   ,b.first_name       name_admin"+
					    "      ,a.salary           salary"+
					    "      ,c.grade_level      grade_level"+
					    "      ,d.department_name  department_name"+
						" FROM employees a , employees b , job_grades c, departments d"+
						" WHERE 1=1"+
						"	and a.manager_id = b.employee_id(+)"+
						"	and a.salary between c.lowest_sal and c.highest_sal"+
						"	and a.department_id = d.department_id(+)"; 
					

				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					String name = rs.getString("name");
					String name_admin = rs.getString("name_admin");
					String salary = rs.getString("salary");
					String grade_level = rs.getString("grade_level");
					String department_name = rs.getString("department_name");
			%>
			<tr>
				<td><%=name%></td>
				<td><%=name_admin%></td>
				<td><%=salary%></td>
				<td><%=grade_level%></td>
				<td><%=department_name%></td>
			</tr>
			<%
				}
			} catch (SQLException ex) {
				out.println("Member 테이블 호출이 실패했습니다.<br>");
				out.println("SQLException: " + ex.getMessage());
			} finally {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			}
			%>
	</table>
</body>
</html>