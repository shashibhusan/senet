<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="inb.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FBFBFB">
<% String instId = request.getParameter("instId");
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
	//	tYears = tYears-1;
		flag1=1;
		
	}
Connection con = ConnectionManager.getConnectionDirectForMySQL();
Statement stmt4 = (Statement)con.createStatement();
 Statement stmt = (Statement)con.createStatement();
if(role.equalsIgnoreCase("AU")){	
		 String strSql = "select * from tbl_revenue where months =" + months +" and year='"+years+"' and instid='"+instId+"'";
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
String strSql = "SELECT * FROM tbl_revenue WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
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




String strCumulative=" SELECT sum(Common_total),sum(sale_total),sum(sdp_total),sum(edp_total),sum(mdp_total),sum(Seminar_total),sum(Capacity_total),sum(Project_total),sum(Sick_total),sum(Inplant_total),sum(NSIC_total),sum(Energy_total),sum(Surveys_total),sum(sale_publication_total),sum(Information_total),sum(others_total),sum(Accounts_total) FROM tbl_revenue where months >=1 AND months <="+months+" and year='"+years+"' and instid='"+instId+"'";                                                                                                                                                                                                                                                                                                                                                                                                                                            

	      	System.out.println("strCumulative = "+strCumulative);
		flag=0;
	      double cum_mon1=0.0;
	      double cum_mon2=0.0;
		double cum_mon3=0.0;
	      double cum_mon4=0.0;
		  double cum_mon5=0.0;
	      double cum_mon6=0.0;
		  double cum_mon7=0.0;
	      double cum_mon8=0.0;
		  double cum_mon9=0.0;
	      double cum_mon10=0.0;
		  double cum_mon11=0.0;
	      double cum_mon12=0.0;
		    double cum_mon13=0.0;
			double cum_mon14=0.0;
			double cum_mon15=0.0;
			double cum_mon16=0.0;
			double cum_mon17=0.0;
		
		
ResultSet rsCumulative=stmt.executeQuery(strCumulative);
 
	      while(rsCumulative.next())
	      {
	       cum_mon1=rsCumulative.getDouble("sum(Common_total)");
	       cum_mon2=rsCumulative.getDouble("sum(sale_total)");
		   
		  cum_mon3=rsCumulative.getDouble("sum(sdp_total)");
	       cum_mon4=rsCumulative.getDouble("sum(edp_total)");
		   
		   cum_mon5=rsCumulative.getDouble("sum(mdp_total)");
	       cum_mon6=rsCumulative.getDouble("sum(Seminar_total)");
		   
		   cum_mon7=rsCumulative.getDouble("sum(Capacity_total)");
	       cum_mon8=rsCumulative.getDouble("sum(Project_total)");
		   
		   cum_mon9=rsCumulative.getDouble("sum(Sick_total)");
	       cum_mon10=rsCumulative.getDouble("sum(Inplant_total)");
		   
			cum_mon11=rsCumulative.getDouble("sum(Surveys_total)");
	       cum_mon12=rsCumulative.getDouble("sum(Energy_total)");
	
		   cum_mon13=rsCumulative.getDouble("sum(NSIC_total)");
		   
	       cum_mon14=rsCumulative.getDouble("sum(sale_publication_total)");	
		    cum_mon15=rsCumulative.getDouble("sum(Information_total)");
	       cum_mon16=rsCumulative.getDouble("sum(others_total)");	
		   
		    cum_mon17=rsCumulative.getDouble("sum(Accounts_total)");
		   
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
<br><table align="center">
<div style="font-size:large;font-family:Verdana;font-weight:bold" align="center"><font color="#990000">  <%=rs_instName.getString("INST_NAME")%> </font></div>

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


<div style="font-size:large;font-family:Verdana;font-weight:bold;  " align="center" ><font color="#990000"> Monthly Progress Report of  Revenue Earning Statementin the month <%=rs_month.getString("mon")%></font></div>

<br /><br />

<input type="hidden" size="5" name="months" value="<%=request.getParameter("months")%>" />
<input type="hidden" size="5" name="years" value="<%=request.getParameter("years")%>" />
<input type="hidden" size="5" name="instId" value="<%=request.getParameter("instId")%>" />
<input type="hidden" size="5" name="user_date" value='<%=years%>-<%=months%>-20' />
<table width="749" border="1" align="center" class="style1" style="width: 562px; height: 145px; background-color: gainsboro;"  cellpadding="0" cellspacing="0">

  <tr  >
    <td width="33" align="center" class="tableheader">S.No</td>
    <td width="439" align="center" class="tableheader">Name Of Program </td>
    <td width="120" colspan="1"align="center" class="tableheader">Total</td>
	 <td width="120" colspan="1"align="center" class="tableheader">Cum.Total</td>
  </tr>
     <%if(divFlag==0){%>
  <tr >
    <td  class="tablecontent11" colspan="4" align="center">Record Not Found </td>
 
  </tr>
  
        <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_revenue WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>

 <tr >
    <td  class="tablecontent11">1</td>
    <td  class="tablecontent11">Common facility workshop revenue </td>
   <td  class="tablecontent1" ><%=rsAdminResult.getString("Common_total")%></td>
   <td  class="tablecontent1" ><%=cum_mon1%></td>
  </tr>
  <tr >
    <td  class="tablecontent12">2</td>
    <td  class="tablecontent12">sale of trainee products</td>
   <td  class="tablecontent2" ><%=rsAdminResult.getString("sale_total")%></td>
   <td  class="tablecontent2" ><%=cum_mon2%></td>
  </tr>
  <tr >
    <td  class="tablecontent11">3</td>
    <td  class="tablecontent11">sdp (training fee - regular courses/sdp specialized hi tech courses </td>
   <td  class="tablecontent1" ><%=rsAdminResult.getString("sdp_total")%>
   <td  class="tablecontent1" ><%=cum_mon3%>
  </tr>
  <tr >
    <td  class="tablecontent12">4</td>
    <td  class="tablecontent12">EDP training fee</td>
   <td  class="tablecontent2" ><%=rsAdminResult.getString("edp_total")%></td>
   <td  class="tablecontent2" ><%=cum_mon4%></td>
  </tr>
  <tr >
    <td  class="tablecontent11">5</td>
    <td  class="tablecontent11">MDP training fee</td>
   <td  class="tablecontent1" ><%=rsAdminResult.getString("mdp_total")%></td>
   <td  class="tablecontent1" ><%=cum_mon5%></td>
  </tr>
  <tr >
    <td  class="tablecontent12">6</td>
    <td  class="tablecontent12">Seminar fees</td>
   <td  class="tablecontent1" ><%=rsAdminResult.getString("Seminar_total")%></td>
   <td  class="tablecontent1" ><%=cum_mon6%></td>
  </tr>
  <tr >
    <td  class="tablecontent11">7</td>
    <td  class="tablecontent11">Capacity accessment and consultancy</td>
    <td  class="tablecontent1" ><%=rsAdminResult.getString("Capacity_total")%></td>
   <td  class="tablecontent1" ><%=cum_mon7%></td>
  </tr>
  <tr >
    <td  class="tablecontent12">8</td>
    <td  class="tablecontent12">Project appraisals</td>
    <td  class="tablecontent2" ><%=rsAdminResult.getString("Project_total")%></td>
   <td  class="tablecontent2" ><%=cum_mon8%></td>
  </tr>
  <tr >
    <td  class="tablecontent11">9</td>
    <td  class="tablecontent11">Sick unit studies</td>
   <td  class="tablecontent1" ><%=rsAdminResult.getString("Sick_total")%></td>
   <td  class="tablecontent1" ><%=cum_mon9%></td>
  </tr>
  <tr >
    <td  class="tablecontent12">10</td>
    <td  class="tablecontent12">Inplant studies</td>
    <td  class="tablecontent2" ><%=rsAdminResult.getString("Inplant_total")%></td>
   <td  class="tablecontent2" ><%=cum_mon10%></td>
  </tr>
  <tr >
    <td  class="tablecontent11">11</td>
    <td  class="tablecontent11">Surveys</td>
   <td  class="tablecontent1" ><%=rsAdminResult.getString("Surveys_total")%></td>
   <td  class="tablecontent1" ><%=cum_mon11%></td>
  </tr>
  <tr >
    <td  class="tablecontent12">12</td>
    <td  class="tablecontent12">Energy Audits</td>
   <td  class="tablecontent2" ><%=rsAdminResult.getString("Energy_total")%></td>
   <td  class="tablecontent2" ><%=cum_mon12%></td>
  </tr>
  <tr >
    <td  class="tablecontent11">13</td>
    <td  class="tablecontent11">NSIC  Regn./ gspp</td>
    <td  class="tablecontent1" ><%=rsAdminResult.getString("NSIC_total")%></td>
   <td  class="tablecontent1" ><%=cum_mon13%></td>
  </tr>
  <tr >
    <td  class="tablecontent12">14</td>
    <td  class="tablecontent12">PD Accounts</td>
    <td  class="tablecontent2" ><%=rsAdminResult.getString("Accounts_total")%></td>
   <td  class="tablecontent2" ><%=cum_mon14%></td>
  </tr>
  <tr >
    <td  class="tablecontent11">15</td>'
    <td  class="tablecontent11">Sale of publications</td>
    <td  class="tablecontent1" ><%=rsAdminResult.getString("sale_publication_total")%></td>
   <td  class="tablecontent1" ><%=cum_mon15%></td>
  </tr>
  <tr >
    <td  class="tablecontent12">16</td>
    <td  class="tablecontent12">Information Technology </td>
  <td  class="tablecontent2" ><%=rsAdminResult.getString("Information_total")%></td>
   <td  class="tablecontent2" ><%=cum_mon16%></td>
  </tr>
  <tr >
    <td  class="tablecontent11">17</td>
    <td  class="tablecontent11">others</td>
    <td  class="tablecontent1" ><%=cum_mon17%></td>
   <td  class="tablecontent1" ><%=cum_mon17%></td>
  </tr>
    <tr >
    <td  class="tablecontent12">18</td>
    <td  class="tablecontent12">Total</td>
    <td  class="tablecontent2" ><%=rsAdminResult.getString("total")%>
   <td  class="tablecontent2" ><%=(cum_mon1+cum_mon2+cum_mon3+cum_mon4+cum_mon5+cum_mon6+cum_mon7+cum_mon8+cum_mon9+cum_mon10+cum_mon11+cum_mon12+cum_mon13+cum_mon14+cum_mon15+cum_mon16+cum_mon17) %></td>
  </tr>
  

<% }%>
</table>
 <div align="center">


<input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
</form>
</body>
</html>
