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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%session.invalidate();%>
		<img src="images/msme_logo_old.jpg"/>
<table width="100%" valign="middle">
  <tr>
  <td width="100%"  bgcolor="#0000FF" align="center" height="20px"> </td>
</tr></table>
<br /><br /><br /><br />
<table width="100%"><tr><td align="center"></td></tr></table>	
	
		<table width="244" border="0" align="center">
  <tr>
    <td width="238" align="center">You have logged out. Please
<a href="slogin.jsp"><b>Login</b></a></td>
    </tr>
	 <tr>
    <td width="238" align="center"><img src="images/62849_40060_logout_128x128.png"/></td>
    </tr>
	
</table>


    </body>
</html>
