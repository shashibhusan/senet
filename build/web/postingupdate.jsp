<%-- 
    Document   : postingupdate
    Created on : 1 Feb, 2019, 4:03:34 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,common.*,java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*, common.*" %>
<%@page import="java.util.Random" %>
<%@page import="java.text.SimpleDateFormat" %>
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
        
        if(!crosssite.equals(null))
        {
        String pref_one=request.getParameter("prefone");
        String pref_two=request.getParameter("preftwo");
        String pref_three=request.getParameter("prefthree");
        String token=(String)session.getAttribute("token");
            int token1 = Integer.parseInt(token);
            String emp_name = (String)session.getAttribute("emp_name");
            String emp_email = (String)session.getAttribute("emp_email");
            String emp_desig = (String)session.getAttribute("emp_desig");
            String emp_cur_ofc = (String)session.getAttribute("emp_cur_ofc");
            String flag="y";
            int alreadyupdatedornot=Integer.parseInt(request.getParameter("alreadyupdatedornot"));
            
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date = new Date();
            String time=dateFormat.format(date);
            
        //  System.out.println("token="+token+"/name="+emp_name+"/email="+emp_email+"/desig="+emp_desig+"/ofc="+emp_cur_ofc);
            
            Connection  con=null;
            Statement st = null;
            PreparedStatement psmt = null;
            int rs=0;
            int updatedInfo=0;
            try
            {
            con = ConnectionManager.getConnectionDirectForMySQL();
            
            }
            catch(SQLException err)
            {
                err.printStackTrace();
            }
            
            if(alreadyupdatedornot==0)
            {    
            String sql="insert into eis_postinginfo_new(token, email, pref_one, pref_two, pref_three, flag, time, name, designation, curr_ofc) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = (PreparedStatement) con.prepareStatement(sql);
    //        psmt = con.prepareStatement(sql);
            stmt.setString(1, token);
            stmt.setString(2, emp_email);
            stmt.setString(3, pref_one);
            stmt.setString(4, pref_two);
            stmt.setString(5, pref_three);
            stmt.setString(6, flag);
            stmt.setString(7, time);
            stmt.setString(8, emp_name);
            stmt.setString(9, emp_desig);
            stmt.setString(10, emp_cur_ofc);
            
            rs = stmt.executeUpdate();
            
            con.commit();
            if (rs > 0) 
            {
                    String isDelete = "0";
                    String isDisplay = "1";

                    String updated_data = "token, email, pref_one, pref_two, pref_three, flag, time, name, designation, curr_ofc";

                    String updated_table_name = "eis_postinginfo_new";
                    
                    String action_taken="insert";


                    String query = "insert into eis_data_update_info (token, email, time, updated_data, updated_table_name, isDisplay, isDelete, action_taken) values (?,?,?,?,?,?,?,?)";

                    PreparedStatement psmt1 = (PreparedStatement) con.prepareStatement(query);

                    psmt1.setInt(1, token1);
                    psmt1.setString(2, emp_email);
                    psmt1.setString(3, time);
                    psmt1.setString(4, updated_data);
                    psmt1.setString(5, updated_table_name);
                    psmt1.setString(6, isDisplay);
                    psmt1.setString(7, isDelete);
                    psmt1.setString(8, action_taken);

                    updatedInfo = psmt1.executeUpdate();
                    con.commit();
                    con.close();
                    if (updatedInfo > 0) {
                        System.out.println("data is updated on the eis_postinginfo and eis_data_update_info by :" + emp_email);

                    }
                    System.out.println("Inserting Data Successfully!..........");
                }
            }else
            {
                String sql="update eis_postinginfo_new set pref_one=?, pref_two=?, pref_three=?, time=? where email=? and token=?";
                PreparedStatement stmt = (PreparedStatement) con.prepareStatement(sql);
                    //        psmt = con.prepareStatement(sql);

                    stmt.setString(1, pref_one);
                    stmt.setString(2, pref_two);
                    stmt.setString(3, pref_three);
                    stmt.setString(4, time);
                    stmt.setString(5, emp_email);
                    stmt.setString(6, token);
                    rs = stmt.executeUpdate();

                    con.commit();
                    if(rs>0)
                    {
                        String isDelete = "0";
                        String isDisplay = "1";

                        String updated_data = "pref_one, pref_two, pref_three, time";

                        String updated_table_name = "eis_postinginfo_new";

                        String action_taken="update";


                        String query = "insert into eis_data_update_info (token, email, time, updated_data, updated_table_name, isDisplay, isDelete, action_taken) values (?,?,?,?,?,?,?,?)";

                        PreparedStatement psmt1 = (PreparedStatement) con.prepareStatement(query);

                        psmt1.setInt(1, token1);
                        psmt1.setString(2, emp_email);
                        psmt1.setString(3, time);
                        psmt1.setString(4, updated_data);
                        psmt1.setString(5, updated_table_name);
                        psmt1.setString(6, isDisplay);
                        psmt1.setString(7, isDelete);
                        psmt1.setString(8, action_taken);

                        updatedInfo = psmt1.executeUpdate();
                        con.commit();
                        if (updatedInfo > 0) {
                            System.out.println("data is updated on the eis_postinginfo and eis_data_update_info by :" + emp_email);

                        }
                    }
            }
            con.close();
    %>
    <body>
        <div id="mainDiv">
            <br/>
            <br/>
            <table align="center" id="myTable">
                <tr>
            <%
            if(rs>0 && updatedInfo>0)
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
        
       
    </body>
    <%
        }else {
    response.sendRedirect("stat.jsp");
}
    %>
</html>
