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
	 if (!document.getElementById('Monthly_Achievment_new').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('Monthly_Achievment_new').focus();
                 return false;
      } if (!document.getElementById('Monthly_Achievment_updated').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('Monthly_Achievment_updated').focus();
                 return false;
      }
	  if (!document.getElementById('state_industrial_Achievment').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('state_industrial_Achievment').focus();
                 return false;
      }
	  
	    if (!document.getElementById('Distict_Potenial_Achievment').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('Distict_Potenial_Achievment').focus();
                 return false;
      }
	 
	  if (!document.getElementById('Survey_Report_Achievment').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('Survey_Report_Achievment').focus();
                 return false;
      }
	 
	    if (!document.getElementById('Status_Report_Achievment').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('Status_Report_Achievment').focus();
                 return false;
      }
	 
	    if (!document.getElementById('Technology_Study_Achievment').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('Technology_Study_Achievment').focus();
                 return false;
      }
	 
	    if (!document.getElementById('Trade_Directories_Achievment').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('Trade_Directories_Achievment').focus();
                 return false;
      }
	 
	    if (!document.getElementById('Training_Programme_Achievment').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('Training_Programme_Achievment').focus();
                 return false;
      }
	
	    if (!document.getElementById('Detail_Project_Achievment').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('Detail_Project_Achievment').focus();
                 return false;
      }
	  if (!document.getElementById('Project_Profiles_target_new').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('Project_Profiles_target_new').focus();
                 return false;
      } if (!document.getElementById('cum_Monthly_Achievment_new').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_Monthly_Achievment_new').focus();
                 return false;
      }
	  if (!document.getElementById('Project_Profiles_target_updated').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('Project_Profiles_target_updated').focus();
                 return false;
      }
	  
	    if (!document.getElementById('cum_Monthly_Achievment_updated').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_Monthly_Achievment_updated').focus();
                 return false;
      }
	 
	  if (!document.getElementById('state_industrial_target').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('state_industrial_target').focus();
                 return false;
      }
	 
	    if (!document.getElementById('cum_state_industrial_Achievment').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_state_industrial_Achievment').focus();
                 return false;
      }
	 
	    if (!document.getElementById('Distict_Potenial_target').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('Distict_Potenial_target').focus();
                 return false;
      }
	 
	    if (!document.getElementById('cum_Distict_Potenial_Achievment').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_Distict_Potenial_Achievment').focus();
                 return false;
      }
	 
	    if (!document.getElementById('Survey_Report_target').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('Survey_Report_target').focus();
                 return false;
      }
	
	    if (!document.getElementById('cum_Survey_Report_Achievment').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_Survey_Report_Achievment').focus();
                 return false;
      }
	  if (!document.getElementById('Status_Report_target').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('Status_Report_target').focus();
                 return false;
      } if (!document.getElementById('cum_Status_Report_Achievment').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_Status_Report_Achievment').focus();
                 return false;
      }
	  if (!document.getElementById('Technology_Study_target').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('Technology_Study_target').focus();
                 return false;
      }
	  
	    if (!document.getElementById('cum_Technology_Study_Achievment').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_Technology_Study_Achievment').focus();
                 return false;
      }
	 
	  if (!document.getElementById('Trade_Directories_target').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('Trade_Directories_target').focus();
                 return false;
      }
	 
	    if (!document.getElementById('cum_Trade_Directories_Achievment').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_Trade_Directories_Achievment').focus();
                 return false;
      }
	 
	    if (!document.getElementById('Training_Programme_target').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('Training_Programme_target').focus();
                 return false;
      }
	 
	    if (!document.getElementById('cum_Training_Programme_Achievment').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_Training_Programme_Achievment').focus();
                 return false;
      }
	 
	    if (!document.getElementById('Detail_Project_target').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('Detail_Project_target').focus();
                 return false;
      }
	
	    if (!document.getElementById('cum_Detail_Project_Achievment').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_Detail_Project_Achievment').focus();
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
                document.forms[0].action = "ReportAction.do?method=add";
                document.forms[0].submit();
            }
        </script>



</head>

<body bgcolor="#FBFBFB">
<html:form action="ReportAction" onsubmit="return formValidator()">
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
		//tYears = tYears-1;
		flag1=1;
		%>
		<input type="hidden" size="5" name="user_date" value='<%=years%>-<%=months%>-20' />
		<%
	
	}
