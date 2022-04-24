<%-- 
    Document   : AA_fileupload
    Created on : Apr 20, 2018, 3:39:48 PM
    Author     : Senet
--%>

   <%@ page language="java" %>
<HTML>
<FORM ENCTYPE="multipart/form-data" ACTION="action_file_upload.jsp" METHOD=POST>
<center>
<table border="0" bgcolor=#ccFDDEE>
<tr>
<center><td colspan="2" align="center"><B>UPLOAD THE FILE</B><center></td>
</tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td><b>Choose the file To Upload:</b></td>
<td><INPUT NAME="file" TYPE="file"></td>
</tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="Send File"> </td></tr>
<table>
</center>
</FORM>
</HTML>