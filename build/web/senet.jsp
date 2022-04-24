<%
String sessionid = request.getSession().getId();
response.setHeader("SET-COOKIE", "JSESSIONID=" + sessionid + "; HttpOnly");
%>
<%
           // Set to expire far in the past.
     response.setDateHeader("Expires", 0);
  // Set standard HTTP/1.1 no-cache headers.
     response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
  // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
     response.addHeader("Cache-Control", "post-check=0, pre-check=0");
  // Set standard HTTP/1.0 no-cache header.
     response.setHeader("Pragma", "no-cache");
          request.getSession(false);
        %>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page autoFlush="true" buffer="1094kb"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>Untitled Document</title>
<link href="inb.css" rel="stylesheet" type="text/css">
    
<script>
var ss =  sessionStorage.getItem('uniqueIdSessionStorage');
if(ss==='' || ss===null)
{
    window.location='slogin.jsp';
}
</script>
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
	//var numericExpression = /^[0-9]+$/;
	var numericExpression=/^-?\d+(\.\d+)?$/;
	//var decimalExpression=/^((\d+(\.\d*)?)|((\d*\.)?\d+))$/;
	var re=/^[A-z]+$/; 
	
	if(document.getElementById('formcaptcha').value==="" || document.getElementById('formcaptcha').value===null)
                    {
                        alert("Please fill captcha detail");
                         document.getElementById('formcaptcha').focus();
                        return false;
                    }
    
	if ((!document.getElementById('amc_of_pc1').value.match(numericExpression)) || !document.getElementById('amc_of_pc1').value < 0)
      {
                 alert("Please insert numeric positive value in amc_of_pc Field!");
                 document.getElementById('amc_of_pc1').focus();
                 return false;
      }
	  if ((!document.getElementById('web1').value.match(numericExpression)) || !document.getElementById('web1').value < 0)
      {
                 alert("Please insert numeric positive value in web Field!");
                 document.getElementById('web1').focus();
                 return false;
      }
	  if ((!document.getElementById('connectivity1').value.match(numericExpression))|| !document.getElementById('connectivity1').value < 0)
      {
                 alert("Please insert numeric positive value in connectivity Field!");
                 document.getElementById('connectivity1').focus();
                 return false;
      }
	  if ((!document.getElementById('contg1').value.match(numericExpression))|| !document.getElementById('contg1').value < 0)
      {
                 alert("Please insert numeric value in contg Field!");
                 document.getElementById('contg1').focus();
                 return false;
      }
	    if ((!document.getElementById('others1').value.match(numericExpression))|| !document.getElementById('others1').value < 0)
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('others1').focus();
                 return false;
      }
	  if ((!document.getElementById('br_hardware_target').value.match(numericExpression))|| !document.getElementById('br_hardware_target').value < 0)
      {
                 alert("Please insert numeric value in web Field!");
                 document.getElementById('br_hardware_target').focus();
                 return false;
      }
	  if( (!document.getElementById('br_hardware_tomonth').value.match(numericExpression))|| !document.getElementById('br_hardware_tomonth').value < 0)
      {
                 alert("Please insert numeric value in connectivity Field!");
                 document.getElementById('br_hardware_tomonth').focus();
                 return false;
      }
	  if ((!document.getElementById('br_hardware_upto').value.match(numericExpression))|| !document.getElementById('br_hardware_upto').value < 0)
      {
                 alert("Please insert numeric value in contg Field!");
                 document.getElementById('br_hardware_upto').focus();
                 return false;
      }
	    if ((!document.getElementById('br_con_target').value.match(numericExpression))|| !document.getElementById('br_con_target').value < 0)
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_target').focus();
                 return false;
      }
	  if( (!document.getElementById('br_con_tomonth').value.match(numericExpression))|| !document.getElementById('br_con_tomonth').value < 0)
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_tomonth').focus();
                 return false;
      }
	  if ((!document.getElementById('br_con_upto').value.match(numericExpression))|| !document.getElementById('br_con_upto').value < 0)
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_upto').focus();
                 return false;
      }
	  if ((!document.getElementById('br_contg_target').value.match(numericExpression))|| !document.getElementById('br_contg_target').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_contg_target').focus();
                 return false;
      }
	  if ((!document.getElementById('br_contg_tomonth').value.match(numericExpression))|| !document.getElementById('br_contg_tomonth').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_contg_tomonth').focus();
                 return false;
      }
	  if ((!document.getElementById('br_contg_upto').value.match(numericExpression))|| !document.getElementById('br_contg_upto').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_contg_upto').focus();
                 return false;
      }
	   if ((!document.getElementById('br_others_target').value.match(numericExpression))|| !document.getElementById('br_others_target').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_others_target').focus();
                 return false;
      }
	  if ((!document.getElementById('br_others_tomonth').value.match(numericExpression))|| !document.getElementById('br_others_tomonth').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_others_tomonth').focus();
                 return false;
      }
	  if ((!document.getElementById('br_others_upto').value.match(numericExpression))|| !document.getElementById('br_others_upto').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_others_upto').focus();
                 return false;
      }
	  if( (!document.getElementById('br_hardware_target_1').value.match(numericExpression))|| !document.getElementById('br_hardware_target_1').value < 0)
      {
                 alert("Please insert numeric value in web Field!");
                 document.getElementById('br_hardware_target_1').focus();
                 return false;
      }
	  if ((!document.getElementById('br_hardware_tomonth_1').value.match(numericExpression))|| !document.getElementById('br_hardware_tomonth_1').value < 0)
      {
                 alert("Please insert numeric value in connectivity Field!");
                 document.getElementById('br_hardware_tomonth_1').focus();
                 return false;
      }
	  if( (!document.getElementById('br_hardware_upto_1').value.match(numericExpression))|| !document.getElementById('br_hardware_upto_1').value < 0)
      {
                 alert("Please insert numeric value in contg Field!");
                 document.getElementById('br_hardware_upto_1').focus();
                 return false;
      }
	    if ((!document.getElementById('br_con_target_1').value.match(numericExpression))|| !document.getElementById('br_con_target_1').value < 0)
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_target_1').focus();
                 return false;
      }
	  if ((!document.getElementById('br_con_tomonth_1').value.match(numericExpression))|| !document.getElementById('br_con_tomonth_1').value < 0)
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_tomonth_1').focus();
                 return false;
      }
	  if ((!document.getElementById('br_con_upto_1').value.match(numericExpression))|| !document.getElementById('br_con_upto_1').value < 0)
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_upto_1').focus();
                 return false;
      }
	    if ((!document.getElementById('br_contg_target_1').value.match(numericExpression))|| !document.getElementById('br_contg_target_1').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_contg_target_1').focus();
                 return false;
      }
	  if ((!document.getElementById('br_contg_tomonth_1').value.match(numericExpression))|| !document.getElementById('br_contg_tomonth_1').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_contg_tomonth_1').focus();
                 return false;
      }
	  if ((!document.getElementById('br_contg_upto_1').value.match(numericExpression)) || !document.getElementById('br_contg_upto_1').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_contg_upto_1').focus();
                 return false;
      }
	   if ((!document.getElementById('br_others_target_1').value.match(numericExpression))|| !document.getElementById('br_others_target_1').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_others_target_1').focus();
                 return false;
      }
	  if ((!document.getElementById('br_others_tomonth_1').value.match(numericExpression))|| !document.getElementById('br_others_tomonth_1').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_others_tomonth_1').focus();
                 return false;
      }
	  if ((!document.getElementById('br_others_upto_1').value.match(numericExpression))|| !document.getElementById('br_others_upto_1').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_others_upto_1').focus();
                 return false;
      }
	  if ((!document.getElementById('br_hardware_target_2').value.match(numericExpression))|| !document.getElementById('br_hardware_target_2').value < 0)
      {
                 alert("Please insert numeric value in web Field!");
                 document.getElementById('br_hardware_target_2').focus();
                 return false;
      }
	  if ((!document.getElementById('br_hardware_tomonth_2').value.match(numericExpression))|| !document.getElementById('br_hardware_tomonth_2').value < 0)
      {
                 alert("Please insert numeric value in connectivity Field!");
                 document.getElementById('br_hardware_tomonth_2').focus();
                 return false;
      }
	  if ((!document.getElementById('br_hardware_upto_2').value.match(numericExpression))|| !document.getElementById('br_hardware_upto_2').value < 0)
      {
                 alert("Please insert numeric value in contg Field!");
                 document.getElementById('br_hardware_upto_2').focus();
                 return false;
      }
	    if ((!document.getElementById('br_con_target_2').value.match(numericExpression))|| !document.getElementById('br_con_target_2').value < 0)
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_target_2').focus();
                 return false;
      }
	  if( (!document.getElementById('br_con_tomonth_2').value.match(numericExpression))|| !document.getElementById('br_con_tomonth_2').value < 0)
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_tomonth_2').focus();
                 return false;
      }
	  if ((!document.getElementById('br_con_upto_2').value.match(numericExpression))|| !document.getElementById('br_con_upto_2').value < 0)
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_upto_2').focus();
                 return false;
      }
	  
	  if ((!document.getElementById('br_contg_tomonth_2').value.match(numericExpression))|| !document.getElementById('br_contg_tomonth_2').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_contg_tomonth_2').focus();
                 return false;
      }
	  if ((!document.getElementById('br_contg_upto_2').value.match(numericExpression))|| !document.getElementById('br_contg_upto_2').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_contg_upto_2').focus();
                 return false;
      }
	   if ((!document.getElementById('br_others_target_2').value.match(numericExpression))|| !document.getElementById('br_others_target_2').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_others_target_2').focus();
                 return false;
      }
	  if ((!document.getElementById('br_others_tomonth_2').value.match(numericExpression))|| !document.getElementById('br_others_tomonth_2').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_others_tomonth_2').focus();
                 return false;
      }
	  if ((!document.getElementById('br_others_upto_2').value.match(numericExpression))|| !document.getElementById('br_others_upto_2').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_others_upto_2').focus();
                 return false;
      }
	
	 if ((!document.getElementById('br_hardware_target_3').value.match(numericExpression))|| !document.getElementById('br_hardware_target_3').value < 0)
      {
                 alert("Please insert numeric value in web Field!");
                 document.getElementById('br_hardware_target_3').focus();
                 return false;
      }
	  if ((!document.getElementById('br_hardware_tomonth_3').value.match(numericExpression))|| !document.getElementById('br_hardware_tomonth_3').value < 0)
      {
                 alert("Please insert numeric value in connectivity Field!");
                 document.getElementById('br_hardware_tomonth_3').focus();
                 return false;
      }
	  if ((!document.getElementById('br_hardware_upto_3').value.match(numericExpression))|| !document.getElementById('br_hardware_upto_3').value < 0)
      {
                 alert("Please insert numeric value in contg Field!");
                 document.getElementById('br_hardware_upto_3').focus();
                 return false;
      }
	    if ((!document.getElementById('br_con_target_3').value.match(numericExpression))|| !document.getElementById('br_con_target_3').value < 0)
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_target_3').focus();
                 return false;
      }
	  if ((!document.getElementById('br_con_tomonth_3').value.match(numericExpression))|| !document.getElementById('br_con_tomonth_3').value < 0)
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_tomonth_3').focus();
                 return false;
      }
	  if ((!document.getElementById('br_con_upto_3').value.match(numericExpression))|| !document.getElementById('br_con_upto_3').value < 0)
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_upto_3').focus();
                 return false;
      }
	   if ((!document.getElementById('br_contg_target_3').value.match(numericExpression))|| !document.getElementById('br_contg_target_3').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_contg_target_3').focus();
                 return false;
      }
	  if ((!document.getElementById('br_contg_tomonth_3').value.match(numericExpression))|| !document.getElementById('br_contg_tomonth_3').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_contg_tomonth_3').focus();
                 return false;
      }
	  if ((!document.getElementById('br_contg_upto_3').value.match(numericExpression))|| !document.getElementById('br_contg_upto_3').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_contg_upto_3').focus();
                 return false;
      }
	   if ((!document.getElementById('br_others_target_3').value.match(numericExpression))|| !document.getElementById('br_others_target_3').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_others_target_3').focus();
                 return false;
      }
	  if ((!document.getElementById('br_others_tomonth_3').value.match(numericExpression))|| !document.getElementById('br_others_tomonth_3').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_others_tomonth_3').focus();
                 return false;
      }
	  if ((!document.getElementById('br_others_upto_3').value.match(numericExpression))|| !document.getElementById('br_others_upto_3').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_others_upto_3').focus();
                 return false;
      }
	  if ((!document.getElementById('br_contg_target_2').value.match(numericExpression))|| !document.getElementById('br_contg_target_2').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_contg_target_2').focus();
                 return false;
      }
	  if ((!document.getElementById('br_hardware_target_4').value.match(numericExpression))|| !document.getElementById('br_hardware_target_4').value < 0)
      {
                 alert("Please insert numeric value in web Field!");
                 document.getElementById('br_hardware_target_4').focus();
                 return false;
      }
	  if ((!document.getElementById('br_hardware_tomonth_4').value.match(numericExpression))|| !document.getElementById('br_hardware_tomonth_4').value < 0)
      {
                 alert("Please insert numeric value in connectivity Field!");
                 document.getElementById('br_hardware_tomonth_4').focus();
                 return false;
      }
	  if( (!document.getElementById('br_hardware_upto_4').value.match(numericExpression))|| !document.getElementById('br_hardware_upto_4').value < 0)
      {
                 alert("Please insert numeric value in contg Field!");
                 document.getElementById('br_hardware_upto_4').focus();
                 return false;
      }
	    if ((!document.getElementById('br_con_target_4').value.match(numericExpression))|| !document.getElementById('br_con_target_4').value < 0)
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_target_4').focus();
                 return false;
      }
	  if ((!document.getElementById('br_con_tomonth_4').value.match(numericExpression))|| !document.getElementById('br_con_tomonth_4').value < 0)
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_tomonth_4').focus();
                 return false;
      }
	  if ((!document.getElementById('br_con_upto_4').value.match(numericExpression))|| !document.getElementById('br_con_upto_4').value < 0)
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_upto_4').focus();
                 return false;
      }if ((!document.getElementById('br_contg_target_4').value.match(numericExpression))|| !document.getElementById('br_contg_target_4').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_contg_target_4').focus();
                 return false;
      }
	  if ((!document.getElementById('br_contg_tomonth_4').value.match(numericExpression))|| !document.getElementById('br_contg_tomonth_4').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_contg_tomonth_4').focus();
                 return false;
      }
	  if ((!document.getElementById('br_contg_upto_4').value.match(numericExpression))|| !document.getElementById('br_contg_upto_4').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_contg_upto_4').focus();
                 return false;
      }
	   if ((!document.getElementById('br_others_target_4').value.match(numericExpression))|| !document.getElementById('br_others_target_4').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_others_target_4').focus();
                 return false;
      }
	  if ((!document.getElementById('br_others_tomonth_4').value.match(numericExpression))|| !document.getElementById('br_others_tomonth_4').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_others_tomonth_4').focus();
                 return false;
      }
	  if ((!document.getElementById('br_others_upto_4').value.match(numericExpression))|| !document.getElementById('br_others_upto_4').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_others_upto_4').focus();
                 return false;
      }
	  if ( (!document.getElementById('br_hardware_target_5').value.match(numericExpression))|| !document.getElementById('br_hardware_target_5').value < 0)
      {
                 alert("Please insert numeric value in web Field!");
                 document.getElementById('br_hardware_target_5').focus();
                 return false;
      }
	  if ((!document.getElementById('br_hardware_tomonth_5').value.match(numericExpression)) || !document.getElementById('br_hardware_tomonth_5').value < 0)
      {
                 alert("Please insert numeric value in connectivity Field!");
                 document.getElementById('br_hardware_tomonth_5').focus();
                 return false;
      }
	  if ((!document.getElementById('br_hardware_upto_5').value.match(numericExpression)) || !document.getElementById('br_hardware_upto_5').value < 0)
      {
                 alert("Please insert numeric value in contg Field!");
                 document.getElementById('br_hardware_upto_5').focus();
                 return false;
      }
	    if ((!document.getElementById('br_con_target_5').value.match(numericExpression)) || !document.getElementById('br_con_target_5').value < 0)
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_target_5').focus();
                 return false;
      }
	  if ((!document.getElementById('br_con_tomonth_5').value.match(numericExpression)) || !document.getElementById('br_con_tomonth_5').value < 0)
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_tomonth_5').focus();
                 return false;
      }
	  if ((!document.getElementById('br_con_upto_5').value.match(numericExpression))|| !document.getElementById('br_con_upto_5').value < 0)
      {
                 alert("Please insert numeric value in others1 Field!");
                 document.getElementById('br_con_upto_5').focus();
                 return false;
      }
	 if ((!document.getElementById('br_contg_target_5').value.match(numericExpression))|| !document.getElementById('br_contg_target_5').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_contg_target_5').focus();
                 return false;
      }
	  if ((!document.getElementById('br_contg_tomonth_5').value.match(numericExpression))|| !document.getElementById('br_contg_tomonth_5').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_contg_tomonth_5').focus();
                 return false;
      }
	  if ((!document.getElementById('br_contg_upto_5').value.match(numericExpression))|| !document.getElementById('br_contg_upto_5').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_contg_upto_5').focus();
                 return false;
      }
	   if ((!document.getElementById('br_others_target_5').value.match(numericExpression))|| !document.getElementById('br_others_target_5').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_others_target_5').focus();
                 return false;
      }
	  if ((!document.getElementById('br_others_tomonth_5').value.match(numericExpression))|| !document.getElementById('br_others_tomonth_5').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_others_tomonth_5').focus();
                 return false;
      }
	  if ((!document.getElementById('br_others_upto_5').value.match(numericExpression))|| !document.getElementById('br_others_upto_5').value < 0)
      {
                 alert("Please insert numeric value in  Field!");
                 document.getElementById('br_others_upto_5').focus();
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

try
{

int divFlag=0,buttonFlag=0;


String instId=(String)session.getAttribute("CmbIns");
String role=(String)session.getAttribute("rol");
String years=(String)session.getAttribute("CmbYear");
String months=(String)session.getAttribute("CmbMonth");
String user=(String)session.getAttribute("user");
String Random5=(String)session.getAttribute("Random5");
String mnm = request.getParameter("mnm");
if(Random5.equals(mnm))
{
if ( (instId.matches("[a-zA-Z_0-9 ]+")) && ((years.length()==9) && (years.substring(0, 1).matches("[0-9]"))) &&( months.matches("[0-9]+")))  {
	System.out.println("pattern matches");


//String role = request.getParameter("role");
System.out.println(months);
System.out.println(mnm);
System.out.println(role);

%>

<% 
int flag=0,status=0,flag1=0;
	ResultSet rsAdminResult = null;
	ResultSet rsAdminResult1 = null;
	ResultSet rsAdminResult11 = null;
		//int divFlag=0,buttonFlag=0;
		String readOnlyFlag="";
		String userDate=months+"/"+years;
	// int Tyears = Integer.parseInt(years);
	
	
	try{
Connection con = ConnectionManager.getConnectionDirectForMySQL();
Statement stmt5 = (Statement)con.createStatement();
Statement stmt4 = (Statement)con.createStatement();
 Statement stmt = (Statement)con.createStatement();
  Statement stmt51 = (Statement)con.createStatement();
if(role.equalsIgnoreCase("IU")){	
		 String strSql = "select * from tbl_senet where months ="+months+" and year='"+years+"' and inst_id='"+instId+"'";
		ResultSet rs=stmt.executeQuery(strSql);
	      while(rs.next())
	      {
	      	flag++;
	      }
		  rs = null;
	
	      if(flag == 1){
		  System.out.println("flag of senet schemes"+flag);
		  
	      %>	     
	    <jsp:forward page="error.jsp?mnm=<%=mnm%>&instId=<%=instId%>&months=<%=months%>&years=<%=years%>&role=<%=role%>"></jsp:forward>    
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


String strCumulative=" SELECT sum(amc_of_pc1),sum(web1),sum(contg1),sum(others1),sum(connectivity1),sum(br_hardware_tomonth),sum(br_con_tomonth),sum(br_contg_tomonth),sum(br_others_tomonth),sum(br_hardware_tomonth_1),sum(br_con_tomonth_1),sum(br_contg_tomonth_1),sum(br_others_tomonth_1),sum(br_hardware_tomonth_2),sum(br_con_tomonth_2),sum(br_contg_tomonth_2),sum(br_others_tomonth_2),sum(br_hardware_tomonth_3),sum(br_con_tomonth_3),sum(br_contg_tomonth_3),sum(br_others_tomonth_3),sum(br_hardware_tomonth_4),sum(br_con_tomonth_4),sum(br_contg_tomonth_4),sum(br_others_tomonth_4),sum(br_hardware_tomonth_5),sum(br_con_tomonth_5),sum(br_contg_tomonth_5),sum(br_others_tomonth_5) FROM tbl_senet where months >=1 AND months <="+months+" and year='"+years+"' and inst_id='"+instId+"'";

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
		int cum_mon15=0;
		
		int cum_mon16=0;
	        int cum_mon17=0;
		  
		int cum_mon18=0;
		int cum_mon19=0;
		
		int cum_mon20=0;
	        int cum_mon21=0;
		  
		int cum_mon22=0;
		int cum_mon23=0;
		
		int cum_mon24=0;
	        int cum_mon25=0;
		  
		int cum_mon26=0;
		int cum_mon27=0;
		
		int cum_mon28=0;
	        int cum_mon29=0;
		  
		 
		  
		  
		  
		
                        String fix_val1="0";
			String fix_val2="0";
			String fix_val3="0";
			String fix_val4="0";
			String fix_val5="0";
			String fix_val1116="0";
			
			
			
			String fix_val6="0";
			String fix_val7="0";
			String fix_val8="0";
			String fix_val9="0";
			String fix_val10="0";
			
			
			String fix_val11="0";
			String fix_val12="0";
			String fix_val13="0";
			String fix_val14="0";
			String fix_val15="0";
			
			String fix_val16="0";
			String fix_val17="0";
			String fix_val18="0";
			String fix_val19="0";
			String fix_val20="0";
			
			String fix_val21="0";
			String fix_val22="0";
			String fix_val23="0";
			String fix_val24="0";
			String fix_val25="0";
			
			
			String fix_val26="0";
			String fix_val27="0";
			String fix_val28="0";
			String fix_val29="0";
			
		
            ResultSet rsCumulative=stmt.executeQuery(strCumulative);

	      while(rsCumulative.next())
	      {
	       cum_mon1=rsCumulative.getInt("sum(amc_of_pc1)");
	       cum_mon2=rsCumulative.getInt("sum(web1)");
               cum_mon3=rsCumulative.getInt("sum(connectivity1)");
                cum_mon4=rsCumulative.getInt("sum(contg1)");
			cum_mon5=rsCumulative.getInt("sum(others1)");
			
			
			 cum_mon6=rsCumulative.getInt("sum(br_hardware_tomonth)");
		    cum_mon7=rsCumulative.getInt("sum(br_con_tomonth)");
		    cum_mon8=rsCumulative.getInt("sum(br_contg_tomonth)");
			cum_mon9=rsCumulative.getInt("sum(br_others_tomonth)");
			
	       cum_mon10=rsCumulative.getInt("sum(br_hardware_tomonth_1)");
		    cum_mon11=rsCumulative.getInt("sum(br_con_tomonth_1)");
		    cum_mon12=rsCumulative.getInt("sum(br_contg_tomonth_1)");
			cum_mon13=rsCumulative.getInt("sum(br_others_tomonth_1)");
			 cum_mon14=rsCumulative.getInt("sum(br_hardware_tomonth_2)");
		    cum_mon15=rsCumulative.getInt("sum(br_con_tomonth_2)");
		    cum_mon16=rsCumulative.getInt("sum(br_contg_tomonth_2)");
			cum_mon17=rsCumulative.getInt("sum(br_others_tomonth_2)");
			 cum_mon18=rsCumulative.getInt("sum(br_hardware_tomonth_3)");
		    cum_mon19=rsCumulative.getInt("sum(br_con_tomonth_3)");
		    cum_mon20=rsCumulative.getInt("sum(br_contg_tomonth_3)");
			cum_mon21=rsCumulative.getInt("sum(br_others_tomonth_3)");
			 cum_mon22=rsCumulative.getInt("sum(br_hardware_tomonth_4)");
		    cum_mon23=rsCumulative.getInt("sum(br_con_tomonth_4)");
		    cum_mon24=rsCumulative.getInt("sum(br_contg_tomonth_4)");
			cum_mon25=rsCumulative.getInt("sum(br_others_tomonth_4)");
			 cum_mon26=rsCumulative.getInt("sum(br_hardware_tomonth_5)");
		    cum_mon27=rsCumulative.getInt("sum(br_con_tomonth_5)");
		    cum_mon28=rsCumulative.getInt("sum(br_contg_tomonth_5)");
			cum_mon29=rsCumulative.getInt("sum(br_others_tomonth_5)");
		   
		   
         	flag++;
	      }
	      System.out.println("flag"+flag);

		  
		  String strQuery = "SELECT * FROM tbl_targetsenet WHERE  year='"+years+"' AND   Inst_Id='"+instId+"'";
ResultSet rsTargetResult =stmt.executeQuery(strQuery);

if(rsTargetResult.next()){
	System.out.println("Target Result Set have record");
	
			 fix_val1=rsTargetResult.getString("amc_of_pc1");
			 fix_val2=rsTargetResult.getString("web1");
			 fix_val3=rsTargetResult.getString("connectivity1");
			 fix_val4=rsTargetResult.getString("contg1");
			 fix_val5=rsTargetResult.getString("others1");
			// fix_val1116=rsTargetResult.getString("amount");
		
		
		
			fix_val6=rsTargetResult.getString("Br_hardware_target");
			 fix_val7=rsTargetResult.getString("Br_con_target");
			 fix_val8=rsTargetResult.getString("Br_contg_target");
			 
			 fix_val9=rsTargetResult.getString("Br_hardware_target_1");
			 fix_val10=rsTargetResult.getString("Br_con_target_1");
			  fix_val11=rsTargetResult.getString("Br_contg_target_1");
			 fix_val12=rsTargetResult.getString("Br_others_target_1");
			 fix_val13=rsTargetResult.getString("Br_hardware_target_2");
			 fix_val14=rsTargetResult.getString("Br_con_target_2");
			 fix_val15=rsTargetResult.getString("Br_contg_target_2");
			  fix_val16=rsTargetResult.getString("Br_others_target_2");
			 fix_val17=rsTargetResult.getString("Br_hardware_target_3");
			 fix_val18=rsTargetResult.getString("Br_con_target_3");
			 fix_val19=rsTargetResult.getString("Br_contg_target_3");
			 fix_val20=rsTargetResult.getString("Br_others_target_3");
			  fix_val21=rsTargetResult.getString("Br_hardware_target_4");
			 fix_val22=rsTargetResult.getString("Br_con_target_4");
			 fix_val23=rsTargetResult.getString("Br_contg_target_4");
			 fix_val24=rsTargetResult.getString("Br_others_target_4");
			 fix_val25=rsTargetResult.getString("Br_hardware_target_5");
			 
			 
			 
			 fix_val26=rsTargetResult.getString("Br_con_target_5");
			 fix_val27=rsTargetResult.getString("Br_contg_target_5");
			 fix_val28=rsTargetResult.getString("Br_others_target_5");
			 fix_val29=rsTargetResult.getString("Br_others_target");
		
		
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


 <%--  Raghav Start here  --%>
     <% int Total=0,Total1=0,Total2=0,Total3=0,Total4=0,Total5=0,Total6=0;
     Connection conn = ConnectionManager.getConnectionDirectForMySQL();
      Statement stmt1 = (Statement)conn.createStatement();
      String sql0="SELECT  * FROM revalidationamount where year='"+years+"' AND   inst='"+instId+"'";
      ResultSet resultSet = stmt1.executeQuery(sql0);
     while(resultSet.next()){

        Total=Total+resultSet.getInt("amount");
        Total1=Total1+resultSet.getInt("br1_amt");
        Total2=Total2+resultSet.getInt("br2_amt");
        Total3=Total3+resultSet.getInt("br3_amt");
        Total4=Total4+resultSet.getInt("br4_amt");
        Total5=Total5+resultSet.getInt("br5_amt");
        Total6=Total6+resultSet.getInt("br6_amt"); }
%>



<div style="font-size:large;font-family:Verdana;font-weight:bold" align="center"><font color="#990000">  MPR -SENET Expenditure in the Month  <%=rs_month.getString("mon")%> , Year <%=years%></font></div>
<br/>
<input type="hidden" size="5" name="years" value="<%=years%>" />
<input type="hidden" size="5" name="instId" value="<%=instId%>" />
<input type="hidden" size="5" name="mnm" value="<%=mnm%>" />
<input type="hidden" size="5" name="user_date" value='<%=years%>-<%=months%>-20' />
<table width="79%" border="0" align="center"  >
  <tr>
    <td colspan="4" class="tableheader"><div align="left">Subject </div></td>
    <td width="142" colspan="1"  align="center" class="tableheader"><div align="left">Amount Sanctioned </div>
    <div align="left"></div></td>
    <td width="103"  align="center" class="tableheader"><div align="left">Expenditure During the Months in Rs. </div></td>
    <td width="100" align="center" class="tableheader"><div align="left">Total  Expenditure upto the Month in Rs</div></td>
  </tr>
  <%if(divFlag==0){%>
  <tr>
    <td colspan="4" class="tablecontent1"><div align="left"><strong>AMC of PC,UPS </strong></div></td>
    <td colspan="1"  class="tablecontent1" ><div align="left">
      <input type="text" name="amc_of_pc" id="amc_of_pc" size="15"value='<%=fix_val1%>' readonly="2"/>
    </div></td>
    <td  class="tablecontent1" ><div align="left">
      <input type="text" name="amc_of_pc1" id="amc_of_pc1" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon1%>', amc_of_pc2)"/>
    </div></td>
    <td  class="tablecontent1" ><div align="left">
      <input type="text" name="amc_of_pc2" id="amc_of_pc2" size="15" value='<%=cum_mon1%>' readonly="2" />
    </div></td>
  </tr>
  <tr>
    <td colspan="4" class="tablecontent1"><div align="left"><strong>web. Maint. </strong></div></td>
    <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="web" id="web" size="15" value='<%=fix_val2%>'readonly="2"/>
    </div></td>
    <td  class="tablecontent2" ><div align="left">
      <input type="text" name="web1" id="web1" size="15" onblur="javascript:fnSum(this.value,'<%=cum_mon2%>', web2)"/>
    </div></td>
    <td  class="tablecontent2" ><div align="left">
      <input type="text" name="web2" id="web2" size="15"value='<%=cum_mon2%>' readonly="2"/>
    </div></td>
  </tr>
  <tr>
    <td colspan="4"  class="tablecontent1"><div align="left"><strong>Internet connectivity </strong></div></td>
    <td colspan="1"  class="tablecontent1" ><div align="left">
      <input type="text" name="connectivity" id="connectivity" size="15"value='<%=fix_val3%>'readonly="2"/>
    </div></td>
    <td  class="tablecontent1" ><div align="left">
      <input type="text" name="connectivity1" id="connectivity1" size="15" onblur="javascript:fnSum(this.value,'<%=cum_mon3%>', connectivity2)"/>
    </div></td>
    <td  class="tablecontent1" ><div align="left">
      <input type="text" name="connectivity2" id="connectivity2" size="15"readonly="2"value='<%=cum_mon3%>'/>
    </div></td>
  </tr>
  <tr>
    <td colspan="4"  class="tablecontent1"><div align="left"><strong>contg.</strong></div></td>
    <td colspan="1"  class="tablecontent2" ><div align="left">




      <input type="text" name="contg" id="contg" size="15"value='<%=fix_val4%>'readonly="2"/>
    </div></td>
    <td  class="tablecontent2" ><div align="left">
      <input type="text" name="contg1" id="contg1" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon4%>', contg2)"/>
    </div></td>
    <td  class="tablecontent2" ><div align="left">
      <input type="text" name="contg2" id="contg2" size="15" readonly="2"value='<%=cum_mon4%>'/>
    </div></td>
  </tr>
  <tr>
    <td colspan="4"  class="tablecontent1"><div align="left"><strong>Hardware/Software</strong></div></td>
    <td colspan="1"  class="tablecontent1" ><div align="left">
      <input type="text" name="others" id="others" size="15" value='<%=fix_val5%>'readonly="2"/>
    </div></td>
    <td  class="tablecontent1" ><div align="left">
      <input type="text" name="others1" id="others1" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon5%>', others2)"/>
    </div></td>
    <td  class="tablecontent1" ><div align="left">
      <input type="text" name="others2" id="others2" size="15" readonly="2"value='<%=cum_mon5%>'/>
    </div></td>
  </tr>
    
     

    <tr>
        <td colspan="4"  class="tablecontent1"><div align="left"><strong>Re-validation Amount</strong></div></td>
       <td colspan="1"  class="tablecontent2" ><div align="left">
               <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total%>'  readonly="2"/>
    </div></td>
    </tr>
    
    <%--  Raghav ends here  --%>

  <%  if(instId.equals("I10"))
	{%>
	
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Tezpur)<input type="hidden" name="branch" id ="branch" value="Tezpur">
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', br_hardware_upto)" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  
  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon7%>', br_con_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon8%>', br_contg_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon9%>', br_others_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>


  <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
              <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total1%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Silchar)<input type="hidden" name="branch_1" id="branch_1" value="Silchar">
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
<td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"  value='<%=fix_val9%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon10%>', br_hardware_upto_1)"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1" value='<%=cum_mon10%>'> </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1"  value='<%=fix_val10%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_1" id="br_con_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon11%>', br_con_upto_1)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_1" name="br_con_upto_1" value='<%=cum_mon11%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_1"  id="br_contg_target_1"  value='<%=fix_val11%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_1" id="br_contg_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon12%>', br_contg_upto_1)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_1" name="br_contg_upto_1"value='<%=cum_mon12%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_1"  id="br_others_target_1"  value='<%=fix_val12%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_1" id="br_others_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon13%>', br_others_upto_1)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_1" name="br_others_upto_1"value='<%=cum_mon13%>' />  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total2%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>

  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Diphu)<input type="hidden" name="branch_2" id="branch_2" value="Diphu">
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_2" id="br_hardware_target_2" value='<%=fix_val13%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_2" id="br_hardware_tomonth_2"onblur="javascript:fnSum(this.value,'<%=cum_mon14%>', br_hardware_upto_2)"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_2" id="br_hardware_upto_2"value='<%=cum_mon14%>'> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_2"  id="br_con_target_2"  value='<%=fix_val14%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_2" id="br_con_tomonth_2"onblur="javascript:fnSum(this.value,'<%=cum_mon15%>', br_con_upto_2)" /> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_2" name="br_con_upto_2" value='<%=cum_mon15%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_2"  id="br_contg_target_2"  value='<%=fix_val15%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_2" id="br_contg_tomonth_2" onblur="javascript:fnSum(this.value,'<%=cum_mon16%>', br_contg_upto_2)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_2" name="br_contg_upto_2" value='<%=cum_mon16%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_2"  id="br_others_target_2" value='<%=fix_val16%>' /> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_2" id="br_others_tomonth_2" onblur="javascript:fnSum(this.value,'<%=cum_mon17%>', br_others_upto_2)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_2" name="br_others_upto_2" value='<%=cum_mon17%>'/>  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total3%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Shilong)<input type="hidden" name="branch_3"id="branch_3" value="Shilong"> 
	 </div></td>
  </tr>
  
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_3" id="br_hardware_target_3" value='<%=fix_val17%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_3"id="br_hardware_tomonth_3" onblur="javascript:fnSum(this.value,'<%=cum_mon18%>', br_hardware_upto_3)"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_3" id="br_hardware_upto_3"value='<%=cum_mon18%>'> </div></td>
  </tr>    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_3"  id="br_con_target_3"  value='<%=fix_val18%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_3" id="br_con_tomonth_3" onblur="javascript:fnSum(this.value,'<%=cum_mon19%>', br_con_upto_3)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_3" name="br_con_upto_3" value='<%=cum_mon19%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_3"  id="br_contg_target_3"  value='<%=fix_val19%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_3" id="br_contg_tomonth_3" onblur="javascript:fnSum(this.value,'<%=cum_mon20%>', br_contg_upto_3)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_3" name="br_contg_upto_3" value='<%=cum_mon20%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_3"  id="br_others_target_3" value='<%=fix_val20%>' /> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_3" id="br_others_tomonth_3" onblur="javascript:fnSum(this.value,'<%=cum_mon21%>', br_others_upto_3)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_3" name="br_others_upto_3" value='<%=cum_mon21%>'/>  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total4%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Tura)<input type="hidden" name="branch_4" id="branch_4" value="Tura">
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_4" id="br_hardware_target_4" value='<%=fix_val21%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_4"  id="br_hardware_tomonth_4" onblur="javascript:fnSum(this.value,'<%=cum_mon22%>', br_hardware_upto_4)"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_4" id="br_hardware_upto_4"value='<%=cum_mon22%>'> </div></td>
  </tr> <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_4"  id="br_con_target_4" value='<%=fix_val22%>' /> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_4" id="br_con_tomonth_4" onblur="javascript:fnSum(this.value,'<%=cum_mon23%>', br_con_upto_4)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_4" name="br_con_upto_4" value='<%=cum_mon23%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_4"  id="br_contg_target_4"  value='<%=fix_val23%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_4" id="br_contg_tomonth_4" onblur="javascript:fnSum(this.value,'<%=cum_mon24%>', br_contg_upto_4)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_4" name="br_contg_upto_4" value='<%=cum_mon24%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_4"  id="br_others_target_4"  value='<%=fix_val24%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_4" id="br_others_tomonth_4" onblur="javascript:fnSum(this.value,'<%=cum_mon25%>', br_others_upto_4)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_4" name="br_others_upto_4"value='<%=cum_mon25%>' />  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total5%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Itanagar)<input type="hidden" name="branch_5" id="branch_5" value="Itanagar">  
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_5" id="br_hardware_target_5" value='<%=fix_val25%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_5" id="br_hardware_tomonth_5" onblur="javascript:fnSum(this.value,'<%=cum_mon26%>', br_hardware_upto_5)"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_5"id="br_hardware_upto_5"value='<%=cum_mon26%>'> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_5"  id="br_con_target_5"  value='<%=fix_val26%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_5" id="br_con_tomonth_5" onblur="javascript:fnSum(this.value,'<%=cum_mon27%>', br_con_upto_5)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_5" name="br_con_upto_5" value='<%=cum_mon27%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_5"  id="br_contg_target_5"  value='<%=fix_val27%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_5" id="br_contg_tomonth_5" onblur="javascript:fnSum(this.value,'<%=cum_mon28%>', br_contg_upto_5)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_5" name="br_contg_upto_5" value='<%=cum_mon28%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_5"  id="br_others_target_5"  value='<%=fix_val28%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_5" id="br_others_tomonth_5" onblur="javascript:fnSum(this.value,'<%=cum_mon29%>', br_others_upto_5)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_5" name="br_others_upto_5" value='<%=cum_mon29%>'/>  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total6%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  
  <% } else %>
  <% 
  if(instId.equals("I4"))
	{%>


  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Varanasi)<input type="hidden" name="branch" id ="branch" value="Varanasi" />
	 </div></td>
  </tr>
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', br_hardware_upto)" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon7%>', br_con_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon8%>', br_contg_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon9%>', br_others_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
  <tr>
     <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
     <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total1%>'  readonly="2"/>
    </div></td>
  </tr>
  <tr>
  <% } else %>
  <%  if(instId.equals("I3"))
	{%>
   <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Rajkot) <input type="hidden" name="branch" id ="branch" value=" Rajkot" />
	 </div></td>
  </tr>
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', br_hardware_upto)" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon7%>', br_con_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon8%>', br_contg_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon9%>', br_others_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total1%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Silvassa)<input type="hidden" name="branch_1" value=" Silvassa" />
	 </div></td>
  </tr>
  
  
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
<td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"  value='<%=fix_val9%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon10%>', br_hardware_upto_1)"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1" value='<%=cum_mon10%>'> </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1"  value='<%=fix_val10%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_1" id="br_con_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon11%>', br_con_upto_1)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_1" name="br_con_upto_1" value='<%=cum_mon11%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_1"  id="br_contg_target_1"  value='<%=fix_val11%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_1" id="br_contg_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon12%>', br_contg_upto_1)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_1" name="br_contg_upto_1"value='<%=cum_mon12%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_1"  id="br_others_target_1"  value='<%=fix_val12%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_1" id="br_others_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon13%>', br_others_upto_1)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_1" name="br_others_upto_1"value='<%=cum_mon13%>' />  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total2%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  <tr>
 
  <% } else %>
  <%  if(instId.equals("I8"))
	{%>
 <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Durgapur)<input type="hidden" name="branch" id ="branch" value="Durgapur" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', br_hardware_upto)" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  
  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon7%>', br_con_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon8%>', br_contg_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon9%>', br_others_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
              <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total1%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Siliguri)<input type="hidden" name="branch_1" id="branch_1" value="Siliguri" />
	 </div></td>
  </tr>
    
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
<td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"  value='<%=fix_val9%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon10%>', br_hardware_upto_1)"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1" value='<%=cum_mon10%>'> </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1"  value='<%=fix_val10%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_1" id="br_con_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon11%>', br_con_upto_1)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_1" name="br_con_upto_1" value='<%=cum_mon11%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_1"  id="br_contg_target_1"  value='<%=fix_val11%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_1" id="br_contg_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon12%>', br_contg_upto_1)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_1" name="br_contg_upto_1"value='<%=cum_mon12%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_1"  id="br_others_target_1"  value='<%=fix_val12%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_1" id="br_others_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon13%>', br_others_upto_1)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_1" name="br_others_upto_1"value='<%=cum_mon13%>' />  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total2%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Suri) <input type="hidden" name="branch_2" id="branch_2" value="Suri" />
	 </div></td>
  </tr>
  
  
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_2" id="br_hardware_target_2" value='<%=fix_val13%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_2" id="br_hardware_tomonth_2"onblur="javascript:fnSum(this.value,'<%=cum_mon14%>', br_hardware_upto_2)"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_2" id="br_hardware_upto_2"value='<%=cum_mon14%>'> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_2"  id="br_con_target_2"  value='<%=fix_val14%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_2" id="br_con_tomonth_2"onblur="javascript:fnSum(this.value,'<%=cum_mon15%>', br_con_upto_2)" /> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_2" name="br_con_upto_2" value='<%=cum_mon15%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_2"  id="br_contg_target_2"  value='<%=fix_val15%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_2" id="br_contg_tomonth_2" onblur="javascript:fnSum(this.value,'<%=cum_mon16%>', br_contg_upto_2)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_2" name="br_contg_upto_2" value='<%=cum_mon16%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_2"  id="br_others_target_2" value='<%=fix_val16%>' /> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_2" id="br_others_tomonth_2" onblur="javascript:fnSum(this.value,'<%=cum_mon17%>', br_others_upto_2)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_2" name="br_others_upto_2" value='<%=cum_mon17%>'/>  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total3%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Port Blair) <input type="hidden" name="branch_3"id="branch_3" value="Port Blair" />
	 </div></td>
  </tr>
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_3" id="br_hardware_target_3" value='<%=fix_val17%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_3"id="br_hardware_tomonth_3" onblur="javascript:fnSum(this.value,'<%=cum_mon18%>', br_hardware_upto_3)"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_3" id="br_hardware_upto_3"value='<%=cum_mon18%>'> </div></td>
  </tr>    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_3"  id="br_con_target_3"  value='<%=fix_val18%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_3" id="br_con_tomonth_3" onblur="javascript:fnSum(this.value,'<%=cum_mon19%>', br_con_upto_3)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_3" name="br_con_upto_3" value='<%=cum_mon19%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_3"  id="br_contg_target_3"  value='<%=fix_val19%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_3" id="br_contg_tomonth_3" onblur="javascript:fnSum(this.value,'<%=cum_mon20%>', br_contg_upto_3)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_3" name="br_contg_upto_3" value='<%=cum_mon20%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_3"  id="br_others_target_3" value='<%=fix_val20%>' /> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_3" id="br_others_tomonth_3" onblur="javascript:fnSum(this.value,'<%=cum_mon21%>', br_others_upto_3)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_3" name="br_others_upto_3" value='<%=cum_mon21%>'/>  </div></td>
  </tr>
 <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total4%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  
  <% } else  %>
  <%  if(instId.equals("I9"))
	{%>
   <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Rayagada) <input type="hidden" name="branch" id ="branch" value="Rayagada" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', br_hardware_upto)" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon7%>', br_con_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon8%>', br_contg_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon9%>', br_others_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total1%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Rourkela)<input type="hidden" name="branch_1" id="branch_1" value="Rourkela" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
