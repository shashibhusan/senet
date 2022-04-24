<%-- 
    Document   : updateBasic
    Created on : 22 Mar, 2021, 11:21:05 PM
    Author     : rgvje
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="common.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>update details</title>
           <style>
            .success
            {
                font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color: green;
                text-align: center;
            }
            .fail
            {
                font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color: red;
                text-align: center;
            }
        </style>
    </head>
    <body>
       <%
           String email = (String)session.getAttribute("emp_email");
            String token = (String)session.getAttribute("token");
            
            String uCurrentPayLevel=request.getParameter("uCurrentPayLevel");
            String uDateOfAppointmentPrPost=request.getParameter("uDateOfAppointmentPrPost");
            String uSubstantivepayLevel=request.getParameter("uSubstantivepayLevel");
            
            Connection con=null;
            ResultSet rs=null;
            Statement st=null;
            int flag=0;
            
            try
            {
                con=ConnectionManager.getConnectionDirectForMySQL();
                String sql="update eis_basicinfo set CrPayLevel=?, aptPrPost=?, payLevelSub=? where email=?";
                PreparedStatement psmt = (PreparedStatement)con.prepareStatement(sql);
                psmt.setString(1, uCurrentPayLevel);
                psmt.setString(2, uDateOfAppointmentPrPost);
                psmt.setString(3, uSubstantivepayLevel);
                psmt.setString(4, email);
                flag=psmt.executeUpdate();
                con.commit();
                con.close();
            }
            catch(Exception err)
            {
                err.printStackTrace();
            }
            
            if(flag>0)
            {
       %>
       <table>
          <tr>
              <td class="success">
                  Your basic details has been updated successfully.
              </td>
          </tr>
      </table>
       <%}else
            {%>
            
            <table>
          <tr>
              <td class="fail">
                  Your basic details has been updated successfully.
              </td>
          </tr>
      </table>
       <%}%>
    </body>
</html>
