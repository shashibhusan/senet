<%-- 
    Document   : aa_submitdata
    Created on : Mar 13, 2018, 5:48:51 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="common.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>final</title>
    </head>
    <body>
        <%
String email=request.getParameter("email");
String ofcname=request.getParameter("ofcname");
String mode=request.getParameter("mode");
String from=request.getParameter("from");
String to=request.getParameter("to");
int i=1;
System.out.println("/"+email+"/"+ofcname+"/"+mode+"/"+from+"/"+to);
//String data="";
//data="<tr><td>"+email+"</td><td>"+ofcname+"</td><td>"+mode+"</td><td>"+from+"</td><td>"+to+"</td></tr>";
//response.getWriter().println(data);



Connection con=null;
ResultSet rs=null;
Statement st=null;
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "mpr_dcmsme";
String userId = "root";
String password = "220047";
try
        {
    con= DriverManager.getConnection(connectionUrl+dbName, userId, password);
    st=con.createStatement();
    String sql="insert into dbtest values('"+i+"','"+email+"','"+ofcname+"','"+mode+"','"+from+"','"+to+"')";
    int res=st.executeUpdate(sql);
    if(res>0){
        System.out.println("data inserted successfully=="+sql);
    }else
        {
    System.out.println("Error in inserting record");
    }
    }
catch(Exception ex){
ex.printStackTrace();
}

%>
<h1>page is working.</h1>
    </body>
</html>

