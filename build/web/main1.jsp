<%  
		String sessionid = request.getSession().getId();
		// be careful overwriting: JSESSIONID may have been set with other flags
		response.setHeader("SET-COOKIE", "JSESSIONID=" + sessionid + "; HttpOnly");
           // Set to expire far in the past.  
      response.setDateHeader("Expires", 0);  
	  response.setDateHeader("Expires",-1);  
  // Set standard HTTP/1.1 no-cache headers.  
     response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");  
  // Set IE extended HTTP/1.1 no-cache headers (use addHeader).  
     response.addHeader("Cache-Control", "post-check=0, pre-check=0");  
  // Set standard HTTP/1.0 no-cache header.  
      response.setHeader("Pragma", "no-cache");  
	  
          
        %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Particulars</title>
<script language="JavaScript">
window.history.forward(0);
</script>


</head>
<%
 String role=(String)session.getAttribute("rol");
String Random5=(String)session.getAttribute("Random5");
String Crosssite=(String)session.getAttribute("Crosssite");
System.out.println("prakash chandradeynccffffff ---------chanda======"+Random5);
System.out.println("prakash chandradeynccffffff ---------chanda======"+Crosssite);
if(Random5.equals(Crosssite))
{


if(session != null && !session.isNew()) {
 System.out.println("prakash chandradeynccffffff ---------chanda======"+sessionid);
String mnm = request.getParameter("mnm");

%>

<script type="text/javascript">
<!--
function delayer(){
  //  window.location = "logout.jsp"
}
//-->
</script>

<body onLoad="setTimeout('delayer()', 1800000)">
    <table width='1250px' border='0px' cellspacing='0' cellpadding='0'  align="center" style="border: 1px #000000 solid">
	 <% 
    if(role.equalsIgnoreCase("AU")){
 
   %>
	<tr>
				<td width='18%' align='center' bgcolor="#297E43"><font color="#FFFFFF" size="+3">ACR</font><BR/><font color="#FFFFFF" size="+1">Vigilance</font></td>
				<td width='6%' valign="middle" bgcolor="#FFFFFF"><img src="images/images (1).jpg" width="53" height="63"/></td>
				<td width='57%' valign="middle" bgcolor="#FFFFFF">
<font color="#181818" face="garamond" size="+1" style="font-weight:bold">
				Office of Development Commissioner(MSME)<br />
				Ministry of Micro, Small & Medium Enterprises
			</font></td>
				<td width='19%' align='center' bgcolor="#FFFFFF"><img src="images/imagesmsme.jpg" width="179" height="73"/></td>	   					
		  </tr>
		  
		 <% } else if  (role.equalsIgnoreCase("IU")) {%> 
		  
		<tr>
				<td width='18%' align='center' bgcolor="#297E43"><font color="#FFFFFF" size="+3">MPR</font><BR/><font color="#FFFFFF" size="+1">Development Institutes</font></td>
				<td width='6%' valign="middle" bgcolor="#FFFFFF"><img src="images/images (1).jpg" width="53" height="63"/></td>
				<td width='57%' valign="middle" bgcolor="#FFFFFF">
<font color="#181818" face="garamond" size="+1" style="font-weight:bold">
				Office of Development Commissioner(MSME)<br />
				Ministry of Micro, Small & Medium Enterprises
			</font></td>
				<td width='19%' align='center' bgcolor="#FFFFFF"><img src="images/imagesmsme.jpg" width="179" height="73"/></td>	   					
		  </tr>  
		  
		  
		   <% } else if (role.equalsIgnoreCase("JU")) {%> 
		  
		<tr>
				<td width='18%' align='center' bgcolor="#297E43"><font color="#FFFFFF" size="+3">MPR</font><BR/><font color="#FFFFFF" size="+1">Development Institutes</font></td>
				<td width='6%' valign="middle" bgcolor="#FFFFFF"><img src="images/images (1).jpg" width="53" height="63"/></td>
				<td width='57%' valign="middle" bgcolor="#FFFFFF">
<font color="#181818" face="garamond" size="+1" style="font-weight:bold">
				Office of Development Commissioner(MSME)<br />
				Ministry of Micro, Small & Medium Enterprises
			</font></td>
				<td width='19%' align='center' bgcolor="#FFFFFF"><img src="images/imagesmsme.jpg" width="179" height="73"/></td>	   					
		  </tr>  
		 
		     <% } else {%> 
		  
		<tr>
				<td width='18%' align='center' bgcolor="#297E43"><font color="#FFFFFF" size="+3">MPR</font><BR/><font color="#FFFFFF" size="+1">Development Institutes</font></td>
				<td width='6%' valign="middle" bgcolor="#FFFFFF"><img src="images/images (1).jpg" width="53" height="63"/></td>
				<td width='57%' valign="middle" bgcolor="#FFFFFF">
<font color="#181818" face="garamond" size="+1" style="font-weight:bold">
				Office of Development Commissioner(MSME)<br />
				Ministry of Micro, Small & Medium Enterprises
			</font></td>
				<td width='19%' align='center' bgcolor="#FFFFFF"><img src="images/imagesmsme.jpg" width="179" height="73"/></td>	   					
		  </tr>  
		  <% }%>
		  
		  <tr>
   <td height="27" colspan="4" align="center" background="images/bg-grad-long-sml.png" ><strong><font color="#FFFFFF"> Welcome User of  Development Institutes/Vigilance Section</font></strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </td>
    </tr>
 <tr>
   <td height="27" colspan="4" align="center"  ><strong>
<div style="text-align:center; border: 1px #000000 solid">
 <% if(role.equalsIgnoreCase("AU"))
 { %>
<IFRAME NAME="menu"  width="220px" height="600px"  align="left" SRC="menu1.jsp" frameborder=0></IFRAME>
<% } else { %>
<IFRAME NAME="menu"  width="220px" height="600px"  align="left" SRC="menu.jsp" frameborder=0></IFRAME>
<% }%>
<IFRAME NAME="content"  id="content" width="1025px"  SRC="sisi.htm" height="650px"  frameborder=0></IFRAME>
</div></strong></td></tr>
<tr>
    <td colspan="4" bgcolor="#0099FF" align="center"><strong><font color="#FFFFFF" size="-1">Created & Designed by O/O DC-MSME</font></strong></td>
    </tr>

</table>
<% 
} else {
   
    response.sendRedirect("stat.jsp");
}

} else {
     System.out.println("Session Expired====================");
    response.sendRedirect("stat.jsp");
}

 %>
</body>
</html>
