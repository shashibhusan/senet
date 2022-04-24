/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import com.mysql.jdbc.Statement;
import common.ConnectionManager;
import java.io.IOException;
import java.sql.ResultSet;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class CheckDrop extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         HttpSession session = request.getSession();
       String city = (String)session.getAttribute("branch");

        System.out.println("@@@@@@@@@@@@@@   " +city);

        StringBuffer XMLcity = new StringBuffer();

        ResultSet rs = null;

        try {
            java.sql.Connection con = ConnectionManager.getConnectionDirectForMySQL();
            Statement stmt = (Statement) con.createStatement();
            String sql = "select * from checkDropdown where DI='" + city + "';";

            rs = stmt.executeQuery(sql);
            System.out.println("Query="+sql);
            


                while (rs.next()) {
                  System.out.println("value we get is " +rs.getString("city") );
                    XMLcity.append("<option>" + rs.getString("city") + "</option>");
                  }
                 
            


           
            }
            catch(Exception ex)
            {
              System.out.println("Following error occurs : "+ex);
            }
         response.setContentType("text/html");

        response.getWriter().println(XMLcity);
    }

     

}
