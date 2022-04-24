<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="a.html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Expenditure incurred</title>

<script type="text/javascript" src="jquery-1.11.3.js"></script>
<script>
	$(function() {
	var d = new Date(),

    n = d.getMonth(),

    y = d.getFullYear();
    var mm=(n-3);
	var x=y+1;
  var	z=y+("-")+x;

$('#cmbMonth option:eq('+mm+')').prop('selected', true);

$('#cmbYear option[value="'+z+'"]').prop('selected', true);
	});
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
var ss =  sessionStorage.getItem('uniqueIdSessionStorage');
if(ss==='' || ss===null)
{
window.location='slogin.jsp';
}
</script>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">

body {
	background:#FFFFFF;
}

#mainDiv
{
    width: 80%;
    margin: auto;
    font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
    background-color:  #f2eee4 ;
    text-align: center;
    padding: 20px;
    color: red;
}

</style>
<body>

<script type="text/javascript">
<!-- 
function formSubmitPDF() {
if(document.frmMain.cmbMonth.value!="" && document.frmMain.cmbYear.value!="" && document.frmMain.mnm.value!="") {
	document.frmMain.action="http://web5:81/dev60cgi/rwcgi60.exe?";
      } else {
			alert('Please selected the Criteria.......');
            document.frmMain.cmbIns.focus();
            return false;
      }

}
function formSubmitHTML()
{
if(document.frmMain.cmbMonth.value!="" && document.frmMain.cmbYear.value!="" && document.frmMain.mnm.value!="") {
	document.frmMain.action="senetAchievment.jsp";
      } else {
			alert('Please selected the Criteria.......');
            document.frmMain.cmbIns.focus();
            return false;
      }
	
}

//-->
</script>


<!-- <FORM name="frmMain"  method="post" onSubmit="#"> -->
<% /*}else { */%>
<!-- <FORM name="frmMain" action="http://164.100.44.167:81/dev60cgi/rwcgi60.exe?" method="get" onSubmit="return fnSubmit()"> -->
<FORM name="frmMain"  method="post" action="senetAchievment.jsp" > 

<% //} %>
<% String Random5=(String)session.getAttribute("Random5");
String mnm = request.getParameter("mnm");

String role=(String)session.getAttribute("rol");

if(role.endsWith("SU"))
{

if(Random5.equals(mnm))
{

  String intid=(String)session.getAttribute("ins");
  if(intid!=null && intid!=""  ){
			} else
			{response.sendRedirect("stat.jsp");
			%>
			
			<% }
			
			
			
			
		
		%>
		<% } else {
     response.sendRedirect("/toolroom1/stat.jsp");
}

 %>
<INPUT type=hidden value=server%3DRep60_WEB6+report%3DD%3A%5Cmsmeab%2ERDF+userid%3Dsenet%2Fsenet%40livedb1+destype%3Dcache+desformat%3DPDF name=hidden_run_parameters>
<br>
<h3 align="center" ><font  color="#990033">MONTHLY PROGRESS REPORT</font></h3>
<!-- <form name="frmMain" method="post" onSubmit="return fnSubmit()"> -->
	<table  BORDER="1" align="center"  bgcolor=""  bordercolordark="#FFFFCC">
<tr>		
<td>
<br>
<table>

  <tr>
  <td width="60">
       &nbsp;&nbsp;Month
&nbsp;</td>
  <td width="261">
      <select name="cmbMonth" id="cmbMonth" style="width: 220px">
    
        <option value="1">APRIL</option>
        <option value="2">MAY</option>
        <option value="3">JUNE</option>
        <option value="4">JULY</option>
        <option value="5">AUGUST</option>
        <option value="6">SEPTEMBER</option>
        <option value="7">OCTOBER</option>
        <option value="8">NOVEMBER</option>
        <option value="9">DECEMBER</option>
        <option value="10">JANUARY</option>
        <option value="11">FEBRUARY</option>
        <option value="12">MARCH</option>
      </select>
	  </td>
  </tr>
  <tr>
  <td>
      &nbsp;&nbsp;Year
      &nbsp;&nbsp;&nbsp;</td><td>
      <select name="cmbYear" id="cmbYear" style="width: 220px">
        <option value="2024-2025">2024-2025</option>
          <option value="2023-2024">2023-2024</option>
          <option value="2022-2023">2022-2023</option>
          <option value="2021-2022">2021-2022</option>
          <option value="2020-2021">2020-2021</option>
          <option value="2019-2020">2019-2020</option>
          <option value="2018-2019">2018-2019</option>
          <option value="2017-2018">2017-2018</option>
          <option value="2016-2017">2016-2017</option>
          <option value="2015-2016">2015-2016</option>
          <option value="2014-2015">2014-2015</option>
          <option value="2013-2014">2013-2014</option>
          <option value="2012-2013">2012-2013</option>
          <option value="2011-2012">2011-2012</option>
        </select>
	  </td>
	  </tr>
	 
  <tr>
  <td colspan="2" height="25px" valign="bottom">
      <center>
	     <input  type="hidden" name="mnm" value="<%=mnm%>"/>
    <input type="submit" name="submitHTML" value="Generate" onclick="formSubmitHTML()"/>
	<!-- <input type="submit" name="submitPDF" value="Generate To PDF" onclick="formSubmitPDF()" /> -->
</center>
  </td>
</tr>
</table>
<br>
</td>
</tr>
</table>
<%
}else
{
    %>
    <br/><br/><br/><br/><br/><br/><br/><br/>
    
    <div id="mainDiv">
        <div><img src="eis_image/access-denied.png" width="25px" height="25px" title="access denied" alt="access denied"/>   </div>
         <div>   &nbsp;&nbsp;You are not allowed to access this page. Please contact Administrator. </div>
    </div>
    
    
    <%
}
%>
</form>
</body>
</html>
