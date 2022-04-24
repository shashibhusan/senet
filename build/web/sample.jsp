<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<title>Dropdown Sample</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords"    content="" />

<script type="text/javascript" src="dropdown.js"></script>

<style type="text/css">

body { font-size: 0.7em; }
h3   { font-size: 1.6em; margin: 0px; }

a.sample_attach, a.sample_attach:visited, div.sample_attach
{
  display: block;
  width:   200px;

  border:  1px solid black;
  padding: 2px 5px;

  background: #FFFFEE;

  text-decoration: none;
  font-family: Verdana, Sans-Sherif;
  font-weight: 900;
  font-size: 1.0em;
  color:#990000;
}

a.sample_attach, a.sample_attach:visited { border-bottom: none; }
div#sample_attach_menu_child             { border-bottom: 1px solid black; }

form.sample_attach
{
  position: absolute;
  visibility: hidden;

  border:  1px solid black;
  padding: 0px 5px 2px 5px;

  background: #FFFFEE;
}

form.sample_attach b
{
  font-family: Verdana, Sans-Sherif;
  font-weight: 900;
  font-size: 1.1em;
}

input.sample_attach { margin: 1px 0px; width: 290px; }

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
<body  bgcolor="#999999">
<%
String instId = request.getParameter("instId");
String months = request.getParameter("months");
String years = request.getParameter("years");
String mnm = request.getParameter("mnm");
String role = request.getParameter("role");
%>	
<div>




<!-- ***** Dropdown Menu *************************************************** -->

<br /><br />
<div id="sample_attach_menu_parent4" class="sample_attach">Other Link</div>
<div id="sample_attach_menu_child4">
<a class="sample_attach" href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('targetmda.jsp?mnm=<%=mnm%>&instId=<%=instId%>&months=<%=months%>&years=<%=years%>&role=<%=role%>')">One Time Registration(MDA) </a>
<a class="sample_attach" href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('targetnmcp.jsp?mnm=<%=mnm%>&instId=<%=instId%>&months=<%=months%>&years=<%=years%>&role=<%=role%>')">Annual Recurring Fees(NMCP) </a>
<a class="sample_attach" href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('targetnmcp_seminars.jsp?mnm=<%=mnm%>&instId=<%=instId%>&months=<%=months%>&years=<%=years%>&role=<%=role%>')">Seminar on Barcode(NMCP) </a></div>
<script type="text/javascript">
at_attach("sample_attach_menu_parent4", "sample_attach_menu_child4", "hover", "y", "pointer");
</script>

<br /><br /><br />
<div id="sample_attach_menu_parent" class="sample_attach">Enter Your Target</div>
<div id="sample_attach_menu_child">
<a class="sample_attach" href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('targetmda.jsp?mnm=<%=mnm%>&instId=<%=instId%>&months=<%=months%>&years=<%=years%>&role=<%=role%>')">One Time Registration(MDA) </a>
<a class="sample_attach" href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('targetnmcp.jsp?mnm=<%=mnm%>&instId=<%=instId%>&months=<%=months%>&years=<%=years%>&role=<%=role%>')">Annual Recurring Fees(NMCP) </a>
<a class="sample_attach" href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('targetnmcp_seminars.jsp?mnm=<%=mnm%>&instId=<%=instId%>&months=<%=months%>&years=<%=years%>&role=<%=role%>')">Seminar on Barcode(NMCP) </a></div>
<script type="text/javascript">
at_attach("sample_attach_menu_parent", "sample_attach_menu_child", "hover", "y", "pointer");
</script>

<br /><br /><br />
<div id="sample_attach_menu_parent1" class="sample_attach">Entry Forms</div>
<div id="sample_attach_menu_child1">
<a class="sample_attach" href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('SSI-MDA.jsp?mnm=<%=mnm%>&instId=<%=instId%>&months=<%=months%>&years=<%=years%>&role=<%=role%>')">One Time Registration(MDA) </a>
<a class="sample_attach" href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('NMCPScheme.jsp?mnm=<%=mnm%>&instId=<%=instId%>&months=<%=months%>&years=<%=years%>&role=<%=role%>')">Annual Recurring Fees(NMCP) </a>
<a class="sample_attach" href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('NMCPScheme_seminar.jsp?mnm=<%=mnm%>&instId=<%=instId%>&months=<%=months%>&years=<%=years%>&role=<%=role%>')">Seminar on Barcode(NMCP) </a></div>
<script type="text/javascript">
at_attach("sample_attach_menu_parent1", "sample_attach_menu_child1", "hover", "y", "pointer");
</script>

<br /><br /><br />
<div id="sample_attach_menu_parent2" class="sample_attach"> Reports </div>
<div id="sample_attach_menu_child2">
<a class="sample_attach" href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('ReportMain2.jsp?mnm=<%=mnm%>&instId=<%=instId%>&months=<%=months%>&years=<%=years%>&role=<%=role%>')">One Time Registration(MDA) </a>
<a class="sample_attach" href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('ReportMain3.jsp?mnm=<%=mnm%>&instId=<%=instId%>&months=<%=months%>&years=<%=years%>&role=<%=role%>')">Annual Recurring Fees(NMCP) </a>
<a class="sample_attach" href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('ReportMain4.jsp?mnm=<%=mnm%>&instId=<%=instId%>&months=<%=months%>&years=<%=years%>&role=<%=role%>')">Seminar on Barcode(NMCP) </a></div>
<script type="text/javascript">
at_attach("sample_attach_menu_parent2", "sample_attach_menu_child2", "hover", "y", "pointer");
</script>
<br /><br /><br />
<div id="sample_attach_menu_parent3" class="sample_attach"> Consolidated Reports </div>
<div id="sample_attach_menu_child3">
<a class="sample_attach" href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('ReportMain5.jsp?mnm=<%=mnm%>&instId=<%=instId%>&months=<%=months%>&years=<%=years%>&role=<%=role%>')">One Time Registration(MDA) </a>

<script type="text/javascript">
at_attach("sample_attach_menu_parent3", "sample_attach_menu_child3", "hover", "y", "pointer");
</script>

<!-- ***** Search Form ***************************************************** -->

<br /><br /><br />



</div>
</body>
</html>
