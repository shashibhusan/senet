/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package roseindia.net;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Administrator
 */
public class StrutsUploadAndSaveAction extends org.apache.struts.action.Action {

    private final static String SUCCESS = "success";
    private final static String FAILURE = "failure";

    @Override
    public ActionForward execute(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        StrutsUploadAndSaveForm myForm = (StrutsUploadAndSaveForm) form;
        String Name = myForm.getUid();
        String Password = myForm.getHash();
//String Passwordd = myForm.getPsw();
//String Random = myForm.getRandom();
// String District = myForm.getDistrict();
        System.out.println("prakash chandra  login page Action-- User" + Name);
//System.out.println("prakash chandra ----- first"+Passwordd);
        System.out.println("prakash chandra  login page Action Password" + Password);
//System.out.println("prakash chandra----- first"+Random);
        HttpSession session = request.getSession(true);
        session.setAttribute("Name", myForm.getUid());
        session.setAttribute("Password", myForm.getHash());
        //  session.setAttribute("Passwordd",myForm.getPsw());
        //  session.setAttribute("Random",myForm.getRandom());


//HttpSession session=request.getSession(true);
        String key = (String) session.getAttribute("key");
        System.out.println("login page Action captcha Keys" + key);
        String user = request.getParameter("number");
        System.out.println(" login page Action captcha User" + user);

        String time = "";
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        time = dateFormat.format(date);
        int timeFlag = 0;
        String time_of_pass_update = "";
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        con = common.ConnectionManager.getConnectionDirectForMySQL();
        st = con.createStatement();
        String sql1 = "select * from user_old_pass_di where inst='" + Name + "'";
        rs = st.executeQuery(sql1);
        while (rs.next()) {
            time_of_pass_update = rs.getString("time");
        }
           
         Calendar c = Calendar.getInstance();
        Calendar cc = Calendar.getInstance();
        try {
            c.setTime(dateFormat.parse(time));
            cc.setTime(dateFormat.parse(time_of_pass_update));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        cc.add(Calendar.MONTH, 3);
        String last_timeOfUpdate = dateFormat.format(cc.getTime());
        String current_time = dateFormat.format(c.getTime());
        System.out.println("submit date=======" + last_timeOfUpdate);
        System.out.println("Current time=========" + current_time);
        System.out.println("time of change password last time is=========" + time_of_pass_update);


        System.out.println("password working senet===========" + (cc.getTime().after(c.getTime())));



        if (cc.getTime().after(c.getTime()) == false) {
            System.out.println("this password got expired========senet ");
            return mapping.findForward("fail");
            //  response.sendRedirect("http://localhost:8084/mprpms/expirepass.jsp");
        }


        if (key.compareTo(user) == 0) {


            return mapping.findForward("success");
        } else {
            System.out.print("You have entered wrong verification code!!");
            return mapping.findForward("failure");

        }






    }
}