<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@taglib uri="/web-INF/struts-bean.tld" prefix="bean" %>
<%@taglib uri="/web-INF/struts-html.tld" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="inb.css" rel="stylesheet" type="text/css">
<script language=JavaScript>

var message="Function Disabled!";

function clickIE4(){
if (event.button==2){
alert(message);
return false;
}
}

function clickNS4(e){
if (document.layers||document.getElementById&&!document.all){
if (e.which==2||e.which==3){
alert(message);
return false;
}
}
}

if (document.layers){
document.captureEvents(Event.MOUSEDOWN);
document.onmousedown=clickNS4;
}
else if (document.all&&!document.getElementById){
document.onmousedown=clickIE4;
}

document.oncontextmenu=new Function("alert(message);return false")

// --> 
</script>

<script type="text/javascript">

function fnTotal(obj1,obj2,obj3,obj4,obj5,obj6){
	// sc_dtm  st_dtm wmn_dtm obc_dtm ph_dtm min_dtm total_dtm
	var temp;
	var target1=Number(obj1.value);
	var target2=Number(obj2.value);
	var target3=Number(obj3.value);
	var target4=Number(obj4.value);
	var target5=Number(obj5.value);
	temp=target1+target2+target3+target4+target5;
	obj6.value=temp;
}
function fnSum(vDTM,vQCUM,vCUM){
var tmp;
//alert('Sum ');
	if(vDTM!=''){
		tmp = Number(vQCUM)+ Number(vDTM);	
		vCUM.value =tmp;
	}
	
	
}

