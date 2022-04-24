<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" %>
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
font-size:11px;
background-color:#D8F8FE;
color:#990000

}
.table_border_both1{
border:solid #993300 1px;
padding-top:3px;
padding-bottom:3px;
padding-left:3px;
font-family:Arial, Helvetica, sans-serif;
font-size:12px;
text-align:center;
background-color:#000000;
color:#FFFFFF
}
.table_border_both2{
border:solid #993300 1px;
padding-top:3px;
padding-bottom:3px;
padding-left:3px;
font-family:Arial, Helvetica, sans-serif;
font-size:12px;
text-align:center;
background-color:#000000;
color:#FFFFFF
}
</STYLE>
</head>

<body>

	 <%
	String InstId =request.getParameter("cmbIns");
	String years =request.getParameter("cmbYear");
	String months = request.getParameter("cmbMonth");
	
	if(InstId.equals("I31"))
	{
	//String years ="2010";
	//String months = "APRIL";
	int buttonFlag=0;
	ResultSet rsAdminResult = null;
		Connection con = null;
	     Statement stmt = null;
		// String userDate=months+"-"+years;
		
		
	     con = ConnectionManager.getConnectionDirectForMySQL();
	     stmt = (Statement)con.createStatement();
		 Statement stmt4 = (Statement)con.createStatement();

String strSql = "SELECT  fund_release_mda, target_release_mda, Exp_mda, MSEs_mda, Cumm_exp_mda, Cumm_MSEs_mda, fund_release_nmcp, target_release_nmcp, Exp_nmcp, MSEs_nmcp, Cumm_exp_nmcp, Cumm_MSEs_nmcp, fund_release_nmcp_seminar, target_release_nmcp_seminar, Exp_nmcp_seminar, MSEs_nmcp_seminar, Cumm_exp_nmcp_seminar, Cumm_MSEs_nmcp_seminar,INST_CITY FROM tbl_ssi_mda INNER JOIN tbl_di_institute ON tbl_ssi_mda.inst_id=tbl_di_institute.INST_ID where year="+years+" and months='"+months+"'";
System.out.println(strSql);
rsAdminResult = stmt.executeQuery(strSql);

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
<h3 align="center"><font color="#990033">Monthly Progress Report of MSME Barcode up to the Month   <%=rs_month.getString("mon")%></font></h3>
<br />
<table width="953" border="1">
  <tr>
    <td colspan="7"><div align="center" class="table_border_both2"><font color="#F9F7CA">SSI-MDA (one-time Registration fee)</font></div></td>
    <td colspan="6"><div align="center" class="table_border_both2"><font color="#F9F7CA">NMCP Scheme (Annual recurring fee)</font></div></td>
    <td colspan="6"><div align="center" class="table_border_both2"><font color="#F9F7CA">NMCP Scheme (seminars)</font></div></td>
  </tr>
  <tr >
    <td width="50" rowspan="2" class="table_border_both2">Institute Name </td>
    <td width="49" rowspan="2" class="table_border_both2"><div align="center">Funds Release</div></td>
    <td width="50"><div align="center" class="table_border_both2">Targets (MSEs)</div></td>
    <td colspan="2"><div align="center" class="table_border_both2">MPR for <%=rs_month.getString("mon")%></div></td>
    <td colspan="2"><div align="center" class="table_border_both2">MPR up to <%=rs_month.getString("mon")%></div></td>
    <td width="44" rowspan="2" class="table_border_both2"><div align="center">Funds release</div></td>
    <td width="49" rowspan="2" class="table_border_both2"><div align="center">Targets (MSEs)</div></td>
    <td colspan="2" class="table_border_both2"><div align="center">MPR for <%=rs_month.getString("mon")%></div>
    <div align="center">.</div></td>
    <td colspan="2" class="table_border_both2">MPR up to <%=rs_month.getString("mon")%></td>
    <td width="44" rowspan="2" class="table_border_both2"><div align="center">Funds release</div></td>
    <td width="49" rowspan="2" class="table_border_both2"><div align="center">Targets (MSEs)</div></td>
    <td colspan="2" class="table_border_both2"><div align="center">MPR for <%=rs_month.getString("mon")%></div></td>
    <td colspan="2" class="table_border_both2">MPR up to <%=rs_month.getString("mon")%></td>
  </tr>
  <tr >
    <td class="table_border_both2">&nbsp;</td>
    <td width="24" class="table_border_both2">Exp</td>
    <td width="37" class="table_border_both2"><div align="center">MSEs</div></td>
    <td width="48" class="table_border_both2"><div align="center">Cumm. Exp.</div></td>
    <td width="48" class="table_border_both2"><div align="center">Cumm. MSEs.</div></td>
    <td width="24" class="table_border_both2">Exp</td>
    <td width="42" class="table_border_both2" >No.of Cases of MSEs</td>
    <td width="48"class="table_border_both2"><div align="center">Cumm. No.of Cases of MSEs.</div></td>
    <td width="48" class="table_border_both2"><div align="center">Cumm. No.of Cases of MSEs.</div></td>
    <td width="27" class="table_border_both2"><div align="center">Exp.</div></td>
    <td width="50" class="table_border_both2"><div align="center">Seminar</div></td>
    <td width="48" class="table_border_both2"><div align="center">Cumm. Exp.</div></td>
    <td width="56" class="table_border_both2"><div align="center">Total Seminars</div></td>
  </tr>
       <% for(int icnt=1;rsAdminResult.next();icnt++)
{
%>

  <tr >
      <td align="left" class="table_border_both"><%=rsAdminResult.getString("INST_CITY")%></td>
  <td align="center" class="table_border_both"><%=rsAdminResult.getString("fund_release_mda")%></td>
    <td align="center" class="table_border_both"><%=rsAdminResult.getString("target_release_mda")%></td>
    <td align="center" class="table_border_both"><%=rsAdminResult.getString("Exp_mda")%></td>
    <td align="center" class="table_border_both"><%=rsAdminResult.getString("MSEs_mda")%></td>
    <td align="center" class="table_border_both"><%=rsAdminResult.getString("Cumm_exp_mda")%></td>
    <td align="center" class="table_border_both"><%=rsAdminResult.getString("Cumm_MSEs_mda")%></td>
    <td align="center" class="table_border_both"><%=rsAdminResult.getString("fund_release_nmcp")%></td>
   <td align="center" class="table_border_both"><%=rsAdminResult.getString("target_release_nmcp")%></td>
   <td align="center" class="table_border_both"><%=rsAdminResult.getString("Exp_nmcp")%></td>
  <td align="center" class="table_border_both"><%=rsAdminResult.getString("MSEs_nmcp")%></td>
    <td align="center" class="table_border_both"><%=rsAdminResult.getString("Cumm_exp_nmcp")%></td>
    <td align="center" class="table_border_both"><%=rsAdminResult.getString("Cumm_MSEs_nmcp")%></td>
    <td align="center" class="table_border_both"><%=rsAdminResult.getString("fund_release_nmcp_seminar")%></td>
    <td align="center" class="table_border_both"><%=rsAdminResult.getString("target_release_nmcp_seminar")%></td>
    <td align="center" class="table_border_both"><%=rsAdminResult.getString("Exp_nmcp_seminar")%></td>
   <td align="center" class="table_border_both"><%=rsAdminResult.getString("MSEs_nmcp_seminar")%></td>
    <td align="center" class="table_border_both"><%=rsAdminResult.getString("Cumm_exp_nmcp_seminar")%></td>
  <td align="center" class="table_border_both"><%=rsAdminResult.getString("Cumm_MSEs_nmcp_seminar")%></td>
  </tr>
  <% }%>
   </tr>
  <% String strSql1 = "SELECT months,year,sum(fund_release_mda),sum(target_release_mda),sum(Exp_mda),sum(MSEs_mda),sum(Cumm_exp_mda),sum(Cumm_MSEs_mda),sum(fund_release_nmcp),sum(target_release_nmcp),sum(Exp_nmcp),sum(MSEs_nmcp),sum(Cumm_exp_nmcp),sum(Cumm_MSEs_nmcp),sum(Cumm_MSEs_nmcp_seminar),sum(Cumm_exp_nmcp_seminar),sum(MSEs_nmcp_seminar),sum(Exp_nmcp_seminar),sum(target_release_nmcp_seminar),sum(fund_release_nmcp_seminar) FROM tbl_ssi_mda group by months,year  having year="+years+" and months='"+months+"' ";
ResultSet rsAdminResult1 = stmt.executeQuery(strSql1);

        for(int icnt=1;rsAdminResult1.next();icnt++)
{
%>



  <tr class="yellow">
    <td align="center"  class="table_border_both1"><STRONG>Total</STRONG></td>
   <td align="center" class="table_border_both1" ><%=rsAdminResult1.getString("sum(fund_release_mda)")%></td>
    <td align="center" class="table_border_both1"><%=rsAdminResult1.getString("sum(target_release_mda)")%></td>
    <td align="center" class="table_border_both1"><%=rsAdminResult1.getString("sum(Exp_mda)")%></td>
    <td align="center" class="table_border_both1"><%=rsAdminResult1.getString("sum(MSEs_mda)")%></td>
    <td align="center" class="table_border_both1"><%=rsAdminResult1.getString("sum(Cumm_exp_mda)")%></td>
    <td align="center" class="table_border_both1"><%=rsAdminResult1.getString("sum(Cumm_MSEs_mda)")%></td>
    <td align="center" class="table_border_both1"><%=rsAdminResult1.getString("sum(fund_release_nmcp)")%></td>
    <td align="center" class="table_border_both1"><%=rsAdminResult1.getString("sum(target_release_nmcp)")%></td>
    <td align="center" class="table_border_both1"><%=rsAdminResult1.getString("sum(Exp_nmcp)")%></td>
   <td align="center" class="table_border_both1"><%=rsAdminResult1.getString("sum(MSEs_nmcp)")%></td>
    <td align="center" class="table_border_both1"><%=rsAdminResult1.getString("sum(Cumm_exp_nmcp)")%></td>
    <td align="center"class="table_border_both1"><%=rsAdminResult1.getString("sum(Cumm_MSEs_nmcp)")%></td>
    <td align="center"class="table_border_both1"><%=rsAdminResult1.getString("sum(fund_release_nmcp_seminar)")%></td>
    <td align="center"class="table_border_both1"><%=rsAdminResult1.getString("sum(target_release_nmcp_seminar)")%></td>
    <td align="center"class="table_border_both1"><%=rsAdminResult1.getString("sum(Exp_nmcp_seminar)")%></td>
    <td align="center"class="table_border_both1"><%=rsAdminResult1.getString("sum(MSEs_nmcp_seminar)")%></td>
    <td align="center"class="table_border_both1"><%=rsAdminResult1.getString("sum(Cumm_exp_nmcp_seminar)")%></td>
    <td align="center"class="table_border_both1"><%=rsAdminResult1.getString("sum(Cumm_MSEs_nmcp_seminar)")%></td>
  </tr>
  </B>
  <% }%>
</table>


  <% }%>
 <div align="center"><input name="button2" type="button" onClick="window.print();return false;" value=" Print" /></div>
