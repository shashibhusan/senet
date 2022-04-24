<%-- 
    Document   : EIS_ss_error
    Created on : May 18, 2018, 3:01:22 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<style type="text/css">
body
{
background-color:FEF5F1;
}
</style>
<link rel="shortcut icon" href="fevicon.png" type="image/x-icon">
<title>Error!</title>
</head>

<body><marquee>
<script type="text/javascript">
function startTime()
{
var today=new Date();
var h=today.getHours();
var m=today.getMinutes();
var s=today.getSeconds();
// add a zero in front of numbers<10
m=checkTime(m);
s=checkTime(s);
document.getElementById('txt').innerHTML=h+":"+m+":"+s;
t=setTimeout('startTime()',500);
}

function checkTime(i)
{
if (i<10)
  {
  i="0" + i;
  }
return i;
}
</script>
</marquee>
</head>

<body onload="startTime()">
<table width='100%' border='0' cellspacing='0' cellpadding='0'  height="85px" bgcolor="#990033">
	<tr>
				<td width='25%' align='center'><img src="india-lion-01[1].gif"/></td>
				<td width='50%' align='center'><font color="#FFFFFF" face="garamond" size="+1" style="font-weight:bold">
				Office of Development Commissioner(MSME)<br />
				Ministry of Micro, Small & Medium Enterprises
				</font></td>
				<td width='25%' align='center'><img src="msme_logo_old.jpg"/></td>
				</tr>
</table>
<table width="100%" valign="middle">
  <tr>
  <td width="100%"  bgcolor="#0000FF" align="center" height="20px"> </td>
</tr></table>

<div id="txt" ></div>

<h1><center>!SORRY!</center></h1>
<h2><center><i>you have enter either wrong password or username </center><i></h2>
		<center>
			<a href="login.jsp">click to go to the main page</a></center>
</body>
</html>


