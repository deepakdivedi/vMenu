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
	Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	ResultSet rs = null;
	String id = request.getParameter("menuids");
	String qty = request.getParameter("menuqtys");
	String[] menu_id = id.split(",");
	String[] menu_qty = qty.split(",");
	float quantity, cost, total;
	int ord = 1;
	rs = st.executeQuery("select * from ordr");
	if (rs.last())
		ord = rs.getInt("o_id") + 1;
	String name;
	String cust_id = (String) session.getAttribute("customer_id");
	String table_no = (String) session.getAttribute("table_no");
	for (int i = 0; i < menu_id.length; i++) {
		if (!menu_id[i].equals("0")) {
			rs = st.executeQuery("select * from menu_items where m_id=" + menu_id[i]);
			rs.next();
			name = rs.getString("m_name");
			cost = rs.getFloat("m_cost");
			quantity = Float.parseFloat(menu_qty[i]);
			total = cost * quantity;
			st.executeUpdate("insert into ordr values(" + (ord++) + "," + cust_id + "," + table_no + "," + menu_id[i] + ","
			+ menu_qty[i] + "," + cost + "," + total + ",'" + name + "','placed')");
		}
	}
	//request.getRequestDispatcher("Staff_page.jsp").forward(request,response);
	response.sendRedirect("Tabs.jsp");
	%>
</body>
</html>
