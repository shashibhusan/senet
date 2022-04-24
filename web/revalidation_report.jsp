<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<head>
    <style>
        .table_border_both{
border:solid #A9D0F5 1px;
padding-top:3px;
padding-bottom:3px;
padding-left:3px;
font-family:Arial, Helvetica, sans-serif;
font-size:12px;

    </style>

        <%
       String Year="2016-2017";
     %>


</head>

<h2 style=" background: #48c9b0"><center> Re-validation Amount For <%=Year%><br/>
           </center></h2>
            <html>
<body>

    <table align="center" width="60%" border="1"  cellspacing="0" cellpadding="0" style="border-collapse: collapse">
        <tr align="center" bgcolor=" #d1f2eb ">
            <th width="55%"><strong>Name of DIs</strong></th>

             <th width="45%"><strong>Amount</strong></th>

             </tr>
<%


try{
Connection conn = ConnectionManager.getConnectionDirectForMySQL();
Statement stmt = conn.createStatement();
String userSql="SELECT  allmsme.name, revalidationamount.amount FROM revalidationamount, allmsme where allmsme.Inst_Id=revalidationamount.inst  and   year='"+Year+"'";
ResultSet resultSet = stmt.executeQuery(userSql);
while(resultSet.next()){
%>
<tr class="table_border_both">
    <td><%=resultSet.getString("allmsme.name")%></td>
    <td><%=resultSet.getString("revalidationamount.amount")%></td>

<%
}}
catch(SQLException e){
			//e.printStackTrace();
			System.out.println(e.getErrorCode()+" = "+e.getMessage());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println(e.getMessage());
		}

%>
</tr>
</table>
</body>
</html>

