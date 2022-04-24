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


public class AcrActionAction extends  org.apache.struts.action.Action 
{

    /* forward name="success" path="" */
    private final static String SUCCESS = "success";
    private final static String FAILURE = "failure";

    
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        AcrActionForm AcrActionForm = (AcrActionForm) form;
         HttpSession session = request.getSession(true);
             String Random5=(String)session.getAttribute("Random5");
             System.out.println("financial random number update messgae random number in session "+Random5);
             String Mnm = AcrActionForm.getMnm();

                System.out.println("financial random number second update messgae random number coming from from"+Mnm);
                if(!Random5.equals(Mnm))
    //  if(!OWASP_CSRFTOKENN.equals(OWASP_CSRFTOKEN))

{ response.sendRedirect("staterror.jsp");
   } else {
        String Name1 = AcrActionForm.getName1();
        String Designation = AcrActionForm. getDesignation();
        String Date_of_Birth = AcrActionForm.getDate_of_Birth();
        String Year2000 = AcrActionForm.getYear2000();
        String Status = AcrActionForm.getStatus();
	String Year2001 = AcrActionForm.getYear2001();
        String Status1 = AcrActionForm.getStatus1();
	String Year2002 = AcrActionForm.getYear2002();
        String Status2 = AcrActionForm.getStatus2();
	String Year2003 = AcrActionForm.getYear2003();
        String Status3 = AcrActionForm.getStatus3();
	String Year2004 = AcrActionForm.getYear2004();
        String Status4 = AcrActionForm.getStatus4();
	String Year2005 = AcrActionForm.getYear2005();
        String Status5 = AcrActionForm.getStatus5();
	String Year2006 = AcrActionForm.getYear2006();
        String Status6 = AcrActionForm.getStatus6();
	String Year2007 = AcrActionForm.getYear2007();
        String Status7 = AcrActionForm.getStatus7();
	String Year2008 = AcrActionForm.getYear2008();
        String Status8 = AcrActionForm.getStatus8();
	String Year2009 = AcrActionForm.getYear2009();
        String Status9 = AcrActionForm.getStatus9();
	String Year2010 = AcrActionForm.getYear2010();
        String Status10 = AcrActionForm.getStatus10();
	String Year2011 = AcrActionForm.getYear2011();
        String Status11 = AcrActionForm.getStatus11();
	String Year2012 = AcrActionForm.getYear2012();
        String Status12 = AcrActionForm.getStatus12();
	String Year2013 = AcrActionForm.getYear2013();
        String Status13 = AcrActionForm.getStatus13();
	String Year2014 = AcrActionForm.getYear2014();
        String Status14 = AcrActionForm.getStatus14();
        String User_id = AcrActionForm.getUser_id();
        System.out.println("frgfdgfdgfdgfdgfdgfdgfdgrd"+User_id);
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
                ||(Designation.matches("(.*)script(.*)"))|| (Year2013.matches("(.*)script(.*)"))
                 ||(Status13.matches("(.*)<(.*)"))|| (Year2013.matches("(.*)<(.*)"))
                ||(Status12.matches("(.*)<(.*)"))|| (Year2012.matches("(.*)script(.*)"))
                ||(Status11.matches("(.*)script(.*)"))|| (Year2011.matches("(.*)<(.*)"))
                ||(Status10.matches("(.*)<(.*)"))|| (Year2010.matches("(.*)<(.*)"))
                ||(Status9.matches("(.*)<(.*)"))|| (Year2009.matches("(.*)<(.*)"))
                ||(Status8.matches("(.*)<(.*)"))|| (Year2008.matches("(.*)<(.*)"))
                ||(Status7.matches("(.*)<(.*)"))|| (Year2007.matches("(.*)<(.*)"))
                ||(Status6.matches("(.*)<(.*)"))|| (Year2006.matches("(.*)<(.*)"))
                ||(Status5.matches("(.*)<(.*)"))|| (Year2005.matches("(.*)<(.*)"))
                ||(Status4.matches("(.*)<(.*)"))|| (Year2004.matches("(.*)<(.*)"))
                ||(Status3.matches("(.*)<(.*)"))|| (Year2003.matches("(.*)<(.*)"))
                ||(Status2.matches("(.*)<(.*)"))|| (Year2002.matches("(.*)<(.*)"))
                ||(Status1.matches("(.*)<(.*)"))|| (Year2001.matches("(.*)<(.*)"))
                ||(Status.matches("(.*)<(.*)"))|| (Date_of_Birth.matches("(.*)<(.*)"))
                ||(Designation.matches("(.*)<(.*)"))|| (Year2013.matches("(.*)<(.*)"))
                 ||(Status13.matches("(.*)SCRIPT(.*)"))|| (Year2013.matches("(.*)SCRIPT(.*)"))
                ||(Status12.matches("(.*)SCRIPT(.*)"))|| (Year2012.matches("(.*)SCRIPT(.*)"))
                ||(Status11.matches("(.*)SCRIPT(.*)"))|| (Year2011.matches("(.*)SCRIPT(.*)"))
                ||(Status10.matches("(.*)SCRIPT(.*)"))|| (Year2010.matches("(.*)SCRIPT(.*)"))
                ||(Status9.matches("(.*)SCRIPT(.*)"))|| (Year2009.matches("(.*)SCRIPT(.*)"))
                ||(Status8.matches("(.*)SCRIPT(.*)"))|| (Year2008.matches("(.*)SCRIPT(.*)"))
                ||(Status7.matches("(.*)SCRIPT(.*)"))|| (Year2007.matches("(.*)SCRIPT(.*)"))
                ||(Status6.matches("(.*)SCRIPT(.*)"))|| (Year2006.matches("(.*)SCRIPT(.*)"))
                ||(Status5.matches("(.*)SCRIPT(.*)"))|| (Year2005.matches("(.*)SCRIPT(.*)"))
                ||(Status4.matches("(.*)SCRIPT(.*)"))|| (Year2004.matches("(.*)SCRIPT(.*)"))
                ||(Status3.matches("(.*)SCRIPT(.*)"))|| (Year2003.matches("(.*)SCRIPT(.*)"))
                ||(Status2.matches("(.*)SCRIPT(.*)"))|| (Year2002.matches("(.*)SCRIPT(.*)"))
                ||(Status1.matches("(.*)SCRIPT(.*)"))|| (Year2001.matches("(.*)SCRIPT(.*)"))
                ||(Status.matches("(.*)SCRIPT(.*)"))|| (Date_of_Birth.matches("(.*)SCRIPT(.*)"))
                ||(Designation.matches("(.*)SCRIPT(.*)"))|| (Year2013.matches("(.*)SCRIPT(.*)"))
                ||(Status13.matches("(.*)>(.*)"))|| (Year2013.matches("(.*)>(.*)"))
                ||(Status12.matches("(.*)>(.*)"))|| (Year2012.matches("(.*)>(.*)"))
                ||(Status11.matches("(.*)>(.*)"))|| (Year2011.matches("(.*)>(.*)"))
                ||(Status10.matches("(.*)>(.*)"))|| (Year2010.matches("(.*)>(.*)"))
                ||(Status9.matches("(.*)>(.*)"))|| (Year2009.matches("(.*)>(.*)"))
                ||(Status8.matches("(.*)>(.*)"))|| (Year2008.matches("(.*)>(.*)"))
                ||(Status7.matches("(.*)>(.*)"))|| (Year2007.matches("(.*)>(.*)"))
                ||(Status6.matches("(.*)>(.*)"))|| (Year2006.matches("(.*)>(.*)"))
                ||(Status5.matches("(.*)>(.*)"))|| (Year2005.matches("(.*)>(.*)"))
                ||(Status4.matches("(.*)>(.*)"))|| (Year2004.matches("(.*)>(.*)"))
                ||(Status3.matches("(.*)>(.*)"))|| (Year2003.matches("(.*)>(.*)"))
                ||(Status2.matches("(.*)>(.*)"))|| (Year2002.matches("(.*)>(.*)"))
                ||(Status1.matches("(.*)>(.*)"))|| (Year2001.matches("(.*)>(.*)"))
                ||(Status.matches("(.*)>(.*)"))|| (Date_of_Birth.matches("(.*)>(.*)"))
                ||(Designation.matches("(.*)>(.*)"))|| (Year2013.matches("(.*)>(.*)"))
                 ||(Year2000.matches("(.*)>SCRIPT(.*)"))|| (Year2000.matches("(.*)>(.*)"))
                  ||(Year2000.matches("(.*)>script(.*)"))|| (Year2000.matches("(.*)<(.*)"))
                )  {
	System.out.println("pattern unmatches Budget..");
          response.sendRedirect("staterror.jsp");


         } else {
         System.out.println("Date of Birth"+Date_of_Birth);
          int length = Date_of_Birth.length();

    System.out.println("Length = " + length);
        if (!(Date_of_Birth.substring(0, 1).matches("[1-1]"))||!(Date_of_Birth.substring(1, 2).matches("[9-9]"))||!(Date_of_Birth.substring(2, 3).matches("[1-8]"))||!(Date_of_Birth.substring(3, 4).matches("[1-8]")))  {
	System.out.println("pattern matches with invalid input");
         response.sendRedirect("staterror.jsp");
        }
         else {
        
        
        System.out.println("Inserting values in Mysql database table!");
//  try{
  
  
  Connection  con = ConnectionManager.getConnectionDirectForMySQL();

                         try{

                     AcrInsert updat =new AcrInsert();
                     int i= updat.insert(Name1, Designation, Date_of_Birth, Year2004, Status, Year2005, Status1, Year2006, Status2, Year2007, Status3, Year2008, Status4, Year2009, Status5, Year2010, Status6, Year2011, Status7, Year2012, Status8, Year2013, Status9, Year2014, Status10, Year2000, Status11, Year2001, Status12, Year2002, Status13, Year2003, Status14, User_id);
     		  System.out.println("1 row affected" +i);


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

   }}}
                            return mapping.findForward(SUCCESS);
                                 }


}