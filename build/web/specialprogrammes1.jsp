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
		 String strSql = "select * from tbl_special_program where months =" + months +" and year='"+years+"' and instid='"+instId+"'";
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
String strSql = "SELECT * FROM tbl_special_program WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
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




String strCumulative=" SELECT sum(Sensitization_programme_wto_Programmes),sum(Sensitization_programme_wto_Participants),sum(Awareness_Bio_Programmes),sum(Awareness_Bio_Participants),sum(Exports_Programmes),sum(Exports_Participants),sum(Bar_coding_Programmes),sum(Bar_coding_Participants),sum(Cluster_Programmes),sum(Cluster_Participants),sum(IPR_Programmes),sum(IPR_Participants),sum(Awareness_TEQUP_Programmes),sum(Awareness_TEQUP_Participants),sum(TEQUP_Participants),sum(TEQUP_Programmes),sum(Awareness_CLCSS_Programmes),sum(Awareness_CLCSS_Participants),sum(Seminar_VSBK_Programmes),sum(Seminar_VSBK_Participants) FROM tbl_special_program where months >=1 AND months <="+months+" and year='"+years+"' and instid='"+instId+"'";
 
	      	System.out.println("strCumulative = "+strCumulative);
		flag=0;
	      double cum_mon1=0.0;
	      double cum_mon2=0.0;
		double cum_mon3=0.0;
	      double cum_mon4=0.0;
		  double cum_mon5=0.0;
	      double cum_mon6=0.0;
		  double cum_mon7=0.0;
	      double cum_mon8=0.0;
		  double cum_mon9=0.0;
	      double cum_mon10=0.0;
		  double cum_mon11=0.0;
	      double cum_mon12=0.0;
		    double cum_mon13=0.0;
			double cum_mon14=0.0;
			double cum_mon15=0.0;
			double cum_mon16=0.0;
			 double cum_mon17=0.0;
			double cum_mon18=0.0;
			double cum_mon19=0.0;
			double cum_mon20=0.0;
			
			
			
			
			String fix_val1="0.0";
			String fix_val2="0.0";
			String fix_val3="0.0";
			String fix_val4="0.0";
			String fix_val5="0.0";
			String fix_val6="0.0";
			String fix_val7="0.0";
			String fix_val8="0.0";
			String fix_val9="0.0";
			String fix_val10="0.0";
ResultSet rsCumulative=stmt.executeQuery(strCumulative);

	      while(rsCumulative.next())
	      {
	       cum_mon1=rsCumulative.getDouble("sum(Sensitization_programme_wto_Programmes)");
	       cum_mon2=rsCumulative.getDouble("sum(Sensitization_programme_wto_Participants)");
		   
		  cum_mon3=rsCumulative.getDouble("sum(Awareness_Bio_Programmes)");
	       cum_mon4=rsCumulative.getDouble("sum(Awareness_Bio_Participants)");
		   
		   cum_mon5=rsCumulative.getDouble("sum(Exports_Programmes)");
	       cum_mon6=rsCumulative.getDouble("sum(Exports_Participants)");
		   
		   cum_mon7=rsCumulative.getDouble("sum(Bar_coding_Programmes)");
	       cum_mon8=rsCumulative.getDouble("sum(Bar_coding_Participants)");
		   
		   cum_mon9=rsCumulative.getDouble("sum(Cluster_Programmes)");
	       cum_mon10=rsCumulative.getDouble("sum(Cluster_Participants)");
		   
			 cum_mon11=rsCumulative.getDouble("sum(TEQUP_Programmes)");
	       cum_mon12=rsCumulative.getDouble("sum(TEQUP_Participants)");
		   
		    cum_mon13=rsCumulative.getDouble("sum(IPR_Programmes)");
	       cum_mon14=rsCumulative.getDouble("sum(IPR_Participants)");
		   
		    cum_mon15=rsCumulative.getDouble("sum(Awareness_TEQUP_Programmes)");
	       cum_mon16=rsCumulative.getDouble("sum(Awareness_TEQUP_Participants)");
		   
		      cum_mon17=rsCumulative.getDouble("sum(Awareness_CLCSS_Programmes)");
	       cum_mon18=rsCumulative.getDouble("sum(Awareness_CLCSS_Participants)");
		   
		    cum_mon19=rsCumulative.getDouble("sum(Seminar_VSBK_Programmes)");
	       cum_mon20=rsCumulative.getDouble("sum(Seminar_VSBK_Participants)");
         	flag++;
	      }
	      System.out.println("flag"+flag);







String strQuery = "SELECT * FROM tbl_pms_target WHERE year="+years+" AND   Inst_Id='"+instId+"'"; 
ResultSet rsTargetResult =stmt.executeQuery(strQuery);

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

<h3 align="center" class="green"> <span id="ctl00_ContentPlaceHolder1_lbl_topic" style="color: rgb(204, 0, 0); font-family: Microsoft Sans Serif; font-size: medium; font-weight: bold; text-decoration: underline; text-align: center;"> Monthly Progress Report Of Special Programmes</span></h3>
<table border="1" align="center" class="style1" style="width: 790px; height: 145px; background-color: gainsboro;"  cellpadding="0" cellspacing="0">

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
  String strSql = "SELECT * FROM tbl_special_program WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
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



 <div align="center">
<input name="button2" type="button" onClick="window.print();return false;" value=" Print" /></div>
</body></html>
