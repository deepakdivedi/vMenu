<%-- 
    Document   : Admin_validate_page
    Created on : Dec 28, 2016, 4:42:08 PM
    Author     : Chinmay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		String msg = request.getParameter("msg");
	if (msg.equals("success")) {
	%>
	<script>
		alert("Login Successful!");
		window.location.assign("Admin_page.html");
	</script>
	<%
		} else {
	%>
	<script>
		alert("Login Unsuccessful!");
		window.location.assign("Admin_login.jsp");
	</script>
	<%
		}
	%>
</body>
</html>
