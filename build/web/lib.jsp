<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@taglib uri="/web-INF/struts-bean.tld" prefix="bean" %>
<%@taglib uri="/web-INF/struts-html.tld" prefix="html" %>
<%@ page autoFlush="true" buffer="1094kb"%>
<html>
<head>

<script type="text/javascript">
            function submitForm()
            {
                document.forms[0].action = "library.do?method=add";
                document.forms[0].submit();
            }
        </script></head>

<body bgcolor="#FBFBFB">

<html:form action="library" onsubmit="return formValidator()" method="post">

<table width="200" border="1">
 
  <tr>
    <td colspan="4" class="tablecontent1"><div align="left"><strong> Libraries  Modernization </strong></div></td>
    <td colspan="1"  class="tablecontent1" ><div align="center">
      <input type="text" name="amc_of_pc" id="amc_of_pc" size="15" readonly="2"/>
    </div></td>
    <td  class="tablecontent1" ><div align="center">
      <input type="text" name="amc_of_pc1" id="amc_of_pc1" size="15"/>
    </div></td>
    <td  class="tablecontent1" ><div align="center">
      <input type="text" name="amc_of_pc2" id="amc_of_pc2" size="15"  />
    </div></td>
  </tr>
</table>
<html:submit value="Add" onclick="submitForm()" />
<html:submit property="method" value="submit" />
</html:form>
</body></html>