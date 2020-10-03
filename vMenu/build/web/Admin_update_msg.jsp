
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%
		String id = request.getParameter("id");
	if (id.equals("IncorrectDetails")) {
	%>
	<script>
		alert("Incorrect Details Entered!");
		window.location.assign("Admin_update_page.jsp");
	</script>
	<%
		} else if (id.equals("StaffAdded")) {
	%>
	<script>
		alert("Staff Details Added Successfully!");
		window.location.assign("Admin_update_page.jsp");
	</script>
	<%
		} else if (id.equals("StaffNotAdded")) {
	%>
	<script>
		alert("Staff Details Not Added Successfully!");
		window.location.assign("Admin_update_page.jsp");
	</script>
	<%
		} else if (id.equals("StaffDeleted")) {
	%>
	<script>
		alert("Staff Details Deleted Successfully!");
		window.location.assign("Admin_update_page.jsp");
	</script>
	<%
		} else if (id.equals("StaffNotDeleted")) {
	%>
	<script>
		alert("Staff Details Not Deleted Successfully!");
		window.location.assign("Admin_update_page.jsp");
	</script>
	<%
		} else if (id.equals("MenuAdded")) {
	%>
	<script>
		alert("Menu Details Added Successfully!");
		window.location.assign("Admin_update_page.jsp");
	</script>
	<%
		} else if (id.equals("MenuNotAdded")) {
	%>
	<script>
		alert("Menu Details Not Added Successfully!");
		window.location.assign("Admin_update_page.jsp");
	</script>
	<%
		} else if (id.equals("MenuDeleted")) {
	%>
	<script>
		alert("Menu Details Deleted Successfully!");
		window.location.assign("Admin_update_page.jsp");
	</script>
	<%
		} else if (id.equals("MenuNotDeleted")) {
	%>
	<script>
		alert("Menu Details Not Deleted Successfully!");
		window.location.assign("Admin_update_page.jsp");
	</script>
	<%
		} else if (id.equals("MenuUpdated")) {
	%>
	<script>
		alert("Menu Details Updated Successfully!");
		window.location.assign("Admin_update_page.jsp");
	</script>
	<%
		} else if (id.equals("MenuNotUpdated")) {
	%>
	<script>
		alert("Menu Details Not Updated Successfully!");
		window.location.assign("Admin_update_page.jsp");
	</script>
	<%
		}
	%>
</body>
</html>
