<%@ page import="java.sql.*"%>
<%
	Connection conn = null;

	/* String url = "jdbc:mysql://localhost:3306/JSPBookDB";
	String user = "root";
	String password = "1234";

	Class.forName("com.mysql.jdbc.Driver"); */
	String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";
	String user = "ace";
	String password = "ace";

	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, password);
%>