<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@taglib uri="/web-INF/struts-bean.tld" prefix="bean" %>
<%@taglib uri="/web-INF/struts-html.tld" prefix="html" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="inb.css" rel="stylesheet" type="text/css">

<script>

function fnTotal(obj1,obj2,obj3){
	// sc_dtm  st_dtm wmn_dtm obc_dtm ph_dtm min_dtm total_dtm
	var temp;
	var target1=Number(obj1.value);
	var target2=Number(obj2.value);
	temp=target1+target2;
	obj3.value=temp.toFixed(2);
}
function fnSum(vDTM,vQCUM,vCUM){
var tmp;
//alert('Sum ');
	if(vDTM!=''){
		tmp = Number(vQCUM)+ Number(vDTM);	
		vCUM.value =tmp.toFixed(2);
	}
	
	
}

function pageReload(){
	location.reload(true);
}

function show_confirm()
{
var r=confirm("Are You Sure!");
if (r==true)
  {
  alert("Click Ok to Insert Data!");
  }
else
  {
  location.reload(true);
  }
}


function fnCalCum(vDTM,vQCUM,vCUM,vPreDTM)//o,v,o
{
 
//bud_cyfwdfrm_utz_month,bud_cyfwdfrm_utz_cumulative
	//if(isNan(vDTM.value)){
	if(vDTM.value==''){
	} 
	else{
	//vCUM.value = (eval(vQCUM)-eval(vPreDTM))+ eval(vDTM);
		//var tmp = eval(vQCUM)+eval(vDTM.value);
		var tmp = (eval(vQCUM)-eval(vPreDTM))+eval(vDTM.value);
		vCUM.value = tmp.toFixed(2);
	}
}



