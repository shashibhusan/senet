<%-- 
    Document   : EIS_main
    Created on : Dec 29, 2017, 4:53:40 PM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*"  %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <title>EIS Register</title>
        <link rel="shortcut icon" href="fevicon.png" type="image/x-icon">
        <style>
            .head
            {
                font: normal normal 15px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color: #878EFE;
                padding: 6px 0px 6px 0px;
                text-align: center;
                color: #ffffff;
            }
            .menu1
            {
                width: 100%;
                background: #FF5733;
                color: white;
                font-family: sans-serif;
                padding-top: 5px;
                padding-bottom: 10px;
            }
            .login{
                width: 350px;
                height: 570px;
                border-radius: 5px;
                border: 2px black solid;
                color:   #566573 ;
                background:  #ffffff ;
                margin: 0px;
                padding: 0px;


            }
            .data{

                font-size: 15px;

                margin-left: 20px;
                color: black;
                font-family: sans-serif;
                font-size: 12px;


            }
            .data1{

                font-size: 22px;
                font-weight: bold;


            }


            .btn1,.btn2
            {
                width: 120px;
                background-color: #F6F6F6;
                padding: 6px 0px 6px 0px;
                cursor: pointer;
            }
            .clr1{color: #126D00; border: 1px #126D00 solid;}
            .clr2{color: #D30000; border: 1px #D30000 solid;}

            .btn1:hover {
                background-color:#126D00;
                color: #ffffff
            }
            .btn2:hover {
                background-color:#D30000;
                color: #ffffff
            }
            a:link {
                text-decoration: none;
                color:  #2e00ff ;
            }

            a:visited {
                text-decoration: none;
                color: blue;
            }

            a:hover {
                text-decoration: none;
            }

            a:active {
                text-decoration: none;

            }
            h4{
                font-weight: bold;
                font-size: 14px;
                font-family: sans-serif;
                margin-right: 85px;
                margin-top: -54px;
                margin-bottom: 35px;
            }
            p{
                font-family: sans-serif;
                font-size: 15px;
                color:   #ff6100  ;
                padding-top: 6px;
            }
            div {
                border-radius: 5px;

            }
            div.ui-datepicker{
                width: 270px;
                font-size:13px;
                padding-bottom: 0px;
                padding-left: -15px;
                padding-right: 0px;
                padding-top: 0px;
                margin-bottom: 0px;
                margin-left: 0px;
                margin-right: 0px;
                margin-top: 0px;
                display: inline-block;
                border-radius: 0px;

            }
            datepicker.select{
                padding-bottom: 0px;
                padding-left: -15px;
                padding-right: 0px;
                padding-top: 0px;
                margin-bottom: 0px;
                margin-left: 0px;
                margin-right: 0px;
                margin-top: 0px;
            }
            .dropbtn {
                color: blue;
                padding: 5px;
                font-size: 13px;
                border: none;
            }
            #dropbtn {
                color: blue;
                padding: 5px;
                font-size: 13px;
                border: none;
            }
            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: fixed;
                background-color: #f1f1f1;
                min-width: 130px;
                z-index: 1;
                font-size: 12px;
                font-weight: normal;
            }

            .dropdown-content a {
                color: black;
                padding: 8px 12px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover {background-color: #ddd}

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropdown:hover .dropbtn {
                background-color: none;
            }
            alert{
                color: red;
                font-size: 15px;
            }

        </style>
        <script>
            $(function() {

                $(".datepicker").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    yearRange: "-68:+5",
                    dateFormat: "dd/mm/yy"
                            /*     monthNamesShort  : fullmonth_array         */

                });
            });



            function wwarning() {
                alert("Registration is Currently Unavailable. It will be open soon for registration.")
                return false;
            }

        </script>
        <style>
            table tr td th
            {
                border: 1px #2e00ff solid;
            }
            .login-div
            {
                border: 1px #2e00ff solid;
                width: 70%;
                margin: auto;
                margin-top: 0px;
                min-height: 500px;
                box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
            }
            .main-login-table
            {
                width: 85%;
                alignment-adjust: central;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            .td-content
            {
                padding: 5px 0px 5px 4px;
                width: 40%;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                text-align: left;

            }
            #tr-data:nth-child(odd)
            {

            }
            #tr-data
            {
                line-height: 30px;
            }
            .inpt{
                width: 80%;
                padding: 5px 0px 5px 0px;
                border: 1px solid #FA8072;
                background-color: #ffffff;
                width: 90%;
                alignment-adjust: central;
            }
            .td-input
            {
                text-align: center;
            }
            #input-error-msg
            {
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color: #C70039;
            }
            .errorbg
            {
                background-color: #FFDBDB;
            }
        </style>
    </head>
    <%
        response.setHeader("Cache-Control", "no-cache");
                response.setHeader("Cache-Control", "no-store");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);
    %>
    <body bgcolor=" #fdecd9 " style="margin-top: 0px;">
        <div style="width: 1000px; margin: auto; border: 1px solid #cacaca; background-color: #ffffff;">
            <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; " align="center">Government of India, Ministry of MSME </div>
            <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"></font>O/o  DCMSME </div>
                    <%--         <div style="font-size: large;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"> <%=user_cur_ofc%></font></div> --%>
            <div style="font-size:14px;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center" ><font color="#990000">ALL INDIA MSME-DO EMPLOYEE'S INFORMATION SYSTEM </font>
            </div>
            <br/>
            <br/>
            <div class="login-div ">
                <h3 class="head">Employee Registration</h3>
                <form name="myform" id="myform" autocomplete="off" method="post" action="EIS_success_register.jsp" onsubmit="return myFunction()">
                    <table align="center" class="main-login-table">
                        <tr id="tr-data" class="">                        
                            <td class="td-content">1. Full Name <span style="color: Red">*</span>:</td>
                        </tr>
                        <tr>
                            <td class="td-input"><input class="inpt" type="text" id="name"  name="name" placeholder="Your name.." onchange="return hideerrormsg();"/></td>
                        </tr>
                        <tr id="tr-data">

                            <td class="td-content">2. Government Email <span style="color: Red">*</span>:</td>
                        </tr>
                        <tr>
                            <td class="td-input"><input class="inpt" type="text" id="email" name="email" placeholder="Your email.." onkeypress="return warning()"/></td>
                        </tr>
                        <tr id="tr-data">
                            <td class="td-content">3. Designation <span style="color: Red">*</span>:</td>
                        </tr>
                        <tr>
                            <td class="td-input">
                                <select class="inpt" id="curr_post" name="curr_post" onchange="return warning()">
                                    <option value="">Select</option>
                                    <option value="0001">JDC</option>
                                    <option value="0010">Joint Director</option>
                                    <option value="0011">Director</option>
                                    <option value="0100">Dy. Director</option>
                                    <option value="0101">Asstt. Director Grade-I</option>
                                    <option value="0110">Asstt. Director Grade-II</option>
                                    <option value="0111">Investigator</option>
                                    <option value="1000">Office Superintendent</option>

                                </select>
                            </td>
                        </tr>
                        <tr id="tr-data">
                            <td class="td-content">4. Current office <span style="color: Red">*</span>:</td>
                        </tr>
                        <tr>
                            <td class="td-input">
                                <select class="inpt" id="curr_ofc" name="curr_ofc" onchange="return warning()">
                                    <option value="">Select</option>
                                    <%
                                        Connection con1 = null;
                                        ResultSet rs1 = null;
                                        try {
                                            con1 = ConnectionManager.getConnectionDirectForMySQL();
                                            Statement stmt1 = con1.createStatement();
                                            String sql = "select * from eis_branch_list";
                                            rs1 = stmt1.executeQuery(sql);
                                            while (rs1.next()) {
                                    %>
                                    <option value="<%=rs1.getString("Inst_Name")%>"><%=rs1.getString("Inst_Name")%></option>
                                    <%
                                            }
                                            con1.close();
                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                        }

                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr id="tr-data">
                            <td class="td-content">5. Date of Birth <span style="color: Red">*</span>: </td>
                        </tr>
                        <tr>
                            <td class="td-input"><input class="datepicker inpt" type="text" id="dob" name="dob" placeholder="dd/mm/yyyy" onkeypress="return warning()" /></td>
                        </tr>
                        <tr id="tr-data">
                            <td class="td-content">6. Mobile <span style="color: Red">*</span>:</td>
                        </tr>
                        <tr>
                            <td class="td-input"><input class="inpt" type="number"id="mobile" name="mobile"  min="1000000000" max="9999999999" maxlength="10" placeholder="Your mobile no.." onkeypress="return warning()"/></td>
                        </tr>
                        <tr>
                            <td id="input-error-msg"></td>
                        </tr>
                        <tr>
                            <td style="text-align: center;" colspan="">
                                <input class="btn1 clr1" type="submit" value="submit"/>
                                <input class="btn2 clr2" type="reset" value="reset form" onclick="myform.reset()"/>
                            </td>
                        </tr>

                    </table>
                </form> 

            </div>

            <%--      <table align="center" border="0px">
                         <tr>
                             <td  align="center">
                                 <strong style=" font-size: 20px; font-weight: 100;  font-family:sans-serif;"><b>Registration Form</b></strong>
                             </td>
                         </tr>
                         <tr>
                             <td>&nbsp;</td>
                         </tr>
                         <tr><td>
                                 <div align="center" class="login">
                                     <br><br>

                            <form name="myform" id="myform" method="post" action="EIS_success_register.jsp" onsubmit="return myFunction();">
                                <div id="fname" align="left" class="data">Full Name<br/></div>
                                <input type="text" id="name" name="name" placeholder="Your name.." onkeypress="return warning()" >

                                <div for="lname" align="left" class="data">Email<br/></div>
                                <input type="text" id="email" name="email" placeholder="Your email.." onkeypress="return warning()" >

                                <div for="lname" align="left" class="data">Mobile<br/></div>
                                <input type="number" id="mobile" name="mobile"  min="1000000000" max="9999999999" maxlength="10" placeholder="Your mobile no.." onkeypress="return warning()" >

                                <div align="left" class="data">Date of Birth<br/></div>
                                <input type="text" class="datepicker" id="dob" name="dob" placeholder="dd/mm/yyyy" onkeypress="return warning()" >

                                <div align="left" class="data">Designation<br/></div>
                                <select id="curr_post" name="curr_post" onchange="return warning()">
                                    <option value="">Select</option>
                                    <option value="AIA">AIA</option>
                                    <option value="Joint Director">Joint Director</option>
                                    <option value="Director">Director</option>
                                    <option value="Dy. Director">Dy. Director</option>
                                    <option value="Asstt. Director Grade-I">Asstt. Director Grade-I</option>
                                    <option value="Asstt. Director Grade-II">Asstt. Director Grade-II</option>
                                    <option value="Investigator">Investigator</option>
                                    <option value="Office Superitendent">Office Superitendent</option>

                                </select>

                                <div align="left" class="data">Current office<br/></div>
                                <select id="curr_ofc" name="curr_ofc" onchange="return warning()">
                                    <option value="">Select</option>
                                    <%
                                        Connection con1 = null;
                                        ResultSet rs1 = null;
                                        try {
                                            con1 = ConnectionManager.getConnectionDirectForMySQL();
                                            Statement stmt1 = con1.createStatement();
                                            String sql = "select * from eis_branch_list";
                                            rs1 = stmt1.executeQuery(sql);
                                            while (rs1.next()) {
                                    %>
                                    <option value="<%=rs1.getString("Inst_Name")%>"><%=rs1.getString("Inst_Name")%></option>
                                    <%
                                            }
                                            con1.close();
                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                        }

                                    %>
                                </select>

                                
                                <input type="submit" value="Submit">
                            </form>
                            <br/><br/>
                            <h4 class="data" align="center" style=" margin-top: 14px;">Already registered !<a href="EIS_login.jsp"> login here.</a></h4>
                            
                        </div>
                    </td></tr> </table> --%>

            <br/>
            <br/>


            <div align="center" style=" width: 100%; height: 90px; background: #f5f1f1 ; border: 1px gray thin;">
                <p style="padding-top: 15px;"> <a onClick="openTab(this)" href="http://mpr.dcmsme.gov.in/dcmsme/mprsenet/EIS_Approval_letter.pdf" ><b>Approval Letter, Sample Forms & Training Details From Session 2012-13 to 2017-18 .</b></a></p>

            </div>
        </div>
        <script>

            

            function myFunction() {
                var name = document.myform.name.value;
                var email = document.myform.email.value;                
                var curr_post = document.myform.curr_post.value;
                var curr_ofc = document.myform.curr_ofc.value;
                var dob = document.myform.dob.value;
                var mobile = document.myform.mobile.value;
                var atpos = email.indexOf("@");
                var dotpos = email.lastIndexOf(".");

                //alert(name + email + dob + curr_post + curr_ofc + mobile);

                if (name == "" || name == null) {
                    alert("Please enter your name.....");
                    document.getElementById("name").focus();
                    return false;
                }

                else if (email == "" || email == null) {
                    alert("Please enter your email.....");
                    document.getElementById("email").focus();
                    return false;
                }

                else if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= email.length) {
                    alert("Not a valid e-mail address");
                    document.getElementById("email").focus();
                    return false;
                }
                else if (curr_post == "" || curr_post == null) {
                    alert("Please select your Designation.....");
                    document.getElementById("curr_post").focus();
                    return false;
                }
                else if (curr_ofc == "" || curr_ofc == null) {
                    alert("Please select Current Office.....");
                    document.getElementById("curr_ofc").focus();
                    return false;
                }
                else if (dob == "" || dob == null) {
                    alert("Please enter Date of Birth.....");
                    document.getElementById("dob").focus();
                    return false;
                }
                else if (mobile == "" || mobile == null) {
                    alert("Please enter your mobile no....");
                    document.getElementById("mobile").focus();
                    return false;
                }
                else
                {
                    return checkGovernmentEmail(email);
                    //document.forms[0].action = "EIS_success_register.jsp"
                    // window.location = "EIS_success_register.jsp"
                    //return true;
                }
            }
            function hideerrormsg()
            {
                document.getElementById("input-error-msg").innerHTML = '';
                return true;
            }
            function amyFunction()
            {
                alert("this window is closed now, maintainance is in progress. Please try later");
                return false;
            }
            function checkGovernmentEmail(email)
            {
                var Mail_pattern1 = "^[A-Za-z0-9._%+-]+@dcmsme.gov.in$";
                var Mail_pattern2 = "^[A-Za-z0-9._%+-]+@gov.in$";
                var Mail_pattern3 = "^[A-Za-z0-9._%+-]+@nic.in$";
                var Mail_pattern4 = "^[A-Za-z0-9._%+-]+@msmediagra.in$";
                var Mail_pattern5 = "^[A-Za-z0-9._%+-]+@msmedildh.gov.in$";
                
                if (email.match(Mail_pattern1) || email.match(Mail_pattern2) || email.match(Mail_pattern3) || email.match(Mail_pattern4) || email.match(Mail_pattern5))
                    {
                        consol.log("government email validated");
                        return true;
                    }else
                        {
                            alert("Please enter a valid government email. Its highly recommended to use your government email otherwise your registration will be cancelled. ");
                            document.getElementById("email").focus();
                            return false;
                        }
                    
            }
        </script>
    </body>
</html>
