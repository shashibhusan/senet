<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="inb.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FBFBFB">
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
		 String strSql = "select * from tbl_report where months =" + months +" and year='"+years+"' and instid='"+instId+"'";
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
String strSql = "SELECT * FROM tbl_report WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
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




String strCumulative=" SELECT sum(Monthly_Achievment_new),sum(Monthly_Achievment_updated),sum(state_industrial_Achievment),sum(Survey_Report_Achievment),sum(Status_Report_Achievment),sum(Technology_Study_Achievment),sum(Trade_Directories_Achievment),sum(Training_Programme_Achievment),sum(Detail_Project_Achievment),sum(Distict_Potenial_Achievment) FROM tbl_report where months >=1 AND months <="+months+" and year='"+years+"' and instid='"+instId+"'";

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
		  int cum_mon11=0;
	      int cum_mon12=0;
		    int cum_mon13=0;
			int cum_mon14=0;
			
			String fix_val1="0";
			String fix_val2="0";
			String fix_val3="0";
			String fix_val4="0";
			String fix_val5="0";
			String fix_val6="0";
			String fix_val7="0";
			String fix_val8="0";
			String fix_val9="0";
			String fix_val10="0";
ResultSet rsCumulative=stmt.executeQuery(strCumulative);

	      while(rsCumulative.next())
	      {
	       cum_mon1=rsCumulative.getInt("sum(Monthly_Achievment_new)");
	       cum_mon2=rsCumulative.getInt("sum(Monthly_Achievment_updated)");
		   
		  cum_mon3=rsCumulative.getInt("sum(state_industrial_Achievment)");
	       cum_mon4=rsCumulative.getInt("sum(Survey_Report_Achievment)");
		   
		   cum_mon5=rsCumulative.getInt("sum(Status_Report_Achievment)");
	       cum_mon6=rsCumulative.getInt("sum(Technology_Study_Achievment)");
		   
		   cum_mon7=rsCumulative.getInt("sum(Trade_Directories_Achievment)");
	       cum_mon8=rsCumulative.getInt("sum(Training_Programme_Achievment)");
		    cum_mon9=rsCumulative.getInt("sum(Distict_Potenial_Achievment)");	   
		   
	       cum_mon10=rsCumulative.getInt("sum(Detail_Project_Achievment)");	   
         	flag++;
	      }
	      System.out.println("flag"+flag);







String strQuery = "SELECT * FROM tbl_pms_target WHERE year='"+years+"' AND   Inst_Id='"+instId+"'"; 
ResultSet rsTargetResult =stmt.executeQuery(strQuery);

