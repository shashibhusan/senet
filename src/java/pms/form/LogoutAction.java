/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package pms.form;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author prakashc
 */
public class LogoutAction extends org.apache.struts.action.Action {
    
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    
    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        LogoutActionForm LogoutActionForm = (LogoutActionForm) form;
         HttpSession session = request.getSession(true);
             String Random5=(String)session.getAttribute("Random5");
             System.out.println("budget random number"+Random5);
             String Mnm = LogoutActionForm.getMnm();
             System.out.println("budget random number second"+Mnm);

                String OWASP_CSRFTOKENN = LogoutActionForm.getOWASP_CSRFTOKEN();
                String OWASP_CSRFTOKEN=(String)session.getAttribute("OWASP_CSRFTOKEN");
                 System.out.println("logout"+OWASP_CSRFTOKENN);
                  System.out.println("logout"+OWASP_CSRFTOKEN);

                if(!Random5.equals(Mnm))
{               response.sendRedirect("main.jsp");

} else {


System.out.println("d logout");
session.invalidate();


response.sendRedirect("Sessionp.jsp");

}
        return mapping.findForward(SUCCESS);
    }
}
