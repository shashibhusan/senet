<%-- 
    Document   : SenetPerformanceDo
    Created on : 21 Feb, 2017, 12:30:56 PM
    Author     : admin
--%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="a.html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
    </head>
     <body>
        <%
     //  String a=request.getParameter("2011-12");
     //   String b=request.getParameter("2012-13");
     //   String i=request.getParameter("2013-14");
     //   String d=request.getParameter("2014-15");
     //   String e=request.getParameter("2015-16");
     //   String f=request.getParameter("2016-17");
       
        String name=(String)session.getAttribute("user");
      
        String a =request.getParameter("aa1");
        String b =request.getParameter("aa2");
        String i =request.getParameter("aa3");
        String d =request.getParameter("aa4");
        String e =request.getParameter("aa5");
        String f =request.getParameter("aa6");

        System.out.println("" +name);
try{

            Connection con =ConnectionManager.getConnectionDirectForMySQL();
            Statement s = con.createStatement();
         String query="insert into SenetPerformanceDo values('"+name+"','"+b+"','"+b+"','"+i+"','"+d+"','"+e+"','"+f+"')";
         int result= s.executeUpdate(query);
                if(result>0)
                    { %>
                    <center>  <h2>Your Report Successfully Submitted.</h2> </center>
              <%      }

   con.commit();
   con.close();
    }
catch(Exception y)
{
    y.printStackTrace();
    }
%>
        <%--     <table>
            <tr>
                <td><%=a%></td>
                <td><%=b%></td>
                <td><%=i%></td>
                <td><%=d%></td>
                <td><%=e%></td>
                <td><%=e%></td>

            </tr>
        </table>     --%>
        
    </body>
</html>
