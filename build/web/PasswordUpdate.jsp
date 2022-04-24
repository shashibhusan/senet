<%-- 
    Document   : PasswordUpdate
    Created on : 15 Feb, 2019, 4:08:41 PM
    Author     : Senet
--%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" autoFlush="true" %>

<%
    String email=request.getParameter("IZlmXMivNcrevgSFy");
    String pass=request.getParameter("Xg15jdfHdn0");
    System.out.println("email recieved ="+email);
    System.out.println("password recieved ="+pass);
    
            Statement st = null;
            PreparedStatement psmt = null;
            int rs=0;
            
            try
            {
            java.sql.Connection  con = ConnectionManager.getConnectionDirectForMySQL();
            PreparedStatement stmt = (PreparedStatement) con.prepareStatement("update eis_register set password = ?  where email = ?");
    //        psmt = con.prepareStatement(sql);
            stmt.setString(1, pass);
            stmt.setString(2, email);            
            rs = stmt.executeUpdate();
            
            con.commit();
            con.close();
            System.out.println("Inserting Data Successfully!..........");
            }
            catch(SQLException err)
            {
                err.printStackTrace();
            }
            if(rs>0)
            {
                out.println("1");
                System.out.println("result have record.");
            }else
            {
                out.println("2");
                System.out.println("result have not record.");
            }
%>
