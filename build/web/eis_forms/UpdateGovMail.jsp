<%-- 
    Document   : UpdateGovMail
    Created on : 27 Dec, 2021, 12:23:53 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="stat.jsp" autoFlush="true"%>
<%@page import="java.sql.*, common.*" %>
<%@page import="com.updategovemail.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update email</title>
        <style>
            .passwordUpdateTable
            {
                width: 500px;
            }
            .mm
            {
                margin: auto;
                width: 650px;
                background-color: #FFFFFF;
            }
            .head-font
            {
                font: normal normal 15px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 10px;
                text-align: center;
            }
            .head
            {
                font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color:  #e2f6e2 ;
                height: 30px;
                border-bottom:  #00ae03 ;
            }
            .head1
            {
                font: normal normal 16px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 10px 0px 10px 0px;
                border:1px solid #179500;
                margin: auto;
                width: 650px;
                background-color: #23B809;
                color: #FFFFFF;

            }
            .d1{
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 5px;
                text-align: right;
            }
            .d2{
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 5px;
                text-align: left;
            }
            .mainDv
            {
                width: 500px;
                margin: auto;
                border: 1px  #00ae03  solid;
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
                border: 1px #e2f6e2 solid;
                color:  #4a4a4a ;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            } 
        </style>
        <style>
        .error
        {
            width: 600px;
            height: 200px;
            border: 1px solid #B30000;
            margin: auto;
        }
        .note
        {
            background-color: #FFE0E0;
            border-bottom:  1px solid #B30000;
            margin: 0px;
            font: normal bold 15px Verdana, Geneva, Arial, Helvetica, sans-serif;
            color: #C30000;
            padding: 10px;              
        }
        li{padding: 3px 0px 3px 3px;}
        ul,li{
            font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
        }
    </style>
    </head>
    <body bgcolor="#F6F6F6">
    <%
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        String username = request.getParameter("user");
        String pass = request.getParameter("password");

        System.out.println(username + pass);

        String captcha = (String) session.getAttribute("key");
        request.setCharacterEncoding("UTF-8");
        String answer = request.getParameter("answer");

        int flag = 0;

        Connection con1 = null;
        ResultSet rs1 = null;
        Statement stmt1 = null;
        int CheckStatus = 0;

        if (captcha.equals(answer)) {



            con1 = ConnectionManager.getConnectionDirectForMySQL();
            stmt1 = con1.createStatement();

            try {
                String check_query = "Select * from eis_updated_user_gov_mail where old_email='" + username + "' ";
                rs1 = stmt1.executeQuery(check_query);
                if (rs1.next()) {
                    CheckStatus = 1;
                    System.out.println("Record already exist!!");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }



            try {

                String sql1 = "SELECT * FROM eis_register where email='" + username + "' ";
                rs1 = stmt1.executeQuery(sql1);
                while (rs1.next()) {
                    if (username.equals(rs1.getString("email")) && pass.equals(rs1.getString("password"))) {
                        flag = 1;

                        System.out.println("Record have found");
                    } else {
                        flag = 2;
                        System.out.println("email or password is incorrect");
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            flag = 3;
            System.out.println("invalid captcha");
        }
        System.out.println("Flag==" + flag);

        

            if (CheckStatus == 0 && flag == 1) {
    %>

    
        <div style="height: 50px;"></div>
        <div class="mm" style="border: 1px solid #00ae03">
            <div class="head1">
                <font >EIS email update portal -</font>
            </div>
            <br/>
            <div class="mainDv">

                <%
                    String dob = null;
                    String name = null;
                    String query = "select name as name , dob as dob from eis_register where email='" + username + "' ";
                    rs1 = stmt1.executeQuery(query);
                    while (rs1.next()) {
                        dob = rs1.getString("dob");
                        name = rs1.getString("name");
                    }

                %>
                <form name="UpdateGovEmail" id="UpdateGovEmail" class="UpdateGovEmail" autocomplete="off" action="../UpdateEmail" method="POST" onsubmit="return validatedetails();">

                    <table class="passwordUpdateTable" align="center">
                        <tr>
                            <td colspan="3" class="head"> Your details on EIS portal -</td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="d1">Registered email (old)</td>
                            <td>:</td>
                            <td>
                                <input class="inpt" type="text"  placeholder="email" value="<%=username%>" disabled="2" readonly="true"/>
                                <input class="inpt" type="hidden" name="oldEmail"  placeholder="email" value="<%=username%>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="d1">Name</td>
                            <td>:</td>
                            <td><input class="datepicker inpt" type="text"  placeholder="name" value="<%=name%>" disabled="2" readonly="true"/></td>
                        </tr>
                        <tr>
                            <td class="d1">Date of birth</td>
                            <td>:</td>
                            <td><input class="inpt" type="text" placeholder="dob" value="<%=dob%>" disabled="2" readonly="true"/></td>
                        </tr>
                        <tr>
                            <td colspan="3">&nbsp;</td>

                        </tr>
                        <tr>
                            <td colspan="3" class="head">New email :</td>
                        </tr>
                        <tr>
                            <td colspan="3">&nbsp;</td>

                        </tr>
                        <tr>
                            <td class="d2">Government email </td>
                            <td>:</td>
                            <td><input class="inpt" type="text" name="govEmail" id="govEmail" placeholder="@gov.in/@nic.in/@dcmsme.gov.in"   onkeypress="return blank();"/></td>
                        </tr>
                        <tr>
                            <td class="d2">Confirm Your <br/> Government email </td>
                            <td>:</td>
                            <td><input class="inpt" type="text" name="confirmGovEmail" id="confirmGovEmail" placeholder="@gov.in/@nic.in/@dcmsme.gov.in" onclick="return ValidateGovEmail(govEmail.value);"/></td>
                        </tr>
                        <tr>
                            <td class="d2">Captcha </td>
                            <td>:</td>
                            <td><img id="captcha" height="40" style=" width: 100px;" src="../reCaptch.jsp" width="90"><a href="JavaScript:refresh()"><img src="../refresh.png" style="border:none; width: 20px; height: 20px;" /></a> <br>
                                <input type="text" id="ree" class="captcha" name="answer" autocomplete="off" align="center"  required/><br></td>
                        </tr>
                        <tr>
                            <td colspan="3">&nbsp;</td>

                        </tr>
                        <tr>
                            <td style="text-align: center;" colspan="3">
                                <input id="button" type="submit" value="submit"/>
                                <input type="reset" value="reset form" onclick="resetPass.reset()"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">&nbsp;</td>

                        </tr>
                    </table>
                </form>
                <div id="error"></div>
                <br/>
            </div>
            <br/>
            <br/>
            <br/>
        </div>
      
    <%
    } else if (flag == 3 || flag == 0) {
    %>
    
   
    <br/>
    <br/>
    <br/>
    <div class="error">
        <div id="error-div">
            <h2 class="note">Error occurred with following possible reason -</h2>
            <br/>
            <ul>               
                <li>You have entered wrong credentials.</li>
                <li>You have refreshed the page.</li>
                <li>Please try again.</li>
                <br/>
                <li>Click here for <a href="../EIS_login.jsp">login</a> again.</li>
            </ul>
        </div>

    </div>
   
    <%}
    else if(flag==2) {
        %>
       
        <br/>
    <br/>
    <div class="error">
        <div id="error-div">
            <h2 class="note">Wrong credentials -</h2>
            <br/>
            <ul>
                <li>You might have entered have entered wrong email or password.</li>
                <li>Try to reset password after that you can update your email.</li>
                <li>For any query please email to <a href="mailto:eis.dcmsme@gmail.com">eis support.</a></li>
                <br/>
                <li>Click here for <a href="../EIS_login.jsp">Login</a> in eis portal.</li>
            </ul>
        </div>

    </div>
    
        <%
    }else
    {
    %>
   
    <br/>
    <br/>
    <br/>
    <div class="error">
        <div id="error-div">
            <h2 class="note">Email alreay updated -</h2>
            <br/>
            <ul>
                <li>You have already updated your email.</li>
                <li>Use your updated email (government) to login.</li>
                <li>For any query please email to <a href="mailto:eis.dcmsme@gmail.com">eis support.</a></li>
                <br/>
                <li>Click here for <a href="../EIS_login.jsp">Login</a> in eis portal.</li>
            </ul>
        </div>

    </div>
    <%}%>
    <style>
        .error
        {
            width: 600px;
            height: 200px;
            border: 1px solid #B30000;
            margin: auto;
        }
        .note
        {
            background-color: #FFE0E0;
            border-bottom:  1px solid #B30000;
            margin: 0px;
            font: normal bold 15px Verdana, Geneva, Arial, Helvetica, sans-serif;
            color: #C30000;
            padding: 10px;              
        }
        li{padding: 3px 0px 3px 3px;

        }
        ul,li{
            font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
        }
    </style>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">        
        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
                    var Mail_pattern1 = "^[A-Za-z0-9._%+-]+@dcmsme.gov.in$";
                    var Mail_pattern2 = "^[A-Za-z0-9._%+-]+@gov.in$";
                    var Mail_pattern3 = "^[A-Za-z0-9._%+-]+@nic.in$";
                    var Mail_pattern4 = "^[A-Za-z0-9._%+-]+@msmediagra.gov.in$";
                    var Mail_pattern5 = "^[A-Za-z0-9._%+-]+@msmedildh.gov.in$";

                    function ValidateGovEmail(mail)
                    {
                        if (mail.match(Mail_pattern1) || mail.match(Mail_pattern2) || mail.match(Mail_pattern3) || email.match(Mail_pattern4) || email.match(Mail_pattern5))
                        {

                            document.getElementById("error").innerHTML = "First email validated.";
                            document.getElementById("error").style.color = "green";
                            document.getElementById("confirmGovEmail").focus();
                            return true;
                        }
                        else
                        {
                            alert("Please enter a valid government email");
                            document.getElementById("govEmail").focus();

                            return false;
                        }

                    }

                    function blank()
                    {
                        document.getElementById("error").innerHTML = "";
                        return true;
                    }
                    function validatedetails()
                    {

                        var govEmail = document.UpdateGovEmail.govEmail.value;
                        var confirmGovEmail = document.UpdateGovEmail.confirmGovEmail.value;



                        if (govEmail == "" || govEmail == null) {
                            document.getElementById("error").innerHTML = "please enter your government email";
                            document.getElementById("error").style.color = "red";
                            document.getElementById("govEmail").focus();
                            return false;
                        }
                        if (confirmGovEmail == "" || confirmGovEmail == null) {
                            document.getElementById("error").innerHTML = "please confirm your government email";
                            document.getElementById("error").style.color = "red";
                            document.getElementById("confirmGovEmail").focus();
                            return false;
                        }

                        else if (govEmail != confirmGovEmail)
                        {
                            document.getElementById("error").innerHTML = "email and confirm email will be same";
                            document.getElementById("error").style.color = "red";
                            return false;
                        }

                        else if (confirmGovEmail.match(Mail_pattern1) || confirmGovEmail.match(Mail_pattern2) || confirmGovEmail.match(Mail_pattern3))
                        {

                            document.getElementById("error").innerHTML = "second Email Validated.";
                            document.getElementById("error").style.color = "green";

                            var con = confirm("This email " + confirmGovEmail + " is going to replace your old email. It will be the new login id on EIS portal and the password will be the same as before. Do you want to proceed ?")
                            if (con == true)
                            {
                                return true;
                            } else
                            {
                                return false;
                            }
                        } else
                        {
                            document.getElementById("error").innerHTML = "Please enter a valid government email at both places.";
                            document.getElementById("error").style.color = "red";
                            return false;
                        }

                    }

                    function UpdstePasswordEIS(url)
                    {

                    }
                    function refresh()
                    {
                        document.getElementById("captcha").src = '../reCaptch.jsp?' + (new Date().getTime());
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
        <%
            if (con1 != null) {
                con1.close();
            }
            if (rs1 != null) {
                rs1.close();
            }
            if (stmt1 != null) {
                stmt1.close();
            }

        %>
</body>
    <%
    %>
</html>
