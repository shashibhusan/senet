<%-- 
    Document   : UpdatePass
    Created on : 14 Feb, 2019, 5:02:18 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Change</title>
        <style>
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
                display: block;
            }
            #success
            {
                width: 350px;
                border: 1px #cfeec4 solid;
                align:center;
                margin: auto;
                height: 170px;
                display: none;
            }
            #head1
            {
                font: normal normal 20px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color: #f0f0f0;
                padding: 7px;
                text-align: left;
                line-height: 40px;   
            }
            #headsuccess
            {
                font: normal normal 20px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color:  #cfeec4 ;
                text-align: left;
                line-height: 30px;
            }
            #innerDiv
            {
                width: 400px;
                border: 1px #f0f0f0 solid;
                align:center;
                margin: auto;
                height: 200px;
            }
            #head
            {
                font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color: #f0f0f0;
                padding: 5px;
                text-align: left;
                line-height: 30px;
            }
            td{
                font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px #f1f1f1 solid;
                padding: 4px 9px;
            }
            input[type=password]
            {
                width: 85%;
                padding: 8px 8px;
                display: inline-block;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            #errpass{
                color: red;
                font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding-left: 15px;
                }
                input[type=submit],[type=button]
                        {
                        width: 80px;
                        background-color:  #e2e2e2 ;
                        color:  #000000 ;
                        padding: 6px 10px;
                        margin: 6px 0;
                        border: none;
                        border-radius: 2px;
                        cursor: pointer;
                        }
            input[type=submit]:hover
            {
                background-color:  #cacaca ;
            }
                        #emailerr{
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
#headerr
            {
                font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color:  #eec8c8 ;
                padding: 5px;
                text-align: left;
                line-height: 30px;
            }
            #msg
            {
               font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
               padding: 4px;
               color:  #3f8127 ;
            }
            #goLogin
{
    width: 150px;
    background-color:  #cfeec4 ;
    border-color:  #386d25 ;
}
        </style>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="shortcut icon" href="fevicon.png" type="image/x-icon">
        <script>
            function matchPass() 
            {                
                var password1 = $("#pass1").val();
                var password2 = $("#pass2").val();
                var patt = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{7,}$/;

                if (!patt.test(password1))
                    {
                        $("#errpass").text("Password must be 8 digits long. It must include character and numbers.");
                        return false;
                    }
                    else if(password1 == password2) {
                    document.getElementById("errpass").style.color = "green";
                    $("#errpass").text("password matched");
                    }
                    else {
                        document.getElementById("errpass").style.color = "red";
                        $("#errpass").text("not matching");
                        return false;
                        }

              }
              function myFunction() 
               {
                   document.getElementById("errpass").innerHTML="";
               }
               
              function validateOtp()
              {
                    var password1 = $("#pass1").val();
                    var password2 = $("#pass2").val();
                    
                    if(password1=="" || password1==null)
                        {
                            document.getElementById("errpass").innerHTML="Please enter password";
                            return false;
                        }
                        else if(password2=="" || password2==null)
                            {
                                document.getElementById("errpass").innerHTML="Please enter confirm password";
                                return false;
                            }else
                                {
                                    GeneratePassword();
                                    return true;
                                }
              }
              
              function GeneratePassword()
              {
                  var password = document.myForm.pass1.value;
                  var email = document.myForm.email.value;
                  
                  var url="PasswordUpdate.jsp?Xg15jdfHdn0="+password+"&IZlmXMivNcrevgSFy="+email;
                    if(window.XMLHttpRequest)
                    {
                    request=new XMLHttpRequest();
                    }
                    else if(window.ActiveXObject)
                    {
                        request=new ActiveXObject("Microsoft.XMLHTTP");
                    }

                    try
                        {
                        request.onreadystatechange=getInfo;
                        request.open("GET",url,true);
                        request.send();
                        }
                        catch(e)
                        {
                        alert("Unable to connect to server");
                        }
              }
                    
                function getInfo()
                {
                    if(request.readyState==4)
                    {
                    var val=request.responseText;
                    var msg=val.substr(val.length - 4);
                    var finalMsg=msg.trim();
                    
                    if(finalMsg==1)
                        {
                          document.getElementById('innerDiv').style.display="none";  
                          document.getElementById('success').style.display="block";  
                          document.getElementById('msg').innerHTML="password updated successfully";
                        }
                }
                }
                
                function goBack()
            {
                document.forms[0].action='changePass.jsp';
            }
            function GoToLogin()
            {
                document.forms[0].action='EIS_login.jsp';
            }

        </script>
    </head>
    <%
        int GeneratedOTP = (Integer)session.getAttribute("otpG");
        String email = (String)session.getAttribute("email");
        System.out.println("Generated Otp ="+GeneratedOTP);
        int EnteredOTP = Integer.parseInt(request.getParameter("otp"));
        System.out.println("Entered OTP ="+EnteredOTP);
        
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        session.invalidate();
        
        int Flag=0;
        
        if(GeneratedOTP==EnteredOTP)
        {
            Flag=1;
        }else
        {
            Flag=0;
        }
    %>
    <body style="background-color:  #e3e3e3 ">
        <br/><br/><br/>
        <div id="mainDiv" align="center" >
            <form name="myForm" id="myForm" method="POST">
            <div id="head1">
                Welcome to password change EIS Portal. 
            </div>
                <br/><br/><br/><br/>
                
                <div id="innerDiv">
                    <%
        if(Flag==1)
        {
                %>
                    <div id="head">
                    Create new password -
                     </div>
                   
                    <table style="width: 380px;">
                        <tr>
                            <td>Password</td>
                            <td>:&nbsp;<input type="password" name="pass1" id="pass1" autocomplete="off" placeholder="password" onkeypress="myFunction()"/></td>
                        </tr>
                        <tr>
                            <td>Confirm Password</td>
                            <td>:&nbsp;<input type="password" name="pass2" id="pass2" autocomplete="off" placeholder="re - password" onkeyup="return matchPass()"/></td>
                        </tr>
                        <input type="hidden" name="email" value="<%=email%>"/>
                        <tr>
                            <td colspan="2" id="border" align="right">                                
                                <input type="button" value="Reset" onclick="myForm.reset();"/> <input type="button" value="Update" onclick="return validateOtp();"/>
                            </td>
                        </tr>
                    </table><BR/>
                  <div id="errpass" align="left"></div> 
                  <%
        }else
        {
           %>
           <div id="headerr">
                    Error
                </div>
           <br/><br/><br/>
                <div id="emailerr">
                    <%--           &nbsp;&nbsp;&nbsp;This email is not registered. Try another one.--%>
                              &nbsp;&nbsp;&nbsp; <b>Incorrect</b> OTP. Please try again.
                </div>
                <br/>
                <div id="btnerr" align="right">
                    <input type="submit" id="goback"  value="Go back" onclick="return goBack();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
           <%
        }
                  %>
                </div>
                <div id="success">
                    <div id="headsuccess">
                    Success
                     </div><br/><br/>
                    <div id="msg">
                    </div>
                     <div>
                         <input type="submit" id="goLogin"  name="goLogin" value="go to login page" onclick="return GoToLogin()"/>
                     </div>
                </div>
                 
            </form>
        </div>
    </body>
</html>
