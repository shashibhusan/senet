<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cabinet Summary</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
body {
	background: #D9E6FE;
}
-->
</style>	
<script type="text/javascript">
<!--
function formSubmit()
{
//alert('call');
	var today=new Date();
	var dd,mm,yyyy,curdate;
	dd=today.getDate();
	mm=today.getMonth()+1;
	yyyy=today.getFullYear();
	var curr_hour = today.getHours();
	var curr_min = today.getMinutes();
	curdate = dd+"-"+mm+"-"+yyyy;
	//alert("Today's date is " + curdate);
	document.getElementById('currdate').value=curdate;
	//document.frmCabinet.action="../../CabinetSubmit.jsp";
	//return true;
}
function fnSetDate()
{
	var today=new Date();
	var dd,mm,yyyy,curdate;
	dd=today.getDate();
	mm=today.getMonth()+1;
	yyyy=today.getFullYear();
	var curr_hour = today.getHours();
	var curr_min = today.getMinutes();
	curdate = dd+"-"+mm+"-"+yyyy;
	//alert("Today's date is " + curdate);
	document.getElementById('currdate').value=curdate;
	//document.frmCabinet.action="../../CabinetSubmit.jsp";
	//return true;
}

-->
</script>
</head>
	<body onload="fnSetDate()">
<form method="post" action="../../CabinetSubmit.jsp" > 
<!-- <form name="frmCabinet" method="post" onSubmit="return formSubmit()"> -->
<!-- Include the Free Rich Text Editor Runtime -->
<script src="../js/richtext.js" type="text/javascript" language="javascript"></script>
<!-- Include the Free Rich Text Editor Variables Page -->
<script src="../js/config.js" type="text/javascript" language="javascript"></script>
<!-- Initialise the editor -->
<script>
initRTE('', 'rte.css');
formSubmit();
</script>
<%
String instId = request.getParameter("instId");
	String years =request.getParameter("years");
	String months = request.getParameter("months");
	String mnm = request.getParameter("mnm");
	String role = request.getParameter("role");
%>
<input type="hidden" name="instId" value='<%=instId%>'/>
<input type="hidden" name="months" value='<%=months%>'/>
<input type="hidden" name="years" value='<%=years%>'/>
<input type="hidden" name="mnm" value='<%=mnm%>'/>
<input name="currdate" type="hidden" id="currdate"/>
<input type="submit" value="Submit"/>
</form>

</body>

</html>
