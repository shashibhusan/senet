<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="a.html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Search Tool Room</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
body {
	background:#D9E6FE;
}
-->
</style>
<body>

<script type="text/javascript">
<!-- 
function formSubmitPDF() {
if(document.frmMain.cmbIns.value!="" && document.frmMain.cmbMonth.value!="" && document.frmMain.cmbYear.value!="" && document.frmMain.mnm.value!="") {
	document.frmMain.action="http://web5:81/dev60cgi/rwcgi60.exe?";
      } else {
			alert('Please selected the Criteria.......');
            document.frmMain.cmbIns.focus();
            return false;
      }

}
function formSubmitHTML()
{
if(document.frmMain.cmbIns.value!="" && document.frmMain.cmbMonth.value!="" && document.frmMain.cmbYear.value!="" && document.frmMain.mnm.value!="") {
	document.frmMain.action="groupwise.jsp";
      } else {
			alert('Please selected the Criteria.......');
            document.frmMain.cmbIns.focus();
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
<FORM name="frmMain"  method="post" action="groupwise.jsp" > 

<% //} %>


<INPUT type=hidden value=server%3DRep60_WEB6+report%3DD%3A%5Cmsmeab%2ERDF+userid%3Dsenet%2Fsenet%40livedb1+destype%3Dcache+desformat%3DPDF name=hidden_run_parameters>
<br>
<h2 align="center" ><font  color="#800000"> Acr Detail on the Basis of Designation </font></h2>
<!-- <form name="frmMain" method="post" onSubmit="return fnSubmit()"> -->
	

<table  BORDER="1" align="center"  bgcolor=""  bordercolordark="#0000FF">
<tr>		
<td>
<br>
<table>
<tr>
<td><p><strong>&nbsp;&nbsp;Designation</strong></td>
<td>
  <select name="designation" id="designation">
<%

try{
  Connection conn = ConnectionManager.getConnectionDirectForMySQL();
			if(conn != null){
				Statement stmt = conn.createStatement();
				
				String strSql = "select distinct Designation  from tbl_acr where Designation LIKE 'INV%'  order by name";

				ResultSet resultSet = stmt.executeQuery(strSql);

				
				while(resultSet.next()){
%>
<option value='<%=resultSet.getString("Designation")%>'><%=resultSet.getString("Designation")%></option>
<%}}}
catch(SQLException e){
			//e.printStackTrace();
			System.out.println(e.getErrorCode()+" = "+e.getMessage());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println(e.getMessage());
		}
		%>
  </select>
  </td>
  
 
  
 
	 <!-- <TR><td>
      <strong>&nbsp;&nbsp;Date</strong>
	  </td> 
	    <td><input type="text" size="16" name="txtDATE" /></td>
	  </TR>
  -->
  <tr>
  <td colspan="2" height="25px" valign="bottom">
      <center>
	      <input  type="hidden" name="mnm" value='<%=request.getParameter("mnm1")%>'/>
    <input type="submit" name="submitHTML" value="Generate" onclick="formSubmitHTML()"/>
	<!-- <input type="submit" name="submitPDF" value="Generate To PDF" onclick="formSubmitPDF()" /> -->
</center>
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
