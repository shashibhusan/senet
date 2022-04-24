<%-- 
    Document   : updateTransferFinal
    Created on : 4 Feb, 2019, 3:24:31 PM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" autoFlush="true" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <style>
            #mainDiv
            {
                width: 100%;
                border: 1px #e2e2e2 solid;
                align:center;
                margin: auto;
                height: 612px;
            }
            #done
            {
                text-align: center;
                color:  #2e6a19 ;
                font: normal normal 15px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            #err
            {
                text-align: left;
                color:   #b00000  ;
                font: normal normal 15px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            #myTable
            {
                width: 63%;
            }
        </style>
        </head>
        <%
            String crosssite = (String)session.getAttribute("crosssite");
            session.setAttribute("crosssite", crosssite);
            
                    if(!crosssite.equals(null))
        {
            
            String token = (String)session.getAttribute("token");
            String emp_name = (String)session.getAttribute("emp_name");
            String emp_email = (String)session.getAttribute("emp_email");
            String emp_desig= (String)session.getAttribute("emp_desig");
            String emp_cur_ofc= (String)session.getAttribute("user_cur_ofc");
            
        
            // Previous ofice data
            String pr_ofc = request.getParameter("pr_office");
            String pr_designation = request.getParameter("pr_designation");
            String pr_mode = request.getParameter("pr_mode");
            String pr_dateFrom = request.getParameter("dateFrom");
            String pr_leaveDate = request.getParameter("lDateLastofc");
            
            
            //current data
            String office_cr = request.getParameter("office_cr");
            String post_cr = request.getParameter("post_cr");
            String mode = request.getParameter("mode");
            String startDateCurrentOfc = request.getParameter("startDateCurrentOfc");
                String flag="y";
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date = new Date();
            String time=dateFormat.format(date);
            String pr_update="";
            String tr_update="Y";
            if(pr_designation.equals(post_cr))
            {
                pr_update="N";
                System.out.println("pr_update = "+pr_update);
            }else
            {
                pr_update="Y";
                System.out.println("pr_update = "+pr_update);
            }
            
     //       System.out.println("token = "+token+ "/emp-name="+emp_name+ "/emp_email="+emp_email+ "/emp desif = "+emp_desig+"/ pre-office="+emp_cur_ofc);
     //       System.out.println("pr_ofc = "+pr_ofc+ "/pr_designation="+pr_designation+ "/pr_mode="+pr_mode+ "/pr_dateFrom = "+pr_dateFrom+"/pr_leaveDate="+pr_leaveDate);
     //       System.out.println("cr_ofc = "+office_cr+ "/cr_designation="+post_cr+ "/cr_mode="+mode+ "/cr_dateFrom = "+startDateCurrentOfc);
            
            
          
            Statement st = null;
            PreparedStatement psmt = null;
            int rs=0;
            
            try
            {
            java.sql.Connection  con = ConnectionManager.getConnectionDirectForMySQL();
            PreparedStatement stmt = (PreparedStatement) con.prepareStatement("insert into eis_posthistory(email, officeName, designation, phmode, phfrom, phto) values (?, ?, ?, ?, ?, ?)");
    //        psmt = con.prepareStatement(sql);
            stmt.setString(1, emp_email);
            stmt.setString(2, pr_ofc);
            stmt.setString(3, pr_designation);
            stmt.setString(4, pr_mode);
            stmt.setString(5, pr_dateFrom);
            stmt.setString(6, pr_leaveDate);
                        
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
                            System.out.println("Inserting Data Successfully!..........in posting history table");
                        }else
                        {
                            System.out.println("Error !..........in posting history table");
                        }
                        
            
            
            int rs1=0;
            try
            {
            java.sql.Connection  con = ConnectionManager.getConnectionDirectForMySQL();
            PreparedStatement stmt = (PreparedStatement) con.prepareStatement("update eis_postinginfo set cur_ofctype = ? ,"
                    + "state = ?, curr_despln = ? , curr_doj = ? where email = ?");
    //        psmt = con.prepareStatement(sql);
            stmt.setString(1, mode);
            stmt.setString(2, office_cr);
            stmt.setString(3, post_cr);
            stmt.setString(4, startDateCurrentOfc);
            stmt.setString(5, emp_email);
            
                        
            rs1 = stmt.executeUpdate();
            
            con.commit();
            con.close();
            System.out.println("Inserting Data Successfully!..........");
            }
            catch(SQLException err)
            {
                err.printStackTrace();
            }          
            
            if(rs1>0)
            {
                            System.out.println("Inserting Data Successfully!..........in eis_postinginfo");
                        }else
                        {
                            System.out.println("Error !..........in eis_postinginfo");
                        }
            
            int rs2=0;
            try
            {
            java.sql.Connection  con = ConnectionManager.getConnectionDirectForMySQL();
            PreparedStatement stmt = (PreparedStatement) con.prepareStatement("insert into eis_transferandpromotiondata(email, name, token, tr_update, prom_update, flag, timeStamp) values (?, ?, ?, ?, ?, ?, ?)");
    //        psmt = con.prepareStatement(sql);
            stmt.setString(1, emp_email);
            stmt.setString(2, emp_name);
            stmt.setString(3, token);
            stmt.setString(4, tr_update);
            stmt.setString(5, pr_update);
            stmt.setString(6, flag);
            stmt.setString(7, time);
            
                        
            rs2 = stmt.executeUpdate();
            
            con.commit();
            con.close();
            System.out.println("Inserting Data Successfully!..........");
            }
            catch(SQLException err)
            {
                err.printStackTrace();
            }          
            
            if(rs2>0)
            {
                            System.out.println("Inserting Data Successfully!..........in eis_transferandpromotiondata");
                        }else
                        {
                            System.out.println("Error !..........in eis_transferandpromotiondata");
                        }
                        
        %>
    <body>
<div id="mainDiv">
            <br/>
            <br/>
            <table align="center" id="myTable">
                <tr>
            <%
            if(rs>0 && rs1>0 && rs2>0)
            {
                System.out.println("Result Set have record");
            %>
            <td id="done">
             Your data updated successfully.
             </td>
             <%
            }else
            {
                System.out.println(" Result Set have not record");
                %>
                <td id="err"> 
                    <div style="background: #e37f7f; padding: 4px; color: black; width: 100%; margin-bottom: 15px;">Error</div>
                    <div style="padding-left: 10px;"> There is some problem in updating your posting preferences. <br/>
               !! Please try again or contact to administrator. !!</div>
                </td>
                <%
            }
             %>
            </tr> 
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            </table>
            
        </div>
    <%
        }else {
    response.sendRedirect("stat.jsp");
}
                    %>
 </html>
