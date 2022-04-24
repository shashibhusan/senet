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
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import roseindia.net.ConnectionManager;

/**
 *
 * @author eswar@vaannila.com
 */
public class EsdpActionAction extends DispatchAction {

    /* forward name="success" path="" */
    private final static String SUCCESS = "success";
    private final static String FAILURE = "failure";

    /**
     * This is the Struts action method called on
     * http://.../actionPath?method=myAction1,
     * where "method" is the value specified in <action> element : 
     * ( <action parameter="method" .../> )
     */
    public ActionForward Submit(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        EsdpActionForm EsdpActionForm = (EsdpActionForm) form;
         HttpSession session = request.getSession(true);
             String Random5=(String)session.getAttribute("Random5");
             System.out.println("financial random number"+Random5);
             String Mnm = EsdpActionForm.getMnm();

                System.out.println("financial random number second"+Mnm);
                if(!Random5.equals(Mnm))
    //  if(!OWASP_CSRFTOKENN.equals(OWASP_CSRFTOKEN))

{ response.sendRedirect("staterror.jsp");
   } else {
        int Amc_of_pc = EsdpActionForm.getAmc_of_pc();
        int Amc_of_pc1 = EsdpActionForm.getAmc_of_pc1();
        int Amc_of_pc2 = EsdpActionForm.getAmc_of_pc2();



         String InstId=(String)session.getAttribute("CmbIns");
        String Years=(String)session.getAttribute("CmbYear");
        int Months=Integer.parseInt((String)session.getAttribute("CmbMonth"));

System.out.println(Amc_of_pc);
System.out.println(Amc_of_pc1);
System.out.println(Amc_of_pc2);
System.out.println(InstId);
System.out.println(Years);
System.out.println(Months);

        String User_date = EsdpActionForm.getUser_date();
       // String InstId = EsdpActionForm.getInstId();


        String Branch_4 = EsdpActionForm.getBranch_4();
        int Br_hardware_target_4 = EsdpActionForm.getBr_hardware_target_4();
        int Br_hardware_tomonth_4 = EsdpActionForm.getBr_hardware_tomonth_4();
        int Br_hardware_upto_4 = EsdpActionForm.getBr_hardware_upto_4();

        String Branch_1 = EsdpActionForm.getBranch_1();
        int Br_hardware_target_1 = EsdpActionForm.getBr_hardware_target_1();
        int Br_hardware_tomonth_1 = EsdpActionForm.getBr_hardware_tomonth_1();
        int Br_hardware_upto_1 = EsdpActionForm.getBr_hardware_upto_1();

        String Branch_2 = EsdpActionForm.getBranch_2();
        int Br_hardware_target_2 = EsdpActionForm.getBr_hardware_target_2();
        int Br_hardware_tomonth_2 = EsdpActionForm.getBr_hardware_tomonth_2();
        int Br_hardware_upto_2 = EsdpActionForm.getBr_hardware_upto_2();

        String Branch_3 = EsdpActionForm.getBranch_3();
        int Br_hardware_target_3 = EsdpActionForm.getBr_hardware_target_3();
        int Br_hardware_tomonth_3 = EsdpActionForm.getBr_hardware_tomonth_3();
        int Br_hardware_upto_3 = EsdpActionForm.getBr_hardware_upto_3();


        String Branch_5 = EsdpActionForm.getBranch_5();
        int Br_hardware_target_5 = EsdpActionForm.getBr_hardware_target_5();
        int Br_hardware_tomonth_5 = EsdpActionForm.getBr_hardware_tomonth_5();
        int Br_hardware_upto_5 = EsdpActionForm.getBr_hardware_upto_5();

         String Branch = EsdpActionForm.getBranch();
        int Br_hardware_target = EsdpActionForm.getBr_hardware_target();
        int Br_hardware_tomonth = EsdpActionForm.getBr_hardware_tomonth();
        int Br_hardware_upto = EsdpActionForm.getBr_hardware_upto();

 if(Amc_of_pc1< 0
|| Amc_of_pc< 0
                ||Amc_of_pc2< 0

  ||Br_hardware_target<0 || Br_hardware_tomonth<0 || Br_hardware_upto <0
                      ||Br_hardware_target_1<0 || Br_hardware_tomonth_1<0 || Br_hardware_upto_1 <0
                        ||Br_hardware_target_2<0 || Br_hardware_tomonth_2<0 || Br_hardware_upto_2 <0
                          ||Br_hardware_target_3<0 || Br_hardware_tomonth_3<0 || Br_hardware_upto_3 <0
                            ||Br_hardware_target_4<0 || Br_hardware_tomonth_4<0 || Br_hardware_upto_4 <0
                              ||Br_hardware_target_5<0 || Br_hardware_tomonth_5<0 || Br_hardware_upto_5 <0  )

{ response.sendRedirect("staterror.jsp");
   } else {

 Connection  con = ConnectionManager.getConnectionDirectForMySQL();
 
 try{

  LibUpdate updatt =new LibUpdate();

  int i=updatt.update(InstId, Months, Years, Amc_of_pc1, Amc_of_pc2, Amc_of_pc, Br_hardware_target, Br_hardware_tomonth, Br_hardware_upto, Br_hardware_target_1, Br_hardware_tomonth_1, Br_hardware_upto_1, Br_hardware_target_2, Br_hardware_tomonth_2, Br_hardware_upto_2, Br_hardware_target_3, Br_hardware_tomonth_3, Br_hardware_upto_3, Br_hardware_target_4, Br_hardware_tomonth_4, Br_hardware_upto_4, Br_hardware_target_5, Br_hardware_tomonth_5, Br_hardware_upto_5);
System.out.println("Record updated" +i);


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

      
                            

        
  
        
    public ActionForward submit(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
         
                            
EsdpActionForm EsdpActionForm = (EsdpActionForm) form;
 HttpSession session = request.getSession(true);
             String Random5=(String)session.getAttribute("Random5");
             System.out.println("financial random number"+Random5);
             String Mnm = EsdpActionForm.getMnm();

                System.out.println("financial random number second"+Mnm);
                if(!Random5.equals(Mnm))
    //  if(!OWASP_CSRFTOKENN.equals(OWASP_CSRFTOKEN))

{ response.sendRedirect("staterror.jsp");
   } else {
       int Amc_of_pc = EsdpActionForm.getAmc_of_pc();
        int Amc_of_pc1 = EsdpActionForm.getAmc_of_pc1();
        int Amc_of_pc2 = EsdpActionForm.getAmc_of_pc2();



         String InstId=(String)session.getAttribute("CmbIns");
        String Years=(String)session.getAttribute("CmbYear");
        int Months=Integer.parseInt((String)session.getAttribute("CmbMonth"));



        String User_date = EsdpActionForm.getUser_date();
       // String InstId = EsdpActionForm.getInstId();


        String Branch_4 = EsdpActionForm.getBranch_4();
        int Br_hardware_target_4 = EsdpActionForm.getBr_hardware_target_4();
        int Br_hardware_tomonth_4 = EsdpActionForm.getBr_hardware_tomonth_4();
        int Br_hardware_upto_4 = EsdpActionForm.getBr_hardware_upto_4();

        String Branch_1 = EsdpActionForm.getBranch_1();
        int Br_hardware_target_1 = EsdpActionForm.getBr_hardware_target_1();
        int Br_hardware_tomonth_1 = EsdpActionForm.getBr_hardware_tomonth_1();
        int Br_hardware_upto_1 = EsdpActionForm.getBr_hardware_upto_1();

        String Branch_2 = EsdpActionForm.getBranch_2();
        int Br_hardware_target_2 = EsdpActionForm.getBr_hardware_target_2();
        int Br_hardware_tomonth_2 = EsdpActionForm.getBr_hardware_tomonth_2();
        int Br_hardware_upto_2 = EsdpActionForm.getBr_hardware_upto_2();

        String Branch_3 = EsdpActionForm.getBranch_3();
        int Br_hardware_target_3 = EsdpActionForm.getBr_hardware_target_3();
        int Br_hardware_tomonth_3 = EsdpActionForm.getBr_hardware_tomonth_3();
        int Br_hardware_upto_3 = EsdpActionForm.getBr_hardware_upto_3();


        String Branch_5 = EsdpActionForm.getBranch_5();
        int Br_hardware_target_5 = EsdpActionForm.getBr_hardware_target_5();
        int Br_hardware_tomonth_5 = EsdpActionForm.getBr_hardware_tomonth_5();
        int Br_hardware_upto_5 = EsdpActionForm.getBr_hardware_upto_5();

         String Branch = EsdpActionForm.getBranch();
        int Br_hardware_target = EsdpActionForm.getBr_hardware_target();
        int Br_hardware_tomonth = EsdpActionForm.getBr_hardware_tomonth();
            int Br_hardware_upto = EsdpActionForm.getBr_hardware_upto();
        if(Amc_of_pc1< 0
|| Amc_of_pc< 0
                ||Amc_of_pc2< 0

  ||Br_hardware_target<0 || Br_hardware_tomonth<0 || Br_hardware_upto <0
                      ||Br_hardware_target_1<0 || Br_hardware_tomonth_1<0 || Br_hardware_upto_1 <0
                        ||Br_hardware_target_2<0 || Br_hardware_tomonth_2<0 || Br_hardware_upto_2 <0
                          ||Br_hardware_target_3<0 || Br_hardware_tomonth_3<0 || Br_hardware_upto_3 <0
                            ||Br_hardware_target_4<0 || Br_hardware_tomonth_4<0 || Br_hardware_upto_4 <0
                              ||Br_hardware_target_5<0 || Br_hardware_tomonth_5<0 || Br_hardware_upto_5 <0  )

{ response.sendRedirect("staterror.jsp");
   } else {

        
     System.out.println(Branch);
     System.out.println(Br_hardware_target_1);
     System.out.println(Br_hardware_tomonth);
     System.out.println(Br_hardware_upto);
        
        System.out.println(Branch_1);
     System.out.println(Br_hardware_target);
     System.out.println(Br_hardware_upto_1);
     System.out.println(Br_hardware_tomonth_1);
     
        System.out.println("Inserting values in Mysql database table!");
  
  //  try{
  
  Connection  con = ConnectionManager.getConnectionDirectForMySQL();

                         try{

                     LibInsert updat =new LibInsert();
                     int i= updat.insert(InstId, Months, Years, Amc_of_pc1, Amc_of_pc2, Amc_of_pc, Br_hardware_target, Br_hardware_tomonth, Br_hardware_upto, Br_hardware_target_1, Br_hardware_tomonth_1, Br_hardware_upto_1, Br_hardware_target_2, Br_hardware_tomonth_2, Br_hardware_upto_2, Br_hardware_target_3, Br_hardware_tomonth_3, Br_hardware_upto_3, Br_hardware_target_4, Br_hardware_tomonth_4, Br_hardware_upto_4, Br_hardware_target_5, Br_hardware_tomonth_5, Br_hardware_upto_5);
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

   }}
                            return mapping.findForward(SUCCESS);
                                 }


}