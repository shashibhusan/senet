
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>EDIT ACR</title>
<style type="text/css">
<!--
.style4 {
	color: #000000;
	font-weight: bold;
}
-->
</style>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE"> 
<META HTTP-EQUIV="Expires" CONTENT="-1">

<body>

<% String Random5=(String)session.getAttribute("Random5");
String mnm = request.getParameter("mnm");
System.out.println("prakash chandradeynccffffff ---------chanda financial page======"+Random5);
System.out.println("prakash chandradeynccffffff ---------chanda financial page ======"+mnm);
if(Random5.equals(mnm))
{

  String intid=(String)session.getAttribute("ins");
  if(intid!=null && intid!=""  ){
			} else
			{response.sendRedirect("stat.jsp");
			%>
			
			<% }
			
			
			
			
		
		%>
		<% } else {
     response.sendRedirect("/toolroom1/stat.jsp");
}

 %>




	<br><br><br>	
<FORM name="frmMain"  method="post" action="acrreport.jsp"> 
<table width="365"  BORDER="1" align="center"  bordercolordark="#999999"  bgcolor="">
<tr>		
<td width="355">
<span class="style2"><br>
</span>
<table>
<tr>
<td width="118" class="style2" bgcolor="#CCCCCC" align="center" ><p class="style4"><span class="style3">ACR ID</span></td>
<td width="219" class="style2" align="right" bgcolor="#CCCCCC">
  <select name="name" id="name" >
<%

try{
  Connection conn = ConnectionManager.getConnectionDirectForMySQL();
			if(conn != null){
				Statement stmt = conn.createStatement();
				 String role=(String)session.getAttribute("rol");
				String sno=request.getParameter("sno");
				String userSql=null;
				if(role.equalsIgnoreCase("SU")){
					userSql="select name,sno from tbl_acr";
				}
				else{
				userSql="select name,sno from tbl_acr ";
				}
				
				ResultSet resultSet = stmt.executeQuery(userSql);
				
				while(resultSet.next()){
%>
<option value='<%=resultSet.getString("name")%>'><%=resultSet.getString("name")%> <%=resultSet.getString("sno")%></option>
<%}}}
catch(SQLException e){
			//e.printStackTrace();
			System.out.println(e.getErrorCode()+" = "+e.getMessage());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println(e.getMessage());
		}
		%>
  </select>  </td>
  </tr> 
  <TR>
  <td width="118"><p><strong></strong></td>
<td width="219"><BR /></td>
  </TR>
  <tr>
  <td height="25px" colspan="2" valign="bottom" class="style2" bgcolor="#CCCCCC">
      <center>
	      <p>
	         <input  type="hidden" name="mnm" value="<%=mnm%>"/>
	      </p>
	      
	      <div align="center">
<input type="submit" name="submit" value="Edit Details" tabindex= "28" size="26"/>&nbsp;
&nbsp;</div>
	<!-- <input type="submit" name="submitPDF" value="Generate To PDF" onclick="formSubmitPDF()" /> -->
</center>  </td>
</tr>
</table>
<span class="style2"><br>
</span></td>
</tr>
</table>

</form>
</body>
</html>
