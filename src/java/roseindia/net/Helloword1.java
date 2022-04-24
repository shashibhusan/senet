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
 class Helloworld1 extends Action {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
     System.out.println("Hello servlet executed");
     HttpSession session=request.getSession();
     String Bname=(String)request.getParameter("one");
   System.out.println("===========value we get=============="+Bname);
      session.setAttribute("Bname", Bname);
        return  mapping.findForward("success");
    }



}
