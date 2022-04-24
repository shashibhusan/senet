/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mysql.jdbc.Statement;
import common.ConnectionManager;
import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
 class DropDown extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String Bname = (String) session.getAttribute("Bname");
         
        StringBuffer XMLcity = new StringBuffer();
       
        ResultSet rs = null;

        try {
            java.sql.Connection con = ConnectionManager.getConnectionDirectForMySQL();
            Statement stmt = (Statement) con.createStatement();
            String sql = "select city from checkDropdown where DI='" + Bname + "';";

            rs = stmt.executeQuery(sql);

            if (rs.next()) {

               
                while (rs.next()) {

                    XMLcity.append("<option>" + rs.getString("city") + "</option>");
                  }
            } else {
                XMLcity.append("<option>0</option>");
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