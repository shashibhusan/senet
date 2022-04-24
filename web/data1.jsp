<%-- 
    Document   : data1
    Created on : Feb 10, 2018, 11:29:48 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
String name=request.getParameter("comment");
String name1=request.getParameter("val");

System.out.println("email recieved");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "mpr_dcmsme";
String userId = "root";
String password = "220047";

  try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
 try{
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();

String sql = "select * from eis_register where curnt_ofc ='"+name+"' and designation='"+name1+"'";
System.out.println("++++++++++"+sql);
resultSet = statement.executeQuery(sql);

if(resultSet.next()){
       String buffer="<tr><td id='data'>";
buffer=buffer+"<a href='http://www.cricbuzz.com/'>"+resultSet.getString("email")+"</a></td>";
buffer=buffer+"<td id='data'>"+resultSet.getString("name")+"</td></tr>";

response.getWriter().println(buffer);
 }
else{
    out.println("No result found for "+name);
    }

}
 catch(Exception e)
         {
     e.printStackTrace();
}


%>
