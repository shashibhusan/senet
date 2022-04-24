<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="inb.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#FEFDE0">


<%
	try{

String instId = request.getParameter("instId");
String months = request.getParameter("months");
String years =request.getParameter("years");
String mnm = request.getParameter("mnm");
String role = request.getParameter("role");
System.out.println(months);
System.out.println(mnm);
System.out.println(role);

%>

<% 
Connection con = ConnectionManager.getConnectionDirectForMySQL();
Statement stmt4 = (Statement)con.createStatement();
 Statement stmt = (Statement)con.createStatement();
int flag=0,status=0,flag1=0;
	ResultSet rsAdminResult = null;
		int divFlag=0,buttonFlag=0;
		String readOnlyFlag="";
		String userDate=months+"/"+years;
	int tYears = Integer.parseInt(years);
	if(role.equalsIgnoreCase("AU")){	
		 String strSql = "select * from tbl_esdp where months ='" + months +"' and year="+years+" and InstId='"+instId+"'";
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
String strSql = "SELECT * FROM tbl_esdp WHERE months='"+months+"' AND year="+years+" AND   InstId='"+instId+"'"; 
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

String strCumulative=" SELECT sum(esdp2),sum(esdp3),sum(edp2),sum(edp3),sum(bsdp2),sum(bsdp3),sum(mdp2),sum(mdp3),sum(sdp2),sum(sdp3),sum(imc2),sum(imc3),sum(other2),sum(other3) FROM tbl_esdp where user_date >= '"+tYears+"-01-01' and user_date <='"+tYears+"-"+months+"-30'  and instid='"+instId+"'";

	      	System.out.println("strCumulative = "+strCumulative);
		flag=0;
	      int cum_mon1=0;
	      int cum_mon2=0;
		int cum_mon3=0;
	      int cum_mon4=0;
		  int cum_mon5=0;
	      int cum_mon6=0;
		  int cum_mon7=0;
	      int cum_mon8=0;
		  int cum_mon9=0;
	      int cum_mon10=0;
		  int cum_mon11=0;
	      int cum_mon12=0;
		    int cum_mon13=0;
			int cum_mon14=0;
					double cum_mon15=0.0;
			double cum_mon16=0.0;
			 double cum_mon17=0.0;
			double cum_mon18=0.0;
			double cum_mon19=0.0;
			double cum_mon20=0.0;
			
			String fix_val1="0";
			String fix_val2="0";
			String fix_val3="0";
			String fix_val4="0";
			String fix_val5="0";
			String fix_val6="0";
			String fix_val7="0";
			String fix_val8="0";
			String fix_val9="0";
			String fix_val10="0";
ResultSet rsCumulative=stmt.executeQuery(strCumulative);

	      while(rsCumulative.next())
	      {
	       cum_mon1=rsCumulative.getInt("sum(esdp2)");
	       cum_mon2=rsCumulative.getInt("sum(esdp3)");
		   
		  cum_mon3=rsCumulative.getInt("sum(edp2)");
	       cum_mon4=rsCumulative.getInt("sum(edp3)");
		   
		   cum_mon5=rsCumulative.getInt("sum(bsdp2)");
	       cum_mon6=rsCumulative.getInt("sum(bsdp3)");
		   
		   cum_mon7=rsCumulative.getInt("sum(mdp2)");
	       cum_mon8=rsCumulative.getInt("sum(mdp3)");
		   
		   cum_mon9=rsCumulative.getInt("sum(sdp2)");
	       cum_mon10=rsCumulative.getInt("sum(sdp3)");
		   
		   cum_mon11=rsCumulative.getInt("sum(imc2)");
	       cum_mon12=rsCumulative.getInt("sum(imc3)");
		   
		   cum_mon13=rsCumulative.getInt("sum(other2)");
	       cum_mon14=rsCumulative.getInt("sum(other3)");
		
		   
         	flag++;
	      }
	      System.out.println("flag"+flag);







String strQuery = "SELECT * FROM tbl_pms_target WHERE year="+tYears+" AND   Inst_Id='"+instId+"'"; 
ResultSet rsTargetResult =stmt.executeQuery(strQuery);

if(rsTargetResult.next()){
	System.out.println("Target Result Set have record");
		   fix_val1=rsTargetResult.getString("esdp");
			 fix_val2=rsTargetResult.getString("edp");
			 fix_val3=rsTargetResult.getString("bsdp");
			 fix_val4=rsTargetResult.getString("mdp");
			 fix_val5=rsTargetResult.getString("sdp");
			 fix_val6=rsTargetResult.getString("imc");
			 fix_val7=rsTargetResult.getString("other");
			
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


</table>
<br />
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
<DIV align="center"><STRONG><font color="#990000" size="+1"> Monthly Progress Report of the Month <%=rs_month.getString("mon")%> </font></STRONG></DIV>

<DIV align="center" class="green"><STRONG> Monthly Progress Report of Training programmes</STRONG></DIV>
<br />
<table width="90%" border="1" align="center" >
<input type="hidden" size="5" name="months" value="<%=request.getParameter("months")%>" />
<input type="hidden" size="5" name="years" value="<%=request.getParameter("years")%>" />
<input type="hidden" size="5" name="instId" value="<%=request.getParameter("instId")%>" />
<input type="hidden" size="5" name="user_date" value='<%=tYears%>-<%=months%>-20' />
  <tr >
    <td width="134" rowspan="2" class="tableheader">Name Of Program </td>
    <td width="77" rowspan="2" class="tableheader">Target</td>
    <td colspan="2" class="tableheader">Monthly Achievment (During the Months) </td>
    <td colspan="2" class="tableheader">Cumlative Achievment (up to Months) </td>
  </tr>
  <tr >
    <td  class="tableheader">No of Programmes </td>
    <td class="tableheader">No of person Trained</td>
    <td class="tableheader">No of Programmes </td>
    <td class="tableheader">No of person Trained</td>
  </tr>
   <%if(divFlag==0){%>
  <tr>
    <td  colspan="7" align="center" >Record Not Found</td>
   
  </tr>
     <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_esdp WHERE months='"+months+"' AND year="+years+" AND   instid='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>
<tr>
    <td class="tablecontent11" >ESDPs</td>
   <td align="center"class="tablecontent11" ><%=rsAdminResult.getString("esdp1")%></td>
   <td align="center"class="tablecontent11" ><%=rsAdminResult.getString("esdp2")%></td>
   <td align="center"class="tablecontent11" ><%=rsAdminResult.getString("esdp3")%></td>
 <td align="center"class="tablecontent11" ><%=cum_mon1%></td>
 <td align="center" class="tablecontent11"><%=cum_mon2%></td>
  </tr>
  <tr>
    <td class="tablecontent12">EDPs</td>
     <td align="center"class="tablecontent12"><%=rsAdminResult.getString("edp1")%></td>
   <td align="center"class="tablecontent12"> <%=rsAdminResult.getString("edp2")%></td>
   <td align="center"class="tablecontent12"><%=rsAdminResult.getString("edp3")%>
 <td align="center"class="tablecontent12"><%=cum_mon3%>
 <td align="center"class="tablecontent12"><%=cum_mon4%>
  </tr>
 
  <tr>
    <td class="tablecontent11" >BSDPs</td>
     <td align="center"class="tablecontent11"><%=rsAdminResult.getString("bsdp1")%></td>
   <td align="center"class="tablecontent11"><%=rsAdminResult.getString("bsdp2")%></td>
   <td align="center"class="tablecontent11"><%=rsAdminResult.getString("bsdp3")%>
 <td align="center"class="tablecontent11"><%=cum_mon5%>
 <td align="center"class="tablecontent11"><%=cum_mon6%>
  </tr>
  <tr>
    <td class="tablecontent12">MDPs</td>
     <td align="center"class="tablecontent12"><%=rsAdminResult.getString("mdp1")%></td>
   <td align="center"class="tablecontent12"><%=rsAdminResult.getString("mdp2")%></td>
   <td align="center"class="tablecontent12"><%=rsAdminResult.getString("mdp3")%>
 <td align="center"class="tablecontent12"><%=cum_mon7%>
 <td align="center"class="tablecontent12"><%=cum_mon8%>
  </tr>
  <tr>
    <td class="tablecontent11">SDPs</td>
     <td align="center"class="tablecontent11"><%=rsAdminResult.getString("sdp1")%></td>
   <td align="center"class="tablecontent11"><%=rsAdminResult.getString("sdp2")%></td>
   <td align="center"class="tablecontent11"><%=rsAdminResult.getString("sdp3")%>
 <td align="center"class="tablecontent11"><%=cum_mon9%>
 <td align="center"class="tablecontent11"><%=cum_mon10%>
  </tr>
   <tr>
    <td class="tablecontent12">IMCs</td>
     <td align="center"class="tablecontent12"><%=rsAdminResult.getString("imc1")%></td>
   <td align="center"class="tablecontent12"><%=rsAdminResult.getString("imc2")%></td>
   <td align="center"class="tablecontent12"><%=rsAdminResult.getString("imc3")%>
 <td align="center"class="tablecontent12"><%=cum_mon11%>
 <td align="center"class="tablecontent12"><%=cum_mon12%>
  </tr>
    <tr>
    <td class="tablecontent11">Others</td>
     <td align="center"class="tablecontent11"><%=rsAdminResult.getString("other1")%></td>
   <td align="center"class="tablecontent11"><%=rsAdminResult.getString("other2")%></td>
   <td align="center"class="tablecontent11"><%=rsAdminResult.getString("other3")%>
 <td align="center"class="tablecontent11"><%=cum_mon13%>
 <td align="center"class="tablecontent11"><%=cum_mon14%>
  </tr>
<% }%>
</table>
<% 


if(role.equalsIgnoreCase("AU")){	
		 String strSql = "select * from tbl_iso where months ='" + months +"' and year="+years+" and inst_id='"+instId+"'";
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
String strSql = "SELECT * FROM tbl_iso WHERE months='"+months+"' AND year="+years+" AND   inst_id='"+instId+"'"; 
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
 strCumulative=" SELECT sum(GENERALappication_received_during_month),sum(GENERALappication_disburded_during_month),sum(GENERALamount_disburded_during_month) ,sum(NERappication_received_during_month),sum(NERappication_disburded_during_month),sum(NERamount_disburded_during_month),sum(SCPappication_received_during_month),sum(SCPappication_disburded_during_month),sum(SCPamount_disburded_during_month),sum(TSPappication_received_during_month),sum(TSPappication_disburded_during_month),sum(TSPamount_disburded_during_month) FROM tbl_iso where user_date >= '"+tYears+"-01-01' and user_date <='"+tYears+"-"+months+"-30' and inst_id='"+instId+"'";

	      	System.out.println("strCumulative = "+strCumulative);
		
 rsCumulative=stmt.executeQuery(strCumulative);

	      while(rsCumulative.next())
	      {
	       cum_mon1=rsCumulative.getInt("sum(GENERALappication_received_during_month)");
	       cum_mon2=rsCumulative.getInt("sum(GENERALappication_disburded_during_month)");
		    cum_mon3=rsCumulative.getInt("sum(GENERALamount_disburded_during_month)");
	   
	   cum_mon4=rsCumulative.getInt("sum(NERappication_received_during_month)");
	       cum_mon5=rsCumulative.getInt("sum(NERappication_disburded_during_month)");
		    cum_mon6=rsCumulative.getInt("sum(NERamount_disburded_during_month)");
	   
	   cum_mon7=rsCumulative.getInt("sum(SCPappication_received_during_month)");
	       cum_mon8=rsCumulative.getInt("sum(SCPappication_disburded_during_month)");
		    cum_mon9=rsCumulative.getInt("sum(SCPamount_disburded_during_month)");
	   
	   cum_mon10=rsCumulative.getInt("sum(TSPappication_received_during_month)");
	       cum_mon11=rsCumulative.getInt("sum(TSPappication_disburded_during_month)");
		    cum_mon12=rsCumulative.getInt("sum(TSPamount_disburded_during_month)");
	   
		   
         	flag++;
	      }
	      System.out.println("flag"+flag);


%>



<br>
<div align="center"><STRONG>Monthly Progress Status of ISO Application Received </STRONG></div>




<br> 
<input type="hidden" size="5" name="months" value="<%=request.getParameter("months")%>" />
<input type="hidden" size="5" name="years" value="<%=request.getParameter("years")%>" />
<input type="hidden" size="5" name="instId" value="<%=request.getParameter("instId")%>" />
<input type="hidden" size="5" name="user_date" value='<%=tYears%>-<%=months%>-20' />
<table width="90%" border="0" align="center">
  <tr>
    <td width="134" rowspan="2" class="tableheader">Name Of Program </td>
    <td colspan="3"  align="center" class="tableheader">Data of The Month </td>
    <td colspan="3"  align="center" class="tableheader">Cumulative Value  </td>
  </tr>
   <tr   >
    
     <td  align="center" class="tableheader">No of Application Received </td>
    <td  align="center" class="tableheader">No of Application Disbursed </td>
	  <td align="center" class="tableheader">Amount Disbursed </td>
	    <td  align="center" class="tableheader">No of Application Received </td>
    <td  align="center" class="tableheader">No of Application Disbursed </td>
	  <td align="center" class="tableheader">Amount Disbursed </td>
  </tr>
  </tr>
     <%if(divFlag==0){%>
  <tr>
    <td colspan="7" class="tablecontent11" align="center"> Record not found      </td>
  </tr>
       <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_iso WHERE months='"+months+"' AND year="+years+" AND   inst_id='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>
 <tr>
   <td class="tablecontent11" >GENERAL</td>
 <td class="tablecontent11"><%=rsAdminResult.getString("GENERALappication_received_during_month")%></td>
   <td class="tablecontent11"> <%=rsAdminResult.getString("GENERALappication_disburded_during_month")%></td>
 <td class="tablecontent11"><%=rsAdminResult.getString("GENERALamount_disburded_during_month")%></td>
  
 <td class="tablecontent11"><%=cum_mon1%></td>
 <td class="tablecontent11"><%=cum_mon2%></td>
  <td class="tablecontent11"><%=cum_mon3%></td>
  </tr>
  <tr>
   <td class="tablecontent12" >NER</td>
   <td class="tablecontent12"><%=rsAdminResult.getString("NERappication_received_during_month")%></td>
    <td class="tablecontent12"> <%=rsAdminResult.getString("NERappication_disburded_during_month")%></td>
 <td class="tablecontent12"><%=rsAdminResult.getString("NERamount_disburded_during_month")%></td>
 <td class="tablecontent12"><%=cum_mon4%></td>
	 <td class="tablecontent12"><%=cum_mon5%></td>
 <td class="tablecontent12"><%=cum_mon6%></td>
  </tr>
  <tr>
   <td class="tablecontent11" >SCP</td>
   <td class="tablecontent11"> <%=rsAdminResult.getString("SCPappication_received_during_month")%></td>
   <td class="tablecontent11"><%=rsAdminResult.getString("SCPappication_disburded_during_month")%></td>
  <td class="tablecontent11"><%=rsAdminResult.getString("SCPamount_disburded_during_month")%></td>
  <td class="tablecontent11"> <%=cum_mon7%></td>
  <td class="tablecontent11"> <%=cum_mon8%></td>
  <td class="tablecontent11"> <%=cum_mon9%></td>
  </tr>
  <tr>
   <td class="tablecontent12" >TSP</td>
 <td class="tablecontent12"> <%=rsAdminResult.getString("TSPappication_received_during_month")%></td>
 <td class="tablecontent12"><%=rsAdminResult.getString("TSPappication_disburded_during_month")%></td>
   <td class="tablecontent12"><%=rsAdminResult.getString("TSPamount_disburded_during_month")%></td>
 <td class="tablecontent12"><%=cum_mon10%></td>
  <td class="tablecontent12"> <%=cum_mon11%></td>
  <td class="tablecontent12"><%=cum_mon12%></td>
  </tr>
<% }%>
</table>
<%
if(role.equalsIgnoreCase("AU")){	
		 String strSql = "select * from tbl_vendor where months ='" + months +"' and year="+years+" and instid='"+instId+"'";
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
String strSql = "SELECT * FROM tbl_vendor WHERE months='"+months+"' AND year="+years+" AND   instid='"+instId+"'"; 
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




 strCumulative=" SELECT sum(vdp_conducted),sum(unit_participated),sum(Amount_Disbursed),sum(SVDPvdp_conducted),sum(SVDPunit_participated),sum(SVDPAmount_Disbursed) FROM tbl_vendor where user_date >= '"+tYears+"-01-01' and user_date <='"+tYears+"-"+months+"-30'  and instid='"+instId+"'";

	      	System.out.println("strCumulative = "+strCumulative);
		flag=0;
	      
		
 rsCumulative=stmt.executeQuery(strCumulative);

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







 strQuery = "SELECT * FROM tbl_pms_target WHERE year="+tYears+" AND   Inst_Id='"+instId+"'"; 
 rsTargetResult =stmt.executeQuery(strQuery);

if(rsTargetResult.next()){
	System.out.println("Target Result Set have record");
		   fix_val1=rsTargetResult.getString("vdp");
			
			
		   readOnlyFlag="readOnly";
}







%>


<br>
<div align="center" class="green"><STRONG> Monthly Progress Report of Vendor Development Programmes </STRONG></div>
<table border="1" align="center" width="90%">
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
  String strSql = "SELECT * FROM tbl_vendor WHERE months='"+months+"' AND year="+years+" AND   instid='"+instId+"'"; 
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


<%

if(role.equalsIgnoreCase("AU")){	
		 String strSql = "select * from tbl_special_program where months ='" + months +"' and year="+years+" and instid='"+instId+"'";
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
String  strSql = "SELECT * FROM tbl_special_program WHERE months='"+months+"' AND year="+years+" AND   instid='"+instId+"'"; 
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




 strCumulative=" SELECT sum(Sensitization_programme_wto_Programmes),sum(Sensitization_programme_wto_Participants),sum(Awareness_Bio_Programmes),sum(Awareness_Bio_Participants),sum(Exports_Programmes),sum(Exports_Participants),sum(Bar_coding_Programmes),sum(Bar_coding_Participants),sum(Cluster_Programmes),sum(Cluster_Participants),sum(IPR_Programmes),sum(IPR_Participants),sum(Awareness_TEQUP_Programmes),sum(Awareness_TEQUP_Participants),sum(TEQUP_Participants),sum(TEQUP_Programmes),sum(Awareness_CLCSS_Programmes),sum(Awareness_CLCSS_Participants),sum(Seminar_VSBK_Programmes),sum(Seminar_VSBK_Participants) FROM tbl_special_program where DATE_FORMAT(months/year,'%m/%Y')>=DATE_FORMAT(1/"+tYears+",'%m/%y') and user_date <='"+years+"-"+months+"-30' and year="+tYears+" and instid='"+instId+"'";
 
	      	System.out.println("strCumulative = "+strCumulative);
		flag=0;
 rsCumulative=stmt.executeQuery(strCumulative);

	      while(rsCumulative.next())
	      {
	       cum_mon1=rsCumulative.getInt("sum(Sensitization_programme_wto_Programmes)");
	       cum_mon2=rsCumulative.getInt("sum(Sensitization_programme_wto_Participants)");
		   
		  cum_mon3=rsCumulative.getInt("sum(Awareness_Bio_Programmes)");
	       cum_mon4=rsCumulative.getInt("sum(Awareness_Bio_Participants)");
		   
		   cum_mon5=rsCumulative.getInt("sum(Exports_Programmes)");
	       cum_mon6=rsCumulative.getInt("sum(Exports_Participants)");
		   
		   cum_mon7=rsCumulative.getInt("sum(Bar_coding_Programmes)");
	       cum_mon8=rsCumulative.getInt("sum(Bar_coding_Participants)");
		   
		   cum_mon9=rsCumulative.getInt("sum(Cluster_Programmes)");
	       cum_mon10=rsCumulative.getInt("sum(Cluster_Participants)");
		   
			 cum_mon11=rsCumulative.getInt("sum(TEQUP_Programmes)");
	       cum_mon12=rsCumulative.getInt("sum(TEQUP_Participants)");
		   
		    cum_mon13=rsCumulative.getInt("sum(IPR_Programmes)");
	       cum_mon14=rsCumulative.getInt("sum(IPR_Participants)");
		   
		    cum_mon15=rsCumulative.getDouble("sum(Awareness_TEQUP_Programmes)");
	       cum_mon16=rsCumulative.getDouble("sum(Awareness_TEQUP_Participants)");
		   
		      cum_mon17=rsCumulative.getDouble("sum(Awareness_CLCSS_Programmes)");
	       cum_mon18=rsCumulative.getDouble("sum(Awareness_CLCSS_Participants)");
		   
		    cum_mon19=rsCumulative.getDouble("sum(Seminar_VSBK_Programmes)");
	       cum_mon20=rsCumulative.getDouble("sum(Seminar_VSBK_Participants)");
         	flag++;
	      }
	      System.out.println("flag"+flag);







 strQuery = "SELECT * FROM tbl_pms_target WHERE year="+tYears+" AND   Inst_Id='"+instId+"'"; 
 rsTargetResult =stmt.executeQuery(strQuery);

if(rsTargetResult.next()){
	System.out.println("Target Result Set have record");
		   fix_val1=rsTargetResult.getString("Sensitization_wto");
			 fix_val2=rsTargetResult.getString("Awareness_bio");
			 fix_val3=rsTargetResult.getString("Programmes_Packaging");
			 fix_val4=rsTargetResult.getString("Programmes_bar");
			 fix_val5=rsTargetResult.getString("Awareness_cluster");
			 fix_val6=rsTargetResult.getString("TEQUP");
			 fix_val7=rsTargetResult.getString("Sensitization_ipr");
			fix_val8=rsTargetResult.getString("Awareness_tequp");
			 fix_val9=rsTargetResult.getString("seminar_on_vsbk");
			 fix_val10=rsTargetResult.getString("identification");
		   readOnlyFlag="readOnly";
}

%>

<br>
<DIV align="center" class="green"><STRONG> Monthly Progress Report of Special programmes</STRONG></DIV>
<br><br>
<table border="1" align="center" width="90%">

  <tr  >
    <td width="33" rowspan="2"class="tableheader">S.No</td>
    <td width="263" rowspan="2"class="tableheader">Name Of Program </td>
	  <td width="57" colspan="1" rowspan="2"class="tableheader">Target</td>
    <td colspan="1"class="tableheader">No of Programmes </td>
    <td colspan="1"class="tableheader">No .of Participants </td>
	 <td colspan="1"class="tableheader">No of Programmes </td>
	 <td colspan="1"class="tableheader">No .of Participants </td>
  </tr>
  <tr >
    <td width="79"class="tableheader">During The month </td>
    <td width="63"class="tableheader">During The month </td>
    <td width="69"class="tableheader">up to the Month </td>
    <td width="75"class="tableheader">up to the Month</td>
  </tr>
  <%if(divFlag==0){%>
  <tr>
    <td  colspan="7" align="center" class="tablecontent11">RECORD NOT FOUND</TD>
 </tr>
     <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_special_program WHERE months='"+months+"' AND year="+years+" AND   instid='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>

 <tr>
    <td class="tablecontent11" >1</td>
    <td class="tablecontent11" >Sensitization programme on WTO </td>
   <TD class="tablecontent11"><%=fix_val1%></TD>
     <TD class="tablecontent11">  <%=rsAdminResult.getString("Sensitization_programme_wto_Programmes")%></TD>
    <TD class="tablecontent11">  <%=rsAdminResult.getString("Sensitization_programme_wto_Participants")%></TD>
    <TD class="tablecontent11"> <%=cum_mon1%></TD>
   <TD class="tablecontent11"><%=cum_mon2%></TD>
  </tr>
  <tr>
    <td  class="tablecontent12">2</td>
    <td class="tablecontent12" >Awareness Programme on Bio Technology </td>
       <TD class="tablecontent12"><%=fix_val2%></TD>
      <TD class="tablecontent12"> <%=rsAdminResult.getString("Awareness_Bio_Programmes")%></TD>
    <TD class="tablecontent12"> <%=rsAdminResult.getString("Awareness_Bio_Participants")%></TD>
   <TD class="tablecontent12"><%=cum_mon3%></TD>
     <TD class="tablecontent12"><%=cum_mon4%></TD>
  </tr>
  <tr>
    <td  class="tablecontent11">3</td>
    <td class="tablecontent11" >Programmes on Packaging for Exports </td>
      <TD class="tablecontent11"><%=fix_val3%></TD>
     <TD class="tablecontent11"><%=rsAdminResult.getString("Exports_Programmes")%></TD>
     <TD class="tablecontent11"><%=rsAdminResult.getString("Exports_Participants")%></TD>
     <TD class="tablecontent11"><%=cum_mon5%></TD>
      <TD class="tablecontent11"><%=cum_mon6%></TD>
  </tr>
  <tr>
    <td class="tablecontent12" >4</td>
    <td class="tablecontent12" >Programmes on Bar coding </td>
   <TD class="tablecontent12"> <%=fix_val4%></TD>
      <TD class="tablecontent12"><%=rsAdminResult.getString("Bar_coding_Programmes")%></TD>
      <TD class="tablecontent12"><%=rsAdminResult.getString("Bar_coding_Participants")%></TD>
      <TD class="tablecontent12"><%=cum_mon7%></TD>
    <TD class="tablecontent12"><%=cum_mon8%></TD>
  </tr>
  <tr>
    <td class="tablecontent11" >5</td>
    <td class="tablecontent11" >Awareness Programme on Cluster </td>
       <TD class="tablecontent11"><%=fix_val5%></TD>
     <TD class="tablecontent11"><%=rsAdminResult.getString("Cluster_Programmes")%></TD>
   <TD class="tablecontent11"><%=rsAdminResult.getString("Cluster_Participants")%></TD>
    <TD class="tablecontent11"> <%=cum_mon9%></TD>
    <TD class="tablecontent11"> <%=cum_mon10%></TD>
  </tr>
  <tr>
    <td class="tablecontent12" >6</td>
    <td class="tablecontent12" >Awareness Programme on credit Guarntee Scheme</td>
      <TD class="tablecontent12"><%=fix_val6%></TD>
     <TD class="tablecontent12"><%=rsAdminResult.getString("TEQUP_Programmes")%></TD>
    <TD class="tablecontent12"> <%=rsAdminResult.getString("TEQUP_Participants")%></TD>
    <TD class="tablecontent12"> <%=cum_mon11%></TD>
     <TD class="tablecontent12"> <%=cum_mon12%></TD>
  </tr>
  <tr>
    <td class="tablecontent11" >7</td>
    <td  class="tablecontent11">Sensitization programme on IPR</td>
     <TD class="tablecontent11"><%=fix_val7%></TD>
     <TD class="tablecontent11"><%=rsAdminResult.getString("IPR_Programmes")%></TD>
     <TD class="tablecontent11"><%=rsAdminResult.getString("IPR_Participants")%></TD>
      <TD class="tablecontent11"> <%=cum_mon13%></TD>
   <TD class="tablecontent11"><%=cum_mon14%></TD>
  </tr>
  <tr>
    <td class="tablecontent12" >8</td>
    <td class="tablecontent12" >Awareness Programme on TEQUP</td>
      <TD class="tablecontent12">  <%=fix_val8%></TD>
   <TD class="tablecontent12"><%=rsAdminResult.getString("Awareness_TEQUP_Programmes")%></TD>
     <TD class="tablecontent12">  <%=rsAdminResult.getString("Awareness_TEQUP_Participants")%></TD>
   <TD class="tablecontent12"><%=cum_mon15%></TD>
     <TD class="tablecontent12"> <%=cum_mon16%></TD>
  </tr>
 <tr>
    <td class="tablecontent11" >9</td>
    <td class="tablecontent11" >Awareness Programme on CLCSS</td>
   <TD class="tablecontent11"><%=fix_val10%></TD>
     <TD class="tablecontent11"><%=rsAdminResult.getString("Awareness_CLCSS_Programmes")%></TD>
     <TD class="tablecontent11"><%=rsAdminResult.getString("Awareness_CLCSS_Participants")%></TD>
     <TD class="tablecontent11"> <%=cum_mon17%></TD>
   <TD class="tablecontent11"><%=cum_mon18%></TD>
  </tr>
   <tr>
    <td class="tablecontent12" >10</td>
    <td class="tablecontent12" >Seminar on VSBK</td>
   <TD class="tablecontent12"><%=fix_val9%></TD>
    <TD class="tablecontent12">  <%=rsAdminResult.getString("Seminar_VSBK_Programmes")%></TD>
      <TD class="tablecontent12"><%=rsAdminResult.getString("Seminar_VSBK_Participants")%></TD>
      <TD class="tablecontent12"><%=cum_mon19%></TD>
   <TD class="tablecontent12"><%=cum_mon20%></TD>
  </tr>
<% }%>
</table>


<% 

if(role.equalsIgnoreCase("AU")){	
		 String strSql = "select * from tbl_report where months ='" + months +"' and year="+years+" and instid='"+instId+"'";
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
String strSql = "SELECT * FROM tbl_report WHERE months='"+months+"' AND year="+years+" AND   instid='"+instId+"'"; 
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




 strCumulative=" SELECT sum(Monthly_Achievment_new),sum(Monthly_Achievment_updated),sum(state_industrial_Achievment),sum(Survey_Report_Achievment),sum(Status_Report_Achievment),sum(Technology_Study_Achievment),sum(Trade_Directories_Achievment),sum(Training_Programme_Achievment),sum(Detail_Project_Achievment),sum(Distict_Potenial_Achievment) FROM tbl_report where DATE_FORMAT(months/year,'%m/%Y')>=DATE_FORMAT(1/"+tYears+",'%m/%y') and user_date <='"+years+"-"+months+"-30' and year="+tYears+" and instid='"+instId+"'";

	      	System.out.println("strCumulative = "+strCumulative);
		flag=0;
	      
 rsCumulative=stmt.executeQuery(strCumulative);

	      while(rsCumulative.next())
	      {
	       cum_mon1=rsCumulative.getInt("sum(Monthly_Achievment_new)");
	       cum_mon2=rsCumulative.getInt("sum(Monthly_Achievment_updated)");
		   
		  cum_mon3=rsCumulative.getInt("sum(state_industrial_Achievment)");
	       cum_mon4=rsCumulative.getInt("sum(Survey_Report_Achievment)");
		   
		   cum_mon5=rsCumulative.getInt("sum(Status_Report_Achievment)");
	       cum_mon6=rsCumulative.getInt("sum(Technology_Study_Achievment)");
		   
		   cum_mon7=rsCumulative.getInt("sum(Trade_Directories_Achievment)");
	       cum_mon8=rsCumulative.getInt("sum(Training_Programme_Achievment)");
		    cum_mon9=rsCumulative.getInt("sum(Distict_Potenial_Achievment)");	   
		   
	       cum_mon10=rsCumulative.getInt("sum(Detail_Project_Achievment)");	   
         	flag++;
	      }
	      System.out.println("flag"+flag);







 strQuery = "SELECT * FROM tbl_pms_target WHERE year="+tYears+" AND   Inst_Id='"+instId+"'"; 
 rsTargetResult =stmt.executeQuery(strQuery);

if(rsTargetResult.next()){
	System.out.println("Target Result Set have record");
		   fix_val1=rsTargetResult.getString("project_new");
			 fix_val2=rsTargetResult.getString("project_updated");
			 fix_val3=rsTargetResult.getString("state_industrial");
			 fix_val4=rsTargetResult.getString("survey");
			 fix_val5=rsTargetResult.getString("status_report");
			 fix_val6=rsTargetResult.getString("technology_study");
			 fix_val7=rsTargetResult.getString("trade");
			fix_val8=rsTargetResult.getString("Training_programmes");
			 fix_val9=rsTargetResult.getString("detail_of_projects");
			
		   readOnlyFlag="readOnly";
}

%>

<DIV align="center" class="green"><STRONG> Monthly Progress Report </STRONG></DIV>
<br>
<table  border="1" align="center"  width="90%">
  <tr class="tablecontent11">
    <td width="22"  class="tableheader">1</td>
    <td width="427"  class="tableheader">Name Of Program </td>
    <td width="213"  class="tableheader">Target</td>
    <td width="226" colspan="1"  class="tableheader">Monthly Achievment </td>
    <td width="171" colspan="1"  class="tableheader">Cumlative Achievment </td>
  </tr>
    <%if(divFlag==0){%>
  <tr>
    <td class="tablecontent11" colspan="6" align="center">RECORD NOT FOUND</td>
  </tr>
       <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_report WHERE months='"+months+"' AND year="+years+" AND   instid='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>

<tr>
    <td class="tablecontent11" >2</td>
    <td class="tablecontent11">Project Profiles (New) </td>
      <td class="tablecontent11"> <%=fix_val1%></td>
  <td class="tablecontent11"> <%=rsAdminResult.getString("Monthly_Achievment_new")%></td>
 <td class="tablecontent11"> <%=cum_mon1%></td>
  </tr>
  <tr>
    <td class="tablecontent12">3</td>
    <td class="tablecontent12">Project Profiles (Updated) </td>
 <td class="tablecontent12"><%=fix_val2%></td>
  <td class="tablecontent12">  <%=rsAdminResult.getString("Monthly_Achievment_updated")%></td>
 <td class="tablecontent12"><%=cum_mon2%></td>
  </tr>
  <tr>
    <td class="tablecontent11">4</td>
    <td class="tablecontent11">State Industrial Profile</td>
       <td class="tablecontent11"><%=fix_val3%></td>
    <td class="tablecontent11"><%=rsAdminResult.getString("state_industrial_Achievment")%></td>
   <td class="tablecontent11"><%=cum_mon3%></td>
  </tr>
  <tr>
    <td class="tablecontent12">5</td>
    <td class="tablecontent12"> Distict Indl.Potenial </td>
 <td class="tablecontent12"><%=fix_val3%></td>
    <td class="tablecontent12"><%=rsAdminResult.getString("Distict_Potenial_Achievment")%></td>
    <td class="tablecontent12"><%=cum_mon9%></td>
  
  </tr>
  <tr>
    <td class="tablecontent11">6</td>
    <td class="tablecontent11">Name of unit provided Intensive Technical Consultancy </td>
      <td class="tablecontent11"> <%=fix_val4%></td>
    <td class="tablecontent11"><%=rsAdminResult.getString("Survey_Report_Achievment")%></td>
    <td class="tablecontent11"><%=cum_mon4%></td>
  </tr>
  <tr>
    <td class="tablecontent12">7</td>
    <td class="tablecontent12">Status Report </td>
 <td class="tablecontent12"><%=fix_val5%></td>
  <td class="tablecontent12"> <%=rsAdminResult.getString("Status_Report_Achievment")%></td>
  <td class="tablecontent12">  <%=cum_mon5%></td>
  </tr>
  <tr>
    <td rowspan="1" class="tablecontent11">8</td>
    <td class="tablecontent11">Library </td>
 <td class="tablecontent11"><%=fix_val6%></td>
  <td class="tablecontent11"> <%=rsAdminResult.getString("Technology_Study_Achievment")%></td>
 <td class="tablecontent11"><%=cum_mon6%></td>
  </tr>
  <tr>
  <td rowspan="1" class="tablecontent12">9</td>
    <td class="tablecontent12"> Marketing Assistance </td>
 <td class="tablecontent12"><%=fix_val7%></td>
 <td class="tablecontent12"> <%=rsAdminResult.getString("Trade_Directories_Achievment")%></td>
 <td class="tablecontent12"><%=cum_mon7%></td>
  </tr>
  <tr>
    <td class="tablecontent11">10</td>
    <td class="tablecontent11">SENET </td>
     <td class="tablecontent11"> <%=fix_val8%></td>
    <td class="tablecontent11"> <%=rsAdminResult.getString("Training_Programme_Achievment")%></td>
 <td class="tablecontent11"><%=cum_mon8%></td>
  </tr>
	<tr>
    <td class="tablecontent12">11</td>
    <td class="tablecontent12">Detail Project Report </td>
 <td class="tablecontent12"><%=fix_val9%></td>
   <td class="tablecontent12"> <%=rsAdminResult.getString("Detail_Project_Achievment")%></td>
  <td class="tablecontent12"><%=cum_mon10%></td>
  </tr>

<% }%>
</table>



<%
			
}// End of Try
catch(SQLException e){
			//e.printStackTrace();
			int eCode = e.getErrorCode();
			String eMsg  =e.getMessage();
			System.out.println(" SQLException = "+e.getErrorCode()+" = "+e.getMessage());
			if(e.getErrorCode()==1){
				System.out.println("Duplicate Entry");
				}
				%>
	<jsp:forward  page="errorCode.jsp">	
	<jsp:param name="ecode" value="<%=eCode%>"/>
	<jsp:param name="emsg" value='<%=eMsg%>'/>
	</jsp:forward>
				<%
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			String eMsg  =e.getMessage();
			System.out.println(" Exception = "+e.getMessage());
				%>
	<jsp:forward page="errorCode.jsp">	
	<jsp:param name="ecode" value="0"/>
	<jsp:param name="emsg" value='<%=eMsg%>'/>
	</jsp:forward>
<%
	} 
	finally{
		 
	}
	%>







 <div align="center">
<input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
</div>
</form>


</body>
</html>
