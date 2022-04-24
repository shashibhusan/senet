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

/**
 *
 * @author Raghavendra
 */
public class uploadSanctionSenetAction extends Action {

    private final static String SUCCESS = "success";
    private final static String FAILURE = "failure";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        uploadSanctionSenetForm UploadSanctionForm = (uploadSanctionSenetForm) form;

        HttpSession session = request.getSession(true);
        String Random5 = (String) session.getAttribute("Random5");

        String Mnm = UploadSanctionForm.getMnm();
        String captcha = request.getParameter("formcaptcha");
        String generated_Captcha = (String) session.getAttribute("key");
        System.out.println("this is raghav captcha page ==================uploadSanctionSenetAction.java=====" + captcha);

        if (!Random5.equals(Mnm)) // if(!OWASP_CSRFTOKENN.equals(OWASP_CSRFTOKEN))
        {
            response.sendRedirect("staterror.jsp");
        } else {
        }

        return null;
    }
}