<td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"  value='<%=fix_val9%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon10%>', br_hardware_upto_1)"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1" value='<%=cum_mon10%>'> </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1"  value='<%=fix_val10%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_1" id="br_con_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon11%>', br_con_upto_1)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_1" name="br_con_upto_1" value='<%=cum_mon11%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_1"  id="br_contg_target_1"  value='<%=fix_val11%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_1" id="br_contg_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon12%>', br_contg_upto_1)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_1" name="br_contg_upto_1"value='<%=cum_mon12%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_1"  id="br_others_target_1"  value='<%=fix_val12%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_1" id="br_others_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon13%>', br_others_upto_1)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_1" name="br_others_upto_1"value='<%=cum_mon13%>' />  </div></td>
  </tr>
 <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total2%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  <tr>
 
   <% } else   %>
  <%  if(instId.equals("I13"))
	{%>
    <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Gwalior) <input type="hidden" name="branch" id ="branch" value="Gwalior" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"  onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', br_hardware_upto)" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon7%>', br_con_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon8%>', br_contg_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon9%>', br_others_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
  
  <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total1%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Rewa)<input type="hidden" name="branch_1" id="branch_1" value="Rewa" />
	 </div></td>
  </tr>
  
  
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
<td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"  value='<%=fix_val9%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon10%>', br_hardware_upto_1)"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1" value='<%=cum_mon10%>'> </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1"  value='<%=fix_val10%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_1" id="br_con_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon11%>', br_con_upto_1)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_1" name="br_con_upto_1" value='<%=cum_mon11%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_1"  id="br_contg_target_1"  value='<%=fix_val11%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_1" id="br_contg_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon12%>', br_contg_upto_1)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_1" name="br_contg_upto_1"value='<%=cum_mon12%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_1"  id="br_others_target_1"  value='<%=fix_val12%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_1" id="br_others_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon13%>', br_others_upto_1)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_1" name="br_others_upto_1"value='<%=cum_mon13%>' />  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total2%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  <tr>
  <% } else    %>
  <%  if(instId.equals("I7"))
	{%>
   <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Aurangabad) <input type="hidden" name="branch" id ="branch" value="Aurangabad" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', br_hardware_upto)" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon7%>', br_con_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon8%>', br_contg_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon9%>', br_others_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total1%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>

  <% } else    %>
  <%  if(instId.equals("I19"))
	{%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(CoimBatore) <input type="hidden" name="branch" id ="branch" value="CoimBatore" />
	 </div></td>
  </tr>
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', br_hardware_upto)" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon7%>', br_con_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon8%>', br_contg_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon9%>', br_others_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
  <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total1%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
 
 
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Tuticorin)<input type="hidden" name="branch_1" id="branch_1" value="Tuticorin" />
	 </div></td>
  </tr>
  
 
 
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
<td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"  value='<%=fix_val9%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon10%>', br_hardware_upto_1)"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1" value='<%=cum_mon10%>'> </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1"  value='<%=fix_val10%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_1" id="br_con_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon11%>', br_con_upto_1)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_1" name="br_con_upto_1" value='<%=cum_mon11%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_1"  id="br_contg_target_1"  value='<%=fix_val11%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_1" id="br_contg_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon12%>', br_contg_upto_1)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_1" name="br_contg_upto_1"value='<%=cum_mon12%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_1"  id="br_others_target_1"  value='<%=fix_val12%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_1" id="br_others_tomonth_1" onblur="javascript:fnSum(this.value,'<%=cum_mon13%>', br_others_upto_1)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_1" name="br_others_upto_1"value='<%=cum_mon13%>' />  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total1%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  <% } else      %>
  <%  if(instId.equals("I12"))
	{%>
  
 <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Visakhapatnam) <input type="hidden" name="branch" id ="branch" value="Visakhapatnam" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', br_hardware_upto)" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon7%>', br_con_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon8%>', br_contg_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon9%>', br_others_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total1%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  <tr>
  <% } else   %>
  <%  if(instId.equals("I24"))
	{%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Jammu Tawi) <input type="hidden" name="branch" id ="branch" value="Jammu Tawi" />
	 </div></td>
  </tr>
  
   <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', br_hardware_upto)" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon7%>', br_con_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon8%>', br_contg_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon9%>', br_others_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total1%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  
  <tr>
  <% } else     %>
  <%  if(instId.equals("I22"))
	{%>
 <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Dhanbad) <input type="hidden" name="branch" id ="branch" value="Dhanbad" />
	 </div></td>
  </tr>
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', br_hardware_upto)" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon7%>', br_con_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon8%>', br_contg_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon9%>', br_others_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total1%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  
  <tr>
  <% }   else    %>
  <%  if(instId.equals("I14"))
	{%>
 <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Dimapur) <input type="hidden" name="branch" id ="branch" value="Dimapur" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', br_hardware_upto)" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon7%>', br_con_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon8%>', br_contg_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon9%>', br_others_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total1%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  
  <tr>
  <% } else      %>
  <%  if(instId.equals("I11"))
	{%>
   <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Gulbarga) <input type="hidden" name="branch" id ="branch" value="Gulbarga" />
	 </div></td>
  </tr>
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', br_hardware_upto)" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon7%>', br_con_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon8%>', br_contg_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon9%>', br_others_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total1%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  <% } else      %>
  <%  if(instId.equals("I1"))
	{%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Aizwal) <input type="hidden" name="branch" id ="branch" value="Aizwal" />
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', br_hardware_upto)" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon7%>', br_con_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon8%>', br_contg_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon9%>', br_others_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total1%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  <% } else      %>
  <%  if(instId.equals("I17"))
	{%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Bhiwani) <input type="hidden" name="branch" id ="branch" value="Bhiwani" />
	 </div></td>
  </tr>
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', br_hardware_upto)" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon7%>', br_con_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon8%>', br_contg_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon9%>', br_others_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total1%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  <% }  else      %>
  <%  if(instId.equals("I6"))
	{%>
 
   <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Manglore) <input type="hidden" name="branch" id ="branch" value="Manglore" />
	 </div></td>
  </tr>
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', br_hardware_upto)" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon7%>', br_con_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon8%>', br_contg_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth" onblur="javascript:fnSum(this.value,'<%=cum_mon9%>', br_others_upto)"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
   <%--  Raghav  --%>
  <tr>
      <td  class="tablecontent11" colspan="4"><div align="left"><strong>Re-validation Amount </strong></div></td>
      <td colspan="1"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" disabled readonly="2"  size="15" maxlength="6" id="contg" tabindex="110" value='<%=Total1%>'  readonly="2"/>
    </div></td>
  </tr>
  <%--  Ends  --%>
  <% }        %>
  <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_senet WHERE months='"+months+"' AND year='"+years+"' AND   inst_id='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>
 
   <tr>
    <td colspan="3"  class="tablecontent1"><div align="left"><strong>AMC of PC,UPS </strong></div></td>
    <td colspan="2"  class="tablecontent1" ><div align="left">
      <input type="text" name="amc_of_pc" id="amc_of_pc" size="15"value='<%=fix_val1%>'readonly="2"/>
    </div></td>
    <td  class="tablecontent1" ><div align="left">
      <input type="text" name="amc_of_pc1" id="amc_of_pc1" size="15" value='<%=rsAdminResult.getString("amc_of_pc1")%>'onblur="fnCalCum(amc_of_pc1,'<%=cum_mon1%>',amc_of_pc2 ,'<%=rsAdminResult.getString("amc_of_pc1")%>')"/>
    </div></td>
    <td  class="tablecontent1" ><div align="left">
      <input type="text" name="amc_of_pc2" id="amc_of_pc2" size="15"value='<%=cum_mon1%>'readonly="2"/>
    </div></td>
  </tr>
  <tr>
    <td colspan="3"  class="tablecontent1"><div align="left"><strong>web. Maint. </strong></div></td>
    <td colspan="2"  class="tablecontent2" ><div align="left">
      <input type="text" name="web" id="web" size="15"value='<%=fix_val2%>'/>
    </div></td>
    <td  class="tablecontent2" ><div align="left">
      <input type="text" name="web1" id="web1" size="15" value='<%=rsAdminResult.getString("web1")%>'onblur="fnCalCum(web1,'<%=cum_mon2%>',web2 ,'<%=rsAdminResult.getString("web1")%>')"/>
    </div></td>
    <td  class="tablecontent2" ><div align="left">
      <input type="text" name="web2" id="web2" size="15"value='<%=cum_mon2%>'readonly="2"/>
    </div></td>
  </tr>
  <tr>
    <td colspan="3"  class="tablecontent1"><div align="left"><strong>Internet connectivity </strong></div></td>
    <td colspan="2"  class="tablecontent1" ><div align="left">
      <input type="text" name="connectivity" id="connectivity" size="15"value='<%=fix_val3%>'/>
    </div></td>
    <td  class="tablecontent1" ><div align="left">
      <input type="text" name="connectivity1" id="connectivity1" size="15" value='<%=rsAdminResult.getString("connectivity1")%>'onblur="fnCalCum(connectivity1,'<%=cum_mon3%>',connectivity2 ,'<%=rsAdminResult.getString("connectivity1")%>')"/>
    </div></td>
    <td  class="tablecontent1" ><div align="left">
      <input type="text" name="connectivity2" id="connectivity2" size="15"readonly="2"value='<%=cum_mon3%>'/>
    </div></td>
  </tr>
  <tr>
    <td colspan="3"  class="tablecontent1"><div align="left"><strong>contg.</strong></div></td>
    <td colspan="2"  class="tablecontent2" ><div align="left">
      <input type="text" name="contg" id="contg" size="15"value='<%=fix_val4%>'/>
    </div></td>
    <td  class="tablecontent2" ><div align="left">
      <input type="text" name="contg1" id="contg1" size="15"value='<%=rsAdminResult.getString("contg1")%>'onblur="fnCalCum(contg1,'<%=cum_mon4%>',contg2 ,'<%=rsAdminResult.getString("contg1")%>')"/>
    </div></td>
    <td  class="tablecontent2" ><div align="left">
      <input type="text" name="contg2" id="contg2" size="15" readonly="2"value='<%=cum_mon4%>'/>
    </div></td>
  </tr>
  <tr>
    <td colspan="3"  class="tablecontent1"><div align="left"><strong>HardWare/Others</strong></div></td>
    <td colspan="2"  class="tablecontent1" ><div align="left">
      <input type="text" name="others" id="others" size="15"value='<%=fix_val5%>'/>
    </div></td>
    <td  class="tablecontent1" ><div align="left">
      <input type="text" name="others1" id="others1" size="15"value='<%=rsAdminResult.getString("others1")%>'onblur="fnCalCum(others1,'<%=cum_mon5%>',others2 ,'<%=rsAdminResult.getString("others1")%>')"/>
    </div></td>
    <td  class="tablecontent1" ><div align="left">
      <input type="text" name="others2" id="others2" size="15" readonly="2"value='<%=cum_mon5%>'/>
    </div></td>
  </tr>
  <%  if(instId.equals("I10"))
	{%>
	
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Tezpur)<input type="hidden" name="branch" id ="branch" value="Tezpur">
	 </div></td>
  </tr>
  
<tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"  value='<%=rsAdminResult.getString("br_hardware_tomonth")%>'onblur="fnCalCum(br_hardware_tomonth,'<%=cum_mon6%>',br_hardware_upto,'<%=rsAdminResult.getString("br_hardware_tomonth")%>')" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"  value='<%=rsAdminResult.getString("br_con_tomonth")%>' onblur="fnCalCum(br_con_tomonth,'<%=cum_mon7%>',br_con_upto ,'<%=rsAdminResult.getString("br_con_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth"  value='<%=rsAdminResult.getString("br_contg_tomonth")%>' onblur="fnCalCum(br_contg_tomonth,'<%=cum_mon8%>',br_contg_upto ,'<%=rsAdminResult.getString("br_contg_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth"  value='<%=rsAdminResult.getString("br_others_tomonth")%>' onblur="fnCalCum(br_others_tomonth,'<%=cum_mon9%>',br_others_upto ,'<%=rsAdminResult.getString("br_others_tomonth")%>')"</div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
  
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Silchar)<input type="hidden" name="branch_1" id="branch_1" value="Silchar">
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
<td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"  value='<%=fix_val9%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1"  value='<%=rsAdminResult.getString("br_hardware_tomonth_1")%>' onblur="fnCalCum(br_hardware_tomonth_1,'<%=cum_mon10%>',br_hardware_upto_1 ,'<%=rsAdminResult.getString("br_hardware_tomonth_1")%>')"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1" value='<%=cum_mon10%>'> </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1"  value='<%=fix_val10%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_1" id="br_con_tomonth_1"  value='<%=rsAdminResult.getString("br_con_tomonth_1")%>' onblur="fnCalCum(br_con_tomonth_1,'<%=cum_mon11%>',br_con_upto_1 ,'<%=rsAdminResult.getString("br_con_tomonth_1")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_1" name="br_con_upto_1" value='<%=cum_mon11%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_1"  id="br_contg_target_1"  value='<%=fix_val11%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_1" id="br_contg_tomonth_1"  value='<%=rsAdminResult.getString("br_contg_tomonth_1")%>'onblur="fnCalCum(br_contg_tomonth_1,'<%=cum_mon12%>',br_contg_upto_1 ,'<%=rsAdminResult.getString("br_contg_tomonth_1")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_1" name="br_contg_upto_1"value='<%=cum_mon12%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_1"  id="br_others_target_1"  value='<%=fix_val12%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_1" id="br_others_tomonth_1" value='<%=rsAdminResult.getString("br_others_tomonth_1")%>'  onblur="fnCalCum(br_others_tomonth_1,'<%=cum_mon13%>',br_others_upto_1 ,'<%=rsAdminResult.getString("br_others_tomonth_1")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_1" name="br_others_upto_1"value='<%=cum_mon13%>' />  </div></td>
  </tr>
  
  
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Diphu)<input type="hidden" name="branch_2" id="branch_2" value="Diphu">
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_2" id="br_hardware_target_2" value='<%=fix_val13%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_2" id="br_hardware_tomonth_2"  value='<%=rsAdminResult.getString("br_hardware_tomonth_2")%>'onblur="fnCalCum(br_hardware_tomonth_2,'<%=cum_mon14%>',br_hardware_upto_2 ,'<%=rsAdminResult.getString("br_hardware_tomonth_2")%>')"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_2" id="br_hardware_upto_2"value='<%=cum_mon14%>'> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_2"  id="br_con_target_2"  value='<%=fix_val14%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_2" id="br_con_tomonth_2"  value='<%=rsAdminResult.getString("br_con_tomonth_2")%>' onblur="fnCalCum(br_con_tomonth_2,'<%=cum_mon15%>',br_con_upto_2 ,'<%=rsAdminResult.getString("br_con_tomonth_2")%>')" /> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_2" name="br_con_upto_2" value='<%=cum_mon15%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_2"  id="br_contg_target_2"  value='<%=fix_val15%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_2" id="br_contg_tomonth_2"  value='<%=rsAdminResult.getString("br_contg_tomonth_2")%>' onblur="fnCalCum(br_contg_tomonth_2,'<%=cum_mon16%>',br_contg_upto_2 ,'<%=rsAdminResult.getString("br_contg_tomonth_2")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_2" name="br_contg_upto_2" value='<%=cum_mon16%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_2"  id="br_others_target_2" value='<%=fix_val16%>' /> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_2" id="br_others_tomonth_2"  value='<%=rsAdminResult.getString("br_others_tomonth_2")%>' onblur="fnCalCum(br_others_tomonth_2,'<%=cum_mon17%>',br_others_upto_2 ,'<%=rsAdminResult.getString("br_others_tomonth_2")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_2" name="br_others_upto_2" value='<%=cum_mon17%>'/>  </div></td>
  </tr>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Shilong)<input type="hidden" name="branch_3"id="branch_3" value="Shilong"> 
	 </div></td>
  </tr>
  
