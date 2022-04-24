<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="a.html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<title>Court cases Details</title>
<script type="text/javascript" src="jquery-1.11.3.js"></script>
<script>
	$(function() {
	var d = new Date(),

    n = d.getMonth(),

    y = d.getFullYear();
    var mm=(n-3);
	var x=y+1;
	z=y+("-")+x;

$('#cmbMonth option:eq('+mm+')').prop('selected', true);

$('#cmbYear option[value="'+z+'"]').prop('selected', true);
	});
</script>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
<body >

<% String Random5=(String)session.getAttribute("Random5");
String mnm = request.getParameter("mnm");
if(Random5.equals(mnm))
{

  String intid=(String)session.getAttribute("ins");
  if(intid!=null && intid!=""  ){
			} else
			{response.sendRedirect("stat.jsp");
			%>
			
			<% }
		
		%>
		<% } else {
     response.sendRedirect("stat.jsp");
}

 %>
<form name="frmMain"  method="post" action="DIreport.jsp" >




<INPUT type=hidden value=server%3DRep60_WEB6+report%3DD%3A%5Cmsmeab%2ERDF+userid%3Dsenet%2Fsenet%40ssi17+destype%3Dcache+desformat%3DPDF name=hidden_run_parameters>
<br/>

<h3 align="center" ><font color="#990033">Report on the basis Institute Category</font></h3>
<table BORDER="1" align="center"    bordercolordark="#990000" width="51%">
    <tr>
        <td>
   <table   align="center" width="62%">
  <tr>
  <td width="45%"><font color="#990000">Type of Institute&nbsp;&nbsp;</font></td>
  <td width="30%">
      <select name="type_of_inst" id="type_of_inst" style="width: 120px">
        <option value="MSME-DI">MSME-DI</option>
        <option value="TC-">MSME-TC</option>
        <option value="TI-">MSME-TI</option>
        <option value="TS-">MSME-TS</option>
        <option value="TDCHT">MSME-TDCHT</option>
</select></td>
  </tr><tr>
      <td width="36%" align="center">
     <font color="#990000">Year</font></td>
  <td>
      <select name="cmbYear" id="cmbYear" style="width:120px">
        <option value="2013-2014">2013-2014</option>
        <option value="2014-2015">2014-2015</option>
        <option value="2015-2016">2015-2016</option>
        <option value="2016-2017">2016-2017</option>
        <option value="2017-2018">2017-2018</option>
        <option value="2018-2019">2018-2019</option>
        <option value="2019-2020">2019-2020</option>
      </select>
	  </td>
  </tr>

  <tr>
  	        <input  type="hidden" name="mnm" value="<%=mnm%>"/>
                <td></td>
  <td height="47" colspan="4" align="center">
  <br/>
    <input type="submit" name="submitHTML" value="Generate Report" onclick="formSubmitHTML()"/>
  </td>
</tr>
</table>
        </td>
    </tr>
</table>

</form>
</body>
</html>
