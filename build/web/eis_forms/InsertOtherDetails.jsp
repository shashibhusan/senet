<%-- 
    Document   : InsertOtherDetails
    Created on : 11 Mar, 2021, 3:47:47 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, common.*" %>
<%@page import="java.util.Random" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            
            String token = (String)session.getAttribute("token");
            String emp_name = (String)session.getAttribute("emp_name");
            String emp_email = (String)session.getAttribute("emp_email");
            String emp_desig = (String)session.getAttribute("emp_desig");
            String emp_cur_ofc = (String)session.getAttribute("emp_cur_ofc");
            
            session.setAttribute("token", token);
            session.setAttribute("emp_name", emp_name);
            session.setAttribute("emp_email", emp_email);
            session.setAttribute("emp_desig", emp_desig);
            session.setAttribute("emp_cur_ofc", emp_cur_ofc);
            
            
    %>
    <body>
        <%
            String group=request.getParameter("group");
            String Hometown_state_code=request.getParameter("selState");
            String Hometown_district_code=request.getParameter("selDistrict");
            String Hometown_state_name="";
            String Hometown_district_name="";
            String Served_hometown=request.getParameter("servedatHometown");
            String served_hometown_date_from="na";
            String served_hometown_date_To="na";
            String served_NER_date_from="na";
            String served_NER_date_To="na";
            if(Served_hometown.equals("Yes"))
            {
                served_hometown_date_from=request.getParameter("DateFromHmt");
                served_hometown_date_To=request.getParameter("DateToHmt");
            }
            String Served_NER=request.getParameter("servedNER");
            if(Served_NER.equals("Yes"))
            {
                served_NER_date_from=request.getParameter("DateFromNER");
                served_NER_date_To=request.getParameter("DateToNER");
            }
            
            System.out.println("group="+group);
            System.out.println("Hometown_state="+Hometown_state_code);
            System.out.println("Hometown_district="+Hometown_district_code);
            System.out.println("Served_hometown="+Served_hometown);
            System.out.println("served_hometown_date_from="+served_hometown_date_from);
            System.out.println("served_hometown_date_To="+served_hometown_date_To);
            System.out.println("Served_NER="+Served_NER);
            System.out.println("served_NER_date_from="+served_NER_date_from);
            System.out.println("served_NER_date_To="+served_NER_date_To);
            
            
            Connection con=null;
            ResultSet rs=null;
            PreparedStatement psmt=null;
            Statement st=null;
            
            try
            {
                con=ConnectionManager.getConnectionDirectForMySQL();
                st=con.createStatement();
            }
            catch(Exception sqlException)
            {
                sqlException.printStackTrace();
            }
            
            String sql="select state_name from state_id where state_id='"+Hometown_state_code+"'";
            rs=st.executeQuery(sql);
            con.commit();
            while(rs.next())
            {
                Hometown_state_name=rs.getString("state_name");
            }
            String sql1="select district_name from districts where state_id='"+Hometown_state_code+"' and district_code='"+Hometown_district_code+"'";
            rs=st.executeQuery(sql1);
            while(rs.next())
            {
                Hometown_district_name=rs.getString("district_name");
            }
            
                    String isDelete = "0";
                    String isDisplay = "1";
                    int i=0;
                    
                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                    Date date = new Date();
                    String time=dateFormat.format(date);
                    
                    try
                    {
                    String InsertQuery="insert into eis_other_details (name, email, token, designation, job_group, hometown_state_name, hometown_district_name, hometown_state_code, hometown_district_code, served_at_hometown, served_at_hometown_date_from, served_at_hometown_date_to, served_at_ner, served_at_ner_date_from, served_at_ner_date_to, time, isDisplay, isDelete) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    
                    psmt=(PreparedStatement)con.prepareStatement(InsertQuery);
                    
                    psmt.setString(1, emp_name);
                    psmt.setString(2, emp_email);
                    psmt.setString(3, token);
                    psmt.setString(4, emp_desig);
                    psmt.setString(5, group);
                    psmt.setString(6, Hometown_state_name);
                    psmt.setString(7, Hometown_district_name);
                    psmt.setString(8, Hometown_state_code);
                    psmt.setString(9, Hometown_district_code);
                    psmt.setString(10, Served_hometown);
                    psmt.setString(11, served_hometown_date_from);
                    psmt.setString(12, served_hometown_date_To);
                    psmt.setString(13, Served_NER);
                    psmt.setString(14, served_NER_date_from);
                    psmt.setString(15, served_NER_date_To);
                    psmt.setString(16, time);
                    psmt.setString(17, isDisplay);
                    psmt.setString(18, isDelete);
                    
                    
                    i=psmt.executeUpdate();
                    con.commit();
                    if(i>0)
                    {
                        System.out.println("1 row inserted in other detail table");
                        String updated_data = "group, hometown_state_name, hometown_details, served_at_hometown_details, served_at_ner_details";
                        int token1 = Integer.parseInt(token);

                        String updated_table_name = "eis_other_details";

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

                         int updatedInfo = psmt1.executeUpdate();
                        con.commit();
                        con.close();
                        if (updatedInfo > 0) {
                            System.out.println("data is updated on the eis_postinginfo and eis_data_update_info by :" + emp_email);

                        }
                        System.out.println("Inserting Data Successfully!..........eis_other_details");
                        }
                    }
                    catch(Exception err)
                    {
                        System.out.println("error is caught while inserting is ="+err.getMessage());
                    }
            
        %>
        <%
                    if(i>0){
        %>
        <br/>
        <br/>
        <br/>
        <div id="mainDiv">

            Details have been updated successfully.

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
