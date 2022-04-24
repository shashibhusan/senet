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
    padding-top: 4px;
    padding-bottom: 4px;
 }
 .login{
     width: 350px;
     height: 420px;
     border-radius: 5px;
    border: 2px black solid;
     color:   #566573 ;
     background:  #ffffff ;
    

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
.user{
    width: 80%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
.captcha{
    width: 80%;
    
    padding: 12px 20px;
    
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
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
              p{
font-family: sans-serif;
font-size: 15px;
color:   #ff6100  ;

padding-top: 16px;
}
div {
    border-radius: 5px;
}
#ree{
    margin-top: 08px;
}
#note
{
    font: normal normal 17px Verdana, Geneva, Arial, Helvetica, sans-serif;
    color: red;
    
}
#forget
{
    font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
}
        </style>
        <script>
            function  myFunction()
           {
           var email=document.getElementById("user").value;
           var pass=document.getElementById("password").value;   
           if (email=="" || email==null){
                alert("Please enter your email.....");
                    return false;
            }
            if (pass=="" || pass==null){
                alert("Please enter password.....");
                    return false;
            }
           var atpos = email.indexOf("@");
           var dotpos = email.lastIndexOf(".");
           if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length) {
           alert("Not a valid e-mail address");
           return false;
           }
           else
               {
           document.forms[0].action = "EIS_login_check.jsp"
           return true;
               }
           }


            function refresh()
           {
               document.getElementById("captcha").src='reCaptch.jsp?'+(new Date().getTime());
           }
        </script>
    </head>
    <body background=" #ecf0f3 ">
        <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; " align="center">Government of India, Ministry of MSME </div>
        <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"></font>O/o  DCMSME </div>
        <%--         <div style="font-size: large;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"> <%=user_cur_ofc%></font></div> --%>
       <div style="font-size:14px;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center" ><font color="#990000">ALL INDIA MSME-DO EMPLOYEE'S INFORMATION SYSTEM </font>
         </div>
       <br/>

         <h3 align="center"> </h3>
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
                 
                 <form name="myform" method="post" action="" onsubmit="return myFunction()" >
       <div id="fname" align="left" class="data">E-mail :<br/></div>
       <input type="text" class="user" id="user" name="user" placeholder="Your email..">
<br/>

    <div for="lname" align="left" class="data">Password :<br/></div>
    <input type="password" class="user" id="password" name="password" placeholder="Password..">
    <br/>
    <div for="lname" align="left" class="data">Captcha &nbsp; :<br/></div>
    <img id="captcha" height="40" style=" width: 100px;" src="reCaptch.jsp" width="90"><a href="JavaScript:refresh()"><img src="refresh.png" style="border:none; width: 20px; height: 20px;" /></a> <br>
    <input type="text" id="ree" class="captcha" name="answer" align="center" required/><br>
    
    <br/>
   

    <input type="submit" value="Submit">
    <br/>
    <h4 align="center">Not registered yet! <a href="EIS_main.jsp"> Register.</a></h4>
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
    
        <a href="changePass.jsp">forget password?</a>   
   
    </div>
    <br/>
    <div align="center" style=" width: 100%; height: 90px; background:  #f8f5de  ; border: 1px gray thin;">
        <p style="margin-bottom: -15px;"> <a onClick="openTab(this)" href="http://mpr.dcmsme.gov.in/dcmsme/mprsenet/EIS_Approval_letter.pdf" ><b>Approval Letter, Sample Forms & Training Details From 2012-13 to 2017-18 .</b></a></p>
        <p>  Best view on mozilla firefox 52.0.0 and later version</p>
    </div>
    <div>&nbsp;</div>
   
    </body>
</html>