if(rsTargetResult.next()){
	System.out.println("Target Result Set have record");
		   fix_val1=rsTargetResult.getString("project_new");
			 fix_val2=rsTargetResult.getString("project_updated");
			 fix_val3=rsTargetResult.getString("state_industrial");
			 fix_val4=rsTargetResult.getString("survey");
			 fix_val5=rsTargetResult.getString("status_report");
			 fix_val6=rsTargetResult.getString("technology_study");
			 fix_val7=rsTargetResult.getString("trade");
			fix_val8=rsTargetResult.getString("Training_programmes");
			 fix_val9=rsTargetResult.getString("detail_of_projects");
			
		   readOnlyFlag="readOnly";
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
<tr><td align="center"><STRONG><%=rs_instName.getString("INST_NAME")%></STRONG></td></tr>
<br>


</table>


<h3 align="center" class="green"> <span id="ctl00_ContentPlaceHolder1_lbl_topic" style="color: rgb(204, 0, 0); font-family: Microsoft Sans Serif; font-size: medium; font-weight: bold; text-decoration: underline; text-align: center;"> Monthly Progress  Reports</span></h3>
<table width="749" border="1" align="center" class="style1" style="width: 562px; height: 145px; background-color: gainsboro;"  cellpadding="0" cellspacing="0">
  <tr class="tablecontent11">
    <td width="16"  class="tableheader">1</td>
    <td width="316"  class="tableheader">Name Of Program </td>
    <td width="60"  class="tableheader">Target</td>
    <td colspan="1"  class="tableheader">Monthly Achievment </td>
    <td colspan="1"  class="tableheader">Cumlative Achievment </td>
  </tr>
    <%if(divFlag==0){%>
  <tr>
    <td class="tablecontent11" colspan="6" align="center">RECORD NOT FOUND</td>
  </tr>
       <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_report WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>

<tr>
    <td class="tablecontent11" >2</td>
    <td class="tablecontent11">Project Profiles (New) </td>
      <td class="tablecontent11"> <%=fix_val1%></td>
  <td class="tablecontent11"> <%=rsAdminResult.getString("Monthly_Achievment_new")%></td>
 <td class="tablecontent11"> <%=cum_mon1%></td>
  </tr>
  <tr>
    <td class="tablecontent12">3</td>
    <td class="tablecontent12">Project Profiles (Updated) </td>
 <td class="tablecontent12"><%=fix_val2%></td>
  <td class="tablecontent12">  <%=rsAdminResult.getString("Monthly_Achievment_updated")%></td>
 <td class="tablecontent12"><%=cum_mon2%></td>
  </tr>
  <tr>
    <td class="tablecontent11">4</td>
    <td class="tablecontent11">State Industrial Profile</td>
       <td class="tablecontent11"><%=fix_val3%></td>
    <td class="tablecontent11"><%=rsAdminResult.getString("state_industrial_Achievment")%></td>
   <td class="tablecontent11"><%=cum_mon3%></td>
  </tr>
  <tr>
    <td class="tablecontent12">5</td>
    <td class="tablecontent12"> Distict Indl.Potenial </td>
 <td class="tablecontent12"><%=fix_val3%></td>
    <td class="tablecontent12"><%=rsAdminResult.getString("Distict_Potenial_Achievment")%></td>
    <td class="tablecontent12"><%=cum_mon9%></td>
  
  </tr>
  <tr>
    <td class="tablecontent11">6</td>
    <td class="tablecontent11">Name of unit provided Intensive Technical Consultancy </td>
      <td class="tablecontent11"> <%=fix_val4%></td>
    <td class="tablecontent11"><%=rsAdminResult.getString("Survey_Report_Achievment")%></td>
    <td class="tablecontent11"><%=cum_mon4%></td>
  </tr>
  <tr>
    <td class="tablecontent12">7</td>
    <td class="tablecontent12">Status Report </td>
 <td class="tablecontent12"><%=fix_val5%></td>
  <td class="tablecontent12"> <%=rsAdminResult.getString("Status_Report_Achievment")%></td>
  <td class="tablecontent12">  <%=cum_mon5%></td>
  </tr>
  <tr>
    <td rowspan="1" class="tablecontent11">8</td>
    <td class="tablecontent11">Library </td>
 <td class="tablecontent11"><%=fix_val6%></td>
  <td class="tablecontent11"> <%=rsAdminResult.getString("Technology_Study_Achievment")%></td>
 <td class="tablecontent11"><%=cum_mon6%></td>
  </tr>
  <tr>
  <td rowspan="1" class="tablecontent12">9</td>
    <td class="tablecontent12"> Marketing Assistance </td>
 <td class="tablecontent12"><%=fix_val7%></td>
 <td class="tablecontent12"> <%=rsAdminResult.getString("Trade_Directories_Achievment")%></td>
 <td class="tablecontent12"><%=cum_mon7%></td>
  </tr>
  <tr>
    <td class="tablecontent11">10</td>
    <td class="tablecontent11">SENET </td>
     <td class="tablecontent11"> <%=fix_val8%></td>
    <td class="tablecontent11"> <%=rsAdminResult.getString("Training_Programme_Achievment")%></td>
 <td class="tablecontent11"><%=cum_mon8%></td>
  </tr>
	<tr>
    <td class="tablecontent12">11</td>
    <td class="tablecontent12">Detail Project Report </td>
 <td class="tablecontent12"><%=fix_val9%></td>
   <td class="tablecontent12"> <%=rsAdminResult.getString("Detail_Project_Achievment")%></td>
  <td class="tablecontent12"><%=cum_mon10%></td>
  </tr>

<% }%>
</table>
 <div align="center">

<input class="butt" type="button" name="reset" value="Reset" tabindex="18" onclick="pageReload()"/>&nbsp;
<input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
</form>
</body>
</html>
