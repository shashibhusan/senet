<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="a.html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Search Tool Room</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<body bgcolor="#CADDE4">

<%
/*	
	String strClientIP = request.getRemoteAddr();
	String strURL = request.getServerName();
	System.out.println("Client IP =" + strClientIP);
	String strCatIP = strClientIP.substring(0,7);
	String strLogin = "";
	System.out.println("Concatenated Client IP %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%^^^^^^^^^^^^^^=" +strCatIP);
	if(strCatIP.equalsIgnoreCase("10.2.0.") || strCatIP.equalsIgnoreCase("127.0.0."))//if the client is internal user
		{ 
*/		%>
<!-- <FORM name="frmMain"  method="post" onSubmit="#"> -->
<% /*}else { */%>
<!-- <FORM name="frmMain" action="http://164.100.44.167:81/dev60cgi/rwcgi60.exe?" method="get" onSubmit="return fnSubmit()"> -->
<FORM name="frmMain"  method="post" action="report.jsp" > 

<% //} %>


<INPUT type=hidden value=server%3DRep60_WEB6+report%3DD%3A%5Cmsmeab%2ERDF+userid%3Dsenet%2Fsenet%40ssi17+destype%3Dcache+desformat%3DPDF name=hidden_run_parameters>
<br>
<h2 align="center" ><font  color="#000099"><i>Report on the Basis of  Year </i>   </font></h2>
<!-- <form name="frmMain" method="post" onSubmit="return fnSubmit()"> -->
		

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
        <option value=""></option>
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
  	      <input  type="hidden" name="mnm" value='<%=request.getParameter("mnm1")%>'/>
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
