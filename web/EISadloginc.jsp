<%-- 
    Document   : EISadloginc
    Created on : Feb 13, 2018, 3:35:42 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,common.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
    String user = request.getParameter("user");
    String pass = request.getParameter("pass");

    String captcha = (String) session.getAttribute("key");
    request.setCharacterEncoding("UTF-8");
    String answer = request.getParameter("answer");
    if (captcha.equals(answer)) {

        String nmm = "0x6a09e667f3bcc908";
        session.setAttribute("Session", nmm);
        session.setAttribute("username", user);
        System.out.println("we get //" + user + "//" + pass);

        Connection con1 = null;
        ResultSet rs1 = null;
        Statement stmt1 = null;
        int result = 0;
        try {
            con1 = ConnectionManager.getConnectionDirectForMySQL();
            stmt1 = con1.createStatement();
            String Query = "select * from eis_admin where username='" + user + "' ";
            rs1 = stmt1.executeQuery(Query);
            while (rs1.next()) {
                if (user.equals(rs1.getString("username")) && pass.equals(rs1.getString("password"))) {
                    result++;
                }
            }
        } catch (Exception ee) {
            ee.printStackTrace();
        }


        if (result > 0) {

            try {
                stmt1 = con1.createStatement();
                String sql = "select * from eis_admin where username='" + user + "'";
                rs1 = stmt1.executeQuery(sql);
                System.out.println(sql);
                while (rs1.next()) {
                    if (user.equals(rs1.getString("username")) && pass.equals(rs1.getString("password")) && rs1.getString("role").equals("SU")) {
                        System.out.println("record have found" + rs1.getString("username"));
%>
<jsp:forward page="EIS_dataoneis.jsp?val=<%=nmm%>" />
<%
} else if (user.equals(rs1.getString("username")) && pass.equals(rs1.getString("password")) && rs1.getString("role").equals("AU")) {
    System.out.println("record have found");
%>
<jsp:forward page="EIS_aduser.jsp?val=<%=nmm%>" />
<%
            }

        }
        con1.close();
    } catch (Exception ex) {
        ex.printStackTrace();
    }
} else {
    System.out.println("record have not found");
%>
<jsp:forward page="EIS_adError.jsp?val=<%=nmm%>" />

<%
    }
} else {
%>
<jsp:forward page="EIS_Admin.jsp" />
<%     }
%>