function formValidator(){
	var numericExpression = /^[0-9]+$/;
	var decimalExpression1=/^-?\d+(\.\d+)?$/;
	var decimalExpression=/^((\d+(\.\d*)?)|((\d*\.)?\d+))$/;	
//***********Budget */
//Carry Forward      
	if (!document.getElementById('sensitization_programme_wto_Programmes').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('sensitization_programme_wto_Programmes').focus();
                 return false;
      }
	  if (!document.getElementById('sensitization_programme_wto_Participants').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('sensitization_programme_wto_Participants').focus();
                 return false;
      }
	  if (!document.getElementById('awareness_Bio_Programmes').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('awareness_Bio_Programmes').focus();
                 return false;
      }
	  if (!document.getElementById('awareness_Bio_Participants').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('awareness_Bio_Participants').focus();
                 return false;
      }
	   if (!document.getElementById('exports_Programmes').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('exports_Programmes').focus();
                 return false;
      }
	   
	    if (!document.getElementById('exports_Participants').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('exports_Participants').focus();
                 return false;
      }
	    if (!document.getElementById('bar_coding_Programmes').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('bar_coding_Programmes').focus();
                 return false;
      }
	   
	    if (!document.getElementById('bar_coding_Participants').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('bar_coding_Participants').focus();
                 return false;
      }
	   	    if (!document.getElementById('cluster_Programmes').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cluster_Programmes').focus();
                 return false;
      }
	   
	    if (!document.getElementById('cluster_Participants').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cluster_Participants').focus();
                 return false;
      }
	   if (!document.getElementById('tequp').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('tequp').focus();
                 return false;
      }
	   
	    if (!document.getElementById('tequp1').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('tequp1').focus();
                 return false;
      }
	  if (!document.getElementById('IPR_Programmes').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('IPR_Programmes').focus();
                 return false;
      }
	   
	    if (!document.getElementById('IPR_Participants').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('IPR_Participants').focus();
                 return false;
      }
	   if (!document.getElementById('awareness_TEQUP_Programmes').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('awareness_TEQUP_Programmes').focus();
                 return false;
      }
	   
	    if (!document.getElementById('awareness_TEQUP_Participants').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('awareness_TEQUP_Participants').focus();
                 return false;
      }
	   if (!document.getElementById('awareness_CLCSS_Programmes').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('awareness_CLCSS_Programmes').focus();
                 return false;
      }
	   
	    if (!document.getElementById('awareness_CLCSS_Participants').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('awareness_CLCSS_Participants').focus();
                 return false;
      }
	   if (!document.getElementById('seminar_VSBK_Programmes').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('seminar_VSBK_Programmes').focus();
                 return false;
      }
	   
	    if (!document.getElementById('seminar_VSBK_Participants').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('seminar_VSBK_Participants').focus();
                 return false;
      }
	  	if (!document.getElementById('cum_sensitization_programme_wto_Programmes').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_sensitization_programme_wto_Programmes').focus();
                 return false;
      }
	  if (!document.getElementById('cum_sensitization_programme_wto_Participants').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_sensitization_programme_wto_Participants').focus();
                 return false;
      }
	  if (!document.getElementById('cum_awareness_Bio_Programmes').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_awareness_Bio_Programmes').focus();
                 return false;
      }
	  if (!document.getElementById('cum_awareness_Bio_Participants').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_awareness_Bio_Participants').focus();
                 return false;
      }
	   if (!document.getElementById('cum_exports_Programmes').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_exports_Programmes').focus();
                 return false;
      }
	   
	    if (!document.getElementById('cum_exports_Participants').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_exports_Participants').focus();
                 return false;
      }
	    if (!document.getElementById('cum_bar_coding_Programmes').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_bar_coding_Programmes').focus();
                 return false;
      }
	   
	    if (!document.getElementById('cum_bar_coding_Participants').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_bar_coding_Participants').focus();
                 return false;
      }
	   	    if (!document.getElementById('cum_cluster_Programmes').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_cluster_Programmes').focus();
                 return false;
      }
	   
	    if (!document.getElementById('cum_cluster_Participants').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_cluster_Participants').focus();
                 return false;
      }
	   if (!document.getElementById('cum_TEQUP_Programmes').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_TEQUP_Programmes').focus();
                 return false;
      }
	   
	    if (!document.getElementById('cum_TEQUP_Participants').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_TEQUP_Participants').focus();
                 return false;
      }
	  if (!document.getElementById('cum_IPR_Programmes').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_IPR_Programmes').focus();
                 return false;
      }
	   
	    if (!document.getElementById('cum_IPR_Participants').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_IPR_Participants').focus();
                 return false;
      }
	   if (!document.getElementById('cum_awareness_TEQUP_Programmes').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_awareness_TEQUP_Programmes').focus();
                 return false;
      }
	   
	    if (!document.getElementById('cum_awareness_TEQUP_Participants').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_awareness_TEQUP_Participants').focus();
                 return false;
      }
	   if (!document.getElementById('cum_awareness_CLCSS_Programmes').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_awareness_CLCSS_Programmes').focus();
                 return false;
      }
	   
	    if (!document.getElementById('cum_awareness_CLCSS_Participants').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_awareness_CLCSS_Participants').focus();
                 return false;
      }
	   if (!document.getElementById('cum_seminar_VSBK_Programmes').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_seminar_VSBK_Programmes').focus();
                 return false;
      }
	   
	    if (!document.getElementById('cum_Seminar_VSBKP_Participants').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_Seminar_VSBKP_Participants').focus();
                 return false;
      }
	  if (!document.getElementById('sensitization_programme_wto_target').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('sensitization_programme_wto_target').focus();
                 return false;
      }
	   if (!document.getElementById('awareness_Bio_target').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('awareness_Bio_target').focus();
                 return false;
      }
	   
	    if (!document.getElementById('exports_target').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('exports_target').focus();
                 return false;
      }
	  if (!document.getElementById('bar_coding_target').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('bar_coding_target').focus();
                 return false;
      }
	   
	    if (!document.getElementById('cluster_target').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cluster_target').focus();
                 return false;
      }
	   if (!document.getElementById('tEQUPtarget').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('tEQUPtarget').focus();
                 return false;
      }
	   
	    if (!document.getElementById('IPR_target').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('IPR_target').focus();
                 return false;
      }
	   if (!document.getElementById('awareness_TEQUP_target').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('awareness_TEQUP_target').focus();
                 return false;
      }
	   
	    if (!document.getElementById('awareness_CLCSS_target').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('awareness_CLCSS_target').focus();
                 return false;
      }
	   if (!document.getElementById('seminar_VSBK_target').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('seminar_VSBK_target').focus();
                 return false;
      }
	   
	
	
	
	
	
	
	
	
	
        
	if (document.getElementById('instId').value=='')
      {
	      //instId userName months years
	      alert("Session Expired!");
				 //document.getElementById('stf_st_pos_d').focus();
				 return false;
	 }
	
	  
	alert("Are You Sure");
	  formSubmit();
}
</script>
<script type="text/javascript">
            function submitForm()
            {
                document.forms[0].action = "SpecialprogrammesAction.do?method=add";
                document.forms[0].submit();
            }
        </script>
</head>

<body bgcolor="#FBFBFB">
<html:form action="SpecialprogrammesAction" onsubmit="return formValidator()">
<%String mnm = request.getParameter("mnm");
String instId=(String)session.getAttribute("CmbIns");
 String role=(String)session.getAttribute("rol");
//String instId=(String)session.getAttribute("CmbIns");
String years=(String)session.getAttribute("CmbYear");
String months=(String)session.getAttribute("CmbMonth");
String user=(String)session.getAttribute("user");
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
	//	tYears = tYears-1;
		flag1=1;
		%>
		<input type="hidden" size="5" name="user_date" value='<%=years%>-<%=months%>-20' />
		<%
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




