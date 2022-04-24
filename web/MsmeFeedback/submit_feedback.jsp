<%-- 
    Document   : submit_feedback
    Created on : Jun 15, 2018, 6:24:05 PM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.UUID" %>
<%@page import="java.util.Random" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Submit</title>
        <style>
            p{
                padding: 8px;
}
        </style>
    </head>
    <%
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String category=request.getParameter("category");
    String uam=request.getParameter("uam");
    String other_cat=request.getParameter("other_cat");
    String ref_num=(String)session.getAttribute("ref_num");
    System.out.println("Reference No :"+ref_num);
    int iCount=0;
if(other_cat==null || other_cat=="")
    {
    other_cat="0";
    }


    Connection con=null;
    Statement stm=null;
    ResultSet res=null;
    int duplicateEntry=0;

   try
        {
    con=ConnectionManager.getConnectionDirectForMySQL();
    stm=con.createStatement();
    String Query="select * from msme_issue_final where email='"+email+"'";
    res=stm.executeQuery(Query);
    while(res.next()){
        duplicateEntry=1;

        }
    con.close();
    }
catch(Exception ee){
    ee.printStackTrace();
    }

if(duplicateEntry==0)
{

SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Date date = new Date();
String submit_date=dateFormat.format(date);

Random rand = new Random();
int token = rand.nextInt(9000000) + 1000000;


Connection connection = null;
String connectionURL = "jdbc:mysql://localhost/mpr_dcmsme";
PreparedStatement psmnt = null;
try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "220047");
psmnt = connection.prepareStatement("insert into msme_feedback_basic( name, email, token, category, submit_date, uam, other_cat, ref_num) values(?, ?, ?, ?, ?, ?, ?, ?)");
psmnt.setString(1, name);
psmnt.setString(2, email);
psmnt.setInt(3, token);
psmnt.setString(4, category);
psmnt.setString(5, submit_date);
psmnt.setString(6, uam);
psmnt.setString(7, other_cat);
psmnt.setString(8, ref_num);
int s = psmnt.executeUpdate();
if(s>0){
    iCount=1;
System.out.println("Uploaded successfully !");
}
else{
System.out.println("Error!");
}
connection.close();
}
catch(Exception e){
    e.printStackTrace();
    System.out.println("Error is ="+e);
}
String status="Y";
try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "220047");
psmnt = connection.prepareStatement("insert into msme_issue_final( ref_num, email, status, time) values(?, ?, ?, ?)");
psmnt.setString(1, ref_num);
psmnt.setString(2, email);
psmnt.setString(3, status);
psmnt.setString(4, submit_date);

int s = psmnt.executeUpdate();
if(s>0){
    iCount=1;
System.out.println("Data inserted successful in final table!");
}
else{
System.out.println("Error!");
}
connection.close();
}
catch(Exception e){
    e.printStackTrace();
    System.out.println("Error is ="+e);
}


    %>
    <body><br/><br/>
        <div>
            <%

            if(iCount==1)
                {
            %>

            <div style="width: 440px; margin: auto; color: green; font-size: 17px;">
                <p>Your issue submitted Successfully.<br/> <a href="feedbackForm.jsp">Go home...</a></p>

            </div>

            <%
            }else
                {
    %>
    <div style="width: 440px; margin: auto; color: red; font-size: 17px;">
                <p>ERROR ! Please try again or contact to administrator. <a href="feedbackForm.jsp">Go home...</a></p>

            </div>
    
    <%
    }
}else
    {
            %>
            <div style="width: 440px; margin: auto; color: red; font-size: 17px;">
                <p>FAIL !! <br/> You have already submitted your valuable feedback. <br/>You can not submit data again. <a href="feedbackForm.jsp">Go home...</a></p>

            </div>
            <%
            }
            %>
        </div>
    </body>
</html>
