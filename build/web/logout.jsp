<%  
           // Set to expire far in the past.  
      response.setDateHeader("Expires", 0);  
  // Set standard HTTP/1.1 no-cache headers.  
     response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");  
  // Set IE extended HTTP/1.1 no-cache headers (use addHeader).  
     response.addHeader("Cache-Control", "post-check=0, pre-check=0");  
  // Set standard HTTP/1.0 no-cache header.  
      response.setHeader("Pragma", "no-cache");  
          
        %> 
		<%
int timeout = session.getMaxInactiveInterval();
response.setHeader("Refresh", timeout + "; URL = slogin.jsp");
%>
<%@page import="java.util.*" %>
<html>
<head>
<script language="JavaScript">
window.history.forward(0);
</script>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE"> 
<META HTTP-EQUIV="Expires" CONTENT="-1">
<META HTTP-EQUIV="REFRESH" CONTENT="15;URL=slogin.jsp">
  <title>Example - Remove Session Attribute</title>
  <script>
function go() {
window.location.replace("slogin.jsp",'window','toolbar=1,location=1,directories=1,status=1,menubar=1,scrollbars=1,resizable=1');
self.close()
}
</script>
</head>
<body>
<pre>

  <%
  String Random5=(String)session.getAttribute("Random5");
String mnm = request.getParameter("mnm");
System.out.println("prakash chandradeynccffffff ---------chanda financial page======"+Random5);
System.out.println("prakash chandradeynccffffff ---------chanda financial page ======"+mnm);
if(mnm.equals(Random5))
{


String sessionid = request.getSession().getId();
System.out.println("prakash---------- old session  -=-- logout"+sessionid);
  session.invalidate();  
session = request.getSession();
String sessionid1 = request.getSession().getId();
System.out.println("prakash---------- new  session logout "+sessionid1);


  String str = request.getParameter("cmbIns");
session.setAttribute("cmbIns", request.getParameter("cmbIns"));%>

<% if (session.getAttribute("cmbIns")!=null){
session.invalidate();
request.getSession(false);
response.sendRedirect(request.getContextPath() + "/slogin.jsp");

%>

<%}
else{%>
<table width="200" border="1" align="center">
  <tr>
    <td align="center"><a href="javascript:go()" style="text-decoration:none"><b>click to Go Login Page</b></a></td>
  
  </tr>
  
</table>


<%}
%>
<% } else {%>
   <jsp:forward page="main.jsp" >
<jsp:param name="Random5" value=" "/>
<jsp:param name="Crosssite"  value=" "/>
</jsp:forward>
<%}

 %>
</pre>
</body>
</html>