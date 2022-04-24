<%-- 
    Document   : fixTopRowScrolling
    Created on : Jul 12, 2018, 12:58:13 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #scroll
            {
                height: 150px;
                overflow: auto;
                position: relative;
                width: 500px;
               
}
        </style>
    </head>
    <body>
        <h1>Hello World!</h1>
        <center>
            <div style="width: 500px; margin: auto; border: 2px aqua double;">
                <table align="center" bgcolor="gray" width="500px;">
            <tr>
                <td align="center" width="20">Sno</td>
                <td width="200">Name</td>
                <td width="150">Ref Number</td>
            </tr>
        </table>
            <div  id="scroll">
        <table align="center">
            <%
            String name="raghav";
            String name1="987456321";
            for(int i=1;i<=30; i++)
                {

            %>
            <tr>
                <td align="left" width="20"><%=i%></td>
                <td width="200"><%=name%></td>
                <td width="150"><%=name1%></td>
            </tr>
            <%
            }
            %>
        </table>
        </div>
        </div>
        </center>

    </body>
</html>
