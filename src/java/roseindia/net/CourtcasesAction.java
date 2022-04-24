/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package roseindia.net;
import java.sql.Connection;
import java.text.DateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CourtcasesAction  extends  org.apache.struts.action.Action
{
    /* forward name="success" path="" */
    private final static String SUCCESS = "success";
    private final static String FAILURE = "failure";
            public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
             CourtcasesForm CourtcasesForm = (CourtcasesForm) form;
             HttpSession session = request.getSession(true);
             String Random5=(String)session.getAttribute("Random5");
             String Mnm = CourtcasesForm.getMnm();
                if(!Random5.equals(Mnm))
{ response.sendRedirect("staterror.jsp");
   } else {
         String Id=(String)session.getAttribute("CmbIns");
   String InstId=common.ConnectionManager.instituteName(Id);
        int Months=Integer.parseInt((String)session.getAttribute("CmbMonth"));
          String Years=(String)session.getAttribute("CmbYear");
             String Name_of_Advocate=request.getParameter("Name_of_Advocate");
             String Contact_No=request.getParameter("Contact_No");
             String Email_Id=request.getParameter("Email_Id");
             String Phone=request.getParameter("Phone");
         String Serial_number = CourtcasesForm.getSerial_number();
          String Status_of_case = CourtcasesForm.getStatus_of_case();
           String Nature_of_court = CourtcasesForm.getNature_of_court();
            String Detail_of_case = CourtcasesForm.getDetail_of_case();
             String Cases_related_to = CourtcasesForm.getCases_related_to();
              String Stakes_involved = CourtcasesForm.getStakes_involved();
               String Detail_of_application = CourtcasesForm.getDetail_of_application();
               String Present_status_of_the_case = CourtcasesForm.getPresent_status_of_the_case();
                String Year_of_case = CourtcasesForm.getYear_of_case();
                 String Affidavit_date_of_filing_CA = CourtcasesForm.getAffidavit_date_of_filing_CA();
                  String Expected_date_of_filing = CourtcasesForm.getExpected_date_of_filing();
                  String Date_of_next_hearing = CourtcasesForm.getDate_of_next_hearing();
                    String Controlling_Officers = CourtcasesForm.getControlling_Officers();
                    String Status = CourtcasesForm.getStatus();

                   java.util.Date utilDate = new Date();

                    java.sql.Date date = new java.sql.Date(utilDate.getTime());


                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        	Date date1 = sdf.parse(Affidavit_date_of_filing_CA);
        	Date date2 = sdf.parse(Date_of_next_hearing);
                Date date3 = sdf.parse(Expected_date_of_filing);

                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date date4 = new Date();
                System.out.println(dateFormat.format(date4));


        System.out.println("Inserting values in Mysql database table!");
if ( (Serial_number.matches("(.*)<(.*)")) || (Serial_number.matches("(.*)script(.*)")) || (Status_of_case.matches("(.*)<(.*)")) || (Status_of_case.matches("(.*)script(.*)")) || (Nature_of_court.matches("(.*)<(.*)")) || (Nature_of_court.matches("(.*)script(.*)")) || (Detail_of_case.matches("(.*)script(.*)"))
                ||(Cases_related_to.matches("(.*)script(.*)"))|| (Cases_related_to.matches("(.*)<(.*)"))
                ||(Stakes_involved.matches("(.*)script(.*)"))|| (Stakes_involved.matches("(.*)<(.*)"))
                ||(Detail_of_application.matches("(.*)script(.*)"))|| (Detail_of_application.matches("(.*)<(.*)"))
                ||(Present_status_of_the_case.matches("(.*)script(.*)"))|| (Present_status_of_the_case.matches("(.*)<(.*)"))
                ||(Year_of_case.matches("(.*)script(.*)"))|| (Year_of_case.matches("(.*)<(.*)"))
                ||(Affidavit_date_of_filing_CA.matches("(.*)script(.*)"))|| (Affidavit_date_of_filing_CA.matches("(.*)<(.*)"))
                ||(Expected_date_of_filing.matches("(.*)script(.*)"))|| (Expected_date_of_filing.matches("(.*)<(.*)"))
                ||(Date_of_next_hearing.matches("(.*)script(.*)"))|| (Date_of_next_hearing.matches("(.*)<(.*)"))
                ||(Controlling_Officers.matches("(.*)script(.*)"))|| (Controlling_Officers.matches("(.*)<(.*)"))
                ||(Status.matches("(.*)script(.*)"))|| (Status.matches("(.*)<(.*)"))
               )  {
	System.out.println("pattern unmatches.........");
          response.sendRedirect("staterror.jsp");
}
else {

          if((date4.compareTo(date1)>0)  || (date4.compareTo(date2)>0)|| (date4.compareTo(date3)>0))
 {
	System.out.println("pattern unmatches .......");
          response.sendRedirect("staterror.jsp");
}
else {


        System.out.println("Inserting values in Mysql database table!");

  Connection  con = ConnectionManager.getConnectionDirectForMySQL();
 
      try{

                     CourtCasesInsert updat =new CourtCasesInsert();
                     int i= updat.insert(Serial_number, Detail_of_case, date, Stakes_involved, Status, Detail_of_application, Present_status_of_the_case, Months, Years, InstId, Nature_of_court, Controlling_Officers, Date_of_next_hearing, Expected_date_of_filing, Affidavit_date_of_filing_CA, Cases_related_to, Year_of_case, Status_of_case,Name_of_Advocate,Contact_No,Email_Id,Phone);
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
   }
   }

   }
                            return mapping.findForward(SUCCESS);
                                 }


}