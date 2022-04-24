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
	
	  if (!document.getElementById('No_Of_unit_benefitted').value.match(numericExpression))
      {
                 alert("Please insert numeric value in No Of unit benefitted Field!");
                 document.getElementById('No_Of_unit_benefitted').focus();
                 return false;
      }
	  if (!document.getElementById('No_jobs_underTaken').value.match(numericExpression))
      {
                 alert("Please insert numeric value in the  Field!");
                 document.getElementById('No_jobs_underTaken').focus();
                 return false;
      }
	  if (!document.getElementById('No_Trainees_Trained').value.match(numericExpression))
      {
                 alert("Please insert numeric value in the  Field!");
                 document.getElementById('No_Trainees_Trained').focus();
                 return false;
      }
	    if (!document.getElementById('No_jobs_Completed').value.match(numericExpression))
      {
                 alert("Please insert numeric value in the  Field!");
                 document.getElementById('No_jobs_Completed').focus();
                 return false;
      }
	    if (!document.getElementById('No_units_Registered').value.match(numericExpression))
      {
                 alert("Please insert numeric value in the  Field!");
                 document.getElementById('No_units_Registered').focus();
                 return false;
      }
	    if (!document.getElementById('Capacity_Assessment').value.match(numericExpression))
      {
                 alert("Please insert numeric value in the  Field!");
                 document.getElementById('Capacity_Assessment').focus();
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
                document.forms[0].action = "workshop.do?method=add";
                document.forms[0].submit();
            }
        </script>
</head>
<body bgcolor="#FBFBFB">
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
		 String strSql = "select * from tbl_workshop where months =" + months +" and year='"+years+"' and instid='"+instId+"'";
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
String strSql = "SELECT * FROM tbl_workshop WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
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




String strCumulative=" SELECT sum(No_Of_unit_benefitted),sum(No_jobs_underTaken),sum(No_Trainees_Trained),sum(No_jobs_Completed),sum(Capacity_Assessment),sum(No_units_Registered)  FROM tbl_workshop where months >=1 AND months <="+months+" and year='"+years+"' and instid='"+instId+"'";

	      	System.out.println("strCumulative = "+strCumulative);
		flag=0;
	      double cum_mon1=0;
	      double cum_mon2=0;
		double cum_mon3=0;
	      double cum_mon4=0;
		  double cum_mon5=0;
	      double cum_mon6=0;
		 String fix_val1="0";
	
ResultSet rsCumulative=stmt.executeQuery(strCumulative);
 
	      while(rsCumulative.next())
	      {
	       cum_mon1=rsCumulative.getDouble("sum(No_Of_unit_benefitted)");
	       cum_mon2=rsCumulative.getDouble("sum(No_jobs_underTaken)");
		   
		  cum_mon3=rsCumulative.getDouble("sum(No_Trainees_Trained)");
	       cum_mon4=rsCumulative.getDouble("sum(No_jobs_Completed)");
		   
		   cum_mon5=rsCumulative.getDouble("sum(No_units_Registered)");
	       cum_mon6=rsCumulative.getDouble("sum(Capacity_Assessment)");
		          	
					flag++;
	      }
	      System.out.println("flag"+flag);


String strQuery = "SELECT * FROM tbl_pms_target WHERE year='"+years+"' AND   Inst_Id='"+instId+"'"; 
ResultSet rsTargetResult =stmt.executeQuery(strQuery);

