<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
    <meta charset="utf-8"><html lang="en">
    <meta name="generator" content="CoffeeCup HTML Editor (www.coffeecup.com)">
    <meta name="created" content="Wed, 14 Jul 2010 07:37:46 GMT">
    <meta name="description" content="">
    <meta name="keywords" content="">
	<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE"> 
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="description" content="Styling Select Elements" />
     <title>Court Cases Details..</title>
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
font-size:10px;

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

</style>
<script >
function CreateExcelSheet()
{
    var x=myTable.rows
    var xls = new ActiveXObject("Excel.Application")
    xls.visible = true
    xls.Workbooks.Add
    for (i = 0; i < x.length; i++)
    {
        var y = x[i].cells
        for (j = 0; j < y.length; j++)
        {
            xls.Cells( i+1, j+1).Value = y[j].innerText
        }
    }
}
</script>
<% String Random5=(String)session.getAttribute("Random5");
String mnm = request.getParameter("mnm");
System.out.println("prakash chandradeynccffffff ---------chanda financial page======"+Random5);
if(Random5.equals(mnm))
{


	String intid=(String)session.getAttribute("ins");
	String role=(String)session.getAttribute("rol");
	System.out.println("inst id is valid ======="+role);
	
	 if(role!=null && role!=""  ){
			
		%>
	 <%

	String years =request.getParameter("cmbYear");
	String months = request.getParameter("cmbMonth");
	if ((years.length()==9) && (years.substring(0, 1).matches("[0-9]"))) {
	System.out.println("pattern matches");
	
	int buttonFlag=0;
	ResultSet rsAdminResult = null;
		Connection con = null;
			CallableStatement stmt = null;
		try
                                {
	     con = ConnectionManager.getConnectionDirectForMySQL();

String strSql = "call msme_didi_cases (?)";
				System.out.println(strSql);
				stmt = con.prepareCall(strSql);
				
				stmt.setString(1, years);
				
				
rsAdminResult = stmt.executeQuery();
}
catch(Exception e)
        {
    System.out.println("Following Exception occurs : "+e);
    }
%>

<%if (buttonFlag==1){
%>	
<h1 align="center">No Record Found</h1>

<%
}else
{
%>
<center><h3>List of cases to be filed in the  <%=years%></h3></center>
 <table width="100%" border="o" BORDERCOLOR="#990066" cellspacing="0" cellpadding="0" style="border-collapse: collapse">
  <tr>
      <td align="center"  class="table_border_both" width="37"><strong>S.No</strong></td>
<td align="center"  class="table_border_both"  width="138"><strong>Inst. Name</strong></td>
  <td align="center"  class="table_border_both" width="138"><strong>Nature of Court</strong></td>
  <td align="center"  class="table_border_both" width="138"><strong>Detail of Case</strong></td>
<td align="center"  class="table_border_both" width="138"><strong>cases related to</strong></td>
  <td align="center"  class="table_border_both" width="138"><strong>Stakes involvedv</strong></td>
  <td align="center"  class="table_border_both" width="103"><strong>Status of Stay,if any</strong></td>
  <td align="center"  class="table_border_both" width="137"><strong>Detail of applications</strong></td>
  <td align="center"  class="table_border_both" width="138"><strong>Present Status of the case</strong></td>
  <td align="center"  class="table_border_both" width="117"><strong>Controlling Officers</strong></td>
  </tr>
      <% for(int icnt=1;rsAdminResult.next();icnt++)
{
%>
  <tr>
  <td align="center"  class="table_border_both"><%=icnt%></td>
  <td align="center"  class="table_border_both"><%=rsAdminResult.getString("INST_ID")%></td>
  <td align="center"  class="table_border_both"><%=rsAdminResult.getString("nature_of_court")%></td>
<td align="center"  class="table_border_both" ><%=rsAdminResult.getString("cases_related_to")%></td>
  <td align="center"  class="table_border_both"><%=rsAdminResult.getString("Detail_of_case")%></td>
  <td align="center"  class="table_border_both"><%=rsAdminResult.getString("stakes_involved")%></td>
  <td align="center"  class="table_border_both"><%=rsAdminResult.getString("status")%></td>
 <td align="center"  class="table_border_both"><%=rsAdminResult.getString("Detail_of_application")%></td>
  <td align="center"  class="table_border_both"><%=rsAdminResult.getString("Present_status_of_the_case")%></td>
  <td align="center"  class="table_border_both"><%=rsAdminResult.getString("Controlling_Officers")%></td>
  </tr>
  <% }%>
</table>
  <% }%>
   <% } else {%>
 <jsp:forward page="stat.jsp"></jsp:forward>
  <% }%>
  <%
  } else
			{
            response.sendRedirect("stat.jsp");
			%>
			
			<% }
			
			%>
			<% } else {
   response.sendRedirect("stat.jsp");
}

 %>
  <div align="center">
  <input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
  </div>
</body>
</html>