function fnminus(vDTM,vQCUM,vCUM){
var tmp;
//alert('Sum ');
	if(vDTM!=''){
		tmp = Number(vQCUM)- Number(vDTM);	
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
 alert("click Ok to submit your data");
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
    
	if (!document.getElementById('amc_of_pc1').value.match(numericExpression))
      {
                 alert("Please insert numeric value in amc_of_pc Field!");
                 document.getElementById('amc_of_pc1').focus();
                 return false;
      }
	  if (!document.getElementById('web1').value.match(numericExpression))
      {
                 alert("Please insert numeric value in web Field!");
                 document.getElementById('web1').focus();
                 return false;
      }
	  if (!document.getElementById('connectivity').value.match(numericExpression))
      {
                 alert("Please insert numeric value in connectivity Field!");
                 document.getElementById('connectivity').focus();
                 return false;
      }
	  if (!document.getElementById('contg1').value.match(numericExpression))
      {
                 alert("Please insert numeric value in contg Field!");
                 document.getElementById('contg1').focus();
                 return false;
      }
	    if (!document.getElementById('others1').value.match(numericExpression))
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('others1').focus();
                 return false;
      }
	  if (!document.getElementById('br_hardware_target').value.match(numericExpression))
      {
                 alert("Please insert numeric value in web Field!");
                 document.getElementById('br_hardware_target').focus();
                 return false;
      }
	  if (!document.getElementById('br_hardware_tomonth').value.match(numericExpression))
      {
                 alert("Please insert numeric value in connectivity Field!");
                 document.getElementById('br_hardware_tomonth').focus();
                 return false;
      }
	  if (!document.getElementById('br_hardware_upto').value.match(numericExpression))
      {
                 alert("Please insert numeric value in contg Field!");
                 document.getElementById('br_hardware_upto').focus();
                 return false;
      }
	    if (!document.getElementById('br_con_target').value.match(numericExpression))
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_target').focus();
                 return false;
      }
	  if (!document.getElementById('br_con_tomonth').value.match(numericExpression))
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_tomonth').focus();
                 return false;
      }
	  if (!document.getElementById('br_con_upto').value.match(numericExpression))
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_upto').focus();
                 return false;
      }
	  if (!document.getElementById('br_hardware_target_1').value.match(numericExpression))
      {
                 alert("Please insert numeric value in web Field!");
                 document.getElementById('br_hardware_target_1').focus();
                 return false;
      }
	  if (!document.getElementById('br_hardware_tomonth_1').value.match(numericExpression))
      {
                 alert("Please insert numeric value in connectivity Field!");
                 document.getElementById('br_hardware_tomonth_1').focus();
                 return false;
      }
	  if (!document.getElementById('br_hardware_upto_1').value.match(numericExpression))
      {
                 alert("Please insert numeric value in contg Field!");
                 document.getElementById('br_hardware_upto_1').focus();
                 return false;
      }
	    if (!document.getElementById('br_con_target_1').value.match(numericExpression))
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_target_1').focus();
                 return false;
      }
	  if (!document.getElementById('br_con_tomonth_1').value.match(numericExpression))
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_tomonth_1').focus();
                 return false;
      }
	  if (!document.getElementById('br_con_upto_1').value.match(numericExpression))
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_upto_1').focus();
                 return false;
      }
	  if (!document.getElementById('br_hardware_target_2').value.match(numericExpression))
      {
                 alert("Please insert numeric value in web Field!");
                 document.getElementById('br_hardware_target_2').focus();
                 return false;
      }
	  if (!document.getElementById('br_hardware_tomonth_2').value.match(numericExpression))
      {
                 alert("Please insert numeric value in connectivity Field!");
                 document.getElementById('br_hardware_tomonth_2').focus();
                 return false;
      }
	  if (!document.getElementById('br_hardware_upto_2').value.match(numericExpression))
      {
                 alert("Please insert numeric value in contg Field!");
                 document.getElementById('br_hardware_upto_2').focus();
                 return false;
      }
	    if (!document.getElementById('br_con_target_2').value.match(numericExpression))
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_target_2').focus();
                 return false;
      }
	  if (!document.getElementById('br_con_tomonth_2').value.match(numericExpression))
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_tomonth_2').focus();
                 return false;
      }
	  if (!document.getElementById('br_con_upto_2').value.match(numericExpression))
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_upto_2').focus();
                 return false;
      }
	 if (!document.getElementById('br_hardware_target_3').value.match(numericExpression))
      {
                 alert("Please insert numeric value in web Field!");
                 document.getElementById('br_hardware_target_3').focus();
                 return false;
      }
	  if (!document.getElementById('br_hardware_tomonth_3').value.match(numericExpression))
      {
                 alert("Please insert numeric value in connectivity Field!");
                 document.getElementById('br_hardware_tomonth_3').focus();
                 return false;
      }
	  if (!document.getElementById('br_hardware_upto_3').value.match(numericExpression))
      {
                 alert("Please insert numeric value in contg Field!");
                 document.getElementById('br_hardware_upto_3').focus();
                 return false;
      }
	    if (!document.getElementById('br_con_target_3').value.match(numericExpression))
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_target_3').focus();
                 return false;
      }
	  if (!document.getElementById('br_con_tomonth_3').value.match(numericExpression))
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_tomonth_3').focus();
                 return false;
      }
	  if (!document.getElementById('br_con_upto_3').value.match(numericExpression))
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_upto_3').focus();
                 return false;
      }
	
	  if (!document.getElementById('br_hardware_target_4').value.match(numericExpression))
      {
                 alert("Please insert numeric value in web Field!");
                 document.getElementById('br_hardware_target_4').focus();
                 return false;
      }
	  if (!document.getElementById('br_hardware_tomonth_4').value.match(numericExpression))
      {
                 alert("Please insert numeric value in connectivity Field!");
                 document.getElementById('br_hardware_tomonth_4').focus();
                 return false;
      }
	  if (!document.getElementById('br_hardware_upto_4').value.match(numericExpression))
      {
                 alert("Please insert numeric value in contg Field!");
                 document.getElementById('br_hardware_upto_4').focus();
                 return false;
      }
	    if (!document.getElementById('br_con_target_4').value.match(numericExpression))
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_target_4').focus();
                 return false;
      }
	  if (!document.getElementById('br_con_tomonth_4').value.match(numericExpression))
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_tomonth_4').focus();
                 return false;
      }
	  if (!document.getElementById('br_con_upto_4').value.match(numericExpression))
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_upto_4').focus();
                 return false;
      }
	  if (!document.getElementById('br_hardware_target_5').value.match(numericExpression))
      {
                 alert("Please insert numeric value in web Field!");
                 document.getElementById('br_hardware_target_5').focus();
                 return false;
      }
	  if (!document.getElementById('br_hardware_tomonth_5').value.match(numericExpression))
      {
                 alert("Please insert numeric value in connectivity Field!");
                 document.getElementById('br_hardware_tomonth_5').focus();
                 return false;
      }
	  if (!document.getElementById('br_hardware_upto_5').value.match(numericExpression))
      {
                 alert("Please insert numeric value in contg Field!");
                 document.getElementById('br_hardware_upto_5').focus();
                 return false;
      }
	    if (!document.getElementById('br_con_target_5').value.match(numericExpression))
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_target_5').focus();
                 return false;
      }
	  if (!document.getElementById('br_con_tomonth_5').value.match(numericExpression))
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_tomonth_5').focus();
                 return false;
      }
	  if (!document.getElementById('br_con_upto_5').value.match(numericExpression))
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_upto_5').focus();
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
                document.forms[0].action = "SenetAction.do?method=add";
                document.forms[0].submit();
            }
        </script>
</head>

<body bgcolor="#FBFBFB">

<html:form action="SenetAction" onsubmit="return formValidator()">

<%

String instId=(String)session.getAttribute("CmbIns");
 String role=(String)session.getAttribute("rol");
//String instId=(String)session.getAttribute("CmbIns");
String years=(String)session.getAttribute("CmbYear");
String months=(String)session.getAttribute("CmbMonth");
String user=(String)session.getAttribute("user");
String mnm = request.getParameter("mnm");
//String role = request.getParameter("role");
System.out.println(months);
System.out.println(mnm);
System.out.println(role);

%>

