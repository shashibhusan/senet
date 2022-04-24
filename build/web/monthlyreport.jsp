<%-- 
    Document   : monthlyreport
    Created on : 15 Oct, 2019, 3:20:57 PM
    Author     : msme
--%>
<%
String sessionid = request.getSession().getId();
response.setHeader("SET-COOKIE", "JSESSIONID=" + sessionid + "; HttpOnly");
%>
<%
           // Set to expire far in the past.
     response.setDateHeader("Expires", 0);
  // Set standard HTTP/1.1 no-cache headers.
     response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
  // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
     response.addHeader("Cache-Control", "post-check=0, pre-check=0");
  // Set standard HTTP/1.0 no-cache header.
     response.setHeader("Pragma", "no-cache");
          request.getSession(false);
        %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="common.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report</title>
        <style>
            .mainDiv
            {
                border: 1px  #919291 solid;
                padding: 5px;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color:  #f2f3f2  ;
            }
            select,option, input[type=button]
            {
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                width: 90px;
            }
            #dataRecieved
            {
                
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px  #919291 solid;
            }
            .pars{
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                height: 5px;
            }
            table tr td { border-collapse: collapse; }
            #head
            {
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color: #cecccc ;
                width: 35px;
                padding: 5px;
            }
            #head1
            {
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color: #cecccc ;
                width: 175px;
                padding: 5px;
            }
            #not{
                float: left;
            }
            #record
            {
                width: 250px;
                float: left;
            }
            #div1
            {
              width: 550px;
              margin: auto;
              align: center;
              border: 2px  #919291 solid;
              padding: 6px;
            }
            #error{
                font: normal normal 15px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color:  #9e0202 ;
               
                width: 100%;
                padding: 3px;
            }
            #clr:nth-child(odd)
            {
                background-color: #eeeeee;
            }
            #heading
            {
                font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
                width: 100%;
                margin: auto;
                align: center;
                padding-bottom: 5px;
            }
        </style>
        <script type="text/javascript" src="code.jquery.com/jquery-2.1.0.min.js"></script>
        <script type="text/javascript" src="javaScript/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/javaScript/monthlyreport.js"></script>
        <script>
	$(function() {
	var d = new Date(),

    n = d.getMonth(),

    y = d.getFullYear();
    var m=(n-3);
	var x=y+1;
  var	z=y+("-")+x;

$('#monthSelected option:eq('+m+')').prop('selected', true);

$('#yearSelected option[value="'+z+'"]').prop('selected', true);
	});
</script>
<script language="JavaScript">
window.history.forward(0);
</script>
    </head>
    <body>
        <h3>Expenditure Report Uploaded </h3>
        <div class="mainDiv">
            <form id="ReportForm" name="monthlyReportForm" action="#" >
            <table>
                <tr>
                    <td style="">
                        Select Year : 
                        <select id="yearSelected" name="yearSelected">
                            <option value="">Select</option>
                            <option value="2024-2025">2024-2025</option>
                            <option value="2023-2024">2023-2024</option>
                            <option value="2022-2023">2022-2023</option>
                            <option value="2021-2022">2021-2022</option>
                            <option value="2020-2021">2020-2021</option>
                            <option value="2019-2020">2019-2020</option>
                            <option value="2018-2019">2018-2019</option>
                            <option value="2017-2018">2017-2018</option>
                            <option value="2016-2017">2016-2017</option>
                            <option value="2015-2016">2015-2016</option>
                        </select>
                    </td>
                    <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                        Select Month : 
                        <select id="monthSelected" name="monthSelected">                            
                            <option value="">Select</option>
                            <option value="1">April</option>
                            <option value="2">May</option>
                            <option value="3">June</option>
                            <option value="4">July</option>
                            <option value="5">August</option>
                            <option value="6">September</option>
                            <option value="7">October</option>
                            <option value="8">November</option>
                            <option value="9">December</option>
                            <option value="10">January</option>
                            <option value="11">February</option>
                            <option value="12">March</option>
                        </select>
                    </td>
                    <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                        <input type="button" id="btn" value="Go" onclick="return Check();"/>
                    </td>
                </tr>
            </table>
                </form>
        </div>
       
        <div id="error">  
           
        </div>
        <br/>
        <div id="dataIn">            
        </div>
    </body>
</html>
