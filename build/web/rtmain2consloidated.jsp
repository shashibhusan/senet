<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="a.html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<title>Court Cases Details</title>
<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
<script src="JS/jquery.autocomplete.js"></script>
<script type="text/javascript" src="jquery-1.11.3.js"></script>
<script>
	$(function() {
	var d = new Date(),

    n = d.getMonth(),

    y = d.getFullYear();
    var mm=(n-3);


$('#cmbMonth option:eq('+mm+')').prop('selected', true);

$('#cmbYear option[value="'+y+'"]').prop('selected', true);
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
     response.sendRedirect("/toolroom1/stat.jsp");
}

 %>
<form name="frmMain"  method="post" action="report2.jsp" >

<INPUT type=hidden value=server%3DRep60_WEB6+report%3DD%3A%5Cmsmeab%2ERDF+userid%3Dsenet%2Fsenet%40ssi17+destype%3Dcache+desformat%3DPDF name=hidden_run_parameters>
<br/>
 
<h3 align="center" ><font  color="#990033">Courtwise list of Court cases</font></h3>

<table BORDER="1" align="center"  bgcolor=""  bordercolordark="#990000" width="40%">
<tr>		
<td>
<br/>

<table width="230" align="center">


 <tr>
     <td width="100" align="center"><font color="#990000">Type of Court</font> </td>
      <td colspan="2" align="left">
	 <select name="nature_of_court" id="nature_of_court" style="width:120px"  >
		<option value="Supreme Court">Supreme Court</option>
		<option value="High Court">High Court</option>
		<option value="CAT">CAT</option>
		<option value="Others">Others</option>
		</select>	  </td>
 </tr>
 <tr>
     <td width="100" align="center"><font color="#990000">Year of case</font></td>
      <td>
      <select name="cmbYear" id="cmbYear" style="width: 120px" class="input_text">
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

  	        <input  type="hidden" name="mnm" value="<%=mnm%>"/>
   
</tr>
  <tr>
      <td>&nbsp;&nbsp;</td>
      <td>
          <br/>
           <input type="submit" name="submitHTML" value="Generate Report" onclick="formSubmitHTML()"/>
      </td>
  </tr>
 
</table>

<br/>
</td>
</tr>
</table>
</form>
</body>
</html>
