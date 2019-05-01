<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String msg=request.getParameter("msg");
            if(msg.equals("success"))
                {
                    String id=request.getParameter("c_id");
                    String name=request.getParameter("c_name");
                    String table=request.getParameter("table");
                    session.setAttribute("customer_id",id);
                    session.setAttribute("customer_name",name);
                    session.setAttribute("table_no",table);
        %>
         <script>
             alert("Login Successful!");
             window.location.assign("Customer_page.html");
         </script>
         <%
                }
             else
                {
         %>
         <script>
             alert("Login Unsuccessful! Invalid Entry OR Table No. Not Selected!");
             window.location.assign("Customer_login.jsp");
         </script>
         <%
                }
         %>
    </body>
</html>
