<%-- 
    Document   : success
    Created on : 18 Mar, 2021, 1:09:10 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>success</title>
        <style>
            #mainDiv{
                width: 90%;
                margin: auto;
                height: 40px;
                background-color: #DBF1DC;
                color: #00B305;
                font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 5px;
                border: 1px #00B305 solid;
            }
        </style>
    </head>
    <body>
        <%
            String data=request.getParameter("data");
            String status=request.getParameter("status");
        %>
        
        <div id="mainDiv">            <br/><br/>
            
            Your details in <%=data%> inserted successfully.
            
        </div>
    </body>
</html>
