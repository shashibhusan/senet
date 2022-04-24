<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
    <meta charset="utf-8"><html lang="en">
  

    <meta name="generator" content="CoffeeCup HTML Editor (www.coffeecup.com)">
    <meta name="created" content="Wed, 14 Jul 2010 07:37:46 GMT">
    <meta name="description" content="">
    <meta name="keywords" content="">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="description" content="Styling Select Elements" />
     <title>Court Cases Details..</title>
    </style>
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

</STYLE>
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
if(Random5.equals(mnm))
{
	String intid=(String)session.getAttribute("ins");
	String role=(String)session.getAttribute("rol");
	
	 if(role!=null && role!=""  ){
			
		%>

	 <%

	String years =request.getParameter("cmbYear");
	String type_of_inst=request.getParameter("type_of_inst");

        System.out.println("ResultPPPPPPP"+years+"   "+type_of_inst);
	if ((years.length()==9)) {
	System.out.println("pattern matches");
	
	int buttonFlag=0;
	ResultSet rsAdminResult = null;
		Connection con = null;
			CallableStatement stmt = null;
	     con = ConnectionManager.getConnectionDirectForMySQL();

String sql = "call msme_didi_cas_type (?,?)";
				System.out.println(sql);
                                try{
				stmt = con.prepareCall(sql);
				stmt.setString(1, years);
				stmt.setString(2, type_of_inst);
}
                                catch(Exception e)
                                        {
                                    System.out.println("ggggggggggggggggggg"+e);
                                    }
rsAdminResult = stmt.executeQuery();
System.out.println();

	if(rsAdminResult.next()){
		System.out.println("Result Set have record");
	}
	else{
	System.out.println(" Result Set have not record");
	buttonFlag=1;
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
  <td align="center"  class="table_border_both" width="37">S.No</td>
<td align="center"  class="table_border_both" width="51">Inst. Name</td>
  <td align="center"  class="table_border_both" width="74">Nature of Court</td>
  <td align="center"  class="table_border_both" width="82">Detail of Case</td>
<td align="center"  class="table_border_both"width="54">cases related to</td>
  <td align="center"  class="table_border_both" width="83">Stakes involved</td>
  <td align="center"  class="table_border_both" width="103">Status of Stay,if any</td>
  <td align="center"  class="table_border_both" width="137">Detail of applications</td>
  <td align="center"  class="table_border_both" width="138">Present Status of the case</td>
  <td align="center"  class="table_border_both" width="117">Controlling Officers</td>
  </tr>
      <% for(int icnt=1;rsAdminResult.next();icnt++)
{
%>
  <tr>
  <td align="center"  class="table_border_both"><%=icnt%></td>
  <td align="center"  class="table_border_both"><%=rsAdminResult.getString("INST_NAME")%></td>
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
			{response.sendRedirect("stat.jsp");
			%>
			
			<% }
			
			%>
			<% } else {
    response.sendRedirect("stat.jsp");
}

 %>
</body>
 <div align="center">
  <input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
  </div>
</html>
