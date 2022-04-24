<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<title>Branch report</title>
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

</style>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
</head>

<body onload="calculateSum()">
<%
 int total0=0;int total1=0;int total2=0;int total3=0;int total4=0;int total5=0;
    int total6=0;int total7=0;int total8=0;int total9=0;int total10=0;int total11=0;
int icnt=1; int total20=0; int total21=0;
String NotIn="";

// shashi Ends
 String printValue="";
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

	String years =request.getParameter("cmbYear1");
	String months = request.getParameter("cmbMonth1");

         System.out.println("the size of the years set will be: "+years);
          System.out.println("the size of the months set will be: "+months);

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

		 Statement stmt1 = null;
		
	     con = ConnectionManager.getConnectionDirectForMySQL();
              stmt1 = (Statement)con.createStatement();
              
	    // stmt = (Statement)con.createStatement();
		Statement stmt4 = (Statement)con.createStatement();
		Statement stmt5 = (Statement)con.createStatement();
String sql = "select branch_name,MSME_NAME,Br_hardware_target,Br_hardware_tomonth,sum(Br_hardware_tomonth) as Br_hardware_upto,Br_con_target,Br_con_tomonth,sum(Br_con_tomonth) as Br_con_upto,Br_contg_target,Br_contg_tomonth, sum(Br_contg_tomonth) as Br_contg_upto,Br_others_target,Br_others_tomonth,sum(Br_others_tomonth) as Br_others_upto from Branch where  months >=1 AND months <="+months+" and years='"+years+"' group by branch_name";
			 
System.out.println("the query that is going to fire will be : "+sql);
try
        {
rsAdminResult = stmt5.executeQuery(sql);
}catch(Exception e)
        {
System.out.println("Exception occurs+++++++++++++++ : "+e);
    }

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
<center><h3>Branch-wise Expenditure up to the Months  <%=rs_month.getString("mon")%> , Year -<%=years%></h3></center>
<table width="90%"  class="sortable" id="anyid" height="49" border="1" align="center">
  <tr>
    <td width="10" rowspan="2" class="table_border_both" bgcolor="#095471"><font color="#FFFFFF">S.No</font></td>
    <td width="30" rowspan="2"class="table_border_both" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Branch Name</font></div></td>
    <td colspan="3" class="table_border_both" name="tcol1" id="tcol1" bgcolor="#095471"><div align="center" ><font color="#FFFFFF">AMC</font> </div></td>
    <td colspan="3" class="table_border_both" name="tcol3" id="tcol3" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Internet Connectivity </font></div></td>
	 <td colspan="3" class="table_border_both" name="tcol4" id="tcol4" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Contgs</font></div></td>
     <td colspan="3" class="table_border_both" name="tcol5" id="tcol5" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Hardware/Software</font></div></td>
     <td colspan="2" class="table_border_both" name="tcol5" id="tcol5" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Total</font></div></td>
  </tr>
    
       <tr>
	   
         <td width="70" class="table_border_both" name="tcol1" id="tcol1" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Amt.Sanction</font></div></td>
      
         <td width="43" class="table_border_both" name="tcol1" id="tcol1" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Exp.durring month</font></div></td>
		    <td width="53" class="table_border_both" name="tcol1" id="tcol1" bgcolor="#095471"><font color="#FFFFFF">Exp.up to the month</font></td>
         <td width="70" class="table_border_both" name="tcol2" id="tcol2" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Amt.Sanction</font></div></td>
         
         <td width="37" class="table_border_both" name="tcol2" id="tcol2" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Exp.durring month</font></div></td>
		 <td width="37" class="table_border_both" name="tcol2" id="tcol2" bgcolor="#095471"><font color="#FFFFFF">Exp.up to the month</font></td>
         <td width="76" class="table_border_both" name="tcol3" id="tcol3" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Amt.Sanction</font></div></td>
         
         <td width="32" class="table_border_both" name="tcol3" id="tcol3" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Exp.durring month</font></div></td>
		 <td width="32" class="table_border_both" name="tcol3" id="tcol3" bgcolor="#095471"><font color="#FFFFFF">Exp.up to the month</font></td>
         <td width="74" class="table_border_both" name="tcol4" id="tcol4" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Amt.Sanction</font></div></td>
        
         <td width="32" class="table_border_both" name="tcol4" id="tcol4" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Exp.durring month</font></div></td>
		  <td width="32" class="table_border_both" name="tcol4" id="tcol4" bgcolor="#095471"><font color="#FFFFFF">Exp.up to the month</font></td>
                  <%--  Raghavendra   --%>
                  <td width="74" class="table_border_both" name="tcol4" id="tcol4" bgcolor="#095471"><div align="center"><font color="#FFFFFF">Amt.Sanction</font></div></td>
                  <td width="50" class="table_border_both" name="tcol4" id="tcol4" bgcolor="#095471"><font color="#FFFFFF">Exp.up to the month</font></td>
                       <%-- End Raghavendra   --%>
       </tr>

	      <%
             
