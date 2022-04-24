<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="a.html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Search Tool Room</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<body bgcolor="#CADDE4">



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
<FORM name="frmMain"  method="post" action="report1.jsp"> 

<% //} %>


<INPUT type=hidden value=server%3DRep60_WEB6+report%3DD%3A%5Cmsmeab%2ERDF+userid%3Dsenet%2Fsenet%40livedb1+destype%3Dcache+desformat%3DPDF name=hidden_run_parameters>
<br>
<h2 align="center" ><font  color="#000099"><i>Court Cases Detail of Indiviual Insitute</i></font></h2>
<!-- <form name="frmMain" method="post" onSubmit="return fnSubmit()"> -->
		

<table  BORDER="1" align="center"  bgcolor=""  bordercolordark="#990000">
<tr>		
<td>
<br>
<table>
<tr>
<td><p><strong>&nbsp;&nbsp;<font color="#990000">Institute</font></strong></td>
<td>
  <select name="cmbIns" id="cmbIns">
<%

try{
  Connection conn = ConnectionManager.getConnectionDirectForMySQL();
			if(conn != null){
				Statement stmt = conn.createStatement();
				String intid=request.getParameter("instId");
				System.out.println(intid);
				String userSql=null;
				if(request.getParameter("role").equalsIgnoreCase("SU")){
					userSql="select INST_ID,INST_NAME from tbl_DI_institute";
				}
				else{
				userSql="select INST_ID,INST_NAME from tbl_DI_institute where INST_ID='"+intid+"'";
				System.out.println(userSql);
				}
				
				ResultSet resultSet = stmt.executeQuery(userSql);
				//String cmbIns = resultSet.getString("INST_ID");
				while(resultSet.next()){
%>
<option value='<%=resultSet.getString("INST_ID")%>'><%=resultSet.getString("INST_NAME")%></option>
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
  </tr>
  <tr>
 <tr>
  <td>
      <strong>&nbsp;&nbsp;<font color="#990033">Year</font>
      &nbsp;&nbsp;&nbsp;</strong></td><td>
      <select name="cmbYear" id="cmbYear" style="width: 160px">
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
