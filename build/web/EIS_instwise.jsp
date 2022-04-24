<%-- 
    Document   : EIS_instwise
    Created on : Mar 13, 2018, 10:45:09 AM
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/javaScript/singleText1.js"></script>
        <title>DATA</title>
        <style>
            #mainDiv
            {
                font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
                width: 100%;
                background-color:  #f5f2e8 ;
            }

            .main{
                font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            th{
                background:  #8a8a8a ;
                color: white;
                height: 25px;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            select{
                width: 80%;
                padding: 4px;
                border: 1px solid #ccc;
            }
            #msg{
                margin-top: 10px;
                border: 1px black solid;}

            #error{
                color: red;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            .mainD{
                border: 1px fuchsia dotted;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                width: 1050px;

            }
            #data{
                padding: 5px;
                border-collapse: collapse;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
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
            #tr-data:nth-child(odd)
            {
                background-color:  #f0f0f0 ;
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
            <div style="height: 5px;"></div>
            <form name="myform" id="myForm">
                <div id="mainDiv">
                    <table width="50%" class="main" align="center">
                        <tr>
                            <td class="item" align="left">
                                Select Institute :
                            </td>
                            <td>
                                <select id="inst" name="inst">
                                    <option value="">Select</option>
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
                            <td colspan="" align="right">
                                <input type="button" id="btn" onclick="return postComment();" value="Search"/>
                                <input type="button" onclick="myFunction()" value="Reset">
                                <br>   </td>
                        </tr>

                        <tr>
                            <td align="left" id="error" colspan=""></td>

                        </tr>

                    </table>
                </div>
            </form>
            <table class="mainD" id="msg"></table>
        </div>
        <br/>
    </body>
    <%
    } else {
    %>
    <jsp:forward page="EIS_error.jsp" />
    <%            }

    %>
</html>
