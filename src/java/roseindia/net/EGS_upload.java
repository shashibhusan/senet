/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package roseindia.net;

import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import java.sql.*;
import javax.servlet.http.HttpSession;
import common.ConnectionManager;
import java.io.File;
/**

 * @author Senet
 */
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 2048)
public class EGS_upload extends HttpServlet {
   
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();

                HttpSession session = request.getSession();
                
                InputStream inputStream = null;
              
              //  Part filePart = request.getPart("upload");
                 System.out.println("------------working------------");
                String email=(String)session.getAttribute("email");
                int token=12546;
                int id=1;

    /*         if (filePart != null)
                {
                    System.out.println(filePart.getName());
                    System.out.println(filePart.getSize());
                    System.out.println(filePart.getContentType());

                    inputStream = filePart.getInputStream();
                }
           */

Connection con=null;
ResultSet rs=null;
Statement st=null;

                try
                {
                    con=ConnectionManager.getConnectionDirectForMySQL();
                    st=con.createStatement();

                    String sql = "INSERT INTO egs_file (id, email, file) values (?, ?, ?)";
                    PreparedStatement stm = con.prepareStatement(sql);
                   stm.setInt(1, id);
                   stm.setString(2, email);
                   stm.setString(3, email);
                    

             /*       if (inputStream != null)
                    {
                        stm.setBinaryStream(3, inputStream, (int) filePart.getSize());
                    }
*/
                    int row = stm.executeUpdate();
                    if (row > 0)
                    {
                        out.println("File uploaded!!!");

                        con.close();

                        RequestDispatcher res = request.getRequestDispatcher("EGS_main.jsp");
                        res.include(request, response);
                    }
                    else
                    {
                        out.println("Couldn't upload your file!!!");

                        con.close();

                        RequestDispatcher res = request.getRequestDispatcher("EGS_main.jsp");
                        res.include(request, response);
                    }

                }catch(Exception e){e.printStackTrace();}

    }

}
