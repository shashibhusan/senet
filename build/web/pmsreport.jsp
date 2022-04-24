<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" %>
<%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>

<style type = "text/css">
.table_border{
border:solid #993300 2px;
}


.table_border_both_center{
border:solid #993300 1px;
padding-top:3px;
padding-bottom:3px;
font-family:Arial, Helvetica, sans-serif;
font-size:12px;
text-align:center;
}

.table_border_both_left{
border:solid #993300 1px;
padding-top:3px;
padding-bottom:3px;
font-family:Arial, Helvetica, sans-serif;
font-size:12px;
text-align:left;
}

.table_border_left{
border:solid #993300 1px;
padding-top:3px;
padding-bottom:3px;
padding-left:3px;
font-family:Arial, Helvetica, sans-serif;
font-size:12px;
text-align:left;
}
 
.table_border_both{
border:solid #993300 1px;
padding-top:3px;
padding-bottom:3px;
padding-left:3px;
font-family:Arial, Helvetica, sans-serif;
font-size:12px;

}
.table_border_both1{
border:solid #993300 1px;
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
				String sql = "call proc_pms_mpr (?,?)";
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
<h3 align="center">Monthly Progress Report of MSME-DIs up to the Months  <%=rs_month.getString("mon")%> </h3>

<table width="487" border="1" align="center">
  <tr>
    <td width="54" rowspan="2" class="table_border_both"><div align="center">S.No.</div>    
	<td width="54" rowspan="2" class="table_border_both"><div align="center">MSME-DI</div>    
    <td colspan="4" class="table_border_both"><div align="center">ESDP's/BSDP's/EDP's</div></td>
    <td colspan="4" class="table_border_both"><div align="center">MDP,s</div></td>
    <td colspan="3" class="table_border_both"><div align="center">ISO-9000/14000</div></td>
    <td colspan="2" class="table_border_both"><div align="center">Project</div></td>
    <td colspan="2" class="table_border_both"><div align="center">Revenue</div></td>
  </tr>
  <tr>
    <td width="50" class="table_border_both"><div align="center">Target</div></td>
    <td width="36" class="table_border_both"><div align="center">ESDP's/EDP's/BSDP's conducted </div></td>
    <td width="19" class="table_border_both"><div align="center">Person's Trained </div></td>
    <td width="19" class="table_border_both"><div align="center">Percentage (%)</div></td>
    <td width="19" class="table_border_both"><div align="center">Target</div></td>
    <td width="19" class="table_border_both"><div align="center">Person's Trained </div></td>
    <td width="19" class="table_border_both"><div align="center">MDP's conducted</div></td>
    <td width="19" class="table_border_both"><div align="center">Percentage (%)</div></td>
    <td width="19" class="table_border_both"><div align="center">No. of Application Recd. </div></td>
    <td width="19" class="table_border_both"><div align="center">No. of Application Disbursed. </div></td>
    <td width="19" class="table_border_both"><div align="center">Amount Disbursed  </div></td>
    <td width="19" class="table_border_both"><div align="center">Target</div></td>
    <td width="19" class="table_border_both"><div align="center">Prepared</div></td>
    <td width="19" class="table_border_both"><div align="center">Last Year </div></td>
    <td width="19" class="table_border_both"><div align="center">CurrentYear </div></td>
  </tr>
    <% for(int icnt=1;rsAdminResult.next();icnt++)
{
%>
  <tr> 
    <td class="table_border_both"><div align="center"><%=icnt%></div></td>
	<td class="table_border_both"><div align="center"><%=rsAdminResult.getString("INST_CITY")%></div></td>
    <td class="table_border_both"><div align="center"><%=(rsAdminResult.getInt("esdp")+rsAdminResult.getInt("edp")+rsAdminResult.getInt("bsdp"))%></div></td>
    <td class="table_border_both"><div align="center"><%=(rsAdminResult.getInt("esdp2")+rsAdminResult.getInt("edp2")+rsAdminResult.getInt("bsdp2"))%></div></td>
    <td class="table_border_both"><div align="center"><%=(rsAdminResult.getInt("esdp3")+rsAdminResult.getInt("edp3")+rsAdminResult.getInt("bsdp3"))%></div></td>
    <td class="table_border_both"><div align="center"><%=df.format((rsAdminResult.getDouble("esdp2")+rsAdminResult.getDouble("edp2")+rsAdminResult.getDouble("bsdp2"))*100/(rsAdminResult.getDouble("esdp")+rsAdminResult.getDouble("edp")+rsAdminResult.getDouble("bsdp")))%></div></td>
    <td class="table_border_both"><div align="center"><%=rsAdminResult.getString("mdp")%></div></td>
    <td class="table_border_both"><div align="center"><%=rsAdminResult.getString("mdp3")%></div></td>
    <td class="table_border_both"><div align="center"><%=rsAdminResult.getString("mdp2")%></div></td>
    <td class="table_border_both"><div align="center"><%=df.format(rsAdminResult.getDouble("mdp2")*100/rsAdminResult.getDouble("mdp"))%></div></td>
   <td class="table_border_both"><div align="center"><%=(rsAdminResult.getInt("GENERALappication_received_during_month")+rsAdminResult.getInt("NERappication_received_during_month")+rsAdminResult.getInt("SCPappication_received_during_month"))+rsAdminResult.getInt("TSPappication_received_during_month")%></div></td>
    <td class="table_border_both"><div align="center"><%=(rsAdminResult.getInt("GENERALappication_disburded_during_month")+rsAdminResult.getInt("NERappication_disburded_during_month")+rsAdminResult.getInt("SCPappication_disburded_during_month")+rsAdminResult.getInt("TSPappication_disburded_during_month"))%></div></td>
    <td class="table_border_both"><div align="center"><%=(rsAdminResult.getInt("GENERALamount_disburded_during_month")+rsAdminResult.getInt("NERamount_disburded_during_month")+rsAdminResult.getInt("SCPamount_disburded_during_month")+rsAdminResult.getInt("TSPamount_disburded_during_month"))%></div></td>
	 <td class="table_border_both"><div align="center"><%=(rsAdminResult.getInt("project_new")+rsAdminResult.getInt("project_updated"))%></div></td>
    <td class="table_border_both"><div align="center"><%=(rsAdminResult.getInt("Monthly_Achievment_new")+rsAdminResult.getInt("Monthly_Achievment_updated"))%></div></td>
    <td class="table_border_both"><div align="center">0</div></td>
    <td class="table_border_both"><div align="center"><%=rsAdminResult.getString("total")%></div></td>

 </tr>
  <% }%>
</table>
  <% }%>
<div align="center"></div>
<p>&nbsp;</p>
<center><form><input type="button" value=" Print"
onclick="window.print();return false;" /></form></center>
</body>
</html>
