<%-- 
    Document   : EIS_login
    Created on : Dec 29, 2017, 6:46:05 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EIS login</title>
        <link rel="shortcut icon" href="fevicon.png" type="image/x-icon">
        <link rel="stylesheet" type="text/css" href="EIS_login.css">
        <style>
            .note-head
                {
                    width: 70%;
                    border: 1px #FF5733 solid;
                    margin: auto;
                    font: normal normal 15px Verdana, Geneva, Arial, Helvetica, sans-serif;
                }
                .note-content
                {
                    width: 90%;
                    font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                    color: red;
                    text-align: justify;
		    letter-spacing: 1px;
                    
                }
        </style>
    </head>

    <body bgcolor=" #fdecd9 " style="margin-top: 0px;">
        <div style="width: 1000px; margin: auto; border: 1px solid #cacaca; background-color: #ffffff;">
            <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; " align="center">Government of India, Ministry of MSME </div>
            <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"></font>O/o  DCMSME </div>
                    <%--         <div style="font-size: large;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"> <%=user_cur_ofc%></font></div> --%>
            <div style="font-size:14px;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center" ><font color="#990000">ALL INDIA MSME-DO EMPLOYEE'S INFORMATION SYSTEM </font>
            </div>
            <br/>

            <h3 align="center"> </h3>
            <div class="note-head">
                <div style="color: red; width: 100%; border-bottom: 1px #FF5733 solid; background-color:  #ffe8e8 ">Note :</div>
                <ul>
                <li class="note-content">Since you can login only with your government email. So this is requested that , if you are already registered on the EIS portal, then
                    use your old login id (whatever it is) and password. After that if your email is not a government then it will automatically take you to the email update portal.
                    There you can easily replace your non government email with government email. 
                </li>
                <li class="note-content">If you have forgotten your old password then use the forgot password link to reset the password.</li>
                </ul>
            </div>
            <table  align="center" border="0px;">
                <tr>
                    <td align="center">
                        <strong style=" font-size: 20px; font-weight: 100;  font-family:sans-serif;"><b>EIS Login</b></strong>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>

                        <div align="center" class="login">

                            <br><br>

                            <form id="myform" name="myform" method="post" action="" onsubmit="return myFunction()">
                                <div id="fname" align="left" class="data">E-mail :<br/></div>
                                <input type="text" class="user" id="user" name="user" placeholder="Your email..">
                                <br/>

                                <div for="lname" align="left" class="data">Password :<br/></div>
                                <input type="password" class="user" id="password" autocomplete="off" name="password" placeholder="Password..">
                                <br/>
                                <div for="lname" align="left" class="data">Captcha &nbsp; :<br/></div>
                                <img id="captcha" height="40" style=" width: 100px;" src="reCaptch.jsp" width="90"><a href="JavaScript:refresh()"><img src="refresh.png" style="border:none; width: 20px; height: 20px;" /></a> <br>
                                <input type="text" id="ree" class="captcha" name="answer" autocomplete="off" align="center"  required/><br>

                                <br/>


                                <input type="submit" value="Submit">
                                <br/>
                                <%--
                                <h4 align="center">Not registered yet! <a href="EIS_main.jsp"> Register.</a></h4>
                                --%>
                                <span id="btn" align="center"> <a href="EIS_Admin.jsp"> admin login</a></span>,
                                <span id="btn" align="center"> <a href="EIS_main.jsp">new registration</a></span>
                            </form>
                            <br/><br/>

                        </div>

                    </td>
                </tr>
            </table>
            <br/>
            <%--   <div id="note" align="center" style="margin: auto;" >
               ** For any help please mail us on <b> rgvjee@gmail.com</b> <br/> or call on +91-9999244228.
                         </div>
            --%>
            <div id="forget" align="center" style="margin: auto;" >

                <%--  <a href="changePass.jsp">forget password?</a>   --%>
                <a href="eis_forms/resetPass.jsp">forget password?</a>   

            </div>
            <br/>
            <div align="center" style=" width: 100%; height: 90px; background:  #f8f5de  ; border: 1px gray thin;">
                <p style="margin-bottom: -15px;"> <a onClick="openTab(this)" href="http://mpr.dcmsme.gov.in/mprsenet/EIS_Approval_letter.pdf" ><b>Approval Letter, Sample Forms & Training Details From 2012-13 to 2017-18 .</b></a></p>
                <p>  Best view on mozilla firefox 52.0.0 and later version</p>
            </div>
        </div>
                <script type="text/javascript" src="EIS_login.js" ></script>
    </body>
</html>
