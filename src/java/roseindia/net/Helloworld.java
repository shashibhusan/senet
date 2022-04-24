/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package roseindia.net;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import common.ConnectionManager;
/**
 *
 * @author admin
 */
public class Helloworld extends Action{

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
     System.out.println("Hello servlet ooooooooooooooooooooooooooo  executed");
     HttpSession session=request.getSession();
     String institute=ConnectionManager.instituteName(request.getParameter("institute"));
     String months=request.getParameter("cmbMonth");
     String years=request.getParameter("cmbYear");
     String page=request.getParameter("page");
     session.setAttribute("Hinstitute", institute);
     String branch= request.getParameter("branch");
     System.out.println("@@@@Bramch Name    "+branch);
     session.setAttribute("branch",branch);
     session.setAttribute("Hmonth",months);
     session.setAttribute("Hyear", years);
     session.setAttribute("page",page);
     if(branch!=null)
     {
       return  mapping.findForward("check");
     }
        return  mapping.findForward("success");
    }



}
