<%-- 
    Document   : 111
    Created on : Jan 5, 2018, 10:23:31 AM
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
        <%--
        String office[]=new String[20];
        String mode[]=new String[20];
        String desig[]=new String[20];
        String ph_from[]=new String[20];
        String ph_to[]=new String[20];
        int i=1;
        while(!office[i].equals(null) && !office.equals("0"))
            {
            office[i]= request.getParameter("myInputs1[i]");
            mode[i]= request.getParameter("selmode[i]");
            desig[i]= request.getParameter("seldesig[i]");
            ph_from[i]= request.getParameter("myInputs2[i]");
            ph_to[i]= request.getParameter("myInputs3[i]");
            i++;
            }
        if(i>0)
            {
            while(i>0)
                {
      %>
        <h4><%=office[i]%></h4>
        <h4><%=mode[i]%></h4>
        <h4><%=desig[i]%></h4>
        <h4><%=ph_from[i]%></h4>
        <h4><%=ph_to[i]%></h4>
        <h4>=====================</h4>
        <%
        }
            }

        --%>
        <h1>Hello Raghav!</h1>
    </body>
</html>
