<%-- 
    Document   : submitResponse
    Created on : Jun 19, 2018, 1:34:51 PM
    Author     : Senet
--%>

<%@page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.UUID" %>
<%@page import="java.util.Random" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.*,java.sql.*,java.util.zip.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
System.out.println("redirected to ajax insert");

String userEmail=request.getParameter("val");
String reply_data=request.getParameter("val1");
String ref_num=request.getParameter("val2");
String adminEmail=request.getParameter("val3");
String issue_related=request.getParameter("val4");

SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Date date = new Date();
String submit_date=dateFormat.format(date);

System.out.println("//"+userEmail+"//"+reply_data+"//"+ref_num+"//"+adminEmail+"//"+issue_related  );

Connection connection = null;
String connectionURL = "jdbc:mysql://localhost/mpr_dcmsme";
PreparedStatement psmnt = null;
int s=0;
//if(iCount==0)
//    {
try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "220047");

psmnt = connection.prepareStatement("insert into msme_response_data( userEmail, response_submit_by, issue_related_to, reply_data, reply_time, ref_num) values(?, ?, ?, ?, ?, ?)");
psmnt.setString(1, userEmail);
psmnt.setString(2, adminEmail);
psmnt.setString(3, issue_related);
psmnt.setString(4, reply_data);
psmnt.setString(5, submit_date);
psmnt.setString(6, ref_num);

s = psmnt.executeUpdate();

if(s>0){

System.out.println("Response submitted successfully !");
out.println("Response submitted successfully !");
}
else{
System.out.println("Error!");
}
}
catch(Exception e){
    e.printStackTrace();
    System.out.println("Error is ="+e);
}

%>