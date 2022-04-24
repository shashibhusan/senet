<%-- 
    Document   : city
    Created on : Dec 27, 2017, 5:17:18 PM
    Author     : Senet
--%>



<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
 <%
 String country=request.getParameter("count");
 String buffer="<select name='state'><option value='-1'>Select</option>";
    Connection con11=null;
               ResultSet rs11=null;
               try{
               con11 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt11 = con11.createStatement();
               String sql="Select * from eis_branch_list where type='"+country+"'";
               rs11=stmt11.executeQuery(sql);
               while(rs11.next()){
   buffer=buffer+"<option value='"+rs11.getString("Inst_Name")+"'>"+rs11.getString("Inst_Name")+"</option>";
   }
                con11.close();
 buffer=buffer+"</select>";
 response.getWriter().println(buffer);
 }


               catch(Exception ex){
               ex.printStackTrace();
               }
 %>
