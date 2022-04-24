/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pms.form;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import roseindia.net.ConnectionManager;

/**
 *
 * @author eswar@vaannila.com
 */
public class ISOActionAction extends DispatchAction {

    /* forward name="success" path="" */
    private final static String SUCCESS = "success";
    private final static String FAILURE = "failure";

    /**
     * This is the Struts action method called on
     * http://.../actionPath?method=myAction1,
     * where "method" is the value specified in <action> element : 
     * ( <action parameter="method" .../> )
     */

    public ActionForward add(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
           System.out.println("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        ISOActionForm ISOActionForm = (ISOActionForm) form;
        int GENERALappication_received_during_month = ISOActionForm.getGENERALappication_received_during_month();
        int GENERALappication_disburded_during_month = ISOActionForm.getGENERALappication_disburded_during_month();
        int GENERALamount_disburded_during_month = ISOActionForm.getGENERALamount_disburded_during_month();
        
        int GENERALappication_received_upto_month = ISOActionForm.GetGENERALappication_received_upto_month();
        int GENERALappication_disburded_upto_month_month = ISOActionForm.getGENERALappication_disburded_upto_month_month();
        int GENERALamount_disburded_upto_month = ISOActionForm.getGENERALamount_disburded_upto_month();
        
        int NERappication_received_during_month = ISOActionForm.getNERappication_received_during_month();
        int NERappication_disburded_during_month = ISOActionForm.getNERappication_disburded_during_month();
        int NERamount_disburded_during_month = ISOActionForm.getNERamount_disburded_during_month();
        int NERappication_received_upto_month = ISOActionForm.getNERappication_received_upto_month();
        
	int NERappication_disburded_upto_month = ISOActionForm.getNERappication_disburded_upto_month();
        int NERamount_disburded_upto_month = ISOActionForm.getNERamount_disburded_upto_month();
        int SCPappication_received_during_month = ISOActionForm.getSCPappication_received_during_month();
		
		
		
		
	int SCPappication_disburded_during_month = ISOActionForm.getSCPappication_disburded_during_month();
        int SCPamount_disburded_during_month = ISOActionForm.getSCPamount_disburded_during_month();
        int SCPappication_received_upto_month = ISOActionForm.getSCPappication_received_upto_month();
        int SCPappication_disburded_upto_month = ISOActionForm.getSCPappication_disburded_upto_month();
        int SCPamount_disburded_upto_month = ISOActionForm.getSCPamount_disburded_upto_month();
        int TSPappication_received_during_month = ISOActionForm.getTSPappication_received_during_month();
        int TSPappication_disburded_during_month = ISOActionForm.getTSPappication_disburded_during_month();
		
        int TSPamount_disburded_during_month = ISOActionForm.getTSPamount_disburded_during_month();
        int TSPappication_received_upto_month = ISOActionForm.getTSPappication_received_upto_month();
        int TSPappication_disburded_upto_month = ISOActionForm.getTSPappication_disburded_upto_month();
        int TSPamount_disburded_upto_month = ISOActionForm.getTSPamount_disburded_upto_month();
		
		
      
        String Years = ISOActionForm.getYears();
        int Months = ISOActionForm.getMonths();
        String User_date = ISOActionForm.getUser_date();
        String InstId = ISOActionForm.getInstId();
        
        
        
        System.out.println("prakash chandra"+Years);
        System.out.println("prakash chandra"+Months);
        System.out.println("prakash chandra"+User_date);
        System.out.println("prakash chandra"+InstId);
        
        
        
        request.setAttribute("Years",ISOActionForm.getYears());
     request.setAttribute("Months",ISOActionForm.getMonths());
     request.setAttribute("User_date",ISOActionForm.getUser_date());
       request.setAttribute("InstId",ISOActionForm.getInstId());
        
        System.out.println("Inserting values in Mysql database table!");
  
  
  
  Connection  con = ConnectionManager.getConnectionDirectForMySQL();

 // Statement st = con.createStatement();
String sql = "UPDATE tbl_iso SET GENERALappication_received_during_month =?,GENERALappication_disburded_during_month=?,GENERALamount_disburded_during_month=?,NERappication_received_during_month=?,NERappication_disburded_during_month=?,NERamount_disburded_during_month=?,SCPappication_received_during_month=?,SCPappication_disburded_during_month=?,SCPamount_disburded_during_month=?,TSPappication_received_during_month=?,TSPappication_disburded_during_month=?,TSPamount_disburded_during_month=?,GENERALappication_received_upto_month=?,GENERALappication_disburded_upto_month=?,GENERALamount_disburded_upto_month=?,NERappication_received_upto_month =?,NERappication_disburded_upto_month=?,NERamount_disburded_upto_month=?,SCPappication_received_upto_month=?,SCPappication_disburded_upto_month=?,SCPamount_disburded_upto_month=?,TSPappication_received_upto_month=?,TSPappication_disburded_upto_month=?,TSPamount_disburded_upto_month=? WHERE year = ? and Inst_id = ? and months = ? ";
               
                                                                                 
                        PreparedStatement prest = con.prepareStatement(sql);      
                                
				prest.setInt(1, GENERALappication_received_during_month);
                                prest.setInt(2, GENERALappication_disburded_during_month);
				prest.setInt(3, GENERALamount_disburded_during_month);
                                prest.setInt(4, NERappication_received_during_month);
				prest.setInt(5, NERappication_disburded_during_month);
                                 prest.setInt(6, NERamount_disburded_during_month);
				prest.setInt(7, SCPappication_received_during_month);
                                prest.setInt(8, SCPappication_disburded_during_month);
				prest.setInt(9, SCPamount_disburded_during_month);
                                prest.setInt(10, TSPappication_received_during_month);
				prest.setInt(11, TSPappication_disburded_during_month);
                                prest.setInt(12, TSPamount_disburded_during_month);
				prest.setInt(13, GENERALappication_received_upto_month);
				prest.setInt(14, GENERALappication_disburded_upto_month_month);
				prest.setInt(15, GENERALamount_disburded_upto_month);
                                prest.setInt(16, NERappication_received_upto_month);
				prest.setInt(17, NERappication_disburded_upto_month);
                                prest.setInt(18, NERamount_disburded_upto_month);
				prest.setInt(19, SCPappication_received_upto_month);
				prest.setInt(20, SCPappication_disburded_upto_month);
				prest.setInt(21, SCPamount_disburded_upto_month);
				prest.setInt(22, TSPappication_received_upto_month);
                                 prest.setInt(23, TSPappication_disburded_upto_month);
				prest.setInt(24, TSPamount_disburded_upto_month);
                                 prest.setString(25, Years);
				prest.setString(26, InstId);
                                prest.setInt(27, Months);
                                
                                System.out.println(sql);
                                prest.executeUpdate();
                                System.out.println("Updating Successfully!");
                                con.commit();
                                con.close(); 
                    return mapping.findForward(SUCCESS);
                                 }


    public ActionForward click_to_Enter(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
           System.out.println("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        ISOActionForm ISOActionForm = (ISOActionForm) form;
        int GENERALappication_received_during_month = ISOActionForm.getGENERALappication_received_during_month();
        int GENERALappication_disburded_during_month = ISOActionForm.getGENERALappication_disburded_during_month();
        int GENERALamount_disburded_during_month = ISOActionForm.getGENERALamount_disburded_during_month();
        
        int GENERALappication_received_upto_month = ISOActionForm.GetGENERALappication_received_upto_month();
        int GENERALappication_disburded_upto_month_month = ISOActionForm.getGENERALappication_disburded_upto_month_month();
        int GENERALamount_disburded_upto_month = ISOActionForm.getGENERALamount_disburded_upto_month();
        
        int NERappication_received_during_month = ISOActionForm.getNERappication_received_during_month();
        int NERappication_disburded_during_month = ISOActionForm.getNERappication_disburded_during_month();
        int NERamount_disburded_during_month = ISOActionForm.getNERamount_disburded_during_month();
        int NERappication_received_upto_month = ISOActionForm.getNERappication_received_upto_month();
        
	int NERappication_disburded_upto_month = ISOActionForm.getNERappication_disburded_upto_month();
        int NERamount_disburded_upto_month = ISOActionForm.getNERamount_disburded_upto_month();
        int SCPappication_received_during_month = ISOActionForm.getSCPappication_received_during_month();
		
		
		
		
	int SCPappication_disburded_during_month = ISOActionForm.getSCPappication_disburded_during_month();
        int SCPamount_disburded_during_month = ISOActionForm.getSCPamount_disburded_during_month();
        int SCPappication_received_upto_month = ISOActionForm.getSCPappication_received_upto_month();
        int SCPappication_disburded_upto_month = ISOActionForm.getSCPappication_disburded_upto_month();
        int SCPamount_disburded_upto_month = ISOActionForm.getSCPamount_disburded_upto_month();
        int TSPappication_received_during_month = ISOActionForm.getTSPappication_received_during_month();
        int TSPappication_disburded_during_month = ISOActionForm.getTSPappication_disburded_during_month();
		
        int TSPamount_disburded_during_month = ISOActionForm.getTSPamount_disburded_during_month();
        int TSPappication_received_upto_month = ISOActionForm.getTSPappication_received_upto_month();
        int TSPappication_disburded_upto_month = ISOActionForm.getTSPappication_disburded_upto_month();
        int TSPamount_disburded_upto_month = ISOActionForm.getTSPamount_disburded_upto_month();
		
		
      
        String Years = ISOActionForm.getYears();
        int Months = ISOActionForm.getMonths();
        String User_date = ISOActionForm.getUser_date();
        String InstId = ISOActionForm.getInstId();
        
        
        
        System.out.println("prakash chandra"+Years);
        System.out.println("prakash chandra"+Months);
        System.out.println("prakash chandra"+User_date);
        System.out.println("prakash chandra"+InstId);
        
        
        
        request.setAttribute("Years",ISOActionForm.getYears());
     request.setAttribute("Months",ISOActionForm.getMonths());
     request.setAttribute("User_date",ISOActionForm.getUser_date());
       request.setAttribute("InstId",ISOActionForm.getInstId());
        
        System.out.println("Inserting values in Mysql database table!");
  
  
  
  Connection  con = ConnectionManager.getConnectionDirectForMySQL();

PreparedStatement stmt = (PreparedStatement) con.prepareStatement("INSERT INTO tbl_iso(`inst_id`,`months`,`year`,`GENERALappication_received_during_month`,`GENERALappication_disburded_during_month`,`GENERALamount_disburded_during_month`,`NERappication_received_during_month`,`NERappication_disburded_during_month`,`NERamount_disburded_during_month`,`SCPappication_received_during_month`,`SCPappication_disburded_during_month`,`SCPamount_disburded_during_month`,`TSPappication_received_during_month`,`TSPappication_disburded_during_month`,`TSPamount_disburded_during_month`,`user_date`,`GENERALappication_received_upto_month`,`GENERALappication_disburded_upto_month`,`GENERALamount_disburded_upto_month`,`NERappication_received_upto_month`,`NERappication_disburded_upto_month`,`NERamount_disburded_upto_month`,`SCPappication_received_upto_month`,`SCPappication_disburded_upto_month`,`SCPamount_disburded_upto_month`,`TSPappication_received_upto_month`,`TSPappication_disburded_upto_month`,`TSPamount_disburded_upto_month`)"
                                                                                       + " VALUES (?,?,?,?,?,?,?,?"
        + ",?,?,?,?,"
        + "?,?,?,?,"
        + "?,?,?,?,"
        + "?,?,?,?,"
        + "?,?,?,?) ");
																					
                       
				stmt.setString(1, InstId);
				stmt.setInt(2, Months);
                                stmt.setString(3, Years);
				stmt.setInt(4, GENERALappication_received_during_month);
                                stmt.setInt(5, GENERALappication_disburded_during_month);
				stmt.setInt(6, GENERALamount_disburded_during_month);
                                stmt.setInt(7, NERappication_received_during_month);
				stmt.setInt(8, NERappication_disburded_during_month);
                                 stmt.setInt(9, NERamount_disburded_during_month);
				stmt.setInt(10, SCPappication_received_during_month);
                                stmt.setInt(11, SCPappication_disburded_during_month);
				stmt.setInt(12, SCPamount_disburded_during_month);
                                stmt.setInt(13, TSPappication_received_during_month);
				stmt.setInt(14, TSPappication_disburded_during_month);
                                stmt.setInt(15, TSPamount_disburded_during_month);
				stmt.setString(16, User_date);
				stmt.setInt(17, GENERALappication_received_upto_month);
				stmt.setInt(18, GENERALappication_disburded_upto_month_month);
				stmt.setInt(19, GENERALamount_disburded_upto_month);
                                stmt.setInt(20, NERappication_received_upto_month);
				stmt.setInt(21, NERappication_disburded_upto_month);
                                stmt.setInt(22, NERamount_disburded_upto_month);
				stmt.setInt(23, SCPappication_received_upto_month);
				stmt.setInt(24, SCPappication_disburded_upto_month);
				stmt.setInt(25, SCPamount_disburded_upto_month);
				stmt.setInt(26, TSPappication_received_upto_month);
                                 stmt.setInt(27, TSPappication_disburded_upto_month);
				stmt.setInt(28, TSPamount_disburded_upto_month);
				

				// ResultSet rs = stmt.executeQuery(sql);
System.out.println(stmt);
                     stmt.execute();
                        
                         System.out.println("1 row affected");
                       
                             con.commit();
                             con.close();
                             
                        
                             
                            return mapping.findForward(SUCCESS);
                                 }

    
}