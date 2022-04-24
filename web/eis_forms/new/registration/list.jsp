<%-- 
    Document   : list
    Created on : 3 Feb, 2022, 2:32:28 PM
    Author     : msme
--%>
<%@page language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.*"%>
<%@page import="java.lang.*"%>
<%@page import="com.updategovemail.RandomString"%>
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
                width: 90%;

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
            a:visited,a:link
            {
                text-decoration: none;
                color: blue;
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

                // if (!Session.equals(null))
                if (2 == 2) {
            %>
            <h3 align="center" class="heading">EIS New Registration List</h3>


            <table id="data">
                <thead>
                <th width="10px;" class="head">S.No.</th>
                <th width="120px;"class="head">Name</th>
                <th width="120px;" class="head">Designation </th>
                <th width="100px;" class="head">Current office</th>
                <th width="100px;" class="head">Email</th>
                <th width="40px;" class="head">DOB</th>
                <th width="40px;" class="head">Mobile</th>
                <th width="40px;" class="head">Time(reg.)</th>
                <th width="30px;" class="head">Link</th>
                </thead>
                <%
                    int count = 0;
                    int nFlag = 0;
                    Connection con = null;
                    ResultSet rs = null;
                    
                    RandomString randomString=new RandomString();

                    try {
                        con = ConnectionManager.getConnectionDirectForMySQL();
                        Statement stmt = con.createStatement();
                        String sql1 = "select * from eis_updated_user_gov_mail where remark ='new_registration' order by sno desc";
                        rs = stmt.executeQuery(sql1);
                        while (rs.next()) {
                            count = count + 1;

                %>
                <tr id="dataIn">
                    <td class="loop al"><%=count%></td>
                    <td class="loop1"><%=rs.getString("name")%></td>
                    <td class="loop"><%=rs.getString("designation")%></td>
                    <td class="loop"><%=rs.getString("current_office")%></td>
                    <td class="loop"><%=rs.getString("gov_email")%></td>
                    <td class="loop al"><%=rs.getString("dob")%></td>
                    <td class="loop al"><%=rs.getString("mobile")%></td>
                    <td class="loop al"><%=(rs.getString("time")).substring(0, 10)%></td>
                    <td class="loop"><a href="details.jsp?CAAqHAgKIh=<%=rs.getString("sno")%>&sec$key=/topics/<%=randomString.getAlphaNumericString(100)%>?hl=hi&gl=IN&ceid=IN%3Ahi">details</a></td>
                </tr>



                <%                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                    }
                %>

            </table>

            <%
            %>

            <%%>
            <br/>
        </div>

    </body>
</html>