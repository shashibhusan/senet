/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acr.net;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import roseindia.net.ConnectionManager;


public class AcrupdateAction extends  org.apache.struts.action.Action 
{

    /* forward name="success" path="" */
    private final static String SUCCESS = "success";
    private final static String FAILURE = "failure";

    
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        AcrupdateForm AcrupdateForm = (AcrupdateForm) form;

         HttpSession session = request.getSession(true);
             String Random5=(String)session.getAttribute("Random5");
             System.out.println("financial random number update messgae random number in session "+Random5);
             String Mnm = AcrupdateForm.getMnm();

                System.out.println("financial random number second update messgae random number coming from from"+Mnm);
                if(!Random5.equals(Mnm))
{response.sendRedirect("staterror.jsp");
} else {
    

        String Name1 = AcrupdateForm.getName1();
        String Designation = AcrupdateForm. getDesignation();
        String Date_of_Birth = AcrupdateForm.getDate_of_Birth();
        String Year2000 = AcrupdateForm.getYear2000();
        String Status = AcrupdateForm.getStatus();
	String Year2001 = AcrupdateForm.getYear2001();
        String Status1 = AcrupdateForm.getStatus1();
	String Year2002 = AcrupdateForm.getYear2002();
        String Status2 = AcrupdateForm.getStatus2();
	String Year2003 = AcrupdateForm.getYear2003();
        String Status3 = AcrupdateForm.getStatus3();
	String Year2004 = AcrupdateForm.getYear2004();
        String Status4 = AcrupdateForm.getStatus4();
	String Year2005 = AcrupdateForm.getYear2005();
        String Status5 = AcrupdateForm.getStatus5();
	String Year2006 = AcrupdateForm.getYear2006();
        String Status6 = AcrupdateForm.getStatus6();
	String Year2007 = AcrupdateForm.getYear2007();
        String Status7 = AcrupdateForm.getStatus7();
	String Year2008 = AcrupdateForm.getYear2008();
        String Status8 = AcrupdateForm.getStatus8();
	String Year2009 = AcrupdateForm.getYear2009();
        String Status9 = AcrupdateForm.getStatus9();
	String Year2010 = AcrupdateForm.getYear2010();
        String Status10 = AcrupdateForm.getStatus10();
	String Year2011 = AcrupdateForm.getYear2011();
        String Status11 = AcrupdateForm.getStatus11();
	String Year2012 = AcrupdateForm.getYear2012();
        String Status12 = AcrupdateForm.getStatus12();
	String Year2013 = AcrupdateForm.getYear2013();
        String Status13 = AcrupdateForm.getStatus13();
	String Year2014 = AcrupdateForm.getYear2014();
        String Status14 = AcrupdateForm.getStatus14();
        String Sno = AcrupdateForm.getSno();
        System.out.println("frgfdgfdgfdgfdgfdgfdgfdgrd"+Sno);
        System.out.println("frgfdgfdgfdgfdgfdgfdgfdgrd"+Status14);
        
        System.out.println("frgfdgfdgfdgfdgfdgfdgfdgrd"+Year2014);
        
        System.out.println("frgfdgfdgfdgfdgfdgfdgfdgrd"+Status13);
        
        System.out.println("frgfdgfdgfdgfdgfdgfdgfdgrd"+Year2013);
        System.out.println("frgfdgfdgfdgfdgfdgfdgfdgrd"+Status12);
        
        
        
if ( (Name1.matches("(.*)<(.*)")) || (Name1.matches("(.*)script(.*)")) || (Status14.matches("(.*)<(.*)")) || (Status14.matches("(.*)script(.*)")) || (Year2014.matches("(.*)script(.*)")) || (Year2014.matches("(.*)script(.*)")) || (Status13.matches("(.*)script(.*)"))
                ||(Status13.matches("(.*)script(.*)"))|| (Year2013.matches("(.*)script(.*)"))
                ||(Status12.matches("(.*)script(.*)"))|| (Year2012.matches("(.*)script(.*)"))
                ||(Status11.matches("(.*)script(.*)"))|| (Year2011.matches("(.*)script(.*)"))
                ||(Status10.matches("(.*)script(.*)"))|| (Year2010.matches("(.*)script(.*)"))
                ||(Status9.matches("(.*)script(.*)"))|| (Year2009.matches("(.*)script(.*)"))
                ||(Status8.matches("(.*)script(.*)"))|| (Year2008.matches("(.*)script(.*)"))
                ||(Status7.matches("(.*)script(.*)"))|| (Year2007.matches("(.*)script(.*)"))
                ||(Status6.matches("(.*)script(.*)"))|| (Year2006.matches("(.*)script(.*)"))
                ||(Status5.matches("(.*)script(.*)"))|| (Year2005.matches("(.*)script(.*)"))
                ||(Status4.matches("(.*)script(.*)"))|| (Year2004.matches("(.*)script(.*)"))
                ||(Status3.matches("(.*)script(.*)"))|| (Year2003.matches("(.*)script(.*)"))
                ||(Status2.matches("(.*)script(.*)"))|| (Year2002.matches("(.*)script(.*)"))
                ||(Status1.matches("(.*)script(.*)"))|| (Year2001.matches("(.*)script(.*)"))
                ||(Status.matches("(.*)script(.*)"))|| (Date_of_Birth.matches("(.*)script(.*)"))
                ||(Designation.matches("(.*)script(.*)"))|| (Year2013.matches("(.*)script(.*)")))  {
	System.out.println("pattern unmatches Budget..");
          response.sendRedirect("staterror.jsp");

        
        
        
        
        System.out.println("Inserting values in Mysql database table!");
  
  
  
  Connection  con = ConnectionManager.getConnectionDirectForMySQL();
  
 try{

  AcrUpdate updatt =new AcrUpdate();

  int i=updatt.update(Name1, Designation, Date_of_Birth, Year2004, Status, Year2005, Status1, Year2006, Status2, Year2007, Status3, Year2008, Status4, Year2009, Status5, Year2010, Status6, Year2011, Status7, Year2012, Status8, Year2013, Status9, Year2014, Status10, Year2000, Status11, Year2001, Status12, Year2002, Status13, Year2003, Status14, Sno, Sno);
System.out.println("2 row affected" +i);


                            if(i >0){
                        System.out.println("Result Set have record");
                         return mapping.findForward(SUCCESS);
                        }
                        else{
                    System.out.println(" Result Set have not record");
                    return mapping.findForward("failure");
                        }

                             }
                        catch (Exception e){
                             }

}}
                            return mapping.findForward(SUCCESS);
                                 }
}