<tr>
   <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_3" id="br_hardware_target_3" value='<%=fix_val17%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_3"id="br_hardware_tomonth_3" value='<%=rsAdminResult.getString("br_hardware_tomonth_3")%>'  onblur="fnCalCum(br_hardware_tomonth_3,'<%=cum_mon18%>',br_hardware_upto_3 ,'<%=rsAdminResult.getString("br_hardware_tomonth_3")%>')"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_3" id="br_hardware_upto_3"value='<%=cum_mon18%>'> </div></td>
  </tr>    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_3"  id="br_con_target_3"  value='<%=fix_val18%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_3" id="br_con_tomonth_3"  value='<%=rsAdminResult.getString("br_con_tomonth_3")%>' onblur="fnCalCum(br_con_tomonth_3,'<%=cum_mon19%>',br_con_upto_3 ,'<%=rsAdminResult.getString("br_con_tomonth_3")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_3" name="br_con_upto_3" value='<%=cum_mon19%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_3"  id="br_contg_target_3"  value='<%=fix_val19%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_3" id="br_contg_tomonth_3"  value='<%=rsAdminResult.getString("br_contg_tomonth_3")%>'  onblur="fnCalCum(br_contg_tomonth_3,'<%=cum_mon20%>',br_contg_upto_3 ,'<%=rsAdminResult.getString("br_contg_tomonth_3")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_3" name="br_contg_upto_3" value='<%=cum_mon20%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_3"  id="br_others_target_3" value='<%=fix_val20%>' /> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_3" id="br_others_tomonth_3"  value='<%=rsAdminResult.getString("br_others_tomonth_3")%>' onblur="fnCalCum(br_others_tomonth_3,'<%=cum_mon21%>',br_others_upto_3 ,'<%=rsAdminResult.getString("br_others_tomonth_3")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_3" name="br_others_upto_3" value='<%=cum_mon21%>'/>  </div></td>
  </tr>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Tura)<input type="hidden" name="branch_4" id="branch_4" value="Tura">
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_4" id="br_hardware_target_4" value='<%=fix_val21%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_4"  id="br_hardware_tomonth_4"  value='<%=rsAdminResult.getString("br_hardware_tomonth_4")%>' onblur="fnCalCum(br_hardware_tomonth_4,'<%=cum_mon22%>',br_hardware_upto_4 ,'<%=rsAdminResult.getString("br_hardware_tomonth_4")%>')"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_4" id="br_hardware_upto_4"value='<%=cum_mon22%>'> </div></td>
  </tr> <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_4"  id="br_con_target_4" value='<%=fix_val22%>' /> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_4" id="br_con_tomonth_4"  value='<%=rsAdminResult.getString("br_con_tomonth_4")%>' onblur="fnCalCum(br_con_tomonth_4,'<%=cum_mon23%>',br_con_upto_4 ,'<%=rsAdminResult.getString("br_con_tomonth_4")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_4" name="br_con_upto_4" value='<%=cum_mon23%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_4"  id="br_contg_target_4"  value='<%=fix_val23%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_4" id="br_contg_tomonth_4" value='<%=rsAdminResult.getString("br_contg_tomonth_4")%>'  onblur="fnCalCum(br_contg_tomonth_4,'<%=cum_mon24%>',br_contg_upto_4 ,'<%=rsAdminResult.getString("br_contg_tomonth_4")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_4" name="br_contg_upto_4" value='<%=cum_mon24%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_4"  id="br_others_target_4"  value='<%=fix_val24%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_4" id="br_others_tomonth_4" value='<%=rsAdminResult.getString("br_others_tomonth_4")%>'   onblur="fnCalCum(br_others_tomonth_4,'<%=cum_mon25%>',br_others_upto_4 ,'<%=rsAdminResult.getString("br_others_tomonth_4")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_4" name="br_others_upto_4"value='<%=cum_mon25%>' />  </div></td>
  </tr>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Itanagar)<input type="hidden" name="branch_5" id="branch_5" value="Itanagar">  
	 </div></td>
  </tr>
  
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_5" id="br_hardware_target_5" value='<%=fix_val25%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_5" id="br_hardware_tomonth_5" value='<%=rsAdminResult.getString("br_hardware_tomonth_5")%>'  onblur="fnCalCum(br_hardware_tomonth_5,'<%=cum_mon26%>',br_hardware_upto_5 ,'<%=rsAdminResult.getString("br_hardware_tomonth_5")%>')"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_5"id="br_hardware_upto_5"value='<%=cum_mon26%>'> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_5"  id="br_con_target_5"  value='<%=fix_val26%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_5" id="br_con_tomonth_5" value='<%=rsAdminResult.getString("br_con_tomonth_5")%>'  onblur="fnCalCum(br_con_tomonth_5,'<%=cum_mon27%>',br_con_upto_5 ,'<%=rsAdminResult.getString("br_con_tomonth_5")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_5" name="br_con_upto_5" value='<%=cum_mon27%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_5"  id="br_contg_target_5"  value='<%=fix_val27%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_5" id="br_contg_tomonth_5" value='<%=rsAdminResult.getString("br_contg_tomonth_5")%>'   onblur="fnCalCum(br_contg_tomonth_5,'<%=cum_mon28%>',br_contg_upto_5 ,'<%=rsAdminResult.getString("br_contg_tomonth_5")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_5" name="br_contg_upto_5" value='<%=cum_mon28%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_5"  id="br_others_target_5"  value='<%=fix_val28%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_5" id="br_others_tomonth_5" value='<%=rsAdminResult.getString("br_others_tomonth_5")%>'  onblur="fnCalCum(br_others_tomonth_5,'<%=cum_mon29%>',br_others_upto_5 ,'<%=rsAdminResult.getString("br_others_tomonth_5")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_5" name="br_others_upto_5" value='<%=cum_mon29%>'/>  </div></td>
  </tr>
  
  <% } else %>
  <%  if(instId.equals("I4"))
	{%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Varanasi)<input type="hidden" name="branch" id ="branch" value="Varanasi" />
	 </div></td>
  </tr>
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"  value='<%=rsAdminResult.getString("br_hardware_tomonth")%>'onblur="fnCalCum(br_hardware_tomonth,'<%=cum_mon6%>',br_hardware_upto,'<%=rsAdminResult.getString("br_hardware_tomonth")%>')" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"  value='<%=rsAdminResult.getString("br_con_tomonth")%>' onblur="fnCalCum(br_con_tomonth,'<%=cum_mon7%>',br_con_upto ,'<%=rsAdminResult.getString("br_con_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth"  value='<%=rsAdminResult.getString("br_contg_tomonth")%>' onblur="fnCalCum(br_contg_tomonth,'<%=cum_mon8%>',br_contg_upto ,'<%=rsAdminResult.getString("br_contg_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth"  value='<%=rsAdminResult.getString("br_others_tomonth")%>' onblur="fnCalCum(br_others_tomonth,'<%=cum_mon9%>',br_others_upto ,'<%=rsAdminResult.getString("br_others_tomonth")%>')"</div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
  
  <tr>
  <% } else %>
  <%  if(instId.equals("I3"))
	{%>
   <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Rajkot) <input type="hidden" name="branch" id ="branch" value=" Rajkot" />
	 </div></td>
  </tr>
<tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"  value='<%=rsAdminResult.getString("br_hardware_tomonth")%>'onblur="fnCalCum(br_hardware_tomonth,'<%=cum_mon6%>',br_hardware_upto,'<%=rsAdminResult.getString("br_hardware_tomonth")%>')" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"  value='<%=rsAdminResult.getString("br_con_tomonth")%>' onblur="fnCalCum(br_con_tomonth,'<%=cum_mon7%>',br_con_upto ,'<%=rsAdminResult.getString("br_con_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth"  value='<%=rsAdminResult.getString("br_contg_tomonth")%>' onblur="fnCalCum(br_contg_tomonth,'<%=cum_mon8%>',br_contg_upto ,'<%=rsAdminResult.getString("br_contg_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth"  value='<%=rsAdminResult.getString("br_others_tomonth")%>' onblur="fnCalCum(br_others_tomonth,'<%=cum_mon9%>',br_others_upto ,'<%=rsAdminResult.getString("br_others_tomonth")%>')"</div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
  
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Silvassa)<input type="hidden" name="branch_1" value=" Silvassa" />
	 </div></td>
  </tr>
  
    <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
<td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"  value='<%=fix_val9%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1"  value='<%=rsAdminResult.getString("br_hardware_tomonth_1")%>' onblur="fnCalCum(br_hardware_tomonth_1,'<%=cum_mon10%>',br_hardware_upto_1 ,'<%=rsAdminResult.getString("br_hardware_tomonth_1")%>')"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1" value='<%=cum_mon10%>'> </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1"  value='<%=fix_val10%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_1" id="br_con_tomonth_1"  value='<%=rsAdminResult.getString("br_con_tomonth_1")%>' onblur="fnCalCum(br_con_tomonth_1,'<%=cum_mon11%>',br_con_upto_1 ,'<%=rsAdminResult.getString("br_con_tomonth_1")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_1" name="br_con_upto_1" value='<%=cum_mon11%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_1"  id="br_contg_target_1"  value='<%=fix_val11%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_1" id="br_contg_tomonth_1"  value='<%=rsAdminResult.getString("br_contg_tomonth_1")%>'onblur="fnCalCum(br_contg_tomonth_1,'<%=cum_mon12%>',br_contg_upto_1 ,'<%=rsAdminResult.getString("br_contg_tomonth_1")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_1" name="br_contg_upto_1"value='<%=cum_mon12%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_1"  id="br_others_target_1"  value='<%=fix_val12%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_1" id="br_others_tomonth_1" value='<%=rsAdminResult.getString("br_others_tomonth_1")%>'  onblur="fnCalCum(br_others_tomonth_1,'<%=cum_mon13%>',br_others_upto_1 ,'<%=rsAdminResult.getString("br_others_tomonth_1")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_1" name="br_others_upto_1"value='<%=cum_mon13%>' />  </div></td>
  </tr>
  
  <tr>
 
  <% } else %>
  <%  if(instId.equals("I8"))
	{%>
 <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Durgapur)<input type="hidden" name="branch" id ="branch" value="Durgapur" />
	 </div></td>
  </tr>
  
<tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"  value='<%=rsAdminResult.getString("br_hardware_tomonth")%>'onblur="fnCalCum(br_hardware_tomonth,'<%=cum_mon6%>',br_hardware_upto,'<%=rsAdminResult.getString("br_hardware_tomonth")%>')" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"  value='<%=rsAdminResult.getString("br_con_tomonth")%>' onblur="fnCalCum(br_con_tomonth,'<%=cum_mon7%>',br_con_upto ,'<%=rsAdminResult.getString("br_con_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth"  value='<%=rsAdminResult.getString("br_contg_tomonth")%>' onblur="fnCalCum(br_contg_tomonth,'<%=cum_mon8%>',br_contg_upto ,'<%=rsAdminResult.getString("br_contg_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth"  value='<%=rsAdminResult.getString("br_others_tomonth")%>' onblur="fnCalCum(br_others_tomonth,'<%=cum_mon9%>',br_others_upto ,'<%=rsAdminResult.getString("br_others_tomonth")%>')"</div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
  
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Siliguri)<input type="hidden" name="branch_1" id="branch_1" value="Siliguri" />
	 </div></td>
  </tr>
    
   <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
<td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"  value='<%=fix_val9%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1"  value='<%=rsAdminResult.getString("br_hardware_tomonth_1")%>' onblur="fnCalCum(br_hardware_tomonth_1,'<%=cum_mon10%>',br_hardware_upto_1 ,'<%=rsAdminResult.getString("br_hardware_tomonth_1")%>')"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1" value='<%=cum_mon10%>'> </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1"  value='<%=fix_val10%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_1" id="br_con_tomonth_1"  value='<%=rsAdminResult.getString("br_con_tomonth_1")%>' onblur="fnCalCum(br_con_tomonth_1,'<%=cum_mon11%>',br_con_upto_1 ,'<%=rsAdminResult.getString("br_con_tomonth_1")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_1" name="br_con_upto_1" value='<%=cum_mon11%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_1"  id="br_contg_target_1"  value='<%=fix_val11%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_1" id="br_contg_tomonth_1"  value='<%=rsAdminResult.getString("br_contg_tomonth_1")%>'onblur="fnCalCum(br_contg_tomonth_1,'<%=cum_mon12%>',br_contg_upto_1 ,'<%=rsAdminResult.getString("br_contg_tomonth_1")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_1" name="br_contg_upto_1"value='<%=cum_mon12%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_1"  id="br_others_target_1"  value='<%=fix_val12%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_1" id="br_others_tomonth_1" value='<%=rsAdminResult.getString("br_others_tomonth_1")%>'  onblur="fnCalCum(br_others_tomonth_1,'<%=cum_mon13%>',br_others_upto_1 ,'<%=rsAdminResult.getString("br_others_tomonth_1")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_1" name="br_others_upto_1"value='<%=cum_mon13%>' />  </div></td>
  </tr>
  
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Suri) <input type="hidden" name="branch_2" id="branch_2" value="Suri" />
	 </div></td>
  </tr>
  
 <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_2" id="br_hardware_target_2" value='<%=fix_val13%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_2" id="br_hardware_tomonth_2"  value='<%=rsAdminResult.getString("br_hardware_tomonth_2")%>'onblur="fnCalCum(br_hardware_tomonth_2,'<%=cum_mon14%>',br_hardware_upto_2 ,'<%=rsAdminResult.getString("br_hardware_tomonth_2")%>')"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_2" id="br_hardware_upto_2"value='<%=cum_mon14%>'> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_2"  id="br_con_target_2"  value='<%=fix_val14%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_2" id="br_con_tomonth_2"  value='<%=rsAdminResult.getString("br_con_tomonth_2")%>' onblur="fnCalCum(br_con_tomonth_2,'<%=cum_mon15%>',br_con_upto_2 ,'<%=rsAdminResult.getString("br_con_tomonth_2")%>')" /> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_2" name="br_con_upto_2" value='<%=cum_mon15%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_2"  id="br_contg_target_2"  value='<%=fix_val15%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_2" id="br_contg_tomonth_2"  value='<%=rsAdminResult.getString("br_contg_tomonth_2")%>' onblur="fnCalCum(br_contg_tomonth_2,'<%=cum_mon16%>',br_contg_upto_2 ,'<%=rsAdminResult.getString("br_contg_tomonth_2")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_2" name="br_contg_upto_2" value='<%=cum_mon16%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_2"  id="br_others_target_2" value='<%=fix_val16%>' /> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_2" id="br_others_tomonth_2"  value='<%=rsAdminResult.getString("br_others_tomonth_2")%>' onblur="fnCalCum(br_others_tomonth_2,'<%=cum_mon17%>',br_others_upto_2 ,'<%=rsAdminResult.getString("br_others_tomonth_2")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_2" name="br_others_upto_2" value='<%=cum_mon17%>'/>  </div></td>
  </tr>
  
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Port Blair) <input type="hidden" name="branch_3"id="branch_3" value="Port Blair" />
	 </div></td>
  </tr>
  <tr>
   <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_3" id="br_hardware_target_3" value='<%=fix_val17%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_3"id="br_hardware_tomonth_3" value='<%=rsAdminResult.getString("br_hardware_tomonth_3")%>' onblur="fnCalCum(br_hardware_tomonth_3,'<%=cum_mon18%>',br_hardware_upto_3 ,'<%=rsAdminResult.getString("br_hardware_tomonth_3")%>')"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_3" id="br_hardware_upto_3"value='<%=cum_mon18%>'> </div></td>
           
  </tr>    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_3"  id="br_con_target_3"  value='<%=fix_val18%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_3" id="br_con_tomonth_3" value='<%=rsAdminResult.getString("br_con_tomonth_3")%>' onblur="fnCalCum(br_con_tomonth_3,'<%=cum_mon19%>',br_con_upto_3 ,'<%=rsAdminResult.getString("br_con_tomonth_3")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_3" name="br_con_upto_3" value='<%=cum_mon19%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_3"  id="br_contg_target_3"  value='<%=fix_val19%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_3" id="br_contg_tomonth_3" value='<%=rsAdminResult.getString("br_contg_tomonth_3")%>' onblur="fnCalCum(br_contg_tomonth_3,'<%=cum_mon20%>',br_contg_upto_3 ,'<%=rsAdminResult.getString("br_contg_tomonth_3")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_3" name="br_contg_upto_3" value='<%=cum_mon20%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_3"  id="br_others_target_3" value='<%=fix_val20%>' /> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_3" id="br_others_tomonth_3" value='<%=rsAdminResult.getString("br_others_tomonth_3")%>' onblur="fnCalCum(br_others_tomonth_3,'<%=cum_mon21%>',br_others_upto_3 ,'<%=rsAdminResult.getString("br_others_tomonth_3")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_3" name="br_others_upto_3" value='<%=cum_mon21%>'/>  </div></td>
  </tr>
  
  <% } else  %>
  <%  if(instId.equals("I9"))
	{%>
   <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Rayagada) <input type="hidden" name="branch" id ="branch" value="Rayagada" />
	 </div></td>
  </tr>
  
<tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"  value='<%=rsAdminResult.getString("br_hardware_tomonth")%>'onblur="fnCalCum(br_hardware_tomonth,'<%=cum_mon6%>',br_hardware_upto,'<%=rsAdminResult.getString("br_hardware_tomonth")%>')" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"  value='<%=rsAdminResult.getString("br_con_tomonth")%>' onblur="fnCalCum(br_con_tomonth,'<%=cum_mon7%>',br_con_upto ,'<%=rsAdminResult.getString("br_con_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth"  value='<%=rsAdminResult.getString("br_contg_tomonth")%>' onblur="fnCalCum(br_contg_tomonth,'<%=cum_mon8%>',br_contg_upto ,'<%=rsAdminResult.getString("br_contg_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth"  value='<%=rsAdminResult.getString("br_others_tomonth")%>' onblur="fnCalCum(br_others_tomonth,'<%=cum_mon9%>',br_others_upto ,'<%=rsAdminResult.getString("br_others_tomonth")%>')"</div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Rourkela)<input type="hidden" name="branch_1" id="branch_1" value="Rourkela" />
	 </div></td>
  </tr>
  
   <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
<td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"  value='<%=fix_val9%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1"  value='<%=rsAdminResult.getString("br_hardware_tomonth_1")%>' onblur="fnCalCum(br_hardware_tomonth_1,'<%=cum_mon10%>',br_hardware_upto_1 ,'<%=rsAdminResult.getString("br_hardware_tomonth_1")%>')"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1" value='<%=cum_mon10%>'> </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1"  value='<%=fix_val10%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_1" id="br_con_tomonth_1"  value='<%=rsAdminResult.getString("br_con_tomonth_1")%>' onblur="fnCalCum(br_con_tomonth_1,'<%=cum_mon11%>',br_con_upto_1 ,'<%=rsAdminResult.getString("br_con_tomonth_1")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_1" name="br_con_upto_1" value='<%=cum_mon11%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_1"  id="br_contg_target_1"  value='<%=fix_val11%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_1" id="br_contg_tomonth_1"  value='<%=rsAdminResult.getString("br_contg_tomonth_1")%>'onblur="fnCalCum(br_contg_tomonth_1,'<%=cum_mon12%>',br_contg_upto_1 ,'<%=rsAdminResult.getString("br_contg_tomonth_1")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_1" name="br_contg_upto_1"value='<%=cum_mon12%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_1"  id="br_others_target_1"  value='<%=fix_val12%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_1" id="br_others_tomonth_1" value='<%=rsAdminResult.getString("br_others_tomonth_1")%>'  onblur="fnCalCum(br_others_tomonth_1,'<%=cum_mon13%>',br_others_upto_1 ,'<%=rsAdminResult.getString("br_others_tomonth_1")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_1" name="br_others_upto_1"value='<%=cum_mon13%>' />  </div></td>
  </tr>
  
  <tr>
 
   <% } else   %>
  <%  if(instId.equals("I13"))
	{%>
    <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Gwalior) <input type="hidden" name="branch" id ="branch" value="Gwalior" />
	 </div></td>
  </tr>
  
<tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"  value='<%=rsAdminResult.getString("br_hardware_tomonth")%>'onblur="fnCalCum(br_hardware_tomonth,'<%=cum_mon6%>',br_hardware_upto,'<%=rsAdminResult.getString("br_hardware_tomonth")%>')" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"  value='<%=rsAdminResult.getString("br_con_tomonth")%>' onblur="fnCalCum(br_con_tomonth,'<%=cum_mon7%>',br_con_upto ,'<%=rsAdminResult.getString("br_con_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth"  value='<%=rsAdminResult.getString("br_contg_tomonth")%>' onblur="fnCalCum(br_contg_tomonth,'<%=cum_mon8%>',br_contg_upto ,'<%=rsAdminResult.getString("br_contg_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth"  value='<%=rsAdminResult.getString("br_others_tomonth")%>' onblur="fnCalCum(br_others_tomonth,'<%=cum_mon9%>',br_others_upto ,'<%=rsAdminResult.getString("br_others_tomonth")%>')"</div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
  
 
  
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Rewa)<input type="hidden" name="branch_1" id="branch_1" value="Rewa" />
	 </div></td>
  </tr>
  
  
   <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
<td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"  value='<%=fix_val9%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1"  value='<%=rsAdminResult.getString("br_hardware_tomonth_1")%>' onblur="fnCalCum(br_hardware_tomonth_1,'<%=cum_mon10%>',br_hardware_upto_1 ,'<%=rsAdminResult.getString("br_hardware_tomonth_1")%>')"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1" value='<%=cum_mon10%>'> </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1"  value='<%=fix_val10%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_1" id="br_con_tomonth_1"  value='<%=rsAdminResult.getString("br_con_tomonth_1")%>' onblur="fnCalCum(br_con_tomonth_1,'<%=cum_mon11%>',br_con_upto_1 ,'<%=rsAdminResult.getString("br_con_tomonth_1")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_1" name="br_con_upto_1" value='<%=cum_mon11%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_1"  id="br_contg_target_1"  value='<%=fix_val11%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_1" id="br_contg_tomonth_1"  value='<%=rsAdminResult.getString("br_contg_tomonth_1")%>'onblur="fnCalCum(br_contg_tomonth_1,'<%=cum_mon12%>',br_contg_upto_1 ,'<%=rsAdminResult.getString("br_contg_tomonth_1")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_1" name="br_contg_upto_1"value='<%=cum_mon12%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_1"  id="br_others_target_1"  value='<%=fix_val12%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_1" id="br_others_tomonth_1" value='<%=rsAdminResult.getString("br_others_tomonth_1")%>'  onblur="fnCalCum(br_others_tomonth_1,'<%=cum_mon13%>',br_others_upto_1 ,'<%=rsAdminResult.getString("br_others_tomonth_1")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_1" name="br_others_upto_1"value='<%=cum_mon13%>' />  </div></td>
  </tr>
  
  <tr>
  <% } else    %>
  <%  if(instId.equals("I7"))
	{%>
   <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Aurangabad) <input type="hidden" name="branch" id ="branch" value="Aurangabad" />
	 </div></td>
  </tr>
<tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"  value='<%=rsAdminResult.getString("br_hardware_tomonth")%>'onblur="fnCalCum(br_hardware_tomonth,'<%=cum_mon6%>',br_hardware_upto,'<%=rsAdminResult.getString("br_hardware_tomonth")%>')" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"  value='<%=rsAdminResult.getString("br_con_tomonth")%>' onblur="fnCalCum(br_con_tomonth,'<%=cum_mon7%>',br_con_upto ,'<%=rsAdminResult.getString("br_con_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth"  value='<%=rsAdminResult.getString("br_contg_tomonth")%>' onblur="fnCalCum(br_contg_tomonth,'<%=cum_mon8%>',br_contg_upto ,'<%=rsAdminResult.getString("br_contg_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth"  value='<%=rsAdminResult.getString("br_others_tomonth")%>' onblur="fnCalCum(br_others_tomonth,'<%=cum_mon9%>',br_others_upto ,'<%=rsAdminResult.getString("br_others_tomonth")%>')"</div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
  <% } else    %>
  <%  if(instId.equals("I19"))
	{%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(CoimBatore) <input type="hidden" name="branch" id ="branch" value="CoimBatore" />
	 </div></td>
  </tr>
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"  value='<%=rsAdminResult.getString("br_hardware_tomonth")%>'onblur="fnCalCum(br_hardware_tomonth,'<%=cum_mon6%>',br_hardware_upto,'<%=rsAdminResult.getString("br_hardware_tomonth")%>')" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"  value='<%=rsAdminResult.getString("br_con_tomonth")%>' onblur="fnCalCum(br_con_tomonth,'<%=cum_mon7%>',br_con_upto ,'<%=rsAdminResult.getString("br_con_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth"  value='<%=rsAdminResult.getString("br_contg_tomonth")%>' onblur="fnCalCum(br_contg_tomonth,'<%=cum_mon8%>',br_contg_upto ,'<%=rsAdminResult.getString("br_contg_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth"  value='<%=rsAdminResult.getString("br_others_tomonth")%>' onblur="fnCalCum(br_others_tomonth,'<%=cum_mon9%>',br_others_upto ,'<%=rsAdminResult.getString("br_others_tomonth")%>')"</div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
 
 
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Tuticorin)<input type="hidden" name="branch_1" id="branch_1" value="Tuticorin" />
	 </div></td>
  </tr>
  
 
   <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
<td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1"  value='<%=fix_val9%>'> </div></td>
     <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1"  value='<%=rsAdminResult.getString("br_hardware_tomonth_1")%>' onblur="fnCalCum(br_hardware_tomonth_1,'<%=cum_mon10%>',br_hardware_upto_1 ,'<%=rsAdminResult.getString("br_hardware_tomonth_1")%>')"> </div></td>
	  <td  class="tablecontent11"> <div align="left"> <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1" value='<%=cum_mon10%>'> </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target_1"  id="br_con_target_1"  value='<%=fix_val10%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth_1" id="br_con_tomonth_1"  value='<%=rsAdminResult.getString("br_con_tomonth_1")%>' onblur="fnCalCum(br_con_tomonth_1,'<%=cum_mon11%>',br_con_upto_1 ,'<%=rsAdminResult.getString("br_con_tomonth_1")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto_1" name="br_con_upto_1" value='<%=cum_mon11%>'/>  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target_1"  id="br_contg_target_1"  value='<%=fix_val11%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth_1" id="br_contg_tomonth_1"  value='<%=rsAdminResult.getString("br_contg_tomonth_1")%>'onblur="fnCalCum(br_contg_tomonth_1,'<%=cum_mon12%>',br_contg_upto_1 ,'<%=rsAdminResult.getString("br_contg_tomonth_1")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto_1" name="br_contg_upto_1"value='<%=cum_mon12%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target_1"  id="br_others_target_1"  value='<%=fix_val12%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth_1" id="br_others_tomonth_1" value='<%=rsAdminResult.getString("br_others_tomonth_1")%>'  onblur="fnCalCum(br_others_tomonth_1,'<%=cum_mon13%>',br_others_upto_1 ,'<%=rsAdminResult.getString("br_others_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto_1" name="br_others_upto_1"value='<%=cum_mon13%>' />  </div></td>
  </tr>
  
  
  <% } else      %>
  <%  if(instId.equals("I12"))
	{%>
  
 <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Visakhapatnam) <input type="hidden" name="branch" id ="branch" value="Visakhapatnam" />
	 </div></td>
  </tr>
  
 <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"  value='<%=rsAdminResult.getString("br_hardware_tomonth")%>'onblur="fnCalCum(br_hardware_tomonth,'<%=cum_mon6%>',br_hardware_upto,'<%=rsAdminResult.getString("br_hardware_tomonth")%>')" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"  value='<%=rsAdminResult.getString("br_con_tomonth")%>' onblur="fnCalCum(br_con_tomonth,'<%=cum_mon7%>',br_con_upto ,'<%=rsAdminResult.getString("br_con_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth"  value='<%=rsAdminResult.getString("br_contg_tomonth")%>' onblur="fnCalCum(br_contg_tomonth,'<%=cum_mon8%>',br_contg_upto ,'<%=rsAdminResult.getString("br_contg_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth"  value='<%=rsAdminResult.getString("br_others_tomonth")%>' onblur="fnCalCum(br_others_tomonth,'<%=cum_mon9%>',br_others_upto ,'<%=rsAdminResult.getString("br_others_tomonth")%>')"</div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
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
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"  value='<%=rsAdminResult.getString("br_hardware_tomonth")%>'onblur="fnCalCum(br_hardware_tomonth,'<%=cum_mon6%>',br_hardware_upto,'<%=rsAdminResult.getString("br_hardware_tomonth")%>')" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"  value='<%=rsAdminResult.getString("br_con_tomonth")%>' onblur="fnCalCum(br_con_tomonth,'<%=cum_mon7%>',br_con_upto ,'<%=rsAdminResult.getString("br_con_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth"  value='<%=rsAdminResult.getString("br_contg_tomonth")%>' onblur="fnCalCum(br_contg_tomonth,'<%=cum_mon8%>',br_contg_upto ,'<%=rsAdminResult.getString("br_contg_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth"  value='<%=rsAdminResult.getString("br_others_tomonth")%>' onblur="fnCalCum(br_others_tomonth,'<%=cum_mon9%>',br_others_upto ,'<%=rsAdminResult.getString("br_others_tomonth")%>')"</div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
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
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"  value='<%=rsAdminResult.getString("br_hardware_tomonth")%>'onblur="fnCalCum(br_hardware_tomonth,'<%=cum_mon6%>',br_hardware_upto,'<%=rsAdminResult.getString("br_hardware_tomonth")%>')" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"  value='<%=rsAdminResult.getString("br_con_tomonth")%>' onblur="fnCalCum(br_con_tomonth,'<%=cum_mon7%>',br_con_upto ,'<%=rsAdminResult.getString("br_con_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth"  value='<%=rsAdminResult.getString("br_contg_tomonth")%>' onblur="fnCalCum(br_contg_tomonth,'<%=cum_mon8%>',br_contg_upto ,'<%=rsAdminResult.getString("br_contg_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth"  value='<%=rsAdminResult.getString("br_others_tomonth")%>' onblur="fnCalCum(br_others_tomonth,'<%=cum_mon9%>',br_others_upto ,'<%=rsAdminResult.getString("br_others_tomonth")%>')"</div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
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
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"  value='<%=rsAdminResult.getString("br_hardware_tomonth")%>'onblur="fnCalCum(br_hardware_tomonth,'<%=cum_mon6%>',br_hardware_upto,'<%=rsAdminResult.getString("br_hardware_tomonth")%>')" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"  value='<%=rsAdminResult.getString("br_con_tomonth")%>' onblur="fnCalCum(br_con_tomonth,'<%=cum_mon7%>',br_con_upto ,'<%=rsAdminResult.getString("br_con_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth"  value='<%=rsAdminResult.getString("br_contg_tomonth")%>' onblur="fnCalCum(br_contg_tomonth,'<%=cum_mon8%>',br_contg_upto ,'<%=rsAdminResult.getString("br_contg_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth"  value='<%=rsAdminResult.getString("br_others_tomonth")%>' onblur="fnCalCum(br_others_tomonth,'<%=cum_mon9%>',br_others_upto ,'<%=rsAdminResult.getString("br_others_tomonth")%>')"</div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
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
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"  value='<%=rsAdminResult.getString("br_hardware_tomonth")%>'onblur="fnCalCum(br_hardware_tomonth,'<%=cum_mon6%>',br_hardware_upto,'<%=rsAdminResult.getString("br_hardware_tomonth")%>')" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"  value='<%=rsAdminResult.getString("br_con_tomonth")%>' onblur="fnCalCum(br_con_tomonth,'<%=cum_mon7%>',br_con_upto ,'<%=rsAdminResult.getString("br_con_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth"  value='<%=rsAdminResult.getString("br_contg_tomonth")%>' onblur="fnCalCum(br_contg_tomonth,'<%=cum_mon8%>',br_contg_upto ,'<%=rsAdminResult.getString("br_contg_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth"  value='<%=rsAdminResult.getString("br_others_tomonth")%>' onblur="fnCalCum(br_others_tomonth,'<%=cum_mon9%>',br_others_upto ,'<%=rsAdminResult.getString("br_others_tomonth")%>')"</div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
  
  <% } else      %>
  <%  if(instId.equals("I1"))
	{%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Aizwal) <input type="hidden" name="branch" id ="branch" value="Aizwal" />
	 </div></td>
  </tr>
  
 <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"  value='<%=rsAdminResult.getString("br_hardware_tomonth")%>'onblur="fnCalCum(br_hardware_tomonth,'<%=cum_mon6%>',br_hardware_upto,'<%=rsAdminResult.getString("br_hardware_tomonth")%>')" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"  value='<%=rsAdminResult.getString("br_con_tomonth")%>' onblur="fnCalCum(br_con_tomonth,'<%=cum_mon7%>',br_con_upto ,'<%=rsAdminResult.getString("br_con_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth"  value='<%=rsAdminResult.getString("br_contg_tomonth")%>' onblur="fnCalCum(br_contg_tomonth,'<%=cum_mon8%>',br_contg_upto ,'<%=rsAdminResult.getString("br_contg_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth"  value='<%=rsAdminResult.getString("br_others_tomonth")%>' onblur="fnCalCum(br_others_tomonth,'<%=cum_mon9%>',br_others_upto ,'<%=rsAdminResult.getString("br_others_tomonth")%>')"</div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
  
  <% } else      %>
  <%  if(instId.equals("I17"))
	{%>
  <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Bhiwani) <input type="hidden" name="branch" id ="branch" value="Bhiwani" />
	 </div></td>
  </tr>
<tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"  value='<%=rsAdminResult.getString("br_hardware_tomonth")%>'onblur="fnCalCum(br_hardware_tomonth,'<%=cum_mon6%>',br_hardware_upto,'<%=rsAdminResult.getString("br_hardware_tomonth")%>')" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"  value='<%=rsAdminResult.getString("br_con_tomonth")%>' onblur="fnCalCum(br_con_tomonth,'<%=cum_mon7%>',br_con_upto ,'<%=rsAdminResult.getString("br_con_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth"  value='<%=rsAdminResult.getString("br_contg_tomonth")%>' onblur="fnCalCum(br_contg_tomonth,'<%=cum_mon8%>',br_contg_upto ,'<%=rsAdminResult.getString("br_contg_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others</strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth"  value='<%=rsAdminResult.getString("br_others_tomonth")%>' onblur="fnCalCum(br_others_tomonth,'<%=cum_mon9%>',br_others_upto ,'<%=rsAdminResult.getString("br_others_tomonth")%>')"</div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>
  
  <% }  else      %>
  <%  if(instId.equals("I6"))
	{%>
 
   <tr>
   
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Manglore) <input type="hidden" name="branch" id ="branch" value="Manglore" />
	 </div></td>
  </tr>
  <tr>
  <td  class="tablecontent11" colspan="4"><strong><div align="left">AMC</div> </strong></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target"  value='<%=fix_val6%>' /> </div></td>
 <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth"  value='<%=rsAdminResult.getString("br_hardware_tomonth")%>'onblur="fnCalCum(br_hardware_tomonth,'<%=cum_mon6%>',br_hardware_upto,'<%=rsAdminResult.getString("br_hardware_tomonth")%>')" /> </div></td>
 <td  class="tablecontent11"><div align="left"><input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" value='<%=cum_mon6%>'/> </div></td>
  </tr>  <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Internet Connectivity </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_con_target"  id="br_con_target"  value='<%=fix_val7%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_con_tomonth" id="br_con_tomonth"  value='<%=rsAdminResult.getString("br_con_tomonth")%>' onblur="fnCalCum(br_con_tomonth,'<%=cum_mon7%>',br_con_upto ,'<%=rsAdminResult.getString("br_con_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_con_upto" name="br_con_upto"value='<%=cum_mon7%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>Contg. </strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_contg_target"  id="br_contg_target"  value='<%=fix_val8%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_contg_tomonth" id="br_contg_tomonth"  value='<%=rsAdminResult.getString("br_contg_tomonth")%>' onblur="fnCalCum(br_contg_tomonth,'<%=cum_mon8%>',br_contg_upto ,'<%=rsAdminResult.getString("br_contg_tomonth")%>')"/> </div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_contg_upto" name="br_contg_upto" value='<%=cum_mon8%>' />  </div></td>
  </tr>
    <tr> <td  class="tablecontent11" colspan="4"><div align="left"><strong>HardWare/Others</strong></div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" name="br_others_target"  id="br_others_target"  value='<%=fix_val29%>'/> </div></td>
    <td  class="tablecontent11"><div align="left">  <input type="text" size="15" name="br_others_tomonth" id="br_others_tomonth"  value='<%=rsAdminResult.getString("br_others_tomonth")%>' onblur="fnCalCum(br_others_tomonth,'<%=cum_mon9%>',br_others_upto ,'<%=rsAdminResult.getString("br_others_tomonth")%>')"</div></td>
    <td  class="tablecontent11"><div align="left"> <input type="text" size="15" id="br_others_upto" name="br_others_upto" value='<%=cum_mon9%>'/>  </div></td>
  </tr>

  <% } }%>
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
	<jsp:forward  page="error.jsp">	
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
	<jsp:forward page="error.jsp">	
	<jsp:param name="ecode" value="0"/>
	<jsp:param name="emsg" value='<%=eMsg%>'/>
	</jsp:forward>
<%
	} 
	finally{
		 
	}
	%>
	
	<%	
} else {
    response.sendRedirect("/senet/stat.jsp");
}


 %>
	<%	
} else {
    response.sendRedirect("/senet/stat.jsp");
}


 %>

 <div align="center">
<br/>
<img id="captcha" height="30" style=" width: 100px; border: 1px #000000 solid;" src="<c:url value="Cap_Img.jsp" />" width="90">
 <a href="JavaScript:refresh()"><img src="images/refresh.png" style="border:none; width: 20px; height: 20px; position: relative;" /></a>
<input type="text" name="formcaptcha" id="formcaptcha" size="15"/><br/><br/>


<%
if(role.equalsIgnoreCase("SU")  && buttonFlag==0){%>
<html:submit value="Add" onclick="submitForm()" /> &nbsp;
<%}else{%>

<html:submit property="method" value="submit"/>
<%}%>

<input name="button2" type="button" onClick="window.print();return false;" value=" Print" /></div>


<%
 } catch (Exception e) {
	System.out.println("Duplicate vcvcEntry");
	%>
	<a href="Session.jsp" target="_top" id="linkid">GO HERE</a>
	<%
	}
	
	


 %>	</html:form>
</body>
</html>
