/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package pms.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author prakashc
 */
public class LogoutActionForm extends org.apache.struts.action.ActionForm {
    
      private String mnm;
       public String getMnm() {
        return mnm;
    }
    public void setMnm(String Mnm) {
        this.mnm = Mnm;
    }
       private String OWASP_CSRFTOKEN;

      public String getOWASP_CSRFTOKEN() {
        return OWASP_CSRFTOKEN;
    }
    public void setOWASP_CSRFTOKEN(String OWASP_CSRFTOKEN) {
        this.OWASP_CSRFTOKEN = OWASP_CSRFTOKEN;
    }
}
