<%-- 
    Document   : newjspUpdatePassword
    Created on : 22 Mar, 2021, 1:52:03 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="common.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>reset password</title>
        <style>
            .passwordUpdateTable
            {
                width: 400px;
            }
            .head
            {
                font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color: #FFDADA;
            }
            .d1{
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 5px;
            }
            .mainDv
            {
                width: 400px;
                margin: auto;
                border: 1px #FFDADA solid;
                background-color: #ffffff;
            }
            #error
            {
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color: red;
            }
            .inpt
            {
                width: 90%;
                padding: 3px;
                border: 1px #FFDADA solid;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            } 
            .note,li
            {
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color: red;
            }
        </style>
    </head>
    <%
        String email = request.getParameter("remail");
        email=email.replaceAll("\\s", "");
        String dob = request.getParameter("rdob");
        String mobile = request.getParameter("rmobile");
        session.setAttribute("email", email);
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        int iCount = 0;
        int iCountGovData = 0;
        
        response.setHeader("Cache-Control", "no-cache");
                response.setHeader("Cache-Control", "no-store");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);

        try {
            con = ConnectionManager.getConnectionDirectForMySQL();
            st = con.createStatement();
            String sql = "select * from eis_register where email='" + email + "'";
            rs = st.executeQuery(sql);
            if (rs.next()) {
                iCount = 1;
            }
        } catch (Exception err) {
            err.printStackTrace();
        }

        if (iCount == 1) {
            System.out.println("Record found in eis_register for password update");
            rs = st.executeQuery("select * from eis_register where email='" + email + "' and dob='" + dob + "'");
            while (rs.next()) {
                if (rs.getString("dob") != null || rs.getString("dob") != "") {
                    iCount = 2;
                }
            }
            
            rs = st.executeQuery("select * from eis_register where email='" + email + "' and dob='" + dob + "' and mobile='" + mobile + "'");
            while (rs.next()) {
                if (rs.getString("email").equals(email) && rs.getString("dob").equals(dob) && rs.getString("mobile").equals(mobile)) {
                    iCount = 3;
                }
            }
        }else
        {
            System.out.println("Record found in eis_updated_user_gov_mail for password update");
            try
            {
            rs = st.executeQuery("select * from eis_updated_user_gov_mail where gov_email='" + email + "' and dob='" + dob + "'");
            while (rs.next()) {
                if (rs.getString("dob") != null || rs.getString("dob") != "") {
                    iCount = 2;
                }
            }
            }catch(Exception ee)
            {
                ee.printStackTrace();
            }
           try
           {
            rs = st.executeQuery("select * from eis_updated_user_gov_mail where gov_email='" + email + "' and dob='" + dob + "' and mobile='" + mobile + "'");
            while (rs.next()) {
                if (rs.getString("gov_email").equals(email) && rs.getString("dob").equals(dob) && rs.getString("mobile").equals(mobile)) {
                    iCount = 3;
                }
            }
           }catch(Exception er)
           {
               er.printStackTrace();
           }
        }
        System.out.println("iCount=" + iCount);
    %>
    <body bgcolor="#F6F6F6">
        <div style="height: 50px;"></div>
        <div class="mainDv">

            <%
                if (iCount == 3) {
                    System.out.println("we are changing the password");
            %>
            <form name="CreatePass" id="CreatePass" class="CreatePass" autocomplete="off" action="updatepass.jsp" method="POST" onsubmit="return validatedetails();">
                <table class="passwordUpdateTable" align="center">
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="head">Password Instruction-</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <ul>
                                <li>Password must contain minimum 8 character</li>
                                <li>Password must contain minimum 1 number</li>
                                <li>Password must contain minimum one lower case letter</li>
                                <li>Password must contain minimum one upper case letter</li>
                            </ul>
                        </td>

                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="head">Create your password</td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="d1">New password</td>
                        <td><input class="inpt" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" type="password" name="password" id="password" placeholder="" onkeypress="return blank();"/></td>
                    </tr>
                    <tr>
                        <td class="d1">Confirm new password</td>
                        <td><input class="inpt" type="password" name="confirmpassword" id="confirmpassword" placeholder="" onchange="return blank();"/></td>
                    </tr>

                    <tr>
                        <td colspan="2">&nbsp;</td>

                    </tr>
                    <tr>
                        <td style="text-align: center;" colspan="2">
                            <input type="submit"/>
                            <input type="reset" onclick="resetPass.reset()"/>
                            <input type="button" value="go back" onclick="goback()"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>

                    </tr>

                </table>
            </form>
            <%                
                } else if (iCount == 1) {
            %>
            <table class="passwordUpdateTable" align="center">
                <tr>
                    <td colspan="2" class="head">Error occurred</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;<div class="note">Your date of birth is not updated on the eis portal. 
                            Please update your date of birth through sent your details like registered email, name, mobile number on email-<b>eis.dcmsme@gmail.com</b></td>
                </tr>

                <tr>
                    <td colspan="2">&nbsp;</td>

                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" value="go back" onclick="goback1()"/>
                    </td>

                </tr>
                <tr>

            </table>
            <%            
                } else if (iCount == 2) {
            %>
            <table class="passwordUpdateTable" align="center">
                <tr>
                    <td colspan="2" class="head">Error occurred</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;<div class="note">Please enter correct details.</div></td>
                </tr>

                <tr>
                    <td colspan="2">&nbsp;</td>

                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" value="go back" onclick="goback()"/>
                    </td>

                </tr>
                <tr>

            </table>
            <%            
                } else if (iCount == 0) {
            %>
            <table class="passwordUpdateTable" align="center">
                <tr>
                    <td colspan="2" class="head">Error occurred</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;<div class="note">The email you have entered is not found. Please try to enter correct email.</div></td>
                </tr>                    
                <tr>
                    <td colspan="2">&nbsp;</td>

                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" value="go back" onclick="goback()"/>
                    </td>

                </tr>
                <tr>

            </table>
            <%                    }

                con.close();
                st.close();
            %>
        </form>
        <div id="error"></div>
    </div>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">        
    <script src="//code.jquery.com/jquery-1.12.4.js"></script>
    <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
                function goback()
                {
                    window.location = "resetPass.jsp";
                    return true;
                }
                function goback1()
                {
                    window.location = "../EIS_login.jsp";
                    return true;
                }
                function blank()
                {
                    document.getElementById("error").innerHTML = "";
                    return true;
                }
                function validatedetails()
                {
                  
                    var password = document.resetPass.remail.value;
                    var confirmPassword = document.resetPass.rdob.value;

                    if (password === confirmPassword)
                    {
                        return true;
                       // window.location = "updatepass.jsp";
                    }else
                        {
                            return false;
                        }
                }
    </script>
    <script>
        $(function() {

            $(".datepicker").datepicker({
                changeMonth: true,
                changeYear: true,
                yearRange: "-68:+42",
                dateFormat: "dd/mm/yy"
                        /*     monthNamesShort  : fullmonth_array         */

            });
        });
    </script>
</body>
</html>
