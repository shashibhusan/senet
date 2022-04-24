<%-- 
    Document   : GetTwoDigitCode
    Created on : 18 Jun, 2019, 4:47:36 PM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%--
 <%
 String typeOfSelect=request.getParameter("type"); 
 System.out.println("This is GetTwoDigitCode.jsp to fulfill nic2Digit");
 System.out.println("Selected type is =="+typeOfSelect); 
 String sql="";
 if(typeOfSelect.equalsIgnoreCase("01")) {
     sql="Select * from nic2digit where Activity='1'"; }
 else if(typeOfSelect.equalsIgnoreCase("02")) {
     sql="Select * from nic2digit where Activity='2'"; } 
 System.out.println("Query fired is =="+sql);
 String buffer="<select class='twodigitcode' id='twodigitcode' name='twodigitcode' onchange='getFourDigitCode(this);><option value='-1'>Select</option>";
    Connection con11=null;
               ResultSet rs11=null;
               try{
               con11 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt11 = con11.createStatement();               
               rs11=stmt11.executeQuery(sql);
               while(rs11.next()){               
   buffer=buffer+"<option value='"+rs11.getString("Code")+"'>"+rs11.getString("Code")+"&nbsp;-&nbsp;"+rs11.getString("Description")+"</option>";   
               }
                con11.close();
                rs11.close();
                stmt11.close();
 buffer=buffer+"</select>";
 response.getWriter().println(buffer);
 }               catch(Exception ex){
               ex.printStackTrace();
               }
 %>
--%>


 <%
 String twoDigitCode=request.getParameter("type");
 String first2digit="";
 String sql="";
 if(twoDigitCode.equalsIgnoreCase("01")) {
     sql="Select * from nic2digit where Activity='1'"; }
 else if(twoDigitCode.equalsIgnoreCase("02")) {
     sql="Select * from nic2digit where Activity='2'"; } 
 System.out.println("Query fired is =="+sql); 
 String buffer="<select class='twodogitcode' id='twodogitcode' name='twodogitcode' onchange='getFourDigitCode(this);'><option value=''>Select</option>";
    Connection con11=null;
               ResultSet rs11=null;
               try{
               con11 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt11 = con11.createStatement();
               rs11=stmt11.executeQuery(sql);
               while(rs11.next()){              
   buffer=buffer+"<option value='"+rs11.getString("Code")+"-"+rs11.getString("Description")+"'>"+rs11.getString("Code")+"&nbsp;-&nbsp;"+rs11.getString("Description")+"</option>";
               }
                con11.close();
                rs11.close();
                stmt11.close();
 buffer=buffer+"</select>";
 response.getWriter().println(buffer);
 }


               catch(Exception ex){
               ex.printStackTrace();
               }
 %>
