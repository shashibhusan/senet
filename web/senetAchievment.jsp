<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*,java.util.*" %>
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

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
</head>

<body onload="calculateSum()">
<%
int icnt=1;
String NotIn="";

// shashi Ends

String Random5=(String)session.getAttribute("Random5");
String mnm = request.getParameter("mnm");
if(Random5.equals(mnm))
{


	String intid=(String)session.getAttribute("ins");
	String role=(String)session.getAttribute("rol");
	System.out.println("inst id is valid ======="+intid);
	System.out.println("inst id is valid ======="+role);
	
	 if(intid!=null && intid!=""  ){
			
			
			
		
		%>	


	<%

	String years =request.getParameter("cmbYear");
	String months = request.getParameter("cmbMonth");
	System.out.println(years);
	System.out.println(months);
	if (months.matches("[0-9]+") && (years.length()== 9) && (years.substring(0, 1).matches("[0-9]"))) {
	System.out.println("pattern matches");
	//String years ="2010";
	//String months = "APRIL";
	int buttonFlag=0;
	ResultSet rsAdminResult = null;
	ResultSet rsAdminResult1 = null;
		Connection con = null;
	    // Statement stmt = null;
		// String userDate=months+"-"+years;
		CallableStatement stmt = null;
		 Statement stmt1 = null;
		
	     con = ConnectionManager.getConnectionDirectForMySQL();
              stmt1 = (Statement)con.createStatement();
              
	    // stmt = (Statement)con.createStatement();
		Statement stmt4 = (Statement)con.createStatement();
		
String sql = "call proc_senet_mpr (?,?)";
				System.out.println(sql);
				stmt = con.prepareCall(sql);
				
				stmt.setString(1, years);
				stmt.setString(2, months);
				
rsAdminResult = stmt.executeQuery();

%>
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
<center><h3>Senet Expenditure of MSME-DIs  up to the Months  <%=rs_month.getString("mon")%> , Year -<%=years%></h3></center>
<table width="90%"  class="sortable" id="anyid" height="49" border="1" align="center">
  <tr>
    <td width="33" rowspan="2" class="table_border_both" bgcolor="#095471"><font color="#FFFFFF">S.No</font></td>
    <td width="87" rowspan="2"class="table_border_both" bgcolor="#095471"><div align="center"><font color="#FFFFFF">MSME-DIs</font></div></td>
    <td colspan="3" class="table_border_both" name="tcol1" id="tcol1" bgcolor="#095471"><div align="center" ><font color="#FFFFFF">AMC of PCs UPS,Batteries</font> </div></td>
    <td colspan="3" class="table_border_both" name="tcol2" id="tcol2" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Web. Maint.</font> </div></td>
    <td colspan="3" class="table_border_both" name="tcol3" id="tcol3" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Internet Connectivity </font></div></td>
	 <td colspan="3" class="table_border_both" name="tcol4" id="tcol4" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Contgs</font></div></td>
     <td colspan="3" class="table_border_both" name="tcol5" id="tcol5" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Hardware/Software</font></div></td>
	  <td colspan="3" class="table_border_both" name="tcol6" id="tcol6" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Total</font></div></td>
  </tr>
    
       <tr>
	   
         <td width="82" class="table_border_both" name="tcol1" id="tcol1" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Amt.Sanction</font></div></td>
      
         <td width="53" class="table_border_both" name="tcol1" id="tcol1" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Exp.</font></div></td>
		    <td width="53" class="table_border_both" name="tcol1" id="tcol1" bgcolor="#095471"><font color="#FFFFFF">Balance</font></td>
         <td width="82" class="table_border_both" name="tcol2" id="tcol2" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Amt.Sanction</font></div></td>
         
         <td width="37" class="table_border_both" name="tcol2" id="tcol2" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Exp.</font></div></td>
		 <td width="37" class="table_border_both" name="tcol2" id="tcol2" bgcolor="#095471"><font color="#FFFFFF">Balance</font></td>
         <td width="86" class="table_border_both" name="tcol3" id="tcol3" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Amt.Sanction</font></div></td>
         
         <td width="32" class="table_border_both" name="tcol3" id="tcol3" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Exp.</font></div></td>
		 <td width="32" class="table_border_both" name="tcol3" id="tcol3" bgcolor="#095471"><font color="#FFFFFF">Balance</font></td>
         <td width="84" class="table_border_both" name="tcol4" id="tcol4" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Amt.Sanction</font></div></td>
        
         <td width="32" class="table_border_both" name="tcol4" id="tcol4" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Exp.</font></div></td>
		  <td width="32" class="table_border_both" name="tcol4" id="tcol4" bgcolor="#095471"><font color="#FFFFFF">Balance</font></td>
         <td width="82" class="table_border_both" name="tcol5" id="tcol5" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Amt.Sanction</font></div></td>
     
         <td width="32" class="table_border_both" name="tcol5" id="tcol5" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Exp.</font></div></td>
		     <td width="32" class="table_border_both" name="tcol5" id="tcol5" bgcolor="#095471"><font color="#FFFFFF">Balance</font></td>
		   <td width="82" class="table_border_both" name="tcol6" id="tcol6" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Amt.Sanction</font></div></td>
        
         <td width="37" class="table_border_both" name="tcol6" id="tcol6" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Exp.</font></div></td>
		    <td width="37" class="table_border_both" name="tcol6" id="tcol6" bgcolor="#095471"><font color="#FFFFFF">Balance</font></td>
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
	<td class="table_border_both" ><%=rsAdminResult.getString("INST_CITY")%></td>
   
    <td class="table_border_both" name="tcol1" id="tcol1"> 
	<input class="txt" type="hidden" name="txt" value='<%=rsAdminResult.getString("AMC_of_pc1")%>'/>
	<%=rsAdminResult.getString("AMC_of_pc1")%>
	</td>
	
	<td class="table_border_both" name="tcol1" id="tcol1">
	<input class="txt1" type="hidden" name="txt1" value='<%=rsAdminResult.getString("AMC")%>'/>
	<%=rsAdminResult.getString("AMC")%>
	
	</td>
	
	
	<td class="table_border_both" name="tcol1" id="tcol1">
	<input class="txt2" type="hidden" name="txt2" value='<%=(rsAdminResult.getInt("AMC_of_pc1")- rsAdminResult.getInt("AMC"))%>'/>
	<%=(rsAdminResult.getInt("AMC_of_pc1")- rsAdminResult.getInt("AMC"))%>
	
	</td>
	
	<td class="table_border_both" name="tcol1" id="tcol1">
	<input class="txt3" type="hidden" name="txt3" value='<%=rsAdminResult.getString("web1")%>'/>
	<%=rsAdminResult.getString("web1")%>
	
	</td>
	
	<td class="table_border_both" name="tcol1" id="tcol1">
	<input class="txt5" type="hidden" name="txt5" value='<%=rsAdminResult.getString("webmaint")%>'/>
	<%=rsAdminResult.getString("webmaint")%>
	
	</td>
	
	<td class="table_border_both" name="tcol1" id="tcol1">
	<input class="txt6" type="hidden" name="txt6" value='<%=(rsAdminResult.getInt("web1")- rsAdminResult.getInt("webmaint"))%>'/>
	<%=(rsAdminResult.getInt("web1")- rsAdminResult.getInt("webmaint"))%>
	
	</td>
	<td class="table_border_both" name="tcol1" id="tcol1">
	<input class="txt7" type="hidden" name="txt7" value='<%=rsAdminResult.getString("Connectivity1")%>'/>
	<%=rsAdminResult.getString("Connectivity1")%>
	
	</td>
	
	
	<td class="table_border_both" name="tcol1" id="tcol1">
	<input class="txt8" type="hidden" name="txt8" value='<%=rsAdminResult.getString("Connect")%>'/>
	<%=rsAdminResult.getString("Connect")%>
	
	</td>
	
	<td class="table_border_both" name="tcol1" id="tcol1">
	<input class="txt9" type="hidden" name="txt9" value='<%=(rsAdminResult.getInt("Connectivity1")- rsAdminResult.getInt("Connect"))%>'/>
	<%=(rsAdminResult.getInt("Connectivity1")- rsAdminResult.getInt("Connect"))%>
	
	</td>
	
	<td class="table_border_both" name="tcol1" id="tcol1">
	<input class="txt10" type="hidden" name="txt10" value='<%=rsAdminResult.getString("Contg1")%>'/>
	<%=rsAdminResult.getString("Contg1")%>
	
	</td>
 <td class="table_border_both" name="tcol1" id="tcol1">
	<input class="txt11" type="hidden" name="txt11" value='<%=rsAdminResult.getString("Contginus")%>'/>
	<%=rsAdminResult.getString("Contginus")%>
	
	</td>
	<td class="table_border_both" name="tcol1" id="tcol1">
	<input class="txt12" type="hidden" name="txt12" value='<%=(rsAdminResult.getInt("Contg1")- rsAdminResult.getInt("Contginus"))%>'/>
	<%=(rsAdminResult.getInt("Contg1")- rsAdminResult.getInt("Contginus"))%>
	
	</td>
	
	<td class="table_border_both" name="tcol1" id="tcol1">
	<input class="txt13" type="hidden" name="txt13" value='<%=rsAdminResult.getString("Others1")%>'/>
	<%=rsAdminResult.getString("Others1")%>
	
	</td>
	<td class="table_border_both" name="tcol1" id="tcol1">
	<input class="txt14" type="hidden" name="txt14" value='<%=rsAdminResult.getString("Othershardware")%>'/>
	<%=rsAdminResult.getString("Othershardware")%>
	
	</td>
	<td class="table_border_both" name="tcol1" id="tcol1">
	<input class="txt15" type="hidden" name="txt15" value='<%=(rsAdminResult.getInt("Others1")- rsAdminResult.getInt("Othershardware"))%>'/>
	<%=(rsAdminResult.getInt("Others1")- rsAdminResult.getInt("Othershardware"))%>
	
	</td>
	
	<td class="table_border_both" name="tcol1" id="tcol1">
	<input class="txt16" type="hidden" name="txt16" value='<%=(rsAdminResult.getInt("AMC_of_pc1")+rsAdminResult.getInt("web1")+rsAdminResult.getInt("Connectivity1")+rsAdminResult.getInt("Contg1")+rsAdminResult.getInt("Others1"))%>'/>
	<%=(rsAdminResult.getInt("AMC_of_pc1")+rsAdminResult.getInt("web1")+rsAdminResult.getInt("Connectivity1")+rsAdminResult.getInt("Contg1")+rsAdminResult.getInt("Others1"))%>
	
	</td>
	
	<td class="table_border_both" name="tcol1" id="tcol1">
	<input class="txt17" type="hidden" name="txt17" value='<%=(rsAdminResult.getInt("AMC")+rsAdminResult.getInt("webmaint")+rsAdminResult.getInt("Connect")+rsAdminResult.getInt("Contginus")+rsAdminResult.getInt("Othershardware"))%>'/>
	<%=(rsAdminResult.getInt("AMC")+rsAdminResult.getInt("webmaint")+rsAdminResult.getInt("Connect")+rsAdminResult.getInt("Contginus")+rsAdminResult.getInt("Othershardware"))%>
	
	</td>
	
	<td class="table_border_both" name="tcol1" id="tcol1">
	<input class="txt18" type="hidden" name="txt18" value='<%=((rsAdminResult.getInt("AMC_of_pc1")+rsAdminResult.getInt("web1")+rsAdminResult.getInt("Connectivity1")+rsAdminResult.getInt("Contg1")+rsAdminResult.getInt("Others1"))- (rsAdminResult.getInt("AMC")+rsAdminResult.getInt("webmaint")+rsAdminResult.getInt("Connect")+rsAdminResult.getInt("Contginus")+rsAdminResult.getInt("Othershardware")))%>'/>
	<%=((rsAdminResult.getInt("AMC_of_pc1")+rsAdminResult.getInt("web1")+rsAdminResult.getInt("Connectivity1")+rsAdminResult.getInt("Contg1")+rsAdminResult.getInt("Others1"))- (rsAdminResult.getInt("AMC")+rsAdminResult.getInt("webmaint")+rsAdminResult.getInt("Connect")+rsAdminResult.getInt("Contginus")+rsAdminResult.getInt("Othershardware")))%>
	
	</td>
  </tr>
  <% 
  NotIn=  NotIn.concat("'"+rsAdminResult.getString("INST_CITY")+"'"+",");
              }
   }
else
{
  NotIn="'"+"NotIn"+"''";
}
  %>
       <%
        NotIn=NotIn.substring(0, NotIn.length()-1);
        String query="select name from TotalInst where name not in ("+NotIn+") order by name;";
       System.out.println("*************"+query);
       rsAdminResult1=stmt1.executeQuery(query);
       if(rsAdminResult1.next())
           {
           rsAdminResult1.beforeFirst();
while(rsAdminResult1.next())
{
%>

<tr>			
    <td class="table_border_both" ><%=icnt%></td>
    <td class="table_border_both" ><font color="red" size="3px">*</font><%=rsAdminResult1.getString("name")%></td>
        <td class="table_border_both" >0</td>
	<td class="table_border_both" >0</td>
	<td class="table_border_both" >0</td>
	<td class="table_border_both" >0</td>
	<td class="table_border_both" >0</td>
	<td class="table_border_both" >0</td>
	<td class="table_border_both" >0</td>
	<td class="table_border_both" >0</td>
	<td class="table_border_both" >0</td>
	<td class="table_border_both" >0</td>
        <td class="table_border_both" >0</td>
	<td class="table_border_both" >0</td>
	<td class="table_border_both" >0</td>
	<td class="table_border_both" >0</td>
	<td class="table_border_both" >0</td>
	<td class="table_border_both" >0</td>
	<td class="table_border_both" >0</td>
	<td class="table_border_both" >0</td>
  </tr>

  <%
  icnt++;
}
     %>
<div align="center" style="font-size:11px;font-family:Verdana;font-weight:bold"><font color="red">
        <font color="red" size="3px">*</font> :-No record is found for this MSME-DI.
                    </font>
                </div>
<% } %>
  <tr>			
    <td class="table_border_both" ></td>
	<td class="table_border_both" >Total</td>
   
    <td class="table_border_both" ><span id="sum">0</span></td>
	<td class="table_border_both" name="tcol1" id="tcol1"><span id="sum1">0</span></td>
	<td class="table_border_both" name="tcol1" id="tcol1"><span id="sum2">0</span></td>
	
   <td class="table_border_both" name="tcol1" id="tcol1"><span id="sum3">0</span></td>
	<td class="table_border_both" name="tcol1" id="tcol1"><span id="sum5">0</span></td>
	<td class="table_border_both" name="tcol1" id="tcol1"><span id="sum6">0</span></td>
	
   <td class="table_border_both" name="tcol1" id="tcol1"><span id="sum7">0</span></td>
	<td class="table_border_both" name="tcol1" id="tcol1"><span id="sum8">0</span></td>
	<td class="table_border_both" name="tcol1" id="tcol1"><span id="sum9">0</span></td>
	
	
   <td class="table_border_both" name="tcol1" id="tcol1"><span id="sum10">0</span></td>
	<td class="table_border_both" name="tcol1" id="tcol1"><span id="sum11">0</span></td>
	<td class="table_border_both" name="tcol1" id="tcol1"><span id="sum12">0</span></td>
	
	<td class="table_border_both" name="tcol1" id="tcol1"><span id="sum13">0</span></td>
	<td class="table_border_both" name="tcol1" id="tcol1"><span id="sum14">0</span></td>
	<td class="table_border_both" name="tcol1" id="tcol1"><span id="sum15">0</span></td>
	
	
	<td class="table_border_both" name="tcol1" id="tcol1"><span id="sum16">0</span></td>
	<td class="table_border_both" name="tcol1" id="tcol1"><span id="sum17">0</span></td>
	<td class="table_border_both" name="tcol1" id="tcol1"><span id="sum18">0</span></td>
  </tr>

</table>
<script>
   
 
    function calculateSum() {
 
        var sum1 = 0;
        //iterate through each textboxes and add the values
        $(".txt1").each(function() {
 
            //add only if the value is number
            if(!isNaN(this.value) && this.value.length!=0) {
                sum1 += parseFloat(this.value);
            }
 
        });
        //.toFixed() method will roundoff the final sum1 to 2 decimal places
        $("#sum1").html(sum1.toFixed(2));
		
		
		
		
		
		
		  var sum = 0;
        //iterate through each textboxes and add the values
        $(".txt").each(function() {
 
            //add only if the value is number
            if(!isNaN(this.value) && this.value.length!=0) {
                sum += parseFloat(this.value);
            }
 
        });
        //.toFixed() method will roundoff the final sum to 2 decimal places
        $("#sum").html(sum.toFixed(2));
		
		
		
		
		
		 var sum2 = 0;
        //iterate through each textboxes and add the values
        $(".txt2").each(function() {
 
            //add only if the value is number
            if(!isNaN(this.value) && this.value.length!=0) {
                sum2 += parseFloat(this.value);
            }
 
        });
        //.toFixed() method will roundoff the final sum2 to 2 decimal places
        $("#sum2").html(sum2.toFixed(2));
		
		
		
		 var sum3 = 0;
        //iterate through each textboxes and add the values
        $(".txt3").each(function() {
 
            //add only if the value is number
            if(!isNaN(this.value) && this.value.length!=0) {
                sum3 += parseFloat(this.value);
            }
 
        });
        //.toFixed() method will roundoff the final sum3 to 2 decimal places
        $("#sum3").html(sum3.toFixed(2));
		
		
		
		
		
		 var sum4 = 0;
        //iterate through each textboxes and add the values
        $(".txt4").each(function() {
 
            //add only if the value is number
            if(!isNaN(this.value) && this.value.length!=0) {
                sum4 += parseFloat(this.value);
            }
 
        });
        //.toFixed() method will roundoff the final sum4 to 2 decimal places
        $("#sum4").html(sum4.toFixed(2));
		
		 var sum5 = 0;
        //iterate through each textboxes and add the values
        $(".txt5").each(function() {
 
            //add only if the value is number
            if(!isNaN(this.value) && this.value.length!=0) {
                sum5 += parseFloat(this.value);
            }
 
        });
        //.toFixed() method will roundoff the final sum5 to 2 decimal places
        $("#sum5").html(sum5.toFixed(2));
		
		 var sum6 = 0;
        //iterate through each textboxes and add the values
        $(".txt6").each(function() {
 
            //add only if the value is number
            if(!isNaN(this.value) && this.value.length!=0) {
                sum6 += parseFloat(this.value);
            }
 
        });
        //.toFixed() method will roundoff the final sum6 to 2 decimal places
        $("#sum6").html(sum6.toFixed(2));
		
		
		 var sum7 = 0;
        //iterate through each textboxes and add the values
        $(".txt7").each(function() {
 
            //add only if the value is number
            if(!isNaN(this.value) && this.value.length!=0) {
                sum7 += parseFloat(this.value);
            }
 
        });
        //.toFixed() method will roundoff the final sum7 to 2 decimal places
        $("#sum7").html(sum7.toFixed(2));
		
		
		 var sum8 = 0;
        //iterate through each textboxes and add the values
        $(".txt8").each(function() {
 
            //add only if the value is number
            if(!isNaN(this.value) && this.value.length!=0) {
                sum8 += parseFloat(this.value);
            }
 
        });
        //.toFixed() method will roundoff the final sum8 to 2 decimal places
        $("#sum8").html(sum8.toFixed(2));
		
		
		 var sum9 = 0;
        //iterate through each textboxes and add the values
        $(".txt9").each(function() {
 
            //add only if the value is number
            if(!isNaN(this.value) && this.value.length!=0) {
                sum9 += parseFloat(this.value);
            }
 
        });
        //.toFixed() method will roundoff the final sum9 to 2 decimal places
        $("#sum9").html(sum9.toFixed(2));
		
		
		
		 var sum10 = 0;
        //iterate through each textboxes and add the values
        $(".txt10").each(function() {
 
            //add only if the value is number
            if(!isNaN(this.value) && this.value.length!=0) {
                sum10 += parseFloat(this.value);
            }
 
        });
        //.toFixed() method will roundoff the final sum10 to 2 decimal places
        $("#sum10").html(sum10.toFixed(2));
		
		
		 var sum11 = 0;
        //iterate through each textboxes and add the values
        $(".txt11").each(function() {
 
            //add only if the value is number
            if(!isNaN(this.value) && this.value.length!=0) {
                sum11 += parseFloat(this.value);
            }
 
        });
        //.toFixed() method will roundoff the final sum11 to 2 decimal places
        $("#sum11").html(sum11.toFixed(2));
		
		
		 var sum12 = 0;
        //iterate through each textboxes and add the values
        $(".txt12").each(function() {
 
            //add only if the value is number
            if(!isNaN(this.value) && this.value.length!=0) {
                sum12 += parseFloat(this.value);
            }
 
        });
        //.toFixed() method will roundoff the final sum12 to 2 decimal places
        $("#sum12").html(sum12.toFixed(2));
		
		
		 var sum13 = 0;
        //iterate through each textboxes and add the values
        $(".txt13").each(function() {
 
            //add only if the value is number
            if(!isNaN(this.value) && this.value.length!=0) {
                sum13 += parseFloat(this.value);
            }
 
        });
        //.toFixed() method will roundoff the final sum13 to 2 decimal places
        $("#sum13").html(sum13.toFixed(2));
		
		 var sum14 = 0;
        //iterate through each textboxes and add the values
        $(".txt14").each(function() {
 
            //add only if the value is number
            if(!isNaN(this.value) && this.value.length!=0) {
                sum14 += parseFloat(this.value);
            }
 
        });
        //.toFixed() method will roundoff the final sum14 to 2 decimal places
        $("#sum14").html(sum14.toFixed(2));
		
		 var sum15 = 0;
        //iterate through each textboxes and add the values
        $(".txt15").each(function() {
 
            //add only if the value is number
            if(!isNaN(this.value) && this.value.length!=0) {
                sum15 += parseFloat(this.value);
            }
 
        });
        //.toFixed() method will roundoff the final sum15 to 2 decimal places
        $("#sum15").html(sum15.toFixed(2));
		

		var sum16 = 0;
        //iterate through each textboxes and add the values
        $(".txt16").each(function() {
 
            //add only if the value is number
            if(!isNaN(this.value) && this.value.length!=0) {
                sum16 += parseFloat(this.value);
            }
 
        });
        //.toFixed() method will roundoff the final sum16 to 2 decimal places
        $("#sum16").html(sum16.toFixed(2));
		
		
		
		
		 var sum17 = 0;
        //iterate through each textboxes and add the values
        $(".txt17").each(function() {
 
            //add only if the value is number
            if(!isNaN(this.value) && this.value.length!=0) {
                sum17 += parseFloat(this.value);
            }
 
        });
        //.toFixed() method will roundoff the final sum17 to 2 decimal places
        $("#sum17").html(sum17.toFixed(2));
		
		 var sum18 = 0;
        //iterate through each textboxes and add the values
        $(".txt18").each(function() {
 
            //add only if the value is number
            if(!isNaN(this.value) && this.value.length!=0) {
                sum18 += parseFloat(this.value);
            }
 
        });
        //.toFixed() method will roundoff the final sum18 to 2 decimal places
        $("#sum18").html(sum18.toFixed(2));
    }
</script>
  <center><form><input type="button" value=" Print"
onclick="window.print();return false;" /></form></center>

 <% } else {%>
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
