<%-- 
    Document   : DataBind
    Created on : 17 Jun, 2019, 11:29:51 AM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
 <%
 String state_id=request.getParameter("val");
 String buffer="<select class='district' name='district' id='district'><option value=''>Select</option>";
    Connection con11=null;
               ResultSet rs11=null;
               int j=0;
               try{
               con11 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt11 = con11.createStatement();
               String sql="Select DISTRICT_NAME, DISTRICT_CODE, DISTRICT_NAME_HINDI from districts where state_id='"+state_id+"' order by DISTRICT_NAME asc";
               rs11=stmt11.executeQuery(sql);
               while(rs11.next()){
                   j=j+1;
   buffer=buffer+"<option value='"+rs11.getString("DISTRICT_CODE")+"'>"+j+"&nbsp;-&nbsp;"+rs11.getString("DISTRICT_NAME")+"/"+rs11.getString("DISTRICT_NAME_HINDI")+"</option>";
   }
                con11.close();
 buffer=buffer+"</select>";
 response.getWriter().println(buffer);
 }


               catch(Exception ex){
               ex.printStackTrace();
               }
 %>
