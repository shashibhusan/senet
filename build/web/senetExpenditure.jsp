<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>Untitled Document</title>
	<link href="css/stripes.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$('tr:nth-child(2n+1)').addClass('even');
});
</script>
    <head>
	<script type="text/javascript">
<!--
function PrintDate() {
  today = new Date();
  document.write('Date: ',today.getDate(),'/', today.getMonth()+1,'/',today.getYear());
}
//-->
</script>
<script language=JavaScript>

var message="Function Disabled!";

///////////////////////////////////
function clickIE4(){
if (event.button==2){
alert(message);
return false;
}
}

function clickNS4(e){
if (document.layers||document.getElementById&&!document.all){
if (e.which==2||e.which==3){
alert(message);
return false;
}
}
}

if (document.layers){
document.captureEvents(Event.MOUSEDOWN);
document.onmousedown=clickNS4;
}
else if (document.all&&!document.getElementById){
document.onmousedown=clickIE4;
}

document.oncontextmenu=new Function("alert(message);return false")

// -->
</script>

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
.sno
{
border:solid #A9D0F5 1px;
padding-top:3px;
padding-bottom:3px;
padding-left:3px;
font-family:Arial, Helvetica, sans-serif;
font-size:10px;
width: 30px;
}
.width-td
{
    width: 80px;
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

</STYLE>
<script language="javascript">

// Set the default "show" mode to that specified by W3C DOM
// compliant browsers

var showMode = 'table-cell';

// However, IE5 at least does not render table cells correctly
// using the style 'table-cell', but does when the style 'block'
// is used, so handle this

if (document.all) showMode='block';

// This is the function that actually does the manipulation

function toggleVis(btn){

	// First isolate the checkbox by name using the
	// name of the form and the name of the checkbox

	btn   = document.forms['tcol'].elements[btn];

	// Next find all the table cells by using the DOM function
	// getElementsByName passing in the constructed name of
	// the cells, derived from the checkbox name

	cells = document.getElementsByName('t'+btn.name);

	// Once the cells and checkbox object has been retrieved
	// the show hide choice is simply whether the checkbox is
	// checked or clear

	mode = btn.checked ? showMode : 'none';

	// Apply the style to the CSS display property for the cells

	for(j = 0; j < cells.length; j++) cells[j].style.display = mode;
}

</script>


<script src="sorttable.js"></script>
</head>
<body bgcolor="#FBFBFB">

	 <% String Random5=(String)session.getAttribute("Random5");
String mnm = request.getParameter("mnm");
System.out.println("prakash chandradeynccffffff ---------chanda financial page======"+Random5);
System.out.println("prakash chandradeynccffffff ---------chanda financial page ======"+mnm);
if(Random5.equals(mnm))
{


	String intid=(String)session.getAttribute("ins");
	String role=(String)session.getAttribute("rol");
	System.out.println("inst id is valid ======="+intid);
	System.out.println("inst id is valid ======="+role);
System.out.println("+++++++++"+intid);
	 if(intid!=null && intid!=""  ){




		%>

	 <%

        int di_Total=0,BranchTotal=0;
	String years =request.getParameter("cmbYear");
	if ((years.length()== 9) && (years.substring(0, 1).matches("[0-9]"))) {
	System.out.println("pattern matches");
	int buttonFlag=0;
	ResultSet rsAdminResult = null;
	ResultSet rsAdminResult1 = null;
		Connection con = null;
		Connection con1 = null;
		 CallableStatement stmt = null;
		  CallableStatement stmt1 = null;
		  CallableStatement stmt2 = null;
	    // Statement stmt = null;
		// String userDate=months+"-"+years;


	     con = ConnectionManager.getConnectionDirectForMySQL();
	    // stmt = (Statement)con.createStatement();

//String strSql = "SELECT * FROM v_targetsenet where years='"+years+"'";

String sql = "call vv_targetsenet(?)";
				System.out.println(sql);
				stmt = (CallableStatement) con.prepareCall(sql);

				stmt.setString(1, years);
				//stmt.setString(2, years);

rsAdminResult = stmt.executeQuery();


%>





<center><h3>Amount Sanctioned for Senet Expenditure of MSME-DIs in Financial year  <%=years%></h3></center>

<table   border="1"  cellspacing="0" cellpadding="0" style="border-collapse: collapse; width: 900px;">  <tr>
        <td class=" sno"   bgcolor="#095471"><strong><font color="#FFFFFF">S.No</font></strong></td>
        <td class="table_border_both " bgcolor="#095471" ><strong><font color="#FFFFFF">MSME-DIs</font></strong></td>
    <td class="table_border_both width-td"  name="tcol1" id="tcol1" bgcolor="#095471"><strong><font color="#FFFFFF">AMC of PCs <br/>UPS,Batteries</font></strong> </td>
    <td  class="table_border_both width-td"   name="tcol2" id="tcol2" bgcolor="#095471"><strong><font color="#FFFFFF">Web. Maint.</font> </strong></td>
    <td class="table_border_both width-td"  name="tcol3" id="tcol3" bgcolor="#095471"><strong><font color="#FFFFFF">Internet <br/>Connectivity </font></strong></td>
    <td  class="table_border_both width-td"   name="tcol4" id="tcol4" bgcolor="#095471"><strong><font color="#FFFFFF">Contgs</font></strong></td>
	 <td class="table_border_both width-td"   name="tcol5" id="tcol5" bgcolor="#095471"><strong><font color="#FFFFFF">Hardware<br/>/Others</font></strong></td>
	 <td class="table_border_both width-td"   name="tcol5" id="tcol5" bgcolor="#095471"><strong><font color="#FFFFFF">Re-validation<br/> Amount</font></strong></td>
    <td class="table_border_both width-td" name="tcol6" id="tcol6" bgcolor="#095471"><strong><font color="#FFFFFF">Total</font></strong></td>
  </tr>
<% for(int icnt=1;rsAdminResult.next();icnt++)
{
%>
  <tr>
    <td class="table_border_both" ><%=icnt%></td>
	<td class="table_border_both" ><%=rsAdminResult.getString("INST_CITY")%></td>
    <td class="table_border_both" name="tcol1" id="tcol1" ><%=rsAdminResult.getString("AMC_of_pc1")%></td>
    <td class="table_border_both" name="tcol2" id="tcol2" ><%=rsAdminResult.getString("web1")%></td>
    <td class="table_border_both" name="tcol3" id="tcol3" ><%=rsAdminResult.getString("Connectivity1")%></td>
   <td class="table_border_both" name="tcol4" id="tcol4" ><%=rsAdminResult.getString("Contg1")%></td>
	<td class="table_border_both" name="tcol5" id="tcol5" ><%=rsAdminResult.getString("Others1")%></td>
	<td class="table_border_both" name="tcol6" id="tcol6" ><%=rsAdminResult.getString("amount")==null?"0":rsAdminResult.getString("amount")%></td>
	
	<td class="table_border_both" name="tcol6" id="tcol6" ><%=(rsAdminResult.getInt("amount")+rsAdminResult.getInt("Others1")+rsAdminResult.getInt("Contg1")+rsAdminResult.getInt("Connectivity1")+rsAdminResult.getInt("web1")+rsAdminResult.getInt("AMC_of_pc1"))%></td>
  </tr>

  <% }%>

  <tr>
    <%
  System.out.println("ppppppcccchhhhhhaaaannnddddrrrrrrraaaaa"+years);

String sql1 = "call proc_senet_mprrtar (?)";
System.out.println(sql1);
stmt1 = (CallableStatement) con.prepareCall(sql1);
stmt1.setString(1, years);
rsAdminResult1 = stmt1.executeQuery();

%>
  <% for(int icnt=1;rsAdminResult1.next();icnt++)
     
{
     di_Total=rsAdminResult1.getInt("amt")+rsAdminResult1.getInt("am")+rsAdminResult1.getInt("we")+rsAdminResult1.getInt("cone")+rsAdminResult1.getInt("cont")+rsAdminResult1.getInt("hardw");
%>
    <td  class="table_border_both" bgcolor="#990000"></td>
    <td  class="table_border_both" bgcolor="#990000"><strong><font color="#FFFFFF">Total</font></strong></td>
    <td  class="table_border_both" name="tcol1" id="tcol1" bgcolor="#990000"> <strong><font color="#FFFFFF"><%=rsAdminResult1.getString("am")%></font></strong></td>
    <td  class="table_border_both" name="tcol2" id="tcol2" bgcolor="#990000"><strong><font color="#FFFFFF"><%=rsAdminResult1.getString("we")%></font></strong></td>
    <td  class="table_border_both" name="tcol3" id="tcol3" bgcolor="#990000"><strong><font color="#FFFFFF"><%=rsAdminResult1.getString("cone")%></font></strong> </td>
    <td  class="table_border_both" name="tcol4" id="tcol4" bgcolor="#990000"><strong><font color="#FFFFFF"><%=rsAdminResult1.getString("cont")%></font></strong></td>
	 <td  class="table_border_both" name="tcol5" id="tcol5" bgcolor="#990000"><strong><font color="#FFFFFF"><%=rsAdminResult1.getString("hardw")%></font></strong></td>
	 <td  class="table_border_both" name="tcol5" id="tcol5" bgcolor="#990000"><strong><font color="#FFFFFF"><%=rsAdminResult1.getString("amt")==null?"0":rsAdminResult1.getString("amt")%></font></strong></td>
    <td  class="table_border_both" name="tcol6" id="tcol6" bgcolor="#990000"><strong><font color="#FFFFFF"><%=(rsAdminResult1.getInt("amt")+rsAdminResult1.getInt("am")+rsAdminResult1.getInt("we")+rsAdminResult1.getInt("cone")+rsAdminResult1.getInt("cont")+rsAdminResult1.getInt("hardw"))%></font></strong></td>
  </tr>
  <% }
  %>
</table>

  <table  border="1"  cellspacing="0" cellpadding="0" style="border-collapse: collapse; width: 900px;">
      <center><h3>Amount Sanctioned for Senet Expenditure of Branch MSME-DIs in Financial year  <%=years%></h3></center>

      <tr>
    <td class="sno"   bgcolor="#095471"><strong><font color="#FFFFFF">S.No</font></strong></td>
    <td class="table_border_both width-td"  bgcolor="#095471" ><strong><font color="#FFFFFF">Branch MSME-DIs</font></strong></td>
    <td  class="table_border_both width-td"   name="tcol4" id="tcol4" bgcolor="#095471"><strong><font color="#FFFFFF">MSME-DIs</font></strong></td>
    <td class="table_border_both width-td"   name="tcol1" id="tcol1" bgcolor="#095471"><strong><font color="#FFFFFF">AMC</font></strong> </td>
    <td  class="table_border_both width-td"   name="tcol2" id="tcol2" bgcolor="#095471"><strong><font color="#FFFFFF">Internet Connectivity</font> </strong></td>
    <td class="table_border_both width-td"  name="tcol3" id="tcol3" bgcolor="#095471"><strong><font color="#FFFFFF">Contgs</font></strong></td>
    <td  class="table_border_both width-td"   name="tcol4" id="tcol4" bgcolor="#095471"><strong><font color="#FFFFFF">Hardware/Others</font></strong></td>
    <td  class="table_border_both width-td"   name="tcol4" id="tcol4" bgcolor="#095471"><strong><font color="#FFFFFF">Re-validation Amount</font></strong></td>

    <td class="table_border_both width-td" name="tcol6" id="tcol6" bgcolor="#095471"><strong><font color="#FFFFFF">Total</font></strong></td>
  </tr>
      <%
      int a=0, total1=0,total2=0,total3=0,total4=0,total5=0,total6=0;
      Connection conn = ConnectionManager.getConnectionDirectForMySQL();
      Statement stmt5 = (Statement)conn.createStatement();
String sql0="SELECT  * FROM tbl_di_institute, tbl_branch_target, allbranch_id where tbl_branch_target.id=allbranch_id.id and allbranch_id.inst_id= tbl_di_institute.INST_ID and year='"+years+"' order by br_name";
      ResultSet resultSet = stmt5.executeQuery(sql0);
      
      while(resultSet.next()){
          a=a+1;
          total1=total1+resultSet.getInt("amc");
          total2=total2+resultSet.getInt("internet");
          total3=total3+resultSet.getInt("contgs");
          total4=total4+resultSet.getInt("hardware");
          total6=total6+resultSet.getInt("re-validationamount");
          BranchTotal=total1+total2+total3+total4+total6;
 %>
 <tr>
     <td class="table_border_both" ><%=a%></td>
     <td class="table_border_both" ><%=resultSet.getString("br_name")%></td>
     <td class="table_border_both" ><%=resultSet.getString("INST_CITY")%></td>
     <td class="table_border_both" ><%=resultSet.getString("amc")%></td>
     <td class="table_border_both" ><%=resultSet.getString("internet")%></td>
     <td class="table_border_both" ><%=resultSet.getString("contgs")%></td>
     <td class="table_border_both" ><%=resultSet.getString("hardware")%></td>
     <td class="table_border_both" ><%=resultSet.getString("re-validationamount")%></td>
     <td class="table_border_both" ><%=resultSet.getInt("re-validationamount")+resultSet.getInt("hardware")+resultSet.getInt("contgs")+resultSet.getInt("internet")+resultSet.getInt("amc")%></td>
 </tr>
 <%}%>
 <tr>
     <strong>
         <td  class="table_border_both" bgcolor="#990000"></td>
         <td  colspan="2" class="table_border_both" bgcolor="#990000"><strong><font color="#FFFFFF">Total</font></strong></td>
          <td  class="table_border_both" name="tcol1" id="tcol1" bgcolor="#990000"> <strong><font color="#FFFFFF"><%=total1%></font></strong></td>
          <td  class="table_border_both" name="tcol1" id="tcol1" bgcolor="#990000"> <strong><font color="#FFFFFF"><%=total2%></font></strong></td>
          <td  class="table_border_both" name="tcol1" id="tcol1" bgcolor="#990000"> <strong><font color="#FFFFFF"><%=total3%></font></strong></td>
          <td  class="table_border_both" name="tcol1" id="tcol1" bgcolor="#990000"> <strong><font color="#FFFFFF"><%=total4%></font></strong></td>
          <td  class="table_border_both" name="tcol1" id="tcol1" bgcolor="#990000"> <strong><font color="#FFFFFF"><%=total6%></font></strong></td>
          <td class="table_border_both" name="tcol1" id="tcol1" bgcolor="#990000"> <strong><font color="#FFFFFF"><%=BranchTotal%></font></strong></td>
          
     </strong>
  
 </tr> <br/>
  </table>
          <table>
          <tr>
              <td colspan="9" style=" border: none">
                  Total Sanction Amount to MSME-DIs & Branch MSME-DIs =&nbsp; <b><img src="rupee.png" width="10" height="10"/>&nbsp;<%=di_Total+BranchTotal%></b>
              </td>
          </tr>
  </table>
     

<center><form><input type="button" value=" Print"
onclick="window.print();return false;" /></form></center>
 <% 
}      else {%>
 <jsp:forward page="stat.jsp"></jsp:forward>
  <% }%>
  <%
  } else
			{response.sendRedirect("stat.jsp");
			%>

			<% }

			%>
			<% } else {
    response.sendRedirect("/toolroom1/stat.jsp");
}

 %>

</body>
</html>

