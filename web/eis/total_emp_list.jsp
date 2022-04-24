<%-- 
    Document   : total_emp_list
    Created on : 5 Dec, 2019, 5:00:25 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="EIS_menu_header.jsp" %>
<%@page import="java.sql.*, common.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Employee</title>
        <style>
            #url-table
                {
                   width: 1050px;
                   margin: auto;
                   align:center;
                   border: 1px  #cacaca  solid;
                   background-color:  #ffffff ;
                   min-height: 72vh;
                }
            #heading
            {
                width: 99%;
                font: normal normal 15px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 8px;
                background-color:  #afafaf ;
            }
            table tr td
            {
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 3px;
                border: 1px  #cacaca  solid;
            }
            table, thead, tr,td { border-collapse: collapse;}
            #mytable{
                width: 90%;
            }
            #data{
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 5px;
            }
            #header
            {
                padding: 8px 3px 6px 8px;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color:  #e1e1e1 ;
            }
        </style>
        <script src="javaScript/sorttable.js"></script>
    </head>
    <body bgcolor="#ccc">
        <div id="url-table">
            <h3 id="heading" align="left">List of total employees :</h3>
        
            <table align="center" id="mytable" class="sortable">         
            <thead>
                <td id="header" style="width: 5%;">Sno <a href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                <td id="header" style="width: 27%;">Name <a href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                <td id="header" style="width: 27%;">Designation <a href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                <td id="header" style="width: 25%;">Discipline <a href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                <td id="header" style="width: 16%;">Dt. of Retirement <a href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
            </thead>
            <%
                Connection con=null;
                PreparedStatement psmt=null;
                ResultSet rs=null;
                Statement st=null;
                int result=0,sno=0;
                String sql="select * from eis_basicinfo;";
                
                try
                {
                    con=ConnectionManager.getConnectionDirectForMySQL();
                    st=con.createStatement();
                    
                }
                catch(Exception err)
                {
                    err.printStackTrace();
                }
                rs=st.executeQuery(sql);
                while(rs.next())
                {
                    sno=sno+1;
                    long a = 4534545345345445L;
                    String rand = Long.toString((long) (Math.random() * a));
            %>
            
            <tr>
                <td id="data"><%=sno%></td>
                <td id="data"><a href="retired_employee_detail.jsp?0xZc-OzUv-Qxfy=<%=rs.getString("token")%>&t=<%=rand%>"><%=rs.getString("name")%></a></td>
                <td id="data"><%=rs.getString("bas_designation")%></td>
                <td id="data"><%=rs.getString("bas_descipline")%></td>
                <td id="data"><%=rs.getString("dat_ret")%></td>
            </tr>
            
            <%
                }
            %>
        </table>
        </div>
                    
    </body>
</html>
