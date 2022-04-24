<%-- 
    Document   : jsperror
    Created on : 29 Dec, 2021, 5:28:41 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        <style>
        .error
        {
            width: 600px;
            height: 200px;
            border: 1px solid #B30000;
            margin: auto;
        }
        .note
        {
            background-color: #FFE0E0;
            border-bottom:  1px solid #B30000;
            margin: 0px;
            font: normal normal 15px Verdana, Geneva, Arial, Helvetica, sans-serif;
            color: #C30000;
            padding: 10px;              
        }
        ul,li{
            font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
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
    <%
        int errorCode=Integer.parseInt(request.getParameter("errorCode"));
        System.out.println(" we get the error code ="+errorCode);
    %>
    <div class="error">
        <div id="error-div">
            <%
        if(errorCode==3)
        {
            %>
            <h2 class="note">Error occurred with following possible reason -</h2>
            <br/>
            <ul>
                <li>The government email you trying to update is already exist.</li>
                <li>Please try wit another government email or contact to administrator.</li>
                <br/>
                <li>Go back to <a href="../EIS_login.jsp">Login</a></li>
            </ul>
            <%
        }else
        {
            %>
            <h2 class="note">Error occurred with following possible reason -</h2>
            <br/>
            <ul>
                <li>It may be some technical issue with database.</li>
                <li>You have entered wrong credentials.</li>
                <li>Please try again or contact to administrator.</li>
                <br/>
                <li>Go back to <a href="../EIS_login.jsp">Login</a></li>
            </ul>
          <%}%>  
        </div>

    </div>
    </body>
</html>
