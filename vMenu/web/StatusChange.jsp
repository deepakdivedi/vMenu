<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
	Statement st = con.createStatement();
	String oids = request.getParameter("orderids");
	String[] orders = oids.split(",");
	for (int i = 0; i < orders.length; i++) {
		st.executeUpdate("update ordr set status='served' where o_id=" + orders[i] + "");
	}
	response.sendRedirect("Staff_page.jsp");
	%>
</body>
</html>
