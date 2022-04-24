<%-- 
    Document   : expenditurebaReport
    Created on : 9 Mar, 2022, 1:32:49 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, common.*" %>
<%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Expenditure Report</title>
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
                width: 97.8%;
                border: 1px #009f76 solid;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color:  #303030 ;
            }
            .table_head_all
            {
                background-color:  #b1e8da ;
                font: normal bold 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px #009f76 solid;
                color:  #303030 ;
                padding-left: 4px;
            }
            .table_head_all_s
            {
                background-color:  #b1e8da ;
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px #009f76 solid;
                color:  #303030 ;
                padding-left: 4px;
                text-align: center;
            }

            .table_data{
                border: 1px #009f76 solid;
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 5px 0px 5px 2px;
                color:  #303030 ;
            }
            table, th, tr,td { border-collapse: collapse;} 
            .mytable-head
            {
                width: 70%;
                border: 1px #009f76 solid;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
        </style>
    </head>
    <body>
         <%
            String Random5 = (String) session.getAttribute("Random5");
            String mnm = request.getParameter("mnm");
            System.out.println("prakash chandradeynccffffff ---------B&A fund allocation report======" + Random5);
            System.out.println("prakash chandradeynccffffff ---------B&A fund allocation report======" + mnm);
            if (Random5.equals(mnm)) {
                
                DecimalFormat pF = new DecimalFormat("0.00");
                
                String user = (String) session.getAttribute("user");
//                if (user != null && user != "") {
                int divFlag = 0, buttonFlag = 0;
                String instId = (String) session.getAttribute("CmbIns");
                String role = (String) session.getAttribute("rol");
                String years = (String) session.getAttribute("CmbYear");
                String months = (String) session.getAttribute("CmbMonth");
                
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
                %>
          <div id="main-div">
            <h2 align="center" class="head">Expenditure Report of FY <%=years%> </h2>

            <br/>
            <table align="center" class="mytable">
                
                <thead style="height: 35px;">
                    <td class="table_head_all"></td>
                    <td colspan="3" class="table_head_all">(98.02.01)</td>
                    <td colspan="3" class="table_head_all">(98.02.02)</td>
                    <td colspan="3" class="table_head_all">(98.02.11)</td>
                    <td colspan="3" class="table_head_all">(98.02.13)</td>
                    <td colspan="3" class="table_head_all">(98.02.06)</td>
                    <td colspan="3" class="table_head_all">(98.02.28)</td>
                    <td colspan="3" class="table_head_all">(98.03.20)</td>
                    <td colspan="3" rowspan="2" class="table_head_all">&nbsp;<br/>Total</td>
                    </thead>

                    <tr style="height: 35px;">
                        <td class="table_head_all">MSME(Development Institute)</td>
                        <td colspan="3" class="table_head_all">SALARIES</td>
                        <td colspan="3" class="table_head_all">WAGES</td>
                        <td colspan="3" class="table_head_all">DTE</td>
                        <td colspan="3" class="table_head_all">OE</td>
                        <td colspan="3" class="table_head_all">Medical</td>
                        <td colspan="3" class="table_head_all">Prop.Srvs.</td>
                        <td colspan="3" class="table_head_all">D.Canteen</td>
                        <td colspan="3" class="table_head_all"></td>
                    </tr>
                <tr style="height: 25px;">
                    <td class="table_head_all_s" style="width: 100px;"></td>
                    <td class="table_head_all_s">Allo</td>
                    <td class="table_head_all_s">exp</td>
                    <td class="table_head_all_s">bal</td>
                    <td class="table_head_all_s">Allo</td>
                    <td class="table_head_all_s">exp</td>
                    <td class="table_head_all_s">bal</td>
                    <td class="table_head_all_s">Allo</td>
                    <td class="table_head_all_s">exp</td>
                    <td class="table_head_all_s">bal</td>
                    <td class="table_head_all_s">Allo</td>
                    <td class="table_head_all_s">exp</td>
                    <td class="table_head_all_s">bal</td>
                    <td class="table_head_all_s">Allo</td>
                    <td class="table_head_all_s">exp</td>
                    <td class="table_head_all_s">bal</td>
                    <td class="table_head_all_s">Allo</td>
                    <td class="table_head_all_s">exp</td>
                    <td class="table_head_all_s">bal</td>
                    <td class="table_head_all_s">Allo</td>
                    <td class="table_head_all_s">exp</td>
                    <td class="table_head_all_s">bal</td>
                    <td class="table_head_all_s">Allo</td>
                    <td class="table_head_all_s">exp</td>
                    <td class="table_head_all_s">bal</td>
                </tr>
                <%
            Double aSalaries=0.0,aWages=0.0, aDte=0.0, aOe=0.0, aMedical=0.0, aProp_sevs=0.0, aDcanteen=0.0, aTotal=0.0;
            Double eSalaries=0.0,eWages=0.0, eDte=0.0, eOe=0.0, eMedical=0.0, eProp_sevs=0.0, eDcanteen=0.0, eTotal=0.0;
            
            
                    String qr1 = "select a.inst_type as type, a.inst_name as intName,b.salaries,"
                            + "sum(c.salaries) as exp1, (b.salaries-sum(c.salaries)) as bal1,b.wages,sum(c.wages) as exp2,"
                            + "(b.wages-sum(c.wages)) as bal2,b.dte, sum(c.dte) as exp3,(b.dte-sum(c.dte)) as bal3,b.oe, sum(c.oe) as exp4, "
                            + "(b.oe-sum(c.oe)) as bal4,b.medical, sum(c.medical) as exp5,(b.medical-sum(c.medical)) as bal5,b.prop_sevs, "
                            + "sum(c.prop_sevs) as exp6, (b.prop_sevs-sum(c.prop_sevs)) as bal6,b.dcanteen, sum(c.dcanteen) as exp7,"
                            + "(b.dcanteen-sum(c.dcanteen)) as bal7,b.total, sum(c.total) as exp8, (b.total-sum(c.total)) as bal8 "
                            + "from pao_branches a right join tbl_ba_fundallocation b on a.Inst_id=b.Inst_id right join tbl_ba_expenditure c on a.Inst_id=c.Inst_id "
                            + "where a.Inst_id='I16' and c.YEARS='2022-2023';";
                    rs = st.executeQuery(qr1);
                while (rs.next()) {
                aSalaries=rs.getDouble("salaries");
                aWages=rs.getDouble("wages");
                aDte=rs.getDouble("dte");
                aOe=rs.getDouble("oe"); 
                aMedical=rs.getDouble("medical"); 
                aProp_sevs=rs.getDouble("prop_sevs"); 
                aDcanteen=rs.getDouble("dcanteen");
                aTotal=rs.getDouble("total");
                %>

                <tr>
                    <td class="table_data" align="left"><%=rs.getString("type")%> <%=rs.getString("intName")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("salaries")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("exp1")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("bal1")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("wages")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("exp2")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("bal2")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("dte")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("exp3")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("bal3")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("oe")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("exp4")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("bal4")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("medical")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("exp5")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("bal5")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("prop_sevs")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("exp6")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("bal6")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("dcanteen")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("exp7")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("bal7")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("total")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("exp8")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("bal8")%></td>
                </tr>
                
                <%}
                String qr3 = "select sum(salaries) as salaries,sum(wages) as wages,sum(dte) as dte,sum(oe) as oe,sum(medical) as medical,sum(prop_sevs) as prop_sevs, sum(dcanteen) as dcanteen, sum(total) as total from tbl_ba_expenditure where YEARS='"+years+"' and inst_id='"+instId+"'" ;
                rs = st.executeQuery(qr3);
                while (rs.next()) {
                
                eSalaries=rs.getDouble("salaries");
                eWages=rs.getDouble("wages");
                eDte=rs.getDouble("dte");
                eOe=rs.getDouble("oe"); 
                eMedical=rs.getDouble("medical"); 
                eProp_sevs=rs.getDouble("prop_sevs"); 
                eDcanteen=rs.getDouble("dcanteen");
                eTotal=rs.getDouble("total"); 
                %>
<!--                <tr>
                    <td class="table_data" align="left"><b>Total Expenditure<b/></td>
                    <td class="table_data" align="center"><%=rs.getDouble("salaries")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("salaries")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("salaries")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("wages")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("wages")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("wages")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("dte")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("dte")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("dte")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("oe")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("oe")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("oe")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("medical")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("medical")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("medical")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("prop_sevs")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("prop_sevs")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("prop_sevs")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("dcanteen")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("dcanteen")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("dcanteen")%></td>
                    <td class="table_data" align="center"><%=rs.getDouble("total")%></td>
                </tr>-->
                <%
                }
                %>
                
<!--                <tr>
                    <td class="table_data" align="left"><b>Balance Fund<b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aSalaries-eSalaries)%><b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aSalaries-eSalaries)%><b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aSalaries-eSalaries)%><b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aWages-eWages)%><b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aWages-eWages)%><b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aWages-eWages)%><b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aDte-eDte)%><b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aDte-eDte)%><b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aDte-eDte)%><b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aOe-eOe)%><b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aOe-eOe)%><b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aOe-eOe)%><b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aMedical-eMedical)%><b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aMedical-eMedical)%><b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aMedical-eMedical)%><b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aProp_sevs-eProp_sevs)%><b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aProp_sevs-eProp_sevs)%><b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aProp_sevs-eProp_sevs)%><b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aDcanteen-eDcanteen)%><b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aDcanteen-eDcanteen)%><b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aDcanteen-eDcanteen)%><b/></td>
                    <td class="table_data" align="center"><b><%=pF.format(aTotal-eTotal)%><b/></td>
                </tr>-->

            </table>
            <br/>
        </div>
                <%
                } else {
                System.out.println("we did not get nmn value at allocation page");
                response.sendRedirect("stat.jsp");

            }
        %>
    </body>
</html>
