<%-- 
    Document   : expenditureba
    Created on : 2 Mar, 2022, 5:00:00 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, common.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Expenditure</title>
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
//            function isNumber(evt, id)
//            {
//                try {
//                    var charCode = (evt.which) ? evt.which : event.keyCode;
//
//                    if (charCode == 46) {
//                        var txt = document.getElementById(id).value;
//                        if (!(txt.indexOf(".") > -1)) {
//
//                            return true;
//                        }
//                    }
//                    if (charCode > 31 && (charCode < 48 || charCode > 57))
//                        return false;
//
//                    return true;
//                } catch (w) {
//                    alert(w);
//                }
//            }


function isNumberKey(evt, id)
            {
                try {
                    var charCode = (evt.which) ? evt.which : event.keyCode;

                    if (charCode == 46) {
                        var txt = document.getElementById(id).value;
                        if (!(txt.indexOf(".") > -1)) {

                            return true;
                        }
                    }
                    if (charCode > 31 && (charCode < 48 || charCode > 57))
                        return false;

                    return true;
                } catch (w) {
                    alert(w);
                }
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
            .al
            {
                text-align: center;
            }
            #main-div
            {
                width: 99%;
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
                width:650px;
                border: 1px #009f76 solid;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color: #303030 ;
            }
            .table_head_all
            {
                background-color:  #b1e8da ;
                font: normal bold 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px #009f76 solid;
                color:  #303030 ;
                padding-left: 5px;
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
                padding: 2px;
                color:  #303030 ;
            }
            table, th, tr,td { border-collapse: collapse;} 
            .mytable-head
            {
                width: 70%;
                border: 1px #009f76 solid;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            .selectdiv
            {
                width: 220px;
                padding: 4px 0px 4px 0px;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px #009f76 solid;
                color:  #303030 ;
            }
            .inpt
            {
                border: 1px #009f76 solid;
                text-align:center;
                padding: 2px 0px 2px 0px;
                width: 90px;
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
        </style>
    </head>
    <body>
        <%
            String Random5 = (String) session.getAttribute("Random5");
            String mnm = request.getParameter("mnm");
            System.out.println("prakash chandradeynccffffff ---------B&A fund allocation======" + Random5);
            System.out.println("prakash chandradeynccffffff ---------B&A fund allocation======" + mnm);
            if (Random5.equals(mnm)) {

                String user = (String) session.getAttribute("user");
                System.out.println("user is ----- " + user);
//                if (user != null && user != "") {
                    int divFlag = 0, buttonFlag = 0;
                    String instId = (String) session.getAttribute("CmbIns");
                    String role = (String) session.getAttribute("rol");
                    String years = (String) session.getAttribute("CmbYear");
                    String months = (String) session.getAttribute("CmbMonth");
        %>
        <div id="main-div">
            <h2 align="center" class="head">Entry of Allocation of Funds during the year <%=years%></h2>
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
            %>
            <form name="UploadAllocation" id="UploadAllocation" method="POST" action="../UploadAllocationMain" autocomplete="off" onsubmit="return ValidateUploadAllocation();">
                <input type="hidden" value="<%=years%>" name="years"/>
                <table align="center" class="mytable-head">
                    <tr style="height: 30px;">
                        <td class="table_head_all">PAO :</td>
                        <td class="table_head_all">Branch :</td>
                    </tr>
                    <tr>
                        <td class="table_data" align="center">
                            <select class="pao selectdiv" name="pao" id="pao" index='1' onchange="InsertPaoName(this, paoname), getInstiture(this);">
                                <option value="">select PAO</option>
                                <%
                                    int i = 0;
                                    String sql = "select * from pao_branches group by pao_name";
                                    rs = st.executeQuery(sql);
                                    while (rs.next()) {
                                        i = i + 1;
                                %>
                                <option value="<%=rs.getString("pao_name")%>"><%=i%>. <%=rs.getString("pao_name")%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                        <td class="table_data" align="center">
                            <select name="branchName" class="branchName selectdiv" id="branchName" index='2' onchange="InsertBranchName(this);">
                                <option value="">select institute</option>
                            </select>
                        </td>
                    </tr>
                </table>
                <br/>
                <table align="center" class="mytable">
                    <thead style="height: 30px;">
                    <td colspan="4" class="table_head_all" align="center">Allocation for : <b><span id="brname"></span></b> (PAO-<span id="paoname"></span> )</td>
                    </thead>
                    
                    <thead style="height: 30px;">
                      <td class="table_head_all">Sno</td>  
                      <td class="table_head_all">Sub Head</td>  
                      <td class="table_head_all">Budget Code</td>  
                      <td class="table_head_all">Allotment</td>  
                    </thead>
                    
                    <tr>
                        <td class="table_head_all_1 al">1.</td>
                        <td class="table_head_all_1">Salaries</td>
                        <td class="table_head_all_1 al">(98.02.01)</td>
                        <td class="table_data" align="center">
                            <img src="Indian_Rupee_symbol.png" height="12" width="8" alt="Ruppee"/>
                            <input type="text" class="inpt" name="salaries" id="salaries" index='3' 
                                   onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               onkeypress="return isNumberKey(event, this.id)"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">2.</td>
                        <td class="table_head_all_1">Wages</td>
                        <td class="table_head_all_1 al">(98.02.02)</td>
                        <td class="table_data" align="center">
                            <img src="Indian_Rupee_symbol.png" height="12" width="8" alt="Ruppee"/>
                            <input type="text" class="inpt" name="wages" id="wages" index='4'  
                                   onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               onkeypress="return isNumberKey(event, this.id)"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">3.</td>
                        <td class="table_head_all_1">Over Time Allowance</td>
                        <td class="table_head_all_1 al">(98.02.03)</td>
                        <td class="table_data" align="center">
                            <img src="Indian_Rupee_symbol.png" height="12" width="8" alt="Ruppee"/>
                            <input type="text" class="inpt" name="over_time_allawance" id="over_time_allawance" index='5'  
                                   onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               onkeypress="return isNumberKey(event, this.id)"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">4.</td>
                        <td class="table_head_all_1">Medical Treatment</td>
                        <td class="table_head_all_1 al">(98.02.06)</td>
                        <td class="table_data" align="center">
                            <img src="Indian_Rupee_symbol.png" height="12" width="8" alt="Ruppee"/>
                            <input type="text" class="inpt" name="medical_treatment" id="medical_treatment" index='6'  
                                   onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               onkeypress="return isNumberKey(event, this.id)"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">5.</td>
                        <td class="table_head_all_1">Travel Expenses (Domestic)</td>
                        <td class="table_head_all_1 al">(98.02.11)</td>
                        <td class="table_data" align="center">
                            <img src="Indian_Rupee_symbol.png" height="12" width="8" alt="Ruppee"/>
                            <input type="text" class="inpt" name="travel_expense_domestic" id="travel_expense_domestic" index='7'  
                                   onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)"  
                                               onkeypress="return isNumberKey(event, this.id)"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">6.</td>
                        <td class="table_head_all_1">Travel Expenses (Foreign)</td>
                        <td class="table_head_all_1 al">(98.02.12)</td>
                        <td class="table_data" align="center">
                            <img src="Indian_Rupee_symbol.png" height="12" width="8" alt="Ruppee"/>
                            <input type="text" class="inpt" name="travel_expenses_foreign" id="travel_expenses_foreign" index='8'  
                                   onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)"  
                                               onkeypress="return isNumberKey(event, this.id)"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">7.</td>
                        <td class="table_head_all_1">Office Expenses</td>
                        <td class="table_head_all_1 al">(98.02.13)</td>
                        <td class="table_data" align="center">
                            <img src="Indian_Rupee_symbol.png" height="12" width="8" alt="Ruppee"/>
                            <input type="text" class="inpt" name="office_expenses" id="office_expenses" index='9'  
                                   onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               onkeypress="return isNumberKey(event, this.id)"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">8.</td>
                        <td class="table_head_all_1">Rent, Rate & Taxes</td>
                        <td class="table_head_all_1 al">(98.02.14)</td>
                        <td class="table_data" align="center">
                            <img src="Indian_Rupee_symbol.png" height="12" width="8" alt="Ruppee"/>
                            <input type="text" class="inpt" name="rent_rate_taxes" id="rent_rate_taxes" index='10'  
                                   onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               onkeypress="return isNumberKey(event, this.id)"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">9.</td>
                        <td class="table_head_all_1">Other Admn. Expenses</td>
                        <td class="table_head_all_1 al">(98.02.20)</td>
                        <td class="table_data" align="center">
                            <img src="Indian_Rupee_symbol.png" height="12" width="8" alt="Ruppee"/>
                            <input type="text" class="inpt" name="other_admin_expenses" id="other_admin_expenses"  
                                   onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='11' onkeypress="return isNumberKey(event, this.id)"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">10.</td>
                        <td class="table_head_all_1">Advertisement & Publicity</td>
                        <td class="table_head_all_1 al">(98.02.26)</td>
                        <td class="table_data" align="center">
                            <img src="Indian_Rupee_symbol.png" height="12" width="8" alt="Ruppee"/>
                            <input type="text" class="inpt" name="advertisement_publicity" id="advertisement_publicity"  
                                   onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='12' onkeypress="return isNumberKey(event, this.id)"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">11.</td>
                        <td class="table_head_all_1">Professional Services</td>
                        <td class="table_head_all_1 al">(98.02.28)</td>
                        <td class="table_data" align="center">
                            <img src="Indian_Rupee_symbol.png" height="12" width="8" alt="Ruppee"/>
                            <input type="text" class="inpt" name="professional_services" id="professional_services"  
                                   onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='13' onkeypress="return isNumberKey(event, this.id)"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">12.</td>
                        <td class="table_head_all_1">Gr. in Aid General</td>
                        <td class="table_head_all_1 al">(98.02.31)</td>
                        <td class="table_data" align="center">
                            <img src="Indian_Rupee_symbol.png" height="12" width="8" alt="Ruppee"/>
                            <input type="text" class="inpt" name="gr_in_aid_general" id="gr_in_aid_general"  
                                   onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='14' onkeypress="return isNumberKey(event, this.id)"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">13.</td>
                        <td class="table_head_all_1">Other Charges</td>
                        <td class="table_head_all_1 al">(98.02.50)</td>
                        <td class="table_data" align="center">
                            <img src="Indian_Rupee_symbol.png" height="12" width="8" alt="Ruppee"/>
                            <input type="text" class="inpt" name="other_charges" id="other_charges"  
                                   onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='15' onkeypress="return isNumberKey(event, this.id)"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1 al">14.</td>
                        <td class="table_head_all_1">Departmental Canteen</td>
                        <td class="table_head_all_1 al">(98.03.20)</td>
                        <td class="table_data" align="center">
                            <img src="Indian_Rupee_symbol.png" height="12" width="8" alt="Ruppee"/>
                            <input type="text" class="inpt" name="dcanteen" id="dcanteen"  
                                   onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='16' onkeypress="return isNumberKey(event, this.id)"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="table_head_all_1  al">15.</td>
                        <td class="table_head_all_1" colspan="2">Total Allotment</td>
                        <td class="table_data" align="center">
                            <img src="Indian_Rupee_symbol.png" height="12" width="8" alt="Ruppee"/>
                            <input type="text" class="inpt" name="total" id="total" readonly="2"  
                                   onblur="CalculateTotal(salaries, wages, over_time_allawance, medical_treatment, travel_expense_domestic, travel_expenses_foreign, office_expenses,
                                               rent_rate_taxes,other_admin_expenses,advertisement_publicity,professional_services,gr_in_aid_general,other_charges,dcanteen, total)" 
                                               index='17' onkeypress="return isNumberKey(event, this.id)"/>
                        </td>
                    </tr>

                    <tr style="height: 35px;">
                        <td colspan="8" style="text-align: center">
                            <input type="reset" class="btn bg2" value="reset" onclick="window.reset()"/>&nbsp;&nbsp;
                            <input type="submit" class="btn bg1" value="submit"/> 
                        </td>
                    </tr>
                </table>
            </form>
            <br/>

        </div>
        <br/>
        <br/>
   
        <script>
            function InsertPaoName(name, i)
            {
                document.getElementById('paoname').innerHTML = name.value;
            }
            function InsertBranchName(inst_id)
            {
                var inst_id = inst_id.value;
                if (!(inst_id === null || inst_id === ''))
                {

                    var url = "fetchBranch.jsp?inst_id=" + inst_id;

                    if (window.XMLHttpRequest) {
                        request = new XMLHttpRequest();
                    }
                    else if (window.ActiveXObject) {
                        request = new ActiveXObject("Microsoft.XMLHTTP");
                    }

                    try
                    {
                        request.onreadystatechange = getBranchName;
                        request.open("GET", url, true);
                        request.send();
                    }
                    catch (e)
                    {
                        alert("Unable to connect to server");
                    }

                }
            }
            var request;
            function getBranchName()
            {
                if (request.readyState == 4)
                {
                    var val = request.responseText;
                    document.getElementById('brname').innerHTML = val;
                }
            }

            function getInstiture(n)
            {
                var pao = n.value;
                if (!(pao === null || pao === ''))
                {
                    var url = "fetchInst.jsp?pao_name=" + pao;

                    if (window.XMLHttpRequest) {
                        request = new XMLHttpRequest();
                    }
                    else if (window.ActiveXObject) {
                        request = new ActiveXObject("Microsoft.XMLHTTP");
                    }

                    try
                    {
                        request.onreadystatechange = getInfo;
                        request.open("GET", url, true);
                        request.send();
                    }
                    catch (e)
                    {
                        alert("Unable to connect to server");
                    }

                }
            }


            function getInfo()
            {
                if (request.readyState == 4)
                {
                    var val = request.responseText;
                    document.getElementById('branchName').innerHTML = val;
                }
            }
            function ValidateUploadAllocation()
            {
                var years=document.UploadAllocation.years.value;
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
                    var cnf = "Do you want to upload this budget allocation for the FY '"+years+"'?";
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
                var fTotal = val1 + val2 + val3 + val4 + val5 + val6 + val7 +val8 + val9 + val10 + val11 + val12 + val13 + val14;
                total.value = fTotal.toFixed(3);
            }

        </script>
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
