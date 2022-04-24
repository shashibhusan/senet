<%-- 
    Document   : updatePostingHistoryMain
    Created on : 9 Mar, 2021, 2:01:56 PM
    Author     : msme
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, common.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Random" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<%
    String OfficeName=request.getParameter("ofcn");
    String designation=request.getParameter("desig");
    String mode=request.getParameter("md");
    String dateFrom=request.getParameter("jdate");
    String dateTo=request.getParameter("rdate");
    String emp_email = (String)session.getAttribute("emp_email");
    
    
    int token = Integer.parseInt((String)session.getAttribute("token"));
    
    String buffer="posting history inserted successfully";
    System.out.println("/"+OfficeName+"/"+designation+"/"+mode+"/"+dateFrom+"/"+dateTo+"/"+emp_email);
    
    ResultSet rs=null;
    Connection con=null;
    Statement st=null;
    PreparedStatement psmt=null;
    int result=0;
    
    try
    {
        con=ConnectionManager.getConnectionDirectForMySQL();
    }
    catch(Exception error)
    {
        error.printStackTrace();
        System.out.println("error is="+error.getMessage());
    }
    String sql="insert into eis_posthistory (email,officeName,designation,phmode,phfrom,phto) values (?,?,?,?,?,?)";
    psmt=(PreparedStatement)con.prepareStatement(sql);
    psmt.setString(1, emp_email);
    psmt.setString(2, OfficeName);
    psmt.setString(3, designation);
    psmt.setString(4, mode);
    psmt.setString(5, dateFrom);
    psmt.setString(6, dateTo);
    
    result=psmt.executeUpdate();
    con.commit();
    
    if(result>0)
    {
        String isDelete = "0";
            String isDisplay = "1";
            
            String updated_data="officeName,designation,mode,date-from,date-to";
            
            String updated_table_name="eis_posthistory";
            
            String action_taken="insert";

            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date = new Date();
            String time = dateFormat.format(date);
            String query = "insert into eis_data_update_info (token, email, time, updated_data, updated_table_name, isDisplay, isDelete, action_taken) values (?,?,?,?,?,?,?,?)";
            
            PreparedStatement psmt1=(PreparedStatement) con.prepareStatement(query);
            
            psmt1.setInt(1, token);
            psmt1.setString(2, emp_email);
            psmt1.setString(3, time);
            psmt1.setString(4, updated_data);
            psmt1.setString(5, updated_table_name);
            psmt1.setString(6, isDisplay);
            psmt1.setString(7, isDelete);
            psmt1.setString(8, action_taken);
            
            int updatedInfo=psmt1.executeUpdate();
            con.commit();
            con.close();
            if(updatedInfo>0)
            {
                System.out.println("data is updated on the eis_postinginfo and eis_data_update_info by :"+emp_email);
                
            }
    System.out.println("1 row inserted");
    response.getWriter().println(buffer);
    
    }
%>