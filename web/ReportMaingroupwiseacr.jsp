<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="a.html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE"> 
<META HTTP-EQUIV="Expires" CONTENT="-1">
<title>Search ACR</title>
</head>


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


</script>


<FORM name="frmMain"  method="post" action="groupwise.jsp" > 




<INPUT type=hidden value=server%3DRep60_WEB6+report%3DD%3A%5Cmsmeab%2ERDF+userid%3Dsenet%2Fsenet%40livedb1+destype%3Dcache+desformat%3DPDF name=hidden_run_parameters>
<br>
<h2 align="center" ><font  color="#800000"> Acr Detail on the Basis of Designation </font></h2>
<!-- <form name="frmMain" method="post" onSubmit="return fnSubmit()"> -->
		

<table  BORDER="1" align="center"  bgcolor=""  bordercolordark="#0000FF">
<tr>		
<td>
<br>
<table>
<tr>
<td><p><strong>&nbsp;&nbsp; Designation</strong></td>
<td>
  <select name="designation" id="designation">
<%

try{
  Connection conn = ConnectionManager.getConnectionDirectForMySQL();
			if(conn != null){
				Statement stmt = conn.createStatement();
				
				String strSql = "select distinct Designation  from tbl_acr order by Designation ";
				ResultSet resultSet = stmt.executeQuery(strSql);

				
				while(resultSet.next()){
%>
<option value='<%=resultSet.getString("Designation")%>'><%=resultSet.getString("Designation")%></option>
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
  </select>
  </td>
  
 
  
 
	 <!-- <TR><td>
      <strong>&nbsp;&nbsp;Date</strong>
	  </td> 
	    <td><input type="text" size="16" name="txtDATE" /></td>
	  </TR>
  -->
  <tr>
  <td colspan="2" height="25px" valign="bottom">
      <center>
	     <input  type="hidden" name="mnm" value="<%=mnm%>"/>
    <input type="submit" name="submitHTML" value="Generate" onclick="formSubmitHTML()"/>
	<!-- <input type="submit" name="submitPDF" value="Generate To PDF" onclick="formSubmitPDF()" /> -->
</center>
  </td>
</tr>
</table>
<br>
</td>
</tr>
</table>

</form>
</body>
</html>
