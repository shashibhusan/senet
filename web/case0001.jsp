<%--
    Document   : case0001
    Created on : Feb 15, 2018, 9:09:22 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, common.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
String disci=request.getParameter("val");

System.out.println("email recieved ::"+disci);
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date = new Date();
            String current_time=dateFormat.format(date);
            
            DateFormat formatter;
            formatter = new SimpleDateFormat("dd/MM/yyyy");
            
            
            Calendar current_date_format = Calendar.getInstance();
            
                    try{
                        current_date_format.setTime(dateFormat.parse(current_time));
                        }catch(ParseException da)
                        {
                        da.printStackTrace();
                        }
            
            String ret_Date="";
            Date date_temp=null;

String buffer="";
int flag=0;
String instId="";
try{
connection = ConnectionManager.getConnectionDirectForMySQL();
statement=connection.createStatement();
String sql = "select * from eis_branch_list where Inst_Name='"+disci+"'";
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
String sql = "select * from eis_basicinfo a join eis_postinginfo b on a.email=b.email where b.state='"+disci+"'";
resultSet=statement.executeQuery(sql);
if(resultSet.next()){ flag=1;}else{flag=0;}
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
String sql = "select * from eis_basicinfo a join eis_postinginfo b on a.email=b.email where b.state='"+disci+"'";
System.out.println("++++++++++"+sql);
resultSet = statement.executeQuery(sql);
String buffer1="<tr id='data_head'><td align='center' >S.No.</td><td align='center'>Name</td>" +
        "<td align='center'>Email</td><td align='center'>Designation</td><td align='center'>Discipline</td><td align='center'>Current Office</td><td align='center'>Retired</td>" +
        "</tr>";
response.getWriter().println(buffer1);
while(resultSet.next()){
iCount=iCount+1;
ret_Date=resultSet.getString("dat_ret");
date_temp = (Date) formatter.parse(ret_Date);

if(date_temp.before(current_date_format.getTime()) || date_temp.equals(current_date_format.getTime()))
                {
buffer="<tr id='trdata'><td id='data-ret' align='center'>"+iCount+"</td><td id='data-ret'>";
buffer=buffer+"<a href='searchFinal.jsp?nMhds495ds6fhXxQjd="+resultSet.getString("a.token")+"'>"+resultSet.getString("a.name").toUpperCase()+"</a></td>" +
        "<td id='data-ret'>"+resultSet.getString("a.email")+"</td>";
buffer=buffer+"<td id='data-ret'>"+resultSet.getString("b.curr_despln")+"</td>";
buffer=buffer+"<td id='data-ret'>"+resultSet.getString("a.bas_descipline")+"</td>";
buffer=buffer+"<td id='data-ret'>"+disci+"</td>";
buffer=buffer+"<td id='data-ret'>Yes</td>";
buffer=buffer+"</tr>";
                }else
{
    buffer="<tr id='trdata'><td id='data' align='center'>"+iCount+"</td><td id='data'>";
buffer=buffer+"<a href='searchFinal.jsp?nMhds495ds6fhXxQjd="+resultSet.getString("a.token")+"'>"+resultSet.getString("a.name").toUpperCase()+"</a></td>" +
        "<td id='data'>"+resultSet.getString("a.email")+"</td>";
buffer=buffer+"<td id='data'>"+resultSet.getString("b.curr_despln")+"</td>";
buffer=buffer+"<td id='data'>"+resultSet.getString("a.bas_descipline")+"</td>";
buffer=buffer+"<td id='data'>"+disci+"</td>";
buffer=buffer+"<td id='data'>No</td>";
buffer=buffer+"</tr>";
}

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