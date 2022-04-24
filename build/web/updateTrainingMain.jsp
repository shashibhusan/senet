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
     
    String Query="SELECT sno FROM mpr_dcmsme.eis_trainingdetails order by sno desc limit 1";
    try
    {
        con=ConnectionManager.getConnectionDirectForMySQL();
        st=con.createStatement();
        rs=st.executeQuery(Query);
        while(rs.next())
        {
           sno=rs.getInt("sno");
        }
    }catch(Exception er)
    {
        er.printStackTrace();
    }
    
    //String sql="insert into eis_trainingcompleted values (?,?,?,?)";
    
    
    try
    {
        PreparedStatement stmt = (PreparedStatement) con.prepareStatement("insert into eis_trainingdetails values (?,?,?,?,?)");
        stmt.setInt(1, sno+1);
        stmt.setString(2, emp_email);
        stmt.setString(3, TrainingName);
        stmt.setString(4, TrainingFrom);
        stmt.setString(5, TrainingTo);
        resultSet=stmt.executeUpdate();
        
        System.out.println("we are inserting data in eis_trainingdetails table on sno="+(sno+1));
        
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
