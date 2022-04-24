<%-- 
    Document   : editTableSubmit
    Created on : Jan 30, 2018, 11:37:30 AM
    Author     : Senet
--%>

<%@page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
    String email="rgvjee@gmail.com";
         Connection con1=null;
               ResultSet rs1=null;
int ph=0;

                try{
               con1 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt1 = con1.createStatement();
               String sql="select * from eis_posthistory where email='"+email+"'";
               rs1=stmt1.executeQuery(sql);
               while(rs1.next()){
                   ph=ph+1;
     }
               con1.close();
               }
                catch(Exception ex){
                    ex.printStackTrace();
                    }
String a1="", a2="", a3="", a4="", a5="";
  if(ph==7)
      {
    a1=request.getParameter("name[1]");
    a2=request.getParameter("deg[1]");
    a3=request.getParameter("md[1]");
    a4=request.getParameter("fromn[1]");
    a5=request.getParameter("too[1]");
 }
else if(ph==2)
      {
    a1=request.getParameter("name[1]");
    a2=request.getParameter("deg[1]");
    a3=request.getParameter("md[1]");
    a4=request.getParameter("fromn[1]");
    a5=request.getParameter("too[1]");
 }
    %>
    <body>
        <h1><%=a1%></h1>
        <h2><%=a2%></h2>
        <h1><%=a3%></h1>
        <h1><%=a4%></h1>
        <h1><%=a5%></h1>
        <h1><%=ph%></h1>
       
    </body>
</html>
