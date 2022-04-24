<%-- 
    Document   : fullreport
    Created on : 5 Feb, 2019, 12:46:37 PM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" autoFlush="true" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .mainDivR{
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                width: 850px;
                border: 1px black solid;
                background: none;
                border-radius: 0px;

            }
            #dataR{
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background: none;
                padding-top: 2px;
                padding-bottom: 2px;
                padding-left: 6px;
            }
            .tHead{
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border-bottom: 1px #ededed solid;
                padding: 5px 0px 5px 0px;
                background-color: #cccccc;
                color:  #303030 ;
                font-weight: normal;
            }
            #tHead1{
                font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding-top: 3px;
                padding-bottom: 3px;
                border-bottom: 1px black solid;

            }
            .mData{
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding-top: 2px;
                padding-bottom: 2px;
                color:  #17202a ;
                padding-left: 0px;
            }
            #headerR{
                line-height: 18px;
                font: normal normal 19px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 8px;
                width: 98%;
                background-color: #f1f1f1;
            }
            .headerR1{
                font: normal normal 18px Verdana, Geneva, Arial, Helvetica, sans-serif;
                font-size:20px;

                padding-right: 22px;

            } 
            .btn
            {
                width: 100px;
                padding: 6px 9px;
                margin: 8px 0;
                border: none;
                border-radius: 1px;
                cursor: pointer;
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
                .mainDivR
                {
                    width: 780px !important;
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

            #yes
            {
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px #e2e2e2 solid;
                color:  #1c7f1d ;
            }
            #no
            {
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px #e2e2e2 solid;
                color:   #c41d1d  ;
            }
            .clr3{background-color:  #c4dfc6 ;border: 1px #1e8b03 solid;}
            .clr4{background-color:  #dfc4c4 ;border: 1px #ff0000 solid;}
            .clr5{background-color:  #dfdeef ;border: 1px #4f4dec solid;}
            .clr3:hover{background-color: #1e8b03;color: #ffffff;}
            .clr4:hover{background-color: #ff0000;color: #ffffff;}
            .clr5:hover{background-color: #4f4dec;color: #ffffff;}
            #note
            {
                margin: 0;
                width: 60%;
                border: 1px solid #ff0000;
                padding: 8px;
                border-radius: 2px;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color: #FFF7F7;
                color: #ff0000;
                margin-left: 6px;

            }
            table, th, tr,td { border-collapse: collapse;}
        </style>
    </head>

    <%
        String crosssite = (String) session.getAttribute("crosssite");
        session.setAttribute("crosssite", crosssite);

        if (!crosssite.equals(null)) {

            String token = (String) session.getAttribute("token");
            String emp_name = (String) session.getAttribute("emp_name");
            String email = (String) session.getAttribute("emp_email");
            String emp_desig = (String) session.getAttribute("emp_desig");
            String emp_cur_ofc = (String) session.getAttribute("user_cur_ofc");



            int flagUpdatePost = 0;
            int flagUpdateTransfer = 0;
            String timePost = "";
            String timeTransfer = "";




            Connection con12 = null;
            ResultSet rs12 = null;
            Statement singh = null;
            Statement st = null;
            ResultSet rs = null;


            try {
                con12 = ConnectionManager.getConnectionDirectForMySQL();
                singh = con12.createStatement();
                st = con12.createStatement();
                String pstsql = "Select flag, time from eis_postinginfo_new where email='" + email + "'";
                rs12 = singh.executeQuery(pstsql);
                while (rs12.next()) {
                    flagUpdatePost = 1;
                    timePost = rs12.getString("time");
                    timePost = timePost.substring(0, 11);
                }

            } catch (Exception eee) {
                eee.printStackTrace();
            }

            String Query1 = "Select flag, timeStamp from eis_transferandpromotiondata where email='" + email + "'";
            rs12 = singh.executeQuery(Query1);
            while (rs12.next()) {
                flagUpdateTransfer = 1;
                timeTransfer = rs12.getString("timeStamp");
                timeTransfer = timeTransfer.substring(0, 11);
            }
            int submitFinal = 0;
            String sql5 = "select * from eis_final_submit_report where email='" + email + "'";
            rs12 = singh.executeQuery(sql5);
            if (rs12.next()) {
                submitFinal = 1;
            }


            int submitBasic = 0;
            int submitPostingInfo = 0;
            int submitTrainingCompleted = 0;
            int submitPersonalInfo = 0;
            int submitOtherInfo = 0;

            String sql6 = "select * from eis_basicinfo where email='" + email + "'";
            rs = st.executeQuery(sql6);
            if (rs.next()) {
                submitBasic = 1;
            }
            String sql1 = "select * from eis_postinginfo where email='" + email + "'";
            rs = st.executeQuery(sql1);
            if (rs.next()) {
                submitPostingInfo = 1;
            }
            String sql2 = "select * from eis_trainingcompleted where email='" + email + "'";
            rs = st.executeQuery(sql2);
            if (rs.next()) {
                submitTrainingCompleted = 1;
            }
            String sql3 = "select * from eis_traininginfo where email='" + email + "'";
            rs = st.executeQuery(sql3);
            if (rs.next()) {
                submitPersonalInfo = 1;
            }
            String sql4 = "select * from eis_other_details where email='" + email + "'";
            rs = st.executeQuery(sql4);
            if (rs.next()) {
                submitOtherInfo = 1;
            }






            con12.close();
    %>
    <body>
        <h3 id="headerR" class="hide">Employee Details -</h3>
        <%if (submitFinal == 0) {%>
        <div id="note">*Your final submit is pending.</div>
        <%}%>
        <table align="center" id="content">

            <tr>
                <td colspan="">
                    <div class="mainDivR">
                        <%
                            String current_posting_preference_updated_on = "";
                            Connection con13 = null;
                            ResultSet rs13 = null;
                            try {
                                con13 = ConnectionManager.getConnectionDirectForMySQL();
                                Statement stmt13 = con13.createStatement();
                                String sql13 = "SELECT * FROM eis_basicinfo a INNER JOIN eis_postinginfo b ON a.email=b.email left JOIN eis_traininginfo c ON b.email=c.email WHERE a.email='" + email + "';";
                                rs13 = stmt13.executeQuery(sql13);
                                while (rs13.next()) {
                                    current_posting_preference_updated_on = rs13.getString("b.time_of_update_preferences");

                        %>

                        <div style="height: 0.5px;"></div>
                        <table width="99.8%" align="center" style="border: 1px ">

                            <tr>
                                <td colspan="2" class="tHead">
                                    <strong>Basic Information</strong>
                                </td>
                            </tr>

                            <tr>
                                <td align="left" width="50%">
                                    <div id="dataR">Name :<a class="mData"> <%=rs13.getString("a.name").toUpperCase()%></a></div>
                                    <div id="dataR">Email : <a class="mData"> <%=rs13.getString("a.email")%></a></div>
                                    <div id="dataR">DOB : <a class="mData"> <%=rs13.getString("a.dob")%></a></div>
                                    <div id="dataR">Discipline : <a class="mData"> <%=rs13.getString("a.bas_descipline")%></a></div>
                                    <div id="dataR">Current Pay Level: <a class="mData"> <%=rs13.getString("a.CrPayLevel")%></a></div>
                                    <div id="dataR">Pay Level In Substantive Pay : <a class="mData"> <%=rs13.getString("a.payLevelSub")%></a></div>
                                </td>
                                <td align="left" width="50%">
                                    <div id="dataR">Designation : <a class="mData"> <%=rs13.getString("b.curr_despln")%></a></div>
                                    <div id="dataR">DOJ-GOV : <a class="mData"> <%=rs13.getString("a.doj_gov")%></a></div>
                                    <div id="dataR">DOJ-MSME : <a class="mData"> <%=rs13.getString("a.doj_msme")%></a></div>
                                    <div id="dataR">DOR : <a class="mData"> <%=rs13.getString("a.dat_ret")%></a></div>
                                    <div id="dataR">Date of Regular Appointment to The Present Post : <a class="mData"> <%=rs13.getString("a.aptPrPost")%></a></div>
                                    <div id="dataR">Category : <a class="mData"> <%=rs13.getString("a.Category")%></a></div>
                                </td>
                            </tr>
                        </table>

                        <div style="height: 5px;"></div>

                        <table  width="99.8%" align="center" border="1">
                            <tr>
                                <td colspan="2" class="tHead">
                                    <strong>Current Posting :</strong>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" width="50%">
                                    <div id="dataR">Office Name : <a class="mData"> <%=rs13.getString("b.state")%></a></div>
                                    <div id="dataR">Designation : <a class="mData"> <%=rs13.getString("b.curr_despln")%></a></div>
                                </td>
                                <td align="left" width="50%">
                                    <div id="dataR">Mode : <a class="mData"><%=rs13.getString("b.cur_ofctype")%></a></div>
                                    <div id="dataR">Date of Joining :<a class="mData"><%=rs13.getString("b.curr_doj")%></a></div>
                                </td>
                            </tr>
                        </table>

                        <div style="height: 5px;"></div>

                        <table  width="99.8%" align="center" border="1">
                            <tr>
                                <td class="tHead" colspan="6">
                                    <strong>Posting History :</strong>
                                </td>
                            </tr>
                            <tr>
                                <td id="tHead1" width="5%" align="center">Sno</td>
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
                                int i = 0;
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
                                        i = i + 1;

                            %>
                            <tr>
                                <td align="center"><a class="mData"><%=i%>.</a></td>
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

                        <div style="height: 5px;"></div>

                        <%
                            int check_preference_updation_date = 0;

                            if (current_posting_preference_updated_on.equals("")) {
                                current_posting_preference_updated_on = "not updated";
                            } else {
                                check_preference_updation_date = 1;
                                current_posting_preference_updated_on = current_posting_preference_updated_on.substring(0, 10);
                            }
                        %>

                        <table  width="99.8%" align="center" border="1">
                            <tr>
                                <td class="tHead" colspan="3">
                                    <strong>Posting Preferences &nbsp;&nbsp;&nbsp; <span style="font-weight: normal; color:#d50000; font-size: 10px">(updated on : <%=current_posting_preference_updated_on%>)</span></strong>
                                </td>
                            </tr>
                            <tr>

                                <td id="dataR" width="22%" align="left">1. <a class="mData"><%=rs13.getString("b.pst_pref_1")%></a></td>
                                <td id="dataR" width="22%" align="left">2.<a class="mData"><%=rs13.getString("b.pst_pref_2")%></a></td>
                                <td id="dataR" width="20%" align="left">3.<a class="mData"><%=rs13.getString("b.pst_pref_3")%></a></td>

                            </tr>
                            <tr>
                                <td id="dataR">4.Reason For Preferences :</td>
                                <td colspan="2"><a class="mData"><%=rs13.getString("b.your_spl_pref")%></a></td>
                            </tr>
                        </table>
                        <div style="height: 5px;"></div>
                        <%
                            int old_preference_check = 0;
                            Connection cn = ConnectionManager.getConnectionDirectForMySQL();
                            Statement st15 = cn.createStatement();
                            String query_for_old_preference = "select * from eis_old_posting_preference where email='" + email + "' order by sno desc limit 1";
                            ResultSet rs15 = st15.executeQuery(query_for_old_preference);
                            if (rs15.next()) {
                                old_preference_check = 1;
                            }
                            if (old_preference_check == 1) {
                                rs15.beforeFirst();
                                while (rs15.next()) {
                        %>    
                        <table  width="99.5%" align="center" border="1">
                            <tr>
                                <td class="tHead" colspan="3">
                                    <strong>Old Posting Preferences :</strong>
                                </td>
                            </tr>
                            <tr>

                                <td id="dataR" width="22%" align="left">1. <a class="mData"><%=rs15.getString("pref_1")%></a></td>
                                <td id="dataR" width="22%" align="left">2.<a class="mData"><%=rs15.getString("pref_2")%></a></td>
                                <td id="dataR" width="20%" align="left">3.<a class="mData"><%=rs15.getString("pref_3")%></a></td>

                            </tr>
                        </table>
                        <%}
                            }
                            cn.close();
                            rs15.close();
                            st15.close();
                        %>
                        <div style="height: 5px;"></div>
                        <table  width="99.8%" align="center" border="1">
                            <tr>
                                <td class="tHead" colspan="2">
                                    <strong>About Yourself :</strong>
                                </td>
                            </tr>
                            <tr>
                                <td id="dataR" width="33%">1.&nbsp;&nbsp;Trade<div style="margin-right: 10px; float: right">:</div></td>

                                <td>
                                    <a class="mData"><%=rs13.getString("c.Trade")%></a>
                                </td>
                            </tr>
                            <tr>
                                <td id="dataR">2.&nbsp;&nbsp;Physical Fitness Status<div style="margin-right: 10px; float: right">:</div></td>

                                <td>
                                    <a class="mData"><%=rs13.getString("c.phyFit")%></a>
                                </td>
                            </tr>
                            <tr>
                                <td id="dataR" width="33%">3.&nbsp;&nbsp;
                                    Area of specialization in The Trade<div style="margin-right: 10px; float: right">:</div>
                                </td>

                                <td>
                                    <a class="mData"><%=rs13.getString("c.sptTrade")%></a>
                                </td>
                            </tr>
                            <tr>
                                <td id="dataR" width="33%">4.&nbsp;&nbsp;
                                    specialization in any other field <div style="margin-right: 10px; float: right">:</div>
                                </td>
                                <td>
                                    <a class="mData"><%=rs13.getString("c.splOTrade")%></a>
                                </td>
                            </tr>
                            <tr>
                                <td id="dataR" width="33%">5.&nbsp;&nbsp;
                                    Qualification <div style="margin-right: 10px; float: right">:</div>
                                </td>
                                <td>
                                    <a class="mData"><%=rs13.getString("c.qualification")%></a>
                                </td>
                            </tr>
                            <tr>
                                <td id="dataR" width="33%">6.&nbsp;&nbsp;
                                    Hobbies <div style="margin-right: 10px; float: right">:</div>
                                </td>
                                <td>
                                    <a class="mData"><%=rs13.getString("c.hobbies")%></a>
                                </td>
                            </tr>
                        </table>
                        <div style="height: 5px;"></div>
                        <table  width="99.8%" align="center" border="1">
                            <tr>
                                <td class="tHead" colspan="4">
                                    <strong>Training Completed :</strong>
                                </td>
                            </tr>
                            <tr>
                                <td id="tHead1" width="5%" align="center">Sno</td>
                                <td id="tHead1" width="50%" align="center">Name Of Training</td>
                                <td id="tHead1" width="22%" align="center">From</td>
                                <td id="tHead1" width="22%" align="center">To</td>
                            </tr>
                            <%
                                int j = 0;
                                String date3 = "";
                                String date4 = "";
                                try {
                                    con1 = ConnectionManager.getConnectionDirectForMySQL();
                                    Statement stmt1 = con1.createStatement();
                                    String sql = "select * from eis_trainingcompleted where email='" + email + "'";
                                    rs1 = stmt1.executeQuery(sql);
                                    while (rs1.next()) {
                                        date3 = rs1.getString("tcFrom");
                                        date4 = rs1.getString("tcTo");
                                        j = j + 1;
                            %>
                            <tr>
                                <td align="center"><a class="mData"><%=j%></a></td>
                                <td align="left"><a class="mData"><%=rs1.getString("trainingName")%></a></td>
                                <td align="center"><a class="mData"><%=date3%></a></td>
                                <td align="center"><a class="mData"><%=date4%></a></td>

                            </tr>
                            <%
                                    }
                                    con1.close();
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                            %>

                            <tr>
                                <td colspan="4">
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <div style="height: 5px;"></div>
                        <table  width="99.8%" align="center" border="1">
                            <tr>
                                <td class="tHead" colspan="3">
                                    <strong>Training Preferences :</strong>
                                </td>
                            </tr>
                            <tr>
                                <td id="tHead1" width="8%" align="left">S. no</td>
                                <td id="tHead1" width="46%" align="left">Name Of Training</td>
                                <td id="tHead1" width="46%" align="left">Details</td>
                            </tr>
                            <tr>
                                <td align="center"> 1.</td>
                                <td align="left"> <a class="mData"> <%=rs13.getString("c.tp_name_req_1") == null || rs13.getString("c.tp_name_req_1") == "0" ? " " : rs13.getString("c.tp_name_req_1")%></a></td>
                                <td align="left"> <a class="mData"> <%=rs13.getString("c.tp_det_1") == null ? " " : rs13.getString("c.tp_det_1")%></a>
                                </td>
                            </tr>
                            <tr>
                                <td align="center"> 2.</td>
                                <td align="left"> <a class="mData"> <%=rs13.getString("c.tp_name_req_2") == null ? " " : rs13.getString("c.tp_name_req_2")%></a></td>
                                <td align="left"><a class="mData"> <%=rs13.getString("c.tp_det_2") == null ? " " : rs13.getString("c.tp_det_2")%></a>
                                </td>
                            </tr>
                            <tr>
                                <td align="center"> 3</td>
                                <td align="left"><a class="mData"><%=rs13.getString("c.tp_name_req_3") == null ? " " : rs13.getString("c.tp_name_req_3")%></a></td>
                                <td align="left"><a class="mData"><%=rs13.getString("c.tp_det_3") == null ? " " : rs13.getString("c.tp_det_3")%></a>
                                </td>
                            </tr>


                        </table>
                        <div style="height: 1px;"></div>
                        </form>
                        <%
                                }
                                con13.close();
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }
                        %>
                       
                    </div>
                    
                </td>

            </tr>
            <tr class="hide">
                <td align="center">
                    <form name="update" action="" id="UpdateForm" method="POST">
                        <input type="hidden" name="email" value="<%=email%>">
                        <input type="hidden" name="basicinfo" value="<%=submitBasic%>"/>
                        <input type="hidden" name="postinginfo" value="<%=submitPostingInfo%>"/>
                        <input type="hidden" name="trainingcompletedinfo" value="<%=submitTrainingCompleted%>"/>
                        <input type="hidden" name="personalinfo" value="<%=submitPersonalInfo%>"/>
                        <input type="hidden" name="otherinfo" value="<%=submitOtherInfo%>"/>

                        <%
                            if (submitFinal == 0) {
                        %>
                        <input type="button" class="btn clr5" value="Print" onclick="window.print()"/>
                        <input type="submit" class="btn clr3" value="Final Submit" onclick="return Verifydetails();"/>
                        <%                   } else {
                        %>
                        <input type="button" class="btn clr5" value="Print" onclick="window.print()"/>
                        <%                       }
                        %>

                    </form>
                </td>
            </tr>
        </table>
        <script>
                            function Verifydetails()
                            {
                                var email = document.update.email.value;
                                var basic = document.update.basicinfo.value;
                                var postinginfo = document.update.postinginfo.value;
                                var trainingcompletedinfo = document.update.trainingcompletedinfo.value;
                                var personalinfo = document.update.personalinfo.value;
                                var otherinfo = document.update.otherinfo.value;

                                if (basic != 1)
                                {
                                    alert("Please submit basic information first.");
                                    return false;
                                }
                                else if (postinginfo != 1)
                                {
                                    alert("Please submit posting details first.");
                                    return false;
                                }
                                else if (personalinfo != 1)
                                {
                                    alert("Please submit personal details first.");
                                    return false
                                }
                                else if (otherinfo != 1)
                                {
                                    alert("Please submit other important details first.");
                                    return false;
                                }
                                else
                                {
                                    var url = "finalsubmit.jsp?email=" + email;
                                    document.forms[0].action = url;
                                    return true;
                                }
                            }
        </script>
    </body>
    <%
        } else {
            response.sendRedirect("stat.jsp");
        }
    %>
</html>
