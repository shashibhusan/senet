/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package roseindia.net;

import com.mysql.jdbc.Statement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import common.ConnectionManager;
/**
 *
 * @author admin
 */
public class ISOTargetAction extends DispatchAction{
    private final static String ADD = "add";
    private final static String FAILURE = "failure";
     public ActionForward add(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
String institute = ConnectionManager.instituteName(request.getParameter("institute"));
        String years = request.getParameter("cmbYear");
        String general = request.getParameter("GENERAL");
        int sangeneral=Integer.parseInt(general);
        String scsp = request.getParameter("SCSP");
        int scspgeneral=Integer.parseInt(scsp);
        String tsp = request.getParameter("TSP");
        int tspgeneral=Integer.parseInt(tsp);
        System.out.println("this is the add method ");
        try {
            java.sql.Connection con = roseindia.net.ConnectionManager.getConnectionDirectForMySQL();
            Statement stmt = (Statement) con.createStatement();
             Statement stmt1 = (Statement) con.createStatement();
            String TargetInsetQuery = "INSERT INTO ISO_TARGET(institute,years,general,scsp,tsp)VALUES('" + institute + "','" + years + "','" + general + "','" + scsp + "','" + tsp + "')";



               String program1="GENERAL";
               String program2="SCSP";
               String program3="TSP";


               String query1="UPDATE ISO_DATA1 set sanctioned="+sangeneral+" where institute_name='"+institute+"'and name_program='"+program1+"' and years='"+years+"' ";
               stmt1.addBatch(query1);
               String query2="UPDATE ISO_DATA1 set sanctioned="+scspgeneral+" where institute_name='"+institute+"'and name_program='"+program2+"' and years='"+years+"' ";
               stmt1.addBatch(query2);
               String query3="UPDATE ISO_DATA1 set sanctioned="+tspgeneral+" where institute_name='"+institute+"'and name_program='"+program3+"' and years='"+years+"' ";
               stmt1.addBatch(query3);


               int re[] = stmt1.executeBatch();


            System.out.println("TargetInsetQuery : " + TargetInsetQuery);
            int result = stmt.executeUpdate(TargetInsetQuery);
            con.commit();
            con.close();
            if (result > 0) {
                return mapping.findForward(ADD);
            }

        } catch (Exception e) {
            System.out.println("The following error occurs durring the insertion of the target value in the database : " + e);
        }
        return mapping.findForward(FAILURE);
}

public ActionForward update(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String institute = ConnectionManager.instituteName(request.getParameter("institute"));
        String years = request.getParameter("cmbYear");
        String general = request.getParameter("GENERAL");
        int sangeneral=Integer.parseInt(general);
        String scsp = request.getParameter("SCSP");
        int scspgeneral=Integer.parseInt(scsp);
        String tsp = request.getParameter("TSP");
        int tspgeneral=Integer.parseInt(tsp);
        System.out.println("this is the update method ");
        try {
            java.sql.Connection con = roseindia.net.ConnectionManager.getConnectionDirectForMySQL();
            Statement stmt = (Statement) con.createStatement();
             Statement stmt1 = (Statement) con.createStatement();
            String TargetInsetQuery="update ISO_TARGET set general='"+general+"', scsp='"+scsp+"' , tsp='"+tsp+"' where institute='"+institute+"' and years='"+years+"' ";
            System.out.println("TargetInsetQuery : " + TargetInsetQuery);






               String program1="GENERAL";
               String program2="SCSP";
               String program3="TSP";


               String query1="UPDATE ISO_DATA1 set sanctioned="+sangeneral+" where institute_name='"+institute+"'and name_program='"+program1+"' and years='"+years+"' ";
               stmt1.addBatch(query1);
               String query2="UPDATE ISO_DATA1 set sanctioned="+scspgeneral+" where institute_name='"+institute+"'and name_program='"+program2+"' and years='"+years+"' ";
               stmt1.addBatch(query2);
               String query3="UPDATE ISO_DATA1 set sanctioned="+tspgeneral+" where institute_name='"+institute+"'and name_program='"+program3+"' and years='"+years+"' ";
               stmt1.addBatch(query3);


               int re[] = stmt1.executeBatch();






            int result = stmt.executeUpdate(TargetInsetQuery);
            con.commit();
            con.close();
            if (result > 0) {
               return mapping.findForward("update");
            }

        } catch (Exception e) {
            System.out.println("The following error occurs durring the insertion of the target value in the database : " + e);
        }
        return mapping.findForward(FAILURE);
    }

}