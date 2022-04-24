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
	var decimalExpression=/^-?\d+(\.\d+)?$/;
	var decimalExpression=/^((\d+(\.\d*)?)|((\d*\.)?\d+))$/;	
//***********Budget */
//Carry Forward      
	if (!document.getElementById('1c1').value.match(numericExpression))
      {
                 alert("Please insert numeric value in vdp Field!");
                 document.getElementById('1c1').focus();
                 return false;
      }
	  if (!document.getElementById('1c2').value.match(numericExpression))
      {
                 alert("Please insert numeric value in vdp Field!");
                 document.getElementById('1c2').focus();
                 return false;
      }
	  if (!document.getElementById('1c3').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in vdp Field!");
                 document.getElementById('1c3').focus();
                 return false;
      }
	  if (!document.getElementById('1c4').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in vdp Field!");
                 document.getElementById('1c4').focus();
                 return false;
      }
	    if (!document.getElementById('1c5').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in vdp Field!");
                 document.getElementById('1c5').focus();
                 return false;
      }
	  if (!document.getElementById('1c6').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in vdp Field!");
                 document.getElementById('1c6').focus();
                 return false;
      }
	  if (!document.getElementById('1c7').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in vdp Field!");
                 document.getElementById('1c7').focus();
                 return false;
      }
	   if (!document.getElementById('2c2').value.match(numericExpression))
      {
                 alert("Please insert numeric value in vdp Field!");
                 document.getElementById('2c2').focus();
                 return false;
      }
	  if (!document.getElementById('2c3').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in vdp Field!");
                 document.getElementById('2c3').focus();
                 return false;
      }
	  if (!document.getElementById('2c4').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in vdp Field!");
                 document.getElementById('2c4').focus();
                 return false;
      }
	    if (!document.getElementById('2c5').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in vdp Field!");
                 document.getElementById('2c5').focus();
                 return false;
      }
	  if (!document.getElementById('2c6').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in vdp Field!");
                 document.getElementById('2c6').focus();
                 return false;
      }
	  if (!document.getElementById('2c7').value.match(decimalExpression))
      {
                 alert("Please insert numeric value in vdp Field!");
                 document.getElementById('2c7').focus();
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
                document.forms[0].action = "VendorAction.do?method=add";
                document.forms[0].submit();
            }
        </script>
</head>

<body bgcolor="#FBFBFB">

