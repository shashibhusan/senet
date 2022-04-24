<%-- 
    Document   : finalsubmit
    Created on : 19 Mar, 2021, 1:28:48 PM
    Author     : msme
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="common.*" %>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Submit</title>
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
         String crosssite = (String)session.getAttribute("crosssite");
        session.setAttribute("crosssite", crosssite);
        
     //   System.out.println("session value on updatepostpref page = " +crosssite);
        
        if(!crosssite.equals(null))
        {
        String email=request.getParameter("email");
        String token=(String)session.getAttribute("token");
        
    %>
    <body>
      <%
        Connection con=null;
        ResultSet rs=null;
        Statement st=null;
        
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        String time = dateFormat.format(date);
        
        try
        {
            con=ConnectionManager.getConnectionDirectForMySQL();
        }
        catch(Exception err)
        {
            err.printStackTrace();
        }
        
        String sql="insert into eis_final_submit_report (email,time,isDisplay,isDelete,submitflag) value (?,?,?,?,?)";
        PreparedStatement psmt=(PreparedStatement)con.prepareStatement(sql);
        psmt.setString(1, email);
        psmt.setString(2, time);
        psmt.setString(3, "1");
        psmt.setString(4, "0");
        psmt.setString(5, "1");
        
        int result=psmt.executeUpdate();
        con.commit();
        
        if(result>0)
        {
            System.out.println("Final Submit done for="+email);
            
                        String updated_data = "group, hometown_state_name, hometown_details, served_at_hometown_details, served_at_ner_details";
                        int token1 = Integer.parseInt(token);

                        String updated_table_name = "eis_final_submit_report";
                        
                        String isDisplay="1";
                        String isDelete="0";

                        String action_taken="insert";
                        
                        


                        String query = "insert into eis_data_update_info (token, email, time, updated_data, updated_table_name, isDisplay, isDelete, action_taken) values (?,?,?,?,?,?,?,?)";

                        PreparedStatement psmt1 = (PreparedStatement) con.prepareStatement(query);

                        psmt1.setInt(1, token1);
                        psmt1.setString(2, email);
                        psmt1.setString(3, time);
                        psmt1.setString(4, updated_data);
                        psmt1.setString(5, updated_table_name);
                        psmt1.setString(6, isDisplay);
                        psmt1.setString(7, isDelete);
                        psmt1.setString(8, action_taken);

                         int updatedInfo = psmt1.executeUpdate();
                        con.commit();
                        con.close();
                        if (updatedInfo > 0) {
                            System.out.println("data is updated on the eis_final_submit_report and eis_data_update_info by :" + email);

                        }
            %>
                <br/>
                <br/>
                <br/>
                <div id="mainDiv">

                    Your final submit has been done successfully.

                </div>
            <%
        }
      %>
    </body>
    <%
       
        }
        else {
    response.sendRedirect("stat.jsp");
}
    %>
</html>
