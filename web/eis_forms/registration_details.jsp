<%-- 
    Document   : registration_details
    Created on : 17 Mar, 2021, 4:13:03 PM
    Author     : msme
--%>
<%@page import="java.sql.*,common.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
            <meta http-equiv="Pragma" content="no-cache">
                <meta http-equiv="Expires" content="0">
                    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
                    <title>: : Update Details : :</title>
                    <script language="JavaScript">
                        window.history.forward(0);
                    </script>
                    <style>
                        title
                        {
                            font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
                        }
                        #crt{
                            font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                            padding: 5px;

                        }
                        #mainDiv
                        {
                            border: 1px #0000FF solid;
                            width : 1150px;
                            margin: auto;
                            align : center;
                            background-color: white;
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
                        @page{


                            margin:0px;

                        }

                        body.print-page
                        {
                            -webkit-transform: scale(0.85);  /* Saf3.1+, Chrome */
                            -moz-transform: scale(0.95);  /* FF3.5+ */
                            -ms-transform: scale(0.85);  /* IE9 */
                            -o-transform: scale(0.85);  /* Opera 10.5+ */
                            transform: scale(0.85);
                            /* big hack to reposition the page top the top and left of the viewer control */
                        }


                        .note
                        {
                            font: normal normal 9px Verdana, Geneva, Arial, Helvetica, sans-serif;
                            color: red;
                            padding-left: 25px;
                        }


                    </style>

                    </head>


                    <script type="text/javascript">
                        <!--
                    function delayer() {
                            window.location = "logout.jsp"
                        }
                        //-->
                    </script>
                    <%--
                    <body onLoad="setTimeout('delayer()', 1800000)">
                    --%>
                    <body bgcolor=" #fdecd9 " style="margin-top: 0px;">
                        <%
                            String crosssite = (String) session.getAttribute("nmm");
                            session.setAttribute("crosssite", crosssite);

                            session.setAttribute("Session", crosssite);
                            response.setHeader("Cache-Control", "no-cache");
                            response.setHeader("Cache-Control", "no-store");
                            response.setHeader("Pragma", "no-cache");
                            response.setDateHeader("Expires", 0);

                            if (!crosssite.equals(null)) {


                                String emp_email = (String) session.getAttribute("username");

                                System.out.println("we get the gov email==" + emp_email);
                                System.out.println("nmm=======" + crosssite);
                                String emp_desig = "";
                                String emp_cur_ofc = "";
                                String token = "";
                                String emp_name = "";
                                String dob = "";

                                Connection con = null;
                                ResultSet rs = null;
                                Statement st = null;
                                int flag = 0;
                                
                               
                                try
                                {
                                    con = ConnectionManager.getConnectionDirectForMySQL();
                                    st = con.createStatement();    
                                    String query1 = "select gov_email as emp_email from eis_updated_user_gov_mail where gov_email='" + emp_email + "'";
                                    rs=st.executeQuery(query1);
                                    while(rs.next())
                                    {
                                        emp_email=rs.getString("emp_email");
                                    }
                                }catch(Exception error)
                                {
                                    error.printStackTrace();
                                }
                                
                                System.out.println("we get the new registered government email==" + emp_email);

                                try {
                                    
                                    String query = "select * from eis_updated_user_gov_mail where gov_email='" + emp_email + "'";
                                    rs = st.executeQuery(query);
                                    while (rs.next()) {
                                        emp_name = rs.getString("name");
                                        token = rs.getString("token");
                                        emp_cur_ofc = rs.getString("current_office");
                                        emp_desig = rs.getString("designation");
                                        dob = rs.getString("dob");
                                        System.out.println("date of birth===" + dob);
                                    }
                                    con.close();
                                    st.close();
                                    rs.close();
                                } catch (Exception sqlerror) {
                                    sqlerror.printStackTrace();
                                }



                                session.setAttribute("token", token);
                                session.setAttribute("emp_name", emp_name);
                                session.setAttribute("emp_email", emp_email);
                                session.setAttribute("emp_desig", emp_desig);
                                session.setAttribute("emp_cur_ofc", emp_cur_ofc);
                                session.setAttribute("dob", dob);

                                System.out.println("date of birth===" + dob);

                        %>

                        <div id="mainDiv">
                            <table width='1150px' border='0px' cellspacing='0' cellpadding='0'  align="center">

                                <tr>
                                    <td>
                                        <div class="hide" style="font-size: 14px;font-family:Verdana;font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; " align="center">Government of India, Ministry of MSME </div>
                                        <div class="hide" style="font-size: 14px;font-family:Verdana;font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"></font>O/o  DCMSME </div>
                                        <div class="hide" style="font-size:14px;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center" ><font color="#990000">ALL INDIA MSME-DO EMPLOYEES' INFORMATION SYSTEM </font>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="4" colspan="4" style="background-color:  #996b65 "></td>
                                </tr>
                                <tr>
                                    <td height="27" colspan="4" align="center"  ><strong>
                                            <div style="text-align:center; border-top: 1px #ccc solid; background-color: none;">

                                                <IFRAME NAME="menu"  width="22%" height="630px"  align="left" SRC="eis_forms/menu.jsp" frameborder=0></IFRAME>

                                                <IFRAME NAME="content"  id="content" width="78%"  SRC="eis_forms/basicDetails.jsp" height="630px"  frameborder=0></IFRAME>
                                            </div></strong></td></tr>
                                <tr>
                                    <td class="note">
                                        <span style="vertical-align: super; color: #ff0000;">**</span> update your posting details or training completed report, if it is required.
                                    </td>
                                </tr>
                                <tr>
                                    <td id="crt" align="center" class="hide">
                                        <div  colspan="13" style="margin-bottom:0px; background-color:green;" >

                                            <font color="#FFFFFF" size="-1">Created & Designed by O/o DC-MSME &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Contact Us : 011-23062354(Senet Division)
                                            </font>

                                        </div>
                                    </td>
                                </tr>

                            </table>
                        </div>
                        <%
                            } else {
                                response.sendRedirect("stat.jsp");
                            }
                        %>
                    </body>
                    </html>