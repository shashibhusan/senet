<%-- 
    Document   : InsertPersonalDetailsDB
    Created on : 18 Mar, 2021, 4:50:43 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="common.*" %>
<!DOCTYPE html>
<html>
    <head>
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
    String crosssite = (String) session.getAttribute("crosssite");
    session.setAttribute("crosssite", crosssite);

    if (!crosssite.equals(null)) {
         String email = (String)session.getAttribute("emp_email");
         
         String uTrade=request.getParameter("uTrade");
         String uPhysical_fitness_status=request.getParameter("uPhysical_fitness_status");
         String uArea_Specialization_intrade=request.getParameter("uArea_Specialization_intrade");
         String uSpecializatio_other_trade=request.getParameter("uSpecializatio_other_trade");
         String uQualification=request.getParameter("uQualification");
         String uHobbies=request.getParameter("uHobbies");
         
         String Training_req_1=request.getParameter("Training_req_1");
         String training_one_detail=request.getParameter("training_one_detail");
         
         String Training_req_2=request.getParameter("Training_req_2");
         String training_two_detail=request.getParameter("training_two_detail");
         
         String Training_req_3=request.getParameter("Training_req_3");
         String training_three_detail=request.getParameter("training_three_detail");
         
         if(Training_req_1.equals(null)||Training_req_1.equals("")){Training_req_1="na";}
         if(training_one_detail.equals(null)||training_one_detail.equals("")){training_one_detail="na";}
         
         
         if(Training_req_2.equals(null)||Training_req_2.equals("")){Training_req_2="na";}
         if(training_two_detail.equals(null)||training_two_detail.equals("")){training_two_detail="na";}
         
         
         if(Training_req_3.equals(null)||Training_req_3.equals("")){Training_req_3="na";}
         if(training_three_detail.equals(null)||training_three_detail.equals("")){training_three_detail="na";}
         
         System.out.println("The user is ="+email);
         
         Connection con=null;
         ResultSet rs=null;
         Statement st=null;
         
         try
         {
             con=ConnectionManager.getConnectionDirectForMySQL();
             System.out.println("connection="+con);
             
         }
         catch(Exception error)
         {
             error.printStackTrace();
         }
         
        
        String sql="insert into eis_traininginfo (email,tp_name_req_1,tp_det_1,tp_name_req_2,tp_det_2,tp_name_req_3,tp_det_3,Trade,sptTrade,splOTrade,phyFit,qualification,hobbies) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        
        PreparedStatement psmt=(PreparedStatement)con.prepareStatement(sql);
        psmt.setString(1, email);
        psmt.setString(2, Training_req_1);
        psmt.setString(3, training_one_detail);
        psmt.setString(4, Training_req_2);
        psmt.setString(5, training_two_detail);
        psmt.setString(6, Training_req_3);
        psmt.setString(7, training_three_detail);
        psmt.setString(8, uTrade);
        psmt.setString(9, uArea_Specialization_intrade);
        psmt.setString(10, uSpecializatio_other_trade);
        psmt.setString(11, uPhysical_fitness_status);
        psmt.setString(12, uQualification);
        psmt.setString(13, uHobbies);
        
        int result=psmt.executeUpdate();
        con.commit();
        con.close();
        if(result>0)
        {
            System.out.println("One row updated in eis_traininginfo for "+email);
            
            %>
            <body>
                <br/>
                <br/>
                <br/>
                <div id="mainDiv">

                    Details have been updated successfully.

                </div>
            </body>
            
            
            <%        
            
            
        }
        
        
        
        
        
    
    } else {
        response.sendRedirect("stat.jsp");
    }

%>
</html>