<%-- 
    Document   : 11111printAll
    Created on : Feb 26, 2018, 11:35:18 AM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,common.*" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All</title>
    </head>
    <style>
        .mainDivR{
            font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
            width: 800px;
            border: 1px black solid;

        }
        #dataR{
            font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
            padding-top: 2px;
            padding-bottom: 2px;
            padding-left: 6px;
        }
        .tHead{
            font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
            border-bottom: 2px black solid;
            padding-top: 8px;
        }
        #tHead1{
            font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
            padding-top: 3px;
            padding-bottom: 3px;

            border-bottom: 1px black solid;

        }
        .mData{
            font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
            padding-top: 3px;
            padding-bottom: 3px;
            color:  #17202a ;

            padding-left: 0px;
        }
        .headerR{
            font: normal normal 18px Verdana, Geneva, Arial, Helvetica, sans-serif;
            padding-left: 22px;
        }
        .headerR1{
            font: normal normal 18px Verdana, Geneva, Arial, Helvetica, sans-serif;
            padding-right: 22px;

        }
        #content
        {
            page-break-before: always !important;
        }

        @media print {
            .pagebreak { page-break-before: always; } /* page-break-after works, as well */
        }
    </style>
    <body>
        <center>
            <br/>

            <table>

                <%
                    ArrayList<String> allEmail = new ArrayList<String>();
                    Connection con = null;
                    ResultSet rs = null;
                    Statement st = null;

                    try {
                        con = ConnectionManager.getConnectionDirectForMySQL();
                        st = con.createStatement();
                        String sql = "select email from eis_basicinfo";

                        rs = st.executeQuery(sql);
                        while (rs.next()) {
                            allEmail.add(rs.getString("email"));
                        }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }





                    int i = 0;
                    for (i = 0; i < allEmail.size(); i++) {
                        int flagUpdatePost = 0;
                        //  for( i=0; i<2; i++){
%>
                <tr>
                    <td>
                        <br/>
                        <table align="center" id="content">
                            <tr>
                                <td align="center" class="headerR">Employees' Information System</td>

                            </tr>

                            <tr>
                                <td colspan="">
                                    <div class="mainDivR">
                                        <%

                                            System.out.println("your final submit is done already.");
                                            String email = allEmail.get(i);

                                            try {
                                                con = ConnectionManager.getConnectionDirectForMySQL();
                                                st = con.createStatement();
                                                String flagQuery = "Select flag from eis_postinginfo_new where email='" + email + "'";
                                                rs = st.executeQuery(flagQuery);
                                                while (rs.next()) {
                                                    flagUpdatePost = 1;
                                                }
                                                con.close();
                                            } catch (Exception ew) {
                                                ew.printStackTrace();
                                            }


                                            System.out.println("Email is==" + email);
                                            Connection con13 = null;
                                            ResultSet rs13 = null;
                                            try {
                                                con13 = ConnectionManager.getConnectionDirectForMySQL();
                                                Statement stmt13 = con13.createStatement();
                                                String sql13 = "SELECT * FROM eis_basicinfo INNER JOIN eis_postinginfo ON eis_basicinfo.email=eis_postinginfo.email left JOIN eis_traininginfo ON eis_postinginfo.email=eis_traininginfo.email WHERE eis_basicinfo.email='" + email + "';";
                                                rs13 = stmt13.executeQuery(sql13);

                                                while (rs13.next()) {


                                        %>

                                        <table width="96%" align="center">

                                            <tr>
                                                <td colspan="2" class="tHead">
                                                    <strong>Basic Information</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" width="50%">
                                                    <div id="dataR">Name :<a class="mData"> <%=rs13.getString("eis_basicinfo.name").toUpperCase()%></a></div>
                                                    <div id="dataR">Email : <a class="mData"> <%=rs13.getString("eis_basicinfo.email")%></a></div>
                                                    <div id="dataR">DOB : <a class="mData"> <%=rs13.getString("eis_basicinfo.dob")%></a></div>
                                                    <div id="dataR">Discipline : <a class="mData"> <%=rs13.getString("eis_basicinfo.bas_descipline")%></a></div>
                                                    <div id="dataR">Current Pay Level: <a class="mData"> <%=rs13.getString("eis_basicinfo.CrPayLevel")%></a></div>
                                                    <div id="dataR">Pay Level In Substantive Pay : <a class="mData"> <%=rs13.getString("eis_basicinfo.payLevelSub")%></a></div>
                                                </td>
                                                <td align="left" width="50%">
                                                    <div id="dataR">Designation : <a class="mData"> <%=rs13.getString("eis_basicinfo.bas_designation")%></a></div>
                                                    <div id="dataR">DOJ-GOV : <a class="mData"> <%=rs13.getString("eis_basicinfo.doj_gov")%></a></div>
                                                    <div id="dataR">DOJ-MSME : <a class="mData"> <%=rs13.getString("eis_basicinfo.doj_msme")%></a></div>
                                                    <div id="dataR">DOR : <a class="mData"> <%=rs13.getString("eis_basicinfo.dat_ret")%></a></div>
                                                    <div id="dataR">Date of Regular Appointment to The Present Post : <a class="mData"> <%=rs13.getString("eis_basicinfo.aptPrPost")%></a></div>
                                                    <div id="dataR">Category : <a class="mData"> <%=rs13.getString("eis_basicinfo.Category")%></a></div>
                                                </td>
                                            </tr>
                                        </table>

                                        <table  width="96%" align="center">
                                            <tr>
                                                <td colspan="2" class="tHead">
                                                    <strong>Current Posting :</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" width="50%">
                                                    <div id="dataR">Office Name : <a class="mData"> <%=rs13.getString("eis_postinginfo.state")%></a></div>
                                                    <div id="dataR">Designation : <a class="mData"> <%=rs13.getString("eis_basicinfo.bas_designation")%></a></div>
                                                </td>
                                                <td align="left" width="50%">
                                                    <div id="dataR">Mode : <a class="mData"><%=rs13.getString("eis_postinginfo.cur_ofctype")%></a></div>
                                                    <div id="dataR">Date of Joining :<a class="mData"><%=rs13.getString("eis_postinginfo.curr_doj")%></a></div>
                                                </td>
                                            </tr>
                                        </table>

                                        <table  width="96%" align="center">
                                            <tr>
                                                <td class="tHead" colspan="5">
                                                    <strong>Posting History :</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td id="tHead1" width="22%" align="center">Name Of Office</td>
                                                <td id="tHead1" width="22%" align="center">Designation</td>
                                                <td id="tHead1" width="20%" align="center">Mode</td>
                                                <td id="tHead1" width="18%" align="center">From</td>
                                                <td id="tHead1" width="18%" align="center">To</td>
                                            </tr>
                                            <%
                                                Connection con1 = null;
                                                ResultSet rs1 = null;

                                                int ph = 1;
                                                try {
                                                    con1 = ConnectionManager.getConnectionDirectForMySQL();
                                                    Statement stmt1 = con1.createStatement();
                                                    String sql = "select * from eis_posthistory where email='" + email + "'";
                                                    rs1 = stmt1.executeQuery(sql);
                                                    while (rs1.next()) {

                                                        String date1 = "", date2 = "", dd = "", mm = "", yy = "";
                                                        String dd1 = "", mm1 = "", yy1 = "";
                                                        date1 = rs1.getString("phfrom");
                                                        date2 = rs1.getString("phto");

                                            %>
                                            <tr>
                                                <td align="left"><a class="mData"><%=rs1.getString("officeName")%></a></td>
                                                <td align="left"><a class="mData"><%=rs1.getString("designation")%></a></td>
                                                <td align="left"><a class="mData"><%=rs1.getString("phmode")%></a></td>
                                                <td align="center"><a class="mData"><%=date1%></a></td>
                                                <td align="center"><a class="mData"><%=date2%></a></td>
                                            </tr>
                                            <%

                                                    }
                                                    con1.close();
                                                } catch (Exception ex) {
                                                    ex.printStackTrace();
                                                }
                                            %>

                                        </table>

                                        <table  width="96%" align="center">
                                            <tr>
                                                <%
                                                    if (flagUpdatePost == 1) {
                                                %>
                                                <td class="tHead" colspan="3">
                                                    <strong>Posting Preferences :</strong>
                                                    <font style="font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif; color: green;">updated</font>
                                                </td>
                                                <%                                } else {
                                                %>
                                                <td class="tHead" colspan="3">
                                                    <strong>Posting Preferences :</strong>
                                                    <font style="font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif; color: red;">not updated</font>
                                                </td>
                                                <%                        }
                                                %>
                                            </tr>
                                            <tr>
                                                <%
                                                    if (flagUpdatePost == 0) {
                                                %>
                                                <td id="dataR" width="22%" align="left">1. <a class="mData"><%=rs13.getString("eis_postinginfo.pst_pref_1")%></a></td>
                                                <td id="dataR" width="22%" align="left">2.<a class="mData"><%=rs13.getString("eis_postinginfo.pst_pref_2")%></a></td>
                                                <td id="dataR" width="20%" align="left">3.<a class="mData"><%=rs13.getString("eis_postinginfo.pst_pref_3")%></a></td>
                                                    <%
                                                    } else {

                                                        try {
                                                            con = ConnectionManager.getConnectionDirectForMySQL();
                                                            st = con.createStatement();
                                                            String Query11 = "Select * from eis_postinginfo_new where email = '" + email + "'";
                                                            rs = st.executeQuery(Query11);
                                                            while (rs.next()) {
                                                    %>
                                                <td id="dataR" width="22%" align="left">1. <a class="mData"><%=rs.getString("pref_one")%></a></td>
                                                <td id="dataR" width="22%" align="left">2.<a class="mData"><%=rs.getString("pref_two")%></a></td>
                                                <td id="dataR" width="20%" align="left">3.<a class="mData"><%=rs.getString("pref_three")%></a></td>
                                                    <%
                                                                }
                                                                con.close();
                                                            } catch (Exception error) {
                                                                error.printStackTrace();
                                                            }
                                                        }
                                                    %>

                                            </tr>
                                            <tr>
                                                <td id="dataR">Reason For Preferences :</td>
                                                <td colspan="2"><a class="mData"><%=rs13.getString("eis_postinginfo.your_spl_pref")%></a></td>
                                            </tr>
                                        </table>

                                        <table  width="96%" align="center">
                                            <tr>
                                                <td class="tHead" colspan="2">
                                                    <strong>About Yourself :</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td id="dataR" width="33%">1 - Trade :</td>
                                                <td>
                                                    <a class="mData"><%=rs13.getString("eis_traininginfo.Trade")%></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td id="dataR">2 - Physical Fitness Status :</td>
                                                <td>
                                                    <a class="mData"><%=rs13.getString("eis_traininginfo.phyFit")%></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td id="dataR" width="33%">
                                                    3 - Area of Specialisation in The Trade :
                                                </td>
                                                <td>
                                                    <a class="mData"><%=rs13.getString("eis_traininginfo.sptTrade")%></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td id="dataR" width="33%">
                                                    4 - Specialisation in any other field :
                                                </td>
                                                <td>
                                                    <a class="mData"><%=rs13.getString("eis_traininginfo.splOTrade")%></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td id="dataR" width="33%">
                                                    5 - Qualification :
                                                </td>
                                                <td>
                                                    <a class="mData"><%=rs13.getString("eis_traininginfo.qualification")%></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td id="dataR" width="33%">
                                                    6 - Hobbies :
                                                </td>
                                                <td>
                                                    <a class="mData"><%=rs13.getString("eis_traininginfo.hobbies")%></a>
                                                </td>
                                            </tr>
                                        </table>

                                        <table  width="96%" align="center">
                                            <tr>
                                                <td class="tHead" colspan="4">
                                                    <strong>Training Completed :</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td id="tHead1">S.no</td>
                                                <td id="tHead1" width="40%" align="center">Name Of Training</td>
                                                <td id="tHead1" width="30%" align="center">From</td>
                                                <td id="tHead1" width="30%" align="center">To</td>
                                            </tr>
                                            <%
                                                String date3 = "";
                                                String date4 = "";
                                                int z = 1;
                                                try {
                                                    con1 = ConnectionManager.getConnectionDirectForMySQL();
                                                    Statement stmt1 = con1.createStatement();
                                                    String sql = "select * from eis_trainingcompleted where email='" + email + "'";
                                                    rs1 = stmt1.executeQuery(sql);
                                                    while (rs1.next()) {
                                                        date3 = rs1.getString("tcFrom");
                                                        date4 = rs1.getString("tcTo");

                                            %>
                                            <tr>
                                                <td><%=z%>.</td>
                                                <td align="left"><a class="mData"><%=rs1.getString("trainingName")%></a></td>
                                                <td align="center"><a class="mData"><%=date3%></a></td>
                                                <td align="center"><a class="mData"><%=date4%></a></td>

                                            </tr>
                                            <%
                                                        z = z + 1;
                                                    }
                                                    con1.close();
                                                } catch (Exception ex) {
                                                    ex.printStackTrace();
                                                }
                                            %>

                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>

                                        <table  width="96%" align="center">
                                            <tr>
                                                <td class="tHead" colspan="4">
                                                    <strong>Training Preferences :</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td id="tHead1" width="5%" align="center">S. no</td>
                                                <td id="tHead1" width="45%" align="left">Name Of Training</td>
                                                <td id="tHead1" width="50%" align="left">Details</td>
                                            </tr>
                                            <tr>
                                                <td align="center"> <b>1.</b></td>
                                                <td align="left"> <a class="mData"> <%=rs13.getString("eis_traininginfo.tp_name_req_1") == null || rs13.getString("eis_traininginfo.tp_name_req_1") == "0" ? " " : rs13.getString("eis_traininginfo.tp_name_req_1")%></a></td>
                                                <td align="left"> <a class="mData"> <%=rs13.getString("eis_traininginfo.tp_det_1") == null ? " " : rs13.getString("eis_traininginfo.tp_det_1")%></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center"> <b>2.</b></td>
                                                <td align="left"> <a class="mData"> <%=rs13.getString("eis_traininginfo.tp_name_req_2") == null ? " " : rs13.getString("eis_traininginfo.tp_name_req_2")%></a></td>
                                                <td align="left"><a class="mData"> <%=rs13.getString("eis_traininginfo.tp_det_2") == null ? " " : rs13.getString("eis_traininginfo.tp_det_2")%></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center"> <b>3.</b></td>
                                                <td align="left"><a class="mData"><%=rs13.getString("eis_traininginfo.tp_name_req_3") == null ? " " : rs13.getString("eis_traininginfo.tp_name_req_3")%></a></td>
                                                <td align="left"><a class="mData"><%=rs13.getString("eis_traininginfo.tp_det_3") == null ? " " : rs13.getString("eis_traininginfo.tp_det_3")%></a>
                                                </td>
                                            </tr>


                                        </table>
                                        <br/>
                                        <%
                                                }
                                                con13.close();
                                            } catch (Exception ex) {
                                                ex.printStackTrace();
                                            }

                                        %>
                                    </div>
                                    <p class="pagebreak"></p>
                                </td>

                            </tr>

                        </table>
                    </td>
                </tr>
                <%
                    if (i == 0) {
                %>
                <table><tr><td>
                            <br/><br/><br/><br/>
                        </td></tr></table>

                <%                }
                    }
                %>

            </table>
        </center>
    </body>
</html>
