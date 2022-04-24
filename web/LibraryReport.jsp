<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<title>Untitled Document</title>
	<link href="css/stripes_Library.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$('tr:nth-child(2n+1)').addClass('even');
});
</script>
    <head>
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
border:double #A9D0F5 1px;
padding-top:3px;
padding-bottom:3px;
padding-left:3px;
font-family:Arial, Helvetica, sans-serif;
font-size:12px;
text-align:center;
}

</style>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
</head>

<body onload="calculateSum()">
<%
int icnt=1;
String NotIn="";
String Random5=(String)session.getAttribute("Random5");
String mnm = request.getParameter("mnm");
if((mnm!=null)&&(mnm.equals(Random5)))
{

	String intid=(String)session.getAttribute("ins");
	String role=(String)session.getAttribute("rol");

	 if(intid!=null && intid!=""  ){

		%>	
	<%

	String years =request.getParameter("cmbYear");
	String months = request.getParameter("cmbMonth");
	System.out.println(years);
	System.out.println(months);
	if (months.matches("[0-9]+") && (years.length()== 9) && (years.substring(0, 1).matches("[0-9]"))) {
                   int total_sanctioned=0;
                   int total_expDurringMonth=0;
                   int total_expUpToMonth=0;
                   int total_balance=0;
	int buttonFlag=0;
	ResultSet rsAdminResult = null;
	ResultSet rsAdminResult1 = null;
         ResultSet   rsAdminResult2=null;
                 Statement stmt2 = null;
		Connection con = null;
		CallableStatement stmt = null;
		CallableStatement stmt1 = null;
	        con = ConnectionManager.getConnectionDirectForMySQL();
                  stmt2 = (Statement)con.createStatement();
		Statement stmt4 = (Statement)con.createStatement();
		
String sql = "call libreport (?,?)";
			 
				stmt = con.prepareCall(sql);
				stmt.setString(1, years);
				stmt.setString(2, months);
				
rsAdminResult = stmt.executeQuery();

%>

<%

String strsql2="select * from tbl_month where months='"+months+"'" ;
ResultSet rs_month=stmt4.executeQuery(strsql2);
if(rs_month.next())
{
String mon = rs_month.getString("mon");
}
%>
<center><h3>Library Expenditure of MSME-DIs  up to Month <%=rs_month.getString("mon")%> , Year -<%=years%></h3></center>
<table width="500"  class="sortable" id="anyid" height="49" border="1" align="center">
  <tr>
    <td width="4" rowspan="2" class="table_border_both" bgcolor="#095471"><font color="#FFFFFF">S.No</font></td>
    <td width="4" rowspan="2"class="table_border_both" bgcolor="#095471"><div align="center"><font color="#FFFFFF">MSME-DIs</font></div></td>
    <td colspan="4" class="table_border_both" name="tcol1" id="tcol1" bgcolor="#095471"><div align="center" ><font color="#FFFFFF">LIB. Exp.Detail</font> </div></td>
     
  </tr>
    
       <tr>
	   
         <td width="5" class="table_border_both" name="tcol1" id="tcol1" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Amt.Sanction</font></div></td>
         <td width="5" class="table_border_both" name="tcol1" id="tcol1" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Exp.Durring Month</font></div></td>
         <td width="5" class="table_border_both" name="tcol1" id="tcol1" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Exp.Up To Month</font></div></td>
         <td width="12" class="table_border_both" name="tcol1" id="tcol1" bgcolor="#095471"><font color="#FFFFFF">Balance</font></td>
       </tr>
	       <%
if(rsAdminResult.next())
    {
 rsAdminResult.beforeFirst();

  for(icnt=1;rsAdminResult.next();icnt++)
{
                  
%>
  <tr>			
    <td class="table_border_both" ><%=icnt%></td>
    <%
   if(rsAdminResult.getString("MSMEDI")!=null)
    {
%>
       <td class="table_border_both" ><%=rsAdminResult.getString("MSMEDI")%></td>
       <%
} else{
        %>
        <td class="table_border_both" align="center" > </td>

        <% } %>
        <%
       if(rsAdminResult.getString("sanctioned")!=null)
    {
   total_sanctioned=total_sanctioned+Integer.parseInt(rsAdminResult.getString("sanctioned"));
%>
<td class="table_border_both" align="center" ><%=rsAdminResult.getString("sanctioned")%></td>
       <%
} else{
        %>
        <td class="table_border_both" align="center" >0 </td>

        <% } %>
        <%
        if(rsAdminResult.getString("expDurringMonth")!=null)
    {
    total_expDurringMonth=total_expDurringMonth+Integer.parseInt(rsAdminResult.getString("expDurringMonth"));
%>
       <td class="table_border_both" align="center" ><%=rsAdminResult.getString("expDurringMonth")%></td>
       <%
} else{
        %>
        <td class="table_border_both" align="center" > 0</td>

        <% } %>
        <%
        if(rsAdminResult.getString("expUpToMonth")!=null)
    {
   total_expUpToMonth=total_expUpToMonth+Integer.parseInt(rsAdminResult.getString("expUpToMonth"));
%>
       <td class="table_border_both" align="center" ><%=rsAdminResult.getString("expUpToMonth")%></td>
       <%
} else{
        %>
        <td class="table_border_both" align="center" > 0</td>

        <% } %>

        <%
        if((rsAdminResult.getString("sanctioned")!=null)&&(rsAdminResult.getString("expUpToMonth")!=null))
            {
        int balance=Integer.parseInt(rsAdminResult.getString("sanctioned"))-Integer.parseInt(rsAdminResult.getString("expUpToMonth"));
        total_balance=total_balance+balance;
         %>
         <td class="table_border_both" align="center" ><%=balance %></td>
      <%  }
   else
       { %>
       <td class="table_border_both" align="center" >0 </td>
       <% }
        %>
  </tr>
  
 <%
  NotIn=  NotIn.concat("'"+rsAdminResult.getString("MSMEDI")+"'"+",");
              }                                                                                    
   }
else
{
  NotIn="'"+"NotIn"+"''";
}
        %>
   <%
        NotIn=NotIn.substring(0, NotIn.length()-1);
       String query="select a.name,t.amc_of_pc1 from Allmsme a LEFT JOIN tbl_targetlib t ON a.Inst_Id=t.Inst_Id where t.year='"+years+"' and a.name not in ("+NotIn+") order by name;";
       System.out.println("*************"+query);
       rsAdminResult2=stmt2.executeQuery(query);
       if(rsAdminResult2.next())
           {
           rsAdminResult2.beforeFirst();
while(rsAdminResult2.next())
{
    total_sanctioned=total_sanctioned+Integer.parseInt(rsAdminResult2.getString("amc_of_pc1"));
%>

<tr>
    <td class="table_border_both" ><%=icnt%></td>
    <td class="table_border_both" ><font color="red" size="3px">*</font><%=rsAdminResult2.getString("name")%></td>
    <td class="table_border_both" ><center><%=rsAdminResult2.getString("amc_of_pc1")%></center></td>
    <td class="table_border_both" ><center>0</center></td>
	<td class="table_border_both" ><center>0</center></td>
	<td class="table_border_both" ><center>0</center></td>
	 
  </tr>

  <%
  icnt++;
}
     %>
<div align="center" style="font-size:11px;font-family:Verdana;font-weight:bold"><font color="red">
        <font color="red" size="3px">*</font> :-No record is found for this MSME-DI.
                    </font>
                </div>
  <% } 
     else {  
     %>
     <div align="center" style="font-size:11px;font-family:Verdana;font-weight:bold"><font color="red">
             <%--<img width="60px" height="20px" src="note.gif"/>:-No sanction have been issue for <%= years %>.--%>
                    </font>
                </div>
     <% } %>
  <tr>
    <td class="table_border_both" ></td>
	<td class="table_border_both" >Total</td>
        <td class="table_border_both"><center><%=total_sanctioned %></center></td>
        <td class="table_border_both"><center><%=total_expDurringMonth %></center></td>
        <td class="table_border_both"><center><%=total_expUpToMonth %></center></td>
        <td class="table_border_both"><center><%=total_balance %></center></td>
  </tr> 

</table>
<br/>
  <center><form><input type="button" value=" Print"
onclick="window.print();return false;" /></form></center>

 <% } else {%>
 <jsp:forward page="stat.jsp"></jsp:forward>
  <% }%>
  <%
  } else
	 { %>
<jsp:forward page="stat.jsp"></jsp:forward>
         <%  }
			
 %>
	<% } else { %>
   <jsp:forward page="stat.jsp"></jsp:forward>
<% }%>

</body>
</html>