Connection con = ConnectionManager.getConnectionDirectForMySQL();
Statement stmt4 = (Statement)con.createStatement();
 Statement stmt = (Statement)con.createStatement();
if(role.equalsIgnoreCase("AU")){	
		 String strSql = "select * from tbl_report where months =" + months +" and year='"+years+"' and instid='"+instId+"'";
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
String strSql = "SELECT * FROM tbl_report WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
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




String strCumulative=" SELECT sum(Monthly_Achievment_new),sum(Monthly_Achievment_updated),sum(state_industrial_Achievment),sum(Survey_Report_Achievment),sum(Status_Report_Achievment),sum(Technology_Study_Achievment),sum(Trade_Directories_Achievment),sum(Training_Programme_Achievment),sum(Detail_Project_Achievment),sum(Distict_Potenial_Achievment) FROM tbl_report where months >=1 AND months <="+months+" and year='"+years+"' and instid='"+instId+"'";

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







String strQuery = "SELECT * FROM tbl_pms_target WHERE year='"+years+"' AND   Inst_Id='"+instId+"'"; 
ResultSet rsTargetResult =stmt.executeQuery(strQuery);

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
			 fix_val10=rsTargetResult.getString("Indl_Potenial");
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
<br>
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
<div style="font-size:large;font-family:Verdana;font-weight:bold;  " align="center" ><font color="#990000"> Monthly Progress Report in the month <%=rs_month.getString("mon")%></font></div>

<br /><br />

<br> 


<input type="hidden" size="5" name="months" value="<%=request.getParameter("months")%>" />
<input type="hidden" size="5" name="years" value="<%=request.getParameter("years")%>" />
<input type="hidden" size="5" name="instId" value="<%=request.getParameter("instId")%>" />
<input type="hidden" size="5" name="user_date" value='<%=years%>-<%=months%>-20' />
<table width="90%" border="0" align="center" >
  <tr >
    <td width="22" class="tableheader">1</td>
    <td width="318" class="tableheader">Name Of Program </td>
    <td width="269"  class="tableheader">Target</td>
    <td colspan="1" class="tableheader">Monthly Achievment </td>
    <td colspan="1" class="tableheader">Cumlative Achievment </td>
  </tr>
    <%if(divFlag==0){%>
  <tr >
    <td class="tablecontent11">2</td>
    <td class="tablecontent11">Project Profiles (New) </td>
       <td class="tablecontent1"><input type="text" name="project_Profiles_target_new" id="Project_Profiles_target_new" size="15"value='<%=fix_val1%>' /></td>
   <td width="250" class="tablecontent1"><input type="text" name="monthly_Achievment_new" id="Monthly_Achievment_new" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon1%>', cum_Monthly_Achievment_new)"/></td>
   <td width="333" class="tablecontent1"><input type="text" name="cum_Monthly_Achievment_new" id="cum_Monthly_Achievment_new" size="15"value='<%=cum_mon1%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent12">3</td>
    <td class="tablecontent12" >Project Profiles (Updated) </td>
      <td class="tablecontent2"><input type="text" name="project_Profiles_target_updated" id="Project_Profiles_target_updated" size="15"value='<%=fix_val2%>'/></td>
   <td class="tablecontent2"><input type="text" name="monthly_Achievment_updated" id="Monthly_Achievment_updated" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon2%>', cum_Monthly_Achievment_updated)"/></td>
   <td class="tablecontent2"><input type="text" name="cum_Monthly_Achievment_updated" id="cum_Monthly_Achievment_updated" size="15"value='<%=cum_mon2%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent11">4</td>
    <td class="tablecontent11">State Industrial Profile</td>
       <td class="tablecontent1"><input type="text" name="state_industrial_target" id="state_industrial_target" size="15"value='<%=fix_val3%>'/></td>
   <td class="tablecontent1"><input type="text" name="state_industrial_Achievment" id="state_industrial_Achievment" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon3%>', cum_state_industrial_Achievment)"/></td>
   <td class="tablecontent1"><input type="text" name="cum_state_industrial_Achievment" id="cum_state_industrial_Achievment" size="15"value='<%=cum_mon3%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent12" >5</td>
    <td class="tablecontent12" > Distict Indl.Potenial </td>
   <td class="tablecontent2"><input type="text" name="distict_Potenial_target" id="Distict_Potenial_target" size="15"value='<%=fix_val10%>'/></td>
   <td class="tablecontent2"><input type="text" name="distict_Potenial_Achievment" id="Distict_Potenial_Achievment" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon9%>', cum_Distict_Potenial_Achievment)"/></td>
   <td class="tablecontent2"><input type="text" name="cum_Distict_Potenial_Achievment" id="cum_Distict_Potenial_Achievment" size="15"value='<%=cum_mon9%>'/></td>
  
  </tr>
  <tr >
    <td class="tablecontent11" >6</td>
    <td class="tablecontent11"> unit provided Intensive Technical Consultancy </td>
      <td class="tablecontent1"><input type="text" name="survey_Report_target" id="Survey_Report_target" size="15"value='<%=fix_val4%>'/></td>
   <td class="tablecontent1"><input type="text" name="survey_Report_Achievment" id="Survey_Report_Achievment" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon4%>', cum_Survey_Report_Achievment)"/></td>
   <td class="tablecontent1"><input type="text" name="cum_Survey_Report_Achievment" id="cum_Survey_Report_Achievment" size="15"value='<%=cum_mon4%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent12">7</td>
    <td class="tablecontent12">Status Report </td>
      <td class="tablecontent2"><input type="text" name="status_Report_target" id="Status_Report_target" size="15"value='<%=fix_val5%>'/></td>
   <td class="tablecontent2"><input type="text" name="status_Report_Achievment" id="Status_Report_Achievment" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon5%>', cum_Status_Report_Achievment)"/></td>
   <td class="tablecontent2"><input type="text" name="cum_Status_Report_Achievment" id="cum_Status_Report_Achievment" size="15"value='<%=cum_mon5%>'/></td>
  </tr>
  <tr >
    <td rowspan="1"class="tablecontent11" >8</td>
    <td class="tablecontent11">Library </td>
      <td class="tablecontent1"><input type="text" name="technology_Study_target" id="Technology_Study_target" size="15"value='<%=fix_val6%>'/></td>
   <td class="tablecontent1"><input type="text" name="technology_Study_Achievment" id="Technology_Study_Achievment" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', cum_Technology_Study_Achievment)"/></td>
   <td class="tablecontent1"><input type="text" name="cum_Technology_Study_Achievment" id="cum_Technology_Study_Achievment" size="15"value='<%=cum_mon6%>'/></td>
  </tr>
  <tr >
  <td rowspan="1"class="tablecontent12" >9</td>
    <td class="tablecontent12"> Marketing Assistance </td>
      <td class="tablecontent2"><input type="text" name="trade_Directories_target" id="Trade_Directories_target" size="15"value='<%=fix_val7%>'/></td>
   <td class="tablecontent2"><input type="text" name="trade_Directories_Achievment" id="Trade_Directories_Achievment" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon7%>', cum_Trade_Directories_Achievment)"/></td>
   <td class="tablecontent2"><input type="text" name="cum_Trade_Directories_Achievment" id="cum_Trade_Directories_Achievment" size="15"value='<%=cum_mon7%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent11" >10</td>
    <td class="tablecontent11">SENET </td>
       <td class="tablecontent1"><input type="text" name="training_Programme_target" id="Training_Programme_target" size="15"value='<%=fix_val8%>'/></td>
   <td class="tablecontent1"><input type="text" name="training_Programme_Achievment" id="Training_Programme_Achievment" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon8%>', cum_Training_Programme_Achievment)"/></td>
   <td class="tablecontent1"><input type="text" name="cum_Training_Programme_Achievment" id="cum_Training_Programme_Achievment" size="15"value='<%=cum_mon8%>'/></td>
  </tr>
	<tr >
    <td class="tablecontent12">11</td>
    <td  class="tablecontent12">Detail Project Report </td>
      <td class="tablecontent2"><input type="text" name="detail_Project_target" id="Detail_Project_target" size="15"value='<%=fix_val9%>'/></td>
   <td class="tablecontent2"><input type="text" name="detail_Project_Achievment" id="Detail_Project_Achievment" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon10%>', cum_Detail_Project_Achievment)"/></td>
   <td class="tablecontent2"><input type="text" name="cum_Detail_Project_Achievment" id="cum_Detail_Project_Achievment" size="15"value='<%=cum_mon10%>'/></td>
  </tr>
       <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_report WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>

<tr >
    <td class="tablecontent11" >2</td>
    <td class="tablecontent11">Project Profiles (New) </td>
       <td class="tablecontent1"><input type="text" name="project_Profiles_target_new" id="Project_Profiles_target_new" size="15"value='<%=fix_val1%>' /></td>
   <td class="tablecontent1" width="250"><input type="text" name="monthly_Achievment_new" id="Monthly_Achievment_new" size="15"value='<%=rsAdminResult.getString("Monthly_Achievment_new")%>'onBlur="fnCalCum(Monthly_Achievment_new,'<%=cum_mon1%>',cum_Monthly_Achievment_new ,'<%=rsAdminResult.getString("Monthly_Achievment_new")%>')"/></td>
   <td  class="tablecontent1"width="333"><input type="text" name="cum_Monthly_Achievment_new" id="cum_Monthly_Achievment_new" size="15"value='<%=cum_mon1%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent12" >3</td>
    <td class="tablecontent12" >Project Profiles (Updated) </td>
      <td class="tablecontent2"><input type="text" name="project_Profiles_target_updated" id="Project_Profiles_target_updated" size="15"value='<%=fix_val2%>'/></td>
   <td class="tablecontent2"><input type="text" name="monthly_Achievment_updated" id="Monthly_Achievment_updated" size="15"value='<%=rsAdminResult.getString("Monthly_Achievment_updated")%>'onBlur="fnCalCum(Monthly_Achievment_updated,'<%=cum_mon2%>',cum_Monthly_Achievment_updated ,'<%=rsAdminResult.getString("Monthly_Achievment_updated")%>')"/></td>
   <td class="tablecontent2"><input type="text" name="cum_Monthly_Achievment_updated" id="cum_Monthly_Achievment_updated" size="15"value='<%=cum_mon2%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent11" >4</td>
    <td class="tablecontent11">State Industrial Profile</td>
       <td class="tablecontent1"><input type="text" name="state_industrial_target" id="state_industrial_target" size="15"value='<%=fix_val3%>'/></td>
   <td class="tablecontent1"><input type="text" name="state_industrial_Achievment" id="state_industrial_Achievment" size="15"value='<%=rsAdminResult.getString("state_industrial_Achievment")%>'onBlur="fnCalCum(state_industrial_Achievment,'<%=cum_mon3%>',cum_state_industrial_Achievment ,'<%=rsAdminResult.getString("state_industrial_Achievment")%>')"/></td>
   <td class="tablecontent1"><input type="text" name="cum_state_industrial_Achievment" id="cum_state_industrial_Achievment" size="15"value='<%=cum_mon3%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent12" >5</td>
    <td class="tablecontent12"> Distict Indl.Potenial </td>
   <td class="tablecontent2"><input type="text" name="distict_Potenial_target" id="Distict_Potenial_target" size="15"value='<%=fix_val10%>'/></td>
   <td class="tablecontent2"><input type="text" name="distict_Potenial_Achievment" id="Distict_Potenial_Achievment" size="15"value='<%=rsAdminResult.getString("Distict_Potenial_Achievment")%>'onBlur="fnCalCum(Distict_Potenial_Achievment,'<%=cum_mon9%>',cum_Distict_Potenial_Achievment ,'<%=rsAdminResult.getString("Distict_Potenial_Achievment")%>')"/></td>
   <td class="tablecontent2"><input type="text" name="cum_Distict_Potenial_Achievment" id="cum_Distict_Potenial_Achievment" size="15"value='<%=cum_mon9%>'/></td>
  
  </tr>
  <tr >
    <td class="tablecontent11">6</td>
    <td class="tablecontent11">Name of unit provided Intensive Technical Consultancy </td>
      <td class="tablecontent1"><input type="text" name="survey_Report_target" id="Survey_Report_target" size="15"value='<%=fix_val4%>'/></td>
   <td class="tablecontent1"><input type="text" name="survey_Report_Achievment" id="Survey_Report_Achievment" size="15"value='<%=rsAdminResult.getString("Survey_Report_Achievment")%>'onBlur="fnCalCum(Survey_Report_Achievment,'<%=cum_mon4%>',cum_Survey_Report_Achievment ,'<%=rsAdminResult.getString("Survey_Report_Achievment")%>')"/></td>
   <td class="tablecontent1"><input type="text" name="cum_Survey_Report_Achievment" id="cum_Survey_Report_Achievment" size="15"value='<%=cum_mon4%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent12">7</td>
    <td class="tablecontent12">Status Report </td>
      <td class="tablecontent2"><input type="text" name="status_Report_target" id="Status_Report_target" size="15"value='<%=fix_val5%>'/></td>
   <td class="tablecontent2"><input type="text" name="status_Report_Achievment" id="Status_Report_Achievment" size="15"value='<%=rsAdminResult.getString("Status_Report_Achievment")%>'onBlur="fnCalCum(Status_Report_Achievment,'<%=cum_mon5%>',cum_Status_Report_Achievment ,'<%=rsAdminResult.getString("Status_Report_Achievment")%>')"/></td>
   <td class="tablecontent2"><input type="text" name="cum_Status_Report_Achievment" id="cum_Status_Report_Achievment" size="15"value='<%=cum_mon5%>'/></td>
  </tr>
  <tr >
    <td rowspan="1"class="tablecontent11" >8</td>
    <td class="tablecontent11">Library </td>
      <td class="tablecontent1"><input type="text" name="technology_Study_target" id="Technology_Study_target" size="15"value='<%=fix_val6%>'/></td>
   <td class="tablecontent1"><input type="text" name="technology_Study_Achievment" id="Technology_Study_Achievment" size="15"value='<%=rsAdminResult.getString("Technology_Study_Achievment")%>'onBlur="fnCalCum(Technology_Study_Achievment,'<%=cum_mon6%>',cum_Technology_Study_Achievment ,'<%=rsAdminResult.getString("Technology_Study_Achievment")%>')"/></td>
   <td class="tablecontent1"> <input type="text" name="cum_Technology_Study_Achievment" id="cum_Technology_Study_Achievment" size="15"value='<%=cum_mon6%>'/></td>
  </tr>
  <tr >
  <td rowspan="1" class="tablecontent12">9</td>
    <td class="tablecontent12"> Marketing Assistance </td>
      <td class="tablecontent2"><input type="text" name="trade_Directories_target" id="Trade_Directories_target" size="15"value='<%=fix_val7%>'/></td>
   <td class="tablecontent2"><input type="text" name="trade_Directories_Achievment" id="Trade_Directories_Achievment" size="15"value='<%=rsAdminResult.getString("Trade_Directories_Achievment")%>'onBlur="fnCalCum(Trade_Directories_Achievment,'<%=cum_mon7%>',cum_Trade_Directories_Achievment ,'<%=rsAdminResult.getString("Trade_Directories_Achievment")%>')"/></td>
   <td class="tablecontent2"><input type="text" name="cum_Trade_Directories_Achievment" id="cum_Trade_Directories_Achievment" size="15"value='<%=cum_mon7%>'/></td>
  </tr>
  <tr >
    <td class="tablecontent11">10</td>
    <td class="tablecontent11">SENET </td>
       <td class="tablecontent1"><input type="text" name="training_Programme_target" id="Training_Programme_target" size="15"value='<%=fix_val8%>'/></td>
   <td class="tablecontent1"><input type="text" name="training_Programme_Achievment" id="Training_Programme_Achievment" size="15"value='<%=rsAdminResult.getString("Training_Programme_Achievment")%>'onBlur="fnCalCum(Training_Programme_Achievment,'<%=cum_mon8%>',cum_Training_Programme_Achievment ,'<%=rsAdminResult.getString("Training_Programme_Achievment")%>')"/></td>
   <td class="tablecontent1"><input type="text" name="cum_Training_Programme_Achievment" id="cum_Training_Programme_Achievment" size="15"value='<%=cum_mon8%>'/></td>
  </tr >
	<tr  >
    <td class="tablecontent12" >11</td>
    <td class="tablecontent12">Detail Project Report </td>
      <td class="tablecontent2"><input type="text" name="detail_Project_target" id="Detail_Project_target" size="15"value='<%=fix_val9%>'/></td>
   <td class="tablecontent2"><input type="text" name="detail_Project_Achievment" id="Detail_Project_Achievment" size="15"value='<%=rsAdminResult.getString("Detail_Project_Achievment")%>'onBlur="fnCalCum(Detail_Project_Achievment,'<%=cum_mon10%>',cum_Detail_Project_Achievment ,'<%=rsAdminResult.getString("Detail_Project_Achievment")%>')"/></td>
   <td class="tablecontent2"><input type="text" name="cum_Detail_Project_Achievment" id="cum_Detail_Project_Achievment" size="15"value='<%=cum_mon10%>'/></td>
  </tr>

<% }%>
</table>
 <div align="center">
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
</body>
</html>
