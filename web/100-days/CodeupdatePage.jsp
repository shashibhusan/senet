<%-- 
    Document   : CodeupdatePage
    Created on : 18 Jun, 2019, 11:35:16 AM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Code Update 5 Digit</title>
    </head>
    <body>
       <%
           Connection con=null;
           ResultSet rs=null;
           Statement st=null;
           int sno=0;
           String newCode="";
           try
           {
               con=ConnectionManager.getConnectionDirectForMySQL();
               st=con.createStatement();
           }
           catch(Exception error)
           {
               error.printStackTrace();
           }
           
           String k="";
           String sql="select sno, code, description from nic5digit";
           rs=st.executeQuery(sql);
           while(rs.next())
           {
               int code=Integer.parseInt(rs.getString("Code"));
               sno=rs.getInt("sno");
               if(code<9999 && code>1000)
               {
                   k="0";                 
                   
               }else
               {
                   k="";
               }
               
               newCode=k+rs.getString("Code");
               
               System.out.println("Old code==="+code+" replaced by=="+newCode);
           }
                   
           
       %>
    </body>
</html>
