<%--
    Document   : EIS_login_check
    Created on : Dec 30, 2017, 4:40:18 PM
    Author     : Admin
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.UUID" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
 <%
 String username=request.getParameter("user");
 String pass=request.getParameter("password");

 String captcha = (String)session.getAttribute("key");
	request.setCharacterEncoding("UTF-8");
	String answer = request.getParameter("answer");
        if (captcha.equals(answer)) {

 String key = UUID.randomUUID().toString();

 String nmm=key+"0x6a09e667f3bcc908";
 session.setAttribute("nmm",nmm);
 session.setAttribute("username",username);
 session.setAttribute("email",username);
System.out.println("token generated=="+nmm);
int flag=0;
               Connection con1=null;
               ResultSet rs1=null;
               try{
               con1 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt1 = con1.createStatement();
    String sql1="SELECT * FROM eis_register where email='"+username+"' ;";
    rs1=stmt1.executeQuery(sql1);
    while(rs1.next())
        {
        if( username.equals(rs1.getString("email")) && pass.equals(rs1.getString("password")) )
            {
flag=1;
  %>

        <%                     }
        }
    con1.close();
  }
catch(Exception e){
    e.printStackTrace();
    }
if(flag==1)
    {
%>
<jsp:forward page="EGS_main.jsp" />
<%}
else
    {
%>
<jsp:forward page="EGS_error.jsp?val=<%=nmm%>" />

 <%}}
               else
        {
 %>
 <jsp:forward page="gr_login.jsp" />
 <%
}
%>   </body>
</html>
