<%-- 
    Document   : resetPass
    Created on : 22 Mar, 2021, 11:43:50 AM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        </style>
    </head>
    <%
        response.setHeader("Cache-Control", "no-cache");
                response.setHeader("Cache-Control", "no-store");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);
    %>
    <body bgcolor="#F6F6F6">
         <div style="height: 50px;"></div>
         <div class="mainDv">
             <form name="resetPass" id="resetPass" class="resetPass" autocomplete="off" action="CreatePassword.jsp" method="POST" onsubmit="return validatedetails();">
               
                <table class="passwordUpdateTable" align="center">
                    <tr>
                        <td colspan="2" class="head">Reset your password</td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="d1">Registered email</td>
                        <td><input class="inpt" type="text" name="remail" id="remail" placeholder="email" onkeypress="return blank();"/></td>
                    </tr>
                    <tr>
                        <td class="d1">Date of birth</td>
                        <td><input class="datepicker inpt" type="text" name="rdob" id="rdob" placeholder="DD/MM/YYYY" onchange="return blank();"/></td>
                    </tr>
                    <tr>
                        <td class="d1">Mobile no (registered)</td>
                        <td><input class="inpt" type="text" name="rmobile" id="rmobile" placeholder="mobile" onkeypress="return blank();"/></td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>

                    </tr>
                    <tr>
                        <td style="text-align: center;" colspan="2">
                            <input type="submit"/>
                            <input type="reset" value="reset form" onclick="resetPass.reset()"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>

                    </tr>
                </table>
            </form>
             <div id="error"></div>
        </div>
         <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">        
        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
         <script>
             function blank()
             {
                 document.getElementById("error").innerHTML="";
                 return true;
             }
             function validatedetails()
             {
                var email=document.resetPass.remail.value;
                var dob=document.resetPass.rdob.value;
                var mobile=document.resetPass.rmobile.value;
                var atpos = email.indexOf("@");
                var dotpos = email.lastIndexOf(".");
                
                 if (email == "" || email == null) {
                    document.getElementById("error").innerHTML="please enter your email";
                    document.getElementById("remail").focus();
                    return false;
                }
                
                else if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= email.length) 
                            {
                            document.getElementById("error").innerHTML="enter valid email address";
                            document.getElementById("remail").focus();
                            return false;
                            }
                    else if(dob=="" || dob==null)
                        {
                            document.getElementById("error").innerHTML="please enter your date of birth";
                            document.getElementById("rdob").focus();
                            return false;
                        }
                    
                        else if(mobile=="" || mobile==null)
                            {
                                document.getElementById("error").innerHTML="please enter your registered mobile number";
                                document.getElementById("rmobile").focus();
                                return false;
                            }
                            else
                                {
                                    var con=confirm("Do you want to proceed ?")
                                    if(con==true)
                                        {
                                           return true; 
                                        }else
                                            {
                                                return false;
                                            }
                                    
                                }
             }
             
             function UpdstePasswordEIS(url)
             {
                 
             }
        </script>
        <script>
            $(function () {

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
