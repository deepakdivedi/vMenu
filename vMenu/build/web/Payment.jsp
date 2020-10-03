<%-- 
    Document   : Payment
    Created on : Jan 8, 2017, 6:42:57 PM
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
		String name = (String) session.getAttribute("customer_name");
	String mode = request.getParameter("mode");
	if (mode.equals("cash")) {
	%>
	<script>
            var customer="<%=name%>";
            alert(customer+" Your Payment Done By Cash!");
            window.location.assign("Feedback.jsp");
        </script>
	<%
		} else if (mode.equals("card")) {
	%>
	<script>
            var customer="<%=name%>
		";
		alert(customer + " Your Payment Done By Card!");
		window.location.assign("Feedback.jsp");
	</script>
	<%
		}
	%>
</body>
</html>
