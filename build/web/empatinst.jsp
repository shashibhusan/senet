<%-- 
    Document   : empatinst
    Created on : Mar 13, 2018, 11:45:06 AM
    Author     : Senet
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
String inst=request.getParameter("val");
System.out.println("instName recieved ::"+inst);
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String buffer="";
int flag=0;
int flag1=0;
String instId="";
int iCount=0;

try{
connection = ConnectionManager.getConnectionDirectForMySQL();
statement=connection.createStatement();
String sql = "select * from eis_branch_list where Inst_Name='"+inst+"'";
resultSet=statement.executeQuery(sql);
while(resultSet.next()){
    instId=resultSet.getString("Inst_id");
    System.out.println("Institute id ::"+instId);
    }
connection.close();
    }
catch(Exception ex){
ex.printStackTrace();
}


try{
connection = ConnectionManager.getConnectionDirectForMySQL();
statement=connection.createStatement();
String sql = "select * from eis_basicinfo where inst_id='"+instId+"'";
resultSet=statement.executeQuery(sql);
if(resultSet.next()){ flag1=1;}else{flag1=0;}
connection.close();
}
catch(Exception e){
e.printStackTrace();
}

try{
connection = ConnectionManager.getConnectionDirectForMySQL();
statement=connection.createStatement();
String sql = "select * from eis_posthistory where officeName='"+inst+"'";
resultSet=statement.executeQuery(sql);
if(resultSet.next()){ flag=1;}else{flag=0;}
connection.close();
}
catch(Exception e){
e.printStackTrace();
}


if(flag==1 || flag1==1)
{
 try{
connection = ConnectionManager.getConnectionDirectForMySQL();
statement=connection.createStatement();

String sql = "select * from eis_basicinfo join eis_postinginfo on eis_basicinfo.email=eis_postinginfo.email and inst_id='"+instId+"'";
System.out.println("++++++++++"+sql);
resultSet = statement.executeQuery(sql);

String buffer1="<tr><th>S.No.</th><th>Name</th><th>Email</th><th>Designation</th><th>Discipline</th><th>Current Office</th><th>From</th><th>To</th></tr>";
response.getWriter().println(buffer1);
while(resultSet.next()){
iCount=iCount+1;
buffer="<tr id='tr-data'><td id='data' align='center'>"+iCount+"</td>";
buffer=buffer+"<td id='data'>"+resultSet.getString("name").toUpperCase()+"</a></td>" +
        "<td id='data'>"+resultSet.getString("email")+"</td>";
buffer=buffer+"<td id='data'>"+resultSet.getString("bas_designation")+"</td>";
buffer=buffer+"<td id='data'>"+resultSet.getString("bas_descipline")+"</td>";
buffer=buffer+"<td id='data'>"+inst+"</td>";
buffer=buffer+"<td id='data'>"+resultSet.getString("curr_doj")+"</td>";
buffer=buffer+"<td id='data'>Till Date</td>";
buffer=buffer+"</tr>";

response.getWriter().println(buffer);
 }
connection.close();
}
 catch(Exception e)
         {
     e.printStackTrace();
}

 try{

connection = ConnectionManager.getConnectionDirectForMySQL();
statement=connection.createStatement();
String sql = "select * from eis_posthistory join eis_basicinfo on eis_posthistory.email=eis_basicinfo.email inner join eis_postinginfo on eis_basicinfo.email=eis_postinginfo.email and officename='"+inst+"'";
resultSet =  statement.executeQuery(sql);
while(resultSet.next()){

iCount=iCount+1;
buffer="<tr id='tr-data'><td id='data' align='center'>"+iCount+"</td>";
buffer=buffer+"<td id='data'>"+resultSet.getString("name").toUpperCase()+"</a></td>" +
        "<td id='data'>"+resultSet.getString("email")+"</td>";
buffer=buffer+"<td id='data'>"+resultSet.getString("bas_designation")+"</td>";
buffer=buffer+"<td id='data'>"+resultSet.getString("bas_descipline")+"</td>";
buffer=buffer+"<td id='data'>"+resultSet.getString("state")+"</td>";
buffer=buffer+"<td id='data'>"+resultSet.getString("phfrom")+"</td>";
buffer=buffer+"<td id='data'>"+resultSet.getString("phto")+"</td>";
buffer=buffer+"</tr>";

response.getWriter().println(buffer);
 }
connection.close();
     }
 catch(Exception e){
  e.printStackTrace();   }

}
else
    {
   buffer="<td>No Result found.</td>";
   response.getWriter().println(buffer);
    }

%>