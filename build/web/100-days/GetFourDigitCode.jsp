<%-- 
    Document   : GetFourDigitCode
    Created on : 17 Jun, 2019, 3:42:40 PM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
 <%
 String twoDigitCode=request.getParameter("nic2digit");
 System.out.println("This is GetFourDigitCode.jsp to fulfill nic4Digit");
 String first2digit="";
 String TrimmedSelect4DigitCode="";
 System.out.println("Selected 2 digit code is==="+twoDigitCode);
 
 String buffer="<select class='fourdogitcode' id='fourdogitcode' name='fourdogitcode' onchange='getFiveDigitCode(this);'><option value=''>Select</option>";
    Connection con11=null;
               ResultSet rs11=null;
               try{
               con11 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt11 = con11.createStatement();
               String sql="Select Code, Description from nic4digit order by Code ASC";
               rs11=stmt11.executeQuery(sql);
               while(rs11.next()){
               //    int FourDigitCode=Integer.parseInt(rs11.getString("Code"));                   
                   
                TrimmedSelect4DigitCode= (twoDigitCode).substring(0, 2);
                first2digit=(rs11.getString("Code")).substring(0, 2);
                
                if(TrimmedSelect4DigitCode.equalsIgnoreCase(first2digit))
                {
   buffer=buffer+"<option value='"+rs11.getString("Code")+"-"+rs11.getString("Description")+"'>"+rs11.getString("Code")+"&nbsp;-&nbsp;"+rs11.getString("Description")+"</option>";
   }
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
