<%-- 
    Document   : changesuccessfull
    Created on : 11 Jan, 2022, 12:45:47 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success</title>
        <style>
        .success
        {
            width: 600px;
            height: 250px;
            border: 1px solid #148900;
            margin: auto;
        }
        .note
        {
            background-color: #DCEED9;
            border-bottom:  1px solid #148900;
            margin: 0px;
            font: normal bold 15px Verdana, Geneva, Arial, Helvetica, sans-serif;
            color: #148900;
            padding: 10px;              
        }
        ul,li{
            font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
            
        }
        li
        {
            padding: 3px 0px 3px 0px;
        }
        .back
        {
            font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            position: absolute;
            alignment-adjust: baseline;
        }
    </style>
    </head>
    <body>
        <br/>
    <br/>
    <div class="success">
        <div id="success-div">
            <h2 class="note">Update successful -</h2>
            <br/>
            <ul>
                <li>You have updated your email successfully.</li>
                <li>Now go to EIS login page and use your government email <font style="color: #A2A2A2">(@nic.in or @gov.in or @dcmsme.gov.in)</font>  to login in your account.</li>
                <li>For any query please email to: <a href="mailto:eis.dcmsme@gmail.com"><font style="font-weight: bold">eis.dcmsme@gmail.com</font></a>.</li>
                <br/>
                <li>Click here for <a href="../EIS_login.jsp">Login</a> in eis portal.</li>
            </ul>
            
        </div>

    </div>
    </body>
</html>
