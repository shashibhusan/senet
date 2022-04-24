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
	obj3.value=temp;
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



function Validator(){
	var numericExpression = /^[0-9]+$/;
	var decimalExpression1=/^-?\d+(\.\d+)?$/;
	var decimalExpression=/^((\d+(\.\d*)?)|((\d*\.)?\d+))$/;	
//***********Budget */
//Carry Forward      
	if (!document.getElementById('1c1').value.match(numericExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('1c1').focus();
                 return false;
      }
	  if (!document.getElementById('1c2').value.match(numericExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('1c2').focus();
                 return false;
      }
	  if (!document.getElementById('1c3').value.match(numericExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('1c3').focus();
                 return false;
      }
	  if (!document.getElementById('1c4').value.match(numericExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('1c4').focus();
                 return false;
      }
	  if (!document.getElementById('1c5').value.match(numericExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('1c5').focus();
                 return false;
      }
	  if (!document.getElementById('1c6').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('1c6').focus();
                 return false;
      }
	  if (!document.getElementById('2c1').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('2c1').focus();
                 return false;
      }
	    if (!document.getElementById('2c2').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('2c2').focus();
                 return false;
      }
	  if (!document.getElementById('2c3').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('2c3').focus();
                 return false;
      } 
	    if (!document.getElementById('2c4').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('2c4').focus();
                 return false;
      }
	    if (!document.getElementById('2c5').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('2c5').focus();
                 return false;
      }
	  if (!document.getElementById('2c6').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('2c6').focus();
                 return false;
      }
	  if (!document.getElementById('3c1').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('3c1').focus();
                 return false;
      }
	   if (!document.getElementById('3c2').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('3c2').focus();
                 return false;
      }
	   if (!document.getElementById('3c3').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('3c3').focus();
                 return false;
      }
	   if (!document.getElementById('3c3').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('3c3').focus();
                 return false;
      }
	   if (!document.getElementById('3c4').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('3c4').focus();
                 return false;
      }
	   if (!document.getElementById('3c4').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('3c4').focus();
                 return false;
      }
	   if (!document.getElementById('3c5').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('3c5').focus();
                 return false;
      }
	   if (!document.getElementById('3c6').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('3c6').focus();
                 return false;
      }
	   if (!document.getElementById('4c2').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('4c2').focus();
                 return false;
      }
	   if (!document.getElementById('4c3').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('4c3').focus();
                 return false;
      }
	  if (!document.getElementById('4c1').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('4c1').focus();
                 return false;
      }
	  if (!document.getElementById('4c4').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('4c4').focus();
                 return false;
      }
	   if (!document.getElementById('4c5').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('4c5').focus();
                 return false;
      }
	  if (!document.getElementById('4c6').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in ISO Field!");
                 document.getElementById('4c6').focus();
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

<script language="javascript"> 
 
    function keyPressed(TB, e)  
    { 
        if (e.keyCode == 40 || e.keyCode == 13) { 
            if (TB.split("c")[0] < 7) 
            document.getElementById(eval(TB.split("c")[0] + '+1') + 'c' + TB.split("c")[1]).focus(); 
        } 
 
 
        if (e.keyCode == 38) { 
            if(TB.split("c")[0] > 1) 
            document.getElementById(eval(TB.split("c")[0] + '-1') + 'c' + TB.split("c")[1]).focus(); 
 
        } 
    } 
</script>


<script type="text/javascript">
            function submitForm()
            {
                document.forms[0].action = "ISOAction.do?method=add";
                document.forms[0].submit();
            }
        </script>
</head>

<body bgcolor="#FBFBFB">

<html:form action="ISOAction" onsubmit="return Validator()">
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
	try{
Connection con = ConnectionManager.getConnectionDirectForMySQL();
Statement stmt4 = (Statement)con.createStatement();
 Statement stmt = (Statement)con.createStatement();
if(role.equalsIgnoreCase("AU")){	
		 String strSql = "select * from tbl_iso where months =" + months +" and year='"+years+"' and inst_id='"+instId+"'";
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
String strSql = "SELECT * FROM tbl_iso WHERE months="+months+" AND year='"+years+"' AND   inst_id='"+instId+"'"; 
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




String strCumulative=" SELECT sum(GENERALappication_received_during_month),sum(GENERALappication_disburded_during_month),sum(GENERALamount_disburded_during_month) ,sum(NERappication_received_during_month),sum(NERappication_disburded_during_month),sum(NERamount_disburded_during_month),sum(SCPappication_received_during_month),sum(SCPappication_disburded_during_month),sum(SCPamount_disburded_during_month),sum(TSPappication_received_during_month),sum(TSPappication_disburded_during_month),sum(TSPamount_disburded_during_month) FROM tbl_iso where months >=1 AND months <="+months+" and year='"+years+"' and inst_id='"+instId+"'";

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
	      int cum_mon12=0;
		int cum_mon11=0;
	    
ResultSet rsCumulative=stmt.executeQuery(strCumulative);

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
%><div style="font-size:large;font-family:Verdana;font-weight:bold;  " align="center" ><font color="#990000"> Monthly Progress Status of ISO Application Received in the month <%=rs_month.getString("mon")%></font></div>

<br /><br />

<br> 
<input type="hidden" size="5" name="months" value="<%=request.getParameter("months")%>" />
<input type="hidden" size="5" name="years" value="<%=request.getParameter("years")%>" />
<input type="hidden" size="5" name="instId" value="<%=request.getParameter("instId")%>" />
<input type="hidden" size="5" name="user_date" value='<%=years%>-<%=months%>-20' />
<table width="100%" border="0" align="center">
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
   <td class="tablecontent11" >GENERAL</td>
   <td class="tablecontent1"><input type="text" name="GENERALappication_received_during_month" id="1c1" value="0" size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon1%>', GENERALappication_received_upto_month)"onkeyup="keyPressed(this.id,event)"/></td>
   <td class="tablecontent1"><input type="text" name="GENERALappication_disburded_during_month" id="1c2"value="0" size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon2%>', GENERALappication_disburded_upto_month)" onkeyup="keyPressed(this.id,event)"/></td>
	<td class="tablecontent1"><input type="text" name="GENERALamount_disburded_during_month" id="1c3" value="0" size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon3%>', GENERALamount_disburded_upto_month)"onkeyup="keyPressed(this.id,event)"/></td>
  
  <td class="tablecontent1"><input type="text" name="GENERALappication_received_upto_month" id="1c4" size="10" value='<%=cum_mon1%>'onkeyup="keyPressed(this.id,event)"/></td>
  <td class="tablecontent1"><input type="text" name="GENERALappication_disburded_upto_month" id="1c5" size="10" value='<%=cum_mon2%>'onkeyup="keyPressed(this.id,event)"/></td>
  <td class="tablecontent1"><input type="text" name="GENERALamount_disburded_upto_month" id="1c6" size="10" value='<%=cum_mon3%>'onkeyup="keyPressed(this.id,event)"/></td>
  </tr>
  <tr>
   <td class="tablecontent12" >NER</td>
   <td class="tablecontent1"><input type="text" name="NERappication_received_during_month" id="2c1" value="0" size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon4%>', NERappication_received_upto_month)"onkeyup="keyPressed(this.id,event)"/></td>
    <td class="tablecontent2"><input type="text" name="NERappication_disburded_during_month" id="2c2" value="0"  size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon5%>', NERappication_disburded_upto_month)"onkeyup="keyPressed(this.id,event)"/></td>
	<td class="tablecontent2"><input type="text" name="NERamount_disburded_during_month" id="2c3" value="0" size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', NERamount_disburded_upto_month)"onkeyup="keyPressed(this.id,event)"/></td>
   <td class="tablecontent2"><input type="text" name="NERappication_received_upto_month" id="2c4" size="10" value='<%=cum_mon4%>'onkeyup="keyPressed(this.id,event)"/></td>
	<td class="tablecontent2"><input type="text" name="NERappication_disburded_upto_month" id="2c5" size="10" value='<%=cum_mon5%>'onkeyup="keyPressed(this.id,event)"/></td>
   <td class="tablecontent2"> <input type="text" name="NERamount_disburded_upto_month" id="2c6" size="10" value='<%=cum_mon6%>'onkeyup="keyPressed(this.id,event)"/></td>
  </tr>
  <tr>
   <td class="tablecontent11" >SCP</td>
   <td class="tablecontent1"><input type="text" name="SCPappication_received_during_month" id="3c1" value="0" size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon7%>', SCPappication_received_upto_month)"onkeyup="keyPressed(this.id,event)"/></td>
  <td class="tablecontent1"><input type="text" name="SCPappication_disburded_during_month" id="3c2"value="0"  size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon8%>', SCPappication_disburded_upto_month)"onkeyup="keyPressed(this.id,event)" /></td>
   <td class="tablecontent1"><input type="text" name="SCPamount_disburded_during_month" id="3c3" value="0" size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon9%>', SCPamount_disburded_upto_month)"onkeyup="keyPressed(this.id,event)"/></td>
    <td class="tablecontent1"><input type="text" name="SCPappication_received_upto_month" id="3c4" size="10" value='<%=cum_mon7%>'onkeyup="keyPressed(this.id,event)"/></td>
   <td class="tablecontent1"><input type="text" name="SCPappication_disburded_upto_month" id="3c5" size="10" value='<%=cum_mon8%>'onkeyup="keyPressed(this.id,event)"/></td>
   <td class="tablecontent1"><input type="text" name="SCPamount_disburded_upto_month" id="3c6" size="10" value='<%=cum_mon9%>'onkeyup="keyPressed(this.id,event)"/></td>
  </tr>
  <tr>
   <td class="tablecontent12" >TSP</td>
   <td class="tablecontent2"><input type="text" name="TSPappication_received_during_month" id="4c1" value="0" size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon10%>', TSPappication_received_upto_month)"onkeyup="keyPressed(this.id,event)"/></td>
   <td class="tablecontent2"><input type="text" name="TSPappication_disburded_during_month" id="4c2" value="0" size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon11%>', TSPappication_disburded_upto_month)"onkeyup="keyPressed(this.id,event)"/></td>
   <td class="tablecontent2"><input type="text" name="TSPamount_disburded_during_month" id="4c3" value="0" size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon12%>', TSPamount_disburded_upto_month)"onkeyup="keyPressed(this.id,event)"/></td>
   <td class="tablecontent2"><input type="text" name="TSPappication_received_upto_month" id="4c4" size="10" value='<%=cum_mon10%>' onkeyup="keyPressed(this.id,event)"/></td>
   <td class="tablecontent2"><input type="text" name="TSPappication_disburded_upto_month" id="4c5" size="10" value='<%=cum_mon11%>' onkeyup="keyPressed(this.id,event)"/></td>
    <td class="tablecontent2"><input type="text" name="TSPamount_disburded_upto_month" id="4c6" size="10" value='<%=cum_mon12%>' onkeyup="keyPressed(this.id,event)"/></td>
  </tr>
       <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_iso WHERE months="+months+" AND year='"+years+"' AND   inst_id='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>
 <tr>
   <td class="tablecontent11" >GENERAL</td>
   <td class="tablecontent1"><input type="text" name="GENERALappication_received_during_month" id="1c1" size="10" value='<%=rsAdminResult.getString("GENERALappication_received_during_month")%>' onBlur="fnCalCum(GENERALappication_received_during_month,'<%=cum_mon1%>',GENERALappication_received_upto_month ,'<%=rsAdminResult.getString("GENERALappication_received_during_month")%>')"/></td>
   <td class="tablecontent1"><input type="text" name="GENERALappication_disburded_during_month" id="1c2" size="10" value='<%=rsAdminResult.getString("GENERALappication_disburded_during_month")%>' onBlur="fnCalCum(GENERALappication_disburded_during_month,'<%=cum_mon2%>',GENERALappication_disburded_upto_month ,'<%=rsAdminResult.getString("GENERALappication_disburded_during_month")%>')"/></td>
	<td class="tablecontent1"><input type="text" name="GENERALamount_disburded_during_month" id="1c3" size="10" value='<%=rsAdminResult.getString("GENERALamount_disburded_during_month")%>' onBlur="fnCalCum(GENERALamount_disburded_during_month,'<%=cum_mon3%>',GENERALamount_disburded_upto_month ,'<%=rsAdminResult.getString("GENERALamount_disburded_during_month")%>')"/></td>
  
  <td class="tablecontent1"><input type="text" name="GENERALappication_received_upto_month" id="1c4" size="10" value='<%=cum_mon1%>'/></td>
  <td class="tablecontent1"><input type="text" name="GENERALappication_disburded_upto_month" id="1c5" size="10" value='<%=cum_mon2%>'/></td>
  <td class="tablecontent1"><input type="text" name="GENERALamount_disburded_upto_month" id="1c6" size="10" value='<%=cum_mon3%>'/></td>
  </tr>
  <tr>
   <td class="tablecontent12" >NER</td>
   <td class="tablecontent2"><input type="text" name="NERappication_received_during_month" id="2c1" size="10" value='<%=rsAdminResult.getString("NERappication_received_during_month")%>' onBlur="fnCalCum(NERappication_received_during_month,'<%=cum_mon4%>',NERappication_received_upto_month ,'<%=rsAdminResult.getString("NERappication_received_during_month")%>')"/></td>
    <td class="tablecontent2"><input type="text" name="NERappication_disburded_during_month" id="2c2" size="10" value='<%=rsAdminResult.getString("NERappication_disburded_during_month")%>' onBlur="fnCalCum(NERappication_disburded_during_month,'<%=cum_mon5%>',NERappication_disburded_upto_month ,'<%=rsAdminResult.getString("NERappication_disburded_during_month")%>')"/></td>
	<td class="tablecontent2"><input type="text" name="NERamount_disburded_during_month" id="2c3" size="10" value='<%=rsAdminResult.getString("NERamount_disburded_during_month")%>' onBlur="fnCalCum(NERamount_disburded_during_month,'<%=cum_mon6%>',NERamount_disburded_upto_month ,'<%=rsAdminResult.getString("NERamount_disburded_during_month")%>')"/></td>
   <td class="tablecontent2"><input type="text" name="NERappication_received_upto_month" id="2c4" size="10" value='<%=cum_mon4%>'/></td>
	<td class="tablecontent2"><input type="text" name="NERappication_disburded_upto_month" id="2c5" size="10" value='<%=cum_mon5%>'/></td>
   <td class="tablecontent2"><input type="text" name="NERamount_disburded_upto_month" id="2c6" size="10" value='<%=cum_mon6%>'/></td>
  </tr>
  <tr>
   <td class="tablecontent11" >SCP</td>
   <td class="tablecontent1"><input type="text" name="SCPappication_received_during_month" id="3c1" size="10" value='<%=rsAdminResult.getString("SCPappication_received_during_month")%>' onBlur="fnCalCum(SCPappication_received_during_month,'<%=cum_mon7%>',SCPappication_received_upto_month ,'<%=rsAdminResult.getString("SCPappication_received_during_month")%>')"/></td>
  <td class="tablecontent1"><input type="text" name="SCPappication_disburded_during_month" id="3c2" size="10"  value='<%=rsAdminResult.getString("SCPappication_disburded_during_month")%>' onBlur="fnCalCum(SCPappication_disburded_during_month,'<%=cum_mon8%>',SCPappication_disburded_upto_month ,'<%=rsAdminResult.getString("SCPappication_disburded_during_month")%>')"/></td>
   <td class="tablecontent1"><input type="text" name="SCPamount_disburded_during_month" id="3c3" size="10" value='<%=rsAdminResult.getString("SCPamount_disburded_during_month")%>' onBlur="fnCalCum(SCPamount_disburded_during_month,'<%=cum_mon9%>',SCPamount_disburded_upto_month ,'<%=rsAdminResult.getString("SCPamount_disburded_during_month")%>')"/></td>
    <td class="tablecontent1"><input type="text" name="SCPappication_received_upto_month" id="3c4" size="10" value='<%=cum_mon7%>'/></td>
   <td class="tablecontent1"><input type="text" name="SCPappication_disburded_upto_month" id="3c5" size="10" value='<%=cum_mon8%>'/></td>
   <td class="tablecontent1"><input type="text" name="SCPamount_disburded_upto_month" id="3c6" size="10" value='<%=cum_mon9%>'/></td>
  </tr>
  <tr>
   <td class="tablecontent12" >TSP</td>
   <td class="tablecontent2"><input type="text" name="TSPappication_received_during_month" id="4c1" size="10" value='<%=rsAdminResult.getString("TSPappication_received_during_month")%>' onBlur="fnCalCum(TSPappication_received_during_month,'<%=cum_mon10%>',TSPappication_received_upto_month ,'<%=rsAdminResult.getString("TSPappication_received_during_month")%>')"/></td>
   <td class="tablecontent2"><input type="text" name="TSPappication_disburded_during_month" id="4c2" size="10" value='<%=rsAdminResult.getString("TSPappication_disburded_during_month")%>' onBlur="fnCalCum(TSPappication_disburded_during_month,'<%=cum_mon11%>',TSPappication_disburded_upto_month ,'<%=rsAdminResult.getString("TSPappication_disburded_during_month")%>')"/></td>
   <td class="tablecontent2"><input type="text" name="TSPamount_disburded_during_month" id="4c3" size="10" value='<%=rsAdminResult.getString("TSPamount_disburded_during_month")%>' onBlur="fnCalCum(TSPamount_disburded_during_month,'<%=cum_mon12%>',TSPamount_disburded_upto_month ,'<%=rsAdminResult.getString("TSPamount_disburded_during_month")%>')"/></td>
   <td class="tablecontent2"><input type="text" name="TSPappication_received_upto_month" id="4c4" size="10" value='<%=cum_mon10%>'/></td>
   <td class="tablecontent2"><input type="text" name="TSPappication_disburded_upto_month" id="4c5" size="10" value='<%=cum_mon11%>'/></td>
    <td class="tablecontent2"><input type="text" name="TSPamount_disburded_upto_month" id="4c6" size="10" value='<%=cum_mon12%>'/></td>
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
</body>
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

</html>
