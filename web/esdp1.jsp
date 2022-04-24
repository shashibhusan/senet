<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="inb.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="">

<form  name="form1" id="form1" method="post" action="esdpsubmit.jsp" onsubmit="return formValidator()">
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
	//	tYears = tYears-1;
		flag1=1;
			%>
		<input type="hidden" size="5" name="user_date" value='<%=years%>-<%=months%>-20' />
		<%
	}
Connection con = ConnectionManager.getConnectionDirectForMySQL();
Statement stmt4 = (Statement)con.createStatement();
 Statement stmt = (Statement)con.createStatement();
if(role.equalsIgnoreCase("NU")){	
		 String strSql = "select * from tbl_esdp where months =" + months +" and year='"+years+"' and instid='"+instId+"'";
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
String strSql = "SELECT * FROM tbl_esdp WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
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




String strCumulative=" SELECT sum(esdp2),sum(esdp3),sum(edp2),sum(edp3),sum(bsdp2),sum(bsdp3),sum(mdp2),sum(mdp3),sum(sdp2),sum(sdp3),sum(imc2),sum(imc3),sum(other2),sum(other3) FROM tbl_esdp where months >=1 AND months <="+months+" and year='"+years+"' and instid='"+instId+"'";

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
ResultSet rsCumulative=stmt.executeQuery(strCumulative);

	      while(rsCumulative.next())
	      {
	       cum_mon1=rsCumulative.getInt("sum(esdp2)");
	       cum_mon2=rsCumulative.getInt("sum(esdp3)");
		   
		  cum_mon3=rsCumulative.getInt("sum(edp2)");
	       cum_mon4=rsCumulative.getInt("sum(edp3)");
		   
		   cum_mon5=rsCumulative.getInt("sum(bsdp2)");
	       cum_mon6=rsCumulative.getInt("sum(bsdp3)");
		   
		   cum_mon7=rsCumulative.getInt("sum(mdp2)");
	       cum_mon8=rsCumulative.getInt("sum(mdp3)");
		   
		   cum_mon9=rsCumulative.getInt("sum(sdp2)");
	       cum_mon10=rsCumulative.getInt("sum(sdp3)");
		   
		   cum_mon11=rsCumulative.getInt("sum(imc2)");
	       cum_mon12=rsCumulative.getInt("sum(imc3)");
		   
		   cum_mon13=rsCumulative.getInt("sum(other2)");
	       cum_mon14=rsCumulative.getInt("sum(other3)");
		
		   
         	flag++;
	      }
	      System.out.println("flag"+flag);







String strQuery = "SELECT * FROM tbl_pms_target WHERE year="+years+" AND   Inst_Id='"+instId+"'"; 
ResultSet rsTargetResult =stmt.executeQuery(strQuery);

if(rsTargetResult.next()){
	System.out.println("Target Result Set have record");
		   fix_val1=rsTargetResult.getString("esdp");
			 fix_val2=rsTargetResult.getString("edp");
			 fix_val3=rsTargetResult.getString("bsdp");
			 fix_val4=rsTargetResult.getString("mdp");
			 fix_val5=rsTargetResult.getString("sdp");
			 fix_val6=rsTargetResult.getString("imc");
			 fix_val7=rsTargetResult.getString("other");
			
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


<form  name="form1" id="form1" method="post" action="esdpsubmit.jsp">
<h3 align="center" class="green"> <span id="ctl00_ContentPlaceHolder1_lbl_topic" style="color: rgb(204, 0, 0); font-family: Microsoft Sans Serif; font-size: medium; font-weight: bold; text-decoration: underline; text-align: center;"> Monthly Progress Report Of Training Programmes</span></h3>
<table width="537" border="1" align="center" class="style1" style="width: 562px; height: 145px; background-color: gainsboro;" cellpadding="0" cellspacing="0">
<input type="hidden" size="5" name="months" value="<%=request.getParameter("months")%>" />
<input type="hidden" size="5" name="years" value="<%=request.getParameter("years")%>" />
<input type="hidden" size="5" name="instId" value="<%=request.getParameter("instId")%>" />
<input type="hidden" size="5" name="user_date" value='<%=years%>-<%=months%>-20' />
  <tr >
    <td width="134" rowspan="2" class="tableheader">Name Of Program </td>
    <td width="77" rowspan="2" class="tableheader">Target</td>
    <td colspan="2" class="tableheader">Monthly Achievment (During the Months) </td>
    <td colspan="2" class="tableheader">Cumlative Achievment (up to Months) </td>
  </tr>
  <tr >
    <td  class="tableheader">No of Programmes </td>
    <td class="tableheader">No of person Trained</td>
    <td class="tableheader">No of Programmes </td>
    <td class="tableheader">No of person Trained</td>
  </tr>
   <%if(divFlag==0){%>
  <tr>
    <td  colspan="7" align="center" >Record Not Found</td>
   
  </tr>
     <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_esdp WHERE months="+months+" AND year='"+years+"' AND   instid='"+instId+"'"; 
rsAdminResult=stmt.executeQuery(strSql);
rsAdminResult.next();
%>
<tr>
    <td class="tablecontent11" >ESDPs</td>
   <td align="center"class="tablecontent11" ><%=rsAdminResult.getString("esdp1")%></td>
   <td align="center"class="tablecontent11" ><%=rsAdminResult.getString("esdp2")%></td>
   <td align="center"class="tablecontent11" ><%=rsAdminResult.getString("esdp3")%></td>
 <td align="center"class="tablecontent11" ><%=cum_mon1%></td>
 <td align="center" class="tablecontent11"><%=cum_mon2%></td>
  </tr>
  <tr>
    <td class="tablecontent12">EDPs</td>
     <td align="center"class="tablecontent12"><%=rsAdminResult.getString("edp1")%></td>
   <td align="center"class="tablecontent12"> <%=rsAdminResult.getString("edp2")%></td>
   <td align="center"class="tablecontent12"><%=rsAdminResult.getString("edp3")%>
 <td align="center"class="tablecontent12"><%=cum_mon3%>
 <td align="center"class="tablecontent12"><%=cum_mon4%>
  </tr>
 
  <tr>
    <td class="tablecontent11" >BSDPs</td>
     <td align="center"class="tablecontent11"><%=rsAdminResult.getString("bsdp1")%></td>
   <td align="center"class="tablecontent11"><%=rsAdminResult.getString("bsdp2")%></td>
   <td align="center"class="tablecontent11"><%=rsAdminResult.getString("bsdp3")%>
 <td align="center"class="tablecontent11"><%=cum_mon5%>
 <td align="center"class="tablecontent11"><%=cum_mon6%>
  </tr>
  <tr>
    <td class="tablecontent12">MDPs</td>
     <td align="center"class="tablecontent12"><%=rsAdminResult.getString("mdp1")%></td>
   <td align="center"class="tablecontent12"><%=rsAdminResult.getString("mdp2")%></td>
   <td align="center"class="tablecontent12"><%=rsAdminResult.getString("mdp3")%>
 <td align="center"class="tablecontent12"><%=cum_mon7%>
 <td align="center"class="tablecontent12"><%=cum_mon8%>
  </tr>
  <tr>
    <td class="tablecontent11">SDPs</td>
     <td align="center"class="tablecontent11"><%=rsAdminResult.getString("sdp1")%></td>
   <td align="center"class="tablecontent11"><%=rsAdminResult.getString("sdp2")%></td>
   <td align="center"class="tablecontent11"><%=rsAdminResult.getString("sdp3")%>
 <td align="center"class="tablecontent11"><%=cum_mon9%>
 <td align="center"class="tablecontent11"><%=cum_mon10%>
  </tr>
   <tr>
    <td class="tablecontent12">IMCs</td>
     <td align="center"class="tablecontent12"><%=rsAdminResult.getString("imc1")%></td>
   <td align="center"class="tablecontent12"><%=rsAdminResult.getString("imc2")%></td>
   <td align="center"class="tablecontent12"><%=rsAdminResult.getString("imc3")%>
 <td align="center"class="tablecontent12"><%=cum_mon11%>
 <td align="center"class="tablecontent12"><%=cum_mon12%>
  </tr>
    <tr>
    <td class="tablecontent11">Others</td>
     <td align="center"class="tablecontent11"><%=rsAdminResult.getString("other1")%></td>
   <td align="center"class="tablecontent11"><%=rsAdminResult.getString("other2")%></td>
   <td align="center"class="tablecontent11"><%=rsAdminResult.getString("other3")%>
 <td align="center"class="tablecontent11"><%=cum_mon13%>
 <td align="center"class="tablecontent11"><%=cum_mon14%>
  </tr>
<% }%>
</table>

 <div align="center">
<input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
</div>
</form>


</body>
</html>
