<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="inb.css" rel="stylesheet" type="text/css">
    
<script>
//   var ss =  sessionStorage.getItem('uniqueIdSessionStorage');
//    if(ss==='' || ss===null)
//    {
//    window.location='slogin.jsp';
//    }
</script>
<script language=JavaScript>

var message="Function Disabled!";

///////////////////////////////////
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

<script>

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
       
	if  ((!document.getElementById('amc_of_pc1').value.match(numericExpression)) || !document.getElementById('amc_of_pc1').value < 0)
      {
                 alert("Please insert numeric value in AMC_of_pc Field!");
                 document.getElementById('amc_of_pc1').focus();
                 return false;
      }
	  if ((!document.getElementById('web1').value.match(numericExpression)) || !document.getElementById('web1').value < 0)
      {
                 alert("Please insert numeric value in web Mant. Field!");
                 document.getElementById('web1').focus();
                 return false;
      }
	  if ((!document.getElementById('connectivity1').value.match(numericExpression))|| !document.getElementById('connectivity1').value < 0)
      {
                 alert("Please insert numeric value in Internet Connectivity Field!");
                 document.getElementById('connectivity1').focus();
                 return false;
      }
	  if ((!document.getElementById('contg1').value.match(numericExpression))|| !document.getElementById('contg1').value < 0)
      {
                 alert("Please insert numeric value in Contg. Field!");
                 document.getElementById('contg1').focus();
                 return false;
      }
	    if ((!document.getElementById('others1').value.match(numericExpression))|| !document.getElementById('others1').value < 0)
      {
                 alert("Please insert numeric value in HardWare/Software Field!");
                 document.getElementById('others1').focus();
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


function refresh()
           {
               //alert("===working====");
               document.getElementById("captcha").src='Cap_Img.jsp?'+(new Date().getTime());
           }
</script>







<script type="text/javascript">
            function submitForm()
            {
                if(document.getElementById('formcaptcha').value==="" || document.getElementById('formcaptcha').value===null)
                    {
                        alert("Please fill captcha detail");
                         document.getElementById('formcaptcha').focus();
                        return false;
                    }else
                        {
                            document.forms[0].action = "SenettargetAction.do?method=add";
                            document.forms[0].submit();
                        }
            }
        </script>
</head>

<body bgcolor="#FFFFFF">

<% try 
{
 String Random5=(String)session.getAttribute("Random5");
String mnm = request.getParameter("mnm");
System.out.println("prakash chandradeynccffffff ---------chanda financial page======"+Random5);
System.out.println("prakash chandradeynccffffff ---------chanda financial page ======"+mnm);
if(Random5.equals(mnm))
{%>
<%String instId=(String)session.getAttribute("CmbIns");
 String role=(String)session.getAttribute("rol");
//String instId=(String)session.getAttribute("CmbIns");
String years=(String)session.getAttribute("CmbYear");
String months=(String)session.getAttribute("CmbMonth");
String user=(String)session.getAttribute("user");
//String mnm = request.getParameter("mnm");
//String role = request.getParameter("role");
System.out.println(months);
System.out.println(mnm);
System.out.println(role);

%>
<%
if ( (instId.matches("[a-zA-Z_0-9 ]+")) && ((years.length()==9) && (years.substring(0, 1).matches("[0-9]"))) &&( months.matches("[0-9]+")))  {
	System.out.println("pattern matches");

%>

    <html:form action="SenettargetAction" onsubmit="return formValidator();">


<% 
int flag=0,status=0,flag1=0;
	ResultSet rsAdminResult = null;
		int divFlag=0,buttonFlag=0;
		String readOnlyFlag="";
		String userDate=months+"/"+years;
	// int tYears = Integer.parseInt(years);
	//if(months=="JANUARY" || months=="FEBRUARY" || months=="MARCH"){
	if(months.equalsIgnoreCase("10") || months.equalsIgnoreCase("11") || months.equalsIgnoreCase("12")){
		//tYears = tYears-1;
		flag1=1;
	}
	try{
Connection con = ConnectionManager.getConnectionDirectForMySQL();
Statement stmt4 = (Statement)con.createStatement();
 Statement stmt = (Statement)con.createStatement();
if(role.equalsIgnoreCase("IU")){	
		 String strSql = "select * from tbl_targetsenet where months ='" + months +"' and year="+years+" and instid='"+instId+"'";
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
String strSql = "SELECT * FROM tbl_targetsenet WHERE   year='"+years+"' AND   inst_id='"+instId+"'"; 
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
<br/>

<br/>
<div style="font-size:large;font-family:Verdana;font-weight:bold" align="center"><font color="#990000">  <%=rs_instName.getString("INST_NAME")%> </font></div>
<div style="font-size:large;font-family:Verdana;font-weight:bold" align="center"><font color="#990000">  Enter Target for Monthly Progress Report of Senet Expenditure ,  <%=years%></font></div>
<br />
<input type="hidden" size="5" name="months" value="<%=months%>" />
<input type="hidden" size="5" name="years" value="<%=years%>" />
<input type="hidden" size="5" name="instId" value="<%=instId%>" />
<input type="hidden" size="5" name="mnm" value="<%=mnm%>" />
<input type="hidden" size="5" name="user_date" value='<%=years%>-<%=months%>-20' />

<table width="674" border="0" align="center" class="style1" style="width: 686; height: 145px; background-color: gainsboro;" cellpadding="0" cellspacing="0">
  <tr class="tablecontent1">
    <td width="574" class="tableheader">Amount Sanctioned for </td>
    <td width="100"  align="center" class="tableheader">Amount Sanctioned </td>
  </tr>
     <%if(divFlag==0){%>
 <tr>
   <td class="tablecontent11">AMC of PC,UPS </td>
   <td  class="tablecontent1" ><input type="text" name="amc_of_pc1" id="amc_of_pc1" size="15"/></td>
  </tr>
  <tr>
   <td class="tablecontent12">WEB. Maint. </td>
   <td  class="tablecontent2" ><input type="text" name="web1" id="web1" size="15"/></td>
  </tr>
  <tr>
   <td class="tablecontent11">Internet Connectivity </td>
   <td  class="tablecontent1" ><input type="text" name="connectivity1" id="connectivity1" size="15"/></td>
  </tr>
  <tr>
   <td class="tablecontent12">Contg.</td>
   <td  class="tablecontent2" ><input type="text" name="contg1" id="contg1" size="15"/></td>
  </tr>
  <tr>
    <td class="tablecontent11">Hardware/Software</td>
 <td  class="tablecontent1" ><input type="text" name="others1" id="others1" size="15"/></td>
  </tr>
 
     <%--  Raghav Start here --%>
  <tr>
    <td class="tablecontent11">Re-validation Amount</td>
 <td  class="tablecontent1" ><input type="text" name="others1" id="others1" size="15"/></td>
  </tr>
  <%--  Raghav End here --%>
  
   <%  if(instId.equals("I10"))
	{%>
	
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Tezpur)<input type="hidden" name="branch" id ="branch" value="Tezpur">
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" /> </div></td>

  </tr>  <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target" /> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target" /> </div></td>
   
  </tr>

  <%-- Raghav --%>
  <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Re-validation Amount </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target" /> </div></td>

  </tr>

  <%-- End --%>
  
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Silchar)<input type="hidden" name="branch_1" id="branch_1" value="Silchar">
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
<td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1" /> </div></td>
    
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_1"  id="br_contg_target_1" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_1"  id="br_others_target_1" /> </div></td>
   
  </tr><tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Diphu)<input type="hidden" name="branch_2" id="branch_2" value="Diphu">
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_2" id="br_hardware_target_2"> </div></td>
    
  </tr>  <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_2"  id="br_con_target_2" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_2"  id="br_contg_target_2" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_2"  id="br_others_target_2" /> </div></td>
  
  </tr><tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Shilong)<input type="hidden" name="branch_3"id="branch_3" value="Shilong"> 
	 </div></td>
  </tr>
  
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_3" id="br_hardware_target_3"> </div></td>
    
  </tr>    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_3"  id="br_con_target_3" /> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_3"  id="br_contg_target_3" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_3"  id="br_others_target_3" /> </div></td>
    
  </tr>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Tura)<input type="hidden" name="branch_4" id="branch_4" value="Tura">
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_4" id="br_hardware_target_4"> </div></td>
   
  </tr> <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_4"  id="br_con_target_4" /> </div></td>
  
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_4"  id="br_contg_target_4" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_4"  id="br_others_target_4" /> </div></td>
  
  </tr>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Itanagar)<input type="hidden" name="branch_5" id="branch_5" value="Itanagar">  
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_5" id="br_hardware_target_5"> </div></td>
   
  </tr>  <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_5"  id="br_con_target_5" /> </div></td>
  
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_5"  id="br_contg_target_5" /> </div></td>
  
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_5"  id="br_others_target_5" /> </div></td>
   
  </tr>
  
  <% } else %>
  <%  if(instId.equals("I4"))
	{%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Varanasi)<input type="hidden" name="branch" id ="branch" value="Varanasi" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" /> </div></td>

  </tr>  <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target" /> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target" /> </div></td>
   
  </tr>
  <% } else %>
  <%  if(instId.equals("I3"))
	{%>
   <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Rajkot) <input type="hidden" name="branch" id ="branch" value=" Rajkot" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" /> </div></td>

  </tr>  <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target" /> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target" /> </div></td>
   
  </tr>
  
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Silvassa)<input type="hidden" name="branch_1" value=" Silvassa" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
<td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1" /> </div></td>
    
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_1"  id="br_contg_target_1" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_1"  id="br_others_target_1" /> </div></td>
   
  </tr><tr>
 
  <% } else %>
  <%  if(instId.equals("I8"))
	{%>
 <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Durgapur)<input type="hidden" name="branch" id ="branch" value="Durgapur" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" /> </div></td>

  </tr>  <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target" /> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target" /> </div></td>
   
  </tr>
  
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Siliguri)<input type="hidden" name="branch_1" id="branch_1" value="Siliguri" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
<td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1" /> </div></td>
    
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_1"  id="br_contg_target_1" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_1"  id="br_others_target_1" /> </div></td>
   
  </tr><tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Suri) <input type="hidden" name="branch_2" id="branch_2" value="Suri" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_2" id="br_hardware_target_2"> </div></td>
    
  </tr>  <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_2"  id="br_con_target_2" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_2"  id="br_contg_target_2" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_2"  id="br_others_target_2" /> </div></td>
  
  </tr><tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Port Blair) <input type="hidden" name="branch_3"id="branch_3" value="Port Blair" />
	 </div></td>
  </tr>
  
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_3" id="br_hardware_target_3"> </div></td>
    
  </tr>    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_3"  id="br_con_target_3" /> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_3"  id="br_contg_target_3" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_3"  id="br_others_target_3" /> </div></td>
    
  </tr>
  <% } else  %>
  <%  if(instId.equals("I9"))
	{%>
   <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Rayagada) <input type="hidden" name="branch" id ="branch" value="Rayagada" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" /> </div></td>

  </tr>  <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target" /> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target" /> </div></td>
   
  </tr>
  
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Rourkela)<input type="hidden" name="branch_1" id="branch_1" value="Rourkela" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
<td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1" /> </div></td>
    
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_1"  id="br_contg_target_1" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_1"  id="br_others_target_1" /> </div></td>
   
  </tr><tr>
 
   <% } else   %>
  <%  if(instId.equals("I13"))
	{%>
    <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Gwalior) <input type="hidden" name="branch" id ="branch" value="Gwalior" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" /> </div></td>

  </tr>  <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target" /> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target" /> </div></td>
   
  </tr>
  
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Rewa)<input type="hidden" name="branch_1" id="branch_1" value="Rewa" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
<td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1" /> </div></td>
    
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_1"  id="br_contg_target_1" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_1"  id="br_others_target_1" /> </div></td>
   
  </tr><tr>
  <% } else    %>
  <%  if(instId.equals("I7"))
	{%>
   <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Aurangabad) <input type="hidden" name="branch" id ="branch" value="Aurangabad" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" /> </div></td>

  </tr>  <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target" /> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target" /> </div></td>
   
  </tr>
  <% } else    %>
  <%  if(instId.equals("I19"))
	{%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(CoimBatore) <input type="hidden" name="branch" id ="branch" value="CoimBatore" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" /> </div></td>

  </tr>  <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target" /> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target" /> </div></td>
   
  </tr>
  
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Tuticorin)<input type="hidden" name="branch_1" id="branch_1" value="Tuticorin" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
<td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1" /> </div></td>
    
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_1"  id="br_contg_target_1" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_1"  id="br_others_target_1" /> </div></td>
   
  </tr><% } else      %>
  <%  if(instId.equals("I12"))
	{%>
  
 <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Visakhapatnam) <input type="hidden" name="branch" id ="branch" value="Visakhapatnam" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" /> </div></td>

  </tr>  <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target" /> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target" /> </div></td>
   
  </tr>
  
  <tr>
  <% } else   %>
  <%  if(instId.equals("I24"))
	{%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Jammu Tawi) <input type="hidden" name="branch" id ="branch" value="Jammu Tawi" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" /> </div></td>

  </tr>  <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target" /> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target" /> </div></td>
   
  </tr>
  
  <tr>
  <% } else     %>
  <%  if(instId.equals("I22"))
	{%>
 <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Dhanbad) <input type="hidden" name="branch" id ="branch" value="Dhanbad" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" /> </div></td>

  </tr>  <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target" /> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target" /> </div></td>
   
  </tr>
  
  <tr>
  <% }   else    %>
  <%  if(instId.equals("I14"))
	{%>
 <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Dimapur) <input type="hidden" name="branch" id ="branch" value="Dimapur" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" /> </div></td>

  </tr>  <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target" /> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target" /> </div></td>
   
  </tr>
  
  <tr>
  <% } else      %>
  <%  if(instId.equals("I11"))
	{%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Gulbarga) <input type="hidden" name="branch" id ="branch" value="Gulbarga" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" /> </div></td>

  </tr>  <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target" /> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target" /> </div></td>
   
  </tr>
  <% } else      %>
  <%  if(instId.equals("I1"))
	{%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Aizwal) <input type="hidden" name="branch" id ="branch" value="Aizwal" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" /> </div></td>

  </tr>  <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target" /> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target" /> </div></td>
   
  </tr>
  <% } else      %>
  <%  if(instId.equals("I17"))
	{%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Bhiwani) <input type="hidden" name="branch" id ="branch" value="Bhiwani" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" /> </div></td>

  </tr>  <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target" /> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target" /> </div></td>
   
  </tr>
  <% }  else      %>
  <%  if(instId.equals("I6"))
	{%>
 
   <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Manglore) <input type="hidden" name="branch" id ="branch" value="Manglore" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="1"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" /> </div></td>

  </tr>  <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target" /> </div></td>
   
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target" /> </div></td>
    
  </tr>
    <tr> <td  class="tablecontent11" colspan="1"><div align="left"><strong>Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target" /> </div></td>
   
  </tr>
  <% }        %>

  
       <% } else if(divFlag==1){
  String strSql = "SELECT * FROM  tbl_targetsenet WHERE year='"+years+"' AND   inst_id='"+instId+"'";
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>
<tr>
   <td class="tablecontent11">AMC of PC,UPS </td>
   <td  class="tablecontent1" ><input type="text" name="amc_of_pc1" id="amc_of_pc1" size="15"value='<%=rsAdminResult.getString("AMC_of_pc1")%>'/></td>
  </tr>
  <tr>
   <td class="tablecontent12">WEB. Maint. </td>
   <td  class="tablecontent2" ><input type="text" name="web1" id="web1" size="15"value='<%=rsAdminResult.getString("web1")%>'/></td>
  </tr>
  <tr>
   <td class="tablecontent11">Internet Connectivity </td>
   <td  class="tablecontent1" ><input type="text" name="connectivity1" id="connectivity1" size="15"value='<%=rsAdminResult.getString("Connectivity1")%>'/></td>
  </tr>
  <tr>
   <td class="tablecontent12">Contg.</td>
   <td  class="tablecontent2" ><input type="text" name="contg1" id="contg1" size="15"value='<%=rsAdminResult.getString("Contg1")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent11">HardWare/Software</td>
 <td  class="tablecontent1" ><input type="text" name="others1" id="others1" size="15"value='<%=rsAdminResult.getString("Others1")%>'/></td>
  </tr>
 <%-- Raghav Start--%>
<%  int Total=0;
Connection conn = ConnectionManager.getConnectionDirectForMySQL();
      Statement stmt1 = conn.createStatement();
      String sql0="SELECT  * FROM revalidationAmount where year='"+years+"' AND   inst='"+instId+"'";
      ResultSet resultSet = stmt1.executeQuery(sql0);
     while(resultSet.next()){
       
        Total=Total+Integer.parseInt(resultSet.getString("amount")); }
       
%>
 <tr>
    <td class="tablecontent12">Re-validation Amount</td>
    <td  class="tablecontent2" ><input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total%>'  readonly="2"/></td>
  </tr>
 <%-- Raghav End  --%>
  
<%}

%>
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
     <br/>
<img id="captcha" height="30" style=" width: 100px; border: 1px #000000 solid;" src="<c:url value="Cap_Img.jsp" />" width="90">
 <a href="JavaScript:refresh()"><img src="images/refresh.png" style="border:none; width: 20px; height: 20px; position: relative;" /></a>
<input type="text" name="formcaptcha" id="formcaptcha" size="15"/><br/><br/>

<%
if(role.equalsIgnoreCase("SU") && buttonFlag==0){%>
<html:submit property="method" value="update" /> &nbsp;
<%}else{%>
<html:submit value="Add" onclick="return submitForm();" />
<%}%>
<input class="butt" type="button" name="reset" value="Reset" tabindex="18" onclick="pageReload()"/>&nbsp;
<input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
</html:form>
<%	
} else {
    response.sendRedirect("stat.jsp");
}

 %>
 <%	
} else {
    response.sendRedirect("stat.jsp");
}


 %>
 <%
 } catch (Exception e) {
	System.out.println("Duplicate vcvcEntry");
	%>
	<a href="Session.jsp" target="_top" id="linkid">GO HERE</a>
	<%
	}
	
	


 %>
</html>
