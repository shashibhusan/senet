<%-- 
    Document   : updateCurrentPosting
    Created on : 9 Mar, 2021, 4:56:17 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, common.*" %>
<%@page import="java.util.Random" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            #mainDiv
            {
                width: 90%;
                margin: auto;
                padding: 6px;
                background-color: #ecfaeb;
                border: 1px #006600 solid;
                color: #009900;
                border-radius: 3px;
            }
        </style> 
    </head>

    <%

        System.out.println("post info working==========");
        String OfficeName = request.getParameter("office_cr");
        String designation = request.getParameter("post_cr");
        String mode = request.getParameter("mode");
        String dateFrom = request.getParameter("joiningDateCurrentOfc");

        String post_pref_1 = request.getParameter("prefone");
        String post_pref_2 = request.getParameter("preftwo");
        String post_pref_3 = request.getParameter("prefthree");
        String reason_for_pref = request.getParameter("reasonForPreference");
        String name = (String) session.getAttribute("name");


        String emp_email = (String) session.getAttribute("emp_email");
        String token1 = (String) session.getAttribute("token");
        int token = Integer.parseInt(token1);
        String buffer = "current posting inserted successfully";


        System.out.println("//" + OfficeName + "//" + designation + "//" + mode + "//" + dateFrom + "//" + emp_email + "//" + token + "//" + post_pref_1 + "//" + post_pref_2 + "//" + post_pref_3 + "//" + reason_for_pref);

        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        int updateResult = 0;
        int updatedInfo = 0;

        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        String time = dateFormat.format(date);

        try {
            con = ConnectionManager.getConnectionDirectForMySQL();
            stmt = con.createStatement();

        } catch (Exception error) {
            error.printStackTrace();
            System.out.println("error we get=" + error.getMessage());
        }

        String sql = "insert into eis_postinginfo (email,cur_ofctype,state,curr_despln,curr_doj,pst_pref_1,pst_pref_2,pst_pref_3,your_spl_pref,time_of_update_preferences,time_of_update_posting_details) values(?,?,?,?,?,?,?,?,?,?,?)";

        PreparedStatement psmt = (PreparedStatement) con.prepareStatement(sql);
        psmt.setString(1, emp_email);
        psmt.setString(2, mode);
        psmt.setString(3, OfficeName);
        psmt.setString(4, designation);
        psmt.setString(5, dateFrom);
        psmt.setString(6, post_pref_1);
        psmt.setString(7, post_pref_2);
        psmt.setString(8, post_pref_3);
        psmt.setString(9, reason_for_pref);
        psmt.setString(10, time);
        psmt.setString(11, time);

        updateResult = psmt.executeUpdate();
        con.commit();



        if (updateResult > 0) {

            String isDelete = "0";
            String isDisplay = "1";

            String updated_data = "new row insert for new user";

            String updated_table_name = "eis_postinginfo";

            String action_taken = "insert";


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

            updatedInfo = psmt1.executeUpdate();
            con.commit();
            if (updatedInfo > 0) {
                System.out.println("data is updated on the eis_postinginfo and eis_data_update_info by :" + emp_email);

            }
        }




        if (updatedInfo > 0) {

    %>
    <body>
        <br/>
        <br/>
        <br/>
        <div id="mainDiv">

            Details have been updated successfully.

        </div>
    </body>
    <%} else {%>
    <body>
        <br/>
        <br/>
        <br/>
        <div id="mainDivError">

            There are some technical issue while updating your details. Please try again or contact to administrator.

        </div>
    </body>

    <%    }
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