<%-- 
    Document   : EIS_ss_logout
    Created on : May 21, 2018, 11:32:20 AM
    Author     : Senet
--%>

<%@page import="java.util.*" %>
<html>
<head>
    <style>
        table {
    position: relative;
    -moz-box-shadow: 1px 2px 4px rgba(0, 0, 0,0.5);
    -webkit-box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

    background: white;
}
    </style>
<script language="JavaScript">
window.history.forward(0);
</script>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<META HTTP-EQUIV="REFRESH" CONTENT="15;URL=login.jsp">
  <title>EIS - Logout</title>
  <link rel="shortcut icon" href="fevicon.png" type="image/x-icon">
  <script>
function go() {
window.location.replace("login.jsp",'window','toolbar=1,location=1,directories=1,status=1,menubar=1,scrollbars=1,resizable=1');
self.close()
}
</script>
</head>
<body><br/>
    <br/>
<pre>
<%
session.invalidate();
%>

<table width="430" border="1" align="center">
  <tr>
      <td align="center" style="padding-bottom: 15px; padding-top: 15px; background-color:  #fad6d6 "><a href="javascript:go()" style="text-decoration:none;"><b>Click to Go Login Page For Secretarial Staff</b></a></td>

  </tr>

</table>



</pre>
</body>
</html>
