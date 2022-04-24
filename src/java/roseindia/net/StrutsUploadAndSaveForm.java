package roseindia.net;


import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;


public class StrutsUploadAndSaveForm extends ActionForm
{
 //  private FormFile theFile;
 private String uid;
    private String hash;
    // private String psw;
   //  private String random;

   // private String captchaText ;
   public String getUid() {
        return uid;
    }
    public void setUid(String Uid) {
        this.uid = Uid;
    }

    public String getHash() {
        return hash;
    }
    public void setHash(String Hash) {
        this.hash = Hash;
    }
 // public String getPsw() {
 //       return psw;
 //   }
 //   public void setPsw(String Psw) {
   //     this.psw = Psw;
  //  }

   // public String getRandom() {
    //    return random;
   // }
  //  public void setRandom(String Random) {
    //    this.random = Random;
   // }
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        if (getHash() == null || getHash().length() < 1) {
            errors.add("hash", new ActionMessage("error.password.required"));
        }
        if (getUid() == null || getUid().length() < 1) {
            errors.add("uid", new ActionMessage("error.userName.required"));
        } else if (getHash().length() < 6) {
            errors.add("hash", new ActionMessage("error.password.minlength"));
        }
        return errors;
    }


} 