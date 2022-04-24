<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="inb.css" rel="stylesheet" type="text/css"></head>

<body bgcolor="#FBFBFB">


<form  name="form1" id="form1" method="post" action="isosubmit.jsp">
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
		%>
		<input type="hidden" size="5" name="user_date" value='<%=years%>-<%=months%>-20' />
		<%
	
	}
	try{
Connection con = ConnectionManager.getConnectionDirectForMySQL();
Statement stmt4 = (Statement)con.createStatement();
 Statement stmt = (Statement)con.createStatement();
if(role.equalsIgnoreCase("AU")){	
		 String strSql = "select * from tbl_iso where months =" + months +" and year='"+years+"' and inst_id='"+instId+"'";
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
String strSql = "SELECT * FROM tbl_iso WHERE months="+months+" AND year='"+years+"' AND   inst_id='"+instId+"'"; 
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




String strCumulative=" SELECT sum(GENERALappication_received_during_month),sum(GENERALappication_disburded_during_month),sum(GENERALamount_disburded_during_month) ,sum(NERappication_received_during_month),sum(NERappication_disburded_during_month),sum(NERamount_disburded_during_month),sum(SCPappication_received_during_month),sum(SCPappication_disburded_during_month),sum(SCPamount_disburded_during_month),sum(TSPappication_received_during_month),sum(TSPappication_disburded_during_month),sum(TSPamount_disburded_during_month) FROM tbl_iso where months >=1 AND months <="+months+" and year='"+years+"' and inst_id='"+instId+"'";

	      	System.out.println("strCumulative = "+strCumulative);
		flag=0;
	      int cum_mon1=0;
	      int cum_mon2=0;
		int cum_mon3=0;
		
		 int cum_mon4=0;
	      int cum_mon5=0;
		int cum_mon6=0;
		 int cum_mon7=0;
	      int cum_mon8=0;
		int cum_mon9=0;
		 int cum_mon10=0;
	      int cum_mon12=0;
		int cum_mon11=0;
	    
ResultSet rsCumulative=stmt.executeQuery(strCumulative);

	      while(rsCumulative.next())
	      {
	       cum_mon1=rsCumulative.getInt("sum(GENERALappication_received_during_month)");
	       cum_mon2=rsCumulative.getInt("sum(GENERALappication_disburded_during_month)");
		    cum_mon3=rsCumulative.getInt("sum(GENERALamount_disburded_during_month)");
	   
	   cum_mon4=rsCumulative.getInt("sum(NERappication_received_during_month)");
	       cum_mon5=rsCumulative.getInt("sum(NERappication_disburded_during_month)");
		    cum_mon6=rsCumulative.getInt("sum(NERamount_disburded_during_month)");
	   
	   cum_mon7=rsCumulative.getInt("sum(SCPappication_received_during_month)");
	       cum_mon8=rsCumulative.getInt("sum(SCPappication_disburded_during_month)");
		    cum_mon9=rsCumulative.getInt("sum(SCPamount_disburded_during_month)");
	   
	   cum_mon10=rsCumulative.getInt("sum(TSPappication_received_during_month)");
	       cum_mon11=rsCumulative.getInt("sum(TSPappication_disburded_during_month)");
		    cum_mon12=rsCumulative.getInt("sum(TSPamount_disburded_during_month)");
	   
		   
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


</table>
<div style="font-size:large;font-family:Verdana;font-weight:bold;  " align="center" ><font color="#990000"> Monthly Progress Status of ISO Application Received in the month <%=rs_month.getString("mon")%></font></div>
<br> 
<input type="hidden" size="5" name="months" value="<%=request.getParameter("months")%>" />
<input type="hidden" size="5" name="years" value="<%=request.getParameter("years")%>" />
<input type="hidden" size="5" name="instId" value="<%=request.getParameter("instId")%>" />
<input type="hidden" size="5" name="user_date" value='<%=years%>-<%=months%>-20' />
<table border="1" align="center" class="style1" style="width: 667px; height: 145px; background-color: gainsboro;" cellpadding="0" cellspacing="0">
  <tr>
    <td width="134" rowspan="2" class="tableheader">Name Of Program </td>
    <td colspan="3"  align="center" class="tableheader">Data of The Month </td>
    <td colspan="3"  align="center" class="tableheader">Cumulative Value  </td>
  </tr>
   <tr   >
    
     <td  align="center" class="tableheader">No of Application Received </td>
    <td  align="center" class="tableheader">No of Application Disbursed </td>
	  <td align="center" class="tableheader">Amount Disbursed </td>
	    <td  align="center" class="tableheader">No of Application Received </td>
    <td  align="center" class="tableheader">No of Application Disbursed </td>
	  <td align="center" class="tableheader">Amount Disbursed </td>
  </tr>
  </tr>
     <%if(divFlag==0){%>
  <tr>
    <td colspan="7" class="tablecontent11" align="center"> Record not found      </td>
  </tr>
       <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_iso WHERE months="+months+" AND year='"+years+"' AND   inst_id='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>
 <tr>
   <td class="tablecontent11" >GENERAL</td>
 <td class="tablecontent11"><%=rsAdminResult.getString("GENERALappication_received_during_month")%></td>
   <td class="tablecontent11"> <%=rsAdminResult.getString("GENERALappication_disburded_during_month")%></td>
 <td class="tablecontent11"><%=rsAdminResult.getString("GENERALamount_disburded_during_month")%></td>
  
 <td class="tablecontent11"><%=cum_mon1%></td>
 <td class="tablecontent11"><%=cum_mon2%></td>
  <td class="tablecontent11"><%=cum_mon3%></td>
  </tr>
  <tr>
   <td class="tablecontent12" >NER</td>
   <td class="tablecontent12"><%=rsAdminResult.getString("NERappication_received_during_month")%></td>
    <td class="tablecontent12"> <%=rsAdminResult.getString("NERappication_disburded_during_month")%></td>
 <td class="tablecontent12"><%=rsAdminResult.getString("NERamount_disburded_during_month")%></td>
 <td class="tablecontent12"><%=cum_mon4%></td>
	 <td class="tablecontent12"><%=cum_mon5%></td>
 <td class="tablecontent12"><%=cum_mon6%></td>
  </tr>
  <tr>
   <td class="tablecontent11" >SCP</td>
   <td class="tablecontent11"> <%=rsAdminResult.getString("SCPappication_received_during_month")%></td>
   <td class="tablecontent11"><%=rsAdminResult.getString("SCPappication_disburded_during_month")%></td>
  <td class="tablecontent11"><%=rsAdminResult.getString("SCPamount_disburded_during_month")%></td>
  <td class="tablecontent11"> <%=cum_mon7%></td>
  <td class="tablecontent11"> <%=cum_mon8%></td>
  <td class="tablecontent11"> <%=cum_mon9%></td>
  </tr>
  <tr>
   <td class="tablecontent12" >TSP</td>
 <td class="tablecontent12"> <%=rsAdminResult.getString("TSPappication_received_during_month")%></td>
 <td class="tablecontent12"><%=rsAdminResult.getString("TSPappication_disburded_during_month")%></td>
   <td class="tablecontent12"><%=rsAdminResult.getString("TSPamount_disburded_during_month")%></td>
 <td class="tablecontent12"><%=cum_mon10%></td>
  <td class="tablecontent12"> <%=cum_mon11%></td>
  <td class="tablecontent12"><%=cum_mon12%></td>
  </tr>
<% }%>
</table>
<%
			
}// End of Try
catch(SQLException e){
			//e.printStackTrace();
			int eCode = e.getErrorCode();
			String eMsg  =e.getMessage();
			System.out.println(" SQLException = "+e.getErrorCode()+" = "+e.getMessage());
			if(e.getErrorCode()==1){
				System.out.println("Duplicate Entry");
				}
				%>
	<jsp:forward  page="errorCode.jsp">	
	<jsp:param name="ecode" value="<%=eCode%>"/>
	<jsp:param name="emsg" value='<%=eMsg%>'/>
	</jsp:forward>
				<%
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			String eMsg  =e.getMessage();
			System.out.println(" Exception = "+e.getMessage());
				%>
	<jsp:forward page="errorCode.jsp">	
	<jsp:param name="ecode" value="0"/>
	<jsp:param name="emsg" value='<%=eMsg%>'/>
	</jsp:forward>
<%
	} 
	finally{
		 
	}
	%>
</body>
 <div align="center">

<input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
</form>

</html>
