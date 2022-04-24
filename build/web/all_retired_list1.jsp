<%-- 
    Document   : all_retired_list
    Created on : 4 Dec, 2019, 2:29:40 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, common.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Retired List</title>
        <script src="javaScript/sorttable.js"></script>
        <style>

            #dataIn:hover{
                background-color:  #d7e4bf ;
            }
            .heading
            {
                font: normal normal 17px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 8px;
            }
            #url-table
            {
                width: 1050px;
                margin: auto;
                align:center;
                border: 1px  #cacaca  solid;
                min-height: 72vh;
                background-color: #ffffff;
            }

            #dataIn:hover{
                background-color:  #f9ddca ;
            }
            #title{
                font-family: Bookman Old;
                font-size: 21px;
            }
            #head
            {
                font: normal normal 15px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 8px;
                background-color: #e4e4e4;
            }
            table tr td
            {
                border: 1px  #cacaca  solid;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 2px;
            }
            #mytable{
                width: 85%;
            }
            #data{
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 5px;
            }
            #head1
            {
                font: normal normal 16px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 8px;
                background-color:  #d8d8d8 ;
                text-align: left;
            }
            #header
            {
                padding: 8px 3px 6px 8px;
                font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color:  #e1e1e1 ;
            }
        </style>
    </head>
    <%
        String Session = (String) session.getAttribute("Session");
        String username = (String) session.getAttribute("username");
        session.setAttribute("username", username);
        session.setAttribute("Session", Session);
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        System.out.println("session value is=" + Session);

        if (!Session.equals(null)) {
    %>
    <body bgcolor="#ccc">

        <%@include file="EIS_menu_header.jsp" %>
        <div id="url-table" align="center">
            <%
                String token = "";
                long a = 4534545345345445L;
                String rand = Long.toString((long) (Math.random() * a));

                String sql = "select bas.token as token, bas.name as name, bas.bas_designation as designation, bas.bas_descipline as discipline, bas.dat_ret as dor from eis_basicinfo bas ";

                Connection con = null;
                ResultSet rs = null;
                Statement st = null;

                try {
                    con = ConnectionManager.getConnectionDirectForMySQL();
                    st = con.createStatement();
                } catch (Exception sqlerr) {
                    sqlerr.printStackTrace();
                }

                SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                Date date = new Date();
                String current_time = dateFormat.format(date);

                DateFormat formatter;
                formatter = new SimpleDateFormat("dd/MM/yyyy");


                Calendar current_date_format = Calendar.getInstance();

                try {
                    current_date_format.setTime(dateFormat.parse(current_time));
                } catch (ParseException da) {
                    da.printStackTrace();
                }

                String ret_Date = "";
                Date date_temp = null;
            %>
            <h3 align="center" id="head1">Complete List of Retired Officer : </h3> 

            <table id="mytable" class="sortable">
                <thead id="headtr">
                <td id="header" style="width: 7%;">Sno <a href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                <td id="header" style="width: 27%;">Name <a href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                <td id="header" style="width: 25%;">Designation <a href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                <td id="header" style="width: 22%;">Discipline <a href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                <td id="header" style="width: 19%;">Dt. of Retirement <a href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                </thead>
                <%
                    int sno = 0;
                    rs = st.executeQuery(sql);
                    while (rs.next()) {
                        token = rs.getString("token");

                        ret_Date = rs.getString("dor");
                        date_temp = (Date) formatter.parse(ret_Date);

                        if (date_temp.before(current_date_format.getTime()) || date_temp.equals(current_date_format.getTime())) {
                            sno = sno + 1;
                %>

                <tr>
                    <td id="data"><%=sno%></td>
                    <td id="data"><a href="retired_employee_detail.jsp?0xZc-OzUv-Qxfy=<%=token%>&t=<%=rand%>"><%=rs.getString("name")%></a></td>
                    <td id="data"><%=rs.getString("designation")%></td>
                    <td id="data"><%=rs.getString("discipline")%></td>
                    <td id="data"><%=rs.getString("dor")%></td>
                </tr>

                <%
                        }


                    }
                %>
            </table>
        </div>
    </body>
    <%
    } else {
    %>
    <jsp:forward page="EIS_adError.jsp" />
    <%}%>
</html>
