<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="a.html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>Search Tool Room</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
<script src="JS/jquery.autocomplete.js"></script>
	
</head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<body bgcolor="#CADDE4">

<script type="text/javascript">
<!-- 
function formSubmitPDF() {
if(document.frmMain.cmbIns.value!="" && document.frmMain.cmbMonth.value!="" && document.frmMain.cmbYear.value!="" && document.frmMain.mnm.value!="") {
	document.frmMain.action="http://164.100.44.167:81/dev60cgi/rwcgi60.exe?";
      } else {
			alert('Please selected the Criteria.......');
            document.frmMain.cmbIns.focus();
            return false;
      }

}
function formSubmitHTML()
{
if(document.frmMain.cmbMonth.value!="" && document.frmMain.cmbYear.value!="" && document.frmMain.mnm.value!="") {
	document.frmMain.action="report2.jsp";
      } else {
			alert('Please selected the Criteria.......');
            document.frmMain.cmbMonth.focus();
            return false;
      }
	
}

//-->
</script>

<!-- <FORM name="frmMain" action="http://web6/dev60cgi/rwcgi60.exe?" method="get" onSubmit="return fnSubmit()"> -->
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
<FORM name="frmMain"  method="post" action="report2.jsp" > 

<% //} %>


<INPUT type=hidden value=server%3DRep60_WEB6+report%3DD%3A%5Cmsmeab%2ERDF+userid%3Dsenet%2Fsenet%40ssi17+destype%3Dcache+desformat%3DPDF name=hidden_run_parameters>
<br>
<h2 align="center" ><i>List of Court cases on the basis of Court priority </i></h2>
<!-- <form name="frmMain" method="post" onSubmit="return fnSubmit()"> -->
		

<table BORDER="1" align="center"  bgcolor=""  bordercolordark="#990000" width="52%">
<tr>		
<td>
<br>

<table width="578" align="center">


 <tr>
 <td width="128" align="left"><font color="#990000">Type of Court</font> </td>
      <td colspan="2" align="left">
	  <input type="text" id="nature_of_court" name="nature_of_court" class="input_text"/>
      <script>
	jQuery(function(){
		$("#nature_of_court").autocomplete("list.jsp");
	});
</script>	  </td>


      <td width="34"><font color="#990000">Year</font>      </td>
      <td width="122">
      <select name="cmbYear" id="cmbYear" style="width: 120px" class="input_text">
       
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

  	      <input  type="hidden" name="mnm" value='<%=request.getParameter("mnm1")%>'/>
  <td width="110" colspan="4" >
  
    <input type="submit" name="submitHTML" value="Generate Report" onclick="formSubmitHTML()"/>
  </td>
</tr>
</table>

<br>
</td>
</tr>
</table>
<h4 align="center">Type only first charcter..</h4>
</form>
</body>
</html>
