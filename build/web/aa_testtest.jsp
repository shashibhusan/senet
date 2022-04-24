<%-- 
    Document   : aa_testtest
    Created on : May 21, 2018, 5:57:00 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div align="center" style="width: 500px; margin: auto; height:500px; overflow: auto; border: 2px red solid">
            <table >
                <tr>
                    <th>
                        Test
                    </th>
                </tr>
                <%
                for(int i=1; i<=100; i++)
                    {
                %>
                <tr>
                    <td style="border: 1px black solid;">Test<%=i%></td>
                </tr>

                <%
                }
                %>
            </table>

        </div>
    </body>
</html>
