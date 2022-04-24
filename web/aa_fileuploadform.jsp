<%-- 
    Document   : aa_fileuploadform
    Created on : Apr 14, 2018, 11:49:12 AM
    Author     : Senet
--%>

<%@ page language="java" %>
<HTML>
<FORM ENCTYPE="multipart/form-data" ACTION="aa_uploadFile.jsp" METHOD=POST>
<center>
<table border="0" bgcolor=#ccFDDEE>
<tr>
<center><td colspan="2" align="center"><B>UPLOAD THE FILE</B></td></center>
</tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td><b>Choose the file To Upload:</b></td>
<td><INPUT NAME="file" TYPE="file"></td>
</tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="Send File"> </td></tr>
</table>
</center>
</FORM>
</HTML>
