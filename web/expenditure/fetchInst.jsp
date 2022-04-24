<%-- 
    Document   : fetchInst
    Created on : 4 Mar, 2022, 11:20:15 AM
    Author     : msme
--%>


<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%
    String pao_name = request.getParameter("pao_name");
    String years = (String) session.getAttribute("CmbYear");
    String buffer = "<select class='branchName selectdiv' name='branchName' id='branchName' index='2' onchange='InsertBranchName(this)'><option value=''>select institute</option>";
    Connection con11 = null;
    ResultSet rs11 = null;
    String sql="";
    int j = 0;
    try {
        con11 = ConnectionManager.getConnectionDirectForMySQL();
        Statement stmt11 = con11.createStatement();
        sql = "Select Inst_id, inst_type, inst_name from pao_branches where pao_name='" + pao_name + "' and inst_id not in (select inst_id from tbl_ba_fundallocation where YEARS='" + years + "') and isDisplay='1' order by inst_type asc";
        rs11 = stmt11.executeQuery(sql);
        while (rs11.next()) {
            j = j + 1;
            buffer = buffer + "<option value='" + rs11.getString("Inst_id") + "'>" + j + "&nbsp;-&nbsp;" + rs11.getString("inst_type") + " " + rs11.getString("inst_name") + "</option>";

        }
//        if (years.equals("2021-2022") && pao_name.equals("New Delhi")) {
//            buffer = buffer + "<option value='b29'>" + (j+1) + "&nbsp;-&nbsp;BrMSME-DI Balsahayog</option>";
//        }
        con11.close();
        buffer = buffer + "</select>";
        response.getWriter().println(buffer);
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>

