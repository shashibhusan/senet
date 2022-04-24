<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>Untitled Document</title>
<style type="text/css"><!--
.pink {FONT-FAMILY: Times New Roman,Times; BACKGROUND: #80BEF3;color:#FFFFFF}
.green {FONT-FAMILY: Times New Roman,Times; BACKGROUND: #A4C9CE}
.blue {FONT-FAMILY: Times New Roman,Times; BACKGROUND:#C5D6FC}
.yellow {FONT-FAMILY: Times New Roman,Times; BACKGROUND:#DFDAE7}
--></style>
</head>

<body bgcolor="#FFFFCC">
	 <%

	String years =request.getParameter("cmbYear");
	String cmbIns = request.getParameter("cmbIns");
	System.out.println("ghghhhhhhhhhhhh"+cmbIns);
	System.out.println("ghghhhhhhhhhhhh"+years);
	//String years ="2010";
	//String months = "APRIL";
	int buttonFlag=0;
	ResultSet rsAdminResult = null;
		Connection con = null;
	     //Statement stmt = null;
		// String userDate=months+"-"+years;
		
		CallableStatement stmt = null;
	     con = ConnectionManager.getConnectionDirectForMySQL();
	    // stmt = (Statement)con.createStatement();

String sql = "call msme_didi_cas (?,?)";
				System.out.println(sql);
				stmt = con.prepareCall(sql);
				
				stmt.setString(1, years);
				stmt.setString(2, cmbIns);
				
rsAdminResult = stmt.executeQuery();
System.out.println();

	


%>




<center><h3>List of cases to be filed in the <%=years%>  </h3></center>
<table id="MainTbl" align="center" border=1 width="74%"  bordercolor="#990066" cellpadding="5" cellspacing="0" style="border-collapse: collapse">
     <tr class="blue" >
    <td width="33">S.No</td>
	<td width="57">Nature of Court</td>
    <td width="80">Detail of Case</td>
	<td width="80">cases related to</td>
    <td width="107">Stakes involved</td>
    <td width="128">Status of Stay,if any</td>
    <td width="110">Detail of applications</td>
    <td width="118">Present Status of the case</td>
    <td width="90">Controlling Officers</td>
	<td width="80">Year of case</td>
	
  </tr>
      <% for(int icnt=1;rsAdminResult.next();icnt++)
{
%>
  <tr class="yellow">
    <td><%=icnt%></td>
    <td><%=rsAdminResult.getString("nature_of_court")%></td>
	<td width="80"><%=rsAdminResult.getString("cases_related_to")%></td>
    <td><%=rsAdminResult.getString("Detail_of_case")%></td>
    <td><%=rsAdminResult.getString("stakes_involved")%></td>
    <td><%=rsAdminResult.getString("status")%></td>
	<td><%=rsAdminResult.getString("Detail_of_application")%></td>
    <td><%=rsAdminResult.getString("Present_status_of_the_case")%></td>
    <td><%=rsAdminResult.getString("Controlling_Officers")%></td>
	<td><%=rsAdminResult.getString("year_of_case")%></td>
	
  <% }%>
  
</table>
  
</body>
 <div align="center">
  <input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
  </div>
</html>
