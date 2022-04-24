<%--
    Document   : EIS_login
    Created on : Dec 29, 2017, 6:46:05 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EIS Pensioner login</title>
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
    margin-top: 8px;
    padding: 12px 20px;
    margin-left: 20px;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
#captcha{
    width: 40%;
    margin-top: 8px;
    margin-left: 20px;
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
           document.forms[0].action = "EISpCheck.jsp"
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
       <br/>

         <h3 align="center"> </h3>
         <table  align="center" border="0px;">
             <tr>
                 <td align="center">
                   <strong style=" font-size: 20px; font-weight: 100;  font-family:sans-serif;"><b>EIS Pensoiner Login</b></strong>
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
<br/>
    <div for="lname" align="left" class="data">Password :<br/></div>
    <input type="password" class="user" id="password" name="password" placeholder="Password..">
    
 <div for="lname" align="left" class="data">Enter Captcha :<br/>
     <img id="captcha" style=" margin-left: 70px" src="<c:url value="simpleCaptcha.jpg" />" width="150"><a href="JavaScript:window.location.href=window.location.href"><img src="images/refresh.png" style="border:none" width="20" height="25"/></a> <br>
 <input type="text" class="captcha" name="answer" align="right" /><br></div>

    <br/>
    


    <input type="submit" value="Submit">
    <br/><br>
    <h4 align="center">Not registered yet! <a href="EISpenregister.jsp"> Register.</a></h4>
  </form>
<br/><br/>

</div>

                 </td>
             </tr>
         </table>
    <br/>
    <br/>
    <div align="center" style=" width: 100%; height: 90px; background:  #f8f5de  ; border: 1px gray thin;">
       
        <p>  Best view on mozilla firefox 52.0.0 and later version</p>
    </div>
    <div>&nbsp;</div>

    </body>
</html>