String strCumulative=" SELECT sum(sensitization_programme_wto_Programmes),sum(sensitization_programme_wto_Participants),sum(awareness_Bio_Programmes),sum(awareness_Bio_Participants),sum(exports_Programmes),sum(exports_Participants),sum(bar_coding_Programmes),sum(bar_coding_Participants),sum(cluster_Programmes),sum(cluster_Participants),sum(IPR_Programmes),sum(IPR_Participants),sum(awareness_TEQUP_Programmes),sum(awareness_TEQUP_Participants),sum(TEQUP_Participants),sum(TEQUP_Programmes),sum(awareness_CLCSS_Programmes),sum(awareness_CLCSS_Participants),sum(seminar_VSBK_Programmes),sum(seminar_VSBK_Participants) FROM tbl_special_program where months >=1 AND months <="+months+" and year='"+years+"' and instid='"+instId+"'";
 
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
	       cum_mon1=rsCumulative.getDouble("sum(sensitization_programme_wto_Programmes)");
	       cum_mon2=rsCumulative.getDouble("sum(sensitization_programme_wto_Participants)");
		   
		  cum_mon3=rsCumulative.getDouble("sum(awareness_Bio_Programmes)");
	       cum_mon4=rsCumulative.getDouble("sum(awareness_Bio_Participants)");
		   
		   cum_mon5=rsCumulative.getDouble("sum(exports_Programmes)");
	       cum_mon6=rsCumulative.getDouble("sum(exports_Participants)");
		   
		   cum_mon7=rsCumulative.getDouble("sum(bar_coding_Programmes)");
	       cum_mon8=rsCumulative.getDouble("sum(bar_coding_Participants)");
		   
		   cum_mon9=rsCumulative.getDouble("sum(cluster_Programmes)");
	       cum_mon10=rsCumulative.getDouble("sum(cluster_Participants)");
		   
			 cum_mon11=rsCumulative.getDouble("sum(TEQUP_Programmes)");
	       cum_mon12=rsCumulative.getDouble("sum(TEQUP_Participants)");
		   
		    cum_mon13=rsCumulative.getDouble("sum(IPR_Programmes)");
	       cum_mon14=rsCumulative.getDouble("sum(IPR_Participants)");
		   
		    cum_mon15=rsCumulative.getDouble("sum(awareness_TEQUP_Programmes)");
	       cum_mon16=rsCumulative.getDouble("sum(awareness_TEQUP_Participants)");
		   
		      cum_mon17=rsCumulative.getDouble("sum(awareness_CLCSS_Programmes)");
	       cum_mon18=rsCumulative.getDouble("sum(awareness_CLCSS_Participants)");
		   
		    cum_mon19=rsCumulative.getDouble("sum(seminar_VSBK_Programmes)");
	       cum_mon20=rsCumulative.getDouble("sum(seminar_VSBK_Participants)");
         	flag++;
	      }
	      System.out.println("flag"+flag);







String strQuery = "SELECT * FROM tbl_pms_target WHERE year='"+years+"' AND   Inst_Id='"+instId+"'"; 
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

<br><table align="center">
<div style="font-size:large;font-family:Verdana;font-weight:bold" align="center"><font color="#990000">  <%=rs_instName.getString("INST_NAME")%> </font></div>
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
<div style="font-size:large;font-family:Verdana;font-weight:bold;  " align="center" ><font color="#990000"> Monthly Progress Report Of Special Programmes  in the Month <%=rs_month.getString("mon")%></font></div>
<br /><br />

<input type="hidden" size="5" name="months" value="<%=request.getParameter("months")%>" />
<input type="hidden" size="5" name="years" value="<%=request.getParameter("years")%>" />
<input type="hidden" size="5" name="instId" value="<%=request.getParameter("instId")%>" />
<input type="hidden" size="5" name="user_date" value='<%=years%>-<%=months%>-20' />


