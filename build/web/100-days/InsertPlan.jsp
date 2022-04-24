<%-- 
    Document   : InsertPlan
    Created on : 20 Jun, 2019, 5:26:15 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        String state=request.getParameter("state");
    %>
    <body>
        <h1>
            <%=state%>
        </h1>
    </body>
</html>
