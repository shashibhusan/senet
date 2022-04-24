<%-- 
    Document   : submitIssue
    Created on : Jun 15, 2018, 7:11:44 PM
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
String email="";
String category="";
String sugg="";
try
        {

String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "mpr_dcmsme";
String userId = "root";
String password = "220047";

try{
email=request.getParameter("val");
category=request.getParameter("val1");
sugg=request.getParameter("val2");

}
catch(Exception eee){
    out.println("error is :"+eee);
    }
int iCount=0;


ArrayList<String> suggestion=new ArrayList<String>();
String[] dataGet=sugg.split(",");

for(String sug:dataGet)
    {
    System.out.println("Suggestion ::"+sug);
    suggestion.add(sug);
    }

Connection con=null;
ResultSet res=null;
Statement stmt=null;
int iFlag=0;
try
        {
    con=ConnectionManager.getConnectionDirectForMySQL();
    stmt=con.createStatement();
    String Query="select * from msme_issue_final where email='"+email+"'";
    res=stmt.executeQuery(Query);
    while(res.next()){
        iFlag=1;
                
        }
    con.close();
    }
catch(Exception ee){
    ee.printStackTrace();
    }


if(iFlag==0)
{

    try{
    Connection con1 = DriverManager.getConnection(connectionUrl+dbName, userId, password);
    Statement st=con1.createStatement();
    String sql="delete from msme_issue_data_new where email='"+email+"' and msme_related_issue='"+category+"'";
   int del=st.executeUpdate(sql);
   if(del>0)
       {
       System.out.println("Old data cleared for user email="+email+" and issue is ="+category);
       }
    }
    catch(Exception eror){
        eror.printStackTrace();
        System.out.println("Error is : "+eror.getMessage());
        }
    

Connection connection = null;
String connectionURL = "jdbc:mysql://localhost/mpr_dcmsme";
PreparedStatement psmnt = null;
int s=0;
//if(iCount==0)
//    {
try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "220047");
for(int j=0; j<suggestion.size(); j++)
    {
psmnt = connection.prepareStatement("insert into msme_issue_data_new( email, msme_related_issue, sugg) values(?, ?, ?)");
psmnt.setString(1, email);
psmnt.setString(2, category);
psmnt.setString(3, suggestion.get(j));

s = psmnt.executeUpdate();
}
if(s>0){
   
System.out.println("Issue Uploaded successfully !");
out.println("2");
}
else{
System.out.println("Error!");
}
}
catch(Exception e){
    e.printStackTrace();
    System.out.println("Error is ="+e);
}
}else
    {
    out.println("1");
    System.out.println("user has already done final submission");
}
}
catch(Exception mainError){
    mainError.printStackTrace();
    out.println("Error is :: "+mainError.getMessage());
    }
//}
%>
<%--else
    {
    try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "220047");
psmnt = connection.prepareStatement("update msme_issue_data set one=?, two=?, three=?, four=?, five=? where email=? and msme_related_issue=? ");
psmnt.setString(1, one);
psmnt.setString(2, two);
psmnt.setString(3, three);
psmnt.setString(4, four);
psmnt.setString(5, five);
psmnt.setString(6, email);
psmnt.setString(7, category);
int s = psmnt.executeUpdate();
if(s>0){
   
out.println("Issue Uploaded successfully !");
System.out.println("Issue Uploaded successfully !");
}
else{
out.println("Error!");
}
}
catch(Exception e){
    e.printStackTrace();
    System.out.println("Error is ="+e);
}

}
--%>

