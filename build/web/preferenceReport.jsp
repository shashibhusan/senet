<%-- 
    Document   : preferenceReport
    Created on : 2 Feb, 2022, 1:27:49 PM
    Author     : msme
--%>


<%@page language="java" import="java.sql.*,common.*" errorPage="" %>

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
            .head
            {
                padding: 4px 0px 6px 4px;
                font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
                text-align: left;
                margin: 0px;
                color: blue;
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
                border: 1px  #cacaca  solid;
                min-height: 72vh;
                background-color: #ffffff;
            }
            table, tr,th, td {border-collapse: collapse;
                              border: 1px #c8a412 solid;
            }

            #myTable
            {
                width: 95%;
            }

            #search-section
            {
                width: 98.6%;
                padding: 10px;
                background-color:#f1e9d9;
                font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color: #996000;
            }
            #search-table
            {
                width:75%;
                margin: auto;
                height: 25px;
                padding: 5px;
            }
            #searchDiv
            {
                width: 50%;
                margin: auto;
                background-color:#FEFCF8;
                height:160px; 
                border: 1px #c8a412 solid;
            }

            select{

                padding: 3px 5px 3px 5px;
                color: #996000;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            input[type=submit]{
                width: 100px;
                color:   #ffffff ;
                background-color:#c8a412 ;
                border: 1px #806701 solid;
                margin: 0px;
                cursor: pointer;
                padding: 3px 10px 3px 10px;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            input[type=submit]:hover{background-color: #997b00 ;}
            #headdiv
            {
                width: 40%;
                padding: 2px 2px;
                text-align: left;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color: #996000;
                font-weight: normal;
            }
            #dataDiv
            {

                text-align: center;
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color: #996000;
            }

            #error{
                width: 50%;
                margin: auto;
                align: center;
                color:  #9f1300 ;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 6px;
            }
        </style>
    </head>

    <body bgcolor="#ccc">
        <%
            String Session = (String) session.getAttribute("Session");
            session.setAttribute("Session", Session);


            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);


            System.out.println("session value is=" + Session);
            System.out.println("session we get1 ::" + Session);


            if (!Session.equals(null)) {
        %>
        <%@include file="EIS_menu_header.jsp" %>
        <div id="url-table" align="center">
            <div  id="searchDiv">
                <br/>
                <%
                    Connection con = null;
                    ResultSet rs = null;
                    Statement stmt = null;
                    try {
                        con = ConnectionManager.getConnectionDirectForMySQL();
                        stmt = con.createStatement();
                        System.out.println("Connection created-" + con);
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                %>
                <div class="head">
                    Select any of the following choices-</td>
                </div>
                <form name="myForm" id="myForm" action="pref_report_main.jsp" method="POST">           
                    <table id="search-table">

                        <tr>
                            <td id="headdiv">first choice</td>
                            <td id="dataDiv" colspan="0">
                                :&nbsp;&nbsp;<select id="search-data" id="first" name="first">
                                    <option value="">Select</option>
                                    <%
                                        System.out.println("select first choice");
                                        String sql = "select * from eis_branch_list";
                                        rs = stmt.executeQuery(sql);
                                        while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString("Inst_Name")%>"><%=rs.getString("Inst_Name")%></option>
                                    <%
                                        }
                                    %>

                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td id="headdiv">second choice</td>
                            <td id="dataDiv" colspan="0">
                                :&nbsp;&nbsp;<select id="search-data" id="second" name="second">
                                    <option value="">Select</option>
                                    <%
                                        sql = "select * from eis_branch_list";
                                        rs = stmt.executeQuery(sql);
                                        while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString("Inst_Name")%>"><%=rs.getString("Inst_Name")%></option>
                                    <%
                                        }
                                    %>

                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td id="headdiv">third choice</td>
                            <td id="dataDiv" colspan="0">
                                :&nbsp;&nbsp;<select id="search-data" id="third" name="third">
                                    <option value="">Select</option>
                                    <%
                                        sql = "select * from eis_branch_list";
                                        rs = stmt.executeQuery(sql);
                                        while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString("Inst_Name")%>"><%=rs.getString("Inst_Name")%></option>
                                    <%
                                        }
                                    %>

                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right">
                                <input type="submit" name="search-button" value="search" onclick="return validate();"/>
                            </td>
                        </tr>
                    </table>
                </form>

            </div>

            <div id="error"></div>
            <br/><br/><br/>
        </div>
        <script src="JavaScript/pref_report.js"></script>

        <%

            con.close();
            rs.close();
            stmt.close();
        } else {
        %>
        <jsp:forward page="EIS_adError.jsp" />
        <%               }
        %>
    </body>
</html>
