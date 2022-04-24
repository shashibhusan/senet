<%-- 
    Document   : EIS_aduser
    Created on : Feb 22, 2018, 12:43:47 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <style>
            .main{
                background:  #ffffff ;
                border-radius : 8px;
                width: 955px;
                border: 1px black solid;
            }
            .main1{
                background:  #ffffff ;
                width: 955px;
                border: 1px black solid;
                height: 320px;
                overflow: auto;
            }
            .data{
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                font-size: 14px;
                width: 100%;
                margin-bottom: 45px;
                margin-top: -20px;
            }
            .data1{
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                font-size: 14px;
                width: 100%;
                margin-bottom: 45px;
            }
            h3
            {
                font: normal normal 16px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            .head{
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                font-size: 18px;
                padding-top: 8px;
                padding-bottom: 8px;
                background-color:  #bad4be ;
                margin-bottom: -2px;

            }
            .Ghead{
                font-family: vardana;
                font-size: 18px;
                padding-top: 8px;
                padding-bottom: 8px;
                background-color:  #bad4be ;
            }
            .dHead{
                border: 1px black solid;
                padding: 5px 5px 5px 5px;
                font-size: 16px;
                font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                background:  #d7e4bf;
            }
            .mainData{
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                font-size: 14px;
                padding: 4px 4px 4px 4px;
                padding-left: 10px;
            }
            a {
                display: inline-block;
                color: Blue;
                text-align: center;
                padding: 0px;
                text-decoration: none;
            }
            a:hover{
                text-decoration: underline;
            }
            #trdata:nth-child(even)
            {
                background: #FFF;
            }
            #trdata:nth-child(odd) {
                background: #e5e5e5;
            }

        </style>
    </head>
    <%
        String Session = (String) session.getAttribute("Session");
        String user = (String) session.getAttribute("username");
        session.setAttribute("Session", Session);

        System.out.println("session value is=" + Session);

        if (!Session.equals(null)) {


            Connection con = null;
            ResultSet res = null;
            Statement stm = null;
            String name = "";
            String adEmail = "";
            try {
                con = ConnectionManager.getConnectionDirectForMySQL();
                stm = con.createStatement();
                String sql = "select * from eis_admin where username='" + user + "'";
                res = stm.executeQuery(sql);
                while (res.next()) {
                    name = res.getString("name");
                    adEmail = res.getString("email");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
            session.setAttribute("user", name);
            session.setAttribute("username", user);
            session.setAttribute("adEmail", adEmail);
    %>
    <body bgcolor=" #cccccf ">
        <h3 align="center"><%=user%></h3>


        <table align="center">
            <tr>
                <td align="left" style="font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif; font-weight: 10px; color: #9e0bc2 ">Admin mode</td>
                <td align="right" style="font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif; font-weight: 10px; color: #9e0bc2 "><a HREF="EISadlogout.jsp" >Logout</a></td>
            </tr>

            <tr>
                <td align="center" colspan="2">
                    <div class="main1">

                        <div class="head"> Employees' List On EIS</div>
                        <table class="data">
                            <tr>
                                <td class="dHead" align="center" width="28px"> S.no.</td>
                                <td class="dHead"  align="center"> Name</td>
                                <td class="dHead" align="center"> Office</td>
                                <td class="dHead" align="center"> Designation</td>
                                <td class="dHead" align="center" width="85px"> Dt. of Join</td>
                                <td class="dHead" align="center" width="45"> Edited</td>
                            </tr>
                            <%
                                ArrayList<String> instList = new ArrayList<String>();
                                ArrayList<String> instName = new ArrayList<String>();
                                ResultSet rs = null;
                                Statement st = null;
                                String instId = "";
                                try {
                                    con = ConnectionManager.getConnectionDirectForMySQL();
                                    st = con.createStatement();
                                    String sql = "Select * from eis_branch_list where Inst_Name='" + user + "'";
                                    rs = st.executeQuery(sql);
                                    while (rs.next()) {
                                        instId = rs.getString("Inst_id");
                                    }

                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                                session.setAttribute("instId", instId);

                                try {
                                    con = ConnectionManager.getConnectionDirectForMySQL();
                                    st = con.createStatement();
                                    String sql = "Select * from eis_di_branch where di_main='" + instId + "'";
                                    rs = st.executeQuery(sql);
                                    while (rs.next()) {
                                        instList.add(rs.getString("branch"));
                                    }

                                } catch (Exception e) {
                                    e.printStackTrace();
                                }


                                try {
                                    con = ConnectionManager.getConnectionDirectForMySQL();
                                    st = con.createStatement();
                                    for (int ijk = 0; ijk < instList.size(); ijk++) {
                                        String sql = "Select * from eis_branch_list where Inst_id='" + instList.get(ijk) + "'";
                                        rs = st.executeQuery(sql);
                                        while (rs.next()) {
                                            instName.add(rs.getString("Inst_Name"));
                                        }
                                        System.out.println("Inst name==" + instName.get(ijk));
                                    }
                                    con.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }




                                SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                                Date date = new Date();
                                String time = dateFormat.format(date);
                                Calendar c = Calendar.getInstance();
                                Calendar cc = Calendar.getInstance();
                                int result_in_eis = 0;
                                try {
                                    con = ConnectionManager.getConnectionDirectForMySQL();
                                    st = con.createStatement();
                                    for (int i = 0; i < instName.size(); i++) {
                                        String sql = "select * from eis_basicinfo a join eis_postinginfo b on a.email=b.email  where b.state='" + instName.get(i) + "'";
                                        System.out.println(sql);
                                        rs = st.executeQuery(sql);
                                        while (rs.next()) {
                                            result_in_eis = 1;
                                        }
                                    }
                                    con.close();
                                } catch (Exception err) {
                                    err.printStackTrace();
                                }

                                if (result_in_eis == 1) {
                                    int iiCount = 0;
                                    try {
                                        con = ConnectionManager.getConnectionDirectForMySQL();
                                        st = con.createStatement();
                                        for (int i = 0; i < instName.size(); i++) {
                                            String sql = "select * from eis_basicinfo a join eis_postinginfo b on a.email=b.email where b.state='" + instName.get(i) + "'";
                                            System.out.println(sql);
                                            rs = st.executeQuery(sql);
                                            while (rs.next()) {
                                                iiCount = iiCount + 1;
                                                System.out.println("=======" + instName.get(i));
                            %>
                            <tr id="trdata">
                                <td class="mainData"><%=iiCount%>.</td>
                                <td class="mainData"><a href="EIS_empform.jsp?nnMQFds495dS6fhXxQjd=<%=rs.getString("a.token")%>"><%=rs.getString("a.name").toUpperCase()%></a></td>
                                <td class="mainData"><%=rs.getString("b.state")%></td>
                                <td class="mainData"><%=rs.getString("a.bas_designation")%></td>
                                <td class="mainData"><%=rs.getString("b.curr_doj")%></td>
                                <%
                                    int editValue = 0;
                                    try {
                                        Connection con1 = ConnectionManager.getConnectionDirectForMySQL();
                                        Statement st1 = con1.createStatement();
                                        String sqll = "select * from eis_finalchange where email='" + rs.getString("a.email") + "'";
                                        ResultSet rs1 = st1.executeQuery(sqll);
                                        System.out.println(sqll);
                                        while (rs1.next()) {
                                            editValue = 1;
                                        }
                                        con1.close();
                                    } catch (Exception exp) {
                                        exp.printStackTrace();
                                    }
                                    if (editValue == 1) {
                                %>
                                <td class="mainData" align="center"><img src="right.png" title="Verification done " alt="Yes" height="15" width="18"></td>
                                    <%                                       } else {
                                    %>
                                <td class="mainData" align="center"><img src="wrong.png" title="Not Verified " alt="No" height="15" width="18"></td>
                                    <%                                           }
                                    %>
                            </tr>

                            <%
                                        }
                                    }

                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                            } else {

                            %>
                            <tr id="trdata">
                                <td colspan="5" align="center" style=" font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 14px; color: red; padding-top: 25px;">
                                    No registration found on EIS System.
                                </td>

                            </tr>
                            <%                                }
                            %>
                            <br/>
                        </table>
                    </div>
                </td>
            </tr>

            <tr>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="main1">
                        <div class="head" align="center">  Grievance Register</div>
                        <table class="data1">

                            <tr id="">
                                <td class="dHead" align="center"> S.no.</td>
                                <td class="dHead"  align="center"> Name</td>
                                <td class="dHead" align="center"> Office</td>
                                <td class="dHead" align="center"> Designation</td>
                                <td class="dHead" align="center"> Date of Joining</td>
                                <td class="dHead" align="center"> Status </td>
                            </tr>
                            <%
                                try {

                                    cc.setTime(dateFormat.parse(time));
                                } catch (ParseException e) {
                                    e.printStackTrace();
                                }
                                String todayDate = dateFormat.format(cc.getTime());
// System.out.println("today date="+today);

                                int iCount = 0;
                                int iiFlag = 0;
                                try {
                                    con = ConnectionManager.getConnectionDirectForMySQL();
                                    st = con.createStatement();
                                    for (int i = 0; i < instList.size(); i++) {
                                        String sql = "select * from egs_basic a join eis_postinginfo b on a.email=b.email where b.state='" + instName.get(i) + "' ";
                                        rs = st.executeQuery(sql);
                                        while (rs.next()) {
                                            iiFlag = 1;
                                        }
                                    }
                                } catch (Exception gv) {
                                    gv.printStackTrace();
                                }
                                String submitDate = "";
                                if (iiFlag == 1) {

                                    Connection con1 = null;
                                    ResultSet res1 = null;
                                    Statement st1 = null;
                                    String responseFrom = "";
                                    String replyDate = "";
                                    try {
                                        con = ConnectionManager.getConnectionDirectForMySQL();
                                        st = con.createStatement();
                                        for (int i = 0; i < instList.size(); i++) {
                                            String sql = "select * from egs_basic a join eis_postinginfo b on a.email=b.email where b.state='" + instName.get(i) + "' ";
                                            rs = st.executeQuery(sql);
                                            while (rs.next()) {
                                                iCount = iCount + 1;
                                                submitDate = rs.getString("a.time");
                                                try {

                                                    c.setTime(dateFormat.parse(submitDate));
                                                } catch (ParseException e) {
                                                    e.printStackTrace();
                                                }
                                                c.add(Calendar.DAY_OF_MONTH, 30);
                                                String finalDate = dateFormat.format(c.getTime());

                                                //   System.out.println("Date after addition="+finalDate);
                                                String grievance_submit_date = (rs.getString("a.time")).substring(0, 11);

                                                try {
                                                    con1 = ConnectionManager.getConnectionDirectForMySQL();
                                                    st1 = con1.createStatement();
                                                    String Query = "select * from egs_file where email='" + adEmail + "' and token='" + rs.getString("a.token") + "'";
                                                    res1 = st1.executeQuery(Query);
                                                    while (res1.next()) {
                                                        responseFrom = res1.getString("replyType");
                                                        replyDate = res1.getString("time");
                                                    }
                                                    st1.close();
                                                } catch (Exception check) {
                                                    check.printStackTrace();
                                                }
                                                Calendar ReplyDateFormat = Calendar.getInstance();
                                                try {
                                                    ReplyDateFormat.setTime(dateFormat.parse(replyDate));
                                                } catch (ParseException da) {
                                                    da.printStackTrace();
                                                }


                                                if (responseFrom.equals("Reply")) {
                                                    if (ReplyDateFormat.getTime().before(c.getTime()) || ReplyDateFormat.getTime().equals(c.getTime())) {

                            %>
                            <tr id="trdata">
                                <td class="mainData"><%=iCount%>.</td>
                                <td class="mainData"><a href="egs_AdminView.jsp?nnMQFds495dS6fhXxQjd=<%=rs.getString("a.token")%>&vax=<%=rs.getString("a.email")%>" target="_blank"><%=rs.getString("a.name").toUpperCase()%></a></td>
                                <td class="mainData"><%=rs.getString("b.state")%></td>
                                <td class="mainData"><%=rs.getString("a.designation")%></td>
                                <td class="mainData"><%=rs.getString("b.curr_doj")%></td>
                                <td class="mainData" style=" color: #239b56 ;">Done ( <%=replyDate.substring(0, 11)%> )</td>
                            </tr>
                            <%
                            } else {
                            %>
                            <tr id="trdata">
                                <td class="mainData"><%=iCount%>.</td>
                                <td class="mainData"><%=rs.getString("a.name").toUpperCase()%></td>
                                <td class="mainData"><%=rs.getString("b.state")%></td>
                                <td class="mainData"><%=rs.getString("a.designation")%></td>
                                <td class="mainData"><%=rs.getString("b.curr_doj")%></td>
                                <td class="mainData" style=" color: #239b56 ;">Done by HQ ( <%=replyDate.substring(0, 11)%> )</td>
                            </tr>
                            <%
                                }



                            } else {
                                if (cc.getTime().before(c.getTime()) || cc.getTime().equals(c.getTime())) {
                            %>
                            <tr id="trdata">
                                <td class="mainData"><%=iCount%>.</td>
                                <td class="mainData"><a href="egs_AdminView.jsp?nnMQFds495dS6fhXxQjd=<%=rs.getString("a.token")%>&vax=<%=rs.getString("a.email")%>" target="_blank"><%=rs.getString("a.name").toUpperCase()%></a></td>
                                <td class="mainData"><%=rs.getString("b.state")%></td>
                                <td class="mainData"><%=rs.getString("a.designation")%></td>
                                <td class="mainData"><%=rs.getString("b.curr_doj")%></td>
                                <td class="mainData" style="color: #f96854 ">Pending ( <%=grievance_submit_date%> )</td>
                            </tr>

                            <%
                            } else {
                            %>
                            <tr id="trdata">
                                <td class="mainData"><%=iCount%>.</td>
                                <td class="mainData"><%=rs.getString("a.name").toUpperCase()%></td>
                                <td class="mainData"><%=rs.getString("b.state")%></td>
                                <td class="mainData"><%=rs.getString("a.designation")%></td>
                                <td class="mainData"><%=rs.getString("b.curr_doj")%></td>
                                <td class="mainData" style="color: #f96854 ">Pending  at HQ ( <%=grievance_submit_date%> )</td>
                            </tr>

                            <%
                                                }
                                            }
                                        }

                                    }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                            } else {
                            %>
                            <tr id="trdata">
                                <td colspan="6" align="center" style=" font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 14px; color: red; padding-top: 25px;">
                                    No grievance found .
                                </td>

                            </tr>

                            <%}%>
                        </table>


                    </div>
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="main1">
                        <div class="head" align="center">  Grievance Register by Secretarial Staff - SS</div>
                        <table class="data1">

                            <tr id="">
                                <td class="dHead" align="center"> S.no.</td>
                                <td class="dHead"  align="center"> Name</td>
                                <td class="dHead" align="center"> Office</td>
                                <td class="dHead" align="center"> Designation</td>
                                <td class="dHead" align="center"> Category</td>
                                <td class="dHead" align="center"> Status</td>
                            </tr>
                            <%
                                try {

                                    cc.setTime(dateFormat.parse(time));
                                } catch (ParseException e) {
                                    e.printStackTrace();
                                }
                                String todayDate1 = dateFormat.format(cc.getTime());
// System.out.println("today date="+today);

                                int ijCount = 0;
                                int iFlag = 0;

                                Connection cn = null;
                                ResultSet rss = null;
                                Statement stt = null;
                                try {
                                    con = ConnectionManager.getConnectionDirectForMySQL();
                                    st = con.createStatement();
                                    for (int i = 0; i < instList.size(); i++) {
                                        String sql = "select * from egs_ss_basic a join egs_ss_data b on a.token=b.token where inst_id='" + instList.get(i) + "' ";
                                        rs = st.executeQuery(sql);
                                        while (rs.next()) {
                                            iFlag = 1;
                                        }
                                    }
                                } catch (Exception gv) {
                                    gv.printStackTrace();
                                }

                                if (iFlag == 1) {

                                    String submitDate1 = "";
                                    String userEmail = "";
                                    try {
                                        con = ConnectionManager.getConnectionDirectForMySQL();
                                        st = con.createStatement();
                                        for (int i = 0; i < instList.size(); i++) {
                                            String sql = "select * from egs_ss_basic a join egs_ss_data b on a.token=b.token where inst_id='" + instList.get(i) + "' ";
                                            rs = st.executeQuery(sql);
                                            while (rs.next()) {
                                                ijCount = ijCount + 1;
                                                submitDate = rs.getString("time");
                                                int token = rs.getInt("a.token");
                                                userEmail = rs.getString("a.email");
                                                try {

                                                    c.setTime(dateFormat.parse(submitDate));
                                                } catch (ParseException e) {
                                                    e.printStackTrace();
                                                }
                                                c.add(Calendar.DAY_OF_MONTH, 30);
                                                String finalDate = dateFormat.format(c.getTime());
                                                int resultFound = 0;
                                                int iTransfer = 0;
                                                try {
                                                    cn = ConnectionManager.getConnectionDirectForMySQL();
                                                    stt = cn.createStatement();
                                                    String query1 = "select * from egs_ss_file where token='" + token + "' and replyType='Reply'";
                                                    rss = stt.executeQuery(query1);
                                                    while (rss.next()) {
                                                        resultFound = 1;
                                                    }

                                                } catch (Exception ee) {
                                                    ee.printStackTrace();
                                                }

                                                System.out.println("==Final Reply Found==" + resultFound);
                                                try {
                                                    cn = ConnectionManager.getConnectionDirectForMySQL();
                                                    stt = cn.createStatement();
                                                    String query1 = "select * from egs_ss_transfertohq where userEmail='" + userEmail + "'";
                                                    rss = stt.executeQuery(query1);
                                                    while (rss.next()) {
                                                        iTransfer = 1;
                                                    }

                                                } catch (Exception ee) {
                                                    ee.printStackTrace();
                                                }
                                                cn.close();

                                                String grievance_submit_date = (rs.getString("a.time")).substring(0, 11);

                                                System.out.println("Date after addition=" + finalDate);
                                                if (cc.getTime().before(c.getTime()) || cc.getTime().equals(c.getTime())) {

                            %>
                            <tr id="trdata">
                                <td class="mainData"><%=ijCount%>.</td>
                                <td class="mainData"><a href="egs_ss_Adminview.jsp?nnMQFds495dS6fhXxQjd=<%=rs.getString("a.token")%>&vax=<%=rs.getString("a.email")%>"><%=rs.getString("a.name").toUpperCase()%></a></td>
                                <td class="mainData"><%=rs.getString("a.curr_posting")%></td>
                                <td class="mainData"><%=rs.getString("a.designation")%></td>
                                <td class="mainData"><%=rs.getString("a.category")%></td>

                                <%
                                    if (resultFound == 0) {
                                        if (iTransfer == 0) {
                                %>
                                <td class="mainData" style=" color: blue;">Active ( <%=grievance_submit_date%> )</td>
                                <%
                                } else {
                                %>
                                <td class="mainData" style=" color: red;">Transferred to HQ ( <%=grievance_submit_date%> )</td>
                                <%
                                    }
                                } else {
                                %>
                                <td class="mainData" style=" color: green;">Done. ( <%=grievance_submit_date%> )</td>
                                <%
                                    }
                                %>
                            </tr>

                            <%
                            } else {
                            %>
                            <tr id="trdata">
                                <td class="mainData"><%=ijCount%>.</td>
                                <td class="mainData"><%=rs.getString("a.name").toUpperCase()%></td>
                                <td class="mainData"><%=rs.getString("a.curr_posting")%></td>
                                <td class="mainData"><%=rs.getString("a.designation")%></td>
                                <td class="mainData"><%=rs.getString("a.category")%></td>
                                <td class="mainData" style="color: red;">Expired ( <%=grievance_submit_date%> )</td>
                            </tr>

                            <%
                                            }

                                        }

                                    }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                            } else {

                            %>

                            <tr id="trdata">
                                <td colspan="6" align="center" style=" font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 14px; color: red; padding-top: 25px;">
                                    No grievance found from Secretarial staff .
                                </td>

                            </tr>
                            <%}%>
                        </table>


                    </div>
                </td>
            </tr>
        </table>

    </body>
    <%

    } else {
    %>
    <jsp:forward page="EIS_adError.jsp" />
    <%}%>
</html>
