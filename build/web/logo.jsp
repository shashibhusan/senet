<%@ page buffer="32kb" contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" autoFlush="true" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

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
		
<%@page import="java.util.*" %>
<html>
<head>
<script language="JavaScript">
window.history.forward(0);
</script>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
  <title>Remove Session -</title>
  

<script type="text/javascript">
    function init(){
        var linkPage = document.getElementById('linkid').href;
       window.top.location.href = linkPage;
    }
    onload=init;
</script>
 <script type="text/javascript" language="javascript">
 function submitform(){
 document.getElementById('myForm').submit();
 }
 
 </script>
 </head>
<body onload="submitform()">
  <%
  try
  {
  
   
 String Random5=(String)session.getAttribute("Random5");
String mnm = request.getParameter("mnm");
System.out.println("prakash chandradeynccffffff ---------chanda financial page======"+Random5);
System.out.println("prakash chandradeynccffffff ---------chanda financial page ======"+mnm);
if(Random5.equals(mnm))
{

 String str = request.getParameter("cmbIns");
session.setAttribute("cmbIns", request.getParameter("cmbIns"));

%>



<form name="myForm" id= "myForm" action="Logout.do" method="post" enctype="application/x-www-form-urlencoded">
<input type="hidden" name="mnm" value=<%=mnm%> />
<table align="center" >
  <tr>
    <td align="center" >
	<script type="text/javascript" language="javascript">
 document.getElementById('myForm').submit();
 </script>
	
	</td>
  
  </tr>
  
</table>

</form>

<% } else {  response.sendRedirect("main.jsp");%>
   
<%}

} catch (Exception e) {
	System.out.println("Duplicate vcvcEntry");
	%>
	<a href="Session.jsp" target="_top" id="linkid"></a>
	<%
	}
	
	


 %>	


</body>
</html>