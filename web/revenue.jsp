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

function fnTotal(obj1,obj2,obj3,obj4,obj5,obj6,obj7,obj8,obj9,obj10,obj11,obj12,obj13,obj14,obj15,obj16,obj17,obj18){
	// sc_dtm  st_dtm wmn_dtm obc_dtm ph_dtm min_dtm total_dtm
	var temp;
	var target1=Number(obj1.value);
	var target2=Number(obj2.value);
	var target3=Number(obj3.value);
	var target4=Number(obj4.value);
	var target5=Number(obj5.value);
	var target6=Number(obj6.value);
	var target7=Number(obj7.value);
	var target8=Number(obj8.value);
	var target9=Number(obj9.value);
	var target10=Number(obj10.value);
	var target11=Number(obj11.value);
	var target12=Number(obj12.value);
	var target13=Number(obj13.value);
	var target14=Number(obj14.value);
	var target15=Number(obj15.value);
	var target16=Number(obj16.value);
	var target17=Number(obj17.value);
	
	temp=target1+target2+target3+target4+target5+target6+target7+target8+target9+target10+target11+target12+target13+target14+target15+target16+target17;
	obj18.value=temp;
}
function fnSum(vDTM,vQCUM,vCUM){
var tmp;
//alert('Sum ');
	if(vDTM!=''){
		tmp = Number(vQCUM)+ Number(vDTM);	
		vCUM.value =tmp;
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
		vCUM.value = tmp;
	}
}



