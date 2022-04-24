<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="stat.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>Search Tool Room</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<body>
 
 

<FORM name="frmMain"  method="post" action="report.jsp" > 


<br>
<h3 align="center" ><font  color="#990033">Report on the Basis of  Year</font></h3>
		

<table BORDER="0" align="center"  bgcolor=""  bordercolordark="#0000FF" width="40%">
<tr>		
<td>
<br>

<table align="center">
<tr>
 <td>
      <strong>&nbsp;&nbsp;Year
      &nbsp;&nbsp;&nbsp;</strong></td><td>
      <select name="cmbYear" id="cmbYear" style="width: 120px">
      <option value="2010">2010</option>
        <option value="2011">2011</option>
        <option value="2012">2012</option>
        <option value="2013">2013</option>
        <option value="2014">2014</option>
        <option value="2015">2015</option>
        <option value="2016">2016</option>
        <option value="2017">2017</option>
        <option value="2018">2018</option>
        <option value="2019">2019</option>
        <option value="2020">2020</option>
        </select>
	  </td>
  </tr>
  
  <tr align="center">
  	      <input  type="hidden" name="mnm" value="shashi"/>
  <td colspan="4" >
  <br/>
    <input type="submit" name="submitHTML" value="Generate" onclick="formSubmitHTML()"/>
  </td>
</tr>
</table>

<br>
</td>
</tr>
</table>

</form>
</body>
</html>
