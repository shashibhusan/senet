<%-- 
    Document   : aa1_submit
    Created on : Mar 14, 2018, 3:38:01 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>test</title>
        <%
String email=request.getParameter("email");
String ofcname=request.getParameter("ofcname");
String mode=request.getParameter("mode");
String from=request.getParameter("from");
String to=request.getParameter("to");
int i=0;
System.out.println("/"+email+"/"+ofcname+"/"+mode+"/"+from+"/"+to);
Connection con=null;
ResultSet rs=null;
Statement st=null;
int flag=0;


try{
 Connection con3 = ConnectionManager.getConnectionDirectForMySQL();
Statement st3=con3.createStatement();
String sql ="insert into dbtest values('"+i+"','"+email+"','"+ofcname+"','"+mode+"','"+from+"','"+to+"')";
System.out.println("jQuery is :"+sql);
int rs4 = st3.executeUpdate(sql);
if(rs4>0) {
flag=1;

}else
    {
flag=0;
}
con3.close();
}
catch (Exception e) {
e.printStackTrace();
}

        %>
    </head>
    <body>
        <table>
            <tr>
                <%
                if(flag==1){
                %>
                <td><h3>Record Inserted successfully.</h3></td>

               <%
               }else
                   {
               %>
                <td><h3>Data Record failed.</h3></td>
               <%}%>
            </tr>
        </table>
    </body>
</html>
