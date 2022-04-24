<%-- 
    Document   : details
    Created on : 3 Feb, 2022, 3:25:43 PM
    Author     : msme
--%>

<%@page language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.*"%>
<%@page import="java.lang.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Info</title>
        <style>
            h3{
                margin-top: -35px;
            }
            #data
            {
                width: 60%;
                border: 1px #000000 solid;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;

            }
            #data1{
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                font-weight: normal;

            }
            .loop{
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px  #bbbbbb  solid;
                padding: 4px 0px 4px 0px;

            }
            .al{text-align: center;}
            .loop1{
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px  #bbbbbb  solid;
                padding: 4px 0px 4px 0px;


            }

            .head{
                padding: 8px 3px 6px 8px;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color:  #e1e1e1 ;
                border: 1px  #bbbbbb  solid;
            }

            table, th, tr,td { border-collapse: collapse;}


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
                background-color:  #ffffff ;
                min-height: 72vh;
            }
            .textarea
            {
                border: 1px #0000FF solid;
            }
        </style>
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
                width: 30%;
                padding: 5px;
            }
        </style>
        <script src="javaScript/sorttable.js"></script>
    </head>
    <body bgcolor="#ccc">    

        <div id="url-table" align="center" >

            <br/><br/>

            <%
//                String Session = (String) session.getAttribute("Session");
//                String username = (String) session.getAttribute("username");
//                session.setAttribute("username", username);
//                session.setAttribute("Session", Session);
                response.setHeader("Cache-Control", "no-cache");
                response.setHeader("Cache-Control", "no-store");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);
//                System.out.println("session value is=" + Session);

                String key = request.getParameter("CAAqHAgKIh");

                // if (!Session.equals(null))
                if (2 == 2) {
                    Connection con = null;
                    ResultSet rs = null;
                    Statement st = null;
                    String name = "";
                    String email = "";
                    String time = "";

                    try {
                        con = ConnectionManager.getConnectionDirectForMySQL();
                        st = con.createStatement();
                        String sql1 = "select * from eis_updated_user_gov_mail where sno ='" + key + "' ";
                        rs = st.executeQuery(sql1);
                        while (rs.next()) {
                            name = rs.getString("name");
                            email = rs.getString("gov_email");
                            time = rs.getString("time");
                        }

            %>
            <h3 align="center" class="heading"><b><%=name%></b> details -</h3>

            <div class="back" style="height: 30px;width: 40px;float: left;border: 1px #000000 solid;margin-right: -50px; border-radius: 1px;">
                <a href="list.jsp"> <img alt="back button" title="back to list" src="back-button.jpg" height="29" width="39"/></a>
            </div>
            <div>
                <body>
                    <%


                        int iFlag = 0;


                        String sql = "";

                        sql = "select name as name,designation as designation, gov_email as email, mobile as mobile, dob as dob, en_password as password from eis_updated_user_gov_mail where gov_email='" + email + "'";

                        rs = st.executeQuery(sql);
                        while (rs.next()) {
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
                    <table style="width: 400px;">
                        <tr>
                            <td class="data1">Name <div style="float: right">:</div></td>
                            <td class="data"><%=rs.getString("name")%></td>
                        </tr>
                        <tr>
                            <td class="data1">Email <div style="float: right">:</div></td>
                            <td class="data"><%=rs.getString("email")%></td>
                        </tr>
                        <tr>
                            <td class="data1">Designation <div style="float: right">:</div></td>
                            <td class="data"><%=rs.getString("designation")%></td>
                        </tr>
                        <tr>
                            <td class="data1">Mobile <div style="float: right">:</div></td>
                            <td class="data"><%=rs.getString("mobile")%></td>
                        </tr>
                        <tr>
                            <td class="data1">Date of birth <div style="float: right">:</div></td>
                            <td class="data"><%=rs.getString("dob")%></td>
                        </tr>
                        <tr>
                            <td class="data1">Password <div style="float: right">:</div></td>
                            <td class="data"><%=rs.getString("password")%></td>
                        </tr>
                    </table>
                    <%
                            }
                        } catch (Exception err) {
                            err.printStackTrace();
                        } finally {
                            if (con != null) {
                                con.close();
                            }
                            if (rs != null) {
                                rs.close();
                            }
                            if (st != null) {
                                st.close();
                            }
                        }
                    %>
                </body>
                <%--            <table id="data">
                                <tr><td colspan="2">&nbsp;</td></tr>
                                <tr>
                                    <td style="text-align: right">Name :</td>
                                    <td style="text-align: left"><%=name%></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right">Email :</td>
                                    <td style="text-align: left"><%=email%></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right">Time of registration :</td>
                                    <td style="text-align: left"><%=time%></td>
                                </tr>
                                <tr><td colspan="2">&nbsp;</td></tr>
                                
                                <%
                                    int count = 0;
                                    int nFlag = 0;

                        rs = stmt.executeQuery(sql1);
                        while (rs.next()) {
                            count = count + 1;

                %>
               
                <tr>
                    <td colspan="2" style="text-align: center">
                        <textarea class="textarea" id="textarea" cols="70" rows="10" readonly="2">
Dear <%=rs.getString("name")%>

Your EIS login details are given below :
Name            : <%=rs.getString("designation")%>,
Email           : <%=rs.getString("gov_email")%>,
Current posting : <%=rs.getString("current_office")%>,
Mobile          : <%=rs.getString("mobile")%>
Date of birth   : <%=rs.getString("dob")%>
Password        : <%=rs.getString("en_password")%>
                        </textarea>
                    </td>
                </tr>
                <tr><td colspan="2" style="text-align: center"><button onclick="copy()">Copy</button></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>


                <%                            }
                        

                   }
                    catch(Exception err)
                    {
                        err.printStackTrace();
                    }
                %>

            </table>
                --%>
            </div>

            <%
                }
            %>

            <%%>
            <br/>
        </div>
        <script>
            function copy() {
                var textarea = document.getElementById("textarea");
                textarea.select();
                document.execCommand("copy");
            }
        </script>
    </body>
</html>
