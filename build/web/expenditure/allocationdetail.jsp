<%-- 
    Document   : allocationdetail
    Created on : 15 Mar, 2022, 10:16:04 AM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, common.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            #main-div
            {
                width: 900px;
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
            #head1
            {
                width: 100%;
                font: normal bold 18px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 8px 0px 8px 0px;
                margin: 0px;
                padding: 0px;
            }
            .mytable
            {
                width: 50%;
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

            .table_data{
                border: 1px #009f76 solid;
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding:3px;
                color:  #303030 ;
                width: 100px;
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
            .btn
            {
                width: 90px;
                padding: 4px 0px 4px 0px;

            }
            .bg1{ background-color:  #b1e8da ; border: 1px #009f76 solid;}
            .bg2{ background-color:  #ffe9e4 ;  border: 1px  #f44925 solid;}
            .bg1:hover{background-color:  #009f76 ; color:#ffffff ; cursor: pointer;}
            .bg2:hover{background-color:  #f44925 ; color:#ffffff ; cursor: pointer;}

            #allocation-edit-div
            {
                display: none;
            }
            .input-box
            {
                padding: 1px;
                margin: 0px;
                border: 1px solid #b5d3a7 ;
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                text-align: center;
                width: 60px;
            }
        </style>
        <script type="text/javascript" src="/javaScript/jquery-3.4.1.min.js" />
        <script>
            $(document).on("change", ".input-box", function() {
                var sum = 0;
                $(".input-box").each(function() {
                    sum += +$(this).val();
                });
                $("#total").val(sum);
            });
        </script>
    </head>
    <body>
        <%
            String Random5 = (String) session.getAttribute("Random5");
            String mnm = (String) session.getAttribute("mnm");
            System.out.println("prakash chandradeynccffffff ---------B&A fund allocation detail edit======" + Random5);
            System.out.println("prakash chandradeynccffffff ---------B&A fund allocation detail edit======" + mnm);
            if (Random5.equals(mnm)) {

                String user = (String) session.getAttribute("user");
                System.out.println("change password ----- " + user);
//                if (user != null && user != "") {
                int divFlag = 0, buttonFlag = 0;
                //String instId = (String) session.getAttribute("CmbIns");
                String role = (String) session.getAttribute("rol");
                String years = (String) session.getAttribute("CmbYear");
                String months = (String) session.getAttribute("CmbMonth");

                String inst_id = request.getParameter("sid");
                String seckey = request.getParameter("seckey");
                
                System.out.println("inst_id"+inst_id);
                System.out.println("years"+years);

                Connection con = null;
                Statement st = null;
                ResultSet rs = null;
                try {
                    con = ConnectionManager.getConnectionDirectForMySQL();
                    st = con.createStatement();
                    String sql = "select * from tbl_ba_fundallocation a join pao_branches b on a.inst_id=b.Inst_id where a.YEARS='" + years + "' and a.inst_id='" + inst_id + "'";
                    rs = st.executeQuery(sql);
                    while (rs.next()) {
        %>
        <div id="main-div">
            <h2 align="center" class="head">Allocated Funds details of FY. <%=years%></h2>
            <br/>
            <h2 id="head1" align="center" >Institute Name: <%=rs.getString("b.inst_type")%> <%=rs.getString("b.inst_name")%></h2>
            <h2 id="head1" align="center" >PAO Name: <%=rs.getString("b.pao_name")%></h2>
            <br/>
            <%
                        
                        System.out.println("pao_name-------rgv------------"+rs.getString("b.pao_name"));
                        System.out.println("inst_name-------rgv-----------"+rs.getString("b.inst_name"));
            %>
            
            <div id="allocation-report-div">
                <table align="center" class="mytable">

                    <thead style="height: 35px;">
                    <td class="table_head_all">Sno</td>  
                    <td class="table_head_all">Sub Head</td>  
                    <td class="table_head_all">Budget Code</td>  
                    <td class="table_head_all">Allotment<br/>(<%=(rs.getString("a.creation_date")).substring(0, 10)%>)</td>  
                    </thead>

                    <tr>
                        <td class="table_head_all_1 al">1.</td>
                        <td class="table_head_all_1">Salaries</td>
                        <td class="table_head_all_1 al">(98.02.01)</td>
                        <td class="table_data al"><%=rs.getString("a.salaries")%></td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">2.</td>
                        <td class="table_head_all_1">Wages</td>
                        <td class="table_head_all_1 al">(98.02.02)</td>
                        <td class="table_data al"><%=rs.getString("a.wages")%></td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">3.</td>
                        <td class="table_head_all_1">Over Time Allowance</td>
                        <td class="table_head_all_1 al">(98.02.03)</td>
                        <td class="table_data al"><%=rs.getString("a.over_time_allawance")%></td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">4.</td>
                        <td class="table_head_all_1">Medical Treatment</td>
                        <td class="table_head_all_1 al">(98.02.06)</td>
                        <td class="table_data al"><%=rs.getString("a.medical_treatment")%></td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">5.</td>
                        <td class="table_head_all_1">Travel Expenses (Domestic)</td>
                        <td class="table_head_all_1 al">(98.02.11)</td>
                        <td class="table_data al"><%=rs.getString("a.travel_expense_domestic")%></td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">6.</td>
                        <td class="table_head_all_1">Travel Expenses (Foreign)</td>
                        <td class="table_head_all_1 al">(98.02.12)</td>
                        <td class="table_data al"><%=rs.getString("a.travel_expenses_foreign")%></td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">7.</td>
                        <td class="table_head_all_1">Office Expenses</td>
                        <td class="table_head_all_1 al">(98.02.13)</td>
                        <td class="table_data al"><%=rs.getString("a.office_expenses")%></td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">8.</td>
                        <td class="table_head_all_1">Rent, Rate & Taxes</td>
                        <td class="table_head_all_1 al">(98.02.14)</td>
                        <td class="table_data al"><%=rs.getString("a.rent_rate_taxes")%></td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">9.</td>
                        <td class="table_head_all_1">Other Admn. Expenses</td>
                        <td class="table_head_all_1 al">(98.02.20)</td>
                        <td class="table_data al"><%=rs.getString("a.other_admin_expenses")%></td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">10.</td>
                        <td class="table_head_all_1">Advertisement & Publicity</td>
                        <td class="table_head_all_1 al">(98.02.26)</td>
                        <td class="table_data al"><%=rs.getString("a.advertisement_publicity")%></td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">11.</td>
                        <td class="table_head_all_1">Professional Services</td>
                        <td class="table_head_all_1 al">(98.02.28)</td>
                        <td class="table_data al"><%=rs.getString("a.professional_services")%></td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">12.</td>
                        <td class="table_head_all_1">Gr. in Aid General</td>
                        <td class="table_head_all_1 al">(98.02.31)</td>
                        <td class="table_data al"><%=rs.getString("a.gr_in_aid_general")%></td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">13.</td>
                        <td class="table_head_all_1">Other Charges</td>
                        <td class="table_head_all_1 al">(98.02.50)</td>
                        <td class="table_data al"><%=rs.getString("a.other_charges")%></td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1 al">14.</td>
                        <td class="table_head_all_1">Departmental Canteen</td>
                        <td class="table_head_all_1 al">(98.03.20)</td>
                        <td class="table_data al"><%=rs.getString("a.dcanteen")%></td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">15.</td>
                        <td class="table_head_all_1" colspan="2">Total Allotment</td>
                        <td class="table_data al"><b><%=rs.getString("a.total")%></b></td>
                    </tr>

                    <tr style="height: 35px;">
                        <td colspan="8" style="text-align: center">
                            <%
                        if(!(rs.getString("a.isEdited")).equals("yes")){
                            %>
                            <input type="button" class="btn bg2" value="edit amount" onclick="return EditAllocation()"/>&nbsp;&nbsp;
                            <%}else{%>
                            <font style="color: green; font-weight: bolder" >&radic; edited </font>&nbsp;&nbsp;&nbsp;&nbsp;
                            <%}%>
                            <input type="submit" class="btn bg1" value="add funds"/> 
                        </td>
                    </tr>
                </table>
            </div>
            <div id="allocation-edit-div">
                <form name="UploadAllocation" id="UploadAllocation" method="POST" action="../UploadAllocationEditedMain" autocomplete="off" onsubmit="return ValidateUploadAllocation();">
                    <table align="center" class="mytable">
                    <input type="hidden" id="InstId" name="InstId" value="<%=inst_id%>" />
                    <input type="hidden" id="years" name="years" value="<%=years%>" />
                    <input type="hidden" id="pao" name="pao" value="<%=rs.getString("b.pao_name")%>" />
                    <input type="hidden" id="branchName" name="branchName" value="<%=rs.getString("b.inst_name")%>" />
                        <thead style="height: 35px;">
                        <td class="table_head_all">Sno</td>  
                        <td class="table_head_all">Sub Head</td>  
                        <td class="table_head_all">Budget Code</td>  
                        <td class="table_head_all">Allotment<br/>(<%=(rs.getString("a.creation_date")).substring(0, 10)%>)</td>  
                        </thead>

                        <tr>
                            <td class="table_head_all_1 al">1.</td>
                            <td class="table_head_all_1">Salaries</td>
                            <td class="table_head_all_1 al">(98.02.01)</td>
                            <td class="table_data al">
                                <input name="salaries" id="salaries" index='1' class="input-box" type="text" value="<%=rs.getString("a.salaries")%>"
                                       onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='17' onkeypress="return isNumber(event)"/></td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">2.</td>
                            <td class="table_head_all_1">Wages</td>
                            <td class="table_head_all_1 al">(98.02.02)</td>
                            <td class="table_data al">
                                <input name="wages" id="wages" index='2' class="input-box" type="text" value="<%=rs.getString("a.wages")%>" 
                                       onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='17' onkeypress="return isNumber(event)"/></td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">3.</td>
                            <td class="table_head_all_1">Over Time Allowance</td>
                            <td class="table_head_all_1 al">(98.02.03)</td>
                            <td class="table_data al">
                                <input name="over_time_allawance" id="over_time_allawance" index='3' class="input-box" type="text" value="<%=rs.getString("a.over_time_allawance")%>" 
                                       onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='17' onkeypress="return isNumber(event)"/></td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">4.</td>
                            <td class="table_head_all_1">Medical Treatment</td>
                            <td class="table_head_all_1 al">(98.02.06)</td>
                            <td class="table_data al">
                                <input name="medical_treatment" id="medical_treatment" index='4' class="input-box" type="text" value="<%=rs.getString("a.medical_treatment")%>" 
                                       onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='17' onkeypress="return isNumber(event)"/></td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">5.</td>
                            <td class="table_head_all_1">Travel Expenses (Domestic)</td>
                            <td class="table_head_all_1 al">(98.02.11)</td>
                            <td class="table_data al">
                                <input name="travel_expense_domestic" id="travel_expense_domestic" index='5' class="input-box" type="text" value="<%=rs.getString("a.travel_expense_domestic")%>" 
                                       onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='17' onkeypress="return isNumber(event)"/></td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">6.</td>
                            <td class="table_head_all_1">Travel Expenses (Foreign)</td>
                            <td class="table_head_all_1 al">(98.02.12)</td>
                            <td class="table_data al">
                                <input name="travel_expenses_foreign" id="travel_expenses_foreign" index='6' class="input-box" type="text" value="<%=rs.getString("a.travel_expenses_foreign")%>" 
                                       onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='17' onkeypress="return isNumber(event)"/></td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">7.</td>
                            <td class="table_head_all_1">Office Expenses</td>
                            <td class="table_head_all_1 al">(98.02.13)</td>
                            <td class="table_data al">
                                <input name="office_expenses" id="office_expenses" index='7' class="input-box" type="text" value="<%=rs.getString("a.office_expenses")%>" 
                                       onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='17' onkeypress="return isNumber(event)"/></td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">8.</td>
                            <td class="table_head_all_1">Rent, Rate & Taxes</td>
                            <td class="table_head_all_1 al">(98.02.14)</td>
                            <td class="table_data al">
                                <input name="rent_rate_taxes" id="rent_rate_taxes" index='8' class="input-box" type="text" value="<%=rs.getString("a.rent_rate_taxes")%>" 
                                       onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='17' onkeypress="return isNumber(event)"/></td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">9.</td>
                            <td class="table_head_all_1">Other Admn. Expenses</td>
                            <td class="table_head_all_1 al">(98.02.20)</td>
                            <td class="table_data al">
                                <input name="other_admin_expenses" id="other_admin_expenses" class="input-box" type="text" index='9' value="<%=rs.getString("a.other_admin_expenses")%>" 
                                       onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='17' onkeypress="return isNumber(event)"/></td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">10.</td>
                            <td class="table_head_all_1">Advertisement & Publicity</td>
                            <td class="table_head_all_1 al">(98.02.26)</td>
                            <td class="table_data al">
                                <input name="advertisement_publicity" id="advertisement_publicity" class="input-box" type="text" index='10' value="<%=rs.getString("a.advertisement_publicity")%>" 
                                       onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='17' onkeypress="return isNumber(event)"/></td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">11.</td>
                            <td class="table_head_all_1">Professional Services</td>
                            <td class="table_head_all_1 al">(98.02.28)</td>
                            <td class="table_data al">
                                <input name="professional_services" id="professional_services" class="input-box" type="text" index='11' value="<%=rs.getString("a.professional_services")%>" 
                                       onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='17' onkeypress="return isNumber(event)"/></td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">12.</td>
                            <td class="table_head_all_1">Gr. in Aid General</td>
                            <td class="table_head_all_1 al">(98.02.31)</td>
                            <td class="table_data al">
                                <input name="gr_in_aid_general" id="gr_in_aid_general"  class="input-box" type="text" index='12' value="<%=rs.getString("a.gr_in_aid_general")%>" 
                                       onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='17' onkeypress="return isNumber(event)"/></td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">13.</td>
                            <td class="table_head_all_1">Other Charges</td>
                            <td class="table_head_all_1 al">(98.02.50)</td>
                            <td class="table_data al">
                                <input name="other_charges" id="other_charges" class="input-box" type="text" index='13' value="<%=rs.getString("a.other_charges")%>" 
                                       onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='17' onkeypress="return isNumber(event)"/></td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1 al">14.</td>
                            <td class="table_head_all_1">Departmental Canteen</td>
                            <td class="table_head_all_1 al">(98.03.20)</td>
                            <td class="table_data al">
                                <input name="dcanteen" id="dcanteen"  class="input-box" type="text" index='14' value="<%=rs.getString("a.dcanteen")%>" 
                                       onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='17' onkeypress="return isNumber(event)"/></td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">15.</td>
                            <td class="table_head_all_1" colspan="2">Total Allotment</td>
                            <td class="table_data al">
                                <input name="total" id="total" readonly="2" class="input-box" type="text" value="<%=rs.getString("a.total")%>" 
                                       onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='17' onkeypress="return isNumber(event)"/></td>
                        </tr>

                        <tr style="height: 35px;">
                            <td colspan="8" style="text-align: center">
                                <input type="reset" class="btn bg2" value="reset" onclick="window.reset()"/>&nbsp;&nbsp;
                                <input type="submit" class="btn bg1" value="submit"/> 
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <br/>
            <br/>
        </div>
        <%
                    }
                } catch (Exception er) {
                    er.printStackTrace();
                }
//                } else {
//                    response.sendRedirect("stat.jsp");
//                }
            } else {
                System.out.println("we did not get nmn value at allocation page");
                response.sendRedirect("stat.jsp");

            }
        %>
        <script>
            function CalculateTotal(val1, val2, val3, val4, val5, val6, val7, val8, val9, val10, val11, val12, val13, val14, total)
            {
                val1 = Number(val1.value);
                val2 = Number(val2.value);
                val3 = Number(val3.value);
                val4 = Number(val4.value);
                val5 = Number(val5.value);
                val6 = Number(val6.value);
                val7 = Number(val7.value);
                val8 = Number(val8.value);
                val9 = Number(val9.value);
                val10 = Number(val10.value);
                val11 = Number(val11.value);
                val12 = Number(val12.value);
                val13 = Number(val13.value);
                val14 = Number(val14.value);
                var fTotal = val1 + val2 + val3 + val4 + val5 + val6 + val7 +val8 + val9 + val10 + val11 + val12 + val13 + val14;
                total.value = fTotal.toFixed(2);
            }
            
                function EditAllocation()
                {
                    alert("we are going to edit allocation.");
                    document.getElementById("allocation-report-div").style.display = "none";
                    document.getElementById("allocation-edit-div").style.display = "block";
                }
         function ValidateUploadAllocation()
            {
                if (document.UploadAllocation.pao.value == null || document.UploadAllocation.pao.value == "") {
                    alert("Please select PAO name!!!");
                    document.getElementById("pao").focus();
                    return false;
                }
                else if (document.UploadAllocation.branchName.value == null || document.UploadAllocation.branchName.value == "") {
                    alert("Please select name of the branch!!!");
                    document.getElementById("branchName").focus();
                    return false;
                }
                else if (document.UploadAllocation.salaries.value == null || document.UploadAllocation.salaries.value == "")
                {
                    alert("Please enter the amount allocated in 98.02.01 head (Salaries)");
                    document.getElementById("salaries").focus();
                    return false;
                }
                else if (document.UploadAllocation.wages.value == null || document.UploadAllocation.wages.value == "")
                {
                    alert("Please enter the amount allocated in 98.02.02 head (Wages)");
                    document.getElementById("wages").focus();
                    return false;
                }
                else if (document.UploadAllocation.over_time_allawance.value == null || document.UploadAllocation.over_time_allawance.value == "")
                {
                    alert("Please enter the amount allocated in 98.02.03 head (Over Time Allowance)");
                    document.getElementById("over_time_allawance").focus();
                    return false;
                }
                else if (document.UploadAllocation.medical_treatment.value == null || document.UploadAllocation.medical_treatment.value == "")
                {
                    alert("Please enter the amount allocated in 98.02.06 head (Medical Treatment)");
                    document.getElementById("medical_treatment").focus();
                    return false;
                }
                else if (document.UploadAllocation.travel_expense_domestic.value == null || document.UploadAllocation.travel_expense_domestic.value == "")
                {
                    alert("Please enter the amount allocated in 98.02.11 head (Travel Expenses (Domestic))");
                    document.getElementById("travel_expense_domestic").focus();
                    return false;
                }
                else if (document.UploadAllocation.travel_expenses_foreign.value == null || document.UploadAllocation.travel_expenses_foreign.value == "")
                {
                    alert("Please enter the amount allocated in 98.02.12 head (Travel Expenses (Foreign))");
                    document.getElementById("travel_expenses_foreign").focus();
                    return false;
                }
                else if (document.UploadAllocation.office_expenses.value == null || document.UploadAllocation.office_expenses.value == "")
                {
                    alert("Please enter the amount allocated in 98.03.13 head (Office Expenses)");
                    document.getElementById("office_expenses").focus();
                    return false;
                }
                else if (document.UploadAllocation.rent_rate_taxes.value == null || document.UploadAllocation.rent_rate_taxes.value == "")
                {
                    alert("Please enter the amount allocated in 98.03.14 head (Rent, Rate & Taxes)");
                    document.getElementById("rent_rate_taxes").focus();
                    return false;
                }
                else if (document.UploadAllocation.other_admin_expenses.value == null || document.UploadAllocation.other_admin_expenses.value == "")
                {
                    alert("Please enter the amount allocated in 98.03.20 head (Other Admn. Expenses)");
                    document.getElementById("other_admin_expenses").focus();
                    return false;
                }
                else if (document.UploadAllocation.advertisement_publicity.value == null || document.UploadAllocation.advertisement_publicity.value == "")
                {
                    alert("Please enter the amount allocated in 98.03.26 head (Advertisement & Publicity)");
                    document.getElementById("advertisement_publicity").focus();
                    return false;
                }
                else if (document.UploadAllocation.professional_services.value == null || document.UploadAllocation.professional_services.value == "")
                {
                    alert("Please enter the amount allocated in 98.03.28 head (Professional Services)");
                    document.getElementById("professional_services").focus();
                    return false;
                }
                else if (document.UploadAllocation.gr_in_aid_general.value == null || document.UploadAllocation.gr_in_aid_general.value == "")
                {
                    alert("Please enter the amount allocated in 98.03.31 head (Gr. in Aid General)");
                    document.getElementById("gr_in_aid_general").focus();
                    return false;
                }
                else if (document.UploadAllocation.other_charges.value == null || document.UploadAllocation.other_charges.value == "")
                {
                    alert("Please enter the amount allocated in 98.03.50 head (Other Charges)");
                    document.getElementById("other_charges").focus();
                    return false;
                }
                else if (document.UploadAllocation.dcanteen.value == null || document.UploadAllocation.dcanteen.value == "")
                {
                    alert("Please enter the amount allocated in 98.03.20 head (Departmental Canteen)");
                    document.getElementById("dcanteen").focus();
                    return false;
                }
                else
                {
                    var cnf = "Do you want to upload this target?";
                    var c = confirm(cnf);
                    if (c == true)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }

        </script>
    </body>
</html>
