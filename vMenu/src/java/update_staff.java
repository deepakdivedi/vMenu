import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;


public class update_staff extends HttpServlet {

    boolean check(String name,String id,String mobno,String password,String address){
        int i;
        char m[]=mobno.toCharArray();
        char n[]=name.toCharArray();
        if(m.length==10){
            for(i=0;i<10;i++){
                if((!Character.isDigit(m[i]))){
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
        if(password.equals("")){
           return false;
        }
        if(address.equals("")){
           return false;
        }
        if(id.equals("")){
           return false;
        }
        
        return true;        
    }
    
    boolean check1(String name,String id){
        int i;
        char n[]=name.toCharArray();
        if(!name.equals("")){
            for(i=0;i<n.length;i++){
                if((!Character.isAlphabetic(n[i]))&&(!Character.isWhitespace(n[i]))){
                    return false;
                }
            }
        }
        else
            return false;
        if(id.equals("")){
           return false;
        }
        return true;        
    }
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
              
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
            Statement st=con.createStatement();
            
            String operation=request.getParameter("id");
            
            if(operation.equals("add"))
            {
                String name=request.getParameter("staffname");
                String mobno=request.getParameter("mobileno");
                String id=request.getParameter("staffid");
                String password=request.getParameter("staffpwd");
                String address=request.getParameter("address");
              
                if(check(name,id,mobno,password,address))
                {
                    int status=st.executeUpdate("insert into staff values('"+id+"','"+name+"','"+password+"','"+address+"',"+mobno+")");
                    if(status==1){
                        response.sendRedirect("Admin_update_msg.jsp?id=StaffAdded");
                    }
                    else{
                        response.sendRedirect("Admin_update_msg.jsp?id=StaffNotAdded");
                    }
                }
                else{
                        response.sendRedirect("Admin_update_msg.jsp?id=IncorrectDetails");
                    }
            }
            else if(operation.equals("delete"))
                {
                    String name=request.getParameter("staffname");
                    String id=request.getParameter("staffid");
                    if(check1(name,id))
                    {
                        int status=st.executeUpdate("delete from staff where s_id='"+id+"' and s_name='"+name+"'");
                        if(status==1)
                        {
                            response.sendRedirect("Admin_update_msg.jsp?id=StaffDeleted");
                        }
                        else
                        {
                            response.sendRedirect("Admin_update_msg.jsp?id=StaffNotDeleted");
                        }
                    }
                    else
                    {
                        response.sendRedirect("Admin_update_msg.jsp?id=IncorrectDetails");   
                    }
                
            }     
        }
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(update_staff.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(update_staff.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   
    public String getServletInfo() {
        return "Short description";
    }

}
