<%-- 
    Document   : preferenceReportMain
    Created on : 23 Feb, 2022, 10:49:34 AM
    Author     : msme
--%>


<%@page language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="com.updategovemail.RandomString"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            #mainDiv
            {
                width: 1250px;
                border: 1px #e2e2e2 solid;
                align:center;
                margin: auto;

            }            

            #dataIn:hover{
                background-color:  #d7e4bf ;
            }

            #head
            {

                background:  #dadada ;
                padding: 8px;
                font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            .sno
            {
                padding: 0px;
            }
            .head
            {

                background:  #dadada ;
                padding: 8px;
                font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            .head1
            {

                background:  #dadada ;
                padding: 8px;
                font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                width: 100%;
                height: 25px; 
                text-align: center; 
                width: 93.3%; 
                border: 1px #000000 solid; 
                border-bottom: none;
            }
            #color:hover
            {
                background:  #e9e8e8;
            }
            #data{
                padding: 4px 0px 4px 2px;;
                border: 1px  #cacaca  solid;
                border-collapse: collapse;
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                
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
            table, tr,th, td {border-collapse: collapse;
                              border: 1px #000000 solid;}
            #mytable
            {
                width: 95%;
                border: 1px #000000 solid;
            }
             @media print
            {
                table.th,tr,td{border: 1px #000000 solid}
                table.th,tr,td{border-collapse: collapse}
             .mainDivR{
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px black solid;
                }
                
                .head1
                {

                    background:  #dadada ;
                    padding: 8px;
                    font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                    width: 98%;
                    height: 25px; 
                    text-align: center; 
                    border: 1px #000000 solid; 
                    border-bottom: none;
                }

              .content{
                  border: 1px black solid;}
                body {
                    line-height: 1.1;
                }
                .hide
                {
                    display: none !important;
                }
                .pr{width: 990px;
                    page-break-inside:auto }
                .tr-data{ page-break-inside:avoid;}
                #url-table
                {
                    width: 99%;
                    border: 1px;
                }
                a{
                    text-decoration: none;   
                   color: #000000;
                }
                a[href]:after {
                content: none !important;
                    }
                   #mytable
                   {
                       width: 100%;
                   }
            }
            @page{
                margin:0px;
            }
        </style>
        <script src="javaScript/sorttable.js"></script>
    </head>
    <%
        String Session = (String) session.getAttribute("Session");

        if (!Session.equals(null)) {
    %>

    <body bgcolor="#ccc">

        <%@include file="EIS_menu_header.jsp" %>
        <div id="url-table" align="center">
            <br/> 
            <div class="head1">

                Posting Preference Report (2021-2022)
            </div>
            <table id="mytable" align="center" class="sortable">

                <thead id="head">
                <td class="sno" Style="width:30px;">Sn<a href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="8" width="8"/></a></td>
                <td id="head" Style="width:150px;">Name <a href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                <td id="head" Style="width:160px;">Designation <a href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                <td id="head">Current Office <a href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                <td id="head">1st Preference <a href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                <td id="head">2nd Preference <a href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                <td id="head">3rd Preference <a href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                </thead>
                <%
                    int i = 0;
                    Connection con = null;
                    ResultSet rs = null;
                    Statement st = null;
                    RandomString randomString = new RandomString();
                    try {
                        con = ConnectionManager.getConnectionDirectForMySQL();
                        st = con.createStatement();
                        String Query = "select * from eis_postinginfo a right join eis_basicinfo b on a.email=b.email where a.time_of_update_preferences!='' and b.name!='Raghaven' order by a.curr_despln asc";
                        rs = st.executeQuery(Query);
                        while (rs.next()) {
                            i = i + 1;
                %>
                <tr id="color" style="height: 25px;">
                    <td id="data" align="center"><%=i%>.</td>
                    <td id="data"><a href="searchFinal.jsp?nMhds495ds6fhXxQjd=<%=rs.getString("b.token")%>&sec$key=/topics/<%=randomString.getAlphaNumericString(100)%>?hl=hi&gl=IN&ceid=IN%3Ahi"><%=rs.getString("name")%></a></td>
                    <td id="data"><%=rs.getString("curr_despln")%></td>
                    <td id="data"><%=rs.getString("state")%></td>
                    <td id="data"><%=rs.getString("pst_pref_1")%></td>
                    <td id="data"><%=rs.getString("pst_pref_2")%></td>
                    <td id="data"><%=rs.getString("pst_pref_3")%></td>
                </tr>
                <%
                        }
                        con.close();
                        rs.close();
                    } catch (Exception err) {
                        err.printStackTrace();
                    }
                %>
            </table>
            <br/>
            <div style="width:100px; margin: auto;">
<input type="button" value="print" onclick="window.print()"/>
            
</div>
            <br/>
        </div>

    </body>
    <%
    } else {
    %>
    <jsp:forward page="EIS_adError.jsp" />
    <%               }
    %>
</html>
