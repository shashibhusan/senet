<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<style type="text/css">
body
{
background-color:#b0c4de;
}
</style>

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
<%
String instId = request.getParameter("instId");
String months = request.getParameter("months");
String years = request.getParameter("years");
String mnm = request.getParameter("mnm");
String role = request.getParameter("role");

%>
<body onload="startTime()">
<div id="txt"></div>
<p><h2><center><i>Page is already submitted for given Month & Year </center><i></h2></p>

</body>
</html>

