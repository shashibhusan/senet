<%-- 
    Document   : index
    Created on : Feb 10, 2018, 8:41:20 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, common.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="fevicon.png" type="image/x-icon">
        <title>Search on EIS</title>
        <style>
            #trdata:nth-child(even)
            {
                background: #FFF;
            }
            #trdata:nth-child(odd) {
                background: #e5e5e5;
            }

            table tr td th{
                border-collapse: collapse;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            #msg{

            }
            #data-ret{
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 4px 0px 4px 2px;
                color: white;
                border-collapse: collapse;
                background-color: #e5a1a1 ;
            }
            #data{
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 4px 0px 4px 2px;
                border-collapse: collapse;
            }
            .mainD{
                color: black;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                width: 1000px;
            }
            .mainDT{
                color: black;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                width: 1000px;
                margin-top: 25px;
                border: 1px black solid;
            }
            #mainDiv
            {
                border: 1px  #e5e5e5 solid;
                width: 1300px;
            }
            #main{
                border: 1px fuchsia dotted;
                width: 420px;
                background: #F0F8FF;
            }

            #error{
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color: red;
                font-size: 15px;

            }

            #data_head{
                background:  #bfbebe ;
                color:  #000000 ;
                height: 30px;
            }
            a:link {
                text-decoration: none;

            }

            a:visited {
                text-decoration: none;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color: blue;
            }

            td a:hover {
                text-decoration: underline;

            }

            a:active {
                text-decoration: underline;

            }

            h2{
                font: normal normal 22px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }


            #url-table
            {
                width: 1050px;
                margin: auto;
                align:center;
                border: 1px #7d9df3 solid;
                min-height: 72vh;
                background-color: #ffffff;
            }

            @media print
            {
                body {

                    line-height: 1.1;


                }
                .hide
                {
                    display: none !important;
                }
            }

            input[type=text]{
                width: 80%;
                padding: 4px 5px;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            select {
                width: 85%;
                padding: 4px 5px;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            #btn, input[type=buttom]
            {
                width: 100px;
                background-color: #4CAF50;
                color: white;
                padding: 4px 5px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
            }
            #btn:hover{
                background-color:  #326132 ;
                color: white;
            }
            #tbl-btn
            {
                margin-right: -25px;
            }
            #tr-main{
                width: 45%;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            #head
            {
                width: 98.4%;
                background:  #cdcdcd ;
                font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 8px;
                margin-bottom: 10px;
                text-align: left;
            }
            .serch-div
            {
                width: 650px;
                margin: auto;
                border: 1px slateblue solid;
                background-color: #F1E6CE ; 
            }
        </style>

    </head>
    <script type="text/javascript" src="code.jquery.com/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/javaScript/singleText.js"></script>
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
        <div id="url-table" align="center" class="hide">
            <div id="head">
                Search on EIS : <font style="color: red">(Please select any of options available below)</font>
            </div>
            <form name="myform" id="myForm" action="" autocomplete="off" method="POST">
                <div class="serch-div">


                    <table style="width: 100%;" align="center" >
                        <tr class="tr-name">
                            <td id="tr-main">Name : </td>
                            <td id="tr-main">Designation : </td>
                        </tr>
                        <tr class="tr-name" id="tr-main">
                            <td align="center">
                                <input type="text" size="20" name="data" placeholder="Enter name..."/>                                   
                            </td>
                            <td align="center">
                                <select id="data1" name="data1">
                                    <option value="">Select</option>
                                    <option value="AIA">AIA</option>
                                    <option value="Director">Director</option>
                                    <option value="Joint Director">Joint Director</option>
                                    <option value="Dy. Director">Dy. Director</option>
                                    <option value="Asstt. Director Grade-I">Asstt. Director Grade-I</option>
                                    <option value="Asstt. Director Grade-II">Asstt. Director Grade-II</option>
                                    <option value="Investigator">Investigator</option>
                                    <option value="Office Superitendent">Office Superitendent</option>

                                </select>
                            </td>
                        </tr>
                        <tr class="tr-name">
                            <td id="tr-main">Discipline : </td>
                            <td id="tr-main">Institute : </td>
                        </tr>
                        <tr class="tr-name">
                            <td align="center">
                                <select id="data2" name="data2">
                                    <option value="">Select</option>
                                    <option value="Chemical">Chemical </option>
                                    <option value="Economic Investigation">Economic Investigation </option>
                                    <option value="Electrical">Electrical </option>
                                    <option value="Electronics">Electronics </option>
                                    <option value="Export Promotion">Export Promotion </option>
                                    <option value="Food">Food </option>
                                    <option value="GAD">GAD </option>
                                    <option value="Glass %26 Ceramic">Glass & Ceramic </option>
                                    <option value="Hosiery">Hosiery </option>
                                    <option value="IMT">IMT </option>
                                    <option value="Leather %26 Footwear">Leather & Footwear </option>
                                    <option value="Mechanical">Mechanical </option>
                                    <option value="Metal Finishing">Metal Finishing </option>
                                    <option value="Metallurgy">Metallurgy </option>
                                    <option value="Statistics">Statistics </option>
                                    <option value="Tailoring">Tailoring </option>
                                    <option value="Cane %26 Bamboo Making">Cane & Bamboo Making </option>


                                </select>
                            </td>
                            <td align="center">
                                <select id="data3" name="data3">
                                    <option value="">Select</option>
                                    <%
                                        Connection con1 = null;
                                        ResultSet rs1 = null;
                                        try {
                                            con1 = ConnectionManager.getConnectionDirectForMySQL();
                                            Statement stmt1 = con1.createStatement();
                                            String sql = "select * from eis_branch_list";
                                            rs1 = stmt1.executeQuery(sql);
                                            while (rs1.next()) {
                                    %>
                                    <option value="<%=rs1.getString("Inst_Name")%>"><%=rs1.getString("Inst_Name")%></option>
                                    <%
                                            }
                                            con1.close();
                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                        }

                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right" id="tbl-btn">
                                <input type="button" id="btn" onclick="return postComment();" value="search"/>
                                <input type="button" id="btn" onclick="myFunction()" value="reset form">                                    
                            </td>
                        </tr>
                        <tr>
                            <td align="left" id="error" colspan="2"></td>
                        </tr>
                    </table>
                </div>
            </form>

            <table id="msg"></table> 
        </div>
        <br/>
        <br/>
        <%
        } else {
        %>
        <jsp:forward page="EIS_error.jsp" />
        <%            }

        %>           

    </body>
</html>
