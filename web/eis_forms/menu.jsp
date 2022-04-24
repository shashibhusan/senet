<%-- 
    Document   : menu
    Created on : 17 Mar, 2021, 4:32:46 PM
    Author     : msme
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" autoFlush="true" %>
<%@page import="java.sql.*" %>
<%@page import="common.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE"> 
            <META HTTP-EQUIV="Expires" CONTENT="-1">
                <meta http-equiv="refresh" content="10"/>
                <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
                <meta name="description" content="Styling Select Elements" />
                <title>Home Page</title>
                <style type="text/css">

                    .style2 ul
                    {
                        padding:0px;
                        margin-left:0px;
                        font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                        color:#F7F7F7;
                        list-style:none;
                        text-indent:20px;
                        width:240px;
                    }
                    .style2 ul .nn
                    {
                        background:#EFEFEF;
                        line-height:28px;
                        border-bottom:1px solid #333;
                    }
                    .style2 ul li a
                    {
                        text-decoration:none;
                        color:#FFFFFF;
                        size:auto;


                        display:block;
                    }
                    .style2 ul li a:hover
                    {
                        background:#DFC4A8;
                    }
                    .style2 ul li#active
                    {
                        background:#073354;
                        color:#333333
                    }
                    .sub
                    {
                        background-color: #E8FCE8;
                        line-height:28px;
                        border-bottom:1px solid #333;
                    }
                    .highlight{     
                        font-weight:bold;
                        font-style: italic;
                    }

                </style>
                <script language="JavaScript" type="text/javascript"><!--//--><![CDATA[//><!--
       function linkopen(lnm, iid, mon, yrs) {
                        //alert(lnm);
                        top.frames['content'].location.href = lnm;
                    }
                    function linkopen1(lnm, iid, mon, yrs) {
                        var links = lnm + '?instId=' + iid + '&months=' + mon + '&years=' + yrs;
                        alert(links);
                        top.frames['content'].location.href = links;
                    }
                    //--><!]]>
                    function  abc()
                    {
                        document.getElementById("dateshow").style.visibility = "hidden";
                    }
                    function showdate()
                    {
                        document.getElementById("dateshow").style.visibility = "visible";
                    }

                </script>
                </head>
                <%
                    String crosssite = (String) session.getAttribute("crosssite");
                    session.setAttribute("crosssite", crosssite);
                    if (!crosssite.equals(null)) {
                        String token = (String) session.getAttribute("token");
                        String emp_name = (String) session.getAttribute("emp_name");
                        String emp_email = (String) session.getAttribute("emp_email");
                        String emp_desig = (String) session.getAttribute("emp_desig");
                        String emp_cur_ofc = (String) session.getAttribute("emp_cur_ofc");

                        session.setAttribute("token", token);
                        session.setAttribute("emp_name", emp_name);
                        session.setAttribute("emp_email", emp_email);
                        session.setAttribute("emp_desig", emp_desig);
                        session.setAttribute("emp_cur_ofc", emp_cur_ofc);



                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;
                        int submitBasic = 0;
                        int submitPostingInfo = 0;
                        int submitTrainingCompleted = 0;
                        int submitPersonalInfo = 0;
                        int submitOtherInfo = 0;
                        int submitFinal = 0;



                        try {
                            con = ConnectionManager.getConnectionDirectForMySQL();
                            st = con.createStatement();
                            String sql = "select * from eis_basicinfo where email='" + emp_email + "'";
                            rs = st.executeQuery(sql);
                            if (rs.next()) {
                                submitBasic = 1;
                            }
                        } catch (Exception err) {
                            err.printStackTrace();
                        }

                        String sql1 = "select * from eis_postinginfo where email='" + emp_email + "'";
                        rs = st.executeQuery(sql1);
                        if (rs.next()) {
                            submitPostingInfo = 1;
                        }
                        String sql2 = "select * from eis_trainingcompleted where email='" + emp_email + "'";
                        rs = st.executeQuery(sql2);
                        if (rs.next()) {
                            submitTrainingCompleted = 1;
                        }
                        String sql3 = "select * from eis_traininginfo where email='" + emp_email + "'";
                        rs = st.executeQuery(sql3);
                        if (rs.next()) {
                            submitPersonalInfo = 1;
                        }
                        String sql4 = "select * from eis_other_details where email='" + emp_email + "'";
                        rs = st.executeQuery(sql4);
                        if (rs.next()) {
                            submitOtherInfo = 1;
                        }
                        String sql5 = "select * from eis_final_submit_report where email='" + emp_email + "'";
                        rs = st.executeQuery(sql5);
                        if (rs.next()) {
                            submitFinal = 1;
                        }

                %>
                <body class="hide">
                    <div align="center" style="margin: auto; text-align: left;"  id="menu-div" class="style2" >
                        <div id="myDiv"> 
                            <ul class="hide" style="border: 1px green solid;">

                                <li class="nn">  <a href="#" onMouseOver="window.status = '';
                        return true;" onClick="linkopen('basicDetails.jsp'), showdate()">
                                        <font color="#EF2100"> Home</font> </a></li>

                                <%--    <li class = "green"> 
                                      <a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('updatepostpref.jsp'),showdate()">
                                  <font color="#EF2100"> SENET Amount Sanctioned</font> </a>
                                  </li>
                                       <li > <a href="myInfo.jsp" class="link1"><font color="#EF2100"> my account</font> </a>
                  </li>--%>
                                <%
                                    if (submitBasic == 0) {
                                %> 
                                <li class="nn">  
                                    <a href="#" onMouseOver="window.status = '';
                        return true;" onClick="linkopen('Insertbasic.jsp'), showdate()">
                                        <font color="#EF2100"> Insert Basic details</font> </a>
                                </li>
                                <%                } else {
                                %>
                                <li class="sub">  
                                    <a href="#" onMouseOver="window.status = '';
                        return true;" onClick="linkopen('Insertbasic.jsp'), showdate()">
                                        <font color="#EF2100"> Basic details <img src="ok.png" width="18" height="18" style="vertical-align: baseline" alt="Basic details done"></img></font> </a>
                                </li>  
                                <%                    }
                                %>
                                <%--         <li>  
                                    <a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('updatepromotion.jsp'),showdate()">
                                <font color="#EF2100"> update promotion</font> </a>
                                </li>
                                --%>
                                <%
                                    if (submitPostingInfo == 0) {
                                %>
                                <li class="nn">  
                                    <a href="#" onMouseOver="window.status = '';
                        return true;" onClick="linkopen('updatetransfer.jsp'), showdate()">
                                        <font color="#EF2100"> Insert posting Info </font> </a>
                                </li>
                                <%} else if (submitFinal == 1) {%>
                                <li class="nn">  
                                    <a href="#" onMouseOver="window.status = '';
                        return true;" onClick="linkopen('updatePostingMain.jsp'), showdate()">
                                        <font color="#EF2100"><b>&rArr; </b> Update posting Info<span style="vertical-align: super; color: #ff0000;">**</span> </font> </a>
                                </li>
                                <%} else {%>
                                <li class="sub">  
                                    <a href="#" onMouseOver="window.status = '';
                        return true;" onClick="linkopen('updatePostingMain.jsp'), showdate()">
                                        <font color="#EF2100"> posting Info <img src="ok.png" width="18" height="18" style="vertical-align: baseline" alt="Basic details done"></img></font> </a>
                                </li>
                                <%}%>

                                <%
                                    if (submitTrainingCompleted == 0) {
                                %>
                                <li class="nn">  
                                    <a href="#" onMouseOver="window.status = '';
                        return true;" onClick="linkopen('updatetraining.jsp'), showdate()">
                                        <font color="#EF2100"> Insert Training Completed </font> </a>
                                </li>
                                <%} else if (submitFinal == 1) {%>
                                <li class="nn">  
                                    <a href="#" onMouseOver="window.status = '';
                        return true;" onClick="linkopen('updatetraining.jsp'), showdate()">
                                        <font color="#EF2100"><b>&rArr; </b>Update Training Completed <span style="vertical-align: super; color: #ff0000;">**</span></font> </a>
                                </li>
                                <%} else {%>
                                <li class="sub">  
                                    <a href="#" onMouseOver="window.status = '';
                        return true;" onClick="linkopen('updatetraining.jsp'), showdate()">
                                        <font color="#EF2100"> Training Completed <img src="ok.png" width="18" height="18" style="vertical-align: baseline" alt="Basic details done"></img></font> </a>
                                </li>
                                <%}%>


                                <%
                                    if (submitPersonalInfo == 0) {
                                %>
                                <li class="nn">  
                                    <a href="#" onMouseOver="window.status = '';
                        return true;" onClick="linkopen('personalinfo.jsp'), showdate()">
                                        <font color="#EF2100"> Insert Personal Info </font> </a>
                                </li>
                                <%} else {%>
                                <li class="sub">  
                                    <a href="#" onMouseOver="window.status = '';
                        return true;" onClick="linkopen('personalinfo.jsp'), showdate()">
                                        <font color="#EF2100"> Personal Info <img src="ok.png" width="18" height="18" style="vertical-align: baseline" alt="Basic details done"></img></font> </a>
                                </li>
                                <%}%>

                                <%
                                    if (submitOtherInfo == 0) {
                                %>
                                <li class="nn">  
                                    <a href="#" onMouseOver="window.status = '';
                        return true;" onClick="linkopen('otherinfo.jsp'), showdate()">
                                        <font color="#EF2100"> Insert other important info </font> </a>
                                </li>
                                <%} else {%>
                                <li class="sub">  
                                    <a href="#" onMouseOver="window.status = '';
                        return true;" onClick="linkopen('otherinfo.jsp'), showdate()">
                                        <font color="#EF2100"> Other important info <img src="ok.png" width="18" height="18" style="vertical-align: baseline" alt="Basic details done"></img></font> </a>
                                </li>
                                <%}%>

                                <!--                <li>  
                                                    <a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('updatetraining.jsp'),showdate()">
                                                <font color="#EF2100"> Update Training Info</font> </a>
                                                </li>-->
                                <%
                                    if (submitFinal == 0) {
                                %> 
                                <li class="nn">  
                                    <a href="#" onMouseOver="window.status = '';
                        return true;" onClick="linkopen('fullreport.jsp'), showdate()">
                                        <font color="#EF2100"> Submit complete details</font> </a>
                                </li>
                                <%} else {%>   
                                <li class="sub">  
                                    <a href="#" onMouseOver="window.status = '';
                        return true;" onClick="linkopen('fullreport.jsp'), showdate()">
                                        <font color="#EF2100"> Full details <img src="ok.png" width="18" height="18" style="vertical-align: baseline" alt="Basic details done"></img></font> </a>
                                </li>
                                <%}%>   
                                <li class="nn" id="active"><A HREF="EIS_logout.jsp" target="_top"> <strong>Logout</strong></a></li>

                            </ul>
                        </div> 
                    </div>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
                    <script>
                    $(document).ready(function() {

                        $('#myDiv a').click(function() {
                            $('#myDiv a').removeClass('highlight');
                            $(this).addClass('highlight');
                        });

                    });
                    </script>
                </body>
                <%
                        con.close();
                        rs.close();
                        st.close();
                    } else {
                        response.sendRedirect("stat.jsp");
                    }
                %>
                </html>
