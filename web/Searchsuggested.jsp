<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta charset="utf-8">
    <meta name="generator" content="CoffeeCup HTML Editor (www.coffeecup.com)">
    <meta name="created" content="Wed, 14 Jul 2010 07:37:46 GMT">
    <meta name="description" content="">
    <meta name="keywords" content="">
	<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE"> 
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="description" content="Styling Select Elements" />
    <title>unspent balance</title>
    <link href="css/stripes.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$('tr:nth-child(2n+1)').addClass('even');
});
</script>
    <head>
	<script type="text/javascript">
<!--
function PrintDate() {
  today = new Date();
  document.write('Date: ',today.getDate(),'/', today.getMonth()+1,'/',today.getYear());
}
//-->
</script>
    <head>
	<script type="text/javascript">
<!--
function PrintDate() {
  today = new Date();
  document.write('Date: ',today.getDate(),'/', today.getMonth()+1,'/',today.getYear());
}
//-->
</script>
<style type = "text/css">
.table_border{
border:solid #A9D0F5 2px;
}


.table_border_both_center{
border:solid #A9D0F5 1px;
padding-top:3px;
padding-bottom:3px;
font-family:Arial, Helvetica, sans-serif;
font-size:12px;
text-align:center;
}

.table_border_both_left{
border:solid #A9D0F5 1px;
padding-top:3px;
padding-bottom:3px;
font-family:Arial, Helvetica, sans-serif;
font-size:12px;
text-align:left;
}

.table_border_left{
border:solid #A9D0F5 1px;
padding-top:3px;
padding-bottom:3px;
padding-left:3px;
font-family:Arial, Helvetica, sans-serif;
font-size:12px;
text-align:left;
}
 
.table_border_both{
border:solid #A9D0F5 1px;
padding-top:3px;
padding-bottom:3px;
padding-left:3px;
font-family:Arial, Helvetica, sans-serif;
font-size:12px;

}
.table_border_both1{
border:solid #A9D0F5 1px;
padding-top:3px;
padding-bottom:3px;
padding-left:3px;
font-family:Arial, Helvetica, sans-serif;
font-size:12px;
text-align:center;
}
/* Rounded Corner */
.tb5 {
	border:2px solid #456879;
	border-radius:10px;
	height: 22px;
	width: 230px;
}
</STYLE>
</head>

<body bgcolor="#DCDCDC">
	 <%

	String serach =request.getParameter("search");
	//String type_of_inst=request.getParameter("type_of_inst");

	int buttonFlag=0;
	ResultSet rsAdminResult = null;
		Connection con = null;
	    Statement stmt = null;
		// String userDate=months+"-"+years;
		
		
	     con = ConnectionManager.getConnectionDirectForMySQL();
	     stmt = (Statement)con.createStatement();
		 Statement stmt4 = (Statement)con.createStatement();

String strSql = "SELECT  * FROM tbl_search_engine where aliass like '"+serach+"%'";
System.out.println(strSql);
rsAdminResult = stmt.executeQuery(strSql);

	/*if(rsAdminResult.next()){
		System.out.println("Result Set have record");
	}
	else{
	System.out.println(" Result Set have not record");
	buttonFlag=1;
	}	
	
*/

%>

<%if (buttonFlag==1){
%>	
<h1 align="center">No Record Found</h1>

<%
}else
{
%>
<center>
  <h3><font color="#990000" size="+1" style="text-shadow:#CCCCCC">LINK SUGGESTED BY WEBSITE </font></h3>
</center>
<table width="100%" border="1" BORDERCOLOR="#ABABAB" cellspacing="0" cellpadding="0" style="border-collapse: collapse">
  <tr class="blue" >
    <th width="33" align="center">S.No</th>
	<th width="57" align="center">Subject</th>
    
  </tr>
      <% for(int icnt=1;rsAdminResult.next();icnt++)
{
%>
      <tr class="yellow">
        <td rowspan="2" class="table_border_both" ><%=icnt%></td>
        <td class="table_border_both" ><%=rsAdminResult.getString("aliass")%></td>
       
      </tr>
  <tr class="yellow">
    <td class="table_border_both" ><a href="<%=rsAdminResult.getString("linkofwebsite")%>"/><%=rsAdminResult.getString("linkofwebsite")%></a></td>
   
  </tr>
  <% }%>
</table>
  <% }%>
</body>
 <div align="center">
  <input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
  </div>
</html>
