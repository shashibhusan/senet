<%--
    Document   : case1110
    Created on : Feb 16, 2018, 9:09:22 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="common.ConnectionManager" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
String name=request.getParameter("val");
String desig=request.getParameter("val1");
String disci=request.getParameter("val2");

System.out.println("search parameter //" +name+"//"+desig+"//"+disci );
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String buffer="";
int flag=0;


try{
connection = ConnectionManager.getConnectionDirectForMySQL();
statement=connection.createStatement();
String sql = "select * from eis_basicinfo a join eis_postinginfo b on a.email=b.email where a.name LIKE '%"+name+"%' and b.curr_despln='"+desig+"' and a.bas_descipline='"+disci+"'";

resultSet=statement.executeQuery(sql);
if(resultSet.next()){ flag=1;}else{flag=0;}
System.out.println("The value of flag ::"+flag);
connection.close();
}
catch(Exception e){
e.printStackTrace();
}

if(flag==1)
{
 try{
connection = ConnectionManager.getConnectionDirectForMySQL();
statement=connection.createStatement();
int iCount=0;
String sql = "select * from eis_basicinfo a join eis_postinginfo b on a.email=b.email where a.name LIKE '%"+name+"%' and b.curr_despln='"+desig+"' and a.bas_descipline='"+disci+"'";
System.out.println("++++++++++"+sql);
resultSet = statement.executeQuery(sql);
String buffer1="<tr id='data_head'><td align='center' >S.No.</td><td align='center'>Name</td>" +
        "<td align='center'>Email</td><td align='center'>Designation</td><td align='center'>Discipline</td><td align='center'>Current Office</td>" +
        "</tr>";
response.getWriter().println(buffer1);
while(resultSet.next()){
iCount=iCount+1;
buffer="<tr id='trdata'><td id='data' align='center'>"+iCount+"</td><td id='data'>";
buffer=buffer+"<a href='searchFinal.jsp?nMhds495ds6fhXxQjd="+resultSet.getString("a.token")+"'>"+resultSet.getString("a.name").toUpperCase()+"</a></td>" +
        "<td id='data'>"+resultSet.getString("a.email")+"</td>";
buffer=buffer+"<td id='data'>"+resultSet.getString("b.curr_despln")+"</td>";
buffer=buffer+"<td id='data'>"+resultSet.getString("a.bas_descipline")+"</td>";
buffer=buffer+"<td id='data'>"+resultSet.getString("b.state")+"</td>";
buffer=buffer+"</tr>";

response.getWriter().println(buffer);
 }
connection.close();
}
 catch(Exception e)
         {
     e.printStackTrace();
}
}
else
    {
   buffer="<td>No Result found.</td>";
   response.getWriter().println(buffer);
    }

%>