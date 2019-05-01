
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <% 
            String msg=request.getParameter("msg");
            if(msg.equals("success"))
                {
        %>
         <script>
             alert("Login Successful!");
             window.location.assign("Staff_page.jsp");
         </script>
         <%
                }
             else
                {
         %>
         <script>
             alert("Login Unsuccessful!");
             window.location.assign("Staff_login.jsp");
         </script>
         <%
                }
         %>
    </body>
</html>
