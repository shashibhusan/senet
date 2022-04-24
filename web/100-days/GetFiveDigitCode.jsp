<%-- 
    Document   : GetFiveDigitCode
    Created on : 18 Jun, 2019, 11:25:50 AM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
 <%
 String fourDigitCode=request.getParameter("nic4digit");
 System.out.println("This is GetFiveDigitCode.jsp to fulfill nic5Digit");
 String first4digit="";
 String TrimmedSelectedfirst4digit="";
 System.out.println("Selected 4 digit code is==="+fourDigitCode);
 
 String buffer="<select class='fivedogitcode' id='fivedogitcode' name='fivedogitcode'><option value=''>Select</option>";
    Connection con11=null;
               ResultSet rs11=null;
               try{
               con11 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt11 = con11.createStatement();
               String sql="Select Code, Description from nic5digit order by Code ASC";
               rs11=stmt11.executeQuery(sql);
               while(rs11.next()){
                  
               //    int FourDigitCode=Integer.parseInt(rs11.getString("Code"));                   
                   
                TrimmedSelectedfirst4digit=  (fourDigitCode).substring(0, 4);
                first4digit=(rs11.getString("Code")).substring(0, 4);
                
                 if(TrimmedSelectedfirst4digit.equalsIgnoreCase(first4digit))
                {
                    System.out.println("code trimmed="+first4digit+"+++++++and selected code=="+TrimmedSelectedfirst4digit);
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