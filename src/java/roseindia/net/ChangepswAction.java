/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package roseindia.net;

import com.mysql.jdbc.PreparedStatement;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author prakash
 */
public class ChangepswAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
     private final static String FAILURE = "failure";
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

         ChangepswForm ChangepswForm = (ChangepswForm) form;
        String Username = ChangepswForm.getUsername();
        String Hash = ChangepswForm.getHash();
        String Input = ChangepswForm.getInput();
                Connection con=null;
        Statement st=null;
        ResultSet rs=null;
        int passFlag=0;
        int no_of_changes=0;
        String time="";

       System.out.println("Change password"+Hash);      //Hash is new password which is going to be update.
        System.out.println("Change password"+Input);    //Input is old password which is currently working.
                                                        //Username is the user which trying to update their password.
        
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date = new Date();
    time=dateFormat.format(date);
    int timeFlag=0;
    String ipAddress =  request.getRemoteAddr();
    System.out.println("IP Address :- " + ipAddress);

           con = common.ConnectionManager.getConnectionDirectForMySQL();
           st=con.createStatement(); 
           
           
           // String sql="select * from user_old_pass_di where inst='"+Username+"'";
           String sql="SELECT * FROM (SELECT * FROM user_old_pass_di where inst='"+Username+"' ORDER BY sno DESC LIMIT 3) sub ORDER BY sno ASC";
           rs=st.executeQuery(sql);
           while(rs.next())
           {
               no_of_changes=rs.getInt("no_of_changes");
               if(Hash.equals(rs.getString("password")))
               {
                   passFlag=1;
               }
           }
  if(passFlag==0)
  {          
           
           
  try{
  no_of_changes=no_of_changes+1;
  Pswupdate updat =new Pswupdate();
  int i= updat.update(Hash, Username, Input);
  int j = updat.saveOldPass(Username, Hash, no_of_changes, time, ipAddress);



                            if(i >0 && j > 0){
                        System.out.println("Password updated------------done");
                        System.out.println("Old password stored in the table-------Done");
                         return mapping.findForward(SUCCESS);
                        }
                        else{
                    System.out.println(" Result Set have not record");
                    return mapping.findForward("failure");
                        }

                             }
                        catch (Exception e){
                             }
  }
  else if(passFlag==1)
  {
      response.sendRedirect("errorpassupdate.jsp");
  }
  con.close();
  st.close();
  rs.close();
          
   
                            return mapping.findForward(SUCCESS);
                                 }





}
