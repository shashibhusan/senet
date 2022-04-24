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
        <title>EIS Pensioner Register</title>
        <link rel="shortcut icon" href="fevicon.png" type="image/x-icon">
        <style>
            h3{
               margin-left: -140px;
               font-style: normal;
               font-size: 18px;
               font-family: sans-serif;
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
     height: 500px;
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
input[type=text], [type=date], [type=number], select{
    width: 80%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 3px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 80%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}
           a:link {
    text-decoration: none;
    color:  #2e00ff ;
}

a:visited {
    text-decoration: none;
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
               margin-right: 35px;
               margin-top: -28px;
               margin-bottom: 30px;
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

        </style>
        <script>
$(function () {

    $(".datepicker").datepicker({
        changeMonth: true,
        changeYear: true,
       yearRange: "-68:+5",
       dateFormat: "dd/mm/yy"
  /*     monthNamesShort  : fullmonth_array         */

    });
});

         function myFunction() {
         var name=document.getElementById("name").value;
         var email=document.getElementById("email").value;
         var dob=document.getElementById("dob").value;
         var curr_post=document.getElementById("curr_post").value;
       
         var mobile=document.getElementById("mobile").value;

         if (name=="" || name==null){
                alert("Please enter your name.....");
                    return false;
            }

            if (email=="" || email==null){
                alert("Please enter your email.....");
                    return false;
            }
            var atpos = email.indexOf("@");
            var dotpos = email.lastIndexOf(".");
            if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length) {
            alert("Not a valid e-mail address");
                    return false;
            }

            if (mobile=="" || mobile==null){
                alert("Please enter your mobile no....");
                    return false;
            }
            if (dob=="" || dob==null){
                alert("Please enter Date of Birth.....");
                    return false;
            }

            if (curr_post=="" || curr_post==null){
                alert("Please select your Designation.....");
                    return false;
            }

         
            else

           {
    document.forms[0].action = "EISpen_reg_success.jsp"
    return true;
        }
             }
        </script>

    </head>
    <body background=" #ecf0f3 ">
        <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; " align="center">Government of India, Ministry of MSME </div>
        <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"></font>O/o  DCMSME </div>
        <%--         <div style="font-size: large;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"> <%=user_cur_ofc%></font></div> --%>
       <div style="font-size:14px;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center" ><font color="#990000">ALL INDIA MSME-DO EMPLOYEE'S INFORMATION SYSTEM </font>
         </div>




         <h4 align="right"><a href="EISplogin.jsp"> Log In</a></h4>
         <table align="center" border="0px">
             <tr>
                 <td  align="center">
                     <strong style=" font-size: 20px; font-weight: 100;  font-family:sans-serif;"><b>EIS Pensioner Registration Form</b></strong>
                 </td>
             </tr>
             <tr>
                 <td>&nbsp;</td>
             </tr>
             <tr><td>
             <div align="center" class="login">
                 <br><br>

    <form name="myform" method="post" action="" onsubmit="return myFunction()" >
    <div id="fname" align="left" class="data">Full Name<br/></div>
    <input type="text" id="name" name="name" placeholder="Your name..">

    <div for="lname" align="left" class="data">Email<br/></div>
    <input type="text" id="email" name="email" placeholder="Your email..">

    <div for="lname" align="left" class="data">Mobile<br/></div>
    <input type="number" id="mobile" name="mobile"  min="1000000000" max="9999999999" maxlength="10" placeholder="Your mobile no..">

    <div align="left" class="data">Date of Birth<br/></div>
    <input type="text" class="datepicker" id="dob" name="dob" placeholder="dd/mm/yyyy">

    <div align="left" class="data">Designation (<b> at the time of retirement</b> )<br/></div>
    <select id="curr_post" name="curr_post">
        <option value="">Select</option>
        <option value="AIA">AIA</option>
        <option value="Director">Director</option>
        <option value="Dy. Director">Dy. Director</option>
        <option value="Asstt. Director Grade-I">Asstt. Director Grade-I</option>
        <option value="Asstt. Director Grade-II">Asstt. Director Grade-II</option>
        <option value="Investigator">Investigator</option>
        <option value="Office Superitendent">Office Superitendent</option>

    </select>

     

    <input type="submit" value="Submit">
  </form>
<br/><br/>
<h4 align="center" style=" margin-top: 14px;">Already registered !&nbsp;&nbsp;<a href="EISplogin.jsp">&nbsp;&nbsp; login here&nbsp;&nbsp;</a></h4>
</div>
 </td></tr> </table>
    <br/>
    <br/>

    <br/>
    <br/>
    <div align="center" style=" width: 100%; height: 90px; background: #f5f1f1 ; border: 1px gray thin;">
        
        <p>  Best view on mozilla firefox 52.0.0 and later version</p>
    </div>
    <div>&nbsp;</div>
    </body>
</html>
