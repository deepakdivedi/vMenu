<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<style>
html {
	background: url(Login.jpg) no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
</style>
<body>
	<table align="center">
		<tr>
			<td align="left"><font color="whitesmoke"><b>Customer
						No.:</b></font></td>
			<td><font color="whitesmoke"><%=(String) session.getAttribute("customer_id")%></font></td>
		</tr>
		<tr>
			<td align="left"><font color="whitesmoke"><b>Customer
						Name:</b></font></td>
			<td><font color="whitesmoke"><%=(String) session.getAttribute("customer_name")%></font></td>
		</tr>
		<tr>
			<td align="left"><font color="whitesmoke"><b>Table
						No.:</b></font></td>
			<td><font color="whitesmoke"><%=(String) session.getAttribute("table_no")%></font></td>
		</tr>
	</table>
</body>
</html>
