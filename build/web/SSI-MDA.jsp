<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
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
	if (!document.getElementById('fund_release_mda').value.match(numericExpression))
      {
                 alert("Please insert numeric value in fund_release_mda Field!");
                 document.getElementById('fund_release_mda').focus();
                 return false;
      }
	  if (!document.getElementById('target_release_mda').value.match(numericExpression))
      {
                 alert("Please insert numeric value in target_release_mda Field!");
                 document.getElementById('target_release_mda').focus();
                 return false;
      }
	  if (!document.getElementById('Exp_mda').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in Exp_mda Field!");
                 document.getElementById('Exp_mda').focus();
                 return false;
      }
	  if (!document.getElementById('MSEs_mda').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in MSEs_mda Field!");
                 document.getElementById('MSEs_mda').focus();
                 return false;
      }
	    if (!document.getElementById('Cumm_exp_mda').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in Cumm_exp_mda Field!");
                 document.getElementById('Cumm_exp_mda').focus();
                 return false;
      }
	    if (!document.getElementById('Cumm_MSEs_mda').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in Cumm_MSEs_mda Field!");
                 document.getElementById('Cumm_MSEs_mda').focus();
                 return false;
      }
	    if (!document.getElementById('fund_release_nmcp').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in fund_release_nmcp Field!");
                 document.getElementById('fund_release_nmcp').focus();
                 return false;
      }
	    if (!document.getElementById('target_release_nmcp').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in target_release_nmcp Field!");
                 document.getElementById('target_release_nmcp').focus();
                 return false;
      }
	    if (!document.getElementById('Exp_nmcp').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in Exp_nmcp Field!");
                 document.getElementById('Exp_nmcp').focus();
                 return false;
      }
	    if (!document.getElementById('MSEs_nmcp').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in MSEs_nmcp Field!");
                 document.getElementById('MSEs_nmcp').focus();
                 return false;
      }
	    if (!document.getElementById('Cumm_exp_nmcp').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in Cumm_exp_nmcp Field!");
                 document.getElementById('Cumm_exp_nmcp').focus();
                 return false;
      }
	    if (!document.getElementById('Cumm_MSEs_nmcp').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in Cumm_MSEs_nmcp Field!");
                 document.getElementById('Cumm_MSEs_nmcp').focus();
                 return false;
      }
	    if (!document.getElementById('fund_release_nmcp_seminar').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in fund_release_nmcp_seminar Field!");
                 document.getElementById('fund_release_nmcp_seminar').focus();
                 return false;
      }
	    if (!document.getElementById('target_release_nmcp_seminar').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in target_release_nmcp_seminar Field!");
                 document.getElementById('target_release_nmcp_seminar').focus();
                 return false;
      }
	    if (!document.getElementById('Exp_nmcp_seminar').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in Exp_nmcp_seminar Field!");
                 document.getElementById('Exp_nmcp_seminar').focus();
                 return false;
      }
	    if (!document.getElementById('MSEs_nmcp_seminar').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in MSEs_nmcp_seminar Field!");
                 document.getElementById('MSEs_nmcp_seminar').focus();
                 return false;
      }
	    if (!document.getElementById('Cumm_exp_nmcp_seminar').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in Cumm_exp_nmcp_seminar Field!");
                 document.getElementById('Cumm_exp_nmcp_seminar').focus();
                 return false;
      }
	   if (!document.getElementById('Cumm_MSEs_nmcp_seminar').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in Cumm_MSEs_nmcp_seminar Field!");
                 document.getElementById('Cumm_MSEs_nmcp_seminar').focus();
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
</head>
<body bgcolor="#FEFDE0">
<form  name="form1" id="form1" method="post" action="SSI-MDAsubmit.jsp" onsubmit="return formValidator()">
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
	int tYears = Integer.parseInt(years);
	//if(months=="JANUARY" || months=="FEBRUARY" || months=="MARCH"){
	if(months.equalsIgnoreCase("10") || months.equalsIgnoreCase("11") || months.equalsIgnoreCase("12")){
		tYears = tYears-1;
		flag1=1;
	}
Connection con = ConnectionManager.getConnectionDirectForMySQL();
Statement stmt4 = (Statement)con.createStatement();
 Statement stmt = (Statement)con.createStatement();
if(role.equalsIgnoreCase("IU")){	
		 String strSql = "select * from tbl_ssi_mda where months ='" + months +"' and year="+years+" and inst_id='"+instId+"'";
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
String strSql = "SELECT * FROM tbl_ssi_mda WHERE months='"+months+"' AND year="+years+" AND   inst_id='"+instId+"'"; 
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








String strCumulative=" SELECT sum(Exp_mda),sum(MSEs_mda),sum(Exp_nmcp),sum(MSEs_nmcp) ,sum(Exp_nmcp_seminar),sum(MSEs_nmcp_seminar)   FROM tbl_ssi_mda where DATE_FORMAT(months/year,'%m/%Y')>=DATE_FORMAT(1/"+tYears+",'%m/%y') and year="+tYears+" and inst_id='"+instId+"'";

	      	System.out.println("strCumulative = "+strCumulative);
		flag=0;
	      int cum_mon1=0;
	      int cum_mon2=0;
		  int cum_mon6=0;
	      int cum_mon3=0;
		  int cum_mon4=0;
	      int cum_mon5=0;
  	      
			String fix_val1="0";
			String fix_val2="0";
			String fix_val3="0";
			String fix_val4="0";
			String fix_val5="0";
			String fix_val6="0";
ResultSet rsCumulative=stmt.executeQuery(strCumulative);

	      while(rsCumulative.next())
	      {
	       cum_mon1=rsCumulative.getInt("sum(Exp_mda)");
	       cum_mon2=rsCumulative.getInt("sum(MSEs_mda)");
		  cum_mon3=rsCumulative.getInt("sum(Exp_nmcp)");
	       cum_mon4=rsCumulative.getInt("sum(MSEs_nmcp)");
		   cum_mon5=rsCumulative.getInt("sum(Exp_nmcp_seminar)");
	       cum_mon6=rsCumulative.getInt("sum(MSEs_nmcp_seminar)");
         	flag++;
	      }
	      System.out.println("flag"+flag);


		  
		  
		  

String strQuery = "SELECT  InstId, year, fund_release_mda, fund_release_nmcp, fund_release_nmcp_seminar, Target_mda, Target_nmcp, Target_nmcp_seminar FROM tbl_target_ssi_mda WHERE year="+tYears+" AND   InstId='"+instId+"'"; 
ResultSet rsTargetResult =stmt.executeQuery(strQuery);

if(rsTargetResult.next()){
	System.out.println("Target Result Set have record");
		   fix_val1=rsTargetResult.getString("fund_release_mda");
			 fix_val2=rsTargetResult.getString("fund_release_nmcp");
			  fix_val3=rsTargetResult.getString("fund_release_nmcp_seminar");
			 fix_val4=rsTargetResult.getString("Target_mda");
			  fix_val5=rsTargetResult.getString("Target_nmcp");
			 fix_val6=rsTargetResult.getString("Target_nmcp_seminar");
		   readOnlyFlag="readOnly";
}





%>
<%

System.out.println("instId="+instId);
String strsql1="select * from TBL_DI_INSTITUTE where inst_id='"+instId+"'" ;
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
<div style="font-size:large;font-family:Verdana;font-weight:bold" align="center"><font color="#990000">  Enter Detail of Monthly Progress Reports of Month <%=rs_month.getString("mon")%></font></div>
<br>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Amount(in Lacs)</h4>
<table width="80%" border="0" cellspacing="2" cellpadding="2"  align="center">

<input type="hidden" size="5" name="months" value="<%=request.getParameter("months")%>" />
<input type="hidden" size="5" name="years" value="<%=request.getParameter("years")%>" />
<input type="hidden" size="5" name="instId" value="<%=request.getParameter("instId")%>" />
  
  <tr >
    <td width="53%" rowspan="2" class="tableheader">Name of Programmes </td>
    <td width="9%"class="tableheader" ><div align="center">Funds Allocated </div></td>
    <td width="8%" class="tableheader"><div align="center">Targets (MSEs)</div></td>
	<td width="8%"class="tableheader"><div align="center">Exp.</div></td>
    <td width="7%"class="tableheader"><div align="center">MSEs</div></td>
    <td width="8%"class="tableheader"><div align="center">Cum. Exp.</div></td>
    <td width="7%"class="tableheader"><div align="center">Cum.    MSEs.</div></td>
   
   
  </tr>
  <tr >
    
  </tr>
  <%if(divFlag==0){%>
  <tr >
    <td class="tablecontent11"> One-time Registration fee(MDA)</td>
    <td class="tablecontent1"><input type="text" name="fund_release_mda" id="fund_release_mda" size="8"value='<%=fix_val1%>' readonly="2"/></td>
    <td class="tablecontent1"><input type="text" name="target_release_mda" id="target_release_mda" size="8"value='<%=fix_val4%>' readonly="2"/></td>
    <td class="tablecontent1"><input type="text" name="Exp_mda" id="Exp_mda" size="8" onblur="javascript:fnSum(this.value,'<%=cum_mon1%>', Cumm_exp_mda)"/></td>
    <td class="tablecontent1"><input type="text" name="MSEs_mda" id="MSEs_mda" size="8" onblur="javascript:fnSum(this.value,'<%=cum_mon2%>', Cumm_MSEs_mda)"/></td>
    <td class="tablecontent1"><input type="text" name="Cumm_exp_mda" id="Cumm_exp_mda" size="8" value='<%=cum_mon1%>' readonly="2" /></td>
   <td class="tablecontent1"><input type="text" name="Cumm_MSEs_mda" id="Cumm_MSEs_mda" size="8" value='<%=cum_mon2%>' readonly="2" /></td>
  </tr>
  <tr >
    <td class="tablecontent12">One Time Recurring Fees(NMCP) </td>
    <td class="tablecontent2"><input type="text" name="fund_release_nmcp" id="fund_release_nmcp" size="8"value='<%=fix_val2%>' readonly="2"/></td>
   <td class="tablecontent2"><input type="text" name="target_release_nmcp" id="target_release_nmcp" size="8"value='<%=fix_val5%>' readonly="2"/></td>
    <td class="tablecontent2"><input type="text" name="Exp_nmcp" id="Exp_nmcp" size="8" onblur="javascript:fnSum(this.value,'<%=cum_mon3%>', Cumm_exp_nmcp)"/></td>
    <td class="tablecontent2"><input type="text" name="MSEs_nmcp" id="MSEs_nmcp" size="8" onblur="javascript:fnSum(this.value,'<%=cum_mon4%>', Cumm_MSEs_nmcp)"/></td>
   <td class="tablecontent2"><input type="text" name="Cumm_exp_nmcp" id="Cumm_exp_nmcp" size="8" value='<%=cum_mon3%>' readonly="2" /></td>
   <td class="tablecontent2"><input type="text" name="Cumm_MSEs_nmcp" id="Cumm_MSEs_nmcp" size="8" value='<%=cum_mon4%>' readonly="2" /></td>
  </tr>
  <tr>
    <td  class="tablecontent11">NMCP Seminar </td>
    <td class="tablecontent1"><input type="text" name="fund_release_nmcp_seminar" id="fund_release_nmcp_seminar" size="8"value='<%=fix_val3%>' readonly="2"/></td>
   <td class="tablecontent1"><input type="text" name="target_release_nmcp_seminar" id="target_release_nmcp_seminar" size="8"value='<%=fix_val6%>' readonly="2"/></td>
   <td class="tablecontent1"><input type="text" name="Exp_nmcp_seminar" id="Exp_nmcp_seminar" size="8" onblur="javascript:fnSum(this.value,'<%=cum_mon5%>', Cumm_exp_nmcp_seminar)"/></td>
   <td class="tablecontent1"><input type="text" name="MSEs_nmcp_seminar" id="MSEs_nmcp_seminar" size="8" onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', Cumm_MSEs_nmcp_seminar)"/></td>
    <td class="tablecontent1"><input type="text" name="Cumm_exp_nmcp_seminar" id="Cumm_exp_nmcp_seminar" size="8" value='<%=cum_mon5%>' readonly="2" /></td>
    <td class="tablecontent1"><input type="text" name="Cumm_MSEs_nmcp_seminar" id="Cumm_MSEs_nmcp_seminar" size="8" value='<%=cum_mon6%>' readonly="2" /></td>
  </tr>
  
  <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_ssi_mda WHERE months='"+months+"' AND year="+years+" AND   inst_id='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>
<tr>
    <td class="tablecontent11"> one-time Registration fee(MDA)</td>
    <td  class="tablecontent1" ><input type="text" name="fund_release_mda" id="fund_release_mda" size="8"value='<%=fix_val1%>' readonly="2"/></td>
    <td  class="tablecontent1" ><input type="text" name="target_release_mda" id="target_release_mda" size="8"value='<%=fix_val4%>' readonly="2"/></td>
    <td  class="tablecontent1" ><input type="text" name="Exp_mda" id="Exp_mda" size="8" value='<%=rsAdminResult.getString("Exp_mda")%>'onBlur="fnCalCum(Exp_mda,'<%=rsAdminResult.getString("Cumm_exp_mda")%>',Cumm_exp_mda ,'<%=rsAdminResult.getString("Exp_mda")%>')"/></td>
    <td  class="tablecontent1" ><input type="text" name="MSEs_mda" id="MSEs_mda" size="8"value='<%=rsAdminResult.getString("MSEs_mda")%>'onBlur="fnCalCum(MSEs_mda,'<%=rsAdminResult.getString("Cumm_MSEs_mda")%>',Cumm_MSEs_mda ,'<%=rsAdminResult.getString("MSEs_mda")%>')"/></td>
    <td  class="tablecontent1" ><input type="text" name="Cumm_exp_mda" id="Cumm_exp_mda" size="8"value='<%=rsAdminResult.getString("Cumm_exp_mda")%>' readonly="2" /></td>
   <td  class="tablecontent1" ><input type="text" name="Cumm_MSEs_mda" id="Cumm_MSEs_mda" size="8" value='<%=rsAdminResult.getString("Cumm_MSEs_mda")%>' readonly="2" /></td>
  </tr>
  <tr>
    <td class="tablecontent12" >One Time Recurring Fees(NMCP) </td>
    <td  class="tablecontent2" ><input type="text" name="fund_release_nmcp" id="fund_release_nmcp" size="8"value='<%=fix_val2%>' readonly="2"/></td>
   <td  class="tablecontent2" ><input type="text" name="target_release_nmcp" id="target_release_nmcp" size="8"value='<%=fix_val5%>' readonly="2"/></td>
    <td  class="tablecontent2" ><input type="text" name="Exp_nmcp" id="Exp_nmcp" size="8" value='<%=rsAdminResult.getString("Exp_nmcp")%>'onBlur="fnCalCum(Exp_nmcp,'<%=rsAdminResult.getString("Cumm_exp_nmcp")%>',Cumm_exp_nmcp ,'<%=rsAdminResult.getString("Exp_nmcp")%>')"/></td>
    <td  class="tablecontent2" ><input type="text" name="MSEs_nmcp" id="MSEs_nmcp" size="8" value='<%=rsAdminResult.getString("MSEs_nmcp")%>'onBlur="fnCalCum(MSEs_nmcp,'<%=rsAdminResult.getString("Cumm_MSEs_nmcp")%>',Cumm_MSEs_nmcp ,'<%=rsAdminResult.getString("MSEs_nmcp")%>')"/></td>
   <td  class="tablecontent2" ><input type="text" name="Cumm_exp_nmcp" id="Cumm_exp_nmcp" size="8" value='<%=rsAdminResult.getString("Cumm_exp_nmcp")%>' readonly="2" /></td>
   <td  class="tablecontent2" ><input type="text" name="Cumm_MSEs_nmcp" id="Cumm_MSEs_nmcp" size="8" value='<%=rsAdminResult.getString("Cumm_MSEs_nmcp")%>' readonly="2" /></td>
  </tr>
  <tr>
    <td  class="tablecontent11" >NMCP Seminar </td>
    <td  class="tablecontent1" ><input type="text" name="fund_release_nmcp_seminar" id="fund_release_nmcp_seminar" size="8"value='<%=fix_val3%>' readonly="2"/></td>
   <td  class="tablecontent1" ><input type="text" name="target_release_nmcp_seminar" id="target_release_nmcp_seminar" size="8"value='<%=fix_val6%>' readonly="2"/></td>
   <td  class="tablecontent1" ><input type="text" name="Exp_nmcp_seminar" id="Exp_nmcp_seminar" size="8" value='<%=rsAdminResult.getString("Exp_nmcp_seminar")%>'onBlur="fnCalCum(Exp_nmcp_seminar,'<%=rsAdminResult.getString("Cumm_exp_nmcp_seminar")%>',Cumm_exp_nmcp_seminar ,'<%=rsAdminResult.getString("Exp_nmcp_seminar")%>')"/></td>
   <td  class="tablecontent1" ><input type="text" name="MSEs_nmcp_seminar" id="MSEs_nmcp_seminar" size="8" value='<%=rsAdminResult.getString("MSEs_nmcp_seminar")%>'onBlur="fnCalCum(MSEs_nmcp_seminar,'<%=rsAdminResult.getString("Cumm_MSEs_nmcp_seminar")%>',Cumm_MSEs_nmcp_seminar ,'<%=rsAdminResult.getString("MSEs_nmcp_seminar")%>')"/></td>
    <td  class="tablecontent1" ><input type="text" name="Cumm_exp_nmcp_seminar" id="Cumm_exp_nmcp_seminar" size="8" value='<%=rsAdminResult.getString("Cumm_exp_nmcp_seminar")%>' readonly="2" /></td>
    <td  class="tablecontent1" ><input type="text" name="Cumm_MSEs_nmcp_seminar" id="Cumm_MSEs_nmcp_seminar" size="8" value='<%=rsAdminResult.getString("Cumm_MSEs_nmcp_seminar")%>' readonly="2" /></td>
  </tr>
  
  <% }%>
</table>
</body>
 <div align="center">
<%
if(role.equalsIgnoreCase("SU") && buttonFlag==0){%>
<input class="butt" type="submit" name="submit" value="Edit" tabindex="16"onclick="show_confirm()"/>&nbsp;
<%}else{%>
<input class="butt" type="submit" name="submit" value="Add" tabindex="16" onclick="show_confirm()"/>&nbsp;
<%}%>
<input class="butt" type="button" name="reset" value="Reset" tabindex="18" onclick="pageReload()"/>&nbsp;
<input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
</form>

</div>
</html>
