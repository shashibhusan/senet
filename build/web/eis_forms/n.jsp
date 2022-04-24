<%-- 
    Document   : n
    Created on : 23 Mar, 2021, 10:38:41 AM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="common.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List</title>
        <script src="../javaScript/sorttable.js"></script>
        <style>
            table, th,tr,td
            {
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px #000 solid;
                border-collapse: collapse;
            }
            .data
            {
                padding: 5px;
            }
            .data1
            {
                padding: 5px;
                background-color: #D3D3D3;
            }
        </style>
    </head>
    <body>
       <%
           ResultSet rs=null;
           Connection con=null;
           try
           {
               con=ConnectionManager.getConnectionDirectForMySQL();
               Statement st=con.createStatement();
               String sql="select * from eis_register";
               rs=st.executeQuery(sql);
               
           }
           catch(Exception err)
           {
               err.printStackTrace();
           }
           
           
       %>
       <table id="mytable" class="sortable">
           <thead id="headtr">
               <td id="header" class="data1">Sno<a href="#"><img align="right" src="../eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
               <td id="header" class="data1">Email<a href="#"><img align="right" src="../eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
               <td id="header" class="data1">Name<a href="#"><img align="right" src="../eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
               <td id="header" class="data1">Designation<a href="#"><img align="right" src="../eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
               <td id="header" class="data1">Office<a href="#"><img align="right" src="../eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
               <td id="header" class="data1">DOB<a href="#"><img align="right" src="../eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
               <td id="header" class="data1">mobile<a href="#"><img align="right" src="../eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
           </thead>
           <%
           int i=0;
           while(rs.next())
           {
               i=i+1;
           
           %>
           <tr>
               <td class="data"><%=i%></td>
               <td class="data"><%=rs.getString("email")%></td>
               <td class="data"><%=rs.getString("name")%></td>
               <td class="data"><%=rs.getString("designation")%></td>
               <td class="data"><%=rs.getString("curnt_ofc")%></td>
               <td class="data"><%=rs.getString("dob")%></td>
               <td class="data"><%=rs.getString("mobile")%></td>
           </tr>
           <%}
           con.close();
           %>
       </table>
    </body>
</html>
