<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" %>

<html>
	<head>
         <title>CURRENT STATUS OF CR FOR US DATED </title>
		 		 <link rel="stylesheet" type="text/css" href="inb.css" />
		 
</head>

<body >
	<% String name=request.getParameter("name");%>
	<h3><center>
	  <strong><FONT color="#800000">ACR RECORD OF EMPLOYEE </FONT></strong>
	</center></h3><br>
	 <%

	//String years =request.getParameter("cmbYear");
	//String months = request.getParameter("cmbMonth");
	//String years ="2010";
	//String months = "APRIL";
	
		ResultSet rsAdminResult = null;
		Connection con = null;
	     Statement stmt = null;
		// String userDate=months+"-"+years;
		
		
	     con = ConnectionManager.getConnectionDirectForMySQL();
	     stmt = (Statement)con.createStatement();

String strSql = "select sno, name, Designation, DATE_FORMAT(Date_of_Birth,'%d-%m-%Y') as Date_of_Birth , year2004, status, year2005, status1, year2006, status2, year2007, status3, year2008, status4, year2009, status5, year2010, status6, year2011, status7, year2012, status8, year2013, status9, year2014, status10,year2000, status11, year2001, status12, year2002, status13, year2003, status14 from tbl_acr where name='"+name+"'";
rsAdminResult = stmt.executeQuery(strSql);
System.out.println(strSql);

	if(rsAdminResult.next()){
		System.out.println("Result Set have record");
	}
	else{
	System.out.println(" Result Set have not record");
	}	
	


%>
	
<table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0" BORDERCOLOR="#91200" style="border-collapse: collapse" >
  <tr>
    <th width="60" class="tableheader">S.NO</th>
    <th width="211" class="tableheader">NAME</th>
    <th width="154" class="tableheader">DESIGNATION</th>
    <th width="118" class="tableheader">DATE OF BIRTH </th>
  </tr>
  <tr>
    <td width="60" align="center" class="tableheader"><%=rsAdminResult.getString("sno")%></td>
    <td width="211" align="center" class="tableheader"><%=rsAdminResult.getString("name")%></td>
    <td width="154" align="center" class="tableheader"><%=rsAdminResult.getString("Designation")%></td>
    <td width="118" align="center" class="tableheader"><%=rsAdminResult.getString("Date_of_Birth")%></td>
  </tr>

  <tr>
    <th class="tablecontent11">2000-01</th>
    <td class="tablecontent11"><%=rsAdminResult.getString("year2000")%></td>
    <th class="tablecontent11">STATUS</th>
    <td class="tablecontent11"><%=rsAdminResult.getString("status11")%></td>
  </tr>
  <tr>
    <th class="tablecontent12">2001-02</th>
    <td class="tablecontent12"><%=rsAdminResult.getString("year2001")%></td>
    <th class="tablecontent12">STATUS</th>
    <td class="tablecontent12"><%=rsAdminResult.getString("status12")%></td>
  </tr>
  <tr>
    <th class="tablecontent11">2002-03</th>
    <td class="tablecontent11"><%=rsAdminResult.getString("year2002")%></td>
    <th class="tablecontent11">STATUS</th>
    <td class="tablecontent11"><%=rsAdminResult.getString("status13")%></td>
  </tr>
  <tr>
    <th class="tablecontent12">2003-04</th>
    <td class="tablecontent12"><%=rsAdminResult.getString("year2003")%></td>
    <th class="tablecontent12">STATUS</th>
    <td class="tablecontent12"><%=rsAdminResult.getString("status14")%></td>
  </tr>
  <tr>
    <th width="100" class="tablecontent11">2004-05</th>
    <td width="150" class="tablecontent11"><%=rsAdminResult.getString("year2004")%></td>
   <th class="tablecontent11">STATUS</th>
    <td class="tablecontent11" width="153"><%=rsAdminResult.getString("status")%></td>
  </tr>
  <tr>
    <th class="tablecontent12">2005-06</th>
    <td class="tablecontent12"><%=rsAdminResult.getString("year2005")%></td>
   <th class="tablecontent12">STATUS</th>
    <td class="tablecontent12"><%=rsAdminResult.getString("status1")%></td>
  </tr>
  <tr>
    <th class="tablecontent11">2006-07</th>
    <td class="tablecontent11"><%=rsAdminResult.getString("year2006")%></td>
    <th class="tablecontent11">STATUS</th>
    <td class="tablecontent11"><%=rsAdminResult.getString("status2")%></td>
  </tr>
  <tr>
    <th class="tablecontent12">2007-08</th>
    <td class="tablecontent12"><%=rsAdminResult.getString("year2007")%></td>
    <th class="tablecontent12">STATUS</th>
    <td class="tablecontent12"><%=rsAdminResult.getString("status3")%></td>
  </tr>
  <tr>
    <th class="tablecontent11">2008-09</th>
    <td class="tablecontent11"><%=rsAdminResult.getString("year2008")%></td>
    <th class="tablecontent11">STATUS</th>
    <td class="tablecontent11"><%=rsAdminResult.getString("status4")%></td>
  </tr>
  <tr>
    <th class="tablecontent12">2009-10</th>
    <td class="tablecontent12"><%=rsAdminResult.getString("year2009")%></td>
    <th class="tablecontent12">STATUS</th>
    <td class="tablecontent12"><%=rsAdminResult.getString("status5")%></td>
  </tr>
  <tr>
    <th class="tablecontent11">2010-11</th>
    <td class="tablecontent11"><%=rsAdminResult.getString("year2010")%></td>
    <th class="tablecontent11">STATUS</th>
    <td class="tablecontent11"><%=rsAdminResult.getString("status6")%></td>
  </tr>
  <tr>
    <th class="tablecontent12">2011-12</th>
    <td class="tablecontent12"><%=rsAdminResult.getString("year2011")%></td>
    <th class="tablecontent12">STATUS</th>
    <td class="tablecontent12"><%=rsAdminResult.getString("status7")%></td>
  </tr>
  <tr>
    <th class="tablecontent11">2012-13</th>
    <td class="tablecontent11"><%=rsAdminResult.getString("year2012")%></td>
   <th class="tablecontent11">STATUS</th>
    <td class="tablecontent11"><%=rsAdminResult.getString("status8")%></td>
  </tr>
  <tr>
    <th class="tablecontent12">2013-14</th>
    <td class="tablecontent12"><%=rsAdminResult.getString("year2013")%></td>
    <th class="tablecontent12">STATUS</th>
    <td class="tablecontent12"><%=rsAdminResult.getString("status9")%></td>
  </tr>
  <tr>
    <th class="tablecontent11">2014-15</th>
    <td class="tablecontent11"><%=rsAdminResult.getString("year2014")%></td>
    <th class="tablecontent11">STATUS</th>
    <td class="tablecontent11"><%=rsAdminResult.getString("status10")%></td>
  </tr>
</table>
<div align="center">
  <!-- <a href="reportMain1.jsp">
  <input name="button" type="button" value=" BACK">
  </a> -->
    <input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
</div>

</body>

</html>
