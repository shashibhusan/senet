<%-- 
    Document   : updatepass
    Created on : 22 Mar, 2021, 5:12:33 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="common.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .success
            {
                font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color: green;
                text-align: center;
            }
            .success
            {
                font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color: red;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%
            String pass = request.getParameter("password");

            String email = (String) session.getAttribute("email");
            
            response.setHeader("Cache-Control", "no-cache");
                response.setHeader("Cache-Control", "no-store");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);

            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

            int data_check_flag = 0;
            int result = 0;
            int isUpdated = 0;

            try {
                con = ConnectionManager.getConnectionDirectForMySQL();
                st = con.createStatement();
                String sql = "select * from eis_updated_user_gov_mail where old_email='" + email + "'";
                rs = st.executeQuery(sql);
                con.commit();
                if (rs.next()) {
                    data_check_flag = 1;
                }
            } catch (Exception er) {
                er.printStackTrace();
            }
            if (data_check_flag == 1) {
                PreparedStatement psmt = (PreparedStatement) con.prepareCall("update eis_updated_user_gov_mail set password=?,en_password=? where gov_email=?");
                psmt.setString(1, pass);
                psmt.setString(2, pass);
                psmt.setString(3, email);
                isUpdated = psmt.executeUpdate();
                con.commit();
                if (isUpdated > 0) {
                    System.out.println("Password updated in eis_updated_user_gov_mail");
                } else {
                    System.out.println("there is some technical problem while Password updated in eis_updated_user_gov_mail");
                }
            } else {
                try {
                    PreparedStatement psmt = (PreparedStatement) con.prepareCall("update eis_register set password=? where email=?");
                    psmt.setString(1, pass);
                    psmt.setString(2, email);

                    result = psmt.executeUpdate();
                    con.commit();
                    con.close();
                } catch (Exception err) {
                    err.printStackTrace();
                }
            }
        %>
        <%
            if (result > 0 || isUpdated > 0) {
        %>
        <table>
            <tr>
                <td class="success">
                    Your password has been updated successfully.
                </td>
            </tr>
            <tr>
                <td class="success">
                    Please login <a href="../EIS_login.jsp">click here</a>.
                </td>
            </tr>
        </table>
        <%      } else {
        %>
        <table>
            <tr>
                <td class="fail">
                    Your password has not been updated successfully. There is some technical problem . Please try again later or mail to : <a href="mailto:eis.dcmsme@gmail.com">eis.dcmsme@gmail.com</a>.
                </td>
            </tr>
            <tr>
                <td class="fail">
                    Click <a href="../EIS_login.jsp">here</a> to try again.
                </td>
            </tr>
        </table>
        <%          }
        %>
    </body>
</html>
