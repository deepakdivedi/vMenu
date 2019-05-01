<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
                int f_id=1;
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
                Statement st=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                String c_id=(String)session.getAttribute("customer_id");
                String email=request.getParameter("email");
                String description=request.getParameter("message");
                String name=request.getParameter("name");
                ResultSet rs=st.executeQuery("select f_id from feedback");
                if(rs.last())
                    f_id=rs.getInt(1)+1;
                if(email.equals("")||description.equals("")||(name.equals(""))){
        %>
        <script>
            alert("Please Enter All Details!");
            window.location.assign("Feedback.jsp");
        </script>
        <%
                }
                else{
                    st.executeUpdate("insert into feedback values("+f_id+","+c_id+",'"+email+"','"+description+"')");
        %>
        <script>
            window.location.assign("Home_page.jsp");
        </script>
        <%
                }
        %>
    </body>
</html>
