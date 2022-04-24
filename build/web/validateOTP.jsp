<%-- 
    Document   : validateOTP
    Created on : 14 Feb, 2019, 3:22:28 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="common.*" %>
<%@page import="java.sql.*" %>
<%@page import="roseindia.net.SendOtpClass"%>
<%@page import="java.util.Random"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Change</title>
        <style>
           .tx{font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;}
            #mainDiv
            {
                width: 750px;
                border: 1px  #1a1a1a  solid;
                align:center;
                margin: auto;
                height: 412px;
                background-color: #ffffff;
                                
            }
           
            #innerDiv
            {
                width: 350px;
                border: 1px #f0f0f0 solid;
                align:center;
                margin: auto;
                height: 170px;
            }
            #innerDiverr
            {
                width: 350px;
                border: 1px #f3cbcb solid;
                align:center;
                margin: auto;
                height: 170px;
            }
            
            #head
            {
                font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color: #f0f0f0;
                padding: 5px;
                text-align: left;
                line-height: 30px;
            }
            #head1
            {
                font: normal normal 20px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color: #f0f0f0;
                padding: 7px;
                text-align: left;
                line-height: 40px;   
            }
            #headerr
            {
                font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color:  #eec8c8 ;
                padding: 5px;
                text-align: left;
                line-height: 30px;
            }
            input[type=text]
            {
                width: 50%;
                padding: 8px 10px;
                display: inline-block;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
                        input[type=submit]
                        {
                        width: 100px;
                        background-color:  #e2e2e2 ;
                        color:  #000000 ;
                        padding: 9px 14px;
                        margin: 8px 0;
                        border: none;
                        border-radius: 4px;
                        cursor: pointer;
                        }
            input[type=submit]:hover
            {
                background-color:  #cacaca ;
            }
            
            #btn{
                align:right;
            }
            #emailerr,#err{
    width: 100%;
    align : center;
    text-align: left;
    margin: auto;
    color:  #e80c0c ;
    font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;

}
#goback
{
    background-color:  #f8dede ;
    border-color: #ff0033;
}
#msgSent
{
    border: 1px  #3c7926 solid;
    background-color:  #d2e7ca ;
    width: 99%;
    font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
    padding: 3px;
    line-height: 15px;
}
        </style>
        <script>
            function validateOtp()
            {
                var email = document.myForm.otp.value;       
                
                if(email==null || email=="")
                    {
                        document.getElementById('err').innerHTML='Please enter valid OTP.';
                        return false;
                    }                    

                return true;
            }
            function goBack()
            {
                document.forms[0].action='changePass.jsp';
            }
        </script>
    </head>
    <%
        String email = request.getParameter("email");
        System.out.println("user email is ="+email);
        
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        
     

    %>
    <body style="background-color:  #e3e3e3 ">
        <%

        Connection con = null;
        ResultSet rs = null;
        Statement st = null;
        String emailFlag = "";
        String user="";
        String mobile="";
        
        try
        {
            con = ConnectionManager.getConnectionDirectForMySQL();
            st = con.createStatement();
            String sql="select name as name, mobile as contact from mpr_dcmsme.eis_register where email='"+email+"'";
            rs=st.executeQuery(sql);
            while(rs.next())
            {
               emailFlag = "yes"; 
               user=rs.getString("name");
               mobile=rs.getString("contact");
            }
            con.close();
        }
        catch(Exception e)
        {
            System.out.println("Error is ="+e.getMessage());
        }
        
        %>
        <br/><br/><br/>
        <div id="mainDiv" align="center" >        
            <form name="myForm" id="myForm" action="UpdatePass.jsp" method="POST">
            <div id="head1">
                Welcome to password change EIS Portal. 
            </div>
            
            <%
        if(emailFlag.equals("yes"))
        {
            System.out.println("Record found");
            
            String msg = "";
           
            System.out.println("user is ="+email);
           
            Random rnm = new Random();
           
           int otpG = rnm.nextInt(900000)+100000;
            
           session.setAttribute("otpG", otpG);
           session.setAttribute("email", email);
           
           String from = "eis.dcmsme@gmail.com";
           
           String password = "987456321a";
           
           String sub = "OTP for EIS Portal";
           msg="<div style='border:2px  #43a503 double; width:800px;'>";
           msg=msg+"<div style='font-size: 14px;font-family:Verdana;font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; ' align='center'>Government of India, Ministry of MSME </div>";
           msg=msg+"<div style='font-size: 14px;font-family:Verdana;font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; ' align='center'><font color='#990000'></font>O/o  DCMSME </div>";
           msg=msg+"<div style='font-size: 14px;font-family:Verdana;font-weight:bold; background: #64bb64; padding-top: 5px; padding-bottom: 5px; ' align='center' ><font color='#990000'>ALL INDIA MSME-DO EMPLOYEES' INFORMATION SYSTEM </font></div>";
           
           msg =msg+ "<br/><br/><html><head><title>OTP for EIS</title></head><body style='font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;'>&nbsp;&nbsp;&nbsp;&nbsp;Hi Mr./Ms./Mrs. <b>"+user+"</b>,<br/>";
           
          // msg=msg+"<br/>&nbsp;&nbsp;&nbsp;&nbsp;Email :&nbsp;"+email;
          // msg=msg+"<br/>&nbsp;&nbsp;&nbsp;&nbsp;Mobile :&nbsp;"+mobile;
           msg=msg+"<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;The OTP for change password of EIS Portal is - ";
           msg=msg+"<b>"+otpG+"</b>";
           msg=msg+"<br/><br />&nbsp;&nbsp;&nbsp;&nbsp;Please use this OTP to create new password for EIS.<br/><br />&nbsp;&nbsp;&nbsp;&nbsp;Thank You.<br/><br/>";
           msg=msg+"<br/><table style='font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;'><tr><td style='padding:5px;'>&nbsp;&nbsp;&nbsp;&nbsp;<b>Team EIS</b></td></tr>";
           msg=msg+"<tr><td style='padding:3px;'>&nbsp;&nbsp;&nbsp;&nbsp;O/o DCMSME</td></tr>";
           msg=msg+"<tr><td style='padding:3px;'>&nbsp;&nbsp;&nbsp;&nbsp;Senet Division</td></tr>";
           msg=msg+"<tr><td style='padding:3px;'>&nbsp;&nbsp;&nbsp;&nbsp;New Delhi - 110096</td></tr></table>";
           msg=msg+"<br/><br/>";
           msg=msg+"<p><font style='color:red;'>&nbsp;&nbsp;&nbsp;&nbsp;Note : If you are not generated this otp , Please check your account and verify all the details for the account security.</font></p></body></html>";
           msg=msg+"<br/><br/></div>";
           
           try
           {
           SendOtpClass soc = new SendOtpClass();
           
           soc.sendMail(from, password, email, sub, msg);
           
           System.out.println("message sent successfully");
           
           
           }
           catch(Exception err)
           {
               err.printStackTrace();
               System.out.println("there is some error while sending the email.");
           }
            %>
            <div id="msgSent"> OTP has been sent to your email.</div>
            <br/><br/><br/><br/>
            <div id="innerDiv">
                
                
                <div id="head">
                    Please enter OTP below -
                </div>
                
                <br/>
                
                    <div class="tx">
                        Enter OTP : <input type="text" name="otp" autocomplete="off" placeholder="enter OTP" id="otp" required/>
                </div>
                
                <br/>
                
                <div id="btn" align="right">
                    <input type="submit" value="submit" onclick="return validateOtp();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div><br/> 
                <div id="err">
                    
                </div>
               
            </div>
         <%
        }
        else if(email.equals(null))
        {
            System.out.println("Record not found");
            %>
            <br/><br/><br/><br/>
            <div id="innerDiverr">
                <div id="headerr">
                    Error
                </div>
                <br/>
                <div id="emailerr">
                    <%--           &nbsp;&nbsp;&nbsp;This email is not registered. Try another one.--%>
                              &nbsp;&nbsp;&nbsp;This session is <b>Expired</b>. Please try again.
                </div>
                <br/>
                <div id="btnerr" align="right">
                    <input type="submit" id="goback"  value="Go back" onclick="return goBack();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </div>
         <%
        }else if(emailFlag.equals(""))
        {
         %>  
         <br/><br/><br/><br/>
            <div id="innerDiverr">
                <div id="headerr">
                    Error
                </div>
                <br/><br/>
                <div id="emailerr">
                             &nbsp;&nbsp;&nbsp;This email is not registered. Try another one.
                              
                </div>
                <br/>
                <div id="btn" align="right">
                    <input type="submit" id="goback"  value="Go back" onclick="return goBack();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </div>
         
       <%
        }
       %>
          </form>  
        </div>

    </body>
    
</html>









