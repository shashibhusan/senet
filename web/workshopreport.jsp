<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" %>
<%@page import="java.text.DecimalFormat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$('tr:nth-child(2n+1)').addClass('even');
});
</script>
    <head>
	<script type="text/javascript">
<!--
function PrintDate() {
  today = new Date();
  document.write('Date: ',today.getDate(),'/', today.getMonth()+1,'/',today.getYear());
}
//-->
</script>
<link href="css/stripes.css" rel="stylesheet" type="text/css" />
<style type="text/css">
td
{
color:black;
text-align:center;
} 
</style>
	<style type = "text/css">
.table_border{
border:solid #A9D0F5 2px;
}


.table_border_both_center{
border:solid #A9D0F5 1px;
padding-top:3px;
padding-bottom:3px;
font-family:Arial, Helvetica, sans-serif;
font-size:12px;
text-align:center;
}

.table_border_both_left{
border:solid #A9D0F5 1px;
padding-top:3px;
padding-bottom:3px;
font-family:Arial, Helvetica, sans-serif;
font-size:12px;
text-align:left;
}

.table_border_left{
border:solid #A9D0F5 1px;
padding-top:3px;
padding-bottom:3px;
padding-left:3px;
font-family:Arial, Helvetica, sans-serif;
font-size:12px;
text-align:left;
}
 
.table_border_both{
border:solid #A9D0F5 1px;
padding-top:3px;
padding-bottom:3px;
padding-left:3px;
font-family:Arial, Helvetica, sans-serif;
font-size:10px;

}
.table_border_both1{
border:solid #A9D0F5 1px;
padding-top:3px;
padding-bottom:3px;
padding-left:3px;
font-family:Arial, Helvetica, sans-serif;
font-size:12px;
text-align:center;
}

</STYLE>

</head>


<body bgcolor="gainsboro">
	 <%

	String years =request.getParameter("cmbYear");
	String months = request.getParameter("cmbMonth");
	
	int buttonFlag=0;
	ResultSet rsAdminResult = null;
		Connection con = null;
	     //Statement stmt = null;
		  CallableStatement stmt = null;
		// String userDate=months+"-"+years;
		DecimalFormat df = new DecimalFormat("##.## ");

		
	     con = ConnectionManager.getConnectionDirectForMySQL();
	     //stmt = (Statement)con.createStatement();
			Statement stmt4 = (Statement)con.createStatement();
				String sql = "call proc_workshop_mpr (?,?)";
				System.out.println(sql);
				stmt = (CallableStatement) con.prepareCall(sql);

				stmt.setString(1, months);
				stmt.setString(2, years);
rsAdminResult = stmt.executeQuery();

	/*if(rsAdminResult.next()){
		System.out.println("Result Set have record");
	}
	else{
	System.out.println(" Result Set have not record");
	buttonFlag=1;
	}	
	
*/

%>

<%if (buttonFlag==1){
%>	
<h1 align="center">No Record Found</h1>

<%
}else
{
%>
<%

String strsql2="select * from tbl_month where months='"+months+"'" ;
System.out.println("record have found");
System.out.println("months" +strsql2);
ResultSet rs_month=stmt4.executeQuery(strsql2);
if(rs_month.next())
{
System.out.println("months" +strsql2);
String mon = rs_month.getString("mon");
System.out.println("months" +mon);
}
%>
<h3 align="center">Workshop Programmes of MSME-DIs up to the Months  <%=rs_month.getString("mon")%> ,<%=years%></h3>
<table width="100%" border="2" align="center" bordercolor="#990000">
  <tr>
    <td width="36" class="table_border_both"><div align="center">S.No</div></td>
    <td width="106" class="table_border_both"><div align="center">Institute</div></td>
    <td width="78" class="table_border_both"><div align="center">W/S Target</div></td>
    <td width="76" class="table_border_both"><div align="center">C/F W/S Rev.Earning (cum) </div></td>
    <td width="66" class="table_border_both"><div align="center">% age</div></td>
    <td width="98" class="table_border_both"><div align="center">No. Of unit benefitted through Workshop </div></td>
    <td width="86" class="table_border_both"><div align="center">No. Of jobs underTaken</div></td>
    <td width="155" class="table_border_both"><div align="center">No. Of Trainees Trained in workshop programmes</div></td>
    <td width="187" class="table_border_both"><div align="center">No. Of units Registered under single point Registration</div></td>
    <td width="129" class="table_border_both"><div align="center">Capacity Assessment</div></td>
  </tr>
  	      <% for(int icnt=1;rsAdminResult.next();icnt++)
{
%>

  <tr>
    <td class="table_border_both"><div align="center"><%=icnt%></div></td>
    <td class="table_border_both"><div align="center"><%=rsAdminResult.getString("INST_CITY")%></div></td>
    <td class="table_border_both"><div align="center"><%=rsAdminResult.getString("workshop")%></div></td>
    <td class="table_border_both"><div align="center"><%=rsAdminResult.getString("Common_total")%></div></td>
    <td class="table_border_both"><div align="center"><%= df.format(rsAdminResult.getDouble("Common_total")*100/rsAdminResult.getDouble("workshop"))%></div></td>
    <td class="table_border_both"><div align="center"><%=rsAdminResult.getString("No_Of_unit_benefitted")%></div></td>
    <td class="table_border_both"><div align="center"><%=rsAdminResult.getString("No_jobs_underTaken")%></div></td>
    <td class="table_border_both"><div align="center"><%=rsAdminResult.getString("No_Trainees_Trained")%></div></td>
    <td class="table_border_both"><div align="center"><%=rsAdminResult.getString("No_units_Registered")%></div></td>
    <td class="table_border_both"><div align="center"><%=rsAdminResult.getString("Capacity_Assessment")%></div></td>
  </tr>
  <tr>

  <% }%>
</table>
  <% }%>
  <center><form><input type="button" value=" Print"
onclick="window.print();return false;" /></form></center>
</body>
</html>
