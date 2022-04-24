<%-- 
    Document   : changePass
    Created on : 14 Feb, 2019, 12:49:12 PM
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
            }
            #head
            {
                font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color: #f0f0f0;
                padding: 5px;
                text-align: left;
                line-height: 30px;
            }
            #head1
            {
                font: normal normal 20px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color: #f0f0f0;
                padding: 7px;
                text-align: left;
                line-height: 40px;   
            }
            input[type=text]
            {
                width: 80%;
                padding: 8px 10px;
                display: inline-block;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
                        input[type=submit]
                        {
                        width: 100px;
                        background-color:  #e2e2e2 ;
                        color:  #000000 ;
                        padding: 9px 14px;
                        margin: 8px 0;
                        border: none;
                        border-radius: 4px;
                        cursor: pointer;
                        }
            input[type=submit]:hover
            {
                background-color:  #cacaca ;
            }
            
            #btn{
                align:right;
            }
            #err{
    width: 100%;
    align : center;
    text-align: left;
    margin: auto;
    color:  #e80c0c ;
    font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;

}
        </style>
        <script>
            function validateOtp()
            {
                var email = document.myForm.email.value;
                
                var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                
                if(email==null || email=="")
                    {
                        document.getElementById('err').innerHTML='Please enter email.';
                        return false;
                    }
                    
                    else if(reg.test(email) == false) 
                            {
                            document.getElementById('err').innerHTML='Invalid email.';
                            return false;
                            }
                return true;
            }
            function errReset()
            {
                document.getElementById('err').innerHTML='';
            }
        </script>
    </head>
    <body style="background-color:  #e3e3e3 ">
        <br/><br/><br/>
        
        
        <div id="mainDiv" align="center" >        
          
            <div id="head1">
                Welcome to password change EIS Portal. 
            </div>
            <br/><br/><br/><br/>
            
            <div id="innerDiv">
                
                
                <div id="head">
                    Please enter registered email below -
                </div>
                
                <br/>
                <form name="myForm" id="myForm" action="validateOTP.jsp" method="POST"> 
                <div>
                    <input type="text" name="email" autocomplete="off" placeholder="enter registered email" id="email" onkeypress="errReset()"  required/>
                </div>
                
                <br/>
                
                <div id="btn" align="right">
                    <input type="submit" value="Generate OTP" onclick="return validateOtp();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div><br/> 
                <div id="err">
                    
                </div>
                </form>
            </div>
            
       
           
        </div>
        
        
    </body>
</html>
