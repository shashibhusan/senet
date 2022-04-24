<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="inb.css" rel="stylesheet" type="text/css">
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
	//int tYears = Integer.parseInt(years);
	//if(months=="JANUARY" || months=="FEBRUARY" || months=="MARCH"){
	if(months.equalsIgnoreCase("10") || months.equalsIgnoreCase("11") || months.equalsIgnoreCase("12")){
		//tYears = tYears-1;
		flag1=1;
	}
Connection con = ConnectionManager.getConnectionDirectForMySQL();
Statement stmt4 = (Statement)con.createStatement();
 Statement stmt = (Statement)con.createStatement();
if(role.equalsIgnoreCase("AU")){	
		 String strSql = "select * from tbl_workshop where months =" + months +" and year='"+years+"' and instid='"+instId+"'";
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
String strSql = "SELECT * FROM tbl_workshop WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
	if(rsAdminResult.next()){
		System.out.println("Result Set have record");
		divFlag=1;
	}
	else{
	System.out.println("SU Result Set have not record");
	buttonFlag=1;
	}	

}	




String strCumulative=" SELECT sum(No_Of_unit_benefitted),sum(No_jobs_underTaken),sum(No_Trainees_Trained),sum(No_jobs_Completed),sum(Capacity_Assessment),sum(No_units_Registered)  FROM tbl_workshop where months >=1 AND months <="+months+" and year='"+years+"' and instid='"+instId+"'";

	      	System.out.println("strCumulative = "+strCumulative);
		flag=0;
	      double cum_mon1=0;
	      double cum_mon2=0;
		double cum_mon3=0;
	      double cum_mon4=0;
		  double cum_mon5=0;
	      double cum_mon6=0;
		 
	
ResultSet rsCumulative=stmt.executeQuery(strCumulative);
 
	      while(rsCumulative.next())
	      {
	       cum_mon1=rsCumulative.getDouble("sum(No_Of_unit_benefitted)");
	       cum_mon2=rsCumulative.getDouble("sum(No_jobs_underTaken)");
		   
		  cum_mon3=rsCumulative.getDouble("sum(No_Trainees_Trained)");
	       cum_mon4=rsCumulative.getDouble("sum(No_jobs_Completed)");
		   
		   cum_mon5=rsCumulative.getDouble("sum(No_units_Registered)");
	       cum_mon6=rsCumulative.getDouble("sum(Capacity_Assessment)");
		          	
					flag++;
	      }
	      System.out.println("flag"+flag);









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
<tr><td align="center"><STRONG><%=rs_instName.getString("INST_NAME")%></STRONG></td></tr>
<br>


</table>



<h3 align="center" > Workshop Detaiils </h3>
<table  align="center"  border="1"class="style1" style="width: 562px; height: 145px; background-color: gainsboro;" border="0" cellpadding="0" cellspacing="0">
  <tr  >
    <td width="33" class="tableheader">S.No</td>
    <td width="296" class="tableheader">Workshop Details </td>
    <td colspan="1" class="tableheader">Monthly Achievment</td>
	 <td colspan="1" class="tableheader">Cum.Achievment</td>
  </tr>
 <%if(divFlag==0){%>
  <tr  >
  <td colspan="6" align="center"class="tablecontent12" >Record Not Found</td>
     </tr>
  
        <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_workshop WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>

<tr>
    <td class="tablecontent11" >1</td>
    <td class="tablecontent11" >No. Of unit benefitted through service of Workshop </td>
   <td width="90" class="tablecontent11"><%=rsAdminResult.getString("No_Of_unit_benefitted")%></td>
   <td width="90" class="tablecontent11"><%=cum_mon1%></td>
  </tr>
  <tr>
    <td class="tablecontent12" > 2</td>
    <td class="tablecontent12" >No. Of jobs underTaken</td>
   <td class="tablecontent12"><%=rsAdminResult.getString("No_jobs_underTaken")%></td>
   <td class="tablecontent12"><%=cum_mon2%></td>
  </tr>
  <tr>
    <td class="tablecontent11" >3</td>
    <td  class="tablecontent11">No. Of Trainees Trained in workshop programmes</td>
   <td class="tablecontent11"><%=rsAdminResult.getString("No_Trainees_Trained")%></td>
   <td class="tablecontent11"><%=cum_mon3%></td>
  </tr>
  <tr>
    <td class="tablecontent12" >4</td>
    <td class="tablecontent12" >No. Of jobs Completed</td>
   <td class="tablecontent12"><%=rsAdminResult.getString("No_jobs_Completed")%></td>
   <td class="tablecontent12"><%=cum_mon4%></td>
  </tr>
  <tr>
    <td class="tablecontent11" >5</td>
    <td class="tablecontent11" >No. Of units Registered under single point Registration </td>
   <td class="tablecontent11"><%=rsAdminResult.getString("No_units_Registered")%></td>
   <td class="tablecontent11"><%=cum_mon5%></td>
  </tr>
  <tr>
    <td class="tablecontent12" >6</td>
    <td class="tablecontent12" >Capacity Assessment</td>
   <td class="tablecontent12"><%=rsAdminResult.getString("Capacity_Assessment")%></td>
   <td class="tablecontent12"><%=cum_mon6%></td>
  </tr>

<% }%>
</table>
 <div align="center">

<input name="button2" type="button" onClick="window.print();return false;" value=" Print" /></div>
</form>
</body>
</html>
