<%-- 
    Document   : errorpassupdate
    Created on : 21 Aug, 2019, 10:14:48 AM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        <style>
            #head
            {
                width: 85%;
                height: 150px;
                margin: auto;
                font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px #de0000 solid;
            }
            #err-head
            {
                background-color: #f9a7a7;
                font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 10px;
                color:  #990000 ;
            }
            #data{
                width: 90%;
                margin: auto;
                color: #990000;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
        </style>
    </head>
    <body>
        <br/><br/>
        <div id="head">
        <div id="err-head"> Error</div>
        <br/><br/>
        <div id="data">
        <li>Please choose unique password. The password you choose has been used earlier.</li>
        <li>You are not allowed to choose password which is used previously.</li>
        </div>
        </div>
    </body>
</html>
