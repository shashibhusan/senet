<%-- 
    Document   : personalinfo
    Created on : 18 Mar, 2021, 4:07:28 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="common.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
            <style>
            #mainDiv
            {
               width: 100%;
               margin: auto;
               border: 1px solid #535353;
               overflow: auto;
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
            .sno{width: 5%; font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;text-align: center;}
            .tHead
            {
                width: 35%;
                padding: 10px;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            .dHead
            {
                width: 60%;
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
        
        try
        {
            con=ConnectionManager.getConnectionDirectForMySQL();
            st=con.createStatement();
            String sql="select * from eis_traininginfo where email='"+email+"'";
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
            <h2 class="mainHead">Insert Personal Details</h2><br/>
            <form name="InsertPersonalDetails" class="InsertPersonalDetails" id="InsertPersonalDetails" method="POST" autocomplete="off" action="InsertPersonalDetailsDB.jsp">
                <table align="center" class="Inserttable" id="Inserttable">

                    <tr>
                        <td class="sno">1.</td>
                        <td class="tHead">Trade<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">
                            <select id="uTrade" name="uTrade" type="text" class="selDiv">
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
                        <td class="sno">2.</td>
                        <td class="tHead">Physical Fitness Status<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead"><input id="uPhysical_fitness_status" name="uPhysical_fitness_status"  type="text"  class="inptbox" /></td>
                    </tr>
                    <tr>
                        <td class="sno">3.</td>
                        <td class="tHead">Area of Specialization in the Trade <span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead"><input id="uArea_Specialization_intrade" name="uArea_Specialization_intrade" type="text" class="inptbox"/></td>
                    </tr>
                    <tr>
                        <td class="sno">4.</td>
                        <td class="tHead">Specialization in other Trade<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead"><input id="uSpecializatio_other_trade" name="uSpecializatio_other_trade" type="text"  class="inptbox" /></td>
                    </tr>
                    <tr>
                        <td class="sno">5.</td>
                        <td class="tHead">Qualification<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead"><input id="uQualification" name="uQualification" type="text"  class="inptbox"/></td>
                    </tr>
                    <tr>
                        <td class="sno">6.</td>
                        <td class="tHead">Hobbies<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead"><input id="uHobbies" name="uHobbies" type="text" class="inptbox"/></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="mainHead">Training Required</td>
                    </tr>
                    <tr>
                        <td class="sno">7.</td>
                        <td class="tHead"><input class="inptbox"  type="text" placeholder="1st Training Name" name="Training_req_1" id="Training_req_1"></td>
                        <td class="dHead"><textarea class="inptbox"  cols="60" rows="3" name="training_one_detail" id="training_one_detail" placeholder="Details of first training required"></textarea></td>
                    </tr>
                    <tr>
                        <td class="sno">8.</td>
                        <td class="tHead"><input class="inptbox"  type="text" placeholder="2nd Training Name" name="Training_req_2" id="Training_req_2"></td>
                        <td class="dHead"><textarea class="inptbox"  cols="60" rows="3" name="training_two_detail" id="training_two_detail" placeholder="Details of second training required"></textarea></td>
                    </tr>
                    <tr>
                        <td class="sno">9.</td>
                        <td class="tHead"><input class="inptbox"  type="text" placeholder="3rd Training Name" name="Training_req_3" id="Training_req_3"></td>
                        <td class="dHead"><textarea class="inptbox"  cols="60" rows="3" name="training_three_detail" id="training_three_detail" placeholder="Details of third training required"></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align: center;">
                            <input class="btn clr3" type="submit" value="Submit" onclick="return ValidateForm();">
                            <input class="btn clr4" type="reset" value="reset" onclick="InsertPersonalDetails.reset()">
                        </td>
                    </tr>
                </table>  
            </form>
            <br/>
        </div>
        <%        } else {
                rs.beforeFirst();
                while(rs.next())
                {
        %>
        <div id="mainDiv">
            <h2 class="mainHead">Insert Personal Details</h2><br/>
                <table align="center" class="Inserttable" id="Inserttable">

                    <tr>
                        <td class="sno">1.</td>
                        <td class="tHead">Trade<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">&nbsp;&nbsp;<%=rs.getString("Trade")%></td>
                    </tr>
                    <tr>
                        <td class="sno">2.</td>
                        <td class="tHead">Physical Fitness Status<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">&nbsp;&nbsp;<%=rs.getString("phyFit")%></td>
                    </tr>
                    <tr>
                        <td class="sno">3.</td>
                        <td class="tHead">Area of Specialization in the Trade <span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">&nbsp;&nbsp;<%=rs.getString("sptTrade")%></td>
                    </tr>
                    <tr>
                        <td class="sno">4.</td>
                        <td class="tHead">Specialization in other Trade<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">&nbsp;&nbsp;<%=rs.getString("splOTrade")%></td>
                    </tr>
                    <tr>
                        <td class="sno">5.</td>
                        <td class="tHead">Qualification<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">&nbsp;&nbsp;<%=rs.getString("qualification")%></td>
                    </tr>
                    <tr>
                        <td class="sno">6.</td>
                        <td class="tHead">Hobbies<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="dHead">&nbsp;&nbsp;<%=rs.getString("hobbies")%></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="mainHead">Training Required</td>
                    </tr>
                    <tr>
                        <td class="sno">7.</td>
                        <td class="tHead">&nbsp;&nbsp;<%=rs.getString("tp_name_req_1")%></td>
                        <td class="dHead">&nbsp;&nbsp;<%=rs.getString("tp_det_1")%></td>
                    </tr>
                    <tr>
                        <td class="sno">8.</td>
                        <td class="tHead">&nbsp;&nbsp;<%=rs.getString("tp_name_req_2")%></td>
                        <td class="dHead">&nbsp;&nbsp;<%=rs.getString("tp_det_2")%></td>
                    </tr>
                    <tr>
                        <td class="sno">9.</td>
                        <td class="tHead">&nbsp;&nbsp;<%=rs.getString("tp_name_req_3")%></td>
                        <td class="dHead">&nbsp;&nbsp;<%=rs.getString("tp_det_3")%></td>
                    </tr>
                    
                </table>
            <br/>
        </div>
        <%            }
            con.close();
            rs.close();
            }
        %>
        <script>
            function ValidateForm()
            {
             if((document.InsertPersonalDetails.uTrade.value)==null || (document.InsertPersonalDetails.uTrade.value)=="")
                 {
                     alert("Please select your trade.")
                     document.getElementById("uTrade").focus();
                     return false;
                 }
                 else if((document.InsertPersonalDetails.uPhysical_fitness_status.value)==null || (document.InsertPersonalDetails.uPhysical_fitness_status.value)=="")
                        {
                            alert("Please enter your Physical fitness status.")
                            document.getElementById("uPhysical_fitness_status").focus();
                            return false;
                        }
                    else if((document.InsertPersonalDetails.uArea_Specialization_intrade.value)==null || (document.InsertPersonalDetails.uArea_Specialization_intrade.value)=="")
                            {
                                alert("Please enter your Area of Specialization in the Trade .")
                                document.getElementById("uArea_Specialization_intrade").focus();
                                return false;
                            }
                        else if((document.InsertPersonalDetails.uSpecializatio_other_trade.value)==null || (document.InsertPersonalDetails.uSpecializatio_other_trade.value)=="")
                                {
                                    alert("Please enter of Specialization in other Trade.")
                                    document.getElementById("uSpecializatio_other_trade").focus();
                                    return false;
                                }
                            else if((document.InsertPersonalDetails.uQualification.value)==null || (document.InsertPersonalDetails.uQualification.value)=="")
                                    {
                                        alert("Please enter your qualification.")
                                        document.getElementById("uQualification").focus();
                                        return false;
                                    }
                                else if((document.InsertPersonalDetails.uHobbies.value)==null || (document.InsertPersonalDetails.uHobbies.value)=="")
                                        {
                                            alert("Please enter your Hobbies.")
                                            document.getElementById("uHobbies").focus();
                                            return false;
                                        }
                                        else
                                            {
                                                var str="Please make sure the data you have entered is correct. once you submit, there is no option for edit. Are you want to proceed ?";
                                                var con=confirm(str);
                                                if(con==true)
                                                    {
                                                       return true;
                                                    }else
                                                        {
                                                            return false;
                                                        }
                                            }
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
