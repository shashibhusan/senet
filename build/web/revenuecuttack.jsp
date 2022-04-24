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
	if(rsAdminResult.next()){
		System.out.println("Result Set have record");
		divFlag=1;
	}
	else{
	System.out.println("SU Result Set have not record");
	buttonFlag=1;
	}	

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
<form  name="form1" id="form1" method="post" action="revenuecheen_save.jsp">
<input type="hidden" size="5" name="months" value="<%=request.getParameter("months")%>" />
<input type="hidden" size="5" name="years" value="<%=request.getParameter("years")%>" />
<input type="hidden" size="5" name="instId" value="<%=request.getParameter("instId")%>" />
<input type="hidden" size="5" name="user_date" value='<%=tYears%>-<%=months%>-20' />
<table width="100%" border="0" align="center" >
  <tr>
    <td width="44" class="tableheader">S.No</td>
    <td width="250" class="tableheader">Name Of Program </td>
    <td width="68" class="tableheader">MSMEDI-Cuttack</td>
    <td width="85" class="tableheader">Br.MSMEDI Rayagada </td>
    <td width="85" class="tableheader">Br.MSMEDI Rourkela </td>
  </tr>
   <%if(divFlag==0){%>
  <tr>
    <td class="tablecontent11">1</td>
     <input type="hidden" size="5" name="h_1" value="Common facility workshop revenue" />
    <td class="tablecontent11"><span class="pink">Common facility workshop revenue </span></td>
  
    <td class="tablecontent1"><input type="text"  value="0" name="a_1" id="a_1"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_1" id="b_1"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_1" id="c_1"size="7" /></td>
  </tr>
  <tr>
    <td class="tablecontent12">2</td>
    <input type="hidden" size="5" name="h_2" value="sale of trainee products" />
    <td class="tablecontent12"><span class="pink">sale of trainee products</span></td>
  
   	 <td class="tablecontent2"><input type="text"  value="0" name="a_2" id="a_2"size="7" /></td>
  <td class="tablecontent2"><input type="text"  value="0" name="b_2" id="b_2"size="7" /></td>
  <td class="tablecontent2"><input type="text"  value="0" name="c_2" id="c_2"size="7" /></td>
  </tr>
  <tr>
    <td class="tablecontent11">3</td>
    <input type="hidden" size="5" name="h_3" value="sdp (training fee - regular courses/sdp specialized hi tech courses including cad / cam" />
   <td class="tablecontent11"><span class="pink">sdp (training fee - regular courses/sdp specialized hi tech courses including cad / cam</span></td>
  
    <td class="tablecontent1"><input type="text"  value="0" name="a_3" id="a_3"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_3" id="b_3"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_3" id="c_3"size="7" /></td>
  </tr>
  <tr>
    <td class="tablecontent12">4</td>
    <input type="hidden" size="5" name="h_4" value="EDP training fee" />
    <td class="tablecontent12"><span class="pink">EDP training fee</span></td>
    
 
    	 <td class="tablecontent2"><input type="text"  value="0" name="a_4" id="a_4"size="7" /></td>
  <td class="tablecontent2"><input type="text"  value="0" name="b_4" id="b_4"size="7" /></td>
  <td class="tablecontent2"><input type="text"  value="0" name="c_4" id="c_4"size="7" /></td>
  </tr>
  <tr>
    <td class="tablecontent11">5</td>
    <input type="hidden" size="5" name="h_5" value="MDP training fee" />
    <td class="tablecontent11"><span class="pink">MDP training fee</span></td>
   
     <td class="tablecontent1"><input type="text"  value="0" name="a_5" id="a_5"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_5" id="b_5"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_5" id="c_5"size="7" /></td>
  </tr>
  <tr>
    <td class="tablecontent12">6</td>
   <input type="hidden" size="5" name="h_6" value="Seminar fees" />
    <td class="tablecontent12"><span class="pink">Seminar fees</span></td>
  
  	 <td class="tablecontent2"><input type="text"  value="0" name="a_6" id="a_6"size="7" /></td>
  <td class="tablecontent2"><input type="text"  value="0" name="b_6" id="b_6"size="7" /></td>
  <td class="tablecontent2"><input type="text"  value="0" name="c_6" id="c_6"size="7" /></td>
  </tr>
  <tr>
    <td class="tablecontent11">7</td>
    <input type="hidden" size="5" name="h_7" value="Capacity accessment and consultancy" />
    <td class="tablecontent11"><span class="pink">Capacity accessment and consultancy</span></td>
 
    <td class="tablecontent1"><input type="text"  value="0" name="a_7" id="a_7"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_7" id="b_7"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_7" id="c_7"size="7" /></td>
  </tr>
  <tr>
    <td class="tablecontent12">8</td>
     <input type="hidden" size="5" name="h_8" value="Project appraisals" />
    <td class="tablecontent12"><span class="pink">Project appraisals</span></td>
 
    	 <td class="tablecontent2"><input type="text"  value="0" name="a_8" id="a_8"size="7" /></td>
  <td class="tablecontent2"><input type="text"  value="0" name="b_8" id="b_8"size="7" /></td>
  <td class="tablecontent2"><input type="text"  value="0" name="c_8" id="c_8"size="7" /></td>
  </tr>
  <tr>
    <td class="tablecontent11">9</td>
   <input type="hidden" size="5" name="h_9" value="Sick unit studies" />
   <td class="tablecontent11"><span class="pink">Sick unit studies</span></td>
  
  	 <td class="tablecontent1"><input type="text"  value="0" name="a_9" id="a_9"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_9" id="b_9"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_9" id="c_9"size="7" /></td>
  </tr>
  <tr>
    <td class="tablecontent12">10</td>
    <input type="hidden" size="5" name="h_10" value="Inplant studies" />
    <td class="tablecontent12"><span class="pink">Inplant studies</span></td>
   
     <td class="tablecontent12"><input type="text"  value="0" name="a_10" id="a_10"size="7" /></td>
  <td class="tablecontent12"><input type="text"  value="0" name="b_10" id="b_10"size="7" /></td>
  <td class="tablecontent12"><input type="text"  value="0" name="c_10" id="c_10"size="7" /></td>
  </tr>
  <tr>
    <td class="tablecontent11">11</td>
  <input type="hidden" size="5" name="h_11" value="Surveys" />
    <td class="tablecontent11"><span class="pink">Surveys</span></td>

   <td class="tablecontent1"><input type="text"  value="0" name="a_11" id="a_11"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_11" id="b_11"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_11" id="c_11"size="7" /></td>
  </tr>
  <tr>
    <td class="tablecontent12">12</td>
  <input type="hidden" size="5" name="h_12" value="Energy Audits" />
    <td class="tablecontent12"><span class="pink">Energy Audits</span></td>
  
   	 <td class="tablecontent12"><input type="text"  value="0" name="a_12" id="a_12"size="7" /></td>
  <td class="tablecontent12"><input type="text"  value="0" name="b_12" id="b_12"size="7" /></td>
  <td class="tablecontent12"><input type="text"  value="0" name="c_12" id="c_12"size="7" /></td>
  </tr>
  <tr>
    <td class="tablecontent11">13</td>
       <input type="hidden" size="5" name="h_13" value="NSIC  Regn./ gspp" />
    <td class="tablecontent11"><span class="pink">NSIC  Regn./ gspp</span></td>
  
    <td class="tablecontent1"><input type="text"  value="0" name="a_13" id="a_13"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_13" id="b_13"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_13" id="c_13"size="7" /></td>
  </tr>
  <tr>
    <td class="tablecontent12">14</td>
    <input type="hidden" size="5" name="h_14" value="PD Accounts" />
    <td class="tablecontent12"><span class="pink">PD Accounts</span></td>
   
   	 <td class="tablecontent12"><input type="text"  value="0" name="a_14" id="a_14"size="7" /></td>
  <td class="tablecontent12"><input type="text"  value="0" name="b_14" id="b_14"size="7" /></td>
  <td class="tablecontent12"><input type="text"  value="0" name="c_14" id="c_14"size="7" /></td>
  </tr>
  <tr>
    <td class="tablecontent11" >15</td>
  <input type="hidden" size="5" name="h_15" value="Sale of publications" />
    <td class="tablecontent11"><span class="pink">Sale of publications</span></td>

   <td class="tablecontent1"><input type="text"  value="0" name="a_15" id="a_15"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_15" id="b_15"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_15" id="c_15"size="7" /></td>
  </tr>
  <tr>
    <td class="tablecontent12">16</td>
    <input type="hidden" size="5" name="h_16" value="Information Technology Royalty" />
    <td class="tablecontent12"><span class="pink">Information Technology Royalty</span></td>
  
   <td class="tablecontent12"><input type="text"  value="0" name="a_16" id="a_16"size="7" /></td>
  <td class="tablecontent12"><input type="text"  value="0" name="b_16" id="b_16"size="7" /></td>
  <td class="tablecontent12"><input type="text"  value="0" name="c_16" id="c_16"size="7" /></td>
  </tr>
  <tr>
    <td class="tablecontent11">17</td>
  <input type="hidden" size="5" name="h_17" value="others" />
    <td class="tablecontent11"><span class="pink">others</span></td>
   
   <td class="tablecontent1"><input type="text"  value="0" name="a_17" id="a_17"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_17" id="b_17"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_17" id="c_17"size="7" /></td>
  </tr>
   <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_revenue_branch WHERE months='"+months+"' AND years ="+years+" AND   instid='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
%>
 <% for(int icnt=1;rsAdminResult.next();icnt++)
{
%>
  <tr>
    <td class="tablecontent11"><%=icnt%></td>
	<% System.out.println(icnt);%>
	<input type="hidden" size="5" name="h_<%=icnt%>" id="h_<%=icnt%>" value='<%=rsAdminResult.getString("name")%>' />
    <td class="tablecontent11"><%=rsAdminResult.getString("name")%></td>
    <td class="tablecontent1"><input type="text"   name="a_<%=icnt%>" id="a_<%=icnt%>"size="7" value='<%=rsAdminResult.getString("msmedi")%>'/></td>
  <td class="tablecontent1"><input type="text"   name="b_<%=icnt%>" id="b_<%=icnt%>"size="7" value='<%=rsAdminResult.getString("branch1")%>' /></td>
     <td class="tablecontent1"><input type="text"   name="c_<%=icnt%>" id="c_<%=icnt%>"size="7" value='<%=rsAdminResult.getString("branch2")%>'/></td>
  
   
  </tr>
  
<% } }%>
</table>
 <div align="center">
<%
if( buttonFlag==0){%>
<input class="butt" type="submit" name="submit" value="Edit" tabindex="16"onclick="show_confirm()"/>&nbsp;
<%}else{%>
<input class="butt" type="submit" name="submit" value="Add" tabindex="16" onclick="show_confirm()"/>&nbsp;
<%}%>
<input class="butt" type="button" name="reset" value="Reset" tabindex="18" onclick="pageReload()"/>&nbsp;
<input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
</form>
</body>
</html>