<% } else {%>
<%
//String years ="2010";
	//String months = "APRIL";
	int buttonFlag=0;
	ResultSet rsAdminResult = null;
		Connection con = null;
	     Statement stmt = null;
		// String userDate=months+"-"+years;
		
		
	     con = ConnectionManager.getConnectionDirectForMySQL();
	     stmt = (Statement)con.createStatement();
		Statement stmt4 = (Statement)con.createStatement();
String strSql = "SELECT  fund_release_mda, target_release_mda, Exp_mda, MSEs_mda, Cumm_exp_mda, Cumm_MSEs_mda, fund_release_nmcp, target_release_nmcp, Exp_nmcp, MSEs_nmcp, Cumm_exp_nmcp, Cumm_MSEs_nmcp, fund_release_nmcp_seminar, target_release_nmcp_seminar, Exp_nmcp_seminar, MSEs_nmcp_seminar, Cumm_exp_nmcp_seminar, Cumm_MSEs_nmcp_seminar,INST_CITY FROM tbl_ssi_mda INNER JOIN tbl_di_institute ON tbl_ssi_mda.inst_id=tbl_di_institute.INST_ID where year="+years+" and months='"+months+"'and tbl_di_institute.inst_id='"+InstId+"' ";
System.out.println(strSql);
rsAdminResult = stmt.executeQuery(strSql);

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

String strsql1="select * from TBL_DI_INSTITUTE where inst_id='"+InstId+"'" ;
System.out.println("record have found");
System.out.println("instId" +strsql1);
ResultSet rs_instName=stmt4.executeQuery(strsql1);
if(rs_instName.next())
{
System.out.println("instId" +strsql1);
String inst_name = rs_instName.getString("INST_NAME");
System.out.println("inst_name" +inst_name);
}
%>

<table align="center">
<tr><td align="center" ><STRONG>Monthly Progress Report  of <%=rs_instName.getString("INST_NAME")%></strong></td></tr>
<br>
<br>
<br>
</table>
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


<table width="100%" border="1">
  <tr>
    <td colspan="7"><div align="center" class="table_border_both"><font color="#990000">SSI-MDA (one-time Registration fee)</font></div></td>
    <td colspan="6"><div align="center" class="table_border_both"><font color="#990000">NMCP Scheme (Annual recurring fee)</font></div></td>
    <td colspan="6"><div align="center" class="table_border_both"><font color="#990000">NMCP Scheme (seminars)</font></div></td>
  </tr>
  <tr >
    <td width="51" rowspan="2" class="table_border_both">Institute Name </td>
    <td width="47" rowspan="2"class="table_border_both"><div align="center">Funds Release</div></td>
    <td width="49" rowspan="2"class="table_border_both"><div align="center">Targets (MSEs)</div></td>
    <td colspan="2"class="table_border_both"><div align="center">MPR for <%=rs_month.getString("mon")%></div></td>
    <td colspan="2"class="table_border_both"><div align="center">MPR up to <%=rs_month.getString("mon")%></div></td>
    <td width="42" rowspan="2"class="table_border_both"><div align="center">Funds release</div></td>
    <td width="49" rowspan="2"class="table_border_both"><div align="center">Targets (MSEs)</div></td>
    <td colspan="2"class="table_border_both"><div align="center">MPR for <%=rs_month.getString("mon")%></div>
    <div align="center">.</div></td>
    <td colspan="2"class="table_border_both">MPR up to <%=rs_month.getString("mon")%></td>
    <td width="42" rowspan="2"class="table_border_both"><div align="center">Funds release</div></td>
    <td width="49" rowspan="2"class="table_border_both"><div align="center">Targets (MSEs)</div></td>
    <td colspan="2"class="table_border_both"><div align="center">MPR for <%=rs_month.getString("mon")%></div></td>
    <td colspan="2"class="table_border_both">MPR up to <%=rs_month.getString("mon")%></td>
  </tr>
  <tr >
    <td width="24"class="table_border_both">Exp</td>
    <td width="38"class="table_border_both"><div align="center">MSEs</div></td>
    <td width="48"class="table_border_both"><div align="center">Cumm. Exp.</div></td>
    <td width="48"class="table_border_both"><div align="center">Cumm. MSEs.</div></td>
    <td width="24"class="table_border_both">Exp</td>
    <td width="40"class="table_border_both">No.of Cases of MSEs</td>
    <td width="48"class="table_border_both"><div align="center">Cumm. No.of Cases of MSEs.</div></td>
    <td width="48"class="table_border_both"><div align="center">Cumm. No.of Cases of MSEs.</div></td>
    <td width="28"class="table_border_both"><div align="center">Exp.</div></td>
    <td width="49"class="table_border_both"><div align="center">Seminar</div></td>
    <td width="48"class="table_border_both"><div align="center">Cumm. Exp.</div></td>
    <td width="79"class="table_border_both"><div align="center">Total No.Seminars</div></td>
  </tr>
       <% for(int icnt=1;rsAdminResult.next();icnt++)
{
%>
  <tr>
    <td align="left"class="table_border_both"><%=rsAdminResult.getString("INST_CITY")%></td>
  <td align="center"class="table_border_both"><%=rsAdminResult.getString("fund_release_mda")%></td>
    <td align="center"class="table_border_both"><%=rsAdminResult.getString("target_release_mda")%></td>
    <td align="center"class="table_border_both"><%=rsAdminResult.getString("Exp_mda")%></td>
    <td align="center"class="table_border_both"><%=rsAdminResult.getString("MSEs_mda")%></td>
    <td align="center"class="table_border_both"><%=rsAdminResult.getString("Cumm_exp_mda")%></td>
    <td align="center"class="table_border_both"><%=rsAdminResult.getString("Cumm_MSEs_mda")%></td>
    <td align="center"class="table_border_both"><%=rsAdminResult.getString("fund_release_nmcp")%></td>
   <td align="center"class="table_border_both"><%=rsAdminResult.getString("target_release_nmcp")%></td>
   <td align="center"class="table_border_both"><%=rsAdminResult.getString("Exp_nmcp")%></td>
  <td align="center"class="table_border_both"><%=rsAdminResult.getString("MSEs_nmcp")%></td>
    <td align="center"class="table_border_both"><%=rsAdminResult.getString("Cumm_exp_nmcp")%></td>
    <td align="center"class="table_border_both"><%=rsAdminResult.getString("Cumm_MSEs_nmcp")%></td>
    <td align="center"class="table_border_both"><%=rsAdminResult.getString("fund_release_nmcp_seminar")%></td>
    <td align="center"class="table_border_both"><%=rsAdminResult.getString("target_release_nmcp_seminar")%></td>
    <td align="center"class="table_border_both"><%=rsAdminResult.getString("Exp_nmcp_seminar")%></td>
   <td align="center"class="table_border_both"><%=rsAdminResult.getString("MSEs_nmcp_seminar")%></td>
    <td align="center"class="table_border_both"><%=rsAdminResult.getString("Cumm_exp_nmcp_seminar")%></td>
  <td align="center"class="table_border_both"><%=rsAdminResult.getString("Cumm_MSEs_nmcp_seminar")%></td>
  </tr>
  
 
  <% }%>
   </tr>
</table>


  <% }%>

<% }%>

</body>
</html>
