<%-- 
    Document   : BeAndRe
    Created on : 12 Apr, 2022, 11:31:42 AM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BE & RE</title>
        <style>
            .main-div
            {
                width: 100%;
                margin: auto;
                border: 1px solid sandybrown;
            }
            .main-head
            {
                font: normal normal 18px Verdana, Geneva, Arial, Helvetica, sans-serif;
                text-align: center;
            }
            table, th, tr,td { border: 1px solid sandybrown;
            font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;}
            table, th, tr,td { border-collapse: collapse;}
            .table-head
            {
                font: normal bold 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background: #fbf8ef ;
                color: #292929 ;
            }
            #inpt
            {
                width: 60px;
                border: 1px solid sandybrown;
                text-align: center;
            }
            .table-data-inp-cell
            {
                text-align: center;
            }
        </style>
    </head>
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
    <body>
        <div class="main-div">
            <h2 class="main-head">Details of the funds in r/o Fiels Offices in different object heads under <br/> <b>Establishment : 2851.00.102.98.02</b></h2>
            <br/>
            <div class="data-input-div">
                <table align="center">
                    <tr style="height: 40px">
                        <td rowspan="2" class="table-head">S.no</td>
                        <td rowspan="2" class="table-head">Object Head</td>
                        <td class="table-head">BE</td>
                        <td class="table-head">RE</td>
                        <td rowspan="2" class="table-head">Amount <br/>Alloted to<br/> field offices</td>
                        <td class="table-head">Expenditure<br/> upto <br/>2021-22</td>
                        <td rowspan="2" class="table-head">Balance <br/>available<br/> with Hqrs.<br/> in r/o BE</td>
                        <td rowspan="2" class="table-head">Balance <br/>available for<br/> disbursement <br/>with Hqrs.<br/> in r/o RE</td>
                        <td rowspan="2" class="table-head">Balance after <br/>expenditure <br/> in r/o <br/>2021-2022</td>
                        <td rowspan="2" class="table-head">Expected <br/>expenditure <br/>till <br/>March 2022.</td>
                        <td rowspan="2" class="table-head">Fund to be<br/> surrender</td>
                    </tr>
                    <tr style="height: 40px">
                        <td class="table-head">2021-22</td>
                        <td class="table-head">2021-22</td>
                        <td class="table-head">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="table-head">(i)</td>
                        <td class="table-head">(ii)</td>
                        <td class="table-head">(iii)</td>
                        <td class="table-head">(iv)</td>
                        <td class="table-head">(v)</td>
                        <td class="table-head">(vi)</td>
                        <td class="table-head">(vii)</td>
                        <td class="table-head">(viii)</td>
                        <td class="table-head">(ix)</td>
                        <td class="table-head">&nbsp;</td>
                        <td class="table-head">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="table-head">&nbsp;</td>
                        <td class="table-head">&nbsp;</td>
                        <td class="table-head">&nbsp;</td>
                        <td class="table-head">&nbsp;</td>
                        <td class="table-head">&nbsp;</td>
                        <td class="table-head">&nbsp;</td>
                        <td class="table-head">&nbsp;</td>
                        <td class="table-head">&nbsp;</td>
                        <td class="table-head">&nbsp;</td>
                        <td class="table-head">&nbsp;</td>
                        <td class="table-head">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="table-head">1</td>
                        <td class="table-head">Salaries</td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                    </tr>
                    <tr>
                        <td class="table-head">2</td>
                        <td class="table-head">Wages</td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                    </tr>
                    <tr>
                        <td class="table-head">3</td>
                        <td class="table-head">Over Time Allowance</td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                    </tr>
                    <tr>
                        <td class="table-head">4</td>
                        <td class="table-head">Medical Treatment</td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                    </tr>
                    <tr>
                        <td class="table-head">5</td>
                        <td class="table-head">DTE</td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                    </tr>
                    <tr>
                        <td class="table-head">6</td>
                        <td class="table-head">FTE</td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                    </tr>
                    <tr>
                        <td class="table-head">7</td>
                        <td class="table-head">OE</td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                    </tr>
                    <tr>
                        <td class="table-head">8</td>
                        <td class="table-head">RRR</td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                    </tr>
                    <tr>
                        <td class="table-head">9</td>
                        <td class="table-head">OAE</td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                    </tr>
                    <tr>
                        <td class="table-head">10</td>
                        <td class="table-head">Advertisement & Publicity</td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                    </tr>
                    <tr>
                        <td class="table-head">11</td>
                        <td class="table-head">Professional Services</td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                    </tr>
                    <tr>
                        <td class="table-head">12</td>
                        <td class="table-head">Gr. in Aid General</td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                    </tr>
                    <tr>
                        <td class="table-head">13</td>
                        <td class="table-head">Other Charges</td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                    </tr>
                    <tr>
                        <td class="table-head">14</td>
                        <td class="table-head">Departmental Canteen</td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                        <td class="table-data-inp-cell"><input class="" id="inpt" type="text" /></td>
                    </tr>
                </table>
                <br/>
                <br/>
            </div>
        </div>
    </body>
     <%
            } else {
                System.out.println("we did not get nmn value at allocation page");
                response.sendRedirect("stat.jsp");
                
            }
        %>
</html>