<% 
int flag=0,status=0,flag1=0;
	ResultSet rsAdminResult = null;
	ResultSet rsAdminResult1 = null;
		int divFlag=0,buttonFlag=0;
		String readOnlyFlag="";
		String userDate=months+"/"+years;
	// int Tyears = Integer.parseInt(years);
	//if(months=="JANUARY" || months=="FEBRUARY" || months=="MARCH"){
	if(months.equalsIgnoreCase("10") || months.equalsIgnoreCase("11") || months.equalsIgnoreCase("12")){
		//years = years-1;
		flag1=1;
			%>
		<input type="hidden" size="5" name="user_date" value='<%=years%>-<%=months%>-20' />
		<%
	}
	try{
Connection con = ConnectionManager.getConnectionDirectForMySQL();
Statement stmt5 = (Statement)con.createStatement();
Statement stmt4 = (Statement)con.createStatement();
 Statement stmt = (Statement)con.createStatement();
if(role.equalsIgnoreCase("AU")){	
		 String strSql = "select * from tbl_senet where months =" + months +" and year='"+years+"' and inst_id='"+instId+"'";
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
String strSql = "SELECT * FROM tbl_senet WHERE months="+months+" AND year='"+years+"' AND   inst_id='"+instId+"'"; 
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




String strCumulative=" SELECT sum(amc_of_pc1),sum(web1),sum(contg1),sum(others1),sum(connectivity1) FROM tbl_senet where months >=1 AND months <="+months+" and year='"+years+"' and inst_id='"+instId+"'";

	      	System.out.println("strCumulative = "+strCumulative);
		flag=0;
	    int cum_mon1=0;
	    int cum_mon2=0;
		int cum_mon3=0;
		
		 int cum_mon4=0;
	      int cum_mon5=0;
		
	    	String fix_val1="0";
			String fix_val2="0";
			String fix_val3="0";
			String fix_val4="0";
			String fix_val5="0";
		
ResultSet rsCumulative=stmt.executeQuery(strCumulative);

	      while(rsCumulative.next())
	      {
	       cum_mon1=rsCumulative.getInt("sum(amc_of_pc1)");
	       cum_mon2=rsCumulative.getInt("sum(web1)");
		    cum_mon4=rsCumulative.getInt("sum(contg1)");
			cum_mon5=rsCumulative.getInt("sum(others1)");
	       cum_mon3=rsCumulative.getInt("sum(connectivity1)");
		   
		   
         	flag++;
	      }
	      System.out.println("flag"+flag);

		  
		  String strQuery = "SELECT * FROM tbl_targetsenet WHERE year='"+years+"' AND   Inst_Id='"+instId+"'"; 
ResultSet rsTargetResult =stmt.executeQuery(strQuery);

if(rsTargetResult.next()){
	System.out.println("Target Result Set have record");
		   fix_val1=rsTargetResult.getString("amc_of_pc1");
			 fix_val2=rsTargetResult.getString("web1");
			 fix_val3=rsTargetResult.getString("connectivity1");
			 fix_val4=rsTargetResult.getString("contg1");
			 fix_val5=rsTargetResult.getString("others1");
		
		   readOnlyFlag="readOnly";
}


%>

<%

System.out.println("instId="+instId);
String strsql1="select * from tbl_DI_institute where inst_id='"+instId+"'" ;
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
<br> <br>



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
<div style="font-size:large;font-family:Verdana;font-weight:bold" align="center"><font color="#990000">  MPR -SENET Expenditure in the Month  <%=rs_month.getString("mon")%> , Year <%=years%></font></div>


<br> 
<br> <br>  
<input type="hidden" size="5" name="months" value="<%=months%>" />
<input type="hidden" size="5" name="years" value="<%=years%>" />
<input type="hidden" size="5" name="instId" value="<%=instId%>" />
<input type="hidden" size="5" name="user_date" value='<%=years%>-<%=months%>-20' />
<table width="79%" border="0" align="center"  >
  <tr>
    <td colspan="3" class="tableheader">     <div align="center">Amount Sanctioned for </div></td>
    <td colspan="2"  align="center" class="tableheader"><div align="center">Amount Sanctioned </div>      <div align="center"></div></td>
	 <td width="101"  align="center" class="tableheader"><div align="center">Expenditure During the Months </div></td>
	  <td width="98" align="center" class="tableheader"><div align="center">Cumulative Amount </div></td>
  </tr>
     <%if(divFlag==0){%>
  <tr>
    <td colspan="3" class="tablecontent1"><div align="left"><strong>AMC of PC,UPS </strong></div></td>
   <td colspan="2"  class="tablecontent1" >
     
      <div align="center">
        <input type="text" name="amc_of_pc" id="amc_of_pc" size="15"value='<%=fix_val1%>' readonly="2"/>
      </div></td>
   <td  class="tablecontent1" >
     
      <div align="center">
        <input type="text" name="amc_of_pc1" id="amc_of_pc1" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon1%>', amc_of_pc2)"/>
      </div></td>
	<td  class="tablecontent1" >
	  
      <div align="center">
        <input type="text" name="amc_of_pc2" id="amc_of_pc2" size="15" value='<%=cum_mon1%>' readonly="2" />
      </div></td>
  </tr>
  <tr>
    <td colspan="3" class="tablecontent1"><div align="left"><strong>web. Maint. </strong></div></td>
   <td colspan="2"  class="tablecontent2" >
     
      <div align="center">
        <input type="text" name="web" id="web" size="15" value='<%=fix_val2%>'readonly="2"/>
      </div></td>
    <td  class="tablecontent2" >
      
      <div align="center">
        <input type="text" name="web1" id="web1" size="15" onblur="javascript:fnSum(this.value,'<%=cum_mon2%>', web2)"/>
      </div></td>
	<td  class="tablecontent2" >
	  
      <div align="center">
        <input type="text" name="web2" id="web2" size="15"value='<%=cum_mon2%>' readonly="2"/>
      </div></td>
  </tr>
  <tr>
    <td colspan="3"  class="tablecontent1"><div align="left"><strong>Internet connectivity </strong></div></td>
   <td colspan="2"  class="tablecontent1" >
     
      <div align="center">
        <input type="text" name="connectivity" id="connectivity" size="15"value='<%=fix_val3%>'readonly="2"/>
      </div></td>
   <td  class="tablecontent1" >
     
      <div align="center">
        <input type="text" name="connectivity1" id="connectivity1" size="15" onblur="javascript:fnSum(this.value,'<%=cum_mon3%>', connectivity2)"/>
      </div></td>
  <td  class="tablecontent1" >
    
      <div align="center">
        <input type="text" name="connectivity2" id="connectivity2" size="15"readonly="2"value='<%=cum_mon3%>'/>
      </div></td>
  </tr>
  <tr>
    <td colspan="3"  class="tablecontent1"><div align="left"><strong>contg.</strong></div></td>
   <td colspan="2"  class="tablecontent2" >
     
      <div align="center">
        <input type="text" name="contg" id="contg" size="15"value='<%=fix_val4%>'readonly="2"/>
      </div></td>
   <td  class="tablecontent2" >
     
      <div align="center">
        <input type="text" name="contg1" id="contg1" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon4%>', contg2)"/>
      </div></td>
    <td  class="tablecontent2" >
      
      <div align="center">
        <input type="text" name="contg2" id="contg2" size="15" readonly="2"value='<%=cum_mon4%>'/>
      </div></td>
  </tr>
  <tr>
    <td colspan="3"  class="tablecontent1"><div align="left"><strong>Hardware/Software</strong></div></td>
    <td colspan="2"  class="tablecontent1" >
      
      <div align="center">
        <input type="text" name="others" id="others" size="15" value='<%=fix_val5%>'readonly="2"/>
      </div></td>
    <td  class="tablecontent1" >
      
      <div align="center">
        <input type="text" name="others1" id="others1" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon5%>', others2)"/>
      </div></td>
    <td  class="tablecontent1" >
      
      <div align="center">
        <input type="text" name="others2" id="others2" size="15" readonly="2"value='<%=cum_mon5%>'/>
      </div></td>
  </tr>
  <%  if(instId.equals("I10"))
	{%>
 
  
     <tr> <td width="176" rowspan="2"  class="tableheader"><div align="center"><strong>Name of Branches</strong></div></td>
    <td colspan="3"  class="tableheader"><div align="center"><strong>Hardware/Software </strong></div></td>
    <td colspan="3"  class="tableheader" ><div align="center"><strong>Internet Connectivity </strong></div></td>
  </tr>

  <tr>
    <td width="132"  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td width="132"  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td width="101"  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
    <td width="98"  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
  </tr>
    <tr>
      
    <td  class="tablecontent11"><div align="center"> <input type="text" name="branch" id ="branch" value="Tezpur"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target"  id="br_con_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"> </div></td>
  </tr>
   <tr>
     
    <td  class="tablecontent11"><div align="center"><input type="text" name="branch_1" id="branch_1" value="Silchar"> </div></td>
	<td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth_1"id="br_con_tomonth_1"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_upto_1" id="br_con_upto_1"> </div></td>
   </tr>
   <tr>
     
    <td  class="tablecontent11">  <div align="center"> <input type="text" name="branch_2" id="branch_2" value="Diphu">    </div></td>
  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target_2" id="br_hardware_target_2"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth_2" id="br_hardware_tomonth_2"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto_2" id="br_hardware_upto_2"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto_2" id="br_hardware_upto_2"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth_2" id="br_con_tomonth_2"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_upto_2"id="br_con_upto_2"> </div></td>
 </tr>
   <tr>
    
    <td  class="tablecontent11"><div align="center"> <input type="text" name="branch_3"id="branch_3" value="Shilong">       </div></td>
<td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target_3" id="br_hardware_target_3"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target_3"id="br_hardware_target_3"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto_3" id="br_hardware_upto_3"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target_3" id="br_con_target_3"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth_3" id="br_con_tomonth_3"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_upto_3" id="br_con_upto_3"> </div></td>
  </tr>
   <tr>
    
    <td  class="tablecontent11">   <div align="center"> <input type="text" name="branch_4" id="branch_4" value="Tura">     </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target_4" id="br_hardware_target_4"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth_4"  id="br_hardware_tomonth_4"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto_4" id="br_hardware_upto_4"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target_4" id="br_con_target_4"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth_4"  id="br_con_tomonth_4"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_upto_4"id="br_con_upto_4"> </div></td>
  </tr>
    <tr>
     
    <td  class="tablecontent11">   <div align="center"> <input type="text" name="branch_5" id="branch_5" value="Itanagar">    </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target_5" id="br_hardware_target_5"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth_5" id="br_hardware_tomonth_5"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto_5"id="br_hardware_upto_5"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target_5" id="br_con_target_5"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth_5" id="br_con_tomonth_5"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_upto_5" id="br_con_upto_5"> </div></td>
  </tr>
  <% } else %>

<%  if(instId.equals("I4"))
	{%>
 
  
     <tr>
     
    <td rowspan="2"  class="tableheader"><div align="center"><strong>Name of Branches</strong></div></td>
    <td colspan="3"  class="tableheader"><div align="center"><strong>Hardware/Software </strong></div></td>
    <td colspan="3"  class="tableheader" ><div align="center"><strong>Internet Connectivity </strong></div></td>
  </tr>

  <tr>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
  </tr>
    <tr>
      
    <td  class="tablecontent11"> <div align="center"> <input type="text" name="branch" id ="branch" value="Varanasi"> </div></td>
<td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target"  id="br_con_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"> </div></td>
 
  </tr>
   
  <% } else %>


<%  if(instId.equals("I3"))
	{%>
 
  
     <tr>
     
    <td rowspan="2"  class="tableheader"><div align="center"><strong>Name of Branches</strong></div></td>
    <td colspan="3"  class="tableheader"><div align="center"><strong>Hardware/Software </strong></div></td>
    <td colspan="3"  class="tableheader" ><div align="center"><strong>Internet Connectivity </strong></div></td>
  </tr>

  <tr>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
  </tr>
    <tr>
      
    <td  class="tablecontent11">
      
      <div align="center">
        <input type="text" name="branch" id ="branch" value=" Rajkot"> 
      </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target"  id="br_con_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"> </div></td>
  </tr>
   <tr>
     
    <td  class="tablecontent11">
      
      <div align="center">
        <input type="text" name="branch_1" value=" Silvassa">      
      </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth_1"id="br_con_tomonth_1"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_upto_1" id="br_con_upto_1"> </div></td>

  </tr>
   
  <% } else %>
  <%  if(instId.equals("I8"))
	{%>
 
  
     <tr>
     
    <td rowspan="2"  class="tableheader"><div align="center"><strong>Name of Branches</strong></div></td>
    <td colspan="3"  class="tableheader"><div align="center"><strong>Hardware/Software </strong></div></td>
    <td colspan="3"  class="tableheader" ><div align="center"><strong>Internet Connectivity </strong></div></td>
  </tr>

  <tr>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
  </tr>
    <tr>
      
    <td  class="tablecontent11">
      
      <div align="center">
        <input type="text" name="branch" id ="branch" value="Durgapur"> 
      </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target"  id="br_con_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"> </div></td>

  </tr>
   <tr>
     
    <td  class="tablecontent11">
      
      <div align="center">
        <input type="text" name="branch_1" id="branch_1" value="Siliguri">      
      </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth_1"id="br_con_tomonth_1"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_upto_1" id="br_con_upto_1"> </div></td>
  
  </tr>
    <tr>
     
    <td  class="tablecontent11">
      
      <div align="center">
        <input type="text" name="branch_2" id="branch_2" value="Suri">      
      </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target_2" id="br_hardware_target_2"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth_2" id="br_hardware_tomonth_2"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto_2" id="br_hardware_upto_2"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto_2" id="br_hardware_upto_2"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth_2" id="br_con_tomonth_2"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_upto_2"id="br_con_upto_2"> </div></td>
/tr>
   <tr>
     
    <td  class="tablecontent11">
      
      <div align="center">
        <input type="text" name="branch_3"id="branch_3" value="Port Blair">      
      </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target_3" id="br_hardware_target_3"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target_3"id="br_hardware_target_3"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto_3" id="br_hardware_upto_3"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target_3" id="br_con_target_3"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth_3" id="br_con_tomonth_3"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_upto_3" id="br_con_upto_3"> </div></td>
  
  </tr>
  <% } else  %>
 <%  if(instId.equals("I9"))
	{%>
 
  
     <tr>
     
    <td rowspan="2"  class="tableheader"><div align="center"><strong>Name of Branches</strong></div></td>
    <td colspan="3"  class="tableheader"><div align="center"><strong>Hardware/Software </strong></div></td>
    <td colspan="3"  class="tableheader" ><div align="center"><strong>Internet Connectivity </strong></div></td>
  </tr>

  <tr>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
  </tr>
    <tr>
      
    <td  class="tablecontent11">
      
      <div align="center">
        <input type="text" name="branch" id ="branch" value="Rayagada"> 
      </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target"  id="br_con_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"> </div></td>

  </tr>
   <tr>
     
    <td  class="tablecontent11">
      
      <div align="center">
        <input type="text" name="branch_1" id="branch_1" value="Rourkela">      
      </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth_1"id="br_con_tomonth_1"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_upto_1" id="br_con_upto_1"> </div></td>
  
  </tr>
    
  <% } else   %>
   <%  if(instId.equals("I13"))
	{%>
 
  
     <tr>
     
    <td rowspan="2"  class="tableheader"><div align="center"><strong>Name of Branches</strong></div></td>
    <td colspan="3"  class="tableheader"><div align="center"><strong>Hardware/Software </strong></div></td>
    <td colspan="3"  class="tableheader" ><div align="center"><strong>Internet Connectivity </strong></div></td>
  </tr>

  <tr>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
  </tr>
    <tr>
      
    <td  class="tablecontent11">
      
      <div align="center">
        <input type="text" name="branch" id ="branch" value="Gwalior"> 
      </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target"  id="br_con_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"> </div></td>
</tr>
   <tr>
     
    <td  class="tablecontent11">
      
      <div align="center">
        <input type="text" name="branch_1" id="branch_1" value="Rewa">      
      </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth_1"id="br_con_tomonth_1"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_upto_1" id="br_con_upto_1"> </div></td>
  
  </tr>
    
  <% } else    %>
 <%  if(instId.equals("I7"))
	{%>
 
  
     <tr>
     
    <td rowspan="2"  class="tableheader"><div align="center"><strong>Name of Branches</strong></div></td>
    <td colspan="3"  class="tableheader"><div align="center"><strong>Hardware/Software </strong></div></td>
    <td colspan="3"  class="tableheader" ><div align="center"><strong>Internet Connectivity </strong></div></td>
  </tr>

  <tr>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
  </tr>
    <tr>
      
    <td  class="tablecontent11">
      
      <div align="center">
        <input type="text" name="branch" id ="branch" value="Aurangabad"> 
      </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target"  id="br_con_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"> </div></td>
 
  </tr>
  
    
  <% } else    %>

 <%  if(instId.equals("I19"))
	{%>
 
  
     <tr>
     
    <td rowspan="2"  class="tableheader"><div align="center"><strong>Name of Branches</strong></div></td>
    <td colspan="3"  class="tableheader"><div align="center"><strong>Hardware/Software </strong></div></td>
    <td colspan="3"  class="tableheader" ><div align="center"><strong>Internet Connectivity </strong></div></td>
  </tr>

  <tr>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
  </tr>
    <tr>
      
    <td  class="tablecontent11">
      
      <div align="center">
        <input type="text" name="branch" id ="branch" value="CoimBatore"> 
      </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target"  id="br_con_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"> </div></td>
 
  </tr>
   <tr>
      
    <td  class="tablecontent11">
      
      <div align="center">
        <input type="text" name="branch_1" id="branch_1" value="Tuticorin"> 
      </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth_1"id="br_con_tomonth_1"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_upto_1" id="br_con_upto_1"> </div></td>
  
  </tr>
    
  <% } else      %>
 <%  if(instId.equals("I12"))
	{%>
 
  
     <tr>
     
    <td rowspan="2"  class="tableheader"><div align="center"><strong>Name of Branches</strong></div></td>
    <td colspan="3"  class="tableheader"><div align="center"><strong>Hardware/Software </strong></div></td>
    <td colspan="3"  class="tableheader" ><div align="center"><strong>Internet Connectivity </strong></div></td>
  </tr>

  <tr>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
  </tr>
    <tr>
      
    <td  class="tablecontent11">
      
      <div align="center">
        <input type="text" name="branch" id ="branch" value="Visakhapatnam"> 
      </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target"  id="br_con_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"> </div></td>
  
  </tr>

    
  <% } else   %>
     <%  if(instId.equals("I24"))
	{%>
 
  
     <tr>
     
    <td rowspan="2"  class="tableheader"><div align="center"><strong>Name of Branches</strong></div></td>
    <td colspan="3"  class="tableheader"><div align="center"><strong>Hardware/Software </strong></div></td>
    <td colspan="3"  class="tableheader" ><div align="center"><strong>Internet Connectivity </strong></div></td>
  </tr>

  <tr>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
  </tr>
    <tr>
      
    <td  class="tablecontent11">
      
      <div align="center">
        <input type="text" name="branch" id ="branch" value="Jammu Tawi"> 
      </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target"  id="br_con_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"> </div></td>
  
  </tr>

    
  <% } else     %>
  
   <%  if(instId.equals("I22"))
	{%>
 
  
     <tr>
     
    <td rowspan="2"  class="tableheader"><div align="center"><strong>Name of Branches</strong></div></td>
    <td colspan="3"  class="tableheader"><div align="center"><strong>Hardware/Software </strong></div></td>
    <td colspan="3"  class="tableheader" ><div align="center"><strong>Internet Connectivity </strong></div></td>
  </tr>

  <tr>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
  </tr>
    <tr>
      
    <td  class="tablecontent11">
      
      <div align="center">
        <input type="text" name="branch" id ="branch" value="Dhanbad"> 
      </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target"  id="br_con_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"> </div></td>
  
  </tr>

    
  <% }   else    %>
    <%  if(instId.equals("I14"))
	{%>
 
  
     <tr>
     
    <td rowspan="2"  class="tableheader"><div align="center"><strong>Name of Branches</strong></div></td>
    <td colspan="3"  class="tableheader"><div align="center"><strong>Hardware/Software </strong></div></td>
    <td colspan="3"  class="tableheader" ><div align="center"><strong>Internet Connectivity </strong></div></td>
  </tr>

  <tr>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
  </tr>
    <tr>
      
    <td  class="tablecontent11">
      
      <div align="center">
        <input type="text" name="branch" id ="branch" value="Dimapur"> 
      </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target"  id="br_con_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"> </div></td>
  
  </tr>

    
  <% } else      %>
   <%  if(instId.equals("I11"))
	{%>
 
  
     <tr>
     
    <td rowspan="2"  class="tableheader"><div align="center"><strong>Name of Branches</strong></div></td>
    <td colspan="3"  class="tableheader"><div align="center"><strong>Hardware/Software </strong></div></td>
    <td colspan="3"  class="tableheader" ><div align="center"><strong>Internet Connectivity </strong></div></td>
  </tr>

  <tr>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
  </tr>
    <tr>
      
    <td  class="tablecontent11">
      
      <div align="center">
        <input type="text" name="branch" id ="branch" value="Gulbarga"> 
      </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target"  id="br_con_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"> </div></td>
  
  </tr>

    
  <% } else      %>
  <%  if(instId.equals("I1"))
	{%>
 
  
     <tr>
     
    <td rowspan="2"  class="tableheader"><div align="center"><strong>Name of Branches</strong></div></td>
    <td colspan="3"  class="tableheader"><div align="center"><strong>Hardware/Software </strong></div></td>
    <td colspan="3"  class="tableheader" ><div align="center"><strong>Internet Connectivity </strong></div></td>
  </tr>

  <tr>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
  </tr>
    <tr>
      
    <td  class="tablecontent11">
      
      <div align="center">
        <input type="text" name="branch" id ="branch" value="Aizwal"> 
      </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target"  id="br_con_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"> </div></td>
  
  </tr>

    
  <% } else      %>
  <%  if(instId.equals("I17"))
	{%>
 
  
     <tr>
     
    <td rowspan="2"  class="tableheader"><div align="center"><strong>Name of Branches</strong></div></td>
    <td colspan="3"  class="tableheader"><div align="center"><strong>Hardware/Software </strong></div></td>
    <td colspan="3"  class="tableheader" ><div align="center"><strong>Internet Connectivity </strong></div></td>
  </tr>

  <tr>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
  </tr>
    <tr>
      
    <td  class="tablecontent11">
      
      <div align="center">
        <input type="text" name="branch" id ="branch" value="Bhiwani"> 
      </div></td>
<td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target"  id="br_con_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"> </div></td>
  
  </tr>
 <% }  else      %>
  <%  if(instId.equals("I6"))
	{%>
 
  
     <tr>
     
    <td rowspan="2"  class="tableheader"><div align="center"><strong>Name of Branches</strong></div></td>
    <td colspan="3"  class="tableheader"><div align="center"><strong>Hardware/Software </strong></div></td>
    <td colspan="3"  class="tableheader" ><div align="center"><strong>Internet Connectivity </strong></div></td>
  </tr>

  <tr>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
  </tr>
    <tr>
      
    <td  class="tablecontent11">
      
      <div align="center">
        <input type="text" name="branch" id ="branch" value="Manglore"> 
      </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto"> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_target"  id="br_con_target"> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"> </div></td>
  
  </tr>
 <% }        %>
  <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_senet WHERE months='"+months+"' AND year='"+years+"' AND   inst_id='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>
<tr>
  <td colspan="3"  class="tablecontent1"><div align="left"><strong>AMC of PC,UPS </strong></div></td>
   <td colspan="2"  class="tablecontent1" >
     
      <div align="center">
        <input type="text" name="amc_of_pc" id="amc_of_pc" size="15"value='<%=fix_val1%>'readonly="2"/>
      </div></td>
   <td  class="tablecontent1" >
     
      <div align="center">
        <input type="text" name="amc_of_pc1" id="amc_of_pc1" size="15" value='<%=rsAdminResult.getString("amc_of_pc1")%>'onBlur="fnCalCum(amc_of_pc1,'<%=cum_mon1%>',amc_of_pc2 ,'<%=rsAdminResult.getString("amc_of_pc1")%>')"/>
      </div></td>
	<td  class="tablecontent1" >
	  
      <div align="center">
        <input type="text" name="amc_of_pc2" id="amc_of_pc2" size="15"value='<%=cum_mon1%>'readonly="2"/>
      </div></td>
  </tr>
  <tr>
    <td colspan="3"  class="tablecontent1"><div align="left"><strong>web. Maint. </strong></div></td>
   <td colspan="2"  class="tablecontent2" >
     
      <div align="center">
        <input type="text" name="web" id="web" size="15"value='<%=fix_val2%>'/>
      </div></td>
    <td  class="tablecontent2" >
      
      <div align="center">
        <input type="text" name="web1" id="web1" size="15" value='<%=rsAdminResult.getString("web1")%>'onBlur="fnCalCum(web1,'<%=cum_mon2%>',web2 ,'<%=rsAdminResult.getString("web1")%>')"/>
      </div></td>
	<td  class="tablecontent2" >
	  
      <div align="center">
        <input type="text" name="web2" id="web2" size="15"value='<%=cum_mon2%>'readonly="2"/>
      </div></td>
  </tr>
  <tr>
    <td colspan="3"  class="tablecontent1"><div align="left"><strong>Internet connectivity </strong></div></td>
   <td colspan="2"  class="tablecontent1" >
     
      <div align="center">
        <input type="text" name="connectivity" id="connectivity" size="15"value='<%=fix_val3%>'/>
      </div></td>
   <td  class="tablecontent1" >
     
      <div align="center">
        <input type="text" name="connectivity1" id="connectivity1" size="15" value='<%=rsAdminResult.getString("connectivity1")%>'onBlur="fnCalCum(connectivity1,'<%=cum_mon3%>',connectivity2 ,'<%=rsAdminResult.getString("connectivity1")%>')"/>
      </div></td>
  <td  class="tablecontent1" >
    
      <div align="center">
        <input type="text" name="connectivity2" id="connectivity2" size="15"readonly="2"value='<%=cum_mon3%>'/>
      </div></td>
  </tr>
  <tr>
    <td colspan="3"  class="tablecontent1"><div align="left"><strong>contg.</strong></div></td>
   <td colspan="2"  class="tablecontent2" >
     
      <div align="center">
        <input type="text" name="contg" id="contg" size="15"value='<%=fix_val4%>'/>
      </div></td>
   <td  class="tablecontent2" >
     
      <div align="center">
        <input type="text" name="contg1" id="contg1" size="15"value='<%=rsAdminResult.getString("contg1")%>'onBlur="fnCalCum(contg1,'<%=cum_mon4%>',contg2 ,'<%=rsAdminResult.getString("contg1")%>')"/>
      </div></td>
    <td  class="tablecontent2" >
      
      <div align="center">
        <input type="text" name="contg2" id="contg2" size="15" readonly="2"value='<%=cum_mon4%>'/>
      </div></td>
  </tr>
  <tr>
    <td colspan="3"  class="tablecontent1"><div align="left"><strong>others</strong></div></td>
    <td colspan="2"  class="tablecontent1" >
      
      <div align="center">
        <input type="text" name="others" id="others" size="15"value='<%=fix_val5%>'/>
      </div></td>
    <td  class="tablecontent1" >
      
      <div align="center">
        <input type="text" name="others1" id="others1" size="15"value='<%=rsAdminResult.getString("others1")%>'onBlur="fnCalCum(others1,'<%=cum_mon5%>',others2 ,'<%=rsAdminResult.getString("others1")%>')"/>
      </div></td>
    <td  class="tablecontent1" >
      
      <div align="center">
        <input type="text" name="others2" id="others2" size="15" readonly="2"value='<%=cum_mon5%>'/>
      </div></td>
  </tr>
   <tr>
     
    <td rowspan="2"  class="tableheader"><div align="center"><strong>Name of Branches</strong></div></td>
    <td colspan="3"  class="tableheader"><div align="center"><strong>Hardware/Software </strong></div></td>
    <td colspan="3"  class="tableheader" ><div align="center"><strong>Internet Connectivity </strong></div></td>
  </tr>

  <tr>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
    <td  class="tableheader"><div align="center"><strong>Target</strong></div></td>
    <td  class="tableheader"><div align="center"><strong>During the Month</strong></div></td>
    <td  class="tableheader" ><div align="center"><strong>Up to the month </strong></div></td>
  </tr>
   <%
String strsql21= "select * from tbl_br_senet where months ="+months+" and year='"+years+"' and inst_id='"+instId+"' and Branch IS NOT NULL";
System.out.println(strsql21);
 rsAdminResult1=stmt5.executeQuery(strsql21);
%>
  <% for(int icnt=1;rsAdminResult1.next();icnt++)
{
%>
 <tr>

    <td  class="tablecontent11"><div align="center"><input type="text" name="branch_<%=icnt%>" id="branch_<%=icnt%>"  value='<%=rsAdminResult1.getString("Branch")%>'> </div></td>
	<td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_target_<%=icnt%>" id="br_hardware_target_<%=icnt%>" value='<%=rsAdminResult1.getString("Br_hardware_target")%>'> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_tomonth_<%=icnt%>" id ="br_hardware_tomonth_<%=icnt%>" value='<%=rsAdminResult1.getString("Br_hardware_tomonth")%>'> </div></td>
	  <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto_<%=icnt%>" id="br_hardware_upto_<%=icnt%>" value='<%=rsAdminResult1.getString("Br_hardware_upto")%>'> </div></td>
   <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_hardware_upto_<%=icnt%>"  id="br_hardware_upto_<%=icnt%>" value='<%=rsAdminResult1.getString("Br_con_target")%>'> </div></td>
     <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_tomonth_<%=icnt%>"id="br_con_tomonth_<%=icnt%>" value='<%=rsAdminResult1.getString("Br_con_tomonth")%>'> </div></td>
    <td  class="tablecontent11"> <div align="center"> <input type="text" size="15" name="br_con_upto_<%=icnt%>" id="br_con_upto_<%=icnt%>" value='<%=rsAdminResult1.getString("Br_con_upto")%>'> </div></td>
   </tr>
<% }%>
  
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



<%
if((role.equalsIgnoreCase("SU") ||role.equalsIgnoreCase("IU")) && buttonFlag==0){%>
<html:submit value="Add" onclick="submitForm()" /> &nbsp;
<%}else{%>

<html:submit property="method" value="submit" />
<%}%>
<input class="butt" type="button" name="reset" value="Reset" tabindex="18" onclick="pageReload()"/>&nbsp;
<input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
</html:form>


</body>
</html>
