<%-- 
    Document   : EIS_login_check
    Created on : Dec 30, 2017, 4:40:18 PM
    Author     : Admin
--%>

<%@page import="java.net.UnknownHostException"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <%
            String username = request.getParameter("user");
            String pass = request.getParameter("password");


            String captcha = (String) session.getAttribute("key");
            request.setCharacterEncoding("UTF-8");
            String answer = request.getParameter("answer");




            int LoginFlag = 0;
            if (captcha.equals(answer)) {

                String nmm = "0x6a09e667f3bcc908";
                

                int flag = 0;
                PreparedStatement psmt = null;
                Connection con1 = null;
                ResultSet rs1 = null;
                Statement stmt1 = null;
                int CheckStatus = 0;
                int CheckStatus_In_EisRegister_table = 0;
                int result = 0;
                try {
                    con1 = ConnectionManager.getConnectionDirectForMySQL();
                    stmt1 = con1.createStatement();
                } catch (SQLException sql) {
                    System.out.println("There is some issue while creating connecion ====" + sql.getMessage());
                }




                try {
                    String check_query = "Select * from eis_updated_user_gov_mail where gov_email='" + username + "' ";
                    rs1 = stmt1.executeQuery(check_query);

                    if (rs1.next()) {

                        CheckStatus = 1;
                        System.out.println("Record already exist!!==" + CheckStatus);
                    }
                } catch (Exception e) {
                    System.out.println("There is some issue while we fetching data from eis_updated_user_gov_mail");
                    e.printStackTrace();
                }

                if (CheckStatus == 0) {

                    try {
                        String check_query = "Select * from eis_register where email='" + username + "' ";
                        rs1 = stmt1.executeQuery(check_query);
                        if (rs1.next()) {
                            CheckStatus_In_EisRegister_table = 1;
                            System.out.println("Record found in eis_register!!");
                        }
                    } catch (Exception e) {
                        System.out.println("There is some issue while we fetching data from eis_register while Checkstatus is 0");
                        e.printStackTrace();
                    }
                } else {
                }

                System.out.println("Data in eis_updated_user_gov_mail=" + CheckStatus + " and data in eis_register=" + CheckStatus_In_EisRegister_table);

                if (CheckStatus_In_EisRegister_table == 1 && CheckStatus == 0) {
                    System.out.println("Data to be updated from eis_register to eis_updated_user_gov_mail!!");
                    int token = 0;
                    String name = "";
                    String designation = "";
                    String current_office = "";
                    String password = "";
                    String en_password = "";
                    String mobile = "";
                    String dob = "";

                    String timeOfUpdate;

                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                    java.util.Date date = new java.util.Date();
                    timeOfUpdate = dateFormat.format(date);

                    
                    String ip_address =  request.getRemoteAddr();
                    System.out.println("IP Address :- " + ip_address);
                    
                    
                    String oldEmail = username;
                    String confirm_gov_email = username;
                    


                    try {

                        String sql1 = "SELECT * FROM eis_register where email='" + username + "' ;";
                        rs1 = stmt1.executeQuery(sql1);
                        while (rs1.next()) {
                            if (username.equals(rs1.getString("email")) && pass.equals(rs1.getString("password"))) {
                                flag = 1;
                                System.out.println("Record have found");
                                token = rs1.getInt("token");
                                name = rs1.getString("name");
                                designation = rs1.getString("designation");
                                current_office = rs1.getString("curnt_ofc");
                                password = rs1.getString("password");
                                en_password = password;
                                mobile = rs1.getString("mobile");
                                dob = rs1.getString("dob");
                            }
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    System.out.println(token);
                    System.out.println(name);
                    System.out.println(designation);
                    System.out.println(current_office);
                    System.out.println(oldEmail);
                    System.out.println(confirm_gov_email);
                    System.out.println(password);
                    System.out.println(en_password);
                    System.out.println(mobile);
                    System.out.println(dob);
                    System.out.println(timeOfUpdate);
                    System.out.println(ip_address);
                    System.out.println("flag=" + flag);

                    if (flag == 1) {
                        try {
                            String sql = "insert into eis_updated_user_gov_mail (token, name, designation, current_office, old_email, gov_email, password, en_password, mobile, dob, time, "
                                    + "ip, isDisplay, isDelete, remark) values( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                            psmt = (PreparedStatement) con1.prepareStatement(sql);

                            psmt.setInt(1, token);
                            psmt.setString(2, name);
                            psmt.setString(3, designation);
                            psmt.setString(4, current_office);
                            psmt.setString(5, oldEmail);
                            psmt.setString(6, confirm_gov_email);
                            psmt.setString(7, password);
                            psmt.setString(8, en_password);
                            psmt.setString(9, mobile);
                            psmt.setString(10, dob);
                            psmt.setString(11, timeOfUpdate);
                            psmt.setString(12, ip_address);
                            psmt.setString(13, "1");
                            psmt.setString(14, "0");
                            psmt.setString(15, "inserting new record from eis_register");

                            result = psmt.executeUpdate();
                            con1.commit();
                            System.out.println("record has been updated in eis_updated_user_gov_mail for " + confirm_gov_email);
                            session.setAttribute("nmm", nmm);
                            session.setAttribute("username", username);
        %>
        <jsp:forward page="eis_forms/registration_details.jsp" /> 
        <%

            } catch (Exception err1) {
                err1.printStackTrace();
            }
        } else {
            System.out.println("we are going on error page");

        %>
        <jsp:forward page="EIS_error.jsp?val=<%=nmm%>" />
        <%
                }
            } else if (CheckStatus == 1) {
                try {
                    String check_query = "Select * from eis_updated_user_gov_mail where gov_email='" + username + "' and isDisplay=1";
                    rs1 = stmt1.executeQuery(check_query);
                    while (rs1.next()) {
                        if (rs1.getString("gov_email").equals(username) && rs1.getString("password").equals(pass)) {
                            LoginFlag = 1;
                            System.out.println("Record found!!");
                            
                            session.setAttribute("nmm", nmm);
                            session.setAttribute("username", username);
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (LoginFlag == 1) {
        %>

        <jsp:forward page="eis_forms/registration_details.jsp" /> 
        <%} else {
        %>
        <jsp:forward page="EIS_error.jsp?val=<%=nmm%>" />

        <%}

            if (con1 != null) {
                con1.close();
            }
            if (rs1 != null) {
                rs1.close();
            }
            if (stmt1 != null) {
                stmt1.close();
            }
            if (psmt != null) {
                psmt.close();
            }

        } else {
        %>
        <jsp:forward page="EIS_login.jsp" />
        <%     }
        %>  

        <%


        %>
    </body>
</html>
