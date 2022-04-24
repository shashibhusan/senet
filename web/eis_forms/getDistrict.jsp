<%-- 
    Document   : getDistrict
    Created on : 11 Mar, 2021, 12:31:44 PM
    Author     : msme
--%>


<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
 <%
 String state_id=request.getParameter("val");
 String buffer="<select class='selD' name='selDistrict' id='selDistrict'><option value=''>Select district</option>";
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
   buffer=buffer+"<option value='"+rs11.getString("DISTRICT_CODE")+"'>"+rs11.getString("DISTRICT_NAME");
   }
                con11.close();
 buffer=buffer+"</select>";
 response.getWriter().println(buffer);
 }


               catch(Exception ex){
               ex.printStackTrace();
               }
 %>
