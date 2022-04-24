<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://www.owasp.org/index.php/Category:OWASP_CSRFGuard_Project/Owasp.CsrfGuard.tld" prefix="csrf" %>		
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" autoFlush="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE"> 
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="description" content="Styling Select Elements" />
<title>Untitled Document</title>
<style type="text/css">


.menu_div ul
{
    padding:0px;
    margin:0px;
    font-family:"Times New Roman", Times, serif;
    font-size:15px;
    color:#F7F7F7;
    list-style:none;
    text-indent:15px;
	width:200px;
}
.menu_div ul li
{
    background:#EFEFEF;
    line-height:28px;
    border-bottom:1px solid #333;
}
.menu_div ul li a
{
    text-decoration:none;
    color:#FFFFFF;
	size:auto;
	
	
    display:block;
}
.menu_div ul li a:hover
{
    background:#DFC4A8;
}
.menu_div ul li#active
{
    background:#073354;
	color:#333333
}
</style>
<script language="JavaScript" type="text/javascript"><!--//--><![CDATA[//><!--
function linkopen(lnm,iid,mon,yrs){
	//alert(lnm);
	top.frames['content'].location.href = lnm; 
}
function linkopen1(lnm,iid,mon,yrs){
	var links = lnm+'?instId='+iid+'&months='+mon+'&years='+yrs;
	alert(links);
	top.frames['content'].location.href = links; 
}
    //--><!]]></script>

</head>

