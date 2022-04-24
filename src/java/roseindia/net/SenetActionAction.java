/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package roseindia.net;

import java.sql.Connection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

/**
 *
 * @author eswar@vaannila.com
 */
public class SenetActionAction extends DispatchAction {

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
         
        SenetActionForm SenetActionForm = (SenetActionForm) form;
         HttpSession session = request.getSession(true);
             String Random5=(String)session.getAttribute("Random5");

             String Mnm = SenetActionForm.getMnm();
 
                if(!Random5.equals(Mnm))
     

{
                    return mapping.findForward(FAILURE);
   } else {

                  int Amc_of_pc = SenetActionForm.getAmc_of_pc();
        int Amc_of_pc1 = SenetActionForm.getAmc_of_pc1();
        int Amc_of_pc2 = SenetActionForm.getAmc_of_pc2();
        int Web = SenetActionForm.getWeb();
        int Web1 = SenetActionForm.getWeb1();
        int Web2 = SenetActionForm.getWeb2();
        int Connectivity = SenetActionForm.getConnectivity();
        int Connectivity1 = SenetActionForm.getConnectivity1();
        int Connectivity2 = SenetActionForm.getConnectivity2();
        int Contg = SenetActionForm.getContg();
        int Contg1 = SenetActionForm.getContg1();
        int Contg2 = SenetActionForm.getContg2();
        int Others = SenetActionForm.getOthers();
        int Others1 = SenetActionForm.getOthers1();
        int Others2 = SenetActionForm.getOthers2();


        String Branch = SenetActionForm.getBranch();
         System.out.println("xxxxxxxxxxBranch xxxxxxx++++++==="+Branch);

        int Br_hardware_target = SenetActionForm.getBr_hardware_target();
        int Br_hardware_tomonth = SenetActionForm.getBr_hardware_tomonth();
        int Br_hardware_upto = SenetActionForm.getBr_hardware_upto();

        int Br_con_target = SenetActionForm.getBr_con_target();
        int Br_con_tomonth = SenetActionForm.getBr_con_tomonth();
        int Br_con_upto = SenetActionForm.getBr_con_upto();

        String Branch_1 = SenetActionForm.getBranch_1();
       System.out.println("xxxxxxxxxxBranch_1xxxxxxx++++++==="+Branch_1);

        int Br_hardware_target_1 = SenetActionForm.getBr_hardware_target_1();
        int Br_hardware_tomonth_1 = SenetActionForm.getBr_hardware_tomonth_1();
        int Br_hardware_upto_1 = SenetActionForm.getBr_hardware_upto_1();

        int Br_con_target_1 = SenetActionForm.getBr_con_target_1();
        int Br_con_tomonth_1 = SenetActionForm.getBr_con_tomonth_1();
        int Br_con_upto_1 = SenetActionForm.getBr_con_upto_1();

        String Branch_2 = SenetActionForm.getBranch_2();
        System.out.println("xxxxxxxxxxBranch_2xxxxxxx++++++==="+Branch_2);

        int Br_hardware_target_2 = SenetActionForm.getBr_hardware_target_2();
        int Br_hardware_tomonth_2 = SenetActionForm.getBr_hardware_tomonth_2();
        int Br_hardware_upto_2 = SenetActionForm.getBr_hardware_upto_2();

        int Br_con_target_2 = SenetActionForm.getBr_con_target_2();
        int Br_con_tomonth_2 = SenetActionForm.getBr_con_tomonth_2();
        int Br_con_upto_2 = SenetActionForm.getBr_con_upto_2();

        String Branch_3 = SenetActionForm.getBranch_3();
        System.out.println("xxxxxxxxxxBranch_3xxxxxxx++++++==="+Branch_3);

        int Br_hardware_target_3 = SenetActionForm.getBr_hardware_target_3();
        int Br_hardware_tomonth_3 = SenetActionForm.getBr_hardware_tomonth_3();
        int Br_hardware_upto_3 = SenetActionForm.getBr_hardware_upto_3();

        int Br_con_target_3 = SenetActionForm.getBr_con_target_3();
        int Br_con_tomonth_3 = SenetActionForm.getBr_con_tomonth_3();
        int Br_con_upto_3 = SenetActionForm.getBr_con_upto_3();


        String Branch_4 = SenetActionForm.getBranch_4();
        System.out.println("xxxxxxxxxxBranch_4xxxxxxx++++++==="+Branch_4);

        int Br_hardware_target_4 = SenetActionForm.getBr_hardware_target_4();
        int Br_hardware_tomonth_4 = SenetActionForm.getBr_hardware_tomonth_4();
        int Br_hardware_upto_4 = SenetActionForm.getBr_hardware_upto_4();

        int Br_con_target_4 = SenetActionForm.getBr_con_target_4();
        int Br_con_tomonth_4 = SenetActionForm.getBr_con_tomonth_4();
        int Br_con_upto_4 = SenetActionForm.getBr_con_upto_4();

        String Branch_5 = SenetActionForm.getBranch_5();
        System.out.println("xxxxxxxxxxBranch_5xxxxxxx++++++==="+Branch_5);

        int Br_hardware_target_5 = SenetActionForm.getBr_hardware_target_5();
        int Br_hardware_tomonth_5 = SenetActionForm.getBr_hardware_tomonth_5();
        int Br_hardware_upto_5 = SenetActionForm.getBr_hardware_upto_5();

        int Br_con_target_5 = SenetActionForm.getBr_con_target_5();
        int Br_con_tomonth_5 = SenetActionForm.getBr_con_tomonth_5();
        int Br_con_upto_5 = SenetActionForm.getBr_con_upto_5();



          int Br_contg_target = SenetActionForm.getBr_contg_target();
        int Br_contg_tomonth = SenetActionForm.getBr_contg_tomonth();
        int Br_contg_upto = SenetActionForm.getBr_contg_upto();

        int Br_others_target = SenetActionForm.getBr_others_target();
        int Br_others_tomonth = SenetActionForm.getBr_others_tomonth();
        int Br_others_upto = SenetActionForm.getBr_others_upto();


          int Br_contg_target_1 = SenetActionForm.getBr_contg_target_1();
        int Br_contg_tomonth_1 = SenetActionForm.getBr_contg_tomonth_1();
        int Br_contg_upto_1 = SenetActionForm.getBr_contg_upto_1();

        int Br_others_target_1 = SenetActionForm.getBr_others_target_1();
        int Br_others_tomonth_1 = SenetActionForm.getBr_others_tomonth_1();
        int Br_others_upto_1 = SenetActionForm.getBr_others_upto_1();



          int Br_contg_target_2 = SenetActionForm.getBr_contg_target_2();
        int Br_contg_tomonth_2 = SenetActionForm.getBr_contg_tomonth_2();
        int Br_contg_upto_2 = SenetActionForm.getBr_contg_upto_2();

        int Br_others_target_2 = SenetActionForm.getBr_others_target_2();
        int Br_others_tomonth_2 = SenetActionForm.getBr_others_tomonth_2();
        int Br_others_upto_2 = SenetActionForm.getBr_others_upto_2();



          int Br_contg_target_3 = SenetActionForm.getBr_contg_target_3();
        int Br_contg_tomonth_3 = SenetActionForm.getBr_contg_tomonth_3();
        int Br_contg_upto_3 = SenetActionForm.getBr_contg_upto_3();

        int Br_others_target_3 = SenetActionForm.getBr_others_target_3();
        int Br_others_tomonth_3 = SenetActionForm.getBr_others_tomonth_3();
        int Br_others_upto_3 = SenetActionForm.getBr_others_upto_3();



          int Br_contg_target_4 = SenetActionForm.getBr_contg_target_4();
        int Br_contg_tomonth_4 = SenetActionForm.getBr_contg_tomonth_4();
        int Br_contg_upto_4 = SenetActionForm.getBr_contg_upto_4();

        int Br_others_target_4 = SenetActionForm.getBr_others_target_4();
        int Br_others_tomonth_4 = SenetActionForm.getBr_others_tomonth_4();
        int Br_others_upto_4 = SenetActionForm.getBr_others_upto_4();



          int Br_contg_target_5 = SenetActionForm.getBr_contg_target_5();
        int Br_contg_tomonth_5 = SenetActionForm.getBr_contg_tomonth_5();
        int Br_contg_upto_5 = SenetActionForm.getBr_contg_upto_5();
        
        int Br_others_target_5 = SenetActionForm.getBr_others_target_5();
        int Br_others_tomonth_5 = SenetActionForm.getBr_others_tomonth_5();
        int Br_others_upto_5 = SenetActionForm.getBr_others_upto_5();



if(Amc_of_pc1< 0 ||Web1<0 || Connectivity1<0 ||Contg1<0 ||Others1<0
|| Amc_of_pc< 0 ||Web<0 || Connectivity<0 ||Contg<0 ||Others<0
                ||Amc_of_pc2< 0 ||Web2<0 || Connectivity2<0 ||Contg2<0 ||Others2<0)

{ return mapping.findForward(FAILURE);
   } else {


         String InstId=(String)session.getAttribute("CmbIns");
        String Years=(String)session.getAttribute("CmbYear");
        int Months=Integer.parseInt((String)session.getAttribute("CmbMonth"));



        //String Years = SenetActionForm.getYears();
       // int Months = SenetActionForm.getMonths();
        String User_date = SenetActionForm.getUser_date();
       // String InstId = SenetActionForm.getInstId();

     request.setAttribute("Amc_of_pc",SenetActionForm.getAmc_of_pc());
     request.setAttribute("Amc_of_pc1",SenetActionForm.getAmc_of_pc1());
     request.setAttribute("Amc_of_pc2",SenetActionForm.getAmc_of_pc2());
     request.setAttribute("Web",SenetActionForm.getWeb());
     request.setAttribute("Web1",SenetActionForm.getWeb1());
     request.setAttribute("Web2",SenetActionForm.getWeb2());
     request.setAttribute("Connectivity",SenetActionForm.getConnectivity());
     request.setAttribute("Connectivity1",SenetActionForm.getConnectivity1());
     request.setAttribute("Connectivity2",SenetActionForm.getConnectivity2());
     request.setAttribute("Contg",SenetActionForm.getContg());
     request.setAttribute("Contg1",SenetActionForm.getContg1());
     request.setAttribute("Contg2",SenetActionForm.getContg2());
     request.setAttribute("Others",SenetActionForm.getOthers());
     request.setAttribute("Others1",SenetActionForm.getOthers1());
       request.setAttribute("Others2",SenetActionForm.getOthers2());

        request.setAttribute("Years",SenetActionForm.getYears());
     request.setAttribute("Months",SenetActionForm.getMonths());
     request.setAttribute("User_date",SenetActionForm.getUser_date());
       request.setAttribute("InstId",SenetActionForm.getInstId());

        System.out.println("Inserting values in Mysql database table!");
//  try{
 Connection  con = ConnectionManager.getConnectionDirectForMySQL();
 try{

  SenetUpdate updatt =new SenetUpdate();

  int i=updatt.update(InstId, Months, Years, Amc_of_pc1, Web1, Connectivity1, Contg1, Others1, User_date, Amc_of_pc2, Web2, Connectivity2, Contg2, Others2, Amc_of_pc, Web, Connectivity, Contg, Others, Br_hardware_tomonth, Br_con_tomonth, Br_contg_tomonth, Br_others_tomonth, Br_hardware_tomonth_1, Br_con_tomonth_1, Br_contg_tomonth_1, Br_others_tomonth_1, Br_hardware_tomonth_2, Br_con_tomonth_2, Br_contg_tomonth_2, Br_others_tomonth_2, Br_hardware_tomonth_3, Br_contg_tomonth_3, Br_others_tomonth_3, Br_hardware_tomonth_4, Br_con_tomonth_4, Br_contg_tomonth_4, Br_others_tomonth_4, Br_hardware_tomonth_5, Br_con_tomonth_5, Br_contg_tomonth_5, Br_others_tomonth_5, Br_con_tomonth_3,Branch,Branch_1,Branch_2,Branch_3,Branch_4,Branch_5);
System.out.println(" row affected is : " +i);

BranchUpdate bd=new BranchUpdate();
                  int returnValue=bd.Update(InstId,Months,Years,
                          Branch,   Br_hardware_target,   Br_hardware_tomonth,   Br_hardware_upto,   Br_con_target,   Br_con_tomonth,   Br_con_upto,Br_contg_target,      Br_contg_tomonth,   Br_contg_upto,   Br_others_target,   Br_others_tomonth,   Br_others_upto,
                          Branch_1, Br_hardware_target_1, Br_hardware_tomonth_1, Br_hardware_upto_1, Br_con_target_1, Br_con_tomonth_1, Br_con_upto_1, Br_contg_target_1, Br_contg_tomonth_1, Br_contg_upto_1, Br_others_target_1, Br_others_tomonth_1, Br_others_upto_1,
                          Branch_2, Br_hardware_target_2, Br_hardware_tomonth_2, Br_hardware_upto_2, Br_con_target_2, Br_con_tomonth_2, Br_con_upto_2, Br_contg_target_2, Br_contg_tomonth_2, Br_contg_upto_2, Br_others_target_2, Br_others_tomonth_2, Br_others_upto_2,
                          Branch_3, Br_hardware_target_3, Br_hardware_tomonth_3, Br_hardware_upto_3, Br_con_target_3, Br_con_tomonth_3, Br_con_upto_3, Br_contg_target_3, Br_contg_tomonth_3, Br_contg_upto_3, Br_others_target_3, Br_others_tomonth_3, Br_others_upto_3,
                          Branch_4, Br_hardware_target_4, Br_hardware_tomonth_4, Br_hardware_upto_4, Br_con_target_4, Br_con_tomonth_4, Br_con_upto_4, Br_contg_target_4, Br_contg_tomonth_4, Br_contg_upto_4, Br_others_target_4, Br_others_tomonth_4, Br_others_upto_4,
                          Branch_5, Br_hardware_target_5, Br_hardware_tomonth_5, Br_hardware_upto_5, Br_con_target_5, Br_con_tomonth_5, Br_con_upto_5, Br_contg_target_5, Br_contg_tomonth_5, Br_contg_upto_5, Br_others_target_5, Br_others_tomonth_5, Br_others_upto_5
                          );
                  System.out.println("value indise the returnValue will be "+returnValue);
                         if((i>0)&&(returnValue>0)){
                        System.out.println("Result Set have record");
                         return mapping.findForward(SUCCESS);
                        }
                        else{
                    System.out.println(" Result Set have not record");
                    return mapping.findForward(FAILURE);
                        }

                             }
                        catch (Exception e){
                            return mapping.findForward(FAILURE);
                             }

                }
   }
                                 }

    public ActionForward submit(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        SenetActionForm SenetActionForm = (SenetActionForm) form;
           HttpSession session = request.getSession(true);
             String Random5=(String)session.getAttribute("Random5");
             String Mnm = SenetActionForm.getMnm();
             
         

                if(!Random5.equals(Mnm))

{  return mapping.findForward(FAILURE);
   } else {
                    
          
                    
        int Amc_of_pc = SenetActionForm.getAmc_of_pc();
        int Amc_of_pc1 = SenetActionForm.getAmc_of_pc1();
        int Amc_of_pc2 = SenetActionForm.getAmc_of_pc2();
        int Web = SenetActionForm.getWeb();
        int Web1 = SenetActionForm.getWeb1();
        int Web2 = SenetActionForm.getWeb2();
        int Connectivity = SenetActionForm.getConnectivity();
        int Connectivity1 = SenetActionForm.getConnectivity1();
        int Connectivity2 = SenetActionForm.getConnectivity2();
        int Contg = SenetActionForm.getContg();
        int Contg1 = SenetActionForm.getContg1();
        int Contg2 = SenetActionForm.getContg2();
        int Others = SenetActionForm.getOthers();
        int Others1 = SenetActionForm.getOthers1();
        int Others2 = SenetActionForm.getOthers2();

         String InstId=(String)session.getAttribute("CmbIns");
        String Years=(String)session.getAttribute("CmbYear");
        int Months=Integer.parseInt((String)session.getAttribute("CmbMonth"));
        String User_date = SenetActionForm.getUser_date();

         String Branch = SenetActionForm.getBranch();

        int Br_hardware_target = SenetActionForm.getBr_hardware_target();
        int Br_hardware_tomonth = SenetActionForm.getBr_hardware_tomonth();
        int Br_hardware_upto = SenetActionForm.getBr_hardware_upto();

        int Br_con_target = SenetActionForm.getBr_con_target();
        int Br_con_tomonth = SenetActionForm.getBr_con_tomonth();
        int Br_con_upto = SenetActionForm.getBr_con_upto();

        String Branch_1 = SenetActionForm.getBranch_1();

        int Br_hardware_target_1 = SenetActionForm.getBr_hardware_target_1();
        int Br_hardware_tomonth_1 = SenetActionForm.getBr_hardware_tomonth_1();
        int Br_hardware_upto_1 = SenetActionForm.getBr_hardware_upto_1();

        int Br_con_target_1 = SenetActionForm.getBr_con_target_1();
        int Br_con_tomonth_1 = SenetActionForm.getBr_con_tomonth_1();
        int Br_con_upto_1 = SenetActionForm.getBr_con_upto_1();

        String Branch_2 = SenetActionForm.getBranch_2();
        System.out.println("xxxxxxxxxxxxBranch_2xxxxx++++++==="+Branch_2);

        int Br_hardware_target_2 = SenetActionForm.getBr_hardware_target_2();
        int Br_hardware_tomonth_2 = SenetActionForm.getBr_hardware_tomonth_2();
        int Br_hardware_upto_2 = SenetActionForm.getBr_hardware_upto_2();

        int Br_con_target_2 = SenetActionForm.getBr_con_target_2();
        int Br_con_tomonth_2 = SenetActionForm.getBr_con_tomonth_2();
        int Br_con_upto_2 = SenetActionForm.getBr_con_upto_2();

        String Branch_3 = SenetActionForm.getBranch_3();
        System.out.println("xxxxxxxxxxxxBranch_3xxxxx++++++==="+Branch_3);

        int Br_hardware_target_3 = SenetActionForm.getBr_hardware_target_3();
        int Br_hardware_tomonth_3 = SenetActionForm.getBr_hardware_tomonth_3();
        int Br_hardware_upto_3 = SenetActionForm.getBr_hardware_upto_3();

        int Br_con_target_3 = SenetActionForm.getBr_con_target_3();
        int Br_con_tomonth_3 = SenetActionForm.getBr_con_tomonth_3();
        int Br_con_upto_3 = SenetActionForm.getBr_con_upto_3();


        String Branch_4 = SenetActionForm.getBranch_4();
        System.out.println("xxxxxxxxxxxxBranch_4xxxxx++++++==="+Branch_4);

        int Br_hardware_target_4 = SenetActionForm.getBr_hardware_target_4();
        int Br_hardware_tomonth_4 = SenetActionForm.getBr_hardware_tomonth_4();
        int Br_hardware_upto_4 = SenetActionForm.getBr_hardware_upto_4();

        int Br_con_target_4 = SenetActionForm.getBr_con_target_4();
        int Br_con_tomonth_4 = SenetActionForm.getBr_con_tomonth_4();
        int Br_con_upto_4 = SenetActionForm.getBr_con_upto_4();

        String Branch_5 = SenetActionForm.getBranch_5();
        System.out.println("xxxxxxxxxxxxBranch_5xxxxx++++++==="+Branch_5);

        int Br_hardware_target_5 = SenetActionForm.getBr_hardware_target_5();
        int Br_hardware_tomonth_5 = SenetActionForm.getBr_hardware_tomonth_5();
        int Br_hardware_upto_5 = SenetActionForm.getBr_hardware_upto_5();

        int Br_con_target_5 = SenetActionForm.getBr_con_target_5();
        int Br_con_tomonth_5 = SenetActionForm.getBr_con_tomonth_5();
        int Br_con_upto_5 = SenetActionForm.getBr_con_upto_5();

        
          int Br_contg_target = SenetActionForm.getBr_contg_target();
        int Br_contg_tomonth = SenetActionForm.getBr_contg_tomonth();
        int Br_contg_upto = SenetActionForm.getBr_contg_upto();

        int Br_others_target = SenetActionForm.getBr_others_target();
        int Br_others_tomonth = SenetActionForm.getBr_others_tomonth();
        int Br_others_upto = SenetActionForm.getBr_others_upto();


          int Br_contg_target_1 = SenetActionForm.getBr_contg_target_1();
        int Br_contg_tomonth_1 = SenetActionForm.getBr_contg_tomonth_1();
        int Br_contg_upto_1 = SenetActionForm.getBr_contg_upto_1();

        int Br_others_target_1 = SenetActionForm.getBr_others_target_1();
        int Br_others_tomonth_1 = SenetActionForm.getBr_others_tomonth_1();
        int Br_others_upto_1 = SenetActionForm.getBr_others_upto_1();



          int Br_contg_target_2 = SenetActionForm.getBr_contg_target_2();
        int Br_contg_tomonth_2 = SenetActionForm.getBr_contg_tomonth_2();
        int Br_contg_upto_2 = SenetActionForm.getBr_contg_upto_2();

        int Br_others_target_2 = SenetActionForm.getBr_others_target_2();
        int Br_others_tomonth_2 = SenetActionForm.getBr_others_tomonth_2();
        int Br_others_upto_2 = SenetActionForm.getBr_others_upto_2();



          int Br_contg_target_3 = SenetActionForm.getBr_contg_target_3();
        int Br_contg_tomonth_3 = SenetActionForm.getBr_contg_tomonth_3();
        int Br_contg_upto_3 = SenetActionForm.getBr_contg_upto_3();

        int Br_others_target_3 = SenetActionForm.getBr_others_target_3();
        int Br_others_tomonth_3 = SenetActionForm.getBr_others_tomonth_3();
        int Br_others_upto_3 = SenetActionForm.getBr_others_upto_3();



          int Br_contg_target_4 = SenetActionForm.getBr_contg_target_4();
        int Br_contg_tomonth_4 = SenetActionForm.getBr_contg_tomonth_4();
        int Br_contg_upto_4 = SenetActionForm.getBr_contg_upto_4();

        int Br_others_target_4 = SenetActionForm.getBr_others_target_4();
        int Br_others_tomonth_4 = SenetActionForm.getBr_others_tomonth_4();
        int Br_others_upto_4 = SenetActionForm.getBr_others_upto_4();



          int Br_contg_target_5 = SenetActionForm.getBr_contg_target_5();
        int Br_contg_tomonth_5 = SenetActionForm.getBr_contg_tomonth_5();
        int Br_contg_upto_5 = SenetActionForm.getBr_contg_upto_5();
        
        int Br_others_target_5 = SenetActionForm.getBr_others_target_5();
        int Br_others_tomonth_5 = SenetActionForm.getBr_others_tomonth_5();
        int Br_others_upto_5 = SenetActionForm.getBr_others_upto_5();


              String captcha= request.getParameter("formcaptcha");
             String generated_Captcha=(String)session.getAttribute("key");
             int flag=0;
             System.out.println("this is raghav captcha page ==================senetActionAction.java====="+captcha);
             if(!generated_Captcha.endsWith(captcha))
             {
                 flag=1;
                 return mapping.findForward(FAILURE);
             }

if(Amc_of_pc1< 0 ||Web1<0 || Connectivity1<0 ||Contg1<0 ||Others1<0
|| Amc_of_pc< 0 ||Web<0 || Connectivity<0 ||Contg<0 ||Others<0
                ||Amc_of_pc2< 0 ||Web2<0 || Connectivity2<0 ||Contg2<0 ||Others2<0)

{  return mapping.findForward(FAILURE);
   } else {

     request.setAttribute("Amc_of_pc",SenetActionForm.getAmc_of_pc());
     request.setAttribute("Amc_of_pc1",SenetActionForm.getAmc_of_pc1());
     request.setAttribute("Amc_of_pc2",SenetActionForm.getAmc_of_pc2());
     request.setAttribute("Web",SenetActionForm.getWeb());
     request.setAttribute("Web1",SenetActionForm.getWeb1());
     request.setAttribute("Web2",SenetActionForm.getWeb2());
     request.setAttribute("Connectivity",SenetActionForm.getConnectivity());
     request.setAttribute("Connectivity1",SenetActionForm.getConnectivity1());
     request.setAttribute("Connectivity2",SenetActionForm.getConnectivity2());
     request.setAttribute("Contg",SenetActionForm.getContg());
     request.setAttribute("Contg1",SenetActionForm.getContg1());
     request.setAttribute("Contg2",SenetActionForm.getContg2());
     request.setAttribute("Others",SenetActionForm.getOthers());
     request.setAttribute("Others1",SenetActionForm.getOthers1());
       request.setAttribute("Others2",SenetActionForm.getOthers2());

        request.setAttribute("Years",SenetActionForm.getYears());
     request.setAttribute("Months",SenetActionForm.getMonths());
     request.setAttribute("User_date",SenetActionForm.getUser_date());
       request.setAttribute("InstId",SenetActionForm.getInstId());

        System.out.println("Inserting values in Mysql database table!");
  // try{
       
  Connection  con = ConnectionManager.getConnectionDirectForMySQL();

                         try{

                     SenetInsert updat =new SenetInsert();
                     int i= updat.insert(InstId, Months, Years, Amc_of_pc1, Web1, Connectivity1, Contg1, Others1,
                             User_date, Amc_of_pc2, Web2, Connectivity2, Contg2, Others2, Amc_of_pc, Web,
                             Connectivity, Contg, Others, Br_hardware_tomonth, Br_con_tomonth, Br_contg_tomonth,
                             Br_others_tomonth, Br_hardware_tomonth_1, Br_con_tomonth_1, Br_contg_tomonth_1,
                             Br_others_tomonth_1, Br_hardware_tomonth_2, Br_con_tomonth_2, Br_contg_tomonth_2,
                             Br_others_tomonth_2, Br_hardware_tomonth_3, Br_contg_tomonth_3, Br_others_tomonth_3,
                             Br_hardware_tomonth_4, Br_con_tomonth_4, Br_contg_tomonth_4, Br_others_tomonth_4,
                             Br_hardware_tomonth_5, Br_con_tomonth_5, Br_contg_tomonth_5, Br_others_tomonth_5, Br_con_tomonth_3,
                             Branch,Branch_1,Branch_2,Branch_3,Branch_4,Branch_5
                             );
     		  System.out.println(" number of row affected in tbl_senet table" +i);



                  BranchInsert bi=new BranchInsert();
                  int result=bi.insert(InstId,Months,Years,
                          Branch,   Br_hardware_target,   Br_hardware_tomonth,   Br_hardware_upto,   Br_con_target,   Br_con_tomonth,   Br_con_upto,Br_contg_target,      Br_contg_tomonth,   Br_contg_upto,   Br_others_target,   Br_others_tomonth,   Br_others_upto,
                          Branch_1, Br_hardware_target_1, Br_hardware_tomonth_1, Br_hardware_upto_1, Br_con_target_1, Br_con_tomonth_1, Br_con_upto_1, Br_contg_target_1, Br_contg_tomonth_1, Br_contg_upto_1, Br_others_target_1, Br_others_tomonth_1, Br_others_upto_1,
                          Branch_2, Br_hardware_target_2, Br_hardware_tomonth_2, Br_hardware_upto_2, Br_con_target_2, Br_con_tomonth_2, Br_con_upto_2, Br_contg_target_2, Br_contg_tomonth_2, Br_contg_upto_2, Br_others_target_2, Br_others_tomonth_2, Br_others_upto_2,
                          Branch_3, Br_hardware_target_3, Br_hardware_tomonth_3, Br_hardware_upto_3, Br_con_target_3, Br_con_tomonth_3, Br_con_upto_3, Br_contg_target_3, Br_contg_tomonth_3, Br_contg_upto_3, Br_others_target_3, Br_others_tomonth_3, Br_others_upto_3,
                          Branch_4, Br_hardware_target_4, Br_hardware_tomonth_4, Br_hardware_upto_4, Br_con_target_4, Br_con_tomonth_4, Br_con_upto_4, Br_contg_target_4, Br_contg_tomonth_4, Br_contg_upto_4, Br_others_target_4, Br_others_tomonth_4, Br_others_upto_4,
                          Branch_5, Br_hardware_target_5, Br_hardware_tomonth_5, Br_hardware_upto_5, Br_con_target_5, Br_con_tomonth_5, Br_con_upto_5, Br_contg_target_5, Br_contg_tomonth_5, Br_contg_upto_5, Br_others_target_5, Br_others_tomonth_5, Br_others_upto_5
                          );

                            if((result >0)&&(i>0)){
                        System.out.println(" Data inserted successfully in branch table");
                         return mapping.findForward(SUCCESS);
                        }
                        else{
                    System.out.println(" unable to insert data in branch table");
                     return mapping.findForward(SUCCESS);
                        }

                             }
                        catch (Exception e){
                             return mapping.findForward(FAILURE);
                             }

   }}
             
             }
                           
                                 }
    