<table width="100%" border="0" align="center" >

  <tr  >
    <td width="34" rowspan="2" class="tableheader">S.No</td>
    <td width="321" rowspan="2" class="tableheader">Name Of Program </td>
	  <td width="60" colspan="1" rowspan="2" class="tableheader">Target</td>
    <td colspan="1" class="tableheader">No of Programmes </td>
    <td colspan="1" class="tableheader">No .of Participants </td>
	 <td colspan="1" class="tableheader">No of Programmes </td>
	 <td colspan="1" class="tableheader">No .of Participants </td>
  </tr>
  <tr  >
    <td width="80" class="tableheader">During The month </td>
    <td width="74" class="tableheader">During The month </td>
    <td width="80" class="tableheader">up to the Month </td>
    <td width="74" class="tableheader">up to the Month</td>
  </tr>
  <%if(divFlag==0){%>
  <tr >
    <td class="tablecontent11" >1</td>
    <td class="tablecontent11" >Sensitization programme on WTO </td>
    <td class="tablecontent1"><input type="text" name="sensitization_programme_wto_target" id="sensitization_programme_wto_target" size="10"value='<%=fix_val1%>' /></td>
     <td class="tablecontent1"><input type="text" name="sensitization_programme_wto_Programmes" id="sensitization_programme_wto_Programmes"value="0" size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon1%>', cum_sensitization_programme_wto_Programmes)"/></td>
    <td class="tablecontent1"><input type="text" name="sensitization_programme_wto_Participants" id="sensitization_programme_wto_Participants"value="0"  size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon2%>', cum_sensitization_programme_wto_Participants)"/></td>
   <td class="tablecontent1"><input type="text" name="cum_sensitization_programme_wto_Programmes" id="cum_sensitization_programme_wto_Programmes" size="10"value='<%=cum_mon1%>'/></td>
   <td class="tablecontent1"><input type="text" name="cum_sensitization_programme_wto_Participants" id="cum_sensitization_programme_wto_Participants" size="10"value='<%=cum_mon2%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent12" >2</td>
    <td class="tablecontent12" >Awareness Programme on Bio Technology </td>
     <td class="tablecontent2"><input type="text" name="awareness_Bio_target" id="awareness_Bio_target" size="10"value='<%=fix_val2%>'/></td>
    <td class="tablecontent2"><input type="text" name="awareness_Bio_Programmes" id="awareness_Bio_Programmes"value="0"  size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon3%>', cum_awareness_Bio_Programmes)"/></td>
   <td class="tablecontent2"><input type="text" name="awareness_Bio_Participants" id="awareness_Bio_Participants" value="0" size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon4%>', cum_awareness_Bio_Participants)"/></td>
     <td class="tablecontent2"><input type="text" name="cum_awareness_Bio_Programmes" id="cum_awareness_Bio_Programmes" size="10"value='<%=cum_mon3%>'/></td>
    <td class="tablecontent2"><input type="text" name="cum_awareness_Bio_Participants" id="cum_awareness_Bio_Participants" size="10"value='<%=cum_mon4%>'/></td>
  </tr>
  <tr  >
    <td class="tablecontent11" >3</td>
    <td class="tablecontent11" >Programmes on Packaging for Exports </td>
    <td class="tablecontent1"><input type="text" name="exports_target" id="exports_target" size="10"value='<%=fix_val3%>'/></td>
     <td class="tablecontent1"><input type="text" name="exports_Programmes" id="exports_Programmes"value="0"  size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon5%>', cum_exports_Programmes)"/></td>
   <td class="tablecontent1"><input type="text" name="exports_Participants" id="exports_Participants"value="0"  size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', cum_exports_Participants)"/></td>
    <td class="tablecontent1"><input type="text" name="cum_exports_Programmes" id="cum_exports_Programmes" size="10"value='<%=cum_mon5%>'/></td>
    <td class="tablecontent1"><input type="text" name="cum_exports_Participants" id="cum_exports_Participants" size="10"value='<%=cum_mon6%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent12" >4</td>
    <td class="tablecontent12" >Programmes on Bar coding </td>
     <td class="tablecontent2"><input type="text" name="bar_coding_target" id="bar_coding_target" size="10"value='<%=fix_val4%>'/></td>
     <td class="tablecontent2"><input type="text" name="bar_coding_Programmes" id="bar_coding_Programmes"value="0"  size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon7%>', cum_bar_coding_Programmes)"/></td>
   <td class="tablecontent2"><input type="text" name="bar_coding_Participants" id="bar_coding_Participants"value="0"  size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon8%>', cum_bar_coding_Participants)"/></td>
    <td class="tablecontent2"><input type="text" name="cum_bar_coding_Programmes" id="cum_bar_coding_Programmes" size="10"value='<%=cum_mon7%>'/></td>
    <td class="tablecontent2"><input type="text" name="cum_bar_coding_Participants" id="cum_bar_coding_Participants" size="10"value='<%=cum_mon8%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent11">5</td>
    <td  class="tablecontent11">Awareness Programme on Cluster </td>
    <td class="tablecontent1"><input type="text" name="cluster_target" id="cluster_target" size="10"value='<%=fix_val5%>'/></td>
    <td class="tablecontent1"><input type="text" name="cluster_Programmes" id="cluster_Programmes"value="0"  size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon9%>', cum_cluster_Programmes)"/></td>
   <td class="tablecontent1"><input type="text" name="cluster_Participants" id="cluster_Participants" value="0" size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon10%>', cum_cluster_Participants)"/></td>
    <td class="tablecontent1"><input type="text" name="cum_cluster_Programmes" id="cum_cluster_Programmes" size="10"value='<%=cum_mon9%>'/></td>
    <td class="tablecontent1"><input type="text" name="cum_cluster_Participants" id="cum_cluster_Participants" size="10"value='<%=cum_mon10%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent12" >6</td>
    <td class="tablecontent12" >Awareness Programme on credit Guarntee Scheme</td>
     <td class="tablecontent2"><input type="text" name="tEQUPtarget" id="tEQUPtarget" size="10"value='<%=fix_val6%>'/></td>
    <td class="tablecontent2"><input type="text" name="tequp" id="tequp"value="0"  size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon11%>', cum_TEQUP_Programmes)"/></td>
    <td class="tablecontent2"><input type="text" name="tequp1" id="tequp1"value="0"  size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon12%>', cum_TEQUP_Participants)"/></td>
    <td class="tablecontent2"><input type="text" name="cum_TEQUP_Programmes" id="cum_TEQUP_Programmes" size="10"value='<%=cum_mon11%>'/></td>
    <td class="tablecontent2"><input type="text" name="cum_TEQUP_Participants" id="cum_TEQUP_Participants" size="10"value='<%=cum_mon12%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent11" >7</td>
    <td class="tablecontent11" >Sensitization programme on IPR</td>
    <td class="tablecontent1"><input type="text" name="IPR_target" id="IPR_target" size="10"value='<%=fix_val7%>'/></td>
  <td class="tablecontent1"><input type="text" name="IPR_Programmes" id="IPR_Programmes" value="0" size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon13%>', cum_IPR_Programmes)"/></td>
    <td class="tablecontent1"><input type="text" name="IPR_Participants" id="IPR_Participants"value="0"  size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon14%>', cum_IPR_Participants)"/></td>
     <td class="tablecontent1"><input type="text" name="cum_IPR_Programmes" id="cum_IPR_Programmes" size="10"value='<%=cum_mon13%>'/></td>
     <td class="tablecontent1"><input type="text" name="cum_IPR_Participants" id="cum_IPR_Participants" size="10"value='<%=cum_mon14%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent12" >8</td>
    <td class="tablecontent12" >Awareness Programme on TEQUP</td>
     <td class="tablecontent2"><input type="text" name="awareness_TEQUP_target" id="awareness_TEQUP_target" size="10"value='<%=fix_val8%>'/></td>
    <td class="tablecontent2"><input type="text" name="awareness_TEQUP_Programmes" id="awareness_TEQUP_Programmes"value="0"  size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon15%>', cum_awareness_TEQUP_Programmes)"/></td>
    <td class="tablecontent2"><input type="text" name="awareness_TEQUP_Participants" id="awareness_TEQUP_Participants" value="0" size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon16%>', cum_awareness_TEQUP_Participants)"/></td>
   <td class="tablecontent2"><input type="text" name="cum_awareness_TEQUP_Programmes" id="cum_awareness_TEQUP_Programmes" size="10"value='<%=cum_mon15%>'/></td>
   <td class="tablecontent2"><input type="text" name="cum_awareness_TEQUP_Participants" id="cum_awareness_TEQUP_Participants" size="10"value='<%=cum_mon16%>'/></td>
  </tr>
   <tr >
    <td class="tablecontent11" >9</td>
    <td class="tablecontent11" >Awareness Programme on CLCSS</td>
     <td class="tablecontent1"><input type="text" name="awareness_CLCSS_target" id="awareness_CLCSS_target" size="10"value='<%=fix_val10%>'/></td>
    <td class="tablecontent1"><input type="text" name="awareness_CLCSS_Programmes" id="awareness_CLCSS_Programmes" value="0"  size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon17%>', cum_awareness_CLCSS_Programmes)"/></td>
    <td class="tablecontent1"><input type="text" name="awareness_CLCSS_Participants" id="awareness_CLCSS_Participants"value="0"  size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon18%>', cum_awareness_CLCSS_Participants)"/></td>
   <td class="tablecontent1"><input type="text" name="cum_awareness_CLCSS_Programmes" id="cum_awareness_CLCSS_Programmes" size="10"value='<%=cum_mon17%>'/></td>
   <td class="tablecontent1"><input type="text" name="cum_awareness_CLCSS_Participants" id="cum_awareness_CLCSS_Participants" size="10"value='<%=cum_mon18%>'/></td>
  </tr>
   <tr >
    <td class="tablecontent12" >10</td>
    <td class="tablecontent12" >Seminar on VSBK</td>
     <td class="tablecontent2"><input type="text" name="seminar_VSBK_target" id="seminar_VSBK_target" size="10"value='<%=fix_val9%>'/></td>
    <td class="tablecontent2"><input type="text" name="seminar_VSBK_Programmes" id="seminar_VSBK_Programmes" value="0"  size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon19%>', cum_seminar_VSBK_Programmes)"/></td>
    <td class="tablecontent2"><input type="text" name="seminar_VSBK_Participants" id="seminar_VSBK_Participants"value="0"   size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon20%>', cum_Seminar_VSBKP_Participants)"/></td>
   <td class="tablecontent2"><input type="text" name="cum_seminar_VSBK_Programmes" id="cum_seminar_VSBK_Programmes" size="10"value='<%=cum_mon19%>'/></td>
   <td class="tablecontent2"><input type="text" name="cum_Seminar_VSBKP_Participants" id="cum_Seminar_VSBKP_Participants" size="10"value='<%=cum_mon20%>'/></td>
  </tr>
     <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_special_program WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>

 <tr >
    <td class="tablecontent11" >1</td>
    <td class="tablecontent11"  >Sensitization programme on WTO </td>
    <td class="tablecontent1"><input type="text" name="sensitization_programme_wto_target" id="sensitization_programme_wto_target" size="10"value='<%=fix_val1%>'/></td>
     <td class="tablecontent1"><input type="text" name="sensitization_programme_wto_Programmes" id="sensitization_programme_wto_Programmes" size="10"value='<%=rsAdminResult.getString("sensitization_programme_wto_Programmes")%>'onBlur="fnCalCum(sensitization_programme_wto_Programmes,'<%=cum_mon1%>',cum_sensitization_programme_wto_Programmes ,'<%=rsAdminResult.getString("sensitization_programme_wto_Programmes")%>')"/></td>
    <td class="tablecontent1"><input type="text" name="sensitization_programme_wto_Participants" id="sensitization_programme_wto_Participants" size="10"value='<%=rsAdminResult.getString("sensitization_programme_wto_Participants")%>'onBlur="fnCalCum(sensitization_programme_wto_Participants,'<%=cum_mon2%>',cum_sensitization_programme_wto_Participants ,'<%=rsAdminResult.getString("sensitization_programme_wto_Participants")%>')"/></td>
   <td class="tablecontent1"><input type="text" name="cum_sensitization_programme_wto_Programmes" id="cum_sensitization_programme_wto_Programmes" size="10"value='<%=cum_mon1%>'/></td>
   <td class="tablecontent1"><input type="text" name="cum_sensitization_programme_wto_Participants" id="cum_sensitization_programme_wto_Participants" size="10"value='<%=cum_mon2%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent12" >2</td>
    <td class="tablecontent12" >Awareness Programme on Bio Technology </td>
     <td class="tablecontent2"><input type="text" name="awareness_Bio_target" id="awareness_Bio_target" size="10"value='<%=fix_val2%>'/></td>
    <td class="tablecontent2"><input type="text" name="awareness_Bio_Programmes" id="awareness_Bio_Programmes" size="10"value='<%=rsAdminResult.getString("awareness_Bio_Programmes")%>'onBlur="fnCalCum(awareness_Bio_Programmes,'<%=cum_mon3%>',cum_awareness_Bio_Programmes ,'<%=rsAdminResult.getString("awareness_Bio_Programmes")%>')"/></td>
   <td class="tablecontent2"><input type="text" name="awareness_Bio_Participants" id="awareness_Bio_Participants" size="10"value='<%=rsAdminResult.getString("awareness_Bio_Participants")%>'onBlur="fnCalCum(awareness_Bio_Participants,'<%=cum_mon4%>',cum_awareness_Bio_Participants ,'<%=rsAdminResult.getString("awareness_Bio_Participants")%>')"/></td>
     <td class="tablecontent2"><input type="text" name="cum_awareness_Bio_Programmes" id="cum_awareness_Bio_Programmes" size="10"value='<%=cum_mon3%>'/></td>
    <td class="tablecontent2"><input type="text" name="cum_awareness_Bio_Participants" id="cum_awareness_Bio_Participants" size="10"value='<%=cum_mon4%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent11" >3</td>
    <td class="tablecontent11" >Programmes on Packaging for Exports </td>
    <td class="tablecontent1"><input type="text" name="exports_target" id="exports_target" size="10"value='<%=fix_val3%>'/></td>
     <td class="tablecontent1"><input type="text" name="exports_Programmes" id="exports_Programmes" size="10"value='<%=rsAdminResult.getString("exports_Programmes")%>'onBlur="fnCalCum(exports_Programmes,'<%=cum_mon5%>',cum_exports_Programmes ,'<%=rsAdminResult.getString("exports_Programmes")%>')"/></td>
   <td class="tablecontent1"><input type="text" name="exports_Participants" id="exports_Participants" size="10"value='<%=rsAdminResult.getString("exports_Participants")%>'onBlur="fnCalCum(exports_Participants,'<%=cum_mon6%>',cum_exports_Participants ,'<%=rsAdminResult.getString("exports_Participants")%>')"/></td>
    <td class="tablecontent1"><input type="text" name="cum_exports_Programmes" id="cum_exports_Programmes" size="10"value='<%=cum_mon5%>'/></td>
    <td class="tablecontent1"><input type="text" name="cum_exports_Participants" id="cum_exports_Participants" size="10"value='<%=cum_mon6%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent12" >4</td>
    <td class="tablecontent12" >Programmes on Bar coding </td>
     <td class="tablecontent2"><input type="text" name="bar_coding_target" id="bar_coding_target" size="10"value='<%=fix_val4%>'/></td>
     <td class="tablecontent2"><input type="text" name="bar_coding_Programmes" id="bar_coding_Programmes" size="10"value='<%=rsAdminResult.getString("bar_coding_Programmes")%>'onBlur="fnCalCum(bar_coding_Programmes,'<%=cum_mon7%>',cum_bar_coding_Programmes ,'<%=rsAdminResult.getString("bar_coding_Programmes")%>')"/></td>
   <td class="tablecontent2"><input type="text" name="bar_coding_Participants" id="bar_coding_Participants" size="10"value='<%=rsAdminResult.getString("bar_coding_Participants")%>'onBlur="fnCalCum(bar_coding_Participants,'<%=cum_mon8%>',cum_bar_coding_Participants ,'<%=rsAdminResult.getString("bar_coding_Participants")%>')"/></td>
    <td class="tablecontent2"><input type="text" name="cum_bar_coding_Programmes" id="cum_bar_coding_Programmes" size="10"value='<%=cum_mon7%>'/></td>
    <td class="tablecontent2"><input type="text" name="cum_bar_coding_Participants" id="cum_bar_coding_Participants" size="10"value='<%=cum_mon8%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent11" >5</td>
    <td class="tablecontent11" >Awareness Programme on Cluster </td>
    <td class="tablecontent1"><input type="text" name="cluster_target" id="cluster_target" size="10"value='<%=fix_val5%>'/></td>
    <td class="tablecontent1"><input type="text" name="cluster_Programmes" id="cluster_Programmes" size="10"value='<%=rsAdminResult.getString("cluster_Programmes")%>'onBlur="fnCalCum(cluster_Programmes,'<%=cum_mon9%>',cum_cluster_Programmes ,'<%=rsAdminResult.getString("cluster_Programmes")%>')"/></td>
   <td class="tablecontent1"><input type="text" name="cluster_Participants" id="cluster_Participants" size="10"value='<%=rsAdminResult.getString("cluster_Participants")%>'onBlur="fnCalCum(cluster_Participants,'<%=cum_mon10%>',cum_cluster_Participants ,'<%=rsAdminResult.getString("cluster_Participants")%>')"/></td>
    <td class="tablecontent1"><input type="text" name="cum_cluster_Programmes" id="cum_cluster_Programmes" size="10"value='<%=cum_mon9%>'/></td>
    <td class="tablecontent1"><input type="text" name="cum_cluster_Participants" id="cum_cluster_Participants" size="10"value='<%=cum_mon10%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent12" >6</td>
    <td  class="tablecontent12">Awareness Programme on credit Guarntee Scheme</td>
     <td class="tablecontent2"><input type="text" name="tEQUPtarget" id="tEQUPtarget" size="10"value='<%=fix_val6%>'/></td>
    <td class="tablecontent2"><input type="text" name="tequp" id="tequp" size="10"value='<%=rsAdminResult.getString("TEQUP_Programmes")%>'onBlur="fnCalCum(TEQUP_Programmes,'<%=cum_mon11%>',cum_TEQUP_Programmes ,'<%=rsAdminResult.getString("TEQUP_Programmes")%>')"/></td>
    <td class="tablecontent2"><input type="text" name="tequp1" id="tequp1" size="10"value='<%=rsAdminResult.getString("TEQUP_Participants")%>'onBlur="fnCalCum(TEQUP_Participants,'<%=cum_mon12%>',cum_TEQUP_Participants ,'<%=rsAdminResult.getString("TEQUP_Participants")%>')"/></td>
    <td class="tablecontent2"><input type="text" name="cum_TEQUP_Programmes" id="cum_TEQUP_Programmes" size="10"value='<%=cum_mon11%>'/></td>
    <td class="tablecontent2"><input type="text" name="cum_TEQUP_Participants" id="cum_TEQUP_Participants" size="10"value='<%=cum_mon12%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent11" >7</td>
    <td class="tablecontent11" >Sensitization programme on IPR</td>
    <td class="tablecontent1"><input type="text" name="IPR_target" id="IPR_target" size="10"value='<%=fix_val7%>'/></td>
  <td class="tablecontent1"><input type="text" name="IPR_Programmes" id="IPR_Programmes" size="10"value='<%=rsAdminResult.getString("IPR_Programmes")%>'onBlur="fnCalCum(IPR_Programmes,'<%=cum_mon13%>',cum_IPR_Programmes ,'<%=rsAdminResult.getString("IPR_Programmes")%>')"/></td>
    <td class="tablecontent1"><input type="text" name="IPR_Participants" id="IPR_Participants" size="10"value='<%=rsAdminResult.getString("IPR_Participants")%>'onBlur="fnCalCum(IPR_Participants,'<%=cum_mon14%>',cum_IPR_Participants ,'<%=rsAdminResult.getString("IPR_Participants")%>')"/></td>
     <td class="tablecontent1"><input type="text" name="cum_IPR_Programmes" id="cum_IPR_Programmes" size="10"value='<%=cum_mon13%>'/></td>
     <td class="tablecontent1"><input type="text" name="cum_IPR_Participants" id="cum_IPR_Participants" size="10"value='<%=cum_mon14%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent12" >8</td>
    <td class="tablecontent12" >Awareness Programme on TEQUP</td>
     <td class="tablecontent2"><input type="text" name="awareness_TEQUP_target" id="awareness_TEQUP_target" size="10"value='<%=fix_val8%>'/></td>
    <td class="tablecontent2"><input type="text" name="awareness_TEQUP_Programmes" id="awareness_TEQUP_Programmes" size="10"value='<%=rsAdminResult.getString("awareness_TEQUP_Programmes")%>'onBlur="fnCalCum(awareness_TEQUP_Programmes,'<%=cum_mon15%>',cum_awareness_TEQUP_Programmes ,'<%=rsAdminResult.getString("awareness_TEQUP_Programmes")%>')"/></td>
    <td class="tablecontent2"><input type="text" name="awareness_TEQUP_Participants" id="awareness_TEQUP_Participants" size="10"value='<%=rsAdminResult.getString("awareness_TEQUP_Participants")%>'onBlur="fnCalCum(awareness_TEQUP_Participants,'<%=cum_mon16%>',cum_awareness_TEQUP_Participants ,'<%=rsAdminResult.getString("awareness_TEQUP_Participants")%>')"/></td>
   <td class="tablecontent2"><input type="text" name="cum_awareness_TEQUP_Programmes" id="cum_awareness_TEQUP_Programmes" size="10"value='<%=cum_mon15%>'/></td>
   <td class="tablecontent2"><input type="text" name="cum_awareness_TEQUP_Participants" id="cum_awareness_TEQUP_Participants" size="10"value='<%=cum_mon16%>'/></td>
  </tr>
 <tr >
    <td class="tablecontent11" >9</td>
    <td class="tablecontent11" >Awareness Programme on CLCSS</td>
     <td class="tablecontent1"><input type="text" name="awareness_CLCSS_target" id="awareness_CLCSS_target" size="10"value='<%=fix_val10%>'/></td>
    <td class="tablecontent1"><input type="text" name="awareness_CLCSS_Programmes" id="awareness_CLCSS_Programmes" size="10"value='<%=rsAdminResult.getString("awareness_CLCSS_Programmes")%>'onBlur="fnCalCum(awareness_CLCSS_Programmes,'<%=cum_mon17%>',cum_awareness_CLCSS_Programmes ,'<%=rsAdminResult.getString("awareness_CLCSS_Programmes")%>')"/></td>
    <td class="tablecontent1"><input type="text" name="awareness_CLCSS_Participants" id="awareness_CLCSS_Participants" size="10"value='<%=rsAdminResult.getString("awareness_CLCSS_Participants")%>'onBlur="fnCalCum(awareness_CLCSS_Participants,'<%=cum_mon18%>',cum_awareness_CLCSS_Participants ,'<%=rsAdminResult.getString("awareness_CLCSS_Participants")%>')"/></td>
   <td class="tablecontent1"><input type="text" name="cum_awareness_CLCSS_Programmes" id="cum_awareness_CLCSS_Programmes" size="10"value='<%=cum_mon17%>'/></td>
   <td class="tablecontent1"> <input type="text" name="cum_awareness_CLCSS_Participants" id="cum_awareness_CLCSS_Participants" size="10"value='<%=cum_mon18%>'/></td>
  </tr>
   <tr >
    <td class="tablecontent12" >10</td>
    <td class="tablecontent12" >Seminar on VSBK</td>
     <td class="tablecontent2"><input type="text" name="seminar_VSBK_target" id="seminar_VSBK_target" size="10"value='<%=fix_val9%>'/></td>
    <td class="tablecontent2"><input type="text" name="seminar_VSBK_Programmes" id="seminar_VSBK_Programmes" size="10"value='<%=rsAdminResult.getString("seminar_VSBK_Programmes")%>'onBlur="fnCalCum(seminar_VSBK_Programmes,'<%=cum_mon19%>',cum_seminar_VSBK_Programmes ,'<%=rsAdminResult.getString("seminar_VSBK_Programmes")%>')"/></td>
    <td class="tablecontent2"><input type="text" name="seminar_VSBK_Participants" id="seminar_VSBK_Participants" size="10"value='<%=rsAdminResult.getString("seminar_VSBK_Participants")%>'onBlur="fnCalCum(seminar_VSBK_Participants,'<%=cum_mon20%>',cum_Seminar_VSBKP_Participants ,'<%=rsAdminResult.getString("seminar_VSBK_Participants")%>')"/></td>
   <td class="tablecontent2"><input type="text" name="cum_seminar_VSBK_Programmes" id="cum_seminar_VSBK_Programmes" size="10"value='<%=cum_mon19%>'/></td>
   <td class="tablecontent2"><input type="text" name="cum_Seminar_VSBKP_Participants" id="cum_Seminar_VSBKP_Participants" size="10"value='<%=cum_mon20%>'/></td>
  </tr>
<% }%>
</table>



 <div align="center">
<%
if(role.equalsIgnoreCase("SU") && buttonFlag==0){%>
<html:submit value="Add" onclick="submitForm()" />
<%}else{%>
<html:submit property="method" value="click_to_Enter" /> &nbsp;
<%}%>
<input class="butt" type="button" name="reset" value="Reset" tabindex="18" onclick="pageReload()"/>&nbsp;
<input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
</html:form>
</body></html>