function formValidator(){
	var numericExpression = /^[0-9]+$/;
	var decimalExpression1=/^-?\d+(\.\d+)?$/;
	var decimalExpression=/^((\d+(\.\d*)?)|((\d*\.)?\d+))$/;	
//***********Budget */
//Carry Forward      
	if (!document.getElementById('common_total').value.match(numericExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('common_total').focus();
                 return false;
      }
	  if (!document.getElementById('sale_total').value.match(numericExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('sale_total').focus();
                 return false;
      }
	  if (!document.getElementById('sdp_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('sdp_total').focus();
                 return false;
      }
	  if (!document.getElementById('edp_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('edp_total').focus();
                 return false;
      }
	    if (!document.getElementById('mdp_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('mdp_total').focus();
                 return false;
      }
	  if (!document.getElementById('seminar_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('seminar_total').focus();
                 return false;
      }
	  if (!document.getElementById('capacity_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('capacity_total').focus();
                 return false;
      }
	  if (!document.getElementById('project_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('project_total').focus();
                 return false;
      }
	  if (!document.getElementById('sick_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('sick_total').focus();
                 return false;
      }
	  if (!document.getElementById('inplant_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('inplant_total').focus();
                 return false;
      }
	  if (!document.getElementById('surveys_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('surveys_total').focus();
                 return false;
      }
	  if (!document.getElementById('energy_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('energy_total').focus();
                 return false;
      }
	  if (!document.getElementById('nsic_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('nsic_total').focus();
                 return false;
      }
	  if (!document.getElementById('accounts_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('accounts_total').focus();
                 return false;
      }
	  if (!document.getElementById('sale_publication_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('sale_publication_total').focus();
                 return false;
      }
	  if (!document.getElementById('information_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('information_total').focus();
                 return false;
      }
	  if (!document.getElementById('others_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('others_total').focus();
                 return false;
      }
	  if (!document.getElementById('total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('total').focus();
                 return false;
      }
	   if (!document.getElementById('cum_common_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_common_total').focus();
                 return false;
      }
	 if (!document.getElementById('cum_common_total').value.match(numericExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_common_total').focus();
                 return false;
      }
	  if (!document.getElementById('cum_sale_total').value.match(numericExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_sale_total').focus();
                 return false;
      }
	  if (!document.getElementById('cum_sdp_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_sdp_total').focus();
                 return false;
      }
	  if (!document.getElementById('cum_edp_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_edp_total').focus();
                 return false;
      }
	    if (!document.getElementById('cum_mdp_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_mdp_total').focus();
                 return false;
      }
	  if (!document.getElementById('cum_seminar_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_seminar_total').focus();
                 return false;
      }
	  if (!document.getElementById('cum_capacity_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_capacity_total').focus();
                 return false;
      }
	  if (!document.getElementById('cum_project_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_project_total').focus();
                 return false;
      }
	  if (!document.getElementById('cum_sick_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_sick_total').focus();
                 return false;
      }
	  if (!document.getElementById('cum_inplant_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_inplant_total').focus();
                 return false;
      }
	  if (!document.getElementById('cum_surveys_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_surveys_total').focus();
                 return false;
      }
	  if (!document.getElementById('cum_energy_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_energy_total').focus();
                 return false;
      }
	  if (!document.getElementById('cum_nsic_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_nsic_total').focus();
                 return false;
      }
	  if (!document.getElementById('cum_accounts_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_accounts_total').focus();
                 return false;
      }
	  if (!document.getElementById('cum_sale_publication_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_sale_publication_total').focus();
                 return false;
      }
	  if (!document.getElementById('cum_information_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_information_total').focus();
                 return false;
      }
	  if (!document.getElementById('cum_others_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_others_total').focus();
                 return false;
      }
	  if (!document.getElementById('cum_total').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('cum_total').focus();
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
                document.forms[0].action = "RevenueAction.do?method=add";
                document.forms[0].submit();
            }
        </script>



</head>

<body bgcolor="#FBFBFB">
<form action="RevenueAction.do" onsubmit="return formValidator()">
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
		 String strSql = "select * from tbl_revenue where months =" + months +" and year='"+years+"' and instid='"+instId+"'";
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
String strSql = "SELECT * FROM tbl_revenue WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
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




String strCumulative=" SELECT sum(Common_total),sum(sale_total),sum(sdp_total),sum(edp_total),sum(mdp_total),sum(Seminar_total),sum(Capacity_total),sum(Project_total),sum(Sick_total),sum(Inplant_total),sum(NSIC_total),sum(Energy_total),sum(Surveys_total),sum(sale_publication_total),sum(Information_total),sum(others_total),sum(Accounts_total) FROM tbl_revenue where months >=1 AND months <="+months+" and year='"+years+"' and instid='"+instId+"'";

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
		
		
ResultSet rsCumulative=stmt.executeQuery(strCumulative);
 
	      while(rsCumulative.next())
	      {
	       cum_mon1=rsCumulative.getDouble("sum(Common_total)");
	       cum_mon2=rsCumulative.getDouble("sum(sale_total)");
		   
		  cum_mon3=rsCumulative.getDouble("sum(sdp_total)");
	       cum_mon4=rsCumulative.getDouble("sum(edp_total)");
		   
		   cum_mon5=rsCumulative.getDouble("sum(mdp_total)");
	       cum_mon6=rsCumulative.getDouble("sum(Seminar_total)");
		   
		   cum_mon7=rsCumulative.getDouble("sum(Capacity_total)");
	       cum_mon8=rsCumulative.getDouble("sum(Project_total)");
		   
		   cum_mon9=rsCumulative.getDouble("sum(Sick_total)");
	       cum_mon10=rsCumulative.getDouble("sum(Inplant_total)");
		   
			cum_mon11=rsCumulative.getDouble("sum(Surveys_total)");
	       cum_mon12=rsCumulative.getDouble("sum(Energy_total)");
	
		   cum_mon13=rsCumulative.getDouble("sum(NSIC_total)");
		   
	       cum_mon14=rsCumulative.getDouble("sum(sale_publication_total)");	
		    cum_mon15=rsCumulative.getDouble("sum(Information_total)");
	       cum_mon16=rsCumulative.getDouble("sum(others_total)");	
		   
		    cum_mon17=rsCumulative.getDouble("sum(Accounts_total)");
		   
         	flag++;
	      }
	      System.out.println("flag"+flag);









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


<div style="font-size:large;font-family:Verdana;font-weight:bold;  " align="center" ><font color="#990000"> Monthly Progress Report of  Revenue Earning Statementin the month <%=rs_month.getString("mon")%></font></div>

<br /><br />

<input type="hidden" size="5" name="months" value="<%=request.getParameter("months")%>" />
<input type="hidden" size="5" name="years" value="<%=request.getParameter("years")%>" />
<input type="hidden" size="5" name="instId" value="<%=request.getParameter("instId")%>" />
<input type="hidden" size="5" name="user_date" value='<%=years%>-<%=months%>-20' />
<table width="100%" border="0" align="center" >

  <tr  >
    <td width="33" align="center" class="tableheader">S.No</td>
    <td width="439" align="center" class="tableheader">Name Of Program </td>
    <td width="120" colspan="1"align="center" class="tableheader">Total</td>
	 <td width="120" colspan="1"align="center" class="tableheader">Cum.Total</td>
  </tr>
     <%if(divFlag==0){%>
  <tr >
    <td  class="tablecontent11">1</td>
    <td  class="tablecontent11">Common facility workshop revenue </td>
   <td class="tablecontent1"><input type="text" name="common_total" id="common_total" size="15" value="0" onblur="javascript:fnSum(this.value,'<%=cum_mon1%>', cum_common_total),fnTotal(sale_total,common_total,sdp_total,edp_total,mdp_total,seminar_total,capacity_total,project_total,sick_total,inplant_total,surveys_total,energy_total,nsic_total,accounts_total,sale_publication_total,information_total,others_total,total),fnTotal(cum_sale_total,cum_common_total,cum_sdp_total,cum_edp_total,cum_mdp_total,cum_seminar_total,cum_capacity_total,cum_project_total,cum_sick_total,cum_inplant_total,cum_surveys_total,cum_energy_total,cum_nsic_total,cum_accounts_total,cum_sale_publication_total,cum_information_total,cum_others_total,cum_total)" /></td>
   <td class="tablecontent1"><input type="text" name="cum_common_total" id="cum_common_total" size="15"value='<%=cum_mon1%>' /></td>
  </tr>
  <tr >
    <td  class="tablecontent12"> 2</td>
    <td  class="tablecontent12">sale of trainee products</td>
   <td class="tablecontent2"><input type="text" name="sale_total" id="sale_total"  value="0" size="15" onblur="javascript:fnSum(this.value,'<%=cum_mon2%>', cum_sale_total),fnTotal(sale_total,common_total,sdp_total,edp_total,mdp_total,seminar_total,capacity_total,project_total,sick_total,inplant_total,surveys_total,energy_total,nsic_total,accounts_total,sale_publication_total,information_total,others_total,total),fnTotal(cum_sale_total,cum_common_total,cum_sdp_total,cum_edp_total,cum_mdp_total,cum_seminar_total,cum_capacity_total,cum_project_total,cum_sick_total,cum_inplant_total,cum_surveys_total,cum_energy_total,cum_nsic_total,cum_accounts_total,cum_sale_publication_total,cum_information_total,cum_others_total,cum_total)"/></td>
   <td class="tablecontent2"><input type="text" name="cum_sale_total" id="cum_sale_total" size="15"value='<%=cum_mon2%>' /></td>
  </tr>
  <tr >
    <td  class="tablecontent11">3</td>
    <td  class="tablecontent11">sdp ( regular courses/sdp specialized hi tech courses</td>
    <td  class="tablecontent1" ><input type="text" name="sdp_total" id="sdp_total"value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon3%>', cum_sdp_total),fnTotal(sale_total,common_total,sdp_total,edp_total,mdp_total,seminar_total,capacity_total,project_total,sick_total,inplant_total,surveys_total,energy_total,nsic_total,accounts_total,sale_publication_total,information_total,others_total,total),fnTotal(cum_sale_total,cum_common_total,cum_sdp_total,cum_edp_total,cum_mdp_total,cum_seminar_total,cum_capacity_total,cum_project_total,cum_sick_total,cum_inplant_total,cum_surveys_total,cum_energy_total,cum_nsic_total,cum_accounts_total,cum_sale_publication_total,cum_information_total,cum_others_total,cum_total)"/></td>
   <td  class="tablecontent1" ><input type="text" name="cum_sdp_total" id="cum_sdp_total" size="15"value='<%=cum_mon3%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent12">4</td>
    <td  class="tablecontent12">EDP training fee</td>
   <td  class="tablecontent2" ><input type="text" name="edp_total" id="edp_total" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon4%>', cum_edp_total),fnTotal(sale_total,common_total,sdp_total,edp_total,mdp_total,seminar_total,capacity_total,project_total,sick_total,inplant_total,surveys_total,energy_total,nsic_total,accounts_total,sale_publication_total,information_total,others_total,total),fnTotal(cum_sale_total,cum_common_total,cum_sdp_total,cum_edp_total,cum_mdp_total,cum_seminar_total,cum_capacity_total,cum_project_total,cum_sick_total,cum_inplant_total,cum_surveys_total,cum_energy_total,cum_nsic_total,cum_accounts_total,cum_sale_publication_total,cum_information_total,cum_others_total,cum_total)"/></td>
   <td  class="tablecontent2" ><input type="text" name="cum_edp_total" id="cum_edp_total" size="15"value='<%=cum_mon4%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent11">5</td>
    <td  class="tablecontent11">MDP training fee</td>
   <td  class="tablecontent1" ><input type="text" name="mdp_total" id="mdp_total"  value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon5%>', cum_mdp_total),fnTotal(sale_total,common_total,sdp_total,edp_total,mdp_total,seminar_total,capacity_total,project_total,sick_total,inplant_total,surveys_total,energy_total,nsic_total,accounts_total,sale_publication_total,information_total,others_total,total),fnTotal(cum_sale_total,cum_common_total,cum_sdp_total,cum_edp_total,cum_mdp_total,cum_seminar_total,cum_capacity_total,cum_project_total,cum_sick_total,cum_inplant_total,cum_surveys_total,cum_energy_total,cum_nsic_total,cum_accounts_total,cum_sale_publication_total,cum_information_total,cum_others_total,cum_total)"/></td>
   <td  class="tablecontent1" ><input type="text" name="cum_mdp_total" id="cum_mdp_total" size="15"value='<%=cum_mon5%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent12">6</td>
    <td  class="tablecontent12">Seminar fees</td>
   <td  class="tablecontent2" ><input type="text" name="seminar_total" id="seminar_total" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', cum_seminar_total),fnTotal(sale_total,common_total,sdp_total,edp_total,mdp_total,seminar_total,capacity_total,project_total,sick_total,inplant_total,surveys_total,energy_total,nsic_total,accounts_total,sale_publication_total,information_total,others_total,total),fnTotal(cum_sale_total,cum_common_total,cum_sdp_total,cum_edp_total,cum_mdp_total,cum_seminar_total,cum_capacity_total,cum_project_total,cum_sick_total,cum_inplant_total,cum_surveys_total,cum_energy_total,cum_nsic_total,cum_accounts_total,cum_sale_publication_total,cum_information_total,cum_others_total,cum_total)"/></td>
   <td  class="tablecontent2" ><input type="text" name="cum_seminar_total" id="cum_seminar_total" size="15"value='<%=cum_mon6%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent11">7</td>
    <td  class="tablecontent11">Capacity accessment and consultancy</td>
    <td  class="tablecontent1" ><input type="text" name="capacity_total" id="capacity_total" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon7%>', cum_capacity_total),fnTotal(sale_total,common_total,sdp_total,edp_total,mdp_total,seminar_total,capacity_total,project_total,sick_total,inplant_total,surveys_total,energy_total,nsic_total,accounts_total,sale_publication_total,information_total,others_total,total),fnTotal(cum_sale_total,cum_common_total,cum_sdp_total,cum_edp_total,cum_mdp_total,cum_seminar_total,cum_capacity_total,cum_project_total,cum_sick_total,cum_inplant_total,cum_surveys_total,cum_energy_total,cum_nsic_total,cum_accounts_total,cum_sale_publication_total,cum_information_total,cum_others_total,cum_total)"/></td>
   <td  class="tablecontent1" ><input type="text" name="cum_capacity_total" id="cum_capacity_total" size="15"value='<%=cum_mon7%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent12">8</td>
    <td  class="tablecontent12">Project appraisals</td>
    <td  class="tablecontent2" ><input type="text" name="project_total" id="project_total" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon8%>', cum_project_total),fnTotal(sale_total,common_total,sdp_total,edp_total,mdp_total,seminar_total,capacity_total,project_total,sick_total,inplant_total,surveys_total,energy_total,nsic_total,accounts_total,sale_publication_total,information_total,others_total,total),fnTotal(cum_sale_total,cum_common_total,cum_sdp_total,cum_edp_total,cum_mdp_total,cum_seminar_total,cum_capacity_total,cum_project_total,cum_sick_total,cum_inplant_total,cum_surveys_total,cum_energy_total,cum_nsic_total,cum_accounts_total,cum_sale_publication_total,cum_information_total,cum_others_total,cum_total)"/></td>
   <td  class="tablecontent2" ><input type="text" name="cum_project_total" id="cum_project_total" size="15"value='<%=cum_mon8%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent11">9</td>
    <td  class="tablecontent11">Sick unit studies</td>
   <td  class="tablecontent1" ><input type="text" name="sick_total" id="sick_total" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon9%>', cum_sick_total),fnTotal(sale_total,common_total,sdp_total,edp_total,mdp_total,seminar_total,capacity_total,project_total,sick_total,inplant_total,surveys_total,energy_total,nsic_total,accounts_total,sale_publication_total,information_total,others_total,total),fnTotal(cum_sale_total,cum_common_total,cum_sdp_total,cum_edp_total,cum_mdp_total,cum_seminar_total,cum_capacity_total,cum_project_total,cum_sick_total,cum_inplant_total,cum_surveys_total,cum_energy_total,cum_nsic_total,cum_accounts_total,cum_sale_publication_total,cum_information_total,cum_others_total,cum_total)"/></td>
   <td  class="tablecontent1" ><input type="text" name="cum_sick_total" id="cum_sick_total" size="15"value='<%=cum_mon9%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent12">10</td>
    <td  class="tablecontent12">Inplant studies</td>
    <td  class="tablecontent2" ><input type="text" name="inplant_total" id="inplant_total" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon10%>', cum_inplant_total),fnTotal(sale_total,common_total,sdp_total,edp_total,mdp_total,seminar_total,capacity_total,project_total,sick_total,inplant_total,surveys_total,energy_total,nsic_total,accounts_total,sale_publication_total,information_total,others_total,total),fnTotal(cum_sale_total,cum_common_total,cum_sdp_total,cum_edp_total,cum_mdp_total,cum_seminar_total,cum_capacity_total,cum_project_total,cum_sick_total,cum_inplant_total,cum_surveys_total,cum_energy_total,cum_nsic_total,cum_accounts_total,cum_sale_publication_total,cum_information_total,cum_others_total,cum_total)"/></td>
   <td  class="tablecontent2" ><input type="text" name="cum_inplant_total" id="cum_inplant_total" size="15"value='<%=cum_mon10%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent11">11</td>
    <td  class="tablecontent11">Surveys</td>
   <td  class="tablecontent1" ><input type="text" name="surveys_total" id="surveys_total" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon11%>', cum_surveys_total),fnTotal(sale_total,common_total,sdp_total,edp_total,mdp_total,seminar_total,capacity_total,project_total,sick_total,inplant_total,surveys_total,energy_total,nsic_total,accounts_total,sale_publication_total,information_total,others_total,total),fnTotal(cum_sale_total,cum_common_total,cum_sdp_total,cum_edp_total,cum_mdp_total,cum_seminar_total,cum_capacity_total,cum_project_total,cum_sick_total,cum_inplant_total,cum_surveys_total,cum_energy_total,cum_nsic_total,cum_accounts_total,cum_sale_publication_total,cum_information_total,cum_others_total,cum_total)"/></td>
   <td  class="tablecontent1" ><input type="text" name="cum_surveys_total" id="cum_surveys_total" size="15"value='<%=cum_mon11%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent12">12</td>
    <td  class="tablecontent12">Energy Audits</td>
   <td  class="tablecontent2" ><input type="text" name="energy_total" id="energy_total" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon12%>', cum_energy_total),fnTotal(sale_total,common_total,sdp_total,edp_total,mdp_total,seminar_total,capacity_total,project_total,sick_total,inplant_total,surveys_total,energy_total,nsic_total,accounts_total,sale_publication_total,information_total,others_total,total),fnTotal(cum_sale_total,cum_common_total,cum_sdp_total,cum_edp_total,cum_mdp_total,cum_seminar_total,cum_capacity_total,cum_project_total,cum_sick_total,cum_inplant_total,cum_surveys_total,cum_energy_total,cum_nsic_total,cum_accounts_total,cum_sale_publication_total,cum_information_total,cum_others_total,cum_total)"/></td>
   <td  class="tablecontent2" ><input type="text" name="cum_energy_total" id="cum_energy_total" size="15"value='<%=cum_mon12%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent11">13</td>
    <td  class="tablecontent11">NSIC  Regn./ gspp</td>
    <td  class="tablecontent2" ><input type="text" name="nsic_total" id="nsic_total" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon13%>', cum_nsic_total),fnTotal(sale_total,common_total,sdp_total,edp_total,mdp_total,seminar_total,capacity_total,project_total,sick_total,inplant_total,surveys_total,energy_total,nsic_total,accounts_total,sale_publication_total,information_total,others_total,total),fnTotal(cum_sale_total,cum_common_total,cum_sdp_total,cum_edp_total,cum_mdp_total,cum_seminar_total,cum_capacity_total,cum_project_total,cum_sick_total,cum_inplant_total,cum_surveys_total,cum_energy_total,cum_nsic_total,cum_accounts_total,cum_sale_publication_total,cum_information_total,cum_others_total,cum_total)"/></td>
   <td  class="tablecontent2" ><input type="text" name="cum_nsic_total" id="cum_nsic_total" size="15"value='<%=cum_mon13%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent12">14</td>
    <td  class="tablecontent12">PD Accounts</td>
    <td  class="tablecontent2" ><input type="text" name="accounts_total" id="accounts_total" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon17%>', cum_accounts_total),fnTotal(sale_total,common_total,sdp_total,edp_total,mdp_total,seminar_total,capacity_total,project_total,sick_total,inplant_total,surveys_total,energy_total,nsic_total,accounts_total,sale_publication_total,information_total,others_total,total),fnTotal(cum_sale_total,cum_common_total,cum_sdp_total,cum_edp_total,cum_mdp_total,cum_seminar_total,cum_capacity_total,cum_project_total,cum_sick_total,cum_inplant_total,cum_surveys_total,cum_energy_total,cum_nsic_total,cum_accounts_total,cum_sale_publication_total,cum_information_total,cum_others_total,cum_total)"/></td>
   <td  class="tablecontent2" ><input type="text" name="cum_accounts_total" id="cum_accounts_total" size="15"value='<%=cum_mon17%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent11">15</td>
    <td  class="tablecontent11">Sale of publications</td>
    <td  class="tablecontent1" ><input type="text" name="sale_publication_total" id="sale_publication_total" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon14%>', cum_sale_publication_total),fnTotal(sale_total,common_total,sdp_total,edp_total,mdp_total,seminar_total,capacity_total,project_total,sick_total,inplant_total,surveys_total,energy_total,nsic_total,accounts_total,sale_publication_total,information_total,others_total,total),fnTotal(cum_sale_total,cum_common_total,cum_sdp_total,cum_edp_total,cum_mdp_total,cum_seminar_total,cum_capacity_total,cum_project_total,cum_sick_total,cum_inplant_total,cum_surveys_total,cum_energy_total,cum_nsic_total,cum_accounts_total,cum_sale_publication_total,cum_information_total,cum_others_total,cum_total)"/></td>
   <td  class="tablecontent1" ><input type="text" name="cum_sale_publication_total" id="cum_sale_publication_total" size="15"value='<%=cum_mon14%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent12">16</td>
    <td  class="tablecontent12">Information Technology </td>
  <td  class="tablecontent2" ><input type="text" name="information_total" id="information_total" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon15%>', cum_information_total),fnTotal(sale_total,common_total,sdp_total,edp_total,mdp_total,seminar_total,capacity_total,project_total,sick_total,inplant_total,surveys_total,energy_total,nsic_total,accounts_total,sale_publication_total,information_total,others_total,total),fnTotal(cum_sale_total,cum_common_total,cum_sdp_total,cum_edp_total,cum_mdp_total,cum_seminar_total,cum_capacity_total,cum_project_total,cum_sick_total,cum_inplant_total,cum_surveys_total,cum_energy_total,cum_nsic_total,cum_accounts_total,cum_sale_publication_total,cum_information_total,cum_others_total,cum_total)"/></td>
   <td  class="tablecontent2" ><input type="text" name="cum_information_total" id="cum_information_total" size="15"value='<%=cum_mon15%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent11">17</td>
    <td  class="tablecontent11">others</td>
    <td  class="tablecontent1" ><input type="text" name="others_total" id="others_total" value="0" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon16%>', cum_others_total),fnTotal(sale_total,common_total,sdp_total,edp_total,mdp_total,seminar_total,capacity_total,project_total,sick_total,inplant_total,surveys_total,energy_total,nsic_total,accounts_total,sale_publication_total,information_total,others_total,total),fnTotal(cum_sale_total,cum_common_total,cum_sdp_total,cum_edp_total,cum_mdp_total,cum_seminar_total,cum_capacity_total,cum_project_total,cum_sick_total,cum_inplant_total,cum_surveys_total,cum_energy_total,cum_nsic_total,cum_accounts_total,cum_sale_publication_total,cum_information_total,cum_others_total,cum_total)"/></td>
   <td  class="tablecontent1" ><input type="text" name="cum_others_total" id="cum_others_total" size="15"value='<%=cum_mon16%>'/></td>
  </tr>
   <tr >
    <td  class="tablecontent12">18</td>
    <td  class="tablecontent12">Total</td>
    <td  class="tablecontent2" ><input type="text" name="total" id="total" size="15" value="0"/></td>
   <td  class="tablecontent2" ><input type="text" name="cum_total" id="cum_total" size="15" value="0"/></td>
  </tr>
  
        <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_revenue WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>

 <tr >
    <td  class="tablecontent11">1</td>
    <td  class="tablecontent11">Common facility workshop revenue </td>
   <td  class="tablecontent1" ><input type="text" name="common_total" id="common_total" size="15" value='<%=rsAdminResult.getString("common_total")%>'onBlur="fnCalCum(common_total,'<%=cum_mon1%>',cum_common_total ,'<%=rsAdminResult.getString("common_total")%>')"/></td>
   <td  class="tablecontent1" ><input type="text" name="cum_common_total" id="cum_common_total" size="15"value='<%=cum_mon1%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent12">2</td>
    <td  class="tablecontent12">sale of trainee products</td>
   <td  class="tablecontent2" ><input type="text" name="sale_total" id="sale_total" size="15"value='<%=rsAdminResult.getString("sale_total")%>'onBlur="fnCalCum(sale_total,'<%=cum_mon2%>',cum_sale_total ,'<%=rsAdminResult.getString("sale_total")%>')"/></td>
   <td  class="tablecontent2" ><input type="text" name="cum_sale_total" id="cum_sale_total" size="15"value='<%=cum_mon2%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent11">3</td>
    <td  class="tablecontent11">sdp (training fee - regular courses/sdp specialized hi tech courses </td>
   <td  class="tablecontent1" ><input type="text" name="sdp_total" id="sdp_total" size="15"value='<%=rsAdminResult.getString("sdp_total")%>'onBlur="fnCalCum(sdp_total,'<%=cum_mon3%>',cum_sdp_total ,'<%=rsAdminResult.getString("sdp_total")%>')"/></td>
   <td  class="tablecontent1" ><input type="text" name="cum_sdp_total" id="cum_sdp_total" size="15"value='<%=cum_mon3%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent12">4</td>
    <td  class="tablecontent12">EDP training fee</td>
   <td  class="tablecontent2" ><input type="text" name="edp_total" id="edp_total" size="15"value='<%=rsAdminResult.getString("edp_total")%>'onBlur="fnCalCum(edp_total,'<%=cum_mon4%>',cum_edp_total ,'<%=rsAdminResult.getString("edp_total")%>')"/></td>
   <td  class="tablecontent2" ><input type="text" name="cum_edp_total" id="cum_edp_total" size="15"value='<%=cum_mon4%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent11">5</td>
    <td  class="tablecontent11">MDP training fee</td>
   <td  class="tablecontent1" ><input type="text" name="mdp_total" id="mdp_total" size="15"value='<%=rsAdminResult.getString("mdp_total")%>'onBlur="fnCalCum(mdp_total,'<%=cum_mon5%>',cum_mdp_total ,'<%=rsAdminResult.getString("mdp_total")%>')"/></td>
   <td  class="tablecontent1" ><input type="text" name="cum_mdp_total" id="cum_mdp_total" size="15"value='<%=cum_mon5%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent12">6</td>
    <td  class="tablecontent12">Seminar fees</td>
   <td  class="tablecontent1" ><input type="text" name="seminar_total" id="seminar_total" size="15"value='<%=rsAdminResult.getString("seminar_total")%>'onBlur="fnCalCum(seminar_total,'<%=cum_mon6%>',cum_seminar_total ,'<%=rsAdminResult.getString("seminar_total")%>')"/></td>
   <td  class="tablecontent1" ><input type="text" name="cum_seminar_total" id="cum_seminar_total" size="15"value='<%=cum_mon6%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent11">7</td>
    <td  class="tablecontent11">Capacity accessment and consultancy</td>
    <td  class="tablecontent1" ><input type="text" name="capacity_total" id="capacity_total" size="15"value='<%=rsAdminResult.getString("capacity_total")%>'onBlur="fnCalCum(capacity_total,'<%=cum_mon7%>',cum_capacity_total ,'<%=rsAdminResult.getString("capacity_total")%>')"/></td>
   <td  class="tablecontent1" ><input type="text" name="cum_capacity_total" id="cum_capacity_total" size="15"value='<%=cum_mon7%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent12">8</td>
    <td  class="tablecontent12">Project appraisals</td>
    <td  class="tablecontent2" ><input type="text" name="project_total" id="project_total" size="15"value='<%=rsAdminResult.getString("project_total")%>'onBlur="fnCalCum(project_total,'<%=cum_mon8%>',cum_project_total ,'<%=rsAdminResult.getString("project_total")%>')"/></td>
   <td  class="tablecontent2" ><input type="text" name="cum_project_total" id="cum_project_total" size="15"value='<%=cum_mon8%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent11">9</td>
    <td  class="tablecontent11">Sick unit studies</td>
   <td  class="tablecontent1" ><input type="text" name="sick_total" id="sick_total" size="15"value='<%=rsAdminResult.getString("sick_total")%>'onBlur="fnCalCum(sick_total,'<%=cum_mon9%>',cum_sick_total ,'<%=rsAdminResult.getString("sick_total")%>')"/></td>
   <td  class="tablecontent1" ><input type="text" name="cum_sick_total" id="cum_sick_total" size="15"value='<%=cum_mon9%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent12">10</td>
    <td  class="tablecontent12">Inplant studies</td>
    <td  class="tablecontent2" ><input type="text" name="inplant_total" id="inplant_total" size="15"value='<%=rsAdminResult.getString("inplant_total")%>'onBlur="fnCalCum(inplant_total,'<%=cum_mon10%>',cum_inplant_total ,'<%=rsAdminResult.getString("inplant_total")%>')"/></td>
   <td  class="tablecontent2" ><input type="text" name="cum_inplant_total" id="cum_inplant_total" size="15"value='<%=cum_mon10%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent11">11</td>
    <td  class="tablecontent11">Surveys</td>
   <td  class="tablecontent1" ><input type="text" name="surveys_total" id="surveys_total" size="15"value='<%=rsAdminResult.getString("surveys_total")%>'onBlur="fnCalCum(surveys_total,'<%=cum_mon11%>',cum_surveys_total ,'<%=rsAdminResult.getString("surveys_total")%>')"/></td>
   <td  class="tablecontent1" ><input type="text" name="cum_surveys_total" id="cum_surveys_total" size="15"value='<%=cum_mon11%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent12">12</td>
    <td  class="tablecontent12">Energy Audits</td>
   <td  class="tablecontent2" ><input type="text" name="energy_total" id="energy_total" size="15"value='<%=rsAdminResult.getString("energy_total")%>'onBlur="fnCalCum(energy_total,'<%=cum_mon12%>',cum_energy_total ,'<%=rsAdminResult.getString("energy_total")%>')"/></td>
   <td  class="tablecontent2" ><input type="text" name="cum_energy_total" id="cum_energy_total" size="15"value='<%=cum_mon12%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent11">13</td>
    <td  class="tablecontent11">NSIC  Regn./ gspp</td>
    <td  class="tablecontent1" ><input type="text" name="nsic_total" id="nsic_total" size="15"value='<%=rsAdminResult.getString("nsic_total")%>'onBlur="fnCalCum(nsic_total,'<%=cum_mon13%>',cum_nsic_total ,'<%=rsAdminResult.getString("nsic_total")%>')"/></td>
   <td  class="tablecontent1" ><input type="text" name="cum_nsic_total" id="cum_nsic_total" size="15"value='<%=cum_mon13%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent12">14</td>
    <td  class="tablecontent12">PD Accounts</td>
    <td  class="tablecontent2" ><input type="text" name="accounts_total" id="accounts_total" size="15"value='<%=rsAdminResult.getString("accounts_total")%>'onBlur="fnCalCum(accounts_total,'<%=cum_mon17%>',cum_accounts_total ,'<%=rsAdminResult.getString("accounts_total")%>')"/></td>
   <td  class="tablecontent2" ><input type="text" name="cum_accounts_total" id="cum_accounts_total" size="15"value='<%=cum_mon17%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent11">15</td>'
    <td  class="tablecontent11">Sale of publications</td>
    <td  class="tablecontent1" ><input type="text" name="sale_publication_total" id="sale_publication_total" size="15"value='<%=rsAdminResult.getString("sale_publication_total")%>'onBlur="fnCalCum(sale_publication_total,'<%=cum_mon14%>',cum_sale_publication_total ,'<%=rsAdminResult.getString("sale_publication_total")%>')"/></td>
   <td  class="tablecontent1" ><input type="text" name="cum_sale_publication_total" id="cum_sale_publication_total" size="15"value='<%=cum_mon14%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent12">16</td>
    <td  class="tablecontent12">Information Technology </td>
  <td  class="tablecontent2" ><input type="text" name="information_total" id="information_total" size="15"value='<%=rsAdminResult.getString("information_total")%>'onBlur="fnCalCum(information_total,'<%=cum_mon15%>',cum_information_total ,'<%=rsAdminResult.getString("information_total")%>')"/></td>
   <td  class="tablecontent2" ><input type="text" name="cum_information_total" id="cum_information_total" size="15"value='<%=cum_mon15%>'/></td>
  </tr>
  <tr >
    <td  class="tablecontent11">17</td>
    <td  class="tablecontent11">others</td>
    <td  class="tablecontent1" ><input type="text" name="others_total" id="others_total" size="15"value='<%=rsAdminResult.getString("others_total")%>'onBlur="fnCalCum(others_total,'<%=cum_mon16%>',cum_others_total ,'<%=rsAdminResult.getString("others_total")%>')"/></td>
   <td  class="tablecontent1" ><input type="text" name="cum_others_total" id="cum_others_total" size="15"value='<%=cum_mon16%>'/></td>
  </tr>
    <tr >
    <td  class="tablecontent12">18</td>
    <td  class="tablecontent12">Total</td>
    <td  class="tablecontent2" ><input type="hidden" name="total" id="total" size="15"value='<%=rsAdminResult.getString("total")%>'/></td>
   <td  class="tablecontent2" ><input type="text" name="cum_total" id="cum_total" size="15"value='<%=(cum_mon1+cum_mon2+cum_mon3+cum_mon4+cum_mon5+cum_mon6+cum_mon7+cum_mon8+cum_mon9+cum_mon10+cum_mon11+cum_mon12+cum_mon13+cum_mon14+cum_mon15+cum_mon16+cum_mon17) %>' /></td>
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
</form>
</body>
</html>
