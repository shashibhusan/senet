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
		<%
int timeout = session.getMaxInactiveInterval();
response.setHeader("Refresh", timeout + "; URL = sloginlog.jsp");
Cookie[] cookies = request.getCookies();
if(cookies!=null)
for (int i = 0; i < cookies.length; i++) {
 cookies[i].setMaxAge(0);
}
%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@taglib uri="/web-INF/struts-bean.tld" prefix="bean" %>
<%@taglib uri="/web-INF/struts-html.tld" prefix="html" %>
<%@ page autoFlush="true" buffer="1094kb"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE"> 
<META HTTP-EQUIV="Expires" CONTENT="-1">
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
                document.forms[0].action = "Librarydata.do?method=add";
                document.forms[0].submit();
            }
        </script></head>

<body bgcolor="#FBFBFB">

<form action="Librarydata.jsp" onsubmit="return formValidator()">

<%

int divFlag=0,buttonFlag=0;


String instId=(String)session.getAttribute("CmbIns");
 String role=(String)session.getAttribute("rol");
//String instId=(String)session.getAttribute("CmbIns");
String years=(String)session.getAttribute("CmbYear");
String months=(String)session.getAttribute("CmbMonth");
String user=(String)session.getAttribute("user");
String Random5=(String)session.getAttribute("Random5");
String mnm = request.getParameter("mnm");
System.out.println("prakash chandradeynccffffff ---------chanda financial page======"+Random5);
System.out.println("prakash chandradeynccffffff ---------chanda financial page ======"+mnm);
if(Random5.equals(mnm))
{


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
if(role.equalsIgnoreCase("IU")){	
		 String strSql = "select * from tbl_library where months ="+months+" and year='"+years+"' and inst_id='"+instId+"'";
		ResultSet rs=stmt.executeQuery(strSql);
	      while(rs.next())
	      {
	      	flag++;
	      }
		  rs = null;
	
	      if(flag == 1){
		  System.out.println("flag of senet schemes prakash"+flag);
		  
	      %>	     
	    <jsp:forward page="error.jsp?mnm=<%=mnm%>&instId=<%=instId%>&months=<%=months%>&years=<%=years%>&role=<%=role%>"></jsp:forward>    
	      <%  
	      }
}
else{
String strSql = "SELECT * FROM tbl_library WHERE months="+months+" AND year='"+years+"' AND   inst_id='"+instId+"'"; 
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




String strCumulative=" SELECT sum(amc_of_pc1) FROM tbl_library where months >=1 AND months <="+months+" and year='"+years+"' and inst_id='"+instId+"'";

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
	      
		   
		   
         	flag++;
	      }
	      System.out.println("flag"+flag);

		  
		  String strQuery = "SELECT * FROM tbl_targetsenet WHERE year='"+years+"' AND   Inst_Id='"+instId+"'"; 
ResultSet rsTargetResult =stmt.executeQuery(strQuery);

if(rsTargetResult.next()){
	System.out.println("Target Result Set have record");
		   fix_val1=rsTargetResult.getString("amc_of_pc1");
			
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
<div style="font-size:large;font-family:Verdana;font-weight:bold" align="center"><font color="#990000">  LIB. Expenditure in the Month  <%=rs_month.getString("mon")%> , Year <%=years%></font></div>


<br> 
<br> <br>  
<input type="hidden" size="5" name="months" value="<%=months%>" />
<input type="hidden" size="5" name="years" value="<%=years%>" />
<input type="hidden" size="5" name="instId" value="<%=instId%>" />
<input type="hidden" size="5" name="mnm" value="<%=mnm%>" />
<input type="hidden" size="5" name="user_date" value='<%=years%>-<%=months%>-20' />
<table width="79%" border="0" align="center"  >
  <tr>
    <td colspan="4" class="tableheader"><div align="center">Subject </div></td>
    <td width="98" colspan="1"  align="center" class="tableheader"><div align="center">Amount Sanctioned </div>
    <div align="center"></div></td>
    <td width="103"  align="center" class="tableheader"><div align="center">Expenditure During the Months in Rs. </div></td>
    <td width="100" align="center" class="tableheader"><div align="center">Total  Expenditure upto the Month in Rs</div></td>
  </tr>
  <%if(divFlag==0){%>
  <tr>
    <td colspan="4" class="tablecontent1"><div align="left"><strong> Libraries  Modernization </strong></div></td>
    <td colspan="1"  class="tablecontent1" ><div align="center">
      <input type="text" name="amc_of_pc" id="amc_of_pc" size="15"value='<%=fix_val1%>' readonly="2"/>
    </div></td>
    <td  class="tablecontent1" ><div align="center">
      <input type="text" name="amc_of_pc1" id="amc_of_pc1" size="15"onblur="javascript:fnSum(this.value,'<%=cum_mon1%>', amc_of_pc2)"/>
    </div></td>
    <td  class="tablecontent1" ><div align="center">
      <input type="text" name="amc_of_pc2" id="amc_of_pc2" size="15" value='<%=cum_mon1%>' readonly="2" />
    </div></td>
  </tr>
  <%  if(instId.equals("I10"))
  System.out.println(instI
	{%>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Tezpur)
            <input type="hidden" name="branch" id ="branch" value="Tezpur" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong>Libraries  Modernization </strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" />
    </div></td>
  </tr>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Silchar)
            <input type="hidden" name="branch_1" id="branch_1" value="Silchar" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1" />
    </div></td>
  </tr>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Diphu)
            <input type="hidden" name="branch_2" id="branch_2" value="Diphu" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target_2" id="br_hardware_target_2" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth_2" id="br_hardware_tomonth_2" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto_2" id="br_hardware_upto_2" />
    </div></td>
  </tr>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Shilong)
            <input type="hidden" name="branch_3"id="branch_3" value="Shilong" />
    </div></td>
  </tr>
  <td  class="tablecontent11" colspan="4"><strong>
    <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
  </strong></td>
      <td  class="tablecontent11"><div align="center">
          <input type="text" size="15" name="br_hardware_target_3" id="br_hardware_target_3" />
      </div></td>
    <td  class="tablecontent11"><div align="center">
          <input type="text" size="15" name="br_hardware_target_3"id="br_hardware_target_3" />
      </div></td>
    <td  class="tablecontent11"><div align="center">
          <input type="text" size="15" name="br_hardware_upto_3" id="br_hardware_upto_3" />
      </div></td>
  </tr>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Tura)
            <input type="hidden" name="branch_4" id="branch_4" value="Tura" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target_4" id="br_hardware_target_4" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth_4"  id="br_hardware_tomonth_4" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto_4" id="br_hardware_upto_4" />
    </div></td>
  </tr>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Itanagar)
            <input type="hidden" name="branch_5" id="branch_5" value="Itanagar" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target_5" id="br_hardware_target_5" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth_5" id="br_hardware_tomonth_5" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto_5"id="br_hardware_upto_5" />
    </div></td>
  </tr>
  <% }  %>
  <% else if(instId.equals("I4"))
  System.out.println(instId);
	{%>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Varanasi)
            <input type="hidden" name="branch" id ="branch" value="Varanasi" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" />
    </div></td>
  </tr>
  <% }  %>
  <%  if(instId.equals("I3"))
  System.out.println(instId);
	{%>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Rajkot)
      <input type="hidden" name="branch" id ="branch" value=" Rajkot" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" />
    </div></td>
  </tr>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Silvassa)
            <input type="hidden" name="branch_1" value=" Silvassa" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1" />
    </div></td>
  </tr>
  <tr>
    <% }  %>
    <%  if(instId.equals("I8"))
	System.out.println(instId);
	{%>
  </tr>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Durgapur)
            <input type="hidden" name="branch" id ="branch" value="Durgapur" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" />
    </div></td>
  </tr>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Siliguri)
            <input type="hidden" name="branch_1" id="branch_1" value="Siliguri" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1" />
    </div></td>
  </tr>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Suri)
      <input type="hidden" name="branch_2" id="branch_2" value="Suri" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target_2" id="br_hardware_target_2" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth_2" id="br_hardware_tomonth_2" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto_2" id="br_hardware_upto_2" />
    </div></td>
  </tr>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Port Blair)
      <input type="hidden" name="branch_3"id="branch_3" value="Port Blair" />
    </div></td>
  </tr>
  <td  class="tablecontent11" colspan="4"><strong>
    <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
  </strong></td>
      <td  class="tablecontent11"><div align="center">
          <input type="text" size="15" name="br_hardware_target_3" id="br_hardware_target_3" />
      </div></td>
    <td  class="tablecontent11"><div align="center">
          <input type="text" size="15" name="br_hardware_target_3"id="br_hardware_target_3" />
      </div></td>
    <td  class="tablecontent11"><div align="center">
          <input type="text" size="15" name="br_hardware_upto_3" id="br_hardware_upto_3" />
      </div></td>
  </tr>
  <% }   %>
  <%  if(instId.equals("I9"))
  System.out.println(instId);
	{%>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Rayagada)
      <input type="hidden" name="branch" id ="branch" value="Rayagada" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" />
    </div></td>
  </tr>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Rourkela)
            <input type="hidden" name="branch_1" id="branch_1" value="Rourkela" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1" />
    </div></td>
  </tr>
  <tr>
    <% }    %>
    <%  if(instId.equals("I13"))
	{%>
  </tr>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Gwalior)
      <input type="hidden" name="branch" id ="branch" value="Gwalior" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" />
    </div></td>
  </tr>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Rewa)
            <input type="hidden" name="branch_1" id="branch_1" value="Rewa" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1" />
    </div></td>
  </tr>
  <tr>
    <% }     %>
    <%  if(instId.equals("I7"))
	{%>
  </tr>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Aurangabad)
      <input type="hidden" name="branch" id ="branch" value="Aurangabad" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" />
    </div></td>
  </tr>
  <% }     %>
  <%  if(instId.equals("I19"))
	{%>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(CoimBatore)
      <input type="hidden" name="branch" id ="branch" value="CoimBatore" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" />
    </div></td>
  </tr>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Tuticorin)
            <input type="hidden" name="branch_1" id="branch_1" value="Tuticorin" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target_1" id="br_hardware_target_1" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth_1" id ="br_hardware_tomonth_1" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto_1" id="br_hardware_upto_1" />
    </div></td>
  </tr>
  <% }       %>
  <%  if(instId.equals("I12"))
	{%>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Visakhapatnam)
      <input type="hidden" name="branch" id ="branch" value="Visakhapatnam" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" />
    </div></td>
  </tr>
  <tr>
    <% }    %>
    <%  if(instId.equals("I24"))
	{%>
  </tr>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Jammu Tawi)
      <input type="hidden" name="branch" id ="branch" value="Jammu Tawi" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" />
    </div></td>
  </tr>
  <tr>
    <% } %>
    <%  if(instId.equals("I22"))
	{%>
  </tr>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Dhanbad)
      <input type="hidden" name="branch" id ="branch" value="Dhanbad" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong>Libraries  Modernization </strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" />
    </div></td>
  </tr>
  <tr>
    <% }   %>
    <%  if(instId.equals("I14"))
	{%>
  </tr>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Dimapur)
      <input type="hidden" name="branch" id ="branch" value="Dimapur" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong><strong>Libraries  Modernization </strong></strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" />
    </div></td>
  </tr>
  <tr>
    <% }       %>
    <%  if(instId.equals("I11"))
	{%>
  </tr>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Gulbarga)
      <input type="hidden" name="branch" id ="branch" value="Gulbarga" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong><strong>Libraries  Modernization </strong></strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" />
    </div></td>
  </tr>
  <% } %>
  <%  if(instId.equals("I1"))
	{%>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Aizwal)
      <input type="hidden" name="branch" id ="branch" value="Aizwal" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong><strong>Libraries  Modernization </strong></strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" />
    </div></td>
  </tr>
  <% }       %>
  <%  if(instId.equals("I17"))
	{%>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Bhiwani)
      <input type="hidden" name="branch" id ="branch" value="Bhiwani" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong><strong>Libraries  Modernization </strong></strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" />
    </div></td>
  </tr>
  <% } %>
  <%  if(instId.equals("I6"))
	{%>
  <tr>
    <td colspan="7"  class="tableheader"><div align="left">Branch MSME-DI &nbsp;(Manglore)
      <input type="hidden" name="branch" id ="branch" value="Manglore" />
    </div></td>
  </tr>
  <tr>
    <td  class="tablecontent11" colspan="4"><strong>
      <div align="center"><strong><strong><strong>Libraries  Modernization </strong></strong></strong></div>
    </strong></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_target" id ="br_hardware_target" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_tomonth"id="br_hardware_tomonth" />
    </div></td>
    <td  class="tablecontent11"><div align="center">
      <input type="text" size="15" name="br_hardware_upto" id="br_hardware_upto" />
    </div></td>
  </tr>
  <% } %>
  <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_library WHERE months='"+months+"' AND year='"+years+"' AND   inst_id='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>
  <tr>
    <td colspan="3"  class="tablecontent1"><div align="left"><strong>AMC of PC,UPS </strong></div></td>
    <td colspan="2"  class="tablecontent1" ><div align="center">
      <input type="text" name="amc_of_pc" id="amc_of_pc" size="15"value='<%=fix_val1%>'readonly="2"/>
    </div></td>
    <td  class="tablecontent1" ><div align="center">
      <input type="text" name="amc_of_pc1" id="amc_of_pc1" size="15" value='<%=rsAdminResult.getString("amc_of_pc1")%>'onblur="fnCalCum(amc_of_pc1,'<%=cum_mon1%>',amc_of_pc2 ,'<%=rsAdminResult.getString("amc_of_pc1")%>')"/>
    </div></td>
    <td  class="tablecontent1" ><div align="center">
      <input type="text" name="amc_of_pc2" id="amc_of_pc2" size="15"value='<%=cum_mon1%>'readonly="2"/>
    </div></td>
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
	

 <div align="center">



<%
if(role.equalsIgnoreCase("SU")  && buttonFlag==0){%>
<html:submit value="Add" onclick="submitForm()" /> &nbsp;
<%}else{%>

<html:submit property="method" value="submit" />
<%}%>
<input class="butt" type="button" name="reset" value="Reset" tabindex="18" onclick="pageReload()"/>&nbsp;
<input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
</form>


</body>
</html>
