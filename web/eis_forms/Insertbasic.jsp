<%-- 
    Document   : Insertbasic
    Created on : 17 Mar, 2021, 4:56:19 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="common.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Basic details</title>
        <style>
            #mainDiv
            {
               width: 100%;
               margin: auto;
               border: 1px solid #535353;
               overflow: auto;
            }
            #mainDiv1
            {
               width: 100%;
               margin: auto;
               border: 1px solid #535353;
               overflow: auto;
               display: none;
            }
            .mainHead
            {
                width: 97.5%;
                font: normal bold 18px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 10px;
                text-align: center;
                background-color:  #eeeeee ;
                margin: 0px;
                color: #424242;
            }
            .Inserttable
            {
                width: 90%;
                border: 1px solid #eeeeee;
            }
            .sno{width: 30px; font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif; text-align: center}
            .tHead
            {
                width: 300px;
                padding: 10px;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            .dHead
            {
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            table,th,tr,td{border: 1px solid #eeeeee; border-collapse: collapse;}
            .inptbox
            {
                width: 97.7%;
                padding: 3px;
                border: 1px #B6DBFE solid;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            .selDiv
            {
                width: 99.7%;
                padding: 5px;
                border: 1px #B6DBFE solid;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            .btn{
                padding: 8px;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border-radius: 2px; 
                min-width: 80px;
                cursor: pointer;
                width: 150px;
            }
            .clr3{background-color:  #c4dfc6 ;border: 1px #1e8b03 solid;}
            .clr4{background-color:  #dfc4c4 ;border: 1px #ff0000 solid;}
            .clr5{background-color:  #dfdeef ;border: 1px #4f4dec solid;}
            .clr3:hover{background-color: #1e8b03;color: #ffffff;}
            .clr4:hover{background-color: #ff0000;color: #ffffff;}
            .clr5:hover{background-color: #4f4dec;color: #ffffff;}
            
            .showDiv
            {
                display: none;
            }
        </style>
    </head>
    <%
        String crosssite = (String)session.getAttribute("crosssite");
        session.setAttribute("crosssite", crosssite);
        
        if(!crosssite.equals(null))
        { 
            String name = (String)session.getAttribute("emp_name");
            String email = (String)session.getAttribute("emp_email");
            String token = (String)session.getAttribute("token");
            String designation = (String)session.getAttribute("emp_desig");
            String office = (String)session.getAttribute("emp_cur_ofc");
            String dob = (String)session.getAttribute("dob");
            
        session.setAttribute("token", token);
        session.setAttribute("name", name);
        session.setAttribute("email", email);
        session.setAttribute("designation", designation);
        session.setAttribute("office", office);
        session.setAttribute("dob", dob);
        
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;
        int submitFlag=0;
        int PostingSubmitFlag=0;
        
        try
        {
            con=ConnectionManager.getConnectionDirectForMySQL();
            st=con.createStatement();
            String sql="select * from eis_basicinfo where email='"+email+"' ";
            rs=st.executeQuery(sql);
            if(rs.next())
            {
                submitFlag=1;
            }
        }
        catch(Exception err)
        {
            err.printStackTrace();
        }
        
        
        
    %>
    <body>
        <%
            if (submitFlag == 0) {
        %>
        <div id="mainDiv">
            <h2 class="mainHead">Update basic Details</h2><br/>
            <form name="InsertBasicDetails" class="InsertBasicDetails" id="InsertBasicDetails" method="POST" autocomplete="off">
                <table align="center" class="Inserttable" id="Inserttable">
                    <tr>
                        <td class="sno">1.</td>
                        <td class="tHead">Name<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead"><input id="uName" name="uName" readonly="2" type="text" value="<%=name%>" class="inptbox" disabled="2"/></td>
                    </tr>
                    <tr>
                        <td class="sno">2.</td>
                        <td class="tHead">Email<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead"><input id="uEmail" name="uEmail" readonly="2" type="text" value="<%=email%>" class="inptbox" disabled="2"/></td>
                    </tr>
                    <tr>
                        <td class="sno">3.</td>
                        <td class="tHead">Designation<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead"><input id="uDesignation" name="uDesignation" readonly="2" type="text" value="<%=designation%>" class="inptbox" disabled="2"/></td>
                    </tr>
                    <tr>
                        <td class="sno">4.</td>
                        <td class="tHead">Date of birth<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead"><input id="uDateOfBirth" name="uDateOfBirth" type="text" value="<%=dob%>" class="datepicker inptbox" readonly="2" disabled="2"/></td>
                    </tr>
                    <tr>
                        <td class="sno">5.</td>
                        <td class="tHead">date of retirement<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead"><input id="uDateOfRet" name="uDateOfRet" type="text" class="datepicker inptbox" readonly="2"/></td>
                    </tr>
                    <tr>
                        <td class="sno">6.</td>
                        <td class="tHead">Discipline<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">
                            <select id="uDiscipline" name="uDiscipline" type="text" class="selDiv">
                                <option value="">Select </option>
                                <option value="Chemical">Chemical </option>
                                <option value="Economic Investigation">Economic Investigation </option>
                                <option value="Electrical">Electrical </option>
                                <option value="Electronics">Electronics </option>
                                <option value="Export Promotion">Export Promotion </option>
                                <option value="Food">Food </option>
                                <option value="GAD">GAD </option>
                                <option value="Glass & Ceramic">Glass & Ceramic </option>
                                <option value="Hosiery">Hosiery </option>
                                <option value="IMT">IMT </option>
                                <option value="Leather & Footwear">Leather & Footwear </option>
                                <option value="Mechanical">Mechanical </option>
                                <option value="Metal Finishing">Metal Finishing </option>
                                <option value="Metallurgy">Metallurgy </option>
                                <option value="Statistics">Statistics </option>
                                <option value="Tailoring">Tailoring </option>
                                <option value="Cane & Bamboo Making">Cane & Bamboo Making </option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="sno">7.</td>
                        <td class="tHead">Date of joining to government<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead"><input id="uDtOfjoinintGov" name="uDtOfjoinintGov" type="text" class="datepicker inptbox" readonly="2"/></td>
                    </tr>
                    <tr>
                        <td class="sno">8.</td>
                        <td class="tHead">Date of joining to MSME<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead"><input id="uDtOfJoiningMSME" name="uDtOfJoiningMSME" type="text" class="datepicker inptbox" readonly="2"/></td>
                    </tr>
                    <tr>
                        <td class="sno">9.</td>
                        <td class="tHead">Current pay level<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">
                            <select id="uCurrentPayLevel" name="uCurrentPayLevel" class="selDiv">
                                <option value="">Select</option>
                                <option value="Level-6">Level-6</option>
                                <option value="Level-7">Level-7</option>
                                <option value="Level-10">Level-10</option>
                                <option value="Level-11">Level-11</option>
                                <option value="Level-12">Level-12</option>
                                <option value="Level-13">Level-13</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="sno">10.</td>
                        <td class="tHead">Date of appointment to the present post<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead"><input id="uDateOfAppointmentPrPost" name="uDateOfAppointmentPrPost" type="text" class="datepicker inptbox" readonly="2"/></td>
                    </tr>
                    <tr>
                        <td class="sno">11.</td>
                        <td class="tHead">Pay Level In Substantive Pay<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">
                            <select id="uSubstantivepayLevel" name="uSubstantivepayLevel" type="text" class="selDiv">
                                <option value="">Select</option>
                                <option value="Level-6">Level-6</option>
                                <option value="Level-7">Level-7</option>
                                <option value="Level-8">Level-8</option>
                                <option value="Level-9">Level-9</option>
                                <option value="Level-10">Level-10</option>
                                <option value="Level-11">Level-11</option>
                                <option value="Level-12">Level-12</option>
                                <option value="Level-13">Level-13</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="sno">12.</td>
                        <td class="tHead">category<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">
                            <select id="uCategory" name="uCategory" type="text" class="selDiv">
                                <option value="">Select</option>
                                <option value="SC">SC</option>
                                <option value="ST">ST</option>
                                <option value="PWD-BL">PWD-BL</option>
                                <option value="PWD-HH">PWD-HH</option>
                                <option value="PWD-OH">PWD-OH</option>
                                <option value="PWD-OL">PWD-OL</option>
                                <option value="PWD-MW">PWD-MW</option>
                                <option value="PWD-VH">PWD-VH</option>
                                <option value="Others">Others</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align: center;">
                            <input class="btn clr3" type="submit" value="Submit" onclick="return ValidateForm();">
                            <input class="btn clr4" type="reset" value="reset" onclick="InsertBasicDetails.reset()">
                        </td>
                    </tr>
                </table>  
            </form>
            <br/>
        </div>
        <%
        } else {
                rs.beforeFirst();
                while(rs.next())
                {
                    
        %>
        <div id="mainDiv">
            <h2 class="mainHead">Update basic Details</h2><br/>
            <form name="InsertBasicDetails" class="InsertBasicDetails" id="InsertBasicDetails" method="POST" autocomplete="off">
                <table align="center" class="Inserttable" id="Inserttable">
                    <tr>
                        <td class="sno">1.</td>
                        <td class="tHead">Name<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">&nbsp;&nbsp;<%=rs.getString("name")%></td>
                    </tr>
                    <tr>
                        <td class="sno">2.</td>
                        <td class="tHead">Email<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">&nbsp;&nbsp;<%=rs.getString("email")%></td>
                    </tr>
                    <tr>
                        <td class="sno">3.</td>
                        <td class="tHead">Designation<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">
                        <%
                    Connection cn1=ConnectionManager.getConnectionDirectForMySQL();
                    Statement st1=cn1.createStatement();
                    String sql2="select * from eis_postinginfo where email='"+email+"' ";
                    ResultSet rs1=st1.executeQuery(sql2);
                    if(rs1.next())
                    {
                        PostingSubmitFlag=1;
                    }
                    if(PostingSubmitFlag==1){
                        
                    
                    rs1.beforeFirst();
                    while(rs1.next()){
                        %>
                        &nbsp;&nbsp;<%=rs1.getString("curr_despln")%>
                        <%}
                    st1.close();
                    cn1.close();
                    }else
                    {
                        %>
                        &nbsp;&nbsp;<%=rs.getString("bas_designation")%>
                        <%
                    }
                        %>
                        </td>
                    </tr>
                    <tr>
                        <td class="sno">4.</td>
                        <td class="tHead">Date of birth<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">&nbsp;&nbsp;<%=rs.getString("dob")%></td>
                    </tr>
                    <tr>
                        <td class="sno">5.</td>
                        <td class="tHead">date of retirement<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">&nbsp;&nbsp;<%=rs.getString("dat_ret")%></td>
                    </tr>
                    <tr>
                        <td class="sno">6.</td>
                        <td class="tHead">Discipline<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">&nbsp;&nbsp;<%=rs.getString("bas_descipline")%></td>
                    </tr>
                    <tr>
                        <td class="sno">7.</td>
                        <td class="tHead">Date of joining to government<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">&nbsp;&nbsp;<%=rs.getString("doj_gov")%></td>
                    </tr>
                    <tr>
                        <td class="sno">8.</td>
                        <td class="tHead">Date of joining to MSME<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">&nbsp;&nbsp;<%=rs.getString("doj_msme")%></td>
                    </tr>
                    <tr>
                        <td class="sno">9.</td>
                        <td class="tHead">Current pay level<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">&nbsp;&nbsp;<%=rs.getString("CrPayLevel")%></td>
                    </tr>
                    <tr>
                        <td class="sno">10.</td>
                        <td class="tHead">Date of appointment to the present post<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">&nbsp;&nbsp;<%=rs.getString("aptPrPost")%></td>
                    </tr>
                    <tr>
                        <td class="sno">11.</td>
                        <td class="tHead">Pay Level In Substantive Pay<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">&nbsp;&nbsp;<%=rs.getString("payLevelSub")%></td>
                    </tr>
                    <tr>
                        <td class="sno">12.</td>
                        <td class="tHead">category<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">&nbsp;&nbsp;<%=rs.getString("Category")%></td>
                    </tr>
                    <tr>
                        <td class="sno" colspan="3">
                            <input type="button" value="Update" onclick="return ShowDiv();"/>
                        </td>
                    </tr>
                </table>  
            </form>
            <br/>
        </div>
                    
                    <div id="mainDiv1">
                            <h2 class="mainHead">Update basic Details</h2><br/>
                            <form name="UpdateBasicDetails" class="UpdateBasicDetails" id="UpdateBasicDetails" method="POST" action="updateBasic.jsp" autocomplete="off">
                                <table align="center" class="Inserttable" id="Inserttable">
                                    <tr>
                                        <td class="sno">1.</td>
                                        <td class="tHead">Name<span style="vertical-align: super; color: #ff0000;">*</span></td>
                                        <td class="dHead"><input id="uName" name="uName" readonly="2" type="text" value="<%=rs.getString("name")%>" class="inptbox" disabled="2"/></td>
                                    </tr>
                                    <tr>
                                        <td class="sno">2.</td>
                                        <td class="tHead">Email<span style="vertical-align: super; color: #ff0000;">*</span></td>
                                        <td class="dHead"><input id="uEmail" name="uEmail" readonly="2" type="text" value="<%=rs.getString("email")%>" class="inptbox" disabled="2"/></td>
                                    </tr>
                                    <tr>
                                        <td class="sno">3.</td>
                                        <td class="tHead">Designation<span style="vertical-align: super; color: #ff0000;">*</span></td>
                                        <td class="dHead">
                                            <%
                    Connection cn2=ConnectionManager.getConnectionDirectForMySQL();
                    Statement st2=cn2.createStatement();
                    String sql3="select * from eis_postinginfo where email='"+email+"' ";
                    ResultSet rs2=st2.executeQuery(sql3);
                    if(rs2.next())
                    {
                        PostingSubmitFlag=1;
                    }
                    if(PostingSubmitFlag==1){
                        
                    
                    rs2.beforeFirst();
                    while(rs2.next()){
                        %>
                        &nbsp;&nbsp;
                         <input id="uDesignation" name="uDesignation" readonly="2" type="text" value="<%=rs2.getString("curr_despln")%>" class="inptbox" disabled="2"/>
                        <%}
                    st2.close();
                    cn2.close();
                    }else
                    {
                        %>
                        &nbsp;&nbsp;
                         <input id="uDesignation" name="uDesignation" readonly="2" type="text" value="<%=rs.getString("bas_designation")%>" class="inptbox" disabled="2"/>
                        <%
                    }
                        %>
                                           
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="sno">4.</td>
                                        <td class="tHead">Date of birth<span style="vertical-align: super; color: #ff0000;">*</span></td>
                                        <td class="dHead"><input id="uDateOfBirth" name="uDateOfBirth" type="text" value="<%=rs.getString("dob")%>" class="datepicker inptbox" readonly="2" disabled="2"/></td>
                                    </tr>
                                    <tr>
                                        <td class="sno">5.</td>
                                        <td class="tHead">date of retirement<span style="vertical-align: super; color: #ff0000;">*</span></td>
                                        <td class="dHead"><input id="uDateOfRet" name="uDateOfRet" disabled="2" value="<%=rs.getString("dat_ret")%>" type="text" class="datepicker inptbox" readonly="2"/></td>
                                    </tr>
                                    <tr>
                                        <td class="sno">6.</td>
                                        <td class="tHead">Discipline<span style="vertical-align: super; color: #ff0000;">*</span></td>
                                        <td class="dHead">
                                            <select id="uDiscipline" name="uDiscipline" disabled="2" type="text" class="selDiv">
                                                <option value="<%=rs.getString("bas_descipline")%>"><%=rs.getString("bas_descipline")%></option>
                                                <option value="Chemical">Chemical </option>
                                                <option value="Economic Investigation">Economic Investigation </option>
                                                <option value="Electrical">Electrical </option>
                                                <option value="Electronics">Electronics </option>
                                                <option value="Export Promotion">Export Promotion </option>
                                                <option value="Food">Food </option>
                                                <option value="GAD">GAD </option>
                                                <option value="Glass & Ceramic">Glass & Ceramic </option>
                                                <option value="Hosiery">Hosiery </option>
                                                <option value="IMT">IMT </option>
                                                <option value="Leather & Footwear">Leather & Footwear </option>
                                                <option value="Mechanical">Mechanical </option>
                                                <option value="Metal Finishing">Metal Finishing </option>
                                                <option value="Metallurgy">Metallurgy </option>
                                                <option value="Statistics">Statistics </option>
                                                <option value="Tailoring">Tailoring </option>
                                                <option value="Cane & Bamboo Making">Cane & Bamboo Making </option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="sno">7.</td>
                                        <td class="tHead">Date of joining to government<span style="vertical-align: super; color: #ff0000;">*</span></td>
                                        <td class="dHead"><input id="uDtOfjoinintGov" disabled="2" name="uDtOfjoinintGov" value="<%=rs.getString("doj_gov")%>" type="text" class="datepicker inptbox" readonly="2"/></td>
                                    </tr>
                                    <tr>
                                        <td class="sno">8.</td>
                                        <td class="tHead">Date of joining to MSME<span style="vertical-align: super; color: #ff0000;">*</span></td>
                                        <td class="dHead"><input id="uDtOfJoiningMSME" disabled="2" name="uDtOfJoiningMSME" type="text" value="<%=rs.getString("doj_msme")%>" class="datepicker inptbox" readonly="2"/></td>
                                    </tr>
                                    <tr>
                                        <td class="sno">9.</td>
                                        <td class="tHead">Current pay level<span style="vertical-align: super; color: #ff0000;">*</span></td>
                                        <td class="dHead">
                                            <select id="uCurrentPayLevel" name="uCurrentPayLevel" class="selDiv">
                                                <option value="<%=rs.getString("CrPayLevel")%>"><%=rs.getString("CrPayLevel")%></option>
                                                <option value="Level-6">Level-6</option>
                                                <option value="Level-7">Level-7</option>
                                                <option value="Level-10">Level-10</option>
                                                <option value="Level-11">Level-11</option>
                                                <option value="Level-12">Level-12</option>
                                                <option value="Level-13">Level-13</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="sno">10.</td>
                                        <td class="tHead">Date of appointment to the present post<span style="vertical-align: super; color: #ff0000;">*</span></td>
                                        <td class="dHead"><input id="uDateOfAppointmentPrPost" name="uDateOfAppointmentPrPost" type="text" value="<%=rs.getString("aptPrPost")%>" class="datepicker inptbox" readonly="2"/></td>
                                    </tr>
                                    <tr>
                                        <td class="sno">11.</td>
                                        <td class="tHead">Pay Level In Substantive Pay<span style="vertical-align: super; color: #ff0000;">*</span></td>
                                        <td class="dHead">
                                            <select id="uSubstantivepayLevel" name="uSubstantivepayLevel" type="text" class="selDiv">
                                                <option value="<%=rs.getString("payLevelSub")%>"><%=rs.getString("payLevelSub")%></option>
                                                <option value="Level-6">Level-6</option>
                                                <option value="Level-7">Level-7</option>
                                                <option value="Level-8">Level-8</option>
                                                <option value="Level-9">Level-9</option>
                                                <option value="Level-10">Level-10</option>
                                                <option value="Level-11">Level-11</option>
                                                <option value="Level-12">Level-12</option>
                                                <option value="Level-13">Level-13</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="sno">12.</td>
                                        <td class="tHead">category<span style="vertical-align: super; color: #ff0000;">*</span></td>
                                        <td class="dHead">
                                            <select id="uCategory" disabled="2" name="uCategory" type="text" class="selDiv">
                                                <option value="<%=rs.getString("Category")%>"><%=rs.getString("Category")%></option>
                                                <option value="SC">SC</option>
                                                <option value="ST">ST</option>
                                                <option value="PWD-BL">PWD-BL</option>
                                                <option value="PWD-HH">PWD-HH</option>
                                                <option value="PWD-OH">PWD-OH</option>
                                                <option value="PWD-OL">PWD-OL</option>
                                                <option value="PWD-MW">PWD-MW</option>
                                                <option value="PWD-VH">PWD-VH</option>
                                                <option value="Others">Others</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="text-align: center;">
                                            <input class="btn clr3" type="submit" value="Submit" onclick="return ValidateUpdateForm();">
                                            <input class="btn clr4" type="reset" value="reset" onclick="UpdateBasicDetails.reset()">
                                        </td>
                                    </tr>
                                </table>  
                            </form>
                            <br/>
                        </div>
        <%
            }
            con.close();
            rs.close();
            }
        %>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">        
        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            function ValidateUpdateForm()
            {
                var uCurrentPayLevel=document.UpdateBasicDetails.uCurrentPayLevel.value;
                var uDateOfAppointmentPrPost=document.UpdateBasicDetails.uDateOfAppointmentPrPost.value;
                var uSubstantivepayLevel=document.UpdateBasicDetails.uSubstantivepayLevel.value;
                
                if(uCurrentPayLevel==null || uCurrentPayLevel=="")
                    {
                        alert("Please select current pay level");
                        return false;
                    }
                    else if(uDateOfAppointmentPrPost==null || uDateOfAppointmentPrPost=="")
                        {
                            alert("Please choose date of appointment to the present post");
                            return false
                        }
                        else if(uSubstantivepayLevel==null || uSubstantivepayLevel=="")
                            {
                                alert("Please choose pay level in substentive pay");
                                return false;
                            }
                            else
                                {
                                    var cn=confirm("Are you sure want to update the details");
                                    if(cn==true)
                                        {
                                            return true;
                                        }
                                        else
                                            {
                                                return false;
                                            }
                                }
            }
            function ShowDiv()
            {
                document.getElementById("mainDiv").style.display='none';
                document.getElementById("mainDiv1").style.display='block';
            }
            function ValidateForm()
            {
             if((document.InsertBasicDetails.uDateOfRet.value)==null || (document.InsertBasicDetails.uDateOfRet.value)=="")
                 {
                     alert("Please select date of retirement.")
                     document.getElementById("uDateOfRet").focus();
                     return false;
                 }
                 else if((document.InsertBasicDetails.uDiscipline.value)==null || (document.InsertBasicDetails.uDiscipline.value)=="")
                        {
                            alert("Please select your discipline.")
                            document.getElementById("uDiscipline").focus();
                            return false;
                        }
                    else if((document.InsertBasicDetails.uDtOfjoinintGov.value)==null || (document.InsertBasicDetails.uDtOfjoinintGov.value)=="")
                            {
                                alert("Please select date of joining to government .")
                                document.getElementById("uDtOfjoinintGov").focus();
                                return false;
                            }
                        else if((document.InsertBasicDetails.uDtOfJoiningMSME.value)==null || (document.InsertBasicDetails.uDtOfJoiningMSME.value)=="")
                                {
                                    alert("Please select date of joining to MSME.")
                                    document.getElementById("uDtOfJoiningMSME").focus();
                                    return false;
                                }
                            else if((document.InsertBasicDetails.uCurrentPayLevel.value)==null || (document.InsertBasicDetails.uCurrentPayLevel.value)=="")
                                    {
                                        alert("Please select current pay level.")
                                        document.getElementById("uCurrentPayLevel").focus();
                                        return false;
                                    }
                                else if((document.InsertBasicDetails.uDateOfAppointmentPrPost.value)==null || (document.InsertBasicDetails.uDateOfAppointmentPrPost.value)=="")
                                        {
                                            alert("Please select date of appointment to the present post.")
                                            document.getElementById("uDateOfAppointmentPrPost").focus();
                                            return false;
                                        }
                                    else if((document.InsertBasicDetails.uSubstantivepayLevel.value)==null || (document.InsertBasicDetails.uSubstantivepayLevel.value)=="")
                                            {
                                                alert("Please select Pay level in substantive pay.")
                                                document.getElementById("uSubstantivepayLevel").focus();
                                                return false;
                                            }
                                        else if((document.InsertBasicDetails.uCategory.value)==null || (document.InsertBasicDetails.uCategory.value)=="")
                                                {
                                                    alert("Please select category.")
                                                    document.getElementById("uCategory").focus();
                                                    return false;
                                                }
                                                else
                                                    {
                                                        var str="Please make sure that the details you have entered is correct. Once you enter there is no option to edit. Are you sure want to proceed ?";
                                                        var con=confirm(str);
                                                        if(con==true)
                                                            {
                                                                var uDateOfRet=document.InsertBasicDetails.uDateOfRet.value;
                                                                var uDiscipline=document.InsertBasicDetails.uDiscipline.value;
                                                                var uDtOfjoinintGov=document.InsertBasicDetails.uDtOfjoinintGov.value;
                                                                var uDtOfJoiningMSME=document.InsertBasicDetails.uDtOfJoiningMSME.value;
                                                                var uCurrentPayLevel=document.InsertBasicDetails.uCurrentPayLevel.value;
                                                                var uDateOfAppointmentPrPost=document.InsertBasicDetails.uDateOfAppointmentPrPost.value;
                                                                var uSubstantivepayLevel=document.InsertBasicDetails.uSubstantivepayLevel.value;
                                                                var uCategory=document.InsertBasicDetails.uCategory.value;
                                                                var url="InsertbasicDetailsDB.jsp?val=121&uDateOfRet="+uDateOfRet+"&uDiscipline="+uDiscipline+"&uDtOfjoinintGov="+uDtOfjoinintGov+"&uDtOfJoiningMSME="+uDtOfJoiningMSME+"&uCurrentPayLevel="+uCurrentPayLevel+"&uDateOfAppointmentPrPost="+uDateOfAppointmentPrPost+"&uSubstantivepayLevel="+uSubstantivepayLevel+"&uCategory="+uCategory;
                                                                InsertBasicDetailsIntoDb(url);
                                                                return true;
                                                            }else
                                                                {
                                                                    return false;
                                                                }
                                                    }
            }
            
            function InsertBasicDetailsIntoDb(url)
            {
             document.forms[0].action = url;
             return true;
            }
            
        </script>
        <script>
            $(function () {

                $(".datepicker").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    yearRange: "-68:+42",
                    dateFormat: "dd/mm/yy"
              /*     monthNamesShort  : fullmonth_array         */

                });
            });
        </script>
    </body>
    <%
        }else {
    response.sendRedirect("stat.jsp");
}
    %>
</html>
