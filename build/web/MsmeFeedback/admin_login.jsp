<%-- 
    Document   : admin_login
    Created on : June 19, 2018, 1:40:37 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,common.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <style>


            .main{
                width: 350px;
                height: 250px;
                 margin-top: 50px;
                border-radius: 8px;
                border: 3px fuchsia ridge;
              
}
.center{
padding-top: 20px;
 padding-left: 30px;
 padding-right: 35px;
 font-family: Bookman Old Style;
}
.top{
    height: 55px;
    background:  #cccccf ;
    text-align: center;
    font-family: Bookman Old Style;
    font-size: 22px;
    border-top-right-radius: 8px;
    border-top-left-radius: 8px;
}
.bottom
{
 height: 55px;
    background:  #cccccf ;
    text-align: center;
    font-family: Bookman Old Style;
    font-size: 22px;
    border-bottom-right-radius: 8px;
    border-bottom-left-radius: 8px;
}
.input{

margin-top: 10px;
}
.submit{
    margin-right: 70px;
    margin-bottom: 10px;
     font-family: Vardana;
     margin-top: 0px;
}
#error{
  font-family: Bookman Old Style;
  color: red;
  font-size: 12px;
 margin-top: -25px;
}


table {
    position: relative;
    -moz-box-shadow: 1px 2px 4px rgba(0, 0, 0,0.5);
    -webkit-box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
   
    background: white;
}

/* Make the image fit the box */
table img {
    width: 100%;
    border: 1px solid #8a4419;
    border-style: inset;
}
#box{
    display: inline-block;
    height: 150px;
    width: 250px;
    margin-left: 3px;
    margin-right: 3px;
    border-radius: 10px;
     position: relative;
    -moz-box-shadow: 1px 2px 4px rgba(0, 0, 0,0.5);
    -webkit-box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    margin-bottom: 10px;
   

}
.gname{
        font-family: Verdana, Geneva, sans-serif;
	font-size: 14px;
	font-style: normal;
	font-variant: normal;
        padding-left: 12px;
         margin-top: -8px;
}
.num{
        font-family: Verdana, Geneva, sans-serif;
	font-size: 38px;
	font-style: normal;
	font-variant: normal;
        font-weight: bold;
        padding-left: 12px;
        margin-top: -8px;
        
}

        </style>
        <script>
            
            function validate(){
           var name=document.getElementById("user").value;
           var pass=document.getElementById("pass").value;
            if(pass=="" && name=="") {
                document.getElementById("error").innerHTML = "Please enter Username and Password";
               return false;
            }
           if(name=="" || name==null){

               document.getElementById("error").innerHTML = "Please enter username";
               return false;
            }
          if(pass=="" || pass==null){

               document.getElementById("error").innerHTML = "Please enter Password";
               return false;
            }
           
            
       else

           {
    document.forms[0].action = "check.jsp"
    return true;
        }
            }

            function refresh()
           {
               document.getElementById("captcha").src='reCaptch.jsp?'+(new Date().getTime());
           }
        </script>

    </head>
    <body>
        <center>
            <h2>DC-MSME Respondent Login</h2>
            <form name="myForm" method="post" action="" onsubmit="return validate()">
                <table class="main">
                    
                    <tr>
                        <td class="center">
                            Username : <input type="text" name="user" id="user" required><br>
                            Password &nbsp;: <input class="input" type="password" id="pass" name="pass" required>
                        </td>
                    </tr>
                    <tr>
                        <tr>
                            <td>
                                <div align="left" style=" margin-left: 25px">Enter Captcha :
                        <img id="captcha" height="40" style=" width: 100px;" src="<c:url value="reCaptch.jsp" />" width="90"><a href="JavaScript:refresh()"><img src="refresh.png" style="border:none; width: 20px; height: 20px;" /></a> <br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" class="captcha" name="answer" align="center" required/><br></div>
                  </td>  </tr>
                    </tr>
                    <tr>
                        <td align="right" class="submit" >
                            <input type="submit" class="submit" value="Login">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div id="error"></div>
                        </td>
                    </tr>
                    
                </table><br/><br/>
                
                
        </form>
            </center>
    </body>
</html>
