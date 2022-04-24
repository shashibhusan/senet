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
    <title>Trainees Details..</title>
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

		 </head>

<body>
		 <%

	String designation =request.getParameter("designation");
	//String months = request.getParameter("cmbMonth");
	//String years ="2010";
	//String months = "APRIL";
	ResultSet rsAdminResult = null;
		Connection con = null;
	     Statement stmt = null;
		// String userDate=months+"-"+years;
		
		
	     con = ConnectionManager.getConnectionDirectForMySQL();
	     stmt = (Statement)con.createStatement();

String strSql = "select sno, name, Designation, DATE_FORMAT(Date_of_Birth,'%d-%m-%Y') as Date_of_Birth , year2004, status, year2005, status1, year2006, status2, year2007, status3, year2008, status4, year2009, status5, year2010, status6, year2011, status7, year2012, status8, year2013, status9, year2014, status10,year2000, status11, year2001, status12, year2002, status13, year2003, status14 from tbl_acr where Designation='"+designation+"' order by name";
rsAdminResult = stmt.executeQuery(strSql);

	/*if(rsAdminResult.next()){
		System.out.println("Result Set have record");
	}
	else{
	System.out.println(" Result Set have not record");
	}	
	
*/

%>
 <h3><center><FONT color="#800000"> CURRENT STATUS OF ACR OF MSME EMPLOYEE </font></center></h3><br>	<script type="text/javascript">

var currentTime = new Date()
var month = currentTime.getMonth() + 1
var day = currentTime.getDate()
var year = currentTime.getFullYear()
document.write(day + "-" + month + "-" + year)

</script>
<script language="javascript">
 		function ToUpper(ctrl)

    {  

    var t = ctrl.value;

    ctrl.value = t.toUpperCase();

    }

    function ToLower(ctrl)

    {  

    var t = ctrl.value;

    ctrl.value = t.toLowerCase();

    } 

	</script>
		<table width="100%" border="0" BORDERCOLOR="#990066" cellspacing="0" cellpadding="0" style="border-collapse: collapse">
  <tr>
   <td align="center"  class="table_border_both" ><strong>S.No</strong></th>
   <td align="center"  class="table_border_both" ><b>NAME(Mr.,Mrs.,Kumari)</b></th>

    <td align="center"  class="table_border_both" ><strong>DESIGNATION(TRADE)</strong></th>
      <td align="center"  class="table_border_both" ><b>Date of Birth</b></th>
	 
	 <td align="center"  class="table_border_both" ><b>2001-2002</b>	</th>
	 <td align="center"  class="table_border_both" ><b>2002-2003</b>	</th>
	 <td align="center"  class="table_border_both" ><b>2003-2004</b>	</th>
	 <td align="center"  class="table_border_both" ><b>2004-2005</b>	</th>
	 <td align="center"  class="table_border_both" ><b>2005-2006</b>	</th>
	 <td align="center"  class="table_border_both" ><b>2006-2007</b>	</th>
	 <td align="center"  class="table_border_both" ><b>2007-2008</b>	</th>
	 <td align="center"  class="table_border_both" ><b>2008-2009</b>	</th>
	 <td align="center"  class="table_border_both" ><b>2009-2010</b>	</th>
	 <td align="center"  class="table_border_both" ><b>2010-2011</b>	</th>
	 <td align="center"  class="table_border_both" ><b>2011-2012</b>	</th>
	 <td align="center"  class="table_border_both" ><b>edit/delete</b>	</th>
  </tr>
  <tr>  </tr>
          <% for(int icnt=1;rsAdminResult.next();icnt++)
{
%>
<tr>
 <td align="center"  class="table_border_both" ><%=icnt%></td>
 <td align="center"  class="table_border_both" ><%=rsAdminResult.getString("name")%></td>
 <td align="center"  class="table_border_both"  ><%=rsAdminResult.getString("Designation")%></td>
 <td align="center"  class="table_border_both"  ><%=rsAdminResult.getString("Date_of_Birth")%></td>
 <td align="center"  class="table_border_both"  ><%=rsAdminResult.getString("year2001")%></td>
 <td align="center"  class="table_border_both"  ><%=rsAdminResult.getString("year2002")%></td>
 <td align="center"  class="table_border_both"  ><%=rsAdminResult.getString("year2003")%></td>
 <td align="center"  class="table_border_both" ><%=rsAdminResult.getString("year2004")%></td>
 <td align="center"  class="table_border_both"  ><%=rsAdminResult.getString("year2005")%></td>
 
 <td align="center"  class="table_border_both"  ><%=rsAdminResult.getString("year2006")%></td>
 <td align="center"  class="table_border_both"  ><%=rsAdminResult.getString("year2007")%></td>
 <td align="center"  class="table_border_both"  ><%=rsAdminResult.getString("year2008")%></td>
 <td align="center"  class="table_border_both" ><%=rsAdminResult.getString("year2009")%></td>
 <td align="center"  class="table_border_both"  ><%=rsAdminResult.getString("year2010")%></td>
 <td align="center"  class="table_border_both"  ><%=rsAdminResult.getString("year2011")%></td>
 <td align="center"  class="table_border_both" width="69"><a href="acredit.jsp?name=<%=rsAdminResult.getString("name")%>&Designation=<%=rsAdminResult.getString("Designation")%>" target="_self">
   edit/Delete</a></td>
 

  </tr>   <%}%>
</table>

 <p>	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A: Available &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NA: Not Aavailable &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  UpTo : from 1st April to ../../..&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   FROM ../../.. to 15th March   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C: Certificate
   </table>
 </p>
 <HR color="#990066" noshade size="0"/>
<div align="center">
  <!-- <a href="reportMain1.jsp">
  <input name="button" type="button" value=" BACK">
  </a> -->
    <input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
</div>
<HR color="#990066" noshade size="0"/>

</body>
  


</html>
