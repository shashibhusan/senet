/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package roseindia.net;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author prakash
 */
public class ChangepswForm extends org.apache.struts.action.ActionForm {

    private String username;
    private String input;
    private String hash;




    public String getUsername() {
        return username;
    }
     public void setUsername(String Username) {
        username = Username;
    }
      public String getHash() {
        return hash;
    }
     public void setHash(String Hash) {
        hash = Hash;
    }
      public String getInput() {
        return input;
    }
     public void setInput(String Input) {
        input = Input;
    }


    public ChangepswForm() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        if (getUsername() == null || getUsername().length() < 1) {
            errors.add("username", new ActionMessage("error.name.required"));
            // TODO: add 'error.name.required' key to your resources
        }
        if (getInput() == null || getInput().length() < 1) {
            errors.add("input", new ActionMessage("error.name.required"));
            // TODO: add 'error.name.required' key to your resources
        }
        if (getHash() == null || getHash().length() < 1) {
            errors.add("hash", new ActionMessage("error.name.required"));
            // TODO: add 'error.name.required' key to your resources
        }
        return errors;
    }
}
