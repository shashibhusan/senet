<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<style type="text/css"><!--
.pink {color:#000000; background:#E8E8E8 }
.green  {color:#000000; background:#FDFCEE }
.blue {FONT-FAMILY: Times New Roman,Times; BACKGROUND:#C5D6FC}
.yellow {FONT-FAMILY: Times New Roman,Times; BACKGROUND:#DFDAE7}
--></style>
<script language="javascript" src="cal2.js">
/*
Xin's Popup calendar script-  Xin Yang (http://www.yxscripts.com/)
Script featured on/available at http://www.dynamicdrive.com/
This notice must stay intact for use
*/
</script>
<script language="javascript" src="cal_conf2.js"></script>
</head>

<body bgcolor="#FFEDEC">
<form  name="sampleform" id="sampleform" method="post" action="employeesubmit.jsp" onSubmit="return validate()">
<script language="javascript" type="text/javascript" src="js/datetimepicker.js">
		 
		 function fntextval(objtxt)
		 {
		     if(objtxt.value=="")
			 alert("Value is missing");
			 return;
		 }
</script>
<h3 align="center">Welcome to Enter Employee Profile of an Employee</h3>
<table width="100%" height="571" border="0" align="center" bordercolor="#800000">
  <tr class="pink">
    <td width="366">Name</td>
    <td width="811"><input type="text" name="name" id="name" size="40" /></td>
  </tr>
  <tr class="green">
    <td>Designation</td>
    <td>
	<SELECT NAME="Designation" style="width: 255px">
<OPTION VALUE="">- Please select -</OPTION>
<option value="AIA">AIA</option>
<option value="Director">Director</option>
<option value="Deputy Director">Deputy Director</option>
<option value="Assistant Director Grade-I">Assistant Director Grade-I</option>
<option value="Assistant Director Grade-II">Assistant Director Grade-II</option>
<option value="Investigator">Investigator</option>
</SELECT>
	
	</td>
  </tr>
  <tr class="pink">
    <td>Discipline</td>
    <td>
	
<select name="Discipline" id="Discipline" style="width: 255px"  >
	<OPTION VALUE="">- Please select -</OPTION>
	<option value="Mechanical">Mechanical</option>
	<option value="Electrical">Electrical</option>
	<option value="Chemical">Chemical</option>
	<option value="Plastic">Plastic</option>  
	<option value="Metlluregy">Metlluregy</option>
	<option value="L/F">L/F</option>  
	<option value="G&C">G&C </option>
	<option value="Food">Food</option>  
	<option value="Cane making">Cane making/Bamboo</option>
	<option value="Hosiery/Handloom/Textile">Hosiery/Handloom/Textile</option>  
	<option value="Electronics">Electronics</option>
	<option value="IMT">IMT</option>
	<option value="EI">EI </option>
	<option value="Statstics">Statstics</option>
	<option value="Others">Others</option>  	
    </select>
	
	
	</td>
  </tr>
  <tr class="green">
    <td>Category (SC/ST/OBC/General)</td>
    <td><select name="Division" id="Division" style="width: 255px"  >
	<OPTION VALUE="">- Please select -</OPTION>
	<option value="SC">SC</option>
	<option value="ST">ST</option>
	<option value="OBC">OBC</option>
	<option value="General">General</option>  
	
	
    </select></td>
  </tr>
  <tr class="pink">
    <td >Date of Birth </td>
   <td ><input type="text" name="date7" size=20 readonly="2"> <small><a href="javascript:showCal('Calendar7')">Select Date</a></small></td>
  </tr>
  <tr class="green">
    <td>Date of Joining as Investigator</td>
    <td ><input type="text" name="date1" size=20 readonly="2"> <small><a href="javascript:showCal('Calendar1')">Select Date</a></small></td>
  </tr>
  <tr class="pink">
    <td>Date of Joining as AD-II </td>
     <td ><input type="text" name="date2" size=20 readonly="2"> <small><a href="javascript:showCal('Calendar2')">Select Date</a></small></td>
  </tr>
  <tr class="green">
    <td>Date of Joining as AD-I</td>
    <td ><input type="text" name="date3" size=20 readonly="2"> <small><a href="javascript:showCal('Calendar3')">Select Date</a></small></td>
  </tr>
  <tr class="pink">
    <td>Date of Joining as Dy.Director </td>
    <td ><input type="text" name="date4" size=20 readonly="2"> <small><a href="javascript:showCal('Calendar4')">Select Date</a></small></td>
  </tr>
  <tr class="green">
    <td>Date of Joining as IA/AIA/Director </td>
   <td ><input type="text" name="date5" size=20 readonly="2"> <small><a href="javascript:showCal('Calendar5')">Select Date</a></small></td>
  </tr>
  <tr class="pink">
    <td>Batch Year </td>
    <td><input type="text" name="years" id="years" size="40" /></td>
  </tr>
  <tr class="green">
    <td>UPSC Office reference Number </td>
    <td><input type="text" name="reference" id="reference" size="40" /></td>
  </tr>
  <tr class="pink">
    <td>UPSC Office reference Number Date </td>
    <td ><input type="text" name="date6" size=20 readonly="2"> <small><a href="javascript:showCal('Calendar6')">Select Date</a></small></td>
  </tr>
</table>
<div align="center">
<input class="butt" type="submit" name="submit" value="Add" tabindex="16" />&nbsp;</div>
</form>
</body>
</html>
