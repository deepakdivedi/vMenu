import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;




public class validate_customer extends HttpServlet {

    boolean check(String name,String mobno,String table){
        int i;
        char m[]=mobno.toCharArray();
        char n[]=name.toCharArray();
        if(table.equals("0"))
            return false;
        if(m.length==10){
            for(i=0;i<10;i++){
                if(!Character.isDigit(m[i])){
                    return false;
                }
            }
        }
        else{
            return false;
        }
        if(!name.equals("")){
            for(i=0;i<n.length;i++){
                if((!Character.isAlphabetic(n[i]))&&(!Character.isWhitespace(n[i]))){
                    return false;
                }
            }
        }
        else
            return false;
        return true;        
    }
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int id=1;
            boolean flag=false;
            String name=request.getParameter("name");
            String mobile=request.getParameter("mobileno");
            String table=request.getParameter("table");
            if(check(name,mobile,table)){
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
                Statement st=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                PreparedStatement pst=con.prepareStatement("insert into customer values(?,?,?,?)");
                ResultSet rs=st.executeQuery("select * from customer");
                if(rs.last())
                    id=rs.getInt("c_id")+1;
                
                pst.setInt(1,id);
                pst.setString(2,name);
                pst.setString(3,mobile);
                pst.setString(4,table);
                pst.executeUpdate();
                response.sendRedirect("Customer_validate_page.jsp?msg=success&c_id="+id+"&table="+table+"&c_name="+name+"");
            }
            else{
                response.sendRedirect("Customer_validate_page.jsp?msg=failure");
            }
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(validate_customer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(validate_customer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(validate_customer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(validate_customer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
