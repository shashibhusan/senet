<%--
    Document   : raghav1
    Created on : 22 Feb, 2017, 2:23:08 PM
    Author     : admin
--%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="a.html" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
        String user=request.getParameter("Username");
        String email=request.getParameter("email");
        String pass=request.getParameter("password");

       
try{
      Connection con =ConnectionManager.getConnectionDirectForMySQL();

      Statement s = con.createStatement();


      String query = "insert into raghav values('"+user+"','"+email+"','"+pass+"')";
		
                int result= s.executeUpdate(query);
                if(result>0)
                    { %>
                 <h2>Your Report Successfully Submitted.</h2>
              <%      }

   con.commit();
   con.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }


%>
<%--<table>
    <tr>
        <td><%=user%></td>
         <td><%=email%></td>
          <td><%=pass%></td>

    </tr>
</table>  --%>
    </body>
</html>
