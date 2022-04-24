<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Untitled Document</title>
        <script type="text/javascript" src="jquery-1.11.3.js"></script>
<script>
	$(function() {
	var d = new Date(),

    n = d.getMonth(),

    k = d.getFullYear();
    var mm=(n-3);
var x=k+1;
  var	y=k+("-")+x;

$('#cmbMonth option:eq('+mm+')').prop('selected', true);

$('#cmbYear option[value="'+y+'"]').prop('selected', true);
	});
</script>
        <link href="inb.css" rel="stylesheet" type="text/css"></link>
        <script>
            function validate()
            {
                var year=document.getElementById("cmbYear").value;
                var month=document.getElementById("cmbMonth").value;
                var reportType=document.getElementById("report").value;
                var general=document.getElementById("general").checked;
                var scsp=document.getElementById("scsp").checked;
                var tsp=document.getElementById("tsp").checked;
              //  var women=document.getElementById("women").checked;


                if((reportType<0))
                {
                    alert("Please select Report Type");

                    return false;
                }

                if((year<0))
                {
                    alert("Please select  Year");
                    return false;
                }
                if((month<0))
                {
                    alert("Please select  Month");
                    return false;
                }
                if((!general)&&(!scsp)&&(!tsp)&&(!women))
                {
                    alert("Please check atleast one checkbox");
                    return false;
                }
                document.forms[0].action = "ISOReportDisplay.jsp"
            }
        </script>
    </head>
     <body bgcolor="#FBFBFB">

        <br/>
        <br/>
        <br/>
        <div style="font-size:large;font-family:Verdana;font-weight:bold;  " align="center" ><font color="#990033">MONTHLY PROGRESS REPORT</font></div>
        <br/>
        <form name="fname" action=" " method="post">
            <table  align="center"   width="82%" bordercolordark="#990000">
                <tr>
                    <td width="19%"><font color="#990000">Report Type</font></td>
                    <td width="19%">
                        <select name="report" id="report" style="width: 130px">
                            <option value="-1">- - - Select - - -</option>
                            <option value="monthly">Monthly</option>
                           <%-- <option value="cumulative">Cumulative</option>--%>
                        </select></td>
                    <td width="15%"><font color="#990000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Year</font></td>
                    <td width="19%">
                        <select name="cmbYear" id="cmbYear" style="width: 130px">
                             
                            <option value="2011-2012">2011-2012</option>
<option value="2012-2013">2012-2013</option>
<option value="2013-2014">2013-2014</option>
<option value="2014-2015">2014-2015</option>
<option value="2015-2016">2015-2016</option>
<option value="2016-2017">2016-2017</option>
<option value="2017-2018">2017-2018</option>
<option value="2018-2019">2018-2019</option>
<option value="2019-2020">2019-2020</option>
<option value="2020-2021">2020-2021</option>
                        </select></td>
                    <td width="15%">
                        <font color="#990000">&nbsp;&nbsp;&nbsp;&nbsp;Month</font></td>
                    <td width="19%">
                        <select name="cmbMonth" id="cmbMonth" style="width:130px"  >
                             
                            <option value="1">April</option>
                            <option value="2">May</option>
                            <option value="3">June</option>
                            <option value="4">July</option>
                            <option value="5">August</option>
                            <option value="6">September</option>
                            <option value="7">October</option>
                            <option value="8">Noveber</option>
                            <option value="9">December</option>
                            <option value="10">January</option>
                            <option value="11">February</option>
                            <option value="12">March</option>
                        </select>
                    </td>
                </tr>
            </table>
            <br/>

            <table align="center" >
                <tr>
                    <td width="25%" >
                        <input type="checkbox" name="general" id="general" value="GENERAL" onclick="general()"/> GENERAL

                    </td>
                    <td width="19%" >
                        <input type="checkbox" name="scsp" id="scsp" value="SCSP" onclick="scsp()"/> SCSP

                    </td>
                    <td width="17%" >
                        <input type="checkbox" name="tsp" id="tsp" value="TSP"onclick="tsp()"/> TSP

                    </td>
                    
                    <%--     <td width="25%" >
                        <input type="checkbox" name="women"  id="women" value="WOMEN"onclick="women()"/> WOMEN

                    </td>   --%>
                </tr>
            </table>
            <br/>
            <table align="center" >
                <tr>
                    <td>
                        <input style="height:30px;width:120px;background: #0066CC;font-size: medium;"type="submit" value="Generate" onclick=" return validate()"></input>

                    </td>
                </tr>
            </table>
        </form>
</html>
