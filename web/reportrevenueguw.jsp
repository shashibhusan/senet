<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="inb.css" rel="stylesheet" type="text/css">
<script>


function pageReload(){
	location.reload(true);
}
</script>

</head>
<body bgcolor="#FEFDE0">
<%String instId = request.getParameter("instId");
String months = request.getParameter("months");
String years =request.getParameter("years");
String mnm = request.getParameter("mnm");
String role = request.getParameter("role");
System.out.println(months);
System.out.println(mnm);
System.out.println(role);

%>

<% 
int flag=0,status=0,flag1=0;
	ResultSet rsAdminResult = null;
		int divFlag=0,buttonFlag=0;
		String readOnlyFlag="";
		String userDate=months+"/"+years;
	int tYears = Integer.parseInt(years);
	//if(months=="JANUARY" || months=="FEBRUARY" || months=="MARCH"){
	if(months.equalsIgnoreCase("10") || months.equalsIgnoreCase("11") || months.equalsIgnoreCase("12")){
		tYears = tYears-1;
		flag1=1;
		%>
		<input type="hidden" size="5" name="user_date" value='<%=tYears%>-<%=months%>-20' />
		<%
	}
Connection con = ConnectionManager.getConnectionDirectForMySQL();
Statement stmt4 = (Statement)con.createStatement();
 Statement stmt = (Statement)con.createStatement();
if(role.equalsIgnoreCase("AU")){	
		 String strSql = "select * from tbl_revenue_branch where months ='" + months +"' and years="+years+" and instid='"+instId+"'";
		ResultSet rs=stmt.executeQuery(strSql);
	      while(rs.next())
	      {
	      	flag++;
	      }
		  rs = null;
	System.out.println("flag"+flag);
	      if(flag>0){
	      %>	     
	     <jsp:forward page="error.jsp"></jsp:forward>  
	      <%  
	      }
}
else{
String strSql = "SELECT * FROM tbl_revenue_branch WHERE months='"+months+"' AND years="+years+" AND   instid='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);


}	
%>

<%

System.out.println("instId="+instId);
String strsql1="select * from tbl_di_institute where inst_id='"+instId+"'" ;
System.out.println("record have found");
System.out.println("instId" +strsql1);
ResultSet rs_instName=stmt4.executeQuery(strsql1);
if(rs_instName.next())
{
System.out.println("instId" +strsql1);
String inst_name = rs_instName.getString("INST_NAME");
System.out.println("inst_name" +inst_name);
}
%>
<table align="center">
<tr><td align="center" class="header"><STRONG><%=rs_instName.getString("INST_NAME")%></STRONG></td></tr>
<br>
<%

String strsql2="select * from tbl_month where months='"+months+"'" ;
System.out.println("record have found");
System.out.println("months" +strsql2);
ResultSet rs_month=stmt4.executeQuery(strsql2);
if(rs_month.next())
{
System.out.println("months" +strsql2);
String mon = rs_month.getString("mon");
System.out.println("months" +mon);
}
%>
<br>

<tr><td align="center" class="header"><STRONG> Monthly Progress  Revenue Earning Statement in the Month <%=rs_month.getString("mon")%></STRONG></td></tr>

</table>
<body>
<form  name="form1" id="form1" method="post" action="revenueagr_save.jsp">
<input type="hidden" size="5" name="months" value="<%=request.getParameter("months")%>" />
<input type="hidden" size="5" name="years" value="<%=request.getParameter("years")%>" />
<input type="hidden" size="5" name="instId" value="<%=request.getParameter("instId")%>" />
<input type="hidden" size="5" name="user_date" value='<%=tYears%>-<%=months%>-20' />
<table width="66%" border="0" align="center">
  <tr>
    <td width="26" class="tableheader">S.No</td>
    <td width="163" class="tableheader">Name Of Program </td>
    <td width="55" class="tableheader">MSMEDI-Guwahati</td>
    <td width="50" class="tableheader"> Silchar </td>
    <td width="50"class="tableheader"> Shillong</td>
    <td width="50"class="tableheader"> Diphu </td>
    <td width="50"class="tableheader"> Silchar </td>
    <td width="50"class="tableheader"> Tezpur </td>
    <td width="50"class="tableheader"> Tura </td>
    <td width="142" class="tableheader">Total</td>
  </tr>
        <% for(int icnt=1;rsAdminResult.next();icnt++)
{
%>
  <tr>
    <td class="tablecontent11"><%=icnt%></td>
    <td class="tablecontent11"> <%=rsAdminResult.getString("name")%></td>
    <td class="tablecontent1"><%=rsAdminResult.getString("msmedi")%></td>
   
    <td class="tablecontent1"><%=rsAdminResult.getString("branch1")%></td>
	<td class="tablecontent1"><%=rsAdminResult.getString("branch2")%></td>
	<td class="tablecontent1"><%=rsAdminResult.getString("branch3")%></td>
	<td class="tablecontent1"><%=rsAdminResult.getString("branch4")%></td>
	<td class="tablecontent1"><%=rsAdminResult.getString("branch5")%></td>
		<td class="tablecontent1"><%=rsAdminResult.getString("branch6")%></td>
	 <td class="tablecontent1"><%=((rsAdminResult.getInt("branch6"))+(rsAdminResult.getInt("msmedi"))+(rsAdminResult.getInt("branch1"))+(rsAdminResult.getInt("branch2"))+(rsAdminResult.getInt("branch3"))+(rsAdminResult.getInt("branch4"))+(rsAdminResult.getInt("branch5")))%></td>
  </tr>
  
<% }%>
</table>
<div align="center">


<input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
</form>
</body>
</html>
