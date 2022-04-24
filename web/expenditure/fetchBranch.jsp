<%-- 
    Document   : fetchBranch
    Created on : 4 Mar, 2022, 12:40:50 PM
    Author     : msme
--%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%
    String inst_id = request.getParameter("inst_id");
    String years = (String) session.getAttribute("CmbYear");
    String buffer = "";
    Connection con11 = null;
    ResultSet rs11 = null;
    String sql="";
    int j = 0;
    try {
        con11 = ConnectionManager.getConnectionDirectForMySQL();
        Statement stmt11 = con11.createStatement();
        if(!years.equals("2021-2022"))
        {
        sql = "Select Inst_id, inst_type, inst_name from pao_branches where Inst_id='" + inst_id + "'";
        }else
        {
            sql = "Select Inst_id, inst_type, inst_name from pao_branches where Inst_id='" + inst_id + "'";
        }
        System.out.println(sql);
        rs11 = stmt11.executeQuery(sql);
        while (rs11.next()) {
           buffer=buffer+rs11.getString("inst_type")+" "+rs11.getString("inst_name");
        }
        con11.close();
        response.getWriter().println(buffer);
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>