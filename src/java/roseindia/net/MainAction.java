/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package roseindia.net;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Administrator

    @Override
 */
public class MainAction extends org.apache.struts.action.Action {

     private final static String SUCCESS = "success";
     private final static String FAILURE = "failure";
  public ActionForward execute(

  ActionMapping mapping,

  ActionForm form,

  HttpServletRequest request,

  HttpServletResponse response) throws Exception{

  Main myForm = (Main)form;
String CmbIns = myForm.getCmbIns();
String CmbYear = myForm.getCmbYear();
String CmbMonth = myForm.getCmbMonth();
String Crosssite = myForm.geCrosssite();
String Section = myForm.getSection();
System.out.println("prakash chandra : "+CmbIns);
System.out.println("prakash chandra : "+CmbYear);
System.out.println("prakash chandra : "+CmbMonth);
System.out.println("prakash chandra CROSS SITE : "+Crosssite);
if ( (CmbIns.matches("[a-zA-Z_0-9 ]+")) && ((CmbYear.length()==9) && (CmbMonth.substring(0, 1).matches("[0-9]"))) &&( CmbMonth.matches("[0-9]+")))  {
	System.out.println("pattern matches");

    HttpSession session=request.getSession(true);
     session.setAttribute("CmbIns",myForm.getCmbIns());
     session.setAttribute("CmbYear",myForm.getCmbYear());
      session.setAttribute("CmbMonth",myForm.getCmbMonth());
     session.setAttribute("Crosssite",myForm.geCrosssite());
     session.setAttribute("Section",myForm.getSection());
  System.out.println("Inserting values in Mysql database table!");
  try{

  }
  catch (Exception e){
  e.printStackTrace();
  }
 System.out.println("i am here in the main class : QQQQQQQQQQQQQQQQQQQQQQQQQ");
  return mapping.findForward("success");

  }
  else{
     return mapping.findForward("failure");
  }

}}