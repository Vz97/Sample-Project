package Newpack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Second extends HttpServlet {

    
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 PrintWriter out = response.getWriter();
        // variables
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
   //     ResultSet rs1=null;
        //out.println("Welcome to our program");
        // Step 1: Loading or registering Oracle JDBC driver class
        //out.println("Welcome");
        boolean Found=false;
try {
      // load the UCanAccess driver
      Class.forName( "net.ucanaccess.jdbc.UcanaccessDriver" );
      // connect to the database using the DriverManager
      String url = "jdbc:ucanaccess://C:\\Users\\Rekha\\Documents\\Login1.accdb";
                                         
      conn =  DriverManager.getConnection(url);
 
      st = conn.createStatement(); 
        
      rs = st.executeQuery("SELECT Username,Password FROM LoginS" );
   
while( rs.next())
{
        response.setContentType("text/html;charset=UTF-8");
       
           
            
            //out.println("Hi");
            String n=request.getParameter("uname");  
            String p=request.getParameter("pass"); 
            
            //out.println(rs.getInt(1));
            //out.println("\n");
            if(n.equals(rs.getString(1))&& p.equals(rs.getString(2)) )
            { 
                HttpSession session=request.getSession();  
                session.setAttribute("uid",n); 
              //out.println("Found");
                
                
                    request.getRequestDispatcher("Staff.jsp").include(request, response);
                    //request.getRequestDispatcher("Staff.jsp").include(request, response);
                
            Found=true;    
            }
            
        }
if(Found==false)
{
    out.println("Invalid user");
}
}


      
    
catch (Exception ex) {

out.println(ex.getMessage());

 
        }

    }

        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
