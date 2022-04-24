<%-- 
    Document   : updateTrainingMain
    Created on : 21 Nov, 2019, 3:45:33 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="common.*, java.sql.*" %>
<!DOCTYPE html>
<%
    
    String buffer="";
    String emp_email = (String)session.getAttribute("emp_email");
    String TrainingName=request.getParameter("tn");
    String TrainingFrom=request.getParameter("df");
    String TrainingTo=request.getParameter("dt");
    
    System.out.println("We get the data for upload is==="+TrainingName+"===="+TrainingFrom+"===="+TrainingTo);
    
    ResultSet rs=null;
    Connection con=null;
    Statement st=null;
    int resultSet=0;
    int sno=0;
     
    
    try
    {
        con=ConnectionManager.getConnectionDirectForMySQL();
        st=con.createStatement();
        
    }catch(Exception er)
    {
        er.printStackTrace();
    }
   
    
    
    try
    {
        PreparedStatement stmt = (PreparedStatement) con.prepareStatement("insert into eis_trainingcompleted (email,trainingName,tcFrom,tcTo) values (?,?,?,?)");        
        stmt.setString(1, emp_email);
        stmt.setString(2, TrainingName);
        stmt.setString(3, TrainingFrom);
        stmt.setString(4, TrainingTo);
        resultSet=stmt.executeUpdate();
        
        System.out.println("we are inserting data in eis_trainingdetails table ");
        
        con.commit();
        con.close();
        if(resultSet>0)
        {
        System.out.println("Training Details updated Successfully.");
        System.out.println("1 row affected.");
        }else
        {
            System.out.println("There is some error. Please contact to administrator.");
        }
        
    }
    catch(Exception error)
    {
        error.printStackTrace();
    }
    
    response.getWriter().println(buffer);
%>
