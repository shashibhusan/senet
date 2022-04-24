<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<link href="inb.css" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<script>
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
function pageReload(){
	location.reload(true);
}

</script>
<script>
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
	  if (!document.getElementById('fund_release_nmcp').value.match(numericExpression))
      {
                 alert("Please insert numeric value in fund_release_nmcp Field!");
                 document.getElementById('fund_release_nmcp').focus();
                 return false;
      }
	  if (!document.getElementById('fund_release_nmcp_seminar').value.match(numericExpression))
      {
                 alert("Please insert numeric value in fund_release_nmcp_seminar Field!");
                 document.getElementById('fund_release_nmcp_seminar').focus();
                 return false;
      }
	  if (!document.getElementById('Target_mda').value.match(numericExpression))
      {
                 alert("Please insert numeric value in Target_mda Field!");
                 document.getElementById('Target_mda').focus();
                 return false;
      }
	    if (!document.getElementById('Target_nmcp').value.match(numericExpression))
      {
                 alert("Please insert numeric value in Target_nmcp Field!");
                 document.getElementById('Target_nmcp').focus();
                 return false;
      }
	  if (!document.getElementById('Target_nmcp_seminar').value.match(numericExpression))
      {
                 alert("Please insert numeric value in Target_nmcp_seminar Field!");
                 document.getElementById('Target_nmcp_seminar').focus();
                 return false;
      }
	 
	
        
	if (document.getElementById('instId').value=='')
      {
	      //instId userName months years
	      alert("Session Expired!");
				 //document.getElementById('stf_st_pos_d').focus();
				 return false;
	 }
	
	  
	
	  formSubmit();
}
</script>

</script>
</head>
<body bgcolor="#FFFFFF">

<%String instId = request.getParameter("instId");
String months = request.getParameter("months");
String years =request.getParameter("years");
String mnm = request.getParameter("mnm");
String role = request.getParameter("role");
System.out.println(months);
System.out.println(years);
System.out.println(instId);



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



if(role.equalsIgnoreCase("LU")){	
		 String strSql = "select * from tbl_target_ssi_mda where  year="+tYears+" and InstId='"+instId+"'";
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
String strSql = "SELECT * FROM tbl_target_ssi_mda WHERE  year="+tYears+" AND   InstId='"+instId+"'"; 
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
<form  name="form1" id="form1" method="post" action="TargetSSI-MDAsubmit.jsp"  onsubmit="return formValidator()">
<table align="center">
<tr><td width="452" align="center" class="header"><STRONG><%=rs_instName.getString("INST_NAME")%></STRONG></td></tr>
<input type="hidden" size="5" name="months" value="<%=request.getParameter("months")%>" />
<input type="hidden" size="5" name="years" value="<%=request.getParameter("years")%>" />
<input type="hidden" size="5" name="instId" value="<%=request.getParameter("instId")%>" />
<tr><td width="452" align="center" class="header"> Enter Your Target/Fund Release for Monthly progress Report(MSME-BARCODE</STRONG></td></tr>
</table>
 

 <BR>
<div align="center">
<table width="100%" border="0" align="center" >
    <tr>
	<td height="22" colspan="1" class="tableheader"><div align="center">Target/Fund Allocated </div></td>
      <td height="22" colspan="1" class="tableheader"><div align="center"> One time Registration Fees(MDA) </div></td>
	      <td height="22" colspan="1" class="tableheader"><div align="center"> Annual Recurring Fees(NMCP)</div></td>
		      <td height="22" colspan="1" class="tableheader"><div align="center"> NMCP Seminar </div></td>
    </tr>
	 <%if(divFlag==0){%>
    <tr>
      <td width="338" height="26" class="tablecontent11" align="left"><div align="center">Fund Allocated </font> </div></td>
      <td width="120"  class="tablecontent11"><input type="text" name="fund_release_mda2" id="fund_release_mda2" size="20" height="20"/></td>
      <td width="120"  class="tablecontent1"><input type="text" name="fund_release_nmcp" id="fund_release_nmcp" size="20"/></td>
      <td width="122"  class="tablecontent1"><input type="text" name="fund_release_nmcp_seminar" id="fund_release_nmcp_seminar" size="20"/></td>
    </tr>
    <tr>
      <td height="26" class="tablecontent12" align="left"><div align="center">Target (MSEs) to be benefitted </div></td>
      <td width="120"  class="tablecontent12"><input type="text" name="Target_mda" id="Target_mda" size="20"/></td>
     <td width="120"  class="tablecontent2"><input type="text" name="Target_nmcp" id="Target_nmcp" size="20"/></td>
      <td width="122"  class="tablecontent2"><input type="text" name="Target_nmcp_seminar" id="Target_nmcp_seminar" size="20"/></td>
    </tr>
	<% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_target_ssi_mda WHERE  year="+tYears+" AND   InstId='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>
 <tr>
    <td width="338" height="26" class="tablecontent11" align="left"><div align="center">Fund Allocated </div></td>
    <td width="120"  class="tablecontent1"><input type="text" name="fund_release_mda" id="fund_release_mda" size="20" value='<%=rsAdminResult.getString("fund_release_mda")%>'/></td>
    <td width="120"  class="tablecontent1"><input type="text" name="fund_release_nmcp" id="fund_release_nmcp" size="20" value='<%=rsAdminResult.getString("fund_release_nmcp")%>'/></td>
    <td width="122"  class="tablecontent1"><input type="text" name="fund_release_nmcp_seminar" id="fund_release_nmcp_seminar" size="20" value='<%=rsAdminResult.getString("fund_release_nmcp_seminar")%>'/></td>
  <tr>
      <td height="26" class="tablecontent12" align="left"><div align="center">Target (MSEs) to be benefitted </div></td>
    <td width="120"  class="tablecontent2"><input type="text" name="Target_mda" id="Target_mda" size="20" value='<%=rsAdminResult.getString("Target_mda")%>'/></td>
     <td width="120"  class="tablecontent2"><input type="text" name="Target_nmcp" id="Target_nmcp" size="20" value='<%=rsAdminResult.getString("Target_nmcp")%>'/></td>
    <td width="122"  class="tablecontent2"><input type="text" name="Target_nmcp_seminar" id="Target_nmcp_seminar" size="20" value='<%=rsAdminResult.getString("Target_nmcp_seminar")%>'/></td>
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
