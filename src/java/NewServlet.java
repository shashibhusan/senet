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
public class NewServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String institute = (String) session.getAttribute("Hinstitute");
        String yearid = (String) session.getAttribute("Hyear");
        String pageName = (String) session.getAttribute("page");
        StringBuffer XMLdata = new StringBuffer();
        StringBuffer XMLdata1 = new StringBuffer();
        StringBuffer XMLSanction = new StringBuffer();
        ResultSet resultset = null;
        ResultSet resultset1 = null;
        ResultSet resultset2 = null;
        ResultSet resultset3 = null;
        ResultSet resultset4 = null;
        ResultSet resultSanction = null;
 
         if(!"target".equals(pageName))
         {
        String monthid = (String) session.getAttribute("Hmonth");
        int months =Integer.parseInt(monthid);
        
        String c = "c";
        try {
            java.sql.Connection con = ConnectionManager.getConnectionDirectForMySQL();
            Statement stmt = (Statement) con.createStatement();
            String sanctioned = "select general,scsp,tsp from ISO_TARGET where years='" + yearid + "' and institute='" + institute + "';";
            // patel start
            System.out.println("sanctioned Query that used to fetch the data from the database : " + sanctioned);
            resultSanction = stmt.executeQuery(sanctioned);

            if (resultSanction.next()) {

                resultSanction.beforeFirst();
                while (resultSanction.next()) {

                    XMLSanction.append("<sanction>" + resultSanction.getString("general") + "</sanction>");
                    XMLSanction.append("<sanction>" + resultSanction.getString("scsp") + "</sanction>");
                    XMLSanction.append("<sanction>" + resultSanction.getString("tsp") + "</sanction>");

                }
            } else {
                XMLSanction.append("<sanction>0</sanction>");
                XMLSanction.append("<sanction>0</sanction>");
                XMLSanction.append("<sanction>0</sanction>");

            }


            //patel ends
            String strsql1 = "select c2,c3,c4  from ISO_DATA1 where years='" + yearid + "' and months=" + monthid + " and institute_name='" + institute + "';";
            System.out.println("strsql1 Query that used to fetch the data from the database : " + strsql1);
            resultset = stmt.executeQuery(strsql1);
//              shashi start

            if (resultset.next()) {
                int i = 1;
                resultset.beforeFirst();
                while (resultset.next()) {

                    XMLdata.append("<").append(c + i).append(">").append(resultset.getInt("c2")).append("</").append(c + i).append(">");

                    XMLdata.append("<").append(c + i).append(">").append(resultset.getInt("c3")).append("</").append(c + i).append(">");

                    XMLdata.append("<").append(c + i).append(">").append(resultset.getInt("c4")).append("</").append(c + i).append(">");
                    if (i == 1) {
                        XMLdata.append("<update>update</update>");
                    }
                    i++;

                }
            } else {
                XMLdata.append("<c1>0</c1>" + "<c1>0</c1>" + "<c1>0</c1>");
                XMLdata.append("<c2>0</c2>" + "<c2>0</c2>" + "<c2>0</c2>");
                XMLdata.append("<c3>0</c3>" + "<c3>0</c3>" + "<c3>0</c3>");
                XMLdata.append("<c4>0</c4>" + "<c4>0</c4>" + "<c4>0</c4>");
                XMLdata.append("<update>add</update>");
            }
            int i = 1;
            String strsql2 = "select sum(c2) as c5,sum(c3) as c6, sum(c4) as c7 from ISO_DATA1 where years='" + yearid + "' and institute_name='" + institute + "' and months<=" + months + " and name_program='GENERAL'  ";
            System.out.println("strsql2 Query that used to fetch the data from the database : " + strsql2);
            resultset1 = stmt.executeQuery(strsql2);
            if (resultset1.next()) {
                System.out.println("I am insiade the if statements");
                resultset1.beforeFirst();
                while (resultset1.next()) {

                    XMLdata1.append("<").append(c + i).append(">").append(resultset1.getInt("c5")).append("</").append(c + i).append(">");

                    XMLdata1.append("<").append(c + i).append(">").append(resultset1.getInt("c6")).append("</").append(c + i).append(">");

                    XMLdata1.append("<").append(c + i).append(">").append(resultset1.getInt("c7")).append("</").append(c + i).append(">");

                    i++;
                }
            } else {
                XMLdata1.append("<c1>0</c1>" + "<c1>0</c1>" + "<c1>0</c1>");
            }
            int j = 2;
            String strsql3 = "select sum(c2) as c5,sum(c3) as c6, sum(c4) as c7 from ISO_DATA1 where years='" + yearid + "' and institute_name='" + institute + "' and months<=" + months + " and name_program='SCSP'  ";
            System.out.println("strsql3 Query that used to fetch the data from the database : " + strsql3);
            resultset2 = stmt.executeQuery(strsql3);
            if (resultset2.next()) {
                System.out.println("I am insiade the if statements");
                resultset2.beforeFirst();
                while (resultset2.next()) {

                    XMLdata1.append("<").append(c + j).append(">").append(resultset2.getInt("c5")).append("</").append(c + j).append(">");

                    XMLdata1.append("<").append(c + j).append(">").append(resultset2.getInt("c6")).append("</").append(c + j).append(">");

                    XMLdata1.append("<").append(c + j).append(">").append(resultset2.getInt("c7")).append("</").append(c + j).append(">");

                    j++;
                }
            } else {
                XMLdata1.append("<c2>0</c2>" + "<c2>0</c2>" + "<c2>0</c2>");
            }
            int k = 3;
            String strsql4 = "select sum(c2) as c5,sum(c3) as c6, sum(c4) as c7 from ISO_DATA1 where years='" + yearid + "' and institute_name='" + institute + "' and months<=" + months + " and name_program='TSP'  ";
            System.out.println("strsql4 Query that used to fetch the data from the database : " + strsql4);
            resultset3 = stmt.executeQuery(strsql4);
            if (resultset3.next()) {
                System.out.println("I am insiade the if statements");
                resultset3.beforeFirst();
                while (resultset3.next()) {

                    XMLdata1.append("<").append(c + k).append(">").append(resultset3.getInt("c5")).append("</").append(c + k).append(">");

                    XMLdata1.append("<").append(c + k).append(">").append(resultset3.getInt("c6")).append("</").append(c + k).append(">");

                    XMLdata1.append("<").append(c + k).append(">").append(resultset3.getInt("c7")).append("</").append(c + k).append(">");

                    k++;
                }
            } else {
                XMLdata1.append("<c3>0</c3>" + "<c3>0</c3>" + "<c3>0</c3>");
            }
            int m = 4;
            String strsql5 = "select sum(c2) as c5,sum(c3) as c6, sum(c4) as c7 from ISO_DATA1 where years='" + yearid + "' and institute_name='" + institute + "' and months<=" + months + " and name_program='WOMEN'  ";
            System.out.println("strsql5 Query that used to fetch the data from the database : " + strsql5);
            resultset4 = stmt.executeQuery(strsql5);
            if (resultset4.next()) {
                System.out.println("I am insiade the if statements");
                resultset4.beforeFirst();
                while (resultset4.next()) {

                    XMLdata1.append("<").append(c + m).append(">").append(resultset4.getInt("c5")).append("</").append(c + m).append(">");

                    XMLdata1.append("<").append(c + m).append(">").append(resultset4.getInt("c6")).append("</").append(c + m).append(">");

                    XMLdata1.append("<").append(c + m).append(">").append(resultset4.getInt("c7")).append("</").append(c + m).append(">");

                    m++;
                }
            } else {
                XMLdata1.append("<c4>0</c4>" + "<c4>0</c4>" + "<c4>0</c4>");
            }

//              shashi ends
        } catch (Exception e) {
            System.out.println("follwing error while fetching detail fom the database : " + e);
        }
        System.out.println("XMLdata QQQQQQQQQQQQQQQQ" + XMLdata);
        System.out.println("XMLdata1 QQQQQQQQQQQQQQQQQ" + XMLdata1);
        System.out.println("XMLSanction QQQQQQQQQQQQQQQQQ" + XMLSanction);
        response.setContentType("text/html");
        System.out.println("respond :  " + "<topic>" + XMLdata.append(XMLdata1).append(XMLSanction) + "</topic>");
        response.getWriter().println("<topic>" + XMLdata.append(XMLdata1).append(XMLSanction) + "</topic>");
         }
         else
         {
            System.out.println("+++++>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
            try {
            java.sql.Connection con = ConnectionManager.getConnectionDirectForMySQL();
            Statement stmt = (Statement) con.createStatement();
            String sanctioned = "select general,scsp,tsp from ISO_TARGET where years='" + yearid + "' and institute='" + institute + "';";
            System.out.println("sanctioned Query that used to fetch the data from the database : " + sanctioned);
            resultSanction = stmt.executeQuery(sanctioned);

            if (resultSanction.next()) {

                resultSanction.beforeFirst();
                while (resultSanction.next()) {

                    XMLSanction.append("<sanction>" + resultSanction.getString("general") + "</sanction>");
                    XMLSanction.append("<sanction>" + resultSanction.getString("scsp") + "</sanction>");
                    XMLSanction.append("<sanction>" + resultSanction.getString("tsp") + "</sanction>");
                     XMLSanction.append("<update>update</update>");

                }
            } else {
                XMLSanction.append("<sanction>0</sanction>");
                XMLSanction.append("<sanction>0</sanction>");
                XMLSanction.append("<sanction>0</sanction>");
                 XMLSanction.append("<update>add</update>");

            }
            }
            catch(Exception ex)
            {
              System.out.println("Following error occurs : "+ex);
            }
         response.setContentType("text/html");
        System.out.println("respond :  " + "<topic>" + XMLSanction + "</topic>");
        response.getWriter().println("<topic>" + XMLSanction + "</topic>");
         }
    }
}