if(rsAdminResult.next())
    {
    String nameList="";
     rsAdminResult.beforeFirst();
  for(icnt=1;rsAdminResult.next();icnt++)
{
    nameList=nameList.concat("'"+rsAdminResult.getString("branch_name")+"',");
      total0=total0+(rsAdminResult.getInt("Br_hardware_target"));
      total1=total1+(rsAdminResult.getInt("Br_hardware_tomonth"));
      total2=total2+(rsAdminResult.getInt("Br_hardware_upto"));
      total3=total3+(rsAdminResult.getInt("Br_con_target"));
      total4=total4+(rsAdminResult.getInt("Br_con_tomonth"));
      total5=total5+(rsAdminResult.getInt("Br_con_upto"));
      total6=total6+(rsAdminResult.getInt("Br_contg_target"));
      total7=total7+(rsAdminResult.getInt("Br_contg_tomonth"));
      total8=total8+(rsAdminResult.getInt("Br_contg_upto"));
      total9=total9+(rsAdminResult.getInt("Br_others_target"));
      total10=total10+(rsAdminResult.getInt("Br_others_tomonth"));
      total11=total11+(rsAdminResult.getInt("Br_others_upto"));
      total20=(total0+total3+total6+total9);
      total21=(total2+total5+total8+total11);
      System.out.println("+++nameList+++++"+nameList);
      try{
%>
  <tr>

        <td class="table_border_both" ><%=icnt%></td>
        <td class="table_border_both" ><b><%=rsAdminResult.getString("branch_name")%>/<%=rsAdminResult.getString("MSME_NAME")%></b></td>
	<td class="table_border_both" ><%=rsAdminResult.getInt("Br_hardware_target")%></td>
        <td class="table_border_both" ><%=rsAdminResult.getInt("Br_hardware_tomonth")%></td>
        <td class="table_border_both" ><%=rsAdminResult.getInt("Br_hardware_upto")%></td>
	<td class="table_border_both" ><%=rsAdminResult.getInt("Br_con_target")%></td>
	<td class="table_border_both" ><%=rsAdminResult.getInt("Br_con_tomonth")%></td>
	<td class="table_border_both" ><%=(rsAdminResult.getInt("Br_con_upto"))%></td>
	<td class="table_border_both" ><%=rsAdminResult.getInt("Br_contg_target")%></td>
	<td class="table_border_both" ><%=rsAdminResult.getInt("Br_contg_tomonth")%></td>
	<td class="table_border_both" ><%=(rsAdminResult.getInt("Br_contg_upto"))%></td>
	<td class="table_border_both" ><%=rsAdminResult.getInt("Br_others_target")%></td>
	<td class="table_border_both" ><%=rsAdminResult.getInt("Br_others_tomonth")%></td>
        <td class="table_border_both" ><%=(rsAdminResult.getInt("Br_others_upto"))%></td>
        <td class="table_border_both" ><%=((rsAdminResult.getInt("Br_hardware_target"))+(rsAdminResult.getInt("Br_con_target"))+(rsAdminResult.getInt("Br_contg_target"))+(rsAdminResult.getInt("Br_others_target")))%></td>
        <td class="table_border_both" ><%=((rsAdminResult.getInt("Br_hardware_upto"))+(rsAdminResult.getInt("Br_con_upto"))+(rsAdminResult.getInt("Br_contg_upto"))+(rsAdminResult.getInt("Br_others_upto")))%></td>

	 
  </tr>
  <% 
  }catch(Exception e)
          {
      System.out.println("+++error+++++"+e);
      }
              }
     try{
     String query="select * from all_branch_list where name not in"+"("+nameList.substring(0,(nameList.length()-1))+")";
     System.out.println("Query that is going to fire is : "+query);
     rsAdminResult1 = stmt5.executeQuery(query);
     if(rsAdminResult1.next())
    {
     rsAdminResult1.beforeFirst();
    
  for(icnt=1;rsAdminResult1.next();icnt++)
   {
printValue=printValue.concat(rsAdminResult1.getString("name")+"/"+rsAdminResult1.getString("state")+"  ,  ");
  
   }
     con.close();
     }
     else
         {
         
         }
     }
     catch(Exception e)
             {
          System.out.println("+++following error occurs+++++"+e);
         }
   }
else
    {
%>
<tr>
    <td class="table_border_both" colspan="16"><h3><center>There is no entry for this month</center></h3></td>
</tr>
<%}%>
<%if(printValue.length()>4)
            {
            %>
  <tr>			
    <td class="table_border_both" ></td>
	<td class="table_border_both" >Total</td>
   
        <td class="table_border_both" name="tcol1" id="tcol1"><span><%=total0%></span></td>
	<td class="table_border_both" name="tcol1" id="tcol1"><span><%=total1%></span></td>
	
   <td class="table_border_both" name="tcol1" id="tcol1"><span><%=total2%></span></td>
	<td class="table_border_both" name="tcol1" id="tcol1"><span><%=total3%></span></td>
	<td class="table_border_both" name="tcol1" id="tcol1"><span><%=total4%></span></td>
	
   <td class="table_border_both" name="tcol1" id="tcol1"><span><%=total5%></span></td>
	<td class="table_border_both" name="tcol1" id="tcol1"><span><%=total6%></span></td>
	<td class="table_border_both" name="tcol1" id="tcol1"><span><%=total7%></span></td>
	
	
   <td class="table_border_both" name="tcol1" id="tcol1"><span><%=total8%></span></td>
	<td class="table_border_both" name="tcol1" id="tcol1"><span><%=total9%></span></td>
	<td class="table_border_both" name="tcol1" id="tcol1"><span><%=total10%></span></td>
	<td class="table_border_both" ><span><%=total11%></span></td>

        <td class="table_border_both" name="tcol1" id="tcol1"><span><%=total20%></span></td>
        <td class="table_border_both" name="tcol1" id="tcol1"><span><%=total21%></span></td>
  </tr>
        
  <tr>
      <td colspan="16" class="table_border_both">
          <b> List of  branches having pending entry for this month :-</b>
      </td>
  </tr>
  <tr>
      <td colspan="16" class="table_border_both" style="color: red"> <%=printValue.substring(0,(printValue.length()-2))%> </td>

  </tr>
<%}%>
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
