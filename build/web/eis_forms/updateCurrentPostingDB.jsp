
<%-- 
    Document   : updateCurrentPostingDB
    Created on : 19 Mar, 2021, 4:56:17 PM
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

    <%
        String OfficeName = request.getParameter("office_cr");
        String designation = request.getParameter("post_cr");
        String mode = request.getParameter("mode");
        String dateFrom = request.getParameter("joiningDateCurrentOfc");
        String emp_email = (String) session.getAttribute("emp_email");
        int token = Integer.parseInt((String) session.getAttribute("token"));
        String buffer = "current posting inserted successfully";

    //    String pref_1=request.getParameter("prefone");
    //    String pref_2=request.getParameter("preftwo");
    //    String pref_3=request.getParameter("prefthree");
    //    String pref_reason=request.getParameter("reasonForPreference");

        System.out.println("//" + OfficeName + "//" + designation + "//" + mode + "//" + dateFrom + "//" + emp_email + "//" + token + "//");

        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        int updatedInfo = 0;

        int updateResult = 0;

        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        String time = dateFormat.format(date);

        try {
            con = ConnectionManager.getConnectionDirectForMySQL();
            stmt = con.createStatement();
            System.out.println("connection=" + con);

            String sql = "update eis_postinginfo set state=?, curr_despln=?, cur_ofctype=?, curr_doj=?, time_of_update_posting_details=? where email=?";

            PreparedStatement psmt = (PreparedStatement) con.prepareStatement(sql);
            psmt.setString(1, OfficeName);
            psmt.setString(2, designation);
            psmt.setString(3, mode);
            psmt.setString(4, dateFrom);
            psmt.setString(5, time);
            psmt.setString(6, emp_email);

            updateResult = psmt.executeUpdate();
            con.commit();
        } catch (Exception error) {
            error.printStackTrace();
            System.out.println("error we get1111=" + error.getMessage());
        }


        if (updateResult > 0) {
            String isDelete = "0";
            String isDisplay = "1";

            String updated_data = "current_office,current_designation,mode,current_doj";

            String updated_table_name = "eis_postinginfo";

            String action_taken = "update current posting details";


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
            con.close();
            if (updatedInfo > 0) {
                System.out.println("data is updated on the eis_postinginfo and eis_data_update_info by :" + emp_email);

            }
        }

        String sql1 = "update eis_postinginfo_new set designation=?, curr_ofc=? where email=?";


    //       PreparedStatement psmt2=(PreparedStatement) con.prepareStatement(sql1);
    //       psmt2.setString(1, designation);
    //       psmt2.setString(2, OfficeName);
    //       psmt2.setString(3, emp_email);
    //
    //       updateResult=psmt2.executeUpdate();
    //       con.commit();
    //       con.close();
    //       int ut=psmt2.executeUpdate();
    //       if(ut>0)
    //       {
    //           System.out.println("eis_postinginfo_new updated current office and designation :"+emp_email);
    //       }
    //       
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
    <%}
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
