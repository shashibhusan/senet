<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" %>

<html>
	<head>
         <title>CURRENT STATUS OF CR FOR US DATED </title>
		 <link rel="stylesheet" type="text/css" href="inb.css" />
        </head>

<body bgcolor=#D9E6FE>

	<h2><center>ACR Record of Employee</center></h2><br>
	
<%

int divFlag=0,buttonFlag=0;

 String role=(String)session.getAttribute("rol");

String user=(String)session.getAttribute("user");
String Random5=(String)session.getAttribute("Random5");
String mnm = request.getParameter("mnm");
System.out.println("prakash chandradeynccffffff ---------chanda financial page======"+Random5);
System.out.println("prakash chandradeynccffffff ---------chanda financial page ======"+mnm);
if(Random5.equals(mnm))
{
%>

	<%

	String name=request.getParameter("nam");
		if (name.substring(0, 1).matches("[a-zA-Z_0-9]+"))  {
			System.out.println("pattern matches");
			
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
	
<table width="553"  border="1" align="center" cellpadding="0" cellspacing="0" BORDERCOLOR="#91200" style="border-collapse: collapse" >
  <tr>
    <td width="60"  class="tableheader">S.NO</td>
    <td width="211"  class="tableheader">NAME</td>
    <td width="154"  class="tableheader">DESIGNATION</td>
    <td width="118"  class="tableheader">DATE OF BIRTH </td>
  </tr>
  <tr>
    <td width="60"><%=rsAdminResult.getString("sno")%></td>
    <td width="211"><%=rsAdminResult.getString("name")%></td>
    <td width="154"><%=rsAdminResult.getString("Designation")%></td>
    <td width="118"><%=rsAdminResult.getString("Date_of_Birth")%></td>
  </tr>
</table>

&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<table width="551"  border="1" align="center" cellpadding="0" cellspacing="0" BORDERCOLOR="#91200" style="border-collapse: collapse" >
  <tr>
    <td>2000-01</td>
    <td><%=rsAdminResult.getString("year2000")%></td>
    <td>STATUS</td>
    <td><%=rsAdminResult.getString("status11")%></td>
  </tr>
  <tr>
    <td>2001-02</td>
    <td><%=rsAdminResult.getString("year2001")%></td>
    <td>STATUS</td>
    <td><%=rsAdminResult.getString("status12")%></td>
  </tr>
  <tr>
    <td>2002-03</td>
    <td><%=rsAdminResult.getString("year2002")%></td>
    <td>STATUS</td>
    <td><%=rsAdminResult.getString("status13")%></td>
  </tr>
  <tr>
    <td>2003-04</td>
    <td><%=rsAdminResult.getString("year2003")%></td>
    <td>STATUS</td>
    <td><%=rsAdminResult.getString("status14")%></td>
  </tr>
  <tr>
    <td width="100">2004-05</td>
    <td width="150"><%=rsAdminResult.getString("year2004")%></td>
    <td width="111">STATUS</td>
    <td width="153"><%=rsAdminResult.getString("status")%></td>
  </tr>
  <tr>
    <td>2005-06</td>
    <td><%=rsAdminResult.getString("year2005")%></td>
    <td>STATUS</td>
    <td><%=rsAdminResult.getString("status1")%></td>
  </tr>
  <tr>
    <td>2006-07</td>
    <td><%=rsAdminResult.getString("year2006")%></td>
    <td>STATUS</td>
    <td><%=rsAdminResult.getString("status2")%></td>
  </tr>
  <tr>
    <td>2007-08</td>
    <td><%=rsAdminResult.getString("year2007")%></td>
    <td>STATUS</td>
    <td><%=rsAdminResult.getString("status3")%></td>
  </tr>
  <tr>
    <td>2008-09</td>
    <td><%=rsAdminResult.getString("year2008")%></td>
    <td>STATUS</td>
    <td><%=rsAdminResult.getString("status4")%></td>
  </tr>
  <tr>
    <td>2009-10</td>
    <td><%=rsAdminResult.getString("year2009")%></td>
    <td>STATUS</td>
    <td><%=rsAdminResult.getString("status5")%></td>
  </tr>
  <tr>
    <td>2010-11</td>
    <td><%=rsAdminResult.getString("year2010")%></td>
    <td>STATUS</td>
    <td><%=rsAdminResult.getString("status6")%></td>
  </tr>
  <tr>
    <td>2011-12</td>
    <td><%=rsAdminResult.getString("year2011")%></td>
    <td>STATUS</td>
    <td><%=rsAdminResult.getString("status7")%></td>
  </tr>
  <tr>
    <td>2012-13</td>
    <td><%=rsAdminResult.getString("year2012")%></td>
    <td>STATUS</td>
    <td><%=rsAdminResult.getString("status8")%></td>
  </tr>
  <tr>
    <td>2013-14</td>
    <td><%=rsAdminResult.getString("year2013")%></td>
    <td>STATUS</td>
    <td><%=rsAdminResult.getString("status9")%></td>
  </tr>
  <tr>
    <td>2014-15</td>
    <td><%=rsAdminResult.getString("year2014")%></td>
    <td>STATUS</td>
    <td><%=rsAdminResult.getString("status10")%></td>
  </tr>
</table>
<div align="center">
  <!-- <a href="reportMain1.jsp">
  <input name="button" type="button" value=" BACK">
  </a> -->
    <input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
</div>
<%	
} else {
    response.sendRedirect("/senet/stat.jsp");
}

 %>
 <%	
} else {
    response.sendRedirect("/senet/stat.jsp");
}

 %>
</body>

</html>
