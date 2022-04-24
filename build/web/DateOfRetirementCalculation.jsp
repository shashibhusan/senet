<%-- 
    Document   : DateOfRetirementCalculation
    Created on : Apr 27, 2018, 11:48:10 AM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.text.ParseException" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="code.jquery.com/jquery-2.1.0.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Date of retiremwnt Calculation</title>
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

            function calculateDOB(){
               var dob = document.getElementById("dob").value;
               if(dob==null || dob==""){
                   document.getElementById("dateErr").innerHTML="Please select date";
                   return false;
               }else
                   {
                       
                       document.getElementById("dateErr").innerHTML="";
                       document.forms[0].action = "CalculateDate.jsp"
  return true;
                   }
            }

 /*       var request;


function calculate()
{
 //   alert("calculate function is working");
var dob = document.getElementById("dob").value;
var url="CalculateDate.jsp?val="+dob;

if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=getInfo;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
}

function getInfo(){
if(request.readyState==4){
var val=request.responseText;
document.getElementById('dateOfRetirement').innerHTML=val;
}
}*/
        </script>
        <style>
            table tr td {
                border: 1px black solid;
               
}
#dateErr{
    font-family: Vardana;
    color : red;
    font-size: 16px;
}
        </style>
    </head>
    <body>
        <br><br/><br/>
        <center>
            <form name="myForm" method="" id="myForm">
             <table>
                 <tr>
                     <td colspan="2" align="center"><b>Cacculate Date Of Retirement</b></td>
                 </tr>
                 <tr>
                     <td>Please Select Date of Birth</td>
                     <td><input type="text" name="dob" id="dob" class="datepicker" placeholder="Select date"><br/><div id="dateErr"></div></td>

                 </tr>

                 <tr>
                     <td colspan="2" align="right">
                         <input type="submit" value=" Submit" onclick="return calculateDOB();">
                     </td>
                 </tr><br>
                 <tr>
                     <td> Date of Retirement</td>
                     <td id="dateOfRetirement"></td>
                 </tr>
        </table>
            </form>
        </center>
    </body>
</html>
