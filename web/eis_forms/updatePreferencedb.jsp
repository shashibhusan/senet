<%-- 
    Document   : updatePreferencedb
    Created on : 14 Jan, 2022, 12:14:32 PM
    Author     : rgvje
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, common.*" %>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update preferences</title>
        <style>
            #mainDiv
            {
                width: 90%;
                margin: auto;
                padding: 6px;
                background-color: #ecfaeb;
                border: 1px #006600 solid;
                color: #009900;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }

            #mainDivError
            {
                width: 90%;
                margin: auto;
                padding: 6px;
                background-color: #FFF8F8;
                border: 1px #CB0000 solid;
                color: #CB0000;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
        </style> 
    </head>
    <body>
        <%

            String emp_email = (String) session.getAttribute("emp_email");
            int token = Integer.parseInt((String) session.getAttribute("token"));
            String buffer = "current posting inserted successfully";

            String pref_1 = request.getParameter("prefone");
            String pref_2 = request.getParameter("preftwo");
            String pref_3 = request.getParameter("prefthree");
            String pref_reason = request.getParameter("reasonForPreference");

            System.out.println("//" + pref_1 + "//" + pref_2 + "//" + pref_3 + "//" + pref_reason + "//" + emp_email + "//" + token + "//");

            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            int updatedInfo = 0;
            int updatedInfoBackup = 0;

            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date = new Date();
            String time = dateFormat.format(date);

            int updateResult = 0;

            try {
                con = ConnectionManager.getConnectionDirectForMySQL();
                stmt = con.createStatement();
                System.out.println("connection=" + con);
            } catch (Exception conError) {
                conError.printStackTrace();
            }


            try {
                String old_pref_1 = "";
                String old_pref_2 = "";
                String old_pref_3 = "";
                String old_pref_reason = "";
                int dataFlag = 0;
                String getOldDetails = "select * from eis_postinginfo where email='" + emp_email + "'";
                rs = stmt.executeQuery(getOldDetails);
                if (rs.next()) {
                    dataFlag = 1;
                }
                if (dataFlag == 1) {
                    rs.beforeFirst();
                    while (rs.next()) {
                        old_pref_1 = rs.getString("pst_pref_1");
                        old_pref_2 = rs.getString("pst_pref_2");
                        old_pref_3 = rs.getString("pst_pref_3");
                        old_pref_reason = rs.getString("your_spl_pref");
                    }
                }


                try {
                    String query = "insert into eis_old_posting_preference (token, email, pref_1, pref_2, pref_3, preference_reason, time, isDisplay, isDelete) values (?,?,?,?,?,?,?,?,?)";


                    PreparedStatement psmt1 = (PreparedStatement) con.prepareStatement(query);

                    psmt1.setInt(1, token);
                    psmt1.setString(2, emp_email);
                    psmt1.setString(3, old_pref_1);
                    psmt1.setString(4, old_pref_2);
                    psmt1.setString(5, old_pref_3);
                    psmt1.setString(6, old_pref_reason);
                    psmt1.setString(7, time);
                    psmt1.setString(8, "1");
                    psmt1.setString(9, "0");

                    updatedInfo = psmt1.executeUpdate();
                    con.commit();
                    if (updatedInfo > 0) {
                        System.out.println("old data is inserted into eis_old_posting_preference  by :" + emp_email);

                    }
                } catch (Exception insertError) {
                    insertError.printStackTrace();
                }

            } catch (Exception error) {
                error.printStackTrace();
            }

            if (updatedInfo > 0) {
                try {
                    String sql = "update eis_postinginfo set pst_pref_1=?, pst_pref_2=?, pst_pref_3=?, your_spl_pref=?, time_of_update_preferences=? where email=?";

                    PreparedStatement psmt = (PreparedStatement) con.prepareStatement(sql);
                    psmt.setString(1, pref_1);
                    psmt.setString(2, pref_2);
                    psmt.setString(3, pref_3);
                    psmt.setString(4, pref_reason);
                    psmt.setString(5, time);
                    psmt.setString(6, emp_email);

                    updateResult = psmt.executeUpdate();
                    con.commit();
                } catch (Exception error) {
                    error.printStackTrace();
                    System.out.println("error we get1111=" + error.getMessage());
                }
            } else {
                System.out.println("There is some technical issue while inserting old posting preferences into eis_old_posting_preference");
            }


            if (updateResult > 0) {
                String isDelete = "0";
                String isDisplay = "1";

                String updated_data = "posting_pref_1,posting_pref_2,posting_pref_3,posting_pref_reason, time when posting preference updated";

                String updated_table_name = "eis_postinginfo";

                String action_taken = "update posting preferences details";


                String query = "insert into eis_data_update_info (token, email, time, updated_data, updated_table_name, isDisplay, isDelete, action_taken) values (?,?,?,?,?,?,?,?)";


                PreparedStatement psmt1 = (PreparedStatement) con.prepareStatement(query);

                psmt1.setInt(1, token);
                psmt1.setString(2, emp_email);
                psmt1.setString(3, time);
                psmt1.setString(4, updated_data);
                psmt1.setString(5, updated_table_name);
                psmt1.setString(6, isDisplay);
                psmt1.setString(7, isDelete);
                psmt1.setString(8, action_taken);

                updatedInfoBackup = psmt1.executeUpdate();
                con.commit();
                if (updatedInfoBackup > 0) {
                    System.out.println("data is updated on the eis_postinginfo and eis_data_update_info by :" + emp_email);

                }
            }
            if (updateResult > 0 && updatedInfo > 0 && updatedInfoBackup > 0) {
        %>
        <br/>
        <br/>
        <br/>
        <div id="mainDiv">

            Posting preferences updated successfully.

        </div>

        <%} else {%>
    <body>
        <br/>
        <br/>
        <br/>
        <div id="mainDivError">

            There are some technical issue while updating your posting preference. Please try again or contact to administrator.

        </div>
        <%}

        %>
    </body>

    <%
        if (con != null) {
            con.close();
        }
        if (rs != null) {
            rs.close();
        }
        if (stmt != null) {
            stmt.close();
        }
    %>

</html>