if(rsTargetResult.next()){
	System.out.println("Target Result Set have record");
		   fix_val1=rsTargetResult.getString("workshop");
		
			
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
<div style="font-size:large;font-family:Verdana;font-weight:bold;  " align="center" ><font color="#990000"> Monthly Progress Report of workshop Details  <%=rs_month.getString("mon")%></font></div>

<br /><br />

<html:form action="workshop" onsubmit="return formValidator()">

<input type="hidden" size="5" name="months" value="<%=request.getParameter("months")%>" />
<input type="hidden" size="5" name="years" value="<%=request.getParameter("years")%>" />
<input type="hidden" size="5" name="instId" value="<%=request.getParameter("instId")%>" />
<input type="hidden" size="5" name="user_date" value='<%=years%>-<%=months%>-20' />
<input type="hidden" size="5" name="workshop" value='<%=fix_val1%>' />
<% System.out.println("cdxvdfgdfgf"+fix_val1);%>
<table width="100%" border="0" align="center" >

  <tr  >
    <td width="33"  class="tableheader">S.No</td>
    <td width="469"  class="tableheader">Workshop Details </td>
    <td width="120" colspan="1"  class="tableheader">Monthly Achievment</td>
	 <td width="120" colspan="1"  class="tableheader">Cum.Achievment</td>
  </tr>
     <%if(divFlag==0){%>
  <tr >
    <td  class="tablecontent11">1</td>
    <td  class="tablecontent11">No. Of unit benefitted through service of Workshop </td>
   <td><input type="text" name="no_Of_unit_benefitted" id="No_Of_unit_benefitted" value="0" size="20" onblur="javascript:fnSum(this.value,'<%=cum_mon1%>', cum_No_Of_unit_benefitted)" /></td>
   <td><input type="text" name="cum_No_Of_unit_benefitted" id="cum_No_Of_unit_benefitted" size="20"value='<%=cum_mon1%>'readonly="2"/></td>
  </tr>
  <tr >
    <td  class="tablecontent12"> 2</td>
    <td  class="tablecontent12">No. Of jobs underTaken</td>
   <td class="tablecontent2"><input type="text" name="no_jobs_underTaken" id="No_jobs_underTaken" value="0"  size="20"onblur="javascript:fnSum(this.value,'<%=cum_mon2%>', cum_No_jobs_underTaken)"/></td>
   <td class="tablecontent2"><input type="text" name="cum_No_jobs_underTaken" id="cum_No_jobs_underTaken" size="20"value='<%=cum_mon2%>'readonly="2"/></td>
  </tr>
  <tr >
    <td  class="tablecontent11">3</td>
    <td  class="tablecontent11">No. Of Trainees Trained in workshop programmes</td>
   <td class="tablecontent1"><input type="text" name="no_Trainees_Trained" id="No_Trainees_Trained" value="0" size="20"onblur="javascript:fnSum(this.value,'<%=cum_mon3%>', cum_No_Trainees_Trained)"/></td>
   <td class="tablecontent1"> <input type="text" name="cum_No_Trainees_Trained" id="cum_No_Trainees_Trained" size="20"value='<%=cum_mon3%>' readonly="2"/></td>
  </tr>
  <tr >
    <td  class="tablecontent12">4</td>
    <td  class="tablecontent12">No. Of jobs Completed</td>
   <td class="tablecontent2"><input type="text" name="no_jobs_Completed" id="No_jobs_Completed" value="0" size="20"onblur="javascript:fnSum(this.value,'<%=cum_mon4%>', cum_No_jobs_Completed)"/></td>
   <td class="tablecontent2"><input type="text" name="cum_No_jobs_Completed" id="cum_No_jobs_Completed" size="20"value='<%=cum_mon4%>' readonly="2"/></td>
  </tr>
  <tr >
    <td  class="tablecontent11">5</td>
    <td  class="tablecontent11">No. Of units Registered under single point Registration </td>
   <td class="tablecontent1"><input type="text" name="no_units_Registered" id="No_units_Registered" value="0"  size="20"onblur="javascript:fnSum(this.value,'<%=cum_mon5%>', cum_No_units_Registered)"/></td>
   <td class="tablecontent1"><input type="text" name="cum_No_units_Registered" id="cum_No_units_Registered" size="20"value='<%=cum_mon5%>' readonly="2"/></td>
  </tr>
  <tr >
    <td  class="tablecontent12">6</td>
    <td  class="tablecontent12">Capacity Assessment</td>
   <td class="tablecontent2"><input type="text" name="capacity_Assessment" id="Capacity_Assessment" value="0" size="20"onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', cum_Capacity_Assessment)"/></td>
   <td class="tablecontent2"><input type="text" name="cum_Capacity_Assessment" id="cum_Capacity_Assessment" size="20"value='<%=cum_mon6%>' readonly="2"/></td>
  </tr>
  
        <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_workshop WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
  System.out.println(strSql);
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>

<tr >
    <td  class="tablecontent11">1</td>
    <td  class="tablecontent11">No. Of unit benefitted through service of Workshop </td>
   <td class="tablecontent1"><input type="text" name="no_Of_unit_benefitted" id="No_Of_unit_benefitted" size="20"value='<%=rsAdminResult.getString("No_Of_unit_benefitted")%>' onBlur="fnCalCum(No_Of_unit_benefitted,'<%=cum_mon1%>',cum_No_Of_unit_benefitted ,'<%=rsAdminResult.getString("No_Of_unit_benefitted")%>')"/></td>
   <td class="tablecontent1"><input type="text" name="cum_No_Of_unit_benefitted" id="cum_No_Of_unit_benefitted" size="20"value='<%=cum_mon1%>' readonly="2"/></td>
  </tr>
  <tr >
    <td  class="tablecontent12"> 2</td>
    <td  class="tablecontent12">No. Of jobs underTaken</td>
   <td class="tablecontent2"><input type="text" name="no_jobs_underTaken" id="No_jobs_underTaken" size="20"value='<%=rsAdminResult.getString("No_jobs_underTaken")%>'onBlur="fnCalCum(No_jobs_underTaken,'<%=cum_mon2%>',cum_No_jobs_underTaken ,'<%=rsAdminResult.getString("No_jobs_underTaken")%>')"/></td>
   <td class="tablecontent2"><input type="text" name="cum_No_jobs_underTaken" id="cum_No_jobs_underTaken" size="20"value='<%=cum_mon2%>' readonly="2"/></td>
  </tr>
  <tr >
    <td  class="tablecontent11">3</td>
    <td  class="tablecontent11">No. Of Trainees Trained in workshop programmes</td>
   <td class="tablecontent1"><input type="text" name="no_Trainees_Trained" id="No_Trainees_Trained" size="20"value='<%=rsAdminResult.getString("No_Trainees_Trained")%>'onBlur="fnCalCum(No_Trainees_Trained,'<%=cum_mon3%>',cum_No_Trainees_Trained ,'<%=rsAdminResult.getString("No_Trainees_Trained")%>')"/></td>
   <td class="tablecontent1"><input type="text" name="cum_No_Trainees_Trained" id="cum_No_Trainees_Trained" size="20"value='<%=cum_mon3%>' readonly="2"/></td>
  </tr>
  <tr >
    <td  class="tablecontent12">4</td>
    <td  class="tablecontent12">No. Of jobs Completed</td>
   <td class="tablecontent2"><input type="text" name="no_jobs_Completed" id="No_jobs_Completed" size="20"value='<%=rsAdminResult.getString("No_jobs_Completed")%>'onBlur="fnCalCum(No_jobs_Completed,'<%=cum_mon4%>',cum_No_jobs_Completed ,'<%=rsAdminResult.getString("No_jobs_Completed")%>')"/></td>
   <td class="tablecontent2"><input type="text" name="cum_No_jobs_Completed" id="cum_No_jobs_Completed" size="20"value='<%=cum_mon4%>' readonly="2"/></td>
  </tr>
  <tr >
    <td  class="tablecontent11">5</td>
    <td  class="tablecontent11">No. Of units Registered under single point Registration </td>
   <td class="tablecontent1"><input type="text" name="no_units_Registered" id="No_units_Registered" size="20"value='<%=rsAdminResult.getString("No_units_Registered")%>'onBlur="fnCalCum(No_units_Registered,'<%=cum_mon5%>',cum_No_units_Registered ,'<%=rsAdminResult.getString("No_units_Registered")%>')"/></td>
   <td class="tablecontent1"> <input type="text" name="cum_No_units_Registered" id="cum_No_units_Registered" size="20"value='<%=cum_mon5%>' readonly="2"/></td>
  </tr>
  <tr >
    <td  class="tablecontent12">6</td>
    <td  class="tablecontent12">Capacity Assessment</td>
   <td class="tablecontent2"><input type="text" name="capacity_Assessment" id="Capacity_Assessment" size="20"value='<%=rsAdminResult.getString("Capacity_Assessment")%>'onBlur="fnCalCum(Capacity_Assessment,'<%=cum_mon6%>',cum_Capacity_Assessment ,'<%=rsAdminResult.getString("Capacity_Assessment")%>')"/></td>
   <td class="tablecontent2"><input type="text" name="cum_Capacity_Assessment" id="cum_Capacity_Assessment" size="20"value='<%=cum_mon6%>' readonly="2"/></td>
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
</body>
</html>