<html:form action="VendorAction" onsubmit="return formValidator()">
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
if(role.equalsIgnoreCase("IU")){	
		 String strSql = "select * from tbl_vendor where months =" + months +" and year='"+years+"' and instid='"+instId+"'";
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
String strSql = "SELECT * FROM tbl_vendor WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
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




String strCumulative=" SELECT sum(vdp_conducted),sum(unit_participated),sum(Amount_Disbursed),sum(SVDPvdp_conducted),sum(SVDPunit_participated),sum(SVDPAmount_Disbursed) FROM tbl_vendor where months >=1 AND months <="+months+" and year='"+years+"' and instid='"+instId+"'";

	      	System.out.println("strCumulative = "+strCumulative);
		flag=0;
	      int cum_mon1=0;
	      int cum_mon2=0;
		int cum_mon3=0;
	    int cum_mon4=0;
	      int cum_mon5=0;
		int cum_mon6=0;
		
			String fix_val1="0";
		
ResultSet rsCumulative=stmt.executeQuery(strCumulative);

	      while(rsCumulative.next())
	      {
	       cum_mon1=rsCumulative.getInt("sum(vdp_conducted)");
	       cum_mon2=rsCumulative.getInt("sum(unit_participated)");
		   cum_mon3=rsCumulative.getInt("sum(Amount_Disbursed)");
	       cum_mon4=rsCumulative.getInt("sum(SVDPvdp_conducted)");
	       cum_mon5=rsCumulative.getInt("sum(SVDPunit_participated)");
		   cum_mon6=rsCumulative.getInt("sum(SVDPAmount_Disbursed)");
		   
         	flag++;
	      }
	      System.out.println("flag"+flag);







String strQuery = "SELECT * FROM tbl_pms_target WHERE year='"+years+"' AND   Inst_Id='"+instId+"'"; 
ResultSet rsTargetResult =stmt.executeQuery(strQuery);

if(rsTargetResult.next()){
	System.out.println("Target Result Set have record");
		   fix_val1=rsTargetResult.getString("vdp");
			
			
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
<div style="font-size:large;font-family:Verdana;font-weight:bold;  " align="center" ><font color="#990000"> Monthly Progress Report of Vendor Development Programmes for the Month of <%=rs_month.getString("mon")%></font></div>

<br /><br />





<input type="hidden" size="5" name="months" value="<%=request.getParameter("months")%>" />
<input type="hidden" size="5" name="years" value="<%=request.getParameter("years")%>" />
<input type="hidden" size="5" name="instId" value="<%=request.getParameter("instId")%>" />
<input type="hidden" size="5" name="user_date" value='<%=years%>-<%=months%>-20' />
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="style1" style="width:100%; height: 145px; background-color: gainsboro;">
  <tr >
    <td width="240" rowspan="2" align="center" class="tableheader">Name of Programmes </td>
    <td width="60" rowspan="2" align="center" class="tableheader">Target</td>
    <td colspan="3"  align="center" class="tableheader">Monthly Data </td>
    <td colspan="3"  align="center" class="tableheader">Cumulative Data </td>
    </tr>
  <tr>
    <td width="63"align="center" class="tableheader">Number of VDP conducted</td>
    <td width="72"align="center" class="tableheader">No of unit Participated</td>
    <td width="82"align="center" class="tableheader">Amount Reliased (Expenditure)</td>
    <td width="63"align="center" class="tableheader">Number of VDP conducted</td>
	 <td width="72"align="center" class="tableheader">No of unit Participated</td>
    <td width="86"align="center" class="tableheader">Amount Reliased (Expenditure) </td>
  </tr>
    <%if(divFlag==0){%>
 <tr class="tablecontent11">
    <td>NVDP</td>
    <td rowspan="3"><input type="text" name="totaltarget" id="1c1" size="10" value='<%=fix_val1%>'onkeyup="keyPressed(this.id,event)"/></td>
   <td><input type="text" name="vdp_conducted" id="1c2" value="0" size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon1%>', cum_vdp_conducted)"onkeyup="keyPressed(this.id,event)"/></td>
    <td><input type="text" name="unit_participated" id="1c3" value="0" size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon2%>', cum_unit_participated)"onkeyup="keyPressed(this.id,event)"/></td>
	 <td><input type="text" name="amount_Disbursed" id="1c4" value="0" size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon3%>', cum_Amount_Disbursed)"onkeyup="keyPressed(this.id,event)"/></td>
   <td><input type="text" name="cum_vdp_conducted" id="1c5"  size="10" value='<%=cum_mon1%>'onkeyup="keyPressed(this.id,event)"/></td>
  
   <td><input type="text" name="cum_unit_participated" id="1c6" size="10" value='<%=cum_mon2%>'onkeyup="keyPressed(this.id,event)"/></td>
     
   <td><input type="text" name="cum_Amount_Disbursed" id="1c7" size="10"value='<%=cum_mon3%>'onkeyup="keyPressed(this.id,event)"/></td>
  </tr>
    <tr class="tablecontent12">
    <td height="26">SVDP</td>
      <td><input type="text" name="SVDPvdp_conducted" id="2c2" size="10" value="0" onblur="javascript:fnSum(this.value,'<%=cum_mon4%>', SVDPcum_vdp_conducted)"onkeyup="keyPressed(this.id,event)"/></td>
     <td><input type="text" name="SVDPunit_participated" id="2c3" value="0" size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon5%>', SVDPcum_unit_participated)"onkeyup="keyPressed(this.id,event)"/></td>
	  <td><input type="text" name="SVDPAmount_Disbursed" id="2c4" value="0" size="10"onblur="javascript:fnSum(this.value,'<%=cum_mon6%>', SVDPcum_Amount_Disbursed)"onkeyup="keyPressed(this.id,event)"/></td>
   <td><input type="text" name="SVDPcum_vdp_conducted" id="2c5" size="10" value='<%=cum_mon4%>'onkeyup="keyPressed(this.id,event)"/></td>
 
   <td><input type="text" name="SVDPcum_unit_participated" id="2c6" size="10" value='<%=cum_mon5%>'onkeyup="keyPressed(this.id,event)"/></td>
  
   <td><input type="text" name="SVDPcum_Amount_Disbursed" id="2c7" size="10"value='<%=cum_mon6%>'onkeyup="keyPressed(this.id,event)"/></td>
 

      <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_vendor WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>
<tr class="tablecontent11">
    <td >NVDP</td>
    <td rowspan="3"><input type="text" name="totaltarget" id="Totaltarget" size="10" value='<%=fix_val1%>'/></td>
   <td><input type="text" name="vdp_conducted" id="vdp_conducted" size="10" value='<%=rsAdminResult.getString("vdp_conducted")%>' onBlur="fnCalCum(vdp_conducted,'<%=cum_mon1%>',cum_vdp_conducted ,'<%=rsAdminResult.getString("vdp_conducted")%>')"/></td>
    <td><input type="text" name="unit_participated" id="unit_participated" size="10" value='<%=rsAdminResult.getString("unit_participated")%>' onBlur="fnCalCum(unit_participated,'<%=cum_mon2%>',cum_unit_participated ,'<%=rsAdminResult.getString("unit_participated")%>')"/></td>
	 <td><input type="text" name="amount_Disbursed" id="Amount_Disbursed" size="10" value='<%=rsAdminResult.getString("Amount_Disbursed")%>' onBlur="fnCalCum(Amount_Disbursed,'<%=cum_mon3%>',cum_Amount_Disbursed ,'<%=rsAdminResult.getString("Amount_Disbursed")%>')"/></td>
   <td><input type="text" name="cum_vdp_conducted" id="cum_vdp_conducted" size="10" value='<%=cum_mon1%>'/></td>
  
   <td><input type="text" name="cum_unit_participated" id="cum_unit_participated" size="10" value='<%=cum_mon2%>'/></td>
     
   <td><input type="text" name="cum_Amount_Disbursed" id="cum_Amount_Disbursed" size="10"value='<%=cum_mon3%>'/></td>
  </tr>
    <tr class="tablecontent12">
    <td>SVDP</td>
      <td><input type="text" name="SVDPvdp_conducted" id="SVDPvdp_conducted" size="10" value='<%=rsAdminResult.getString("SVDPvdp_conducted")%>' onBlur="fnCalCum(SVDPvdp_conducted,'<%=cum_mon4%>',SVDPcum_vdp_conducted ,'<%=rsAdminResult.getString("SVDPvdp_conducted")%>')"/></td>
     <td><input type="text" name="SVDPunit_participated" id="SVDPunit_participated" size="10" value='<%=rsAdminResult.getString("SVDPunit_participated")%>' onBlur="fnCalCum(SVDPunit_participated,'<%=cum_mon5%>',SVDPcum_unit_participated ,'<%=rsAdminResult.getString("SVDPunit_participated")%>')"/></td>
	  <td><input type="text" name="SVDPAmount_Disbursed" id="SVDPAmount_Disbursed" size="10" value='<%=rsAdminResult.getString("SVDPAmount_Disbursed")%>' onBlur="fnCalCum(SVDPAmount_Disbursed,'<%=cum_mon6%>',SVDPcum_Amount_Disbursed ,'<%=rsAdminResult.getString("SVDPAmount_Disbursed")%>')"/></td>
   <td><input type="text" name="SVDPcum_vdp_conducted" id="SVDPcum_vdp_conducted" size="10" value='<%=cum_mon4%>'/></td>
 
   <td><input type="text" name="SVDPcum_unit_participated" id="SVDPcum_unit_participated" size="10" value='<%=cum_mon5%>'/></td>
  
   <td><input type="text" name="SVDPcum_Amount_Disbursed" id="SVDPcum_Amount_Disbursed" size="10"value='<%=cum_mon6%>'/></td>
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
