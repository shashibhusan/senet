<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>



<link href="inb.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#FBFBFB">


<%String instId = request.getParameter("instId");
String months = request.getParameter("months");
String years =request.getParameter("years");
String mnm = request.getParameter("mnm");
String role = request.getParameter("role");
System.out.println(months);
System.out.println(mnm);
System.out.println(role);

%>

<% 
int flag=0,status=0,flag1=0;
	ResultSet rsAdminResult = null;
		int divFlag=0,buttonFlag=0;
		String readOnlyFlag="";
		String userDate=months+"/"+years;
	//int tYears = Integer.parseInt(years);
	//if(months=="JANUARY" || months=="FEBRUARY" || months=="MARCH"){
	if(months.equalsIgnoreCase("10") || months.equalsIgnoreCase("11") || months.equalsIgnoreCase("12")){
		//tYears = tYears-1;
		flag1=1;
		
	}
Connection con = ConnectionManager.getConnectionDirectForMySQL();
Statement stmt4 = (Statement)con.createStatement();
 Statement stmt = (Statement)con.createStatement();
if(role.equalsIgnoreCase("AU")){	
		 String strSql = "select * from tbl_vendor where months =" + months +" and year='"+years+"' and instid='"+instId+"'";
		ResultSet rs=stmt.executeQuery(strSql);
	      while(rs.next())
	      {
	      	flag++;
	      }
		  rs = null;
	System.out.println("flag"+flag);
	      if(flag>0){
	      %>	     
	     <jsp:forward page="error.jsp"></jsp:forward>  
	      <%  
	      }
}
else{
String strSql = "SELECT * FROM tbl_vendor WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
	if(rsAdminResult.next()){
		System.out.println("Result Set have record");
		divFlag=1;
	}
	else{
	System.out.println("SU Result Set have not record");
	buttonFlag=1;
	}	

}	




String strCumulative=" SELECT sum(vdp_conducted),sum(unit_participated),sum(Amount_Disbursed),sum(SVDPvdp_conducted),sum(SVDPunit_participated),sum(SVDPAmount_Disbursed) FROM tbl_vendor where months >=1 AND months <="+months+" and year='"+years+"' and instid='"+instId+"'";

	      	System.out.println("strCumulative = "+strCumulative);
		flag=0;
	      int cum_mon1=0;
	      int cum_mon2=0;
		int cum_mon3=0;
	    int cum_mon4=0;
	      int cum_mon5=0;
		int cum_mon6=0;
		
			String fix_val1="0";
		
ResultSet rsCumulative=stmt.executeQuery(strCumulative);

	      while(rsCumulative.next())
	      {
	       cum_mon1=rsCumulative.getInt("sum(vdp_conducted)");
	       cum_mon2=rsCumulative.getInt("sum(unit_participated)");
		   cum_mon3=rsCumulative.getInt("sum(Amount_Disbursed)");
	       cum_mon4=rsCumulative.getInt("sum(SVDPvdp_conducted)");
	       cum_mon5=rsCumulative.getInt("sum(SVDPunit_participated)");
		   cum_mon6=rsCumulative.getInt("sum(SVDPAmount_Disbursed)");
		   
         	flag++;
	      }
	      System.out.println("flag"+flag);







String strQuery = "SELECT * FROM tbl_pms_target WHERE year='"+years+"' AND   Inst_Id='"+instId+"'"; 
ResultSet rsTargetResult =stmt.executeQuery(strQuery);

if(rsTargetResult.next()){
	System.out.println("Target Result Set have record");
		   fix_val1=rsTargetResult.getString("vdp");
			
			
		   readOnlyFlag="readOnly";
}







%>

<%

System.out.println("instId="+instId);
String strsql1="select * from tbl_di_institute where inst_id='"+instId+"'" ;
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
<tr><td align="center"><STRONG><%=rs_instName.getString("INST_NAME")%></STRONG></td></tr>
<br>

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
<br>


</table>
<div style="font-size:large;font-family:Verdana;font-weight:bold;  " align="center" ><font color="#990000"> Monthly Progress Report of Vendor Development Programmes for the Month of <%=rs_month.getString("mon")%></font></div>
<form  name="form1" id="form1" method="post" action="vendorsubmit.jsp">

<h3 align="center" class="green">&nbsp;</h3>
<table border="1" align="center" class="style1" style="width: 667px; height: 145px; background-color: gainsboro;" cellpadding="0" cellspacing="0">
  <tr >
    <td width="77" rowspan="2" align="center" class="tableheader">Name of Programmes </td>
    <td width="77" rowspan="2" align="center" class="tableheader">Target</td>
    <td colspan="3"  align="center" class="tableheader">Monthly Data </td>
    <td colspan="3"  align="center" class="tableheader">Cumulative Data </td>
    </tr>
  <tr >
    <td width="79"align="center" class="tableheader">Number of VDP conducted</td>
    <td width="69"align="center" class="tableheader">No of unit Participated</td>
    <td width="91"align="center" class="tableheader">Amount Reliased (Expenditure)</td>
    <td width="69"align="center" class="tableheader">Number of VDP conducted</td>
	 <td width="91"align="center" class="tableheader">No of unit Participated</td>
    <td width="69"align="center" class="tableheader">Amount Reliased (Expenditure) </td>
  </tr>
    <%if(divFlag==0){%>
 <tr>
   
    <td colspan="8"  align="center"class="tablecontent11" > Record Not found</td>
   </tr>
       <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_vendor WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>
   
    <tr>
    <td  class="tablecontent11">NVDP</td>
     <td rowspan="2" class="tablecontent11"><%=rsAdminResult.getString("Totaltarget")%></td>
   <td class="tablecontent11"><%=rsAdminResult.getString("vdp_conducted")%></td>
    <td class="tablecontent11"><%=rsAdminResult.getString("unit_participated")%></td>
	 <td class="tablecontent11"><%=rsAdminResult.getString("Amount_Disbursed")%></td>
   <td class="tablecontent11"><%=cum_mon1%></td>
  
   <td class="tablecontent11"><%=cum_mon2%></td>
     
   <td class="tablecontent11"><%=cum_mon3%></td>
  </tr>
    <tr>
    <td class="tablecontent12">SVDP</td>
	 <td class="tablecontent12"><%=rsAdminResult.getString("SVDPcum_vdp_conducted")%></td>
      <td class="tablecontent12"><%=rsAdminResult.getString("SVDPunit_participated")%></td>
	  <td class="tablecontent12"><%=rsAdminResult.getString("SVDPAmount_Disbursed")%></td>
   <td class="tablecontent12"><%=cum_mon4%></td>
 
   <td class="tablecontent12"><%=cum_mon5%></td>
  
   <td class="tablecontent12"><%=cum_mon6%></td>
  </tr>
    

<% }%>
</table>
 <div align="center">
<input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
</form>
</body>
</html>
