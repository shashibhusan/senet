<%-- 
    Document   : p
    Created on : 22 Mar, 2021, 3:19:12 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="common.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>check pass</title>
        <style>
            table
            {
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px #000  double;
            }
            .data
            {
                padding: 5px;
            }
            .data1
            {
                padding: 5px;
            }
        </style>
    </head>
    <body>
    <%
        String email=request.getParameter("email");
        
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;
        
        int iFlag=0;
        try{
            con=ConnectionManager.getConnectionDirectForMySQL();
            st=con.createStatement();
            String sql="select * from eis_register where email='"+email+"'";
            rs=st.executeQuery(sql);
            if(rs.next())
            {
               iFlag=1;
            }
        }
            catch(Exception err)
            {
                err.printStackTrace();
            }
        String sql="";
        if(iFlag==1)
        {
        sql="select name as name,designation as designation, email as email, mobile as mobile, dob as dob, password as password from eis_register where email='"+email+"'";
        }else
        {
           sql="select name as name,designation as designation, gov_email as email, mobile as mobile, dob as dob, en_password as password from eis_updated_user_gov_mail where gov_email='"+email+"'"; 
        }
        rs=st.executeQuery(sql);
        while(rs.next())
        {
    %>
 <%--   <table>
        <tr>
            <td class="data1" style="">  Name</td>
            <td class="data1">Email</td>
            <td class="data1">Mobile</td>
            <td class="data1">dob</td>
            <td class="data1">Password</td>
        </tr>
        <tr>
            <td class="data" style=""><%=rs.getString("name")%></td>
            <td class="data"><%=rs.getString("email")%></td>
            <td class="data"><%=rs.getString("mobile")%></td>
            <td class="data"><%=rs.getString("dob")%></td>
            <td class="data"><%=rs.getString("password")%></td>
        </tr>
    </table>
        
        --%>
        <table>
            <tr>
                <td class="data1">Name </td>
                <td>:</td>
                <td class="data"><%=rs.getString("name")%></td>
            </tr>
            <tr>
                <td class="data1">Email </td>
                <td>:</td>
                <td class="data"><%=rs.getString("email")%></td>
            </tr>
            <tr>
                <td class="data1">Designation </td>
                <td>:</td>
                <td class="data"><%=rs.getString("designation")%></td>
            </tr>
            <tr>
                <td class="data1">Mobile </td>
                <td>:</td>
                <td class="data"><%=rs.getString("mobile")%></td>
            </tr>
            <tr>
                <td class="data1">Date of birth </td>
                <td>:</td>
                <td class="data"><%=rs.getString("dob")%></td>
            </tr>
            <tr>
                <td class="data1">Password </td>
                <td>:</td>
                <td class="data"><%=rs.getString("password")%></td>
            </tr>
        </table>
    <%
        }
        if(con!=null)
        {
            con.close();
        }
        if(rs!=null)
        {
            rs.close();
        }
        if(st!=null)
        {
            st.close();
        }
    %>
    </body>
</html>
