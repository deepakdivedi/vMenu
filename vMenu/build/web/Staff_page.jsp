<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="Staff.css">
</head>
<body>

	<%
		Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
	Statement st = con.createStatement();
	ResultSet rs = null;
	int i, j;
	%>

	<center>
		<div id="myDIV" class="header">
			<h1>
				<b><i><u>Orders</u></i></b>
			</h1>
			<span class="addBtn" onclick="ServeOrder();">Serve Order</span> <span
				class="addBtn" onclick="refresh();">Refresh</span> <span
				class="addBtn" onclick="logout();">Logout</span>
		</div>

		<%
			for (i = 1; i < 11; i++) {
		%>
		<table align="center">
			<tr class="redtr">
				<td align="center">Item Name</td>
				<td align="center">Quantity</td>
				<td>Status</td>
			</tr>
			<div id="myDIV" class="header">
				<h2>
					Table No. :
					<%=i%></h2>
			</div>


			<%
				rs = st.executeQuery("select * from ordr where table_no=" + i + " and status='placed'");
			j = 1;
			while (rs.next()) {
			%>
			<tr>
				<td><%=j++%>. <%=rs.getString("m_name")%></td>
				<td align="center"><%=rs.getString("quantity")%></td>
				<td><input id="<%=rs.getInt("o_id")%>"
					onclick="Select(this.id);" type="checkbox"></td>
			<tr>
				<%
					}
				%>
			
		</table>

		<%
			}
		%>
	</center>

	<script>
		var order_id = new Array();
		j = 0;
		function Select(id) {
			var k;
			if (document.getElementById(id).checked == true) {
				order_id[j++] = id;
			} else {
				for (k = 0; k < order_id.length; k++) {
					if (order_id[k] == id) {
						order_id[k] = 0;
					}
				}
			}

		}

		function ServeOrder() {
			var o_ids = order_id.toString();
			if (o_ids == "") {
				window.location.assign("Staff_page.jsp");
			} else {
				jspcall = "StatusChange.jsp?orderids=" + o_ids + "";
				window.location.href = jspcall;
			}
		}

		function logout() {
			window.location.assign("Home_page.jsp");
		}

		function refresh() {
			window.location.assign("Staff_page.jsp");
		}
	</script>
</body>
</html>
