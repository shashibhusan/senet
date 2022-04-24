<%-- 
    Document   : EIS_report_BySelecting_Inst
    Created on : Mar 15, 2018, 2:43:52 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="code.jquery.com/jquery-2.1.0.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/javaScript/jsValue1.js"></script>
        <title>DATA</title>
        <style>
            .main{
                font-family: Bookman Old Style;
                font-size: 14px;
                height: 150px;
                padding-left: 20px;
                background: #F0F8FF;
                border-radius: 5px;
            }
            .mainD{
                border: 1px fuchsia dotted;
                color: black;
                font-family: Bookman Old;
                background: #F0F8FF;
                width: 1000px;

            }
            th{
                background: #1880e9;
                color: white;
                height: 25px;
                font-family: Bookman Old Style;
                font-weight: normal;
            }
            .loop{
                font-family: Bookman Old Style;
                font-size: 15px;
                border: 1px black solid;
                padding: 3px 3px ;
                text-align: center;

            }
            .loop1{
                font-family: Bookman Old Style;
                font-size: 13px;
                border: 1px black solid;
                padding: 3px 3px ;
                text-align: left;

            }
            table, th, tr,td { border-collapse: collapse;}
            .head{
                font-family: Bookman Old Style;
                height: 25px;
                background:  #4b5eb6 ;
                color: white;
                font-size: 14px;
                border: 1px white solid;

            }
            select{
                width: 80%;
                padding: 5px 5px;
                padding-left: 20px;
                border: 1px solid #ccc;
                border-radius: 3px;
                margin-top: 10px;
                margin-left: 50px;

            }
            #msg{
                margin-top: 25px;
                border: 1px black solid;}
            .item{
                padding: 5px 5px 5px 5px;


            }
            #error{
                font-family: Bookman Old;
                color: red;
                font-size: 15px;

            }
            .mainD{
                border: 1px fuchsia dotted;
                color: black;
                font-family: Bookman Old Style;
                font-size: 15px;
                background: #F0F8FF;
                width: 1250px;

            }
            #data{
                font-family: Bookman Old;
                padding: 5px 5px 5px 5px;
                border-collapse: collapse;
                padding-left: 15px;
            }

            li a:hover {
                cursor: url;
                text-decoration: underline;
            }

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
        </style>
    </head>
    <%

        String Session = (String) session.getAttribute("Session");


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

            <form name="myform" id="myForm"/>
            <table width="450px" bgcolor="" class="main" align="center">
                <tr>
                    <td class="item" align="left" style="margin-left: 50px;">
                        Select Institute :
                        <select id="inst" name="inst" onchange="return getValue();">
                            <option value="">Select</option>
                            <option value="All">All</option>
                            <%

                                Connection con = null;
                                ResultSet res = null;
                                Statement stm = null;

                                try {
                                    con = ConnectionManager.getConnectionDirectForMySQL();
                                    stm = con.createStatement();
                                    String sql = "select * from eis_branch_list";
                                    res = stm.executeQuery(sql);
                                    while (res.next()) {
                            %>
                            <option value="<%=res.getString("Inst_Name")%>"><%=res.getString("Inst_Name")%></option>

                            <%
                                    }
                                    con.close();
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                            %>
                        </select>
                    </td>

                </tr>


                <tr>
                    <td align="left" id="error" colspan=""></td>

                </tr>

            </table>
            <table class="1mainD" id="msg1" align="center" width="1000px;"></table>
            <table class="1mainD" id="msg" align="center" width="1000px;"></table>
            <br/>
            <br/>
        </div>
    </body>
    <%
    } else {
    %>
    <jsp:forward page="EIS_error.jsp" />
    <%            }

    %>
</html>
