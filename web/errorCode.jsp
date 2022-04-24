<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
<%@ include file="header-img.html"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Error Page</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
body {
	background: #D9E6FE;
}
-->
</style>
<body>
<form name="frmStaus">
<%
String errorCode = request.getParameter("ecode");
String errorMsg = request.getParameter("emsg");
System.out.println("ErrorCode = "+errorCode+" "+errorMsg);
int code = Integer.parseInt(errorCode);
System.out.println("ErrorCode2 = "+code+" "+errorMsg);
String stMsg = null;
switch(code){
case 1:
	stMsg = "Already entries has done. Duplicate Entry.";
	break;
case 936:
	stMsg = "Values are not feeded properly. !!!Missing Expression.";
	break;
case 17002:
	stMsg = "Problem In Network. !!! Io exception: The Network Adapter could not establish the connection.";
	break;
case 17011:
	stMsg = "!!! Exhaused Resultset.";
	System.out.println("ErrorCode3 = "+code+" "+errorMsg);
	break;	
default:
	stMsg = errorMsg;
	break;	
}
%>

<h1 align="Center"><FONT COLOR="#990066">ERROR</font></h1>
<h3 align="center"> Check, All the forms are feeded properly  or Not </h3>
<h3 align="Center"><%=stMsg%></h3>


</form>
</body>
</html>
