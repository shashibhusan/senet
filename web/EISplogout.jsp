
<%@page import="java.util.*" %>
<html>
<head>
<script language="JavaScript">
window.history.forward(0);
</script>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<META HTTP-EQUIV="REFRESH" CONTENT="15;URL=EIS_login.jsp">
  <title>EIS - Logout</title>
  <link rel="shortcut icon" href="fevicon.png" type="image/x-icon">
  <script>
function go() {
window.location.replace("EISplogin.jsp",'window','toolbar=1,location=1,directories=1,status=1,menubar=1,scrollbars=1,resizable=1');
self.close()
}
</script>
</head>
<body>
<pre>
<%
session.invalidate();
%>

<table width="200" border="1" align="center">
  <tr>
    <td align="center"><a href="javascript:go()" style="text-decoration:none"><b>click to Go Login Page</b></a></td>

  </tr>

</table>



</pre>
</body>
</html>