<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="inb.css" rel="stylesheet" type="text/css">
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
function formValidator(){
	var numericExpression = /^[0-9]+$/;
	var decimalExpression1=/^-?\d+(\.\d+)?$/;
	var decimalExpression=/^((\d+(\.\d*)?)|((\d*\.)?\d+))$/;	
//***********Budget */
//Carry Forward      
	if (!document.getElementById('esdp').value.match(numericExpression))
      {
                 alert("Please insert numeric value in esdp Field!");
                 document.getElementById('esdp').focus();
                 return false;
      }
	  if (!document.getElementById('edp').value.match(numericExpression))
      {
                 alert("Please insert numeric value in edp Field!");
                 document.getElementById('edp').focus();
                 return false;
      }
	  if (!document.getElementById('bsdp').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in bsdp Field!");
                 document.getElementById('bsdp').focus();
                 return false;
      }
	  if (!document.getElementById('mdp').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in mdp Field!");
                 document.getElementById('mdp').focus();
                 return false;
      }
	    if (!document.getElementById('sdp').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in sdp Field!");
                 document.getElementById('sdp').focus();
                 return false;
      }
	  if (!document.getElementById('imc').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in imc Field!");
                 document.getElementById('imc').focus();
                 return false;
      }
	   if (!document.getElementById('other').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in other Field!");
                 document.getElementById('other').focus();
                 return false;
      }
	  if (!document.getElementById('vdp').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in vdp Field!");
                 document.getElementById('vdp').focus();
                 return false;
      }
	  if (!document.getElementById('project_new').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in project_new Field!");
                 document.getElementById('project_new').focus();
                 return false;
      }
	  if (!document.getElementById('project_updated').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in project_updated Field!");
                 document.getElementById('project_updated').focus();
                 return false;
      }
	  if (!document.getElementById('state_industrial').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in state_industrial Field!");
                 document.getElementById('state_industrial').focus();
                 return false;
      }
	  if (!document.getElementById('Indl_Potenial').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in Indl_Potenial Field!");
                 document.getElementById('Indl_Potenial').focus();
                 return false;
      }
	  if (!document.getElementById('survey').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in survey Field!");
                 document.getElementById('survey').focus();
                 return false;
      }
	  if (!document.getElementById('status_report').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in status_report Field!");
                 document.getElementById('status_report').focus();
                 return false;
      }
	  if (!document.getElementById('technology_study').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in technology_study Field!");
                 document.getElementById('technology_study').focus();
                 return false;
      }
	  if (!document.getElementById('trade').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in trade Field!");
                 document.getElementById('trade').focus();
                 return false;
      }
	  if (!document.getElementById('Training_programmes').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in Training_programmes Field!");
                 document.getElementById('Training_programmes').focus();
                 return false;
      }
	   if (!document.getElementById('detail_of_projects').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in detail_of_projects Field!");
                 document.getElementById('detail_of_projects').focus();
                 return false;
      }
	   if (!document.getElementById('Sensitization_wto').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in Sensitization_wto Field!");
                 document.getElementById('Sensitization_wto').focus();
                 return false;
      }
	   if (!document.getElementById('Awareness_bio').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in Awareness_biotechnology Field!");
                 document.getElementById('Awareness_bio').focus();
                 return false;
      }
	   if (!document.getElementById('Programmes_Packaging').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in Programmes_Packaging Field!");
                 document.getElementById('Programmes_Packaging').focus();
                 return false;
      }
	   if (!document.getElementById('Programmes_bar').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in Programmes_bar Field!");
                 document.getElementById('Programmes_bar').focus();
                 return false;
      }
	   if (!document.getElementById('Awareness_cluster').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in Awareness_cluster Field!");
                 document.getElementById('Awareness_cluster').focus();
                 return false;
      }
	   if (!document.getElementById('TEQUP').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in awareness Field!");
                 document.getElementById('TEQUP').focus();
                 return false;
      }
	   if (!document.getElementById('Sensitization_ipr').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in Sensitization_ipr Field!");
                 document.getElementById('Sensitization_ipr').focus();
                 return false;
      }
	   if (!document.getElementById('Awareness_tequp').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in Awareness_tequp Field!");
                 document.getElementById('Awareness_tequp').focus();
                 return false;
      }
	   if (!document.getElementById('identification').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in identification Field!");
                 document.getElementById('identification').focus();
                 return false;
      }
	    if (!document.getElementById('seminar_on_vsbk').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in seminar_on_vsbk Field!");
                 document.getElementById('seminar_on_vsbk').focus();
                 return false;
      }
	    if (!document.getElementById('workshop').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in workshop Field!");
                 document.getElementById('workshop').focus();
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

<body bgcolor="#FBFBFB">
<form  name="form1" id="form1" method="post" action="targetpmssubmit.jsp" onsubmit="return formValidator()">

<%

String instId=(String)session.getAttribute("CmbIns");
 String role=(String)session.getAttribute("rol");
//String instId=(String)session.getAttribute("CmbIns");
String years=(String)session.getAttribute("CmbYear");
String months=(String)session.getAttribute("CmbMonth");
String user=(String)session.getAttribute("user");

System.out.println("SGHHHHHHHHHHHHHHHHHHHHHHHHHH"+months);
System.out.println(years);
System.out.println(instId);



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
	}
	
	
	
	
Connection con = ConnectionManager.getConnectionDirectForMySQL();
Statement stmt4 = (Statement)con.createStatement();
Statement stmt = (Statement)con.createStatement();



if(role.equalsIgnoreCase("AU")){	
		 String strSql = "select * from tbl_pms_target where  year='"+years+"' and inst_id='"+instId+"'";
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
String strSql = "SELECT * FROM tbl_pms_target WHERE  year='"+years+"' AND   inst_id='"+instId+"'"; 
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

<table width="474" align="center">
<tr><td width="466" align="center" "><STRONG><%=rs_instName.getString("INST_NAME")%></STRONG></td></tr>
<input type="hidden" size="5" name="months" value="<%=request.getParameter("months")%>" />
<input type="hidden" size="5" name="years1" value="<%=request.getParameter("years")%>" />
<input type="hidden" size="5" name="instId1" value="<%=request.getParameter("instId")%>" />
<tr>
  <td width="466" align="center">
 <h3 align="center" >  Enter Target for Monthly Progress Report for the Year <%=years%> </h3>
  </td>
  <br />
</tr>
</table>
<%if(divFlag==0){%>
<table width="100%" border="0" align="center" >
  <tr class="tablecontent1">
    <td width="548"align="center"  class="tableheader">Name Of Program </td>
    <td width="132" align="center"  class="tableheader">Target</td>
  </tr>
  <tr >
    <td class="tablecontent11" >ESDPs</td>
  <td  class="tablecontent1" ><input type="text" name="esdp" id="esdp"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent12">EDPs</td>
  <td  class="tablecontent2" ><input type="text" name="edp" id="edp"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent11">BSDPs</td>
    <td  class="tablecontent1" ><input type="text" name="bsdp" id="bsdp"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent12">MDPs</td>
    <td  class="tablecontent2" ><input type="text" name="mdp" id="mdp"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent11">SDPs</td>
   <td  class="tablecontent1" ><input type="text" name="sdp" id="sdp"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent12">IMCs</td>
    <td  class="tablecontent2" ><input type="text" name="imc" id="imc"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent11">Others</td>
   <td  class="tablecontent1" ><input type="text" name="other" id="other"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent12">VDPs</td>
   <td  class="tablecontent2" ><input type="text" name="vdp" id="vdp"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent11">Project Profiles (New) </td>
  <td  class="tablecontent1" ><input type="text" name="project_new" id="project_new"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent12">Project Profiles (Updated)</td>
   <td  class="tablecontent2" ><input type="text" name="project_updated" id="project_updated"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent11">State Industrial Profile </td>
   <td  class="tablecontent1" ><input type="text" name="state_industrial" id="state_industrial"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent12">Distict Indl.Potenial</td>
   <td  class="tablecontent2" ><input type="text" name="Indl_Potenial" id="Indl_Potenial"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent11">Name of unit provided Intensive Technical Consultancy</td>
   <td  class="tablecontent1" ><input type="text" name="survey" id="survey"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent12">Status Report</td>
   <td  class="tablecontent2" ><input type="text" name="status_report" id="status_report"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent11">Library </td>
    <td  class="tablecontent1" ><input type="text" name="technology_study" id="technology_study"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent12">Marketing Assistance </td>
  <td  class="tablecontent2" ><input type="text" name="trade" id="trade"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent11">senet</td>
  <td  class="tablecontent1" ><input type="text" name="Training_programmes" id="Training_programmes"size="30"/></td>
  </tr>
 
  <tr>
    <td class="tablecontent12">Detail Project Report</td>
  <td  class="tablecontent2" ><input type="text" name="detail_of_projects" id="detail_of_projects"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent11">Sensitization programme on WTO</td>
   <td  class="tablecontent2" ><input type="text" name="Sensitization_wto" id="Sensitization_wto"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent12">Awareness Programme on Bio Technology</td>
    <td  class="tablecontent2" ><input type="text" name="Awareness_bio" id="Awareness_bio"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent11">Programmes on Packaging for Exports</td>
    <td  class="tablecontent1" ><input type="text" name="Programmes_Packaging" id="Programmes_Packaging"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent12">Programmes on Bar coding </td>
    <td  class="tablecontent2" ><input type="text" name="Programmes_bar" id="Programmes_bar"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent11">Awareness Programme on Cluster</td>
    <td  class="tablecontent2" ><input type="text" name="Awareness_cluster" id="Awareness_cluster"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent12">Awareness Programme on credit Guarntee Scheme</td>
    <td  class="tablecontent2" ><input type="text" name="TEQUP" id="TEQUP"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent11">Sensitization programme on IPR</td>
   <td  class="tablecontent1" ><input type="text" name="Sensitization_ipr" id="Sensitization_ipr"size="30"/></td>
  </tr>
  <tr>
    <td class="tablecontent12">Awareness Programme on TEQUP</td>
   <td  class="tablecontent2" ><input type="text" name="Awareness_tequp" id="Awareness_tequp"size="30"/></td>
  </tr>
   <tr>
    <td class="tablecontent11">Awareness Programme on CLCSS </td>
<td  class="tablecontent1" ><input type="text" name="identification" id="identification"size="30"/></td>
  </tr>
  <TR>
   <td class="tablecontent12">Seminar on VSBK </td>
<td  class="tablecontent2" ><input type="text" name="seminar_on_vsbk" id="seminar_on_vsbk"size="30"/></td>
  </tr>
  <TR>
    <td class="tablecontent11">Workshop</td>
    <td  class="tablecontent1" ><input type="text" name="workshop" id="workshop"size="30"/></td>
  </tr>
</table>
<% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_pms_target WHERE  year='"+years+"' AND   inst_id='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>
 
 
<table width="100%" border="0" align="center" >
  <tr class="tablecontent1">
    <td width="490"align="center" class="tableheader">Name Of Program </td>
    <td width="180" align="center" class="tableheader">Target</td>
  </tr>
  <tr >
    <td class="tablecontent11" >ESDPs</td>
  <td  class="tablecontent1" ><input type="text" name="esdp" id="esdp"size="30" value='<%=rsAdminResult.getString("esdp")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent12">EDPs</td>
  <td  class="tablecontent2" ><input type="text" name="edp" id="edp"size="30"value='<%=rsAdminResult.getString("edp")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent11">BSDPs</td>
    <td  class="tablecontent1" ><input type="text" name="bsdp" id="bsdp"size="30"value='<%=rsAdminResult.getString("bsdp")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent12">MDPs</td>
    <td  class="tablecontent2" ><input type="text" name="mdp" id="mdp"size="30"value='<%=rsAdminResult.getString("mdp")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent11">SDPs</td>
   <td  class="tablecontent1" ><input type="text" name="sdp" id="sdp"size="30"value='<%=rsAdminResult.getString("sdp")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent12">IMCs</td>
    <td  class="tablecontent2" ><input type="text" name="imc" id="imc"size="30"value='<%=rsAdminResult.getString("imc")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent11">Others</td>
   <td  class="tablecontent1" ><input type="text" name="other" id="other"size="30"value='<%=rsAdminResult.getString("other")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent12">VDPs</td>
   <td  class="tablecontent2" ><input type="text" name="vdp" id="vdp"size="30"value='<%=rsAdminResult.getString("vdp")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent11">Project Profiles (New) </td>
  <td  class="tablecontent1" ><input type="text" name="project_new" id="project_new"size="30"value='<%=rsAdminResult.getString("project_new")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent11">Project Profiles (Updated)</td>
   <td  class="tablecontent1" ><input type="text" name="project_updated" id="project_updated"size="30"value='<%=rsAdminResult.getString("project_updated")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent12">State Industrial Profile</td>
   <td  class="tablecontent2" ><input type="text" name="state_industrial" id="state_industrial"size="30"value='<%=rsAdminResult.getString("state_industrial")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent11">Distict Indl.Potenial</td>
   <td  class="tablecontent1" ><input type="text" name="Indl_Potenial" id="Indl_Potenial"size="30" value='<%=rsAdminResult.getString("Indl_Potenial")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent12">Name of unit provided Intensive Technical Consultancy</td>
   <td  class="tablecontent12" ><input type="text" name="survey" id="survey"size="30"value='<%=rsAdminResult.getString("survey")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent11">Status Report</td>
   <td  class="tablecontent1" ><input type="text" name="status_report" id="status_report"size="30"value='<%=rsAdminResult.getString("status_report")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent12">Library </td>
    <td  class="tablecontent2" ><input type="text" name="technology_study" id="technology_study"size="30"value='<%=rsAdminResult.getString("technology_study")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent11">Marketing Assistance </td>
  <td  class="tablecontent1" ><input type="text" name="trade" id="trade"size="30"value='<%=rsAdminResult.getString("trade")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent12">SENET</td>
  <td  class="tablecontent2" ><input type="text" name="Training_programmes" id="Training_programmes"size="30"value='<%=rsAdminResult.getString("Training_programmes")%>'/></td>
  </tr>
 
  <tr>
    <td class="tablecontent11">Detail Project Report</td>
  <td  class="tablecontent1" ><input type="text" name="detail_of_projects" id="detail_of_projects"size="30"value='<%=rsAdminResult.getString("detail_of_projects")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent12">Sensitization programme on WTO</td>
   <td  class="tablecontent2" ><input type="text" name="Sensitization_wto" id="Sensitization_wto"size="30" value='<%=rsAdminResult.getString("Sensitization_wto")%>' /> </td>
  </tr>
  <tr>
    <td class="tablecontent11">Awareness Programme on Bio Technology</td>
    <td  class="tablecontent1" ><input type="text" name="Awareness_bio" id="Awareness_bio"size="30"value='<%=rsAdminResult.getString("Awareness_bio")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent12">Programmes on Packaging for Exports</td>
    <td  class="tablecontent2" ><input type="text" name="Programmes_Packaging" id="Programmes_Packaging"size="30"value='<%=rsAdminResult.getString("Programmes_Packaging")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent11">Programmes on Bar coding </td>
    <td  class="tablecontent" ><input type="text" name="Programmes_bar" id="Programmes_bar"size="30"value='<%=rsAdminResult.getString("Programmes_bar")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent12">Awareness Programme on Cluster</td>
    <td  class="tablecontent2" ><input type="text" name="Awareness_cluster" id="Awareness_cluster"size="30"value='<%=rsAdminResult.getString("Awareness_cluster")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent11">Awareness Programme on credit Guarntee Scheme</td>
    <td  class="tablecontent1" ><input type="text" name="TEQUP" id="TEQUP"size="30"value='<%=rsAdminResult.getString("TEQUP")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent12">Sensitization programme on IPR</td>
   <td  class="tablecontent2" ><input type="text" name="Sensitization_ipr" id="Sensitization_ipr"size="30"value='<%=rsAdminResult.getString("Sensitization_ipr")%>'/></td>
  </tr>
  <tr>
    <td class="tablecontent11">Awareness Programme on TEQUP</td>
   <td  class="tablecontent1" ><input type="text" name="Awareness_tequp" id="Awareness_tequp"size="30"value='<%=rsAdminResult.getString("Awareness_tequp")%>'/></td>
  </tr>
   <tr>
    <td class="tablecontent12">Awareness Programme on CLCSS</td>
<td  class="tablecontent2" ><input type="text" name="identification" id="identification"size="30"value='<%=rsAdminResult.getString("identification")%>'/></td>
  </tr>
   <TR>
   <td class="tablecontent11">Seminar on VSBK </td>
<td  class="tablecontent1" ><input type="text" name="seminar_on_vsbk" id="seminar_on_vsbk"size="30" value='<%=rsAdminResult.getString("seminar_on_vsbk")%>'/></td>
  </tr>
   <TR>
    <td class="tablecontent12">Workshop</td>
    <td  class="tablecontent2" ><input type="text" name="workshop" id="workshop"size="30" value='<%=rsAdminResult.getString("workshop")%>'/></td>
  </tr>
</table>
 
 
 <% }%>
 <div align="center">


<%
if( buttonFlag==0){%>
<input class="butt" type="submit" name="submit" value="Edit" tabindex="16"onclick="show_confirm()"/>&nbsp;
<%}else{%>
<input class="butt" type="submit" name="submit" value="Add" tabindex="16" onclick="show_confirm()"/>&nbsp;
<%}%>
<input class="butt" type="button" name="reset" value="Reset" tabindex="18" onclick="pageReload()"/>&nbsp;
<input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
</form>



</div>
</body>
</html>
