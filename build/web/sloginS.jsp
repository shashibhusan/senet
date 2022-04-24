<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%
String sessionid = request.getSession().getId();
response.setHeader("SET-COOKIE", "JSESSIONID=" + sessionid + "; HttpOnly");
%>
<%  
           // Set to expire far in the past.  
      response.setDateHeader("Expires", 0);  
  // Set standard HTTP/1.1 no-cache headers.  
     response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");  
  // Set IE extended HTTP/1.1 no-cache headers (use addHeader).  
     response.addHeader("Cache-Control", "post-check=0, pre-check=0");  
  // Set standard HTTP/1.0 no-cache header.  
      response.setHeader("Pragma", "no-cache");  
          request.getSession(false);
        %> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE"> 
<META HTTP-EQUIV="Expires" CONTENT="-1
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="css/inb.css" rel="stylesheet" type="text/css">

</head>

<body>

<p align="center"><font color="#0000FF" size="+1">District Industrial Profiles of MSME-DIs </font> </p>

 <table width="640" align="center" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                        <tr>
                            <td valign="top" align="left">


        <html:form action="/FileUploadAndSave" method="post" enctype="application/x-www-form-urlencoded"><tr>
    <td width="43%" height="63"  class="tablecontent11">Name of State</td>
   <td width="57%"  class="tablecontent1">
    <html:text property="name" size="30" maxlength="30"  />
	

    </td>
  </tr>

	<tr>
    <td width="43%" height="63"  class="tablecontent12"> Name of the Institute</td>
   <td width="57%"  class="tablecontent2">
       <html:password property="password" size="30" maxlength="30"  />
	</td>
  </tr>


  <tr>

          <td align="left" colspan="2">

                        <font color="red"><html:errors/></font>

                </tr>

                <tr>



        </tr>
                <tr>

          <td align="center" colspan="2">

            <html:submit>Upload File</html:submit>

          </td>

        </tr>

  </table>

        </html:form>

                        </table>
</form>

</body>
</html>
