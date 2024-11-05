<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   long pg = 1;
   if (request.getParameter("pg") != null) {
      pg = Long.parseLong(request.getParameter("pg"));
   }
   long pageSize = 10;
   long startNum = (pg - 1) * pageSize + 1;
   long endNum = pg * pageSize;
   
   String sqlTotalCount = "select count(*) as cnt from board";
   
   String sql = """
         select B.*
         from   (select rownum as rnum, A.*
                 from   (select no, title, re,
                                to_char(regdate,'YYYY-MM-DD hh24:mi:ss') as regdate
                         from board
                         order by no desc) A) B 
         where rnum between ? and ?
   """;
   String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";
   String user = "ace";
   String password = "ace";

   Class.forName("oracle.jdbc.OracleDriver");
   
   long totalCount = 0;
   try (Connection conn = DriverManager.getConnection(url,user,password);
      PreparedStatement pstmt = conn.prepareStatement(sqlTotalCount);
      ResultSet rs = pstmt.executeQuery();) {
      if (rs.next()) {
         totalCount = rs.getLong("cnt");
      }
   }
   long totalPage = totalCount / pageSize;
   if (totalCount % pageSize != 0) totalPage++;
   int blockSize = 10;
   long startPage = (pg - 1) / blockSize * blockSize + 1;
   long endPage   = (pg - 1) / blockSize * blockSize + blockSize;
   if (endPage > totalPage) endPage=totalPage;
   
   try (Connection conn = DriverManager.getConnection(url,user,password);
       PreparedStatement pstmt = conn.prepareStatement(sql);){
       pstmt.setLong(1, startNum);
       pstmt.setLong(2, endNum);
       
       try (ResultSet rs = pstmt.executeQuery()) { %>
<table border="1">
<tr>
   <th>글번호</th>
   <th>제목</th>
   <th>조회수</th>
   <th>날짜</th>
</tr>      
<%         while(rs.next()){ %>
<tr>
   <td><%=rs.getLong("no") %></td>
   <td><%=rs.getString("title") %></td>
   <td><%=rs.getInt("re") %></td>
   <td><%=rs.getString("regdate") %></td>
</tr>
<%         }
      }
   } catch(Exception e) {
      e.printStackTrace();
   }
%>
</table><br/>
<%    if (startPage > 1) { %>
   		<a href="list.jsp?pg=<%=startPage - 1 %>">이전</a>   
<%    } %>

<%   for(long p=startPage; p <= endPage; p++) { %>
	   <%if (p == pg) out.println(p); %>
	   <%if (p != pg) { %><a href="list.jsp?pg=<%=p%>"><%=p %></a><% } %>
<%    } 
   	  if (totalPage > endPage) { %>
   		<a href="list.jsp?pg=<%=endPage + 1 %>">다음</a>
<%    } %>
</body>
</html>