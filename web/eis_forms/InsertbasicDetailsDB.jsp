<%-- 
    Document   : InsertbasicDetailsDB
    Created on : 18 Mar, 2021, 11:59:49 AM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.sql.*" %>
<%@page  import="common.*" %>
<!DOCTYPE html>
<%
    String mode=request.getParameter("val");
    System.out.println("Mode="+mode);
    String query="";
    String emp_cur_ofc="";
    Connection con=null;
    ResultSet rs=null;
    Statement st=null;
    String inst_id="";
    int status=0;
    
            String name = (String)session.getAttribute("name");
            String email = (String)session.getAttribute("email");
            int token = Integer.parseInt((String)session.getAttribute("token"));
            String designation = (String)session.getAttribute("designation");
            String office = (String)session.getAttribute("office");
            String dob = (String)session.getAttribute("dob");
            
            
    
    
    if (mode.equals("121")) {
            emp_cur_ofc = (String) session.getAttribute("emp_cur_ofc");
            String uDateOfRet = request.getParameter("uDateOfRet");
            String uDiscipline = request.getParameter("uDiscipline");
            String uDtOfjoinintGov = request.getParameter("uDtOfjoinintGov");
            String uDtOfJoiningMSME = request.getParameter("uDtOfJoiningMSME");
            String uCurrentPayLevel = request.getParameter("uCurrentPayLevel");
            String uDateOfAppointmentPrPost = request.getParameter("uDateOfAppointmentPrPost");
            String uSubstantivepayLevel = request.getParameter("uSubstantivepayLevel");
            String uCategory = request.getParameter("uCategory");
            
            System.out.println(uSubstantivepayLevel);
            
           System.out.println("//"+name+"//"+email+"//"+token+"//"+designation+"//"+office+"//"+dob+"//"+emp_cur_ofc+"//"+emp_cur_ofc+"//"+uDateOfRet+"//"+uDiscipline+"//"+uDtOfjoinintGov+"//"+uDtOfJoiningMSME+"//"+uCurrentPayLevel+"//"+uDateOfAppointmentPrPost+"//"+uSubstantivepayLevel+"//"+uCategory);

            try {
                con = ConnectionManager.getConnectionDirectForMySQL();
                st = con.createStatement();
                String sql = "select * from eis_branch_list where Inst_Name='" +emp_cur_ofc+ "'";
                rs=st.executeQuery(sql);
                while(rs.next())
                {
                    inst_id=rs.getString("Inst_id");
                }
            } catch (Exception err) {
                err.printStackTrace();
            }

            query = "insert into eis_basicinfo (token,email,inst_id,name,bas_designation,dob,dat_ret,bas_descipline,doj_gov,doj_msme,CrPayLevel,aptPrPost,payLevelSub,Category) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement psmt=(PreparedStatement) con.prepareStatement(query);
            psmt.setInt(1, token);
            psmt.setString(2, email);
            psmt.setString(3, inst_id);
            psmt.setString(4, name);
            psmt.setString(5, designation);
            psmt.setString(6, dob);
            psmt.setString(7, uDateOfRet);
            psmt.setString(8, uDiscipline);
            psmt.setString(9, uDtOfjoinintGov);
            psmt.setString(10, uDtOfJoiningMSME);
            psmt.setString(11, uCurrentPayLevel);
            psmt.setString(12, uDateOfAppointmentPrPost);
            psmt.setString(13, uSubstantivepayLevel);
            psmt.setString(14, uCategory);
            
            status=psmt.executeUpdate();
            
        } else {
            System.out.println("Mode=is unavai;lable");
        }
    if(status>0)
    {
        System.out.println("one row updated for=="+email);
%>
        <jsp:forward page="success.jsp?status=success&data=basicinfo" />
   <% }else
    {
        System.out.println("error occured for=="+email);
    }
        
    
    
%>
