<%-- 
    Document   : allocationreport
    Created on : 14 Mar, 2022, 2:19:16 PM
    Author     : msme
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, common.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #main-div
            {
                width: 1200px;
                margin: auto;
                border: 1px solid  #009f76 ;
            }
            .head
            {
                border: 1px solid  #009f76 ;
                color:  #ffffff ;
                background-color: #009f76;
                width: 100%;
                margin: auto;
                font: normal normal 18px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 8px 0px 8px 0px;
                margin: 0px;
            }
            .mytable
            {
                width:99%;
                border: 1px #009f76 solid;
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color: #303030 ;
            }
            .table_head_all
            {
                background-color:  #b1e8da ;
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px #009f76 solid;
                color:  #303030 ;
                padding-left: 2px;
            }
            .table_head_all_1
            {
                background-color:  #fcfafa ;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px #009f76 solid;
                color:  #303030 ;
            }
            .table_head_all_2
            {
                background-color:  #fcfafa ;
                font: normal bold 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px #009f76 solid;
                color:  #303030 ;
            }

            .table_data{
                border: 1px #009f76 solid;
                font: normal normal 9px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding:1px;
                color:  #303030 ;
            }
            table, th, tr,td { border-collapse: collapse;} 
            .note
            {
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                margin-left: 10px;
                padding-bottom: 4px;
                color:  #d00000 ;
            }
            .al
            {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%
            String Random5 = (String) session.getAttribute("Random5");
            String mnm = request.getParameter("mnm");
            System.out.println("prakash chandradeynccffffff ---------B&A fund allocation======" + Random5);
            System.out.println("prakash chandradeynccffffff ---------B&A fund allocation======" + mnm);
            if (Random5.equals(mnm)) {
                
                session.setAttribute("mnm",mnm);
                String user = (String) session.getAttribute("user");
                System.out.println("change password ----- " + user);
//                if (user != null && user != "") {
                    int divFlag = 0, buttonFlag = 0;
                    String instId = (String) session.getAttribute("CmbIns");
                    String role = (String) session.getAttribute("rol");
                    String years = (String) session.getAttribute("CmbYear");
                    String months = (String) session.getAttribute("CmbMonth");
                    
        %>
        <div id="main-div">
            <h2 align="center" class="head">Allocated Funds details of FY. <%=years%></h2>
            <br/>
            <%
                Connection con = null;
                ResultSet rs = null;
                Statement st = null;
                try {
                    con = ConnectionManager.getConnectionDirectForMySQL();
                    st = con.createStatement();
                } catch (Exception err) {
                    err.printStackTrace();
                }
                Double tSalaries=0.0,tWages=0.0,tOver_time_allawance=0.0,tMedical_treatment=0.0,tTravel_expense_domestic=0.0;
                Double tTravel_expenses_foreign=0.0,tOffice_expenses=0.0,tRent_rate_taxes=0.0,tOther_admin_expenses=0.0,tAdvertisement_publicity=0.0;
                Double tProfessional_services=0.0,tGr_in_aid_general=0.0,tOther_charges=0.0,tDcanteen=0.0,tTotal=0.0;
                
                DecimalFormat pF = new DecimalFormat("0.000");
            %>
            <div class="note">*Amount in lakh.</div>
               <table align="center" class="mytable">
                    
                    <thead style="height: 35px;">
                      <td class="table_head_all">Sno</td>  
                      <td class="table_head_all">Institute Name</td>  
                      <td class="table_head_all">PAO Name</td>  
                      <td class="table_head_all">Salaries</td>  
                      <td class="table_head_all">Wages</td>  
                      <td class="table_head_all">Over Time<br/> Allowance</td>  
                      <td class="table_head_all">Medical<br/> Treatment</td>  
                      <td class="table_head_all">Travel<br/> Expenses<br/> (Domestic)</td>  
                      <td class="table_head_all">Travel<br/> Expenses <br/>(Foreign)</td>  
                      <td class="table_head_all">Office <br/>Expenses</td>  
                      <td class="table_head_all">Rent, Rate<br/> & Taxes</td>  
                      <td class="table_head_all">Other Admn.<br/> Expenses</td>  
                      <td class="table_head_all">Adver.<br/> & Publicity</td>  
                      <td class="table_head_all">Prof <br/>Services</td>  
                      <td class="table_head_all">Gr. in Aid<br/> General</td>  
                      <td class="table_head_all">Other<br/> Charges</td>  
                      <td class="table_head_all">Departmental<br/> Canteen</td> 
                      <td class="table_head_all">Total <br/>Allotment</td>  
                      <td class="table_head_all" style="width: 25px;">&nbsp;</td>  
                    </thead>
                    <%
                int i=0;
                String sql="select * from tbl_ba_fundallocation a join pao_branches b on a.inst_id=b.Inst_id where YEARS='"+years+"' order by b.sno asc";
                rs=st.executeQuery(sql);
                while(rs.next())
                {
                    i=i+1;
                    tSalaries=tSalaries+rs.getDouble("salaries");
                    tWages=tWages+rs.getDouble("wages");
                    tOver_time_allawance=tOver_time_allawance+rs.getDouble("over_time_allawance");
                    tMedical_treatment=tMedical_treatment+rs.getDouble("medical_treatment");
                    tTravel_expense_domestic=tTravel_expense_domestic+rs.getDouble("travel_expense_domestic");
                    tTravel_expenses_foreign=tTravel_expenses_foreign+rs.getDouble("travel_expenses_foreign");
                    tOffice_expenses=tOffice_expenses+rs.getDouble("office_expenses");
                    tRent_rate_taxes=tRent_rate_taxes+rs.getDouble("rent_rate_taxes");
                    tOther_admin_expenses=tOther_admin_expenses+rs.getDouble("other_admin_expenses");
                    tAdvertisement_publicity=tAdvertisement_publicity+rs.getDouble("advertisement_publicity");
                    tProfessional_services=tProfessional_services+rs.getDouble("professional_services");
                    tGr_in_aid_general=tGr_in_aid_general+rs.getDouble("gr_in_aid_general");
                    tOther_charges=tOther_charges+rs.getDouble("other_charges");
                    tDcanteen=tDcanteen+rs.getDouble("dcanteen");
                    tTotal=tTotal+rs.getDouble("total");
                    
                   
                    %>
                    
                    <tr>
                        <td class="table_head_all_1 al"><%=i%></td>
                        <td class="table_head_all_1"><%=rs.getString("inst_type")%> <%=rs.getString("inst_name")%></td>
                        <td class="table_head_all_1 al"><%=rs.getString("pao_name")%></td>
                        <td class="table_data" align="center"><%=rs.getDouble("salaries")%></td>
                        <td class="table_data" align="center"><%=rs.getDouble("wages")%></td>
                        <td class="table_data" align="center"><%=rs.getDouble("over_time_allawance")%></td>
                        <td class="table_data" align="center"><%=rs.getDouble("medical_treatment")%></td>
                        <td class="table_data" align="center"><%=rs.getDouble("travel_expense_domestic")%></td>
                        <td class="table_data" align="center"><%=rs.getDouble("travel_expenses_foreign")%></td>
                        <td class="table_data" align="center"><%=rs.getDouble("office_expenses")%></td>
                        <td class="table_data" align="center"><%=rs.getDouble("rent_rate_taxes")%></td>
                        <td class="table_data" align="center"><%=rs.getDouble("other_admin_expenses")%></td>
                        <td class="table_data" align="center"><%=rs.getDouble("advertisement_publicity")%></td>
                        <td class="table_data" align="center"><%=rs.getDouble("professional_services")%></td>
                        <td class="table_data" align="center"><%=rs.getDouble("gr_in_aid_general")%></td>
                        <td class="table_data" align="center"><%=rs.getDouble("other_charges")%></td>
                        <td class="table_data" align="center"><%=rs.getDouble("dcanteen")%></td>
                        <td class="table_data" align="center"><%=rs.getDouble("total")%></td>
                        <td class="table_data" align="center"><a href="allocationdetail.jsp?sid=<%=rs.getString("a.inst_id")%>&seckey=<%=rs.getString("a.sno")%>"><img src="edit-icon.jpg" height="15" width="15" alt="edit"/></a></td>
                    </tr>
 <%
                    }
                 Double gTotal=tSalaries+tWages+tOver_time_allawance+tMedical_treatment+tTravel_expense_domestic+tTravel_expenses_foreign+
                            tOffice_expenses+tRent_rate_taxes+tOther_admin_expenses+tAdvertisement_publicity+tProfessional_services+tGr_in_aid_general+
                            tOther_charges+tDcanteen;
                 System.out.println("Grand total calculated manually=="+gTotal);
                    String notIn="select inst_type,Inst_id, inst_name,pao_id,pao_name from pao_branches where inst_id not in (select inst_id from tbl_ba_fundallocation where YEARS='"+years+"') order by Inst_id asc";
                    rs=st.executeQuery(notIn);
                    while(rs.next())
                    {
                        i=i+1;
%>    
<tr>
                        <td class="table_head_all_1 al"><%=i%></td>
                        <td class="table_head_all_1"><%=rs.getString("inst_type")%> <%=rs.getString("inst_name")%></td>
                        <td class="table_head_all_1 al"><%=rs.getString("pao_name")%></td>
                        <td class="table_data" align="center">0</td>
                        <td class="table_data" align="center">0</td>
                        <td class="table_data" align="center">0</td>
                        <td class="table_data" align="center">0</td>
                        <td class="table_data" align="center">0</td>
                        <td class="table_data" align="center">0</td>
                        <td class="table_data" align="center">0</td>
                        <td class="table_data" align="center">0</td>
                        <td class="table_data" align="center">0</td>
                        <td class="table_data" align="center">0</td>
                        <td class="table_data" align="center">0</td>
                        <td class="table_data" align="center">0</td>
                        <td class="table_data" align="center">0</td>
                        <td class="table_data" align="center">0</td>
                        <td class="table_data" align="center">0</td>
                        <td class="table_data" align="center">-</td>
                    </tr>
                    <%}%>
                    <tr style="height: 30px;">
                        <td class="table_head_all_2 al" colspan="3"> Grand Total</td>
                        <td class="table_head_all_2 al"><%=pF.format(tSalaries)%></td>
                        <td class="table_head_all_2 al"><%=pF.format(tWages)%></td>
                        <td class="table_head_all_2 al"><%=pF.format(tOver_time_allawance)%></td>
                        <td class="table_head_all_2 al"><%=pF.format(tMedical_treatment)%></td>
                        <td class="table_head_all_2 al"><%=pF.format(tTravel_expense_domestic)%></td>
                        <td class="table_head_all_2 al"><%=pF.format(tTravel_expenses_foreign)%></td>
                        <td class="table_head_all_2 al"><%=pF.format(tOffice_expenses)%></td>
                        <td class="table_head_all_2 al"><%=pF.format(tRent_rate_taxes)%></td>
                        <td class="table_head_all_2 al"><%=pF.format(tOther_admin_expenses)%></td>
                        <td class="table_head_all_2 al"><%=pF.format(tAdvertisement_publicity)%></td>
                        <td class="table_head_all_2 al"><%=pF.format(tProfessional_services)%></td>
                        <td class="table_head_all_2 al"><%=pF.format(tGr_in_aid_general)%></td>
                        <td class="table_head_all_2 al"><%=pF.format(tOther_charges)%></td>
                        <td class="table_head_all_2 al"><%=pF.format(tDcanteen)%></td>
                        <td class="table_head_all_2 al"><%=pF.format(tTotal)%></td>
                    </tr>
                </table>
            <br/>
            <div style="width: 150px; margin: auto">
                <input type="button" value="Print" onclick="window.print()"/>
            </div>
            
            <br/><br/>
        </div>
            <%
//                } else {
//                    response.sendRedirect("stat.jsp");
//                }
            } else {
                System.out.println("we did not get nmn value at allocation page");
                response.sendRedirect("stat.jsp");
                
            }
        %>
    </body>
</html>