<body>
<%
String OWASP_CSRFTOKEN=request.getParameter("CSRFTOKEN");
String OWASP_CSRFTOKENN=(String)session.getAttribute("OWASP_CSRFTOKEN");
String Random5=(String)session.getAttribute("Random5");
String Crosssite=(String)session.getAttribute("Crosssite");
System.out.println("menu page like token"+OWASP_CSRFTOKEN);
System.out.println("menu page like token through session"+OWASP_CSRFTOKENN);
if(OWASP_CSRFTOKEN.equals(OWASP_CSRFTOKENN))
{

String sessionid = request.getSession().getId();
System.out.println("prakashcga-----"+sessionid);
System.out.println("chandra role-----"+sessionid);
if(session != null ) {
   


String instId=(String)session.getAttribute("CmbIns");
 String role=(String)session.getAttribute("rol");
//String instId=(String)session.getAttribute("CmbIns");
String years=(String)session.getAttribute("CmbYear");
String months=(String)session.getAttribute("CmbMonth");
String user=(String)session.getAttribute("user");
String Section=(String)session.getAttribute("Section");

System.out.println("chandra role-------------bbbbbbbb = "+Section);
System.out.println("chandra role = "+months);
System.out.println("chandra role = "+years);
System.out.println("chandra role = "+instId);
//String mnm = request.getParameter("mnm");
if ( (instId.matches("[a-zA-Z_0-9 ]+")) && ((years.length()==9) && (years.substring(0, 1).matches("[0-9]"))) &&( months.matches("[0-9]+")))  {
	System.out.println("pattern matches");



if(instId!=null && instId!="" && years!=null && years!="" && months!=null && months!="" ){
try
{
//String[] User = {"MAHESH","admin","AMIT"};
		Connection con = null;
	     Statement stmt = null;
		Statement stmt4 =null;
		ResultSet rsAdminResult = null;
	ResultSet rsAdminResult1 = null;
	ResultSet rsAdminResult2 = null;
	ResultSet rsAdminResult3 = null;
	ResultSet rsAdminResult4 = null;
	ResultSet rsAdminResult5 = null;
	ResultSet rsAdminResult6 = null;
	ResultSet rsAdminResult7 = null;
	ResultSet rsAdminResult8 = null;
	ResultSet rsAdminResult9 = null;
	ResultSet rsAdminResult10 = null;
	ResultSet rsAdminResult11 = null;
	ResultSet rsAdminResult12 = null;
	ResultSet rsAdminResult13 = null;
	ResultSet rsAdminResult14 = null;
	ResultSet rsAdminResult15 = null;
	ResultSet rsAdminResult16 = null;
	ResultSet rsAdminResult17 = null;
	ResultSet rsAdminResult18 = null;
con = ConnectionManager.getConnectionDirectForMySQL();
	     stmt = (Statement)con.createStatement();
		 stmt4 = (Statement)con.createStatement();
		 Statement stmt1 = null;
 stmt1 = (Statement)con.createStatement();
%>	
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
<font color="#990033" size="-1"><strong>  Month - <%=rs_month.getString("mon")%> ,Years - <%=years%></strong> </font>
<%
String inst_two="abcd";
String strsql12="select * from user_di_mapping where USER_ID='"+user+"'" ;
System.out.println("record have found");
System.out.println("USER_ID" +strsql12);
ResultSet rs_role=stmt4.executeQuery(strsql12);

  while(rs_role.next())
	      {
System.out.println("USER_ID" +strsql12);
 inst_two = rs_role.getString("INST_ID");
System.out.println("USER ---prakash ---" +inst_two);
}
%>

 <% if((role.equalsIgnoreCase("SU")) && (role.equals(inst_two))&& (Section.equals("1"))   ){%>
 
<div class="menu_div" >
        <ul>
        <li id="active"><a href="main.jsp" target="_top">Home</a></li>
        
        <li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('chnagepsw.jsp?<csrf:token uri="protect.html"/>')">
		   <font  color="#27455C">Change password</font></a>
				</li>
	       <li class = "green"> <a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('targetpms.jsp?<csrf:token uri="protect.html"/>')">
	<font  color="#27455C">Set Target of MPR</font></a></li>
        
		  <li class = "green"> <a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('targetiso.jsp?<csrf:token uri="protect.html"/>')">
	<font  color="#27455C">ISO Sanctioned Amount</font></a></li>



		 <li id="active"><a href="#"><strong>Entry Forms</strong> </a></li>
		 
		    <%
// String strsql211= "selEct sum(TRING_TOTAL_NOT_CUM)AS tTRING_TOTAL_NOT_CUM ,sum(PTRAINEES_A)AS tPTRAINEES_A ,sum(PSUM_UNITSASSISTED) as tPSUM_UNITSASSISTED,sum(PSUM_PER_REC_CASH_DTM) as tPSUM_PER_REC_CASH_DTM,sum(PSUM_PER_REC_ACCRUAL_DTM) as tPSUM_PER_REC_ACCRUAL_DTM,sum(Age_Recy)as tAge_Recy,sum(TA_TARGET) as tTA_TARGET,sum(TOTAL_NO_TRANEE_CUM) as tTOTAL_NO_TRANEE_CUM,sum(NJU_TARGET) as tNJU_TARGET,sum(TOTAL_CAL_NOS_CUM) as tTOTAL_CAL_NOS_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EXP_ACC) as tREV_EXP_ACC,sum(REV_EXP_ACCRUAL_CUM) as tREV_EXP_ACCRUAL_CUM,sum(PER_REC_ACC) as tPER_REC_ACC,sum(BE_BUDGET) as tBE_BUDGET,sum(PER_REC_ACCRUAL_CUM) as tPER_REC_ACCRUAL_CUM from v_trrpt WHERE TR_CAT_ID=1 and  MONTHS="+months+" AND YEARS='"+years+"' order by INST_ID";
String strsql211 = "select * from tbl_esdp  WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
System.out.println("prakash chandrarecord have found");
System.out.println(strsql211);
 rsAdminResult2=stmt4.executeQuery(strsql211);
%>
  <% if(rsAdminResult2.next())
{
%>
		  <li > <a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('esdp.jsp?<csrf:token uri="protect.html"/>')">
		 <!-- <a href="#" target="_self" > -->
		  <font  color="#27455C">Training Programmes<img  src="images/blue-check-mark-md.png"height="8" width="12" /></font></a></li>
		 
		 
		<%  
		}
else {
%>




 <li > <a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('esdp.jsp?<csrf:token uri="protect.html"/>')">
		 <!-- <a href="#" target="_self" > -->
		  <font  color="#27455C">Training Programmes<img  src="images/ren-no-mark-hi.png"height="8" width="12" /></font></a></li>
<% }%>
  <%
// String strsql211= "selEct sum(TRING_TOTAL_NOT_CUM)AS tTRING_TOTAL_NOT_CUM ,sum(PTRAINEES_A)AS tPTRAINEES_A ,sum(PSUM_UNITSASSISTED) as tPSUM_UNITSASSISTED,sum(PSUM_PER_REC_CASH_DTM) as tPSUM_PER_REC_CASH_DTM,sum(PSUM_PER_REC_ACCRUAL_DTM) as tPSUM_PER_REC_ACCRUAL_DTM,sum(Age_Recy)as tAge_Recy,sum(TA_TARGET) as tTA_TARGET,sum(TOTAL_NO_TRANEE_CUM) as tTOTAL_NO_TRANEE_CUM,sum(NJU_TARGET) as tNJU_TARGET,sum(TOTAL_CAL_NOS_CUM) as tTOTAL_CAL_NOS_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EXP_ACC) as tREV_EXP_ACC,sum(REV_EXP_ACCRUAL_CUM) as tREV_EXP_ACCRUAL_CUM,sum(PER_REC_ACC) as tPER_REC_ACC,sum(BE_BUDGET) as tBE_BUDGET,sum(PER_REC_ACCRUAL_CUM) as tPER_REC_ACCRUAL_CUM from v_trrpt WHERE TR_CAT_ID=1 and  MONTHS="+months+" AND YEARS='"+years+"' order by INST_ID";
String strsqla = "select * from tbl_iso  WHERE months="+months+" AND year='"+years+"' AND   Inst_id='"+instId+"'";
System.out.println("prakash chandrarecord have found");
System.out.println(strsqla);
 rsAdminResult3=stmt4.executeQuery(strsqla);
%>
  <% if(rsAdminResult3.next())
{
%>
		
		
		  
		  
		  
		  
	    <li ><a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('ISO.jsp?<csrf:token uri="protect.html"/>')">
	<font  color="#27455C">Status of ISO <img  src="images/blue-check-mark-md.png"height="8" width="12" /></font>
		 </a></li>
		 
		 
		<%  
		}
else {
%> 
	 <li ><a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('ISO.jsp?<csrf:token uri="protect.html"/>')">
		 <!-- <a href="#" target="_self" > -->
	<font  color="#27455C">Status of ISO<img  src="images/ren-no-mark-hi.png"height="8" width="12" /></font>
		 </a></li>	 
		 
	<% }%>	 
		 
		   <%
// String strsql211= "selEct sum(TRING_TOTAL_NOT_CUM)AS tTRING_TOTAL_NOT_CUM ,sum(PTRAINEES_A)AS tPTRAINEES_A ,sum(PSUM_UNITSASSISTED) as tPSUM_UNITSASSISTED,sum(PSUM_PER_REC_CASH_DTM) as tPSUM_PER_REC_CASH_DTM,sum(PSUM_PER_REC_ACCRUAL_DTM) as tPSUM_PER_REC_ACCRUAL_DTM,sum(Age_Recy)as tAge_Recy,sum(TA_TARGET) as tTA_TARGET,sum(TOTAL_NO_TRANEE_CUM) as tTOTAL_NO_TRANEE_CUM,sum(NJU_TARGET) as tNJU_TARGET,sum(TOTAL_CAL_NOS_CUM) as tTOTAL_CAL_NOS_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EXP_ACC) as tREV_EXP_ACC,sum(REV_EXP_ACCRUAL_CUM) as tREV_EXP_ACCRUAL_CUM,sum(PER_REC_ACC) as tPER_REC_ACC,sum(BE_BUDGET) as tBE_BUDGET,sum(PER_REC_ACCRUAL_CUM) as tPER_REC_ACCRUAL_CUM from v_trrpt WHERE TR_CAT_ID=1 and  MONTHS="+months+" AND YEARS='"+years+"' order by INST_ID";
String strsqlb = "select * from tbl_vendor  WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
System.out.println("prakash chandrarecord have found");
System.out.println(strsqlb);
 rsAdminResult4=stmt4.executeQuery(strsqlb);
%>
  <% if(rsAdminResult4.next())
{
%>
	
		 
		 
		<li>
 		  
		  <a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('vendor.jsp?<csrf:token uri="protect.html"/>')">
		  <font  color="#27455C">VDP Entry form<img  src="images/blue-check-mark-md.png"height="8" width="12" /></font> </a> </li>
		  
			<%  
		}
else {
%> 	

	<li>
 		   <a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('vendor.jsp?<csrf:token uri="protect.html"/>')">
		 <!-- <a href="#" target="_self" > -->
		  <font  color="#27455C">VDP Entry form<img  src="images/ren-no-mark-hi.png"height="8" width="12" /></font> </a> </li>

<% }%>	

  <%
// String strsql211= "selEct sum(TRING_TOTAL_NOT_CUM)AS tTRING_TOTAL_NOT_CUM ,sum(PTRAINEES_A)AS tPTRAINEES_A ,sum(PSUM_UNITSASSISTED) as tPSUM_UNITSASSISTED,sum(PSUM_PER_REC_CASH_DTM) as tPSUM_PER_REC_CASH_DTM,sum(PSUM_PER_REC_ACCRUAL_DTM) as tPSUM_PER_REC_ACCRUAL_DTM,sum(Age_Recy)as tAge_Recy,sum(TA_TARGET) as tTA_TARGET,sum(TOTAL_NO_TRANEE_CUM) as tTOTAL_NO_TRANEE_CUM,sum(NJU_TARGET) as tNJU_TARGET,sum(TOTAL_CAL_NOS_CUM) as tTOTAL_CAL_NOS_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EXP_ACC) as tREV_EXP_ACC,sum(REV_EXP_ACCRUAL_CUM) as tREV_EXP_ACCRUAL_CUM,sum(PER_REC_ACC) as tPER_REC_ACC,sum(BE_BUDGET) as tBE_BUDGET,sum(PER_REC_ACCRUAL_CUM) as tPER_REC_ACCRUAL_CUM from v_trrpt WHERE TR_CAT_ID=1 and  MONTHS="+months+" AND YEARS='"+years+"' order by INST_ID";
String strsqlc = "select * from tbl_report  WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
System.out.println("prakash chandrarecord have found");
System.out.println(strsqlc);
 rsAdminResult5=stmt4.executeQuery(strsqlc);
%>
  <% if(rsAdminResult5.next())
{
%>

	<li>
				  <a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('vendor.jsp?<csrf:token uri="protect.html"/>')">	
				<font  color="#27455C">Report forms<img  src="images/blue-check-mark-md.png"height="8" width="12" /></font> </a>				</li>
				
				
			<%  
		}
else {
%> 				
				
		<li>
					<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('report_form.jsp?<csrf:token uri="protect.html"/>')">
				<font  color="#27455C">Report forms<img  src="images/ren-no-mark-hi.png"height="8" width="12" /></font> </a>				</li>			
				
				
	<% }%>		

  <%
// String strsql211= "selEct sum(TRING_TOTAL_NOT_CUM)AS tTRING_TOTAL_NOT_CUM ,sum(PTRAINEES_A)AS tPTRAINEES_A ,sum(PSUM_UNITSASSISTED) as tPSUM_UNITSASSISTED,sum(PSUM_PER_REC_CASH_DTM) as tPSUM_PER_REC_CASH_DTM,sum(PSUM_PER_REC_ACCRUAL_DTM) as tPSUM_PER_REC_ACCRUAL_DTM,sum(Age_Recy)as tAge_Recy,sum(TA_TARGET) as tTA_TARGET,sum(TOTAL_NO_TRANEE_CUM) as tTOTAL_NO_TRANEE_CUM,sum(NJU_TARGET) as tNJU_TARGET,sum(TOTAL_CAL_NOS_CUM) as tTOTAL_CAL_NOS_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EXP_ACC) as tREV_EXP_ACC,sum(REV_EXP_ACCRUAL_CUM) as tREV_EXP_ACCRUAL_CUM,sum(PER_REC_ACC) as tPER_REC_ACC,sum(BE_BUDGET) as tBE_BUDGET,sum(PER_REC_ACCRUAL_CUM) as tPER_REC_ACCRUAL_CUM from v_trrpt WHERE TR_CAT_ID=1 and  MONTHS="+months+" AND YEARS='"+years+"' order by INST_ID";
String strsqld = "select * from tbl_special_program  WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
System.out.println("prakash chandrarecord have found");
System.out.println(strsqld);
 rsAdminResult6=stmt4.executeQuery(strsqld);
%>
  <% if(rsAdminResult6.next())
{
%>



	<li>
					<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('specialprogrammes.jsp?<csrf:token uri="protect.html"/>')">
				<font  color="#27455C">Special Programmes<img  src="images/blue-check-mark-md.png"height="8" width="12" /></font> </a>				</li>
				<li>
				
			<%  
		}
else {
%> 				
				
	<li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('specialprogrammes.jsp?<csrf:token uri="protect.html"/>')">
				<font  color="#27455C">Special Programmes<img  src="images/ren-no-mark-hi.png"height="8" width="12" /></font> </a>				</li>
				<li>		
				
				
	<% }%>			
				
				
				
	  <%
// String strsql211= "selEct sum(TRING_TOTAL_NOT_CUM)AS tTRING_TOTAL_NOT_CUM ,sum(PTRAINEES_A)AS tPTRAINEES_A ,sum(PSUM_UNITSASSISTED) as tPSUM_UNITSASSISTED,sum(PSUM_PER_REC_CASH_DTM) as tPSUM_PER_REC_CASH_DTM,sum(PSUM_PER_REC_ACCRUAL_DTM) as tPSUM_PER_REC_ACCRUAL_DTM,sum(Age_Recy)as tAge_Recy,sum(TA_TARGET) as tTA_TARGET,sum(TOTAL_NO_TRANEE_CUM) as tTOTAL_NO_TRANEE_CUM,sum(NJU_TARGET) as tNJU_TARGET,sum(TOTAL_CAL_NOS_CUM) as tTOTAL_CAL_NOS_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EXP_ACC) as tREV_EXP_ACC,sum(REV_EXP_ACCRUAL_CUM) as tREV_EXP_ACCRUAL_CUM,sum(PER_REC_ACC) as tPER_REC_ACC,sum(BE_BUDGET) as tBE_BUDGET,sum(PER_REC_ACCRUAL_CUM) as tPER_REC_ACCRUAL_CUM from v_trrpt WHERE TR_CAT_ID=1 and  MONTHS="+months+" AND YEARS='"+years+"' order by INST_ID";
String strsqle = "select * from tbl_revenue  WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
System.out.println("prakash chandrarecord have found");
System.out.println(strsqle);
 rsAdminResult7=stmt4.executeQuery(strsqle);
%>
  <% if(rsAdminResult7.next())
{
%>



	<li>
			<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('revenue.jsp?<csrf:token uri="protect.html"/>')">
					<font  color="#27455C"> Revenue Earning <img  src="images/blue-check-mark-md.png"height="8" width="12" /></font> </a>				</li>
				
			<%  
		}
else {
%> 				
				
	
					<li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('revenue.jsp?<csrf:token uri="protect.html"/>')">
					<font color="#27455C"> Revenue Earning <img  src="images/ren-no-mark-hi.png" height="8" width="12" /></font> </a>	 			</li>	
				
	<% }%>			
					
				
	  <%
// String strsql211= "selEct sum(TRING_TOTAL_NOT_CUM)AS tTRING_TOTAL_NOT_CUM ,sum(PTRAINEES_A)AS tPTRAINEES_A ,sum(PSUM_UNITSASSISTED) as tPSUM_UNITSASSISTED,sum(PSUM_PER_REC_CASH_DTM) as tPSUM_PER_REC_CASH_DTM,sum(PSUM_PER_REC_ACCRUAL_DTM) as tPSUM_PER_REC_ACCRUAL_DTM,sum(Age_Recy)as tAge_Recy,sum(TA_TARGET) as tTA_TARGET,sum(TOTAL_NO_TRANEE_CUM) as tTOTAL_NO_TRANEE_CUM,sum(NJU_TARGET) as tNJU_TARGET,sum(TOTAL_CAL_NOS_CUM) as tTOTAL_CAL_NOS_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EXP_ACC) as tREV_EXP_ACC,sum(REV_EXP_ACCRUAL_CUM) as tREV_EXP_ACCRUAL_CUM,sum(PER_REC_ACC) as tPER_REC_ACC,sum(BE_BUDGET) as tBE_BUDGET,sum(PER_REC_ACCRUAL_CUM) as tPER_REC_ACCRUAL_CUM from v_trrpt WHERE TR_CAT_ID=1 and  MONTHS="+months+" AND YEARS='"+years+"' order by INST_ID";
String strsqlf = "select * from tbl_workshop  WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
System.out.println("prakash chandrarecord have found");
System.out.println(strsqlf);
 rsAdminResult8=stmt4.executeQuery(strsqlf);
%>
  <% if(rsAdminResult8.next())
{
%>
	<li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('workshop.jsp?<csrf:token uri="protect.html"/>')">
				<font  color="#27455C">Workshop Details<img  src="images/blue-check-mark-md.png"height="8" width="12" /></font>  </a>				</li>
				
			<%  
		}
else {
%> 				
				
	<li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('workshop.jsp?<csrf:token uri="protect.html"/>')">
				<font  color="#27455C">Workshop Details<img  src="images/ren-no-mark-hi.png"height="8" width="12" /></font>  </a>				</li>
				
	<% }%>			
		<li id="active"><a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('msmecontact.jsp')">
	   Contact Us</a></li>
		<li id="active"><A HREF="logo.jsp?<csrf:token uri="protect.html"/>" target="_top"> logout</a></li>
        </ul>
</div>
<%} else  if((role.equalsIgnoreCase("SU")) && (role.equals(inst_two))&& (Section.equals("2"))   ){%>

<div class="menu_div" >
        <ul>
        <li id="active"><a href="main.jsp" target="_top">Home</a></li>
       <li id="active">
                      <font color="white" >Report Section</font> </li>
        <li>
		<li>
					<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('pmsMain.jsp?<csrf:token uri="protect.html"/>')">
		<font  color="#27455C"> MPR Details</font>  </a>			  </li>
		<li>
					<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('pmsMain2.jsp?<csrf:token uri="protect.html"/>')">
		<font  color="#27455C"> Project Report Details</font>  </a>			  </li>
				<li>
					<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('workshopMain.jsp?<csrf:token uri="protect.html"/>')">
			<font  color="#27455C">Workshop Details</font></a>				</li>
					<li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('ReportMonpr.jsp?<csrf:token uri="protect.html"/>')">
			<font  color="#27455C">Monthly Progress Report</font> </a>				</li>
			<li>
			<li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('pmsMain1.jsp?<csrf:token uri="protect.html"/>')">
			<font  color="#27455C">ISO  Report</font> </a>				</li>
			<li>
			<li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('pmsMain11.jsp?<csrf:token uri="protect.html"/>')">
			<font  color="#27455C">ISO  Report categories wise</font> </a>				</li>
			<li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen(' revenuereport.jsp?<csrf:token uri="protect.html"/>')">
			<font  color="#27455C">Revenue Earning Statement</font> </a>				</li>
                        <li id="active"><a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('msmecontact.jsp')">
	   Contact Us</a></li>
		<li id="active"><a HREF="logo.jsp?<csrf:token uri="protect.html"/>" target="_top"> logout</a></li>
        </ul>
</div>
<%} else if(role.equalsIgnoreCase("IU") && (instId.equals(inst_two)) && (Section.equals("2")) ){%>
 
<div class="menu_div" >
        <ul>
        <li id="active"><a href="main.jsp" target="_top">Home</a></li>
			 <li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('esdp1.jsp?<csrf:token uri="protect.html"/>')">
			<font  color="#27455C">Training Report</font> </a>				</li>
			<li>
			 <li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('ISO1.jsp?<csrf:token uri="protect.html"/>')">
			<font  color="#27455C">ISO Report</font> </a>				</li>
			<li>
			 <li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('vendor1.jsp?<csrf:token uri="protect.html"/>')">
			<font  color="#27455C">VDP Report</font> </a>				</li>
			<li>
			 <li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('specialprogrammes1.jsp?<csrf:token uri="protect.html"/>')">
			<font  color="#27455C">Special Programmes Report</font> </a>				</li>
			<li>
			 <li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('workshop1.jsp?<csrf:token uri="protect.html"/>')">
			<font  color="#27455C">Workshop Detail Report</font> </a>				</li>
			<li>
			 <li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('report_form1.jsp?<csrf:token uri="protect.html"/>')">
			<font  color="#27455C">Project Report</font> </a>				</li>
			<li>
			
       <li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('ReportMonpr.jsp?<csrf:token uri="protect.html"/>')">
			<font  color="#27455C">Monthly Progress Report</font> </a>				</li>
			<li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen(' revenuereport.jsp?<csrf:token uri="protect.html"/>')">
			<font  color="#27455C">Revenue Earning Statement</font> </a>				</li>
                       <li id="active"><a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('msmecontact.jsp')">
	   Contact Us</a></li>
		<li id="active"><A HREF="logo.jsp?<csrf:token uri="protect.html"/>" target="_top"> logout</a></li>
        </ul>
</div>
<%} else if(role.equalsIgnoreCase("IU") && (instId.equals(inst_two)) && (Section.equals("1")) ){%>
 
<div class="menu_div" >
        <ul>
        <li id="active"><a href="main.jsp" target="_top">Home</a></li>
        <li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('chnagepsw.jsp?<csrf:token uri="protect.html"/>')">
		   <font  color="#27455C">Change password</font></a>
				</li>
	       <li class = "green"> <a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('targetpms.jsp?<csrf:token uri="protect.html"/>')">
	<font  color="#27455C">Set Target of MPR</font></a></li>

        <li class = "green"> <a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('mpriso.jsp?<csrf:token uri="protect.html"/>')">
	<font  color="#27455C">MPR ISO MODULE</font></a></li>

		 <li id="active"><a href="#"><strong>Entry Forms</strong> </a></li>

		     <%
// String strsql211= "selEct sum(TRING_TOTAL_NOT_CUM)AS tTRING_TOTAL_NOT_CUM ,sum(PTRAINEES_A)AS tPTRAINEES_A ,sum(PSUM_UNITSASSISTED) as tPSUM_UNITSASSISTED,sum(PSUM_PER_REC_CASH_DTM) as tPSUM_PER_REC_CASH_DTM,sum(PSUM_PER_REC_ACCRUAL_DTM) as tPSUM_PER_REC_ACCRUAL_DTM,sum(Age_Recy)as tAge_Recy,sum(TA_TARGET) as tTA_TARGET,sum(TOTAL_NO_TRANEE_CUM) as tTOTAL_NO_TRANEE_CUM,sum(NJU_TARGET) as tNJU_TARGET,sum(TOTAL_CAL_NOS_CUM) as tTOTAL_CAL_NOS_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EXP_ACC) as tREV_EXP_ACC,sum(REV_EXP_ACCRUAL_CUM) as tREV_EXP_ACCRUAL_CUM,sum(PER_REC_ACC) as tPER_REC_ACC,sum(BE_BUDGET) as tBE_BUDGET,sum(PER_REC_ACCRUAL_CUM) as tPER_REC_ACCRUAL_CUM from v_trrpt WHERE TR_CAT_ID=1 and  MONTHS="+months+" AND YEARS='"+years+"' order by INST_ID";
String strsql211 = "select * from tbl_esdp  WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
System.out.println("prakash chandrarecord have found");
System.out.println(strsql211);
 rsAdminResult2=stmt4.executeQuery(strsql211);
%>
  <% if(rsAdminResult2.next())
{
%>
		 
          <li >
		 <font  color="#27455C">Training Programmes<img  src="images/blue-check-mark-md.png"height="8" width="12" /></font></a></li>
		<%  
		}
else {
%>

 <li > <a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('esdp.jsp?<csrf:token uri="protect.html"/>')">
		 <!-- <a href="#" target="_self" > -->
		  <font  color="#27455C">Training Programmes<img  src="images/ren-no-mark-hi.png"height="8" width="12" /></font></a></li>
<% }%>
  <%
// String strsql211= "selEct sum(TRING_TOTAL_NOT_CUM)AS tTRING_TOTAL_NOT_CUM ,sum(PTRAINEES_A)AS tPTRAINEES_A ,sum(PSUM_UNITSASSISTED) as tPSUM_UNITSASSISTED,sum(PSUM_PER_REC_CASH_DTM) as tPSUM_PER_REC_CASH_DTM,sum(PSUM_PER_REC_ACCRUAL_DTM) as tPSUM_PER_REC_ACCRUAL_DTM,sum(Age_Recy)as tAge_Recy,sum(TA_TARGET) as tTA_TARGET,sum(TOTAL_NO_TRANEE_CUM) as tTOTAL_NO_TRANEE_CUM,sum(NJU_TARGET) as tNJU_TARGET,sum(TOTAL_CAL_NOS_CUM) as tTOTAL_CAL_NOS_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EXP_ACC) as tREV_EXP_ACC,sum(REV_EXP_ACCRUAL_CUM) as tREV_EXP_ACCRUAL_CUM,sum(PER_REC_ACC) as tPER_REC_ACC,sum(BE_BUDGET) as tBE_BUDGET,sum(PER_REC_ACCRUAL_CUM) as tPER_REC_ACCRUAL_CUM from v_trrpt WHERE TR_CAT_ID=1 and  MONTHS="+months+" AND YEARS='"+years+"' order by INST_ID";
String strsqla = "select * from tbl_iso  WHERE months="+months+" AND year='"+years+"' AND   Inst_id='"+instId+"'";
System.out.println("prakash chandrarecord have found");
System.out.println(strsqla);
 rsAdminResult3=stmt4.executeQuery(strsqla);
%>
  <% if(rsAdminResult3.next())
{
      System.out.println("inside the if condition.......");	  
%>
		
		
		  
		  
	
		  
	       <li >
		 <!-- <a href="#" target="_self" > -->
	<font  color="#27455C">Status of ISO <img  src="images/blue-check-mark-md.png"height="8" width="12" /></font>
		 </a></li>
		 
		 
		<%  
		}
else {
     System.out.println("inside the else condition.......");
%> 
	 <li ><a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('ISO.jsp?<csrf:token uri="protect.html"/>')">
		 <!-- <a href="#" target="_self" > -->
	<font  color="#27455C">Status of ISO<img  src="images/ren-no-mark-hi.png"height="8" width="12" /></font>
		 </a></li>	 
		 
	<% }%>	 
		 
		   <%
// String strsql211= "selEct sum(TRING_TOTAL_NOT_CUM)AS tTRING_TOTAL_NOT_CUM ,sum(PTRAINEES_A)AS tPTRAINEES_A ,sum(PSUM_UNITSASSISTED) as tPSUM_UNITSASSISTED,sum(PSUM_PER_REC_CASH_DTM) as tPSUM_PER_REC_CASH_DTM,sum(PSUM_PER_REC_ACCRUAL_DTM) as tPSUM_PER_REC_ACCRUAL_DTM,sum(Age_Recy)as tAge_Recy,sum(TA_TARGET) as tTA_TARGET,sum(TOTAL_NO_TRANEE_CUM) as tTOTAL_NO_TRANEE_CUM,sum(NJU_TARGET) as tNJU_TARGET,sum(TOTAL_CAL_NOS_CUM) as tTOTAL_CAL_NOS_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EXP_ACC) as tREV_EXP_ACC,sum(REV_EXP_ACCRUAL_CUM) as tREV_EXP_ACCRUAL_CUM,sum(PER_REC_ACC) as tPER_REC_ACC,sum(BE_BUDGET) as tBE_BUDGET,sum(PER_REC_ACCRUAL_CUM) as tPER_REC_ACCRUAL_CUM from v_trrpt WHERE TR_CAT_ID=1 and  MONTHS="+months+" AND YEARS='"+years+"' order by INST_ID";
String strsqlb = "select * from tbl_vendor  WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
System.out.println("prakash chandrarecord have found");
System.out.println(strsqlb);
 rsAdminResult4=stmt4.executeQuery(strsqlb);
%>
  <% if(rsAdminResult4.next())
{
%>
	
		 
		 
		<li>
 		  
		 <!-- <a href="#" target="_self" > -->
		  <font  color="#27455C">VDP Entry form<img  src="images/blue-check-mark-md.png"height="8" width="12" /></font> </a> </li>
		  
			<%  
		}
else {
%> 	

	<li>
 		   <a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('vendor.jsp?<csrf:token uri="protect.html"/>')">
		 <!-- <a href="#" target="_self" > -->
		  <font  color="#27455C">VDP Entry form<img  src="images/ren-no-mark-hi.png"height="8" width="12" /></font> </a> </li>

<% }%>	

  <%
// String strsql211= "selEct sum(TRING_TOTAL_NOT_CUM)AS tTRING_TOTAL_NOT_CUM ,sum(PTRAINEES_A)AS tPTRAINEES_A ,sum(PSUM_UNITSASSISTED) as tPSUM_UNITSASSISTED,sum(PSUM_PER_REC_CASH_DTM) as tPSUM_PER_REC_CASH_DTM,sum(PSUM_PER_REC_ACCRUAL_DTM) as tPSUM_PER_REC_ACCRUAL_DTM,sum(Age_Recy)as tAge_Recy,sum(TA_TARGET) as tTA_TARGET,sum(TOTAL_NO_TRANEE_CUM) as tTOTAL_NO_TRANEE_CUM,sum(NJU_TARGET) as tNJU_TARGET,sum(TOTAL_CAL_NOS_CUM) as tTOTAL_CAL_NOS_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EXP_ACC) as tREV_EXP_ACC,sum(REV_EXP_ACCRUAL_CUM) as tREV_EXP_ACCRUAL_CUM,sum(PER_REC_ACC) as tPER_REC_ACC,sum(BE_BUDGET) as tBE_BUDGET,sum(PER_REC_ACCRUAL_CUM) as tPER_REC_ACCRUAL_CUM from v_trrpt WHERE TR_CAT_ID=1 and  MONTHS="+months+" AND YEARS='"+years+"' order by INST_ID";
String strsqlc = "select * from tbl_report  WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
System.out.println("prakash chandrarecord have found");
System.out.println(strsqlc);
 rsAdminResult5=stmt4.executeQuery(strsqlc);
%>
  <% if(rsAdminResult5.next())
{
%>

	<li>
					
				<font  color="#27455C">Report forms<img  src="images/blue-check-mark-md.png"height="8" width="12" /></font> </a>				</li>
				
				
			<%  
		}
else {
%> 				
				
		<li>
					<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('report_form.jsp?<csrf:token uri="protect.html"/>')">
				<font  color="#27455C">Report forms<img  src="images/ren-no-mark-hi.png"height="8" width="12" /></font> </a>				</li>			
				
				
	<% }%>		

  <%
// String strsql211= "selEct sum(TRING_TOTAL_NOT_CUM)AS tTRING_TOTAL_NOT_CUM ,sum(PTRAINEES_A)AS tPTRAINEES_A ,sum(PSUM_UNITSASSISTED) as tPSUM_UNITSASSISTED,sum(PSUM_PER_REC_CASH_DTM) as tPSUM_PER_REC_CASH_DTM,sum(PSUM_PER_REC_ACCRUAL_DTM) as tPSUM_PER_REC_ACCRUAL_DTM,sum(Age_Recy)as tAge_Recy,sum(TA_TARGET) as tTA_TARGET,sum(TOTAL_NO_TRANEE_CUM) as tTOTAL_NO_TRANEE_CUM,sum(NJU_TARGET) as tNJU_TARGET,sum(TOTAL_CAL_NOS_CUM) as tTOTAL_CAL_NOS_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EXP_ACC) as tREV_EXP_ACC,sum(REV_EXP_ACCRUAL_CUM) as tREV_EXP_ACCRUAL_CUM,sum(PER_REC_ACC) as tPER_REC_ACC,sum(BE_BUDGET) as tBE_BUDGET,sum(PER_REC_ACCRUAL_CUM) as tPER_REC_ACCRUAL_CUM from v_trrpt WHERE TR_CAT_ID=1 and  MONTHS="+months+" AND YEARS='"+years+"' order by INST_ID";
String strsqld = "select * from tbl_special_program  WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
System.out.println("prakash chandrarecord have found");
System.out.println(strsqld);
 rsAdminResult6=stmt4.executeQuery(strsqld);
%>
  <% if(rsAdminResult6.next())
{
%>



	<li>
				
				<font  color="#27455C">Special Programmes<img  src="images/blue-check-mark-md.png"height="8" width="12" /></font> </a>				</li>
				<li>
				
			<%  
		}
else {
%> 				
				
	<li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('specialprogrammes.jsp?<csrf:token uri="protect.html"/>')">
				<font  color="#27455C">Special Programmes<img  src="images/ren-no-mark-hi.png"height="8" width="12" /></font> </a>				</li>
				<li>		
				
				
	<% }%>			
				
				
				
	  <%
// String strsql211= "selEct sum(TRING_TOTAL_NOT_CUM)AS tTRING_TOTAL_NOT_CUM ,sum(PTRAINEES_A)AS tPTRAINEES_A ,sum(PSUM_UNITSASSISTED) as tPSUM_UNITSASSISTED,sum(PSUM_PER_REC_CASH_DTM) as tPSUM_PER_REC_CASH_DTM,sum(PSUM_PER_REC_ACCRUAL_DTM) as tPSUM_PER_REC_ACCRUAL_DTM,sum(Age_Recy)as tAge_Recy,sum(TA_TARGET) as tTA_TARGET,sum(TOTAL_NO_TRANEE_CUM) as tTOTAL_NO_TRANEE_CUM,sum(NJU_TARGET) as tNJU_TARGET,sum(TOTAL_CAL_NOS_CUM) as tTOTAL_CAL_NOS_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EXP_ACC) as tREV_EXP_ACC,sum(REV_EXP_ACCRUAL_CUM) as tREV_EXP_ACCRUAL_CUM,sum(PER_REC_ACC) as tPER_REC_ACC,sum(BE_BUDGET) as tBE_BUDGET,sum(PER_REC_ACCRUAL_CUM) as tPER_REC_ACCRUAL_CUM from v_trrpt WHERE TR_CAT_ID=1 and  MONTHS="+months+" AND YEARS='"+years+"' order by INST_ID";
String strsqle = "select * from tbl_revenue  WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
System.out.println("prakash chandrarecord have found");
System.out.println(strsqle);
 rsAdminResult7=stmt4.executeQuery(strsqle);
%>
  <% if(rsAdminResult7.next())
{
%>



	<li>
			
					<font  color="#27455C"> Revenue Earning <img  src="images/blue-check-mark-md.png"height="8" width="12" /></font> </a>				</li>
				
			<%  
		}
else {
%> 				
				
	<li>
					<li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('revenue.jsp?<csrf:token uri="protect.html"/>')">
					<font color="#27455C"> Revenue Earning <img  src="images/ren-no-mark-hi.png" height="8" width="12" /></font> </a>	 			</li>	

	
				
				
	<% }%>			
					
				
				
				

			
				
				
	  <%
// String strsql211= "selEct sum(TRING_TOTAL_NOT_CUM)AS tTRING_TOTAL_NOT_CUM ,sum(PTRAINEES_A)AS tPTRAINEES_A ,sum(PSUM_UNITSASSISTED) as tPSUM_UNITSASSISTED,sum(PSUM_PER_REC_CASH_DTM) as tPSUM_PER_REC_CASH_DTM,sum(PSUM_PER_REC_ACCRUAL_DTM) as tPSUM_PER_REC_ACCRUAL_DTM,sum(Age_Recy)as tAge_Recy,sum(TA_TARGET) as tTA_TARGET,sum(TOTAL_NO_TRANEE_CUM) as tTOTAL_NO_TRANEE_CUM,sum(NJU_TARGET) as tNJU_TARGET,sum(TOTAL_CAL_NOS_CUM) as tTOTAL_CAL_NOS_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EAR_ACCRUAL_TOTAL_CUM) as tREV_EAR_ACCRUAL_TOTAL_CUM,sum(REV_EXP_ACC) as tREV_EXP_ACC,sum(REV_EXP_ACCRUAL_CUM) as tREV_EXP_ACCRUAL_CUM,sum(PER_REC_ACC) as tPER_REC_ACC,sum(BE_BUDGET) as tBE_BUDGET,sum(PER_REC_ACCRUAL_CUM) as tPER_REC_ACCRUAL_CUM from v_trrpt WHERE TR_CAT_ID=1 and  MONTHS="+months+" AND YEARS='"+years+"' order by INST_ID";
String strsqlf = "select * from tbl_workshop  WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
System.out.println("prakash chandrarecord have found");
System.out.println(strsqlf);
 rsAdminResult8=stmt4.executeQuery(strsqlf);
%>
  <% if(rsAdminResult8.next())
{
%>



	<li>
				<font  color="#27455C">Workshop Details<img  src="images/blue-check-mark-md.png"height="8" width="12" /></font>  </a>				</li>
				
			<%  
		}
else {
%> 				
				
	<li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('workshop.jsp?<csrf:token uri="protect.html"/>')">
				<font  color="#27455C">Workshop Details<img  src="images/ren-no-mark-hi.png"height="8" width="12" /></font>  </a>				</li>
				
				
	<% }%>			
				
				
		<li id="active"><a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('msmecontact.jsp')">
	   Contact Us</a></li>
		<li id="active"><A HREF="logo.jsp?<csrf:token uri="protect.html"/>" target="_top"> logout</a></li>
        </ul>
</div>
<%} else {%>

<jsp:forward page="stat.jsp"></jsp:forward>

<% }%>


  <%
}
catch(SQLException e){
			//e.printStackTrace();
			System.out.println(" SQLException = "+e.getErrorCode()+" = "+e.getMessage());
			int eCode = e.getErrorCode();
			String eMsg  =e.getMessage();
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
			}//end if
			else{
			// Session Expired.
			%>
			<jsp:forward page="stat.jsp" ></jsp:forward>
			<%			
			}
			} else {
    response.sendRedirect("stat.jsp");
}
} else {
    response.sendRedirect("stat.jsp");
}
} else {
    response.sendRedirect("stat.jsp");
}
%>
  
</body>
</html>
