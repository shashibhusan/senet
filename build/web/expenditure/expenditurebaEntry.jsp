<%-- 
    Document   : expenditurebaEntry
    Created on : 8 Mar, 2022, 2:36:49 PM
    Author     : msme
--%>

<%@page import="com.ibm.icu.text.NumberFormat"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.Format"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, common.*" %>
<%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Expenditure Entry</title>
        <link rel="stylesheet" href="expenditureba.css">
        <script type="text/javascript" src="code.jquery.com/jquery-2.1.0.min.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script type="text/javascript">
            function isNumber(evt) {
                evt = (evt) ? evt : window.event;

                var charCode = (evt.which) ? evt.which : evt.keyCode;
                // alert(charCode);
                if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) {
                    alert("Please enter numbers only !");
                    return false;
                }
                return true;
            }

        </script>
        <script>
            var ss = sessionStorage.getItem('uniqueIdSessionStorage');
            if (ss === '' || ss === null)
            {
                window.location = 'slogin.jsp';
            }
        </script>
        <script type="text/javascript">
<!--
            function PrintDate() {
                today = new Date();
                document.write('Date: ', today.getDate(), '/', today.getMonth() + 1, '/', today.getYear());
            }
//-->
        </script>
        <style>
            #main-div
            {
                width: 99%;
                margin: auto;
                border: 1px solid  #009f76 ;
            }
            #main-div-error
            {
                width: 99%;
                height: 250px;
                margin: auto;
                border: 1px solid  #c10000 ;
                color:  #c10000 ;
                background-color: #fff8f8 ;
                font: normal normal 18px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            p{vertical-align: central;}
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
                width: 70%;
                border: 1px #ffb600 solid;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color:  #303030 ;
            }
            .div-staff-form
            {
                width: 85%;
                margin: auto;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            .mytable1
            {
                width: 100%;
                border: 1px #ffb600 solid;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color:  #303030 ;
            }
            .table_head_all
            {
                background-color:  #fffbf1 ;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px #ffb600  solid;
                color:  #303030 ;
                padding-left: 5px;
            }
            .table_head_all_1
            {
                background-color:  #fcfafa ;
                padding: 3px 0px 3px 2px;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px #ffb600 solid;
                color:  #303030 ;
            }

            .table_data{
                border: 1px #ffb600 solid;
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 2px 0px 2px 2px;
                color:  #303030 ;
            }
            table, th, tr,td { border-collapse: collapse;} 
            .mytable-head
            {
                width: 70%;
                border: 1px #009f76 solid;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }

            .input-box
            {
                padding: 3px 0px 3px 0px;
                margin: 0px;
                border: 1px #ffb600 solid;
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                text-align: center;
                width: 70px;

            }
            .input-box1
            {
                padding: 3px 0px 3px 0px;
                margin: 0px;
                border: 1px #ffb600 solid;
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                text-align: center;
                width: 70px;

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
            .al
            {
                text-align: center;
            }
            .wdt
            {
                width: 100px;
            }
            .main-head
            {
                font: normal bold 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 1.5px;
                color:  #333333 ;
            }
        </style>
    </head>
    <body>
        <%
            String Random5 = (String) session.getAttribute("Random5");
            String mnm = request.getParameter("mnm");
            System.out.println("prakash chandradeynccffffff ---------B&A expenditure entry======" + Random5);
            System.out.println("prakash chandradeynccffffff ---------B&A expenditure entry======" + mnm);
            if (Random5.equals(mnm)) {

                DecimalFormat pF = new DecimalFormat("0.00");

                String user = (String) session.getAttribute("user");
//                if (user != null && user != "") {
                int divFlag = 0, buttonFlag = 0;
                String instId = (String) session.getAttribute("CmbIns");
                String role = (String) session.getAttribute("rol");
                String years = (String) session.getAttribute("CmbYear");
                String months = (String) session.getAttribute("CmbMonth");
                String mName = "";
                if (months.equals("1")) {
                    mName = "April";
                } else if (months.equals("2")) {
                    mName = "May";
                } else if (months.equals("3")) {
                    mName = "June";
                } else if (months.equals("4")) {
                    mName = "July";
                } else if (months.equals("5")) {
                    mName = "August";
                } else if (months.equals("6")) {
                    mName = "September";
                } else if (months.equals("7")) {
                    mName = "October";
                } else if (months.equals("8")) {
                    mName = "November";
                } else if (months.equals("9")) {
                    mName = "December";
                } else if (months.equals("10")) {
                    mName = "January";
                } else if (months.equals("11")) {
                    mName = "February";
                } else if (months.equals("12")) {
                    mName = "March";
                }


        %>

        <%
            Format format = com.ibm.icu.text.NumberFormat.getNumberInstance(new Locale("en", "in"));


            Connection con = null;
            ResultSet rs = null;
            Statement st = null;
            int checkflag = 0;
            try {
                con = ConnectionManager.getConnectionDirectForMySQL();
                st = con.createStatement();
            } catch (Exception err) {
                err.printStackTrace();
            }

            String inst_name = "select * from pao_branches where Inst_id='" + instId + "'";
            rs = st.executeQuery(inst_name);
            if (rs.next()) {
                checkflag = 1;
                inst_name = rs.getString("inst_type") + " " + rs.getString("inst_name");
            } else if (role.equals("SU")) {
                checkflag = 1;
            }
            System.out.println("we are on expenditure entry-----" + role);
            System.out.println("we are on expenditure entry-----" + instId);
            if (checkflag == 0) {

        %>
        <div id="main-div-error">
            <p><br/><br/><br/>
                You are not eligible to upload expenditure. Please contact to budget department.
            </p>
        </div>

        <%        } else {
        %>
        <%
            int isDataUpdated = 0;
            String checkQuery = "select * from tbl_ba_expenditure where YEARS='" + years + "' and inst_id='" + instId + "' and MONTHS='" + months + "'";
            rs = st.executeQuery(checkQuery);
            if (rs.next()) {
                isDataUpdated = 1;
                System.out.println("expenditure is already updated for the given month");
            }


        %>

        <%
            Double expSalaries = 0.0;
            Double expWages = 0.0;
            Double expOver_time_allawance = 0.0;
            Double expMedical_treatment = 0.0;
            Double expTravel_expense_domestic = 0.0;
            Double expTravel_expenses_foreign = 0.0;
            Double expOffice_expenses = 0.0;
            Double expRent_rate_taxes = 0.0;
            Double expOther_admin_expenses = 0.0;
            Double expAdvertisement_publicity = 0.0;
            Double expProfessional_services = 0.0;
            Double expGr_in_aid_general = 0.0;
            Double expOther_charges = 0.0;
            Double expDcanteen = 0.0;
            Double expTotal = 0.0;

            if (isDataUpdated == 0) {
                String getAllocation = "select * from tbl_ba_fundallocation  where YEARS='" + years + "' and inst_id='" + instId + "'";
                Statement st1 = con.createStatement();
                ResultSet rs1 = st1.executeQuery(getAllocation);
                while (rs1.next()) {
                    String getExpenditure = "select * from tbl_ba_expenditure where YEARS='" + years + "' and inst_id='" + instId + "' and MONTHS <= '" + months + "'";
                    Statement st2 = con.createStatement();
                    ResultSet rs2 = st2.executeQuery(getExpenditure);
                    while (rs2.next()) {
                        expSalaries = expSalaries + rs2.getDouble("salaries");
                        expWages = expWages + rs2.getDouble("Wages");
                        expOver_time_allawance = expOver_time_allawance + rs2.getDouble("over_time_allawance");
                        expMedical_treatment = expMedical_treatment + rs2.getDouble("medical_treatment");
                        expTravel_expense_domestic = expTravel_expense_domestic + rs2.getDouble("travel_expense_domestic");
                        expTravel_expenses_foreign = expTravel_expenses_foreign + rs2.getDouble("travel_expenses_foreign");
                        expOffice_expenses = expOffice_expenses + rs2.getDouble("office_expenses");
                        expRent_rate_taxes = expRent_rate_taxes + rs2.getDouble("rent_rate_taxes");
                        expOther_admin_expenses = expOther_admin_expenses + rs2.getDouble("other_admin_expenses");
                        expAdvertisement_publicity = expAdvertisement_publicity + rs2.getDouble("advertisement_publicity");
                        expProfessional_services = expProfessional_services + rs2.getDouble("professional_services");
                        expGr_in_aid_general = expGr_in_aid_general + rs2.getDouble("gr_in_aid_general");
                        expOther_charges = expOther_charges + rs2.getDouble("other_charges");
                        expDcanteen = expDcanteen + rs2.getDouble("dcanteen");
                        expTotal = expTotal + rs2.getDouble("total");
                    }
        %>
        <div id="main-div">
            <h2 align="center" class="head">Expenditure Entry </h2>
            <h2 align="center" style="font-size:large;font-family:Verdana;font-weight:bold" align="center"><font color="#990000"><u>PROFORMA</u></h2>
            <!--<h2 align="center" style="font-size:large;font-family:Verdana;font-weight:bold" align="center"><font color="#990000">Expenditure entry for <%=mName%> : <%=years%> </h2>-->  


            <form name="InsertExpenditure" id="InsertExpenditure" method="POST" action="../InsertExpenditureMain" autocomplete="off" onsubmit="return ValidateInsertExpenditure()">
                <div class="div-staff-form">
                    <div class="main-head"> Name of Institute & Place : <u><%=inst_name%></u></div>
                    <div class="main-head"> Consolidation of expenditure statement entry for the month of <u><%=mName%>, <%=years%></u></div>
                    <div class="main-head"> Major Head "2851"</div><br/>
                    <div class="main-head"> Break-up of Salaries</div>
                    <table align="center" class="mytable1">
                        <tr style="height: 40px;">
                            <td class="table_head_all">&nbsp;</td>  
                            <td class="table_head_all">No of staff</td>  
                            <td class="table_head_all al">Pay</td>  
                            <td class="table_head_all al">D.A.</td>  
                            <td class="table_head_all al">HRA</td>  
                            <td class="table_head_all al">TA</td>  
                            <td class="table_head_all al">Other Allowances</td>
                            <td class="table_head_all al">Progressive total</td>
                        </tr>
                        <tr>
                            <td class="table_head_all wdt">G.O.</td> 
                            <td class="table_head_all_1 al">
                                <input type="text" class="input-box1" id="go_no_of_staff" name="go_no_of_staff"
                                       onblur="CalculateSalBreakupRow(go_no_of_staff, go_pay, go_da, go_hra, go_ta, go_oa, go_prog_total),
                        CalculateSalBreakupColumn(go_no_of_staff, ng_no_of_staff, total_no_of_staff)"/>
                            </td> 
                            <td class="table_head_all_1 al">
                                <input type="text" class="input-box1" id="go_pay" name="go_pay" 
                                       onblur="CalculateSalBreakupRow(go_no_of_staff, go_pay, go_da, go_hra, go_ta, go_oa, go_prog_total),
                        CalculateSalBreakupColumn(go_pay, ng_pay, total_pay)"/>
                            </td> 
                            <td class="table_head_all_1 al">
                                <input type="text" class="input-box1" id="go_da" name="go_da"
                                       onblur="CalculateSalBreakupRow(go_no_of_staff, go_pay, go_da, go_hra, go_ta, go_oa, go_prog_total),
                        CalculateSalBreakupColumn(go_da, ng_da, total_da)"/>
                            </td> 
                            <td class="table_head_all_1 al">
                                <input type="text" class="input-box1" id="go_hra" name="go_hra"
                                       onblur="CalculateSalBreakupRow(go_no_of_staff, go_pay, go_da, go_hra, go_ta, go_oa, go_prog_total),
                        CalculateSalBreakupColumn(go_hra, ng_hra, total_hra)"/>
                            </td> 
                            <td class="table_head_all_1 al">
                                <input type="text" class="input-box1" id="go_ta" name="go_ta"
                                       onblur="CalculateSalBreakupRow(go_no_of_staff, go_pay, go_da, go_hra, go_ta, go_oa, go_prog_total),
                        CalculateSalBreakupColumn(go_ta, ng_ta, total_ta)"/>
                            </td> 
                            <td class="table_head_all_1 al">
                                <input type="text" class="input-box1" id="go_oa" name="go_oa" 
                                       onblur="CalculateSalBreakupRow(go_no_of_staff, go_pay, go_da, go_hra, go_ta, go_oa, go_prog_total),
                        CalculateSalBreakupColumn(go_oa, ng_oa, total_oa)"/>
                            </td> 
                            <td class="table_head_all_1 al">
                                <input type="text" class="input-box1" id="go_prog_total" name="go_prog_total" readonly="2"
                                       onblur="CalculateSalBreakupRow(go_no_of_staff, go_pay, go_da, go_hra, go_ta, go_oa, go_prog_total),
                        CalculateSalBreakupColumn(go_prog_total, ng_prog_total, total_prog_total)"/>
                            </td>                        
                        </tr>
                        <tr>
                            <td class="table_head_all">NG Staff</td> 
                            <td class="table_head_all_1 al">
                                <input type="text" class="input-box1" id="ng_no_of_staff" name="ng_no_of_staff"
                                       onblur="CalculateSalBreakupRow(ng_no_of_staff, ng_pay, ng_da, ng_hra, ng_ta, ng_oa, ng_prog_total),
                        CalculateSalBreakupColumn(go_no_of_staff, ng_no_of_staff, total_no_of_staff)"/>
                            </td> 
                            <td class="table_head_all_1 al">
                                <input type="text" class="input-box1" id="ng_pay" name="ng_pay"
                                       onblur="CalculateSalBreakupRow(ng_no_of_staff, ng_pay, ng_da, ng_hra, ng_ta, ng_oa, ng_prog_total),
                        CalculateSalBreakupColumn(go_pay, ng_pay, total_pay)"/>
                            </td> 
                            <td class="table_head_all_1 al">
                                <input type="text" class="input-box1" id="ng_da" name="ng_da"
                                       onblur="CalculateSalBreakupRow(ng_no_of_staff, ng_pay, ng_da, ng_hra, ng_ta, ng_oa, ng_prog_total),
                        CalculateSalBreakupColumn(go_da, ng_da, total_da)"/>
                            </td> 
                            <td class="table_head_all_1 al">
                                <input type="text" class="input-box1" id="ng_hra" name="ng_hra"
                                       onblur="CalculateSalBreakupRow(ng_no_of_staff, ng_pay, ng_da, ng_hra, ng_ta, ng_oa, ng_prog_total),
                        CalculateSalBreakupColumn(go_hra, ng_hra, total_hra)"/>
                            </td> 
                            <td class="table_head_all_1 al">
                                <input type="text" class="input-box1" id="ng_ta" name="ng_ta"
                                       onblur="CalculateSalBreakupRow(ng_no_of_staff, ng_pay, ng_da, ng_hra, ng_ta, ng_oa, ng_prog_total),
                        CalculateSalBreakupColumn(go_ta, ng_ta, total_ta)"/>
                            </td> 
                            <td class="table_head_all_1 al">
                                <input type="text" class="input-box1" id="ng_oa" name="ng_oa"
                                       onblur="CalculateSalBreakupRow(ng_no_of_staff, ng_pay, ng_da, ng_hra, ng_ta, ng_oa, ng_prog_total),
                        CalculateSalBreakupColumn(go_oa, ng_oa, total_oa)"/>
                            </td> 
                            <td class="table_head_all_1 al">
                                <input type="text" class="input-box1" id="ng_prog_total" name="ng_prog_total" readonly="2"
                                       onblur="CalculateSalBreakupRow(ng_no_of_staff, ng_pay, ng_da, ng_hra, ng_ta, ng_oa, ng_prog_total),
                        CalculateSalBreakupColumn(go_prog_total, ng_prog_total, total_prog_total)"/>
                            </td>                        
                        </tr>
                        <tr style="height: 15px;"><td colspan="8"></td></tr>
                        <tr>
                            <td class="table_head_all">Total</td> 
                            <td class="table_head_all_1 al">
                                <input readonly="2" type="text" class="input-box1" id="total_no_of_staff" name="total_no_of_staff"
                                       onblur="CalculateSalBreakupRow(total_no_of_staff, total_pay, total_da, total_hra, total_ta, total_oa, total_prog_total),
                        CalculateSalBreakupColumn(go_no_of_staff, ng_no_of_staff, total_no_of_staff)"/>
                            </td> 
                            <td class="table_head_all_1 al">
                                <input readonly="2" type="text" class="input-box1" id="total_pay" name="total_pay"
                                       onblur="CalculateSalBreakupRow(total_no_of_staff, total_pay, total_da, total_hra, total_ta, total_oa, total_prog_total),
                        CalculateSalBreakupColumn(go_pay, ng_pay, total_pay)"/>
                            </td> 
                            <td class="table_head_all_1 al">
                                <input readonly="2" type="text" class="input-box1" id="total_da" name="total_da"
                                       onblur="CalculateSalBreakupRow(total_no_of_staff, total_pay, total_da, total_hra, total_ta, total_oa, total_prog_total),
                        CalculateSalBreakupColumn(go_da, ng_da, total_da)"/>
                            </td> 
                            <td class="table_head_all_1 al">
                                <input readonly="2" type="text" class="input-box1" id="total_hra" name="total_hra"
                                       onblur="CalculateSalBreakupRow(total_no_of_staff, total_pay, total_da, total_hra, total_ta, total_oa, total_prog_total),
                        CalculateSalBreakupColumn(go_hra, ng_hra, total_hra)"/>
                            </td> 
                            <td class="table_head_all_1 al">
                                <input readonly="2" type="text" class="input-box1" id="total_ta" name="total_ta"
                                       onblur="CalculateSalBreakupRow(total_no_of_staff, total_pay, total_da, total_hra, total_ta, total_oa, total_prog_total),
                        CalculateSalBreakupColumn(go_ta, ng_ta, total_ta)"/>
                            </td> 
                            <td class="table_head_all_1 al">
                                <input readonly="2" type="text" class="input-box1" id="total_oa" name="total_oa"
                                       onblur="CalculateSalBreakupRow(total_no_of_staff, total_pay, total_da, total_hra, total_ta, total_oa, total_prog_total),
                        CalculateSalBreakupColumn(go_oa, ng_oa, total_oa)"/>
                            </td> 
                            <td class="table_head_all_1 al">
                                <input readonly="2" type="text" class="input-box1" id="total_prog_total" name="total_prog_total"
                                       onblur="CalculateSalBreakupRow(total_no_of_staff, total_pay, total_da, total_hra, total_ta, total_oa, total_prog_total),
                        CalculateSalBreakupColumn(go_prog_total, ng_prog_total, total_prog_total)"/>
                            </td>                        
                        </tr>
                    </table>
                </div>
                <br/><br/>
                <div class="div-exp-form">
                    <table align="center" class="mytable">

                        <thead style="height: 55px;">
                        <td class="table_head_all">Sno</td>  
                        <td class="table_head_all">Sub Head</td>  
                        <td class="table_head_all al">Budget Code</td>  
                        <td class="table_head_all al">Budget <br/>Allocation for<br/> <%=years%></td>  
                        <td class="table_head_all al">Expenditure <br/>up to <br/>last month</td>  
                        <td class="table_head_all al">Expenditure <br/>during <br/>the month</td>  
                        <td class="table_head_all al">Progressive<br/> total</td>  
                        </thead>
                        <tr>
                            <td class="table_head_all_1 al">1.</td>
                            <td class="table_head_all_1">Salaries</td>
                            <td class="table_head_all_1 al">(98.02.01)</td>
                            <td class="table_head_all_1 al"><%=format.format(new BigDecimal(rs1.getDouble("salaries") * 100000))%></td>
                            <td class="table_head_all_1 al"><%=expSalaries%></td>
                        <input type="hidden" name="expSalaries" id="expSalaries" value="<%=expSalaries%>" onblur="CalculateProgressive(expSalaries, Salaries, ttl_salaries)"/>
                        <td class="table_data al">
                            <input name="Salaries" id="Salaries" tabindex='1' class="input-box" type="text" 
                                   onblur="CalculateProgressive(expSalaries, Salaries, ttl_salaries), CalculateTotal(Salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                        rent_rate_taxes, other_admin_expenses, advertisement_publicity, professional_services, gr_in_aid_general, other_charges, dcanteen, total),
                        CalculateTotal(ttl_salaries, ttl_wages, ttl_over_time_allawance, ttl_medical_treatment, ttl_travel_expense_domestic, ttl_travel_expenses_foreign, ttl_office_expenses,
                        ttl_rent_rate_taxes, ttl_other_admin_expenses, ttl_advertisement_publicity, ttl_professional_services, ttl_gr_in_aid_general, ttl_other_charges, ttl_dcanteen, ttl_total)" 
                                   index='17' onkeypress="return isNumber(event)"/></td>
                        <td class="table_head_all_1 al" id="pro_Salaries">
                            <input type="text" readonly="2" class="input-box1" id="ttl_salaries" onblur="CalculateProgressive(expSalaries, Salaries, ttl_salaries)"
                                   />

                        </td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">2.</td>
                            <td class="table_head_all_1">Wages</td>
                            <td class="table_head_all_1 al">(98.02.02)</td>
                            <td class="table_head_all_1 al"><%=format.format(new BigDecimal(rs1.getDouble("wages") * 100000))%></td>
                            <td class="table_head_all_1 al"><%=expWages%></td>
                        <input type="hidden" name="expWages" id="expWages"  value="<%=expWages%>" onblur="CalculateProgressive(expWages, wages, ttl_wages)"/>
                        <td class="table_data al">
                            <input name="wages" id="wages" tabindex='2' class="input-box" type="text" 
                                   onblur="CalculateProgressive(expWages, wages, ttl_wages), CalculateTotal(Salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                        rent_rate_taxes, other_admin_expenses, advertisement_publicity, professional_services, gr_in_aid_general, other_charges, dcanteen, total),
            CalculateTotal(ttl_salaries, ttl_wages, ttl_over_time_allawance, ttl_medical_treatment, ttl_travel_expense_domestic, ttl_travel_expenses_foreign, ttl_office_expenses,
                        ttl_rent_rate_taxes, ttl_other_admin_expenses, ttl_advertisement_publicity, ttl_professional_services, ttl_gr_in_aid_general, ttl_other_charges, ttl_dcanteen, ttl_total)" 
                                   index='17' onkeypress="return isNumber(event)"/></td>
                        <td class="table_head_all_1 al" id="pro_Wages">
                            <input type="text" readonly="2" class="input-box1" id="ttl_wages" onblur="CalculateProgressive(expWages, wages, ttl_wages)"/>
                        </td>

                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">3.</td>
                            <td class="table_head_all_1">Over Time Allowance</td>
                            <td class="table_head_all_1 al">(98.02.03)</td>
                            <td class="table_head_all_1 al"><%=format.format(new BigDecimal(rs1.getDouble("over_time_allawance") * 100000))%></td>
                            <td class="table_head_all_1 al"><%=expOver_time_allawance%></td>
                        <input type="hidden" name="expOver_time_allawance" id="expOver_time_allawance" value="<%=expOver_time_allawance%>" onblur="CalculateProgressive(expOver_time_allawance, over_time_allawance, ttl_over_time_allawance)"/>
                        <td class="table_data al">
                            <input name="over_time_allawance" id="over_time_allawance" tabindex='3' class="input-box" type="text" 
                                   onblur="CalculateProgressive(expOver_time_allawance, over_time_allawance, ttl_over_time_allawance), CalculateTotal(Salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                        rent_rate_taxes, other_admin_expenses, advertisement_publicity, professional_services, gr_in_aid_general, other_charges, dcanteen, total),
            CalculateTotal(ttl_salaries, ttl_wages, ttl_over_time_allawance, ttl_medical_treatment, ttl_travel_expense_domestic, ttl_travel_expenses_foreign, ttl_office_expenses,
                        ttl_rent_rate_taxes, ttl_other_admin_expenses, ttl_advertisement_publicity, ttl_professional_services, ttl_gr_in_aid_general, ttl_other_charges, ttl_dcanteen, ttl_total)" 
                                   index='17' onkeypress="return isNumber(event)"/></td>
                        <td class="table_head_all_1 al" id="pro_Over_time_allawance">
                            <input type="text" readonly="2" class="input-box1" id="ttl_over_time_allawance" onblur="CalculateProgressive(expOver_time_allawance, over_time_allawance, ttl_over_time_allawance)"/>
                        </td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">4.</td>
                            <td class="table_head_all_1">Medical Treatment</td>
                            <td class="table_head_all_1 al">(98.02.06)</td>
                            <td class="table_head_all_1 al"><%=format.format(new BigDecimal(rs1.getDouble("medical_treatment") * 100000))%></td>
                            <td class="table_head_all_1 al"><%=expMedical_treatment%></td>
                        <input type="hidden" name="expMedical_treatment" id="expMedical_treatment" value="<%=expMedical_treatment%>" onblur="CalculateProgressive(expMedical_treatment, medical_treatment, ttl_medical_treatment)"/>
                        <td class="table_data al">
                            <input name="medical_treatment" id="medical_treatment" tabindex='4' class="input-box" type="text" 
                                   onblur="CalculateProgressive(expMedical_treatment, medical_treatment, ttl_medical_treatment), CalculateTotal(Salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                        rent_rate_taxes, other_admin_expenses, advertisement_publicity, professional_services, gr_in_aid_general, other_charges, dcanteen, total),
            CalculateTotal(ttl_salaries, ttl_wages, ttl_over_time_allawance, ttl_medical_treatment, ttl_travel_expense_domestic, ttl_travel_expenses_foreign, ttl_office_expenses,
                        ttl_rent_rate_taxes, ttl_other_admin_expenses, ttl_advertisement_publicity, ttl_professional_services, ttl_gr_in_aid_general, ttl_other_charges, ttl_dcanteen, ttl_total)" 
                                   index='17' onkeypress="return isNumber(event)"/></td>
                        <td class="table_head_all_1 al" id="pro_Medical_treatment">
                            <input type="text" readonly="2" class="input-box1" id="ttl_medical_treatment" onblur="CalculateProgressive(expMedical_treatment, medical_treatment, ttl_medical_treatment)"/>
                        </td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">5.</td>
                            <td class="table_head_all_1">Travel Expenses (Domestic)</td>
                            <td class="table_head_all_1 al">(98.02.11)</td>
                            <td class="table_head_all_1 al"><%=format.format(new BigDecimal(rs1.getDouble("travel_expense_domestic") * 100000))%></td>
                            <td class="table_head_all_1 al"><%=expTravel_expense_domestic%></td>
                        <input type="hidden" name="expTravel_expense_domestic" id="expTravel_expense_domestic" value="<%=expTravel_expense_domestic%>" onblur="CalculateProgressive(expTravel_expense_domestic, travel_expense_domestic, ttl_travel_expense_domestic)"/>
                        <td class="table_data al">
                            <input name="travel_expense_domestic" id="travel_expense_domestic" tabindex='5' class="input-box" type="text"  
                                   onblur="CalculateProgressive(expTravel_expense_domestic, travel_expense_domestic, ttl_travel_expense_domestic), CalculateTotal(Salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                        rent_rate_taxes, other_admin_expenses, advertisement_publicity, professional_services, gr_in_aid_general, other_charges, dcanteen, total),
            CalculateTotal(ttl_salaries, ttl_wages, ttl_over_time_allawance, ttl_medical_treatment, ttl_travel_expense_domestic, ttl_travel_expenses_foreign, ttl_office_expenses,
                        ttl_rent_rate_taxes, ttl_other_admin_expenses, ttl_advertisement_publicity, ttl_professional_services, ttl_gr_in_aid_general, ttl_other_charges, ttl_dcanteen, ttl_total)" 
                                   index='17' onkeypress="return isNumber(event)"/></td>
                        <td class="table_head_all_1 al" id="pro_Travel_expense_domestic">
                            <input type="text" readonly="2" class="input-box1" id="ttl_travel_expense_domestic" onblur="CalculateProgressive(expTravel_expense_domestic, travel_expense_domestic, ttl_travel_expense_domestic)">
                        </td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">6.</td>
                            <td class="table_head_all_1">Travel Expenses (Foreign)</td>
                            <td class="table_head_all_1 al">(98.02.12)</td>
                            <td class="table_head_all_1 al"><%=format.format(new BigDecimal(rs1.getDouble("travel_expenses_foreign") * 100000))%></td>
                            <td class="table_head_all_1 al"><%=expTravel_expenses_foreign%></td>
                        <input type="hidden" name="expTravel_expenses_foreign" id="expTravel_expenses_foreign" value="<%=expTravel_expenses_foreign%>"
                               onblur="CalculateProgressive(expTravel_expenses_foreign, travel_expenses_foreign, ttl_travel_expenses_foreign)"/>
                        <td class="table_data al">
                            <input name="travel_expenses_foreign" id="travel_expenses_foreign" tabindex='6' class="input-box" type="text"  
                                   onblur="CalculateProgressive(expTravel_expenses_foreign, travel_expenses_foreign, ttl_travel_expenses_foreign),
                        CalculateTotal(Salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                        rent_rate_taxes, other_admin_expenses, advertisement_publicity, professional_services, gr_in_aid_general, other_charges, dcanteen, total),
                    CalculateTotal(ttl_salaries, ttl_wages, ttl_over_time_allawance, ttl_medical_treatment, ttl_travel_expense_domestic, ttl_travel_expenses_foreign, ttl_office_expenses,
                        ttl_rent_rate_taxes, ttl_other_admin_expenses, ttl_advertisement_publicity, ttl_professional_services, ttl_gr_in_aid_general, ttl_other_charges, ttl_dcanteen, ttl_total)" 
                                   index='17' onkeypress="return isNumber(event)"/></td>
                        <td class="table_head_all_1 al" id="pro_Travel_expenses_foreign">
                            <input type="text" readonly="2" class="input-box1" id="ttl_travel_expenses_foreign"
                                   onblur="CalculateProgressive(expTravel_expenses_foreign, travel_expenses_foreign, ttl_travel_expenses_foreign)">
                        </td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">7.</td>
                            <td class="table_head_all_1">Office Expenses</td>
                            <td class="table_head_all_1 al">(98.02.13)</td>
                            <td class="table_head_all_1 al"><%=format.format(new BigDecimal(rs1.getDouble("office_expenses") * 100000))%></td>
                            <td class="table_head_all_1 al"><%=expOffice_expenses%></td>
                        <input type="hidden" name="expOffice_expenses" id="expOffice_expenses" value="<%=expOffice_expenses%>"
                               onblur="CalculateProgressive(expOffice_expenses, office_expenses, ttl_office_expenses)"/>
                        <td class="table_data al">
                            <input name="office_expenses" id="office_expenses" tabindex='7' class="input-box" type="text" 
                                   onblur="CalculateProgressive(expOffice_expenses, office_expenses, ttl_office_expenses),
                        CalculateTotal(Salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                        rent_rate_taxes, other_admin_expenses, advertisement_publicity, professional_services, gr_in_aid_general, other_charges, dcanteen, total),
                    CalculateTotal(ttl_salaries, ttl_wages, ttl_over_time_allawance, ttl_medical_treatment, ttl_travel_expense_domestic, ttl_travel_expenses_foreign, ttl_office_expenses,
                        ttl_rent_rate_taxes, ttl_other_admin_expenses, ttl_advertisement_publicity, ttl_professional_services, ttl_gr_in_aid_general, ttl_other_charges, ttl_dcanteen, ttl_total)" 
                                   index='17' onkeypress="return isNumber(event)"/></td>
                        <td class="table_head_all_1 al" id="pro_office_expenses">
                            <input type="text" readonly="2" class="input-box1" id="ttl_office_expenses"
                                   onblur="CalculateProgressive(expOffice_expenses, office_expenses, ttl_office_expenses)">
                        </td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">8.</td>
                            <td class="table_head_all_1">Rent, Rate & Taxes</td>
                            <td class="table_head_all_1 al">(98.02.14)</td>
                            <td class="table_head_all_1 al"><%=format.format(new BigDecimal(rs1.getDouble("rent_rate_taxes") * 100000))%></td>
                            <td class="table_head_all_1 al"><%=expRent_rate_taxes%></td>
                        <input type="hidden" name="expRent_rate_taxes" id="expRent_rate_taxes" value="<%=expRent_rate_taxes%>"
                               onblur="CalculateProgressive(expRent_rate_taxes, rent_rate_taxes, ttl_rent_rate_taxes)"/>
                        <td class="table_data al">
                            <input name="rent_rate_taxes" id="rent_rate_taxes" tabindex='8' class="input-box" type="text" 
                                   onblur="CalculateProgressive(expRent_rate_taxes, rent_rate_taxes, ttl_rent_rate_taxes),
                        CalculateTotal(Salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                        rent_rate_taxes, other_admin_expenses, advertisement_publicity, professional_services, gr_in_aid_general, other_charges, dcanteen, total),
                    CalculateTotal(ttl_salaries, ttl_wages, ttl_over_time_allawance, ttl_medical_treatment, ttl_travel_expense_domestic, ttl_travel_expenses_foreign, ttl_office_expenses,
                        ttl_rent_rate_taxes, ttl_other_admin_expenses, ttl_advertisement_publicity, ttl_professional_services, ttl_gr_in_aid_general, ttl_other_charges, ttl_dcanteen, ttl_total)" 
                                   index='17' onkeypress="return isNumber(event)"/></td>
                        <td class="table_head_all_1 al" id="pro_Rent_rate_taxes">
                            <input type="text" readonly="2" class="input-box1" id="ttl_rent_rate_taxes"
                                   onblur="CalculateProgressive(expRent_rate_taxes, rent_rate_taxes, ttl_rent_rate_taxes)"/>
                        </td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">9.</td>
                            <td class="table_head_all_1">Other Admn. Expenses</td>
                            <td class="table_head_all_1 al">(98.02.20)</td>
                            <td class="table_head_all_1 al"><%=format.format(new BigDecimal(rs1.getDouble("other_admin_expenses") * 100000))%></td>
                            <td class="table_head_all_1 al"><%=expOther_admin_expenses%></td>
                        <input type="hidden" name="expOther_admin_expenses" id="expOther_admin_expenses" value="<%=expOther_admin_expenses%>"
                               onblur="CalculateProgressive(expOther_admin_expenses, other_admin_expenses, ttl_other_admin_expenses)"/>
                        <td class="table_data al">
                            <input name="other_admin_expenses" id="other_admin_expenses" class="input-box" type="text" tabindex='9' 
                                   onblur="CalculateProgressive(expOther_admin_expenses, other_admin_expenses, ttl_other_admin_expenses), CalculateTotal(Salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                        rent_rate_taxes, other_admin_expenses, advertisement_publicity, professional_services, gr_in_aid_general, other_charges, dcanteen, total),
            CalculateTotal(ttl_salaries, ttl_wages, ttl_over_time_allawance, ttl_medical_treatment, ttl_travel_expense_domestic, ttl_travel_expenses_foreign, ttl_office_expenses,
                        ttl_rent_rate_taxes, ttl_other_admin_expenses, ttl_advertisement_publicity, ttl_professional_services, ttl_gr_in_aid_general, ttl_other_charges, ttl_dcanteen, ttl_total)" 
                                   index='17' onkeypress="return isNumber(event)"/></td>
                        <td class="table_head_all_1 al" id="pro_Other_admin_expenses">
                            <input type="text" readonly="2" class="input-box1" id="ttl_other_admin_expenses"
                                   onblur="CalculateProgressive(expOther_admin_expenses, other_admin_expenses, ttl_other_admin_expenses)"/>
                        </td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">10.</td>
                            <td class="table_head_all_1">Advertisement & Publicity</td>
                            <td class="table_head_all_1 al">(98.02.26)</td>
                            <td class="table_head_all_1 al"><%=format.format(new BigDecimal(rs1.getDouble("advertisement_publicity") * 100000))%></td>
                            <td class="table_head_all_1 al"><%=expAdvertisement_publicity%></td>
                        <input type="hidden" name="expAdvertisement_publicity" id="expAdvertisement_publicity" value="<%=expAdvertisement_publicity%>"
                               onblur="CalculateProgressive(expAdvertisement_publicity, advertisement_publicity, ttl_advertisement_publicity)"/>
                        <td class="table_data al">
                            <input name="advertisement_publicity" id="advertisement_publicity" class="input-box" type="text" tabindex='10'  
                                   onblur="CalculateProgressive(expAdvertisement_publicity, advertisement_publicity, ttl_advertisement_publicity), CalculateTotal(Salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                        rent_rate_taxes, other_admin_expenses, advertisement_publicity, professional_services, gr_in_aid_general, other_charges, dcanteen, total),
            CalculateTotal(ttl_salaries, ttl_wages, ttl_over_time_allawance, ttl_medical_treatment, ttl_travel_expense_domestic, ttl_travel_expenses_foreign, ttl_office_expenses,
                        ttl_rent_rate_taxes, ttl_other_admin_expenses, ttl_advertisement_publicity, ttl_professional_services, ttl_gr_in_aid_general, ttl_other_charges, ttl_dcanteen, ttl_total)" 
                                   index='17' onkeypress="return isNumber(event)"/></td>
                        <td class="table_head_all_1 al" id="pro_Advertisement_publicity">
                            <input type="text" readonly="2" class="input-box1" id="ttl_advertisement_publicity"
                                   onblur="CalculateProgressive(expAdvertisement_publicity, advertisement_publicity, ttl_advertisement_publicity)"/>
                        </td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">11.</td>
                            <td class="table_head_all_1">Professional Services</td>
                            <td class="table_head_all_1 al">(98.02.28)</td>
                            <td class="table_head_all_1 al"><%=format.format(new BigDecimal(rs1.getDouble("professional_services") * 100000))%></td>
                            <td class="table_head_all_1 al"><%=expProfessional_services%></td>
                        <input type="hidden" name="expProfessional_services" id="expProfessional_services" value="<%=expProfessional_services%>"
                               onblur="CalculateProgressive(expProfessional_services, professional_services, ttl_professional_services)"/>
                        <td class="table_data al">
                            <input name="professional_services" id="professional_services" class="input-box" type="text" tabindex='11'  
                                   onblur="CalculateProgressive(expProfessional_services, professional_services, ttl_professional_services), CalculateTotal(Salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                        rent_rate_taxes, other_admin_expenses, advertisement_publicity, professional_services, gr_in_aid_general, other_charges, dcanteen, total),
            CalculateTotal(ttl_salaries, ttl_wages, ttl_over_time_allawance, ttl_medical_treatment, ttl_travel_expense_domestic, ttl_travel_expenses_foreign, ttl_office_expenses,
                        ttl_rent_rate_taxes, ttl_other_admin_expenses, ttl_advertisement_publicity, ttl_professional_services, ttl_gr_in_aid_general, ttl_other_charges, ttl_dcanteen, ttl_total)" 
                                   index='17' onkeypress="return isNumber(event)"/></td>
                        <td class="table_head_all_1 al" id="pro_Professional_services">
                            <input type="text" readonly="2" class="input-box1" id="ttl_professional_services"
                                   onblur="CalculateProgressive(expProfessional_services, professional_services, ttl_professional_services)"/>
                        </td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">12.</td>
                            <td class="table_head_all_1">Gr. in Aid General</td>
                            <td class="table_head_all_1 al">(98.02.31)</td>
                            <td class="table_head_all_1 al"><%=format.format(new BigDecimal(rs1.getDouble("gr_in_aid_general") * 100000))%></td>
                            <td class="table_head_all_1 al"><%=expGr_in_aid_general%></td>
                        <input type="hidden" name="expGr_in_aid_general" id="expGr_in_aid_general" value="<%=expGr_in_aid_general%>"
                               onblur="CalculateProgressive(expGr_in_aid_general, gr_in_aid_general, ttl_gr_in_aid_general)"/>
                        <td class="table_data al">
                            <input name="gr_in_aid_general" id="gr_in_aid_general"  class="input-box" type="text" tabindex='12'  
                                   onblur="CalculateProgressive(expGr_in_aid_general, gr_in_aid_general, ttl_gr_in_aid_general), CalculateTotal(Salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                        rent_rate_taxes, other_admin_expenses, advertisement_publicity, professional_services, gr_in_aid_general, other_charges, dcanteen, total),
            CalculateTotal(ttl_salaries, ttl_wages, ttl_over_time_allawance, ttl_medical_treatment, ttl_travel_expense_domestic, ttl_travel_expenses_foreign, ttl_office_expenses,
                        ttl_rent_rate_taxes, ttl_other_admin_expenses, ttl_advertisement_publicity, ttl_professional_services, ttl_gr_in_aid_general, ttl_other_charges, ttl_dcanteen, ttl_total)" 
                                   index='17' onkeypress="return isNumber(event)"/></td>
                        <td class="table_head_all_1 al" id="pro_Gr_in_aid_general">
                            <input type="text" readonly="2" class="input-box1" id="ttl_gr_in_aid_general"
                                   onblur="CalculateProgressive(expGr_in_aid_general, gr_in_aid_general, ttl_gr_in_aid_general)"/>
                        </td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">13.</td>
                            <td class="table_head_all_1">Other Charges</td>
                            <td class="table_head_all_1 al">(98.02.50)</td>
                            <td class="table_head_all_1 al"><%=format.format(new BigDecimal(rs1.getDouble("other_charges") * 100000))%></td>
                            <td class="table_head_all_1 al"><%=expOther_charges%></td>
                        <input type="hidden" name="expOther_charges" id="expOther_charges" value="<%=expOther_charges%>"
                               onblur="CalculateProgressive(expOther_charges, other_charges, ttl_other_charges)"/>
                        <td class="table_data al">
                            <input name="other_charges" id="other_charges" class="input-box" type="text" tabindex='13' 
                                   onblur="CalculateProgressive(expOther_charges, other_charges, ttl_other_charges),
                        CalculateTotal(Salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                        rent_rate_taxes, other_admin_expenses, advertisement_publicity, professional_services, gr_in_aid_general, other_charges, dcanteen, total),
                    CalculateTotal(ttl_salaries, ttl_wages, ttl_over_time_allawance, ttl_medical_treatment, ttl_travel_expense_domestic, ttl_travel_expenses_foreign, ttl_office_expenses,
                        ttl_rent_rate_taxes, ttl_other_admin_expenses, ttl_advertisement_publicity, ttl_professional_services, ttl_gr_in_aid_general, ttl_other_charges, ttl_dcanteen, ttl_total)" 
                                   index='17' onkeypress="return isNumber(event)"/></td>
                        <td class="table_head_all_1 al" id="pro_Other_charges">
                            <input type="text" readonly="2" class="input-box1" id="ttl_other_charges"
                                   onblur="CalculateProgressive(expOther_charges, other_charges, ttl_other_charges)"/>
                        </td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1 al">14.</td>
                            <td class="table_head_all_1">Departmental Canteen</td>
                            <td class="table_head_all_1 al">(98.03.20)</td>
                            <td class="table_head_all_1 al"><%=format.format(new BigDecimal(rs1.getDouble("dcanteen") * 100000))%></td>
                            <td class="table_head_all_1 al"><%=expDcanteen%></td>
                        <input type="hidden" name="expDcanteen" id="expDcanteen" value="<%=expDcanteen%>" 
                               onblur="CalculateProgressive(expDcanteen, dcanteen, ttl_dcanteen)"/>
                        <td class="table_data al">
                            <input name="dcanteen" id="dcanteen"  class="input-box" type="text" tabindex='14'  
                                   onblur="CalculateProgressive(expDcanteen, dcanteen, ttl_dcanteen),
                        CalculateTotal(Salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                        rent_rate_taxes, other_admin_expenses, advertisement_publicity, professional_services, gr_in_aid_general, other_charges, dcanteen, total),
                    CalculateTotal(ttl_salaries, ttl_wages, ttl_over_time_allawance, ttl_medical_treatment, ttl_travel_expense_domestic, ttl_travel_expenses_foreign, ttl_office_expenses,
                        ttl_rent_rate_taxes, ttl_other_admin_expenses, ttl_advertisement_publicity, ttl_professional_services, ttl_gr_in_aid_general, ttl_other_charges, ttl_dcanteen, ttl_total)" 
                                   index='17' onkeypress="return isNumber(event)"/></td>
                        <td class="table_head_all_1 al" id="pro_Dcanteen">
                            <input type="text" readonly="2" class="input-box1" id="ttl_dcanteen"
                                   onblur="CalculateProgressive(expDcanteen, dcanteen, ttl_dcanteen)"/>
                        </td>
                        </tr>
                        <tr>
                            <td class="table_head_all_1  al">15.</td>
                            <td class="table_head_all_1" colspan="2">Total Allotment</td>
                            <td class="table_head_all_1 al"><%=format.format(new BigDecimal(rs1.getDouble("total") * 100000))%></td>
                            <td class="table_head_all_1 al"><%=expTotal%></td>
                        <input type="hidden" name="expTotal" id="expTotal" value="<%=expTotal%>"
                               onblur="CalculateProgressive(expTotal, total, ttl_total)"/>
                        <td class="table_data al">
                            <input name="total" id="total" readonly="2" class="input-box" type="text" 
                                   onblur="CalculateProgressive(expTotal, total, ttl_total),
                        CalculateTotal(Salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                        rent_rate_taxes, other_admin_expenses, advertisement_publicity, professional_services, gr_in_aid_general, other_charges, dcanteen, total),
                    CalculateTotal(ttl_salaries, ttl_wages, ttl_over_time_allawance, ttl_medical_treatment, ttl_travel_expense_domestic, ttl_travel_expenses_foreign, ttl_office_expenses,
                        ttl_rent_rate_taxes, ttl_other_admin_expenses, ttl_advertisement_publicity, ttl_professional_services, ttl_gr_in_aid_general, ttl_other_charges, ttl_dcanteen, ttl_total)" 
                                   index='17' onkeypress="return isNumber(event)"/></td>
                        <td class="table_head_all_1 al" id="pro_Total">
                            <input type="text" readonly="2" class="input-box1" id="ttl_total"
                                   onblur="CalculateProgressive(expTotal, total, ttl_total)"/>
                        </td>
                        </tr>

                        <tr style="height: 35px;">
                            <td colspan="8" style="text-align: center">
                                <input type="reset" class="btn bg2" value="reset" onclick="window.reset()"/>&nbsp;&nbsp;
                                <input type="submit" class="btn bg1" value="submit"/> 
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
            <br/>
            <br/>
        </div>
        <br/>
        <%
            }
        } else {
            rs.beforeFirst();
            while (rs.next()) {
        %>
        <div id="main-div">
            <h2 align="center" class="head">Expenditure Report of FY <%=years%> </h2>
            <br/>
            <h2 align="center" style="font-size:large;font-family:Verdana;font-weight:bold" align="center"><font color="#990000"><%=inst_name%></h2>
            <h2 align="center" style="font-size:large;font-family:Verdana;font-weight:bold" align="center"><font color="#990000">Expenditure Report for <%=mName%> : <%=years%> </h2> 
            <br/>
            <table align="center" class="mytable">

                <thead style="height: 35px;">
                <td class="table_head_all">Sno</td>  
                <td class="table_head_all">Sub Head</td>  
                <td class="table_head_all">Budget Code</td>  
                <td class="table_head_all">Allotment<br/>(<%=(rs.getString("creation_date")).substring(0, 10)%>)</td>  
                </thead>

                <tr>
                    <td class="table_head_all_1 al">1.</td>
                    <td class="table_head_all_1">Salaries</td>
                    <td class="table_head_all_1 al">(98.02.01)</td>
                    <td class="table_data al"><%=rs.getString("salaries")%></td>
                </tr>
                <tr>
                    <td class="table_head_all_1  al">2.</td>
                    <td class="table_head_all_1">Wages</td>
                    <td class="table_head_all_1 al">(98.02.02)</td>
                    <td class="table_data al"><%=rs.getString("wages")%></td>
                </tr>
                <tr>
                    <td class="table_head_all_1  al">3.</td>
                    <td class="table_head_all_1">Over Time Allowance</td>
                    <td class="table_head_all_1 al">(98.02.03)</td>
                    <td class="table_data al"><%=rs.getString("over_time_allawance")%></td>
                </tr>
                <tr>
                    <td class="table_head_all_1  al">4.</td>
                    <td class="table_head_all_1">Medical Treatment</td>
                    <td class="table_head_all_1 al">(98.02.06)</td>
                    <td class="table_data al"><%=rs.getString("medical_treatment")%></td>
                </tr>
                <tr>
                    <td class="table_head_all_1  al">5.</td>
                    <td class="table_head_all_1">Travel Expenses (Domestic)</td>
                    <td class="table_head_all_1 al">(98.02.11)</td>
                    <td class="table_data al"><%=rs.getString("travel_expense_domestic")%></td>
                </tr>
                <tr>
                    <td class="table_head_all_1  al">6.</td>
                    <td class="table_head_all_1">Travel Expenses (Foreign)</td>
                    <td class="table_head_all_1 al">(98.02.12)</td>
                    <td class="table_data al"><%=rs.getString("travel_expenses_foreign")%></td>
                </tr>
                <tr>
                    <td class="table_head_all_1  al">7.</td>
                    <td class="table_head_all_1">Office Expenses</td>
                    <td class="table_head_all_1 al">(98.02.13)</td>
                    <td class="table_data al"><%=rs.getString("office_expenses")%></td>
                </tr>
                <tr>
                    <td class="table_head_all_1  al">8.</td>
                    <td class="table_head_all_1">Rent, Rate & Taxes</td>
                    <td class="table_head_all_1 al">(98.02.14)</td>
                    <td class="table_data al"><%=rs.getString("rent_rate_taxes")%></td>
                </tr>
                <tr>
                    <td class="table_head_all_1  al">9.</td>
                    <td class="table_head_all_1">Other Admn. Expenses</td>
                    <td class="table_head_all_1 al">(98.02.20)</td>
                    <td class="table_data al"><%=rs.getString("other_admin_expenses")%></td>
                </tr>
                <tr>
                    <td class="table_head_all_1  al">10.</td>
                    <td class="table_head_all_1">Advertisement & Publicity</td>
                    <td class="table_head_all_1 al">(98.02.26)</td>
                    <td class="table_data al"><%=rs.getString("advertisement_publicity")%></td>
                </tr>
                <tr>
                    <td class="table_head_all_1  al">11.</td>
                    <td class="table_head_all_1">Professional Services</td>
                    <td class="table_head_all_1 al">(98.02.28)</td>
                    <td class="table_data al"><%=rs.getString("professional_services")%></td>
                </tr>
                <tr>
                    <td class="table_head_all_1  al">12.</td>
                    <td class="table_head_all_1">Gr. in Aid General</td>
                    <td class="table_head_all_1 al">(98.02.31)</td>
                    <td class="table_data al"><%=rs.getString("gr_in_aid_general")%></td>
                </tr>
                <tr>
                    <td class="table_head_all_1  al">13.</td>
                    <td class="table_head_all_1">Other Charges</td>
                    <td class="table_head_all_1 al">(98.02.50)</td>
                    <td class="table_data al"><%=rs.getString("other_charges")%></td>
                </tr>
                <tr>
                    <td class="table_head_all_1 al">14.</td>
                    <td class="table_head_all_1">Departmental Canteen</td>
                    <td class="table_head_all_1 al">(98.03.20)</td>
                    <td class="table_data al"><%=rs.getString("dcanteen")%></td>
                </tr>
                <tr>
                    <td class="table_head_all_1  al">15.</td>
                    <td class="table_head_all_1" colspan="2">Total Allotment</td>
                    <td class="table_data al"><b><%=rs.getString("total")%></b></td>
                </tr>

                <tr style="height: 35px;">
                    <td colspan="4" style="text-align: center">

                        <input type="submit" class="btn bg1" value="print" onclick="window.print()"/> 
                    </td>
                </tr>
            </table>
            <br/>
            <br/>
        </div>
        <%}
                }
            }
            con.close();
            rs.close();
            st.close();
        %>
        <script>
            function ValidateInsertExpenditure()
            {
                if (document.InsertExpenditure.salaries.value == null || document.InsertExpenditure.salaries.value == "")
                {
                    alert("Please enter the expenditure in 98.02.01 head (Salaries)");
                    document.getElementById("salaries").focus();
                    return false;
                }
                else if (document.InsertExpenditure.wages.value == null || document.InsertExpenditure.wages.value == "")
                {
                    alert("Please enter the expenditure in 98.02.02 head (Wages)");
                    document.getElementById("wages").focus();
                    return false;
                }
                else if (document.InsertExpenditure.over_time_allawance.value == null || document.InsertExpenditure.over_time_allawance.value == "")
                {
                    alert("Please enter the expenditure in 98.02.03 head (Over Time Allowance)");
                    document.getElementById("over_time_allawance").focus();
                    return false;
                }
                else if (document.InsertExpenditure.medical_treatment.value == null || document.InsertExpenditure.medical_treatment.value == "")
                {
                    alert("Please enter the expenditure in 98.02.06 head (Medical Treatment)");
                    document.getElementById("medical_treatment").focus();
                    return false;
                }
                else if (document.InsertExpenditure.travel_expense_domestic.value == null || document.InsertExpenditure.travel_expense_domestic.value == "")
                {
                    alert("Please enter the expenditure in 98.02.11 head (Travel Expenses (Domestic))");
                    document.getElementById("travel_expense_domestic").focus();
                    return false;
                }
                else if (document.InsertExpenditure.travel_expenses_foreign.value == null || document.InsertExpenditure.travel_expenses_foreign.value == "")
                {
                    alert("Please enter the expenditure in 98.02.12 head (Travel Expenses (Foreign))");
                    document.getElementById("travel_expenses_foreign").focus();
                    return false;
                }
                else if (document.InsertExpenditure.office_expenses.value == null || document.InsertExpenditure.office_expenses.value == "")
                {
                    alert("Please enter the expenditure in 98.03.13 head (Office Expenses)");
                    document.getElementById("office_expenses").focus();
                    return false;
                }
                else if (document.InsertExpenditure.rent_rate_taxes.value == null || document.InsertExpenditure.rent_rate_taxes.value == "")
                {
                    alert("Please enter the expenditure in 98.03.14 head (Rent, Rate & Taxes)");
                    document.getElementById("rent_rate_taxes").focus();
                    return false;
                }
                else if (document.InsertExpenditure.other_admin_expenses.value == null || document.InsertExpenditure.other_admin_expenses.value == "")
                {
                    alert("Please enter the expenditure in 98.03.20 head (Other Admn. Expenses)");
                    document.getElementById("other_admin_expenses").focus();
                    return false;
                }
                else if (document.InsertExpenditure.advertisement_publicity.value == null || document.InsertExpenditure.advertisement_publicity.value == "")
                {
                    alert("Please enter the expenditure in 98.03.26 head (Advertisement & Publicity)");
                    document.getElementById("advertisement_publicity").focus();
                    return false;
                }
                else if (document.InsertExpenditure.professional_services.value == null || document.InsertExpenditure.professional_services.value == "")
                {
                    alert("Please enter the expenditure in 98.03.28 head (Professional Services)");
                    document.getElementById("professional_services").focus();
                    return false;
                }
                else if (document.InsertExpenditure.gr_in_aid_general.value == null || document.InsertExpenditure.gr_in_aid_general.value == "")
                {
                    alert("Please enter the expenditure in 98.03.31 head (Gr. in Aid General)");
                    document.getElementById("gr_in_aid_general").focus();
                    return false;
                }
                else if (document.InsertExpenditure.other_charges.value == null || document.InsertExpenditure.other_charges.value == "")
                {
                    alert("Please enter the expenditure in 98.03.50 head (Other Charges)");
                    document.getElementById("other_charges").focus();
                    return false;
                }
                else if (document.InsertExpenditure.dcanteen.value == null || document.InsertExpenditure.dcanteen.value == "")
                {
                    alert("Please enter the expenditure in 98.03.20 head (Departmental Canteen)");
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
                var fTotal = val1 + val2 + val3 + val4 + val5 + val6 + val7 + val8 + val9 + val10 + val11 + val12 + val13 + val14;
                total.value = fTotal.toFixed(2);
            }

            function CalculateSalBreakupRow(val1, val2, val3, val4, val5, val6, val7)
            {
                val1 = Number(val1.value);
                val2 = Number(val2.value);
                val3 = Number(val3.value);
                val4 = Number(val4.value);
                val5 = Number(val5.value);
                val6 = Number(val6.value);
                var fTotal = val1 + val2 + val3 + val4 + val5 + val6;
                val7.value = fTotal;
            }
            function CalculateSalBreakupColumn(val1, val2, val3)
            {
                val1 = Number(val1.value);
                val2 = Number(val2.value);
                var fTotal = val1 + val2;
                val3.value = fTotal;
            }
            function CalculateProgressive(val1, val2, val3)
            {
                val1 = Number(val1.value);
                val2 = Number(val2.value);
                var fTotal = val1 + val2;
                val3.value = fTotal;
            }
        </script>
        <%

                if (con != null) {
                    con.close();
                }
                if (st != null) {
                    st.close();
                }
                if (rs != null) {
                    rs.close();
                }

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
