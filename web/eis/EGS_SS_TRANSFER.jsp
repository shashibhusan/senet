<%-- 
    Document   : EGS_SS_TRANSFER
    Created on : May 23, 2018, 12:54:11 PM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="common.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%

String  adEmail=request.getParameter("val");

String  grvId=request.getParameter("val1");
String  userEmail=request.getParameter("val2");
String  instId=request.getParameter("val3");
int token=Integer.parseInt(request.getParameter("val4"));

String  reason=request.getParameter("reason");
System.out.println(":: Transfer done Successfully :: email="+adEmail+"//Grievance ID="+grvId+"//USer Email="+userEmail+"//Inst_Id"+instId);

System.out.println("Reason for transfer="+reason);


SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Date date = new Date();
String time=dateFormat.format(date);

int iCount=0;
Connection con=null;
ResultSet res=null;
Statement stm=null;
try
        {
    con=ConnectionManager.getConnectionDirectForMySQL();
    stm=con.createStatement();
    String Query="select * from egs_ss_transfertohq where grvId='"+grvId+"'";
    res=stm.executeQuery(Query);
    while(res.next())
        {
        iCount++;
        }
    }
catch(Exception msg){
msg.printStackTrace();
}
String status="yes";
System.out.println("Data status"+iCount);
PreparedStatement psmt=null;
Connection connection = null;
String connectionURL = "jdbc:mysql://localhost:3306/mpr_dcmsme";

if(iCount==0)
    {
try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "220047");
psmt = connection.prepareStatement("insert into egs_ss_transfertohq(grvId, adEmail, userEmail, Time, transferFrom, status, reason, token) values (?, ?, ?, ?, ?, ?, ?, ?)");
//String Query=" insert into egs_transfertohq(grvId, adEmail, userEmail, Time, transferFrom, status) values (?, ?, ?, ?, ?, ?)";
//psmt=con.prepareStatement(Query);
psmt.setString(1, grvId);
psmt.setString(2, adEmail);
psmt.setString(3, userEmail);
psmt.setString(4, time);
psmt.setString(5, instId);
psmt.setString(6, status);
psmt.setString(7, reason);
psmt.setInt(8, token);

int rs=psmt.executeUpdate();
if(rs>0)
    {
    System.out.println("Grievance Transfer done successfully.");
    out.println("Grievance Transfer done successfully.");
    }
else
    {
    System.out.println("There is some problem transferring this grievance to HQ Office. Please try again..");
    out.println("There is some problem transferring this grievance to HQ Office. Please try again..");
    }
}
catch(Exception error)
        {
    error.printStackTrace();
    System.out.println("Error is ::"+error);
    }
}else
    {
    out.println("This grievance has been transferred to the HQ Office already");
    }
%>

