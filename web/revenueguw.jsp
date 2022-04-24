<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="inb.css" rel="stylesheet" type="text/css">

<script>

function fnTotal(obj1,obj2,obj3,obj4,obj5,obj6,obj7,obj8,obj9,obj10,obj11,obj12,obj13,obj14,obj15,obj16,obj17,obj18){
	// sc_dtm  st_dtm wmn_dtm obc_dtm ph_dtm min_dtm total_dtm
	var temp;
	var target1=Number(obj1.value);
	var target2=Number(obj2.value);
	var target3=Number(obj3.value);
	var target4=Number(obj4.value);
	var target5=Number(obj5.value);
	var target6=Number(obj6.value);
	var target7=Number(obj7.value);
	var target8=Number(obj8.value);
	var target9=Number(obj9.value);
	var target10=Number(obj10.value);
	var target11=Number(obj11.value);
	var target12=Number(obj12.value);
	var target13=Number(obj13.value);
	var target14=Number(obj14.value);
	var target15=Number(obj15.value);
	var target16=Number(obj16.value);
	var target17=Number(obj17.value);
	
	temp=target1+target2+target3+target4+target5+target6+target7+target8+target9+target10+target11+target12+target13+target14+target15+target16+target17;
	obj18.value=temp.toFixed(2);
}
function fnSum(vDTM,vQCUM,vCUM){
var tmp;
//alert('Sum ');
	if(vDTM!=''){
		tmp = Number(vQCUM)+ Number(vDTM);	
		vCUM.value =tmp.toFixed(2);
	}
	
	
}

function pageReload(){
	location.reload(true);
}

function show_confirm()
{
var r=confirm("Are You Sure!");
if (r==true)
  {
  alert("Click Ok to Insert Data!");
  }
else
  {
  location.reload(true);
  }
}


function fnCalCum(vDTM,vQCUM,vCUM,vPreDTM)//o,v,o
{
 
//bud_cyfwdfrm_utz_month,bud_cyfwdfrm_utz_cumulative
	//if(isNan(vDTM.value)){
	if(vDTM.value==''){
	} 
	else{
	//vCUM.value = (eval(vQCUM)-eval(vPreDTM))+ eval(vDTM);
		//var tmp = eval(vQCUM)+eval(vDTM.value);
		var tmp = (eval(vQCUM)-eval(vPreDTM))+eval(vDTM.value);
		vCUM.value = tmp.toFixed(2);
	}
}



function formValidator(){
	var numericExpression = /^[0-9]+$/;
	var decimalExpression1=/^-?\d+(\.\d+)?$/;
	var decimalExpression=/^((\d+(\.\d*)?)|((\d*\.)?\d+))$/;	
//***********Budget */
//Carry Forward      
	if (!document.getElementById('Exp_mda').value.match(numericExpression))
      {
                 alert("Please insert numeric value in Exp_mda Field!");
                 document.getElementById('Exp_mda').focus();
                 return false;
      }
	  if (!document.getElementById('MSEs_mda').value.match(numericExpression))
      {
                 alert("Please insert numeric value in MSEs_mda Field!");
                 document.getElementById('MSEs_mda').focus();
                 return false;
      }
	  if (!document.getElementById('Exp_nmcp').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in Exp_nmcp Field!");
                 document.getElementById('Exp_nmcp').focus();
                 return false;
      }
	  if (!document.getElementById('MSEs_nmcp').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in MSEs_nmcp Field!");
                 document.getElementById('MSEs_nmcp').focus();
                 return false;
      }
	    if (!document.getElementById('Exp_nmcp_seminar').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in Exp_nmcp_seminar Field!");
                 document.getElementById('Exp_nmcp_seminar').focus();
                 return false;
      }
	  if (!document.getElementById('MSEs_nmcp_seminar').value.match(decimalExpression1))
      {
                 alert("Please insert numeric value in MSEs_nmcp_seminar Field!");
                 document.getElementById('MSEs_nmcp_seminar').focus();
                 return false;
      }
	 
	
        
	if (document.getElementById('instId').value=='')
      {
	      //instId userName months years
	      alert("Session Expired!");
				 //document.getElementById('stf_st_pos_d').focus();
				 return false;
	 }
	
	  
	alert("Are You Sure");
	  formSubmit();
}
</script>


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




String strCumulative=" SELECT sum(Common_total),sum(sale_total),sum(sdp_total),sum(edp_total),sum(mdp_total),sum(Seminar_total),sum(Capacity_total),sum(Project_total),sum(Sick_total),sum(Inplant_total),sum(NSIC_total),sum(Energy_total),sum(Surveys_total),sum(sale_publication_total),sum(Information_total),sum(others_total),sum(Accounts_total) FROM tbl_revenue where DATE_FORMAT(months/year,'%m/%Y')>=DATE_FORMAT(1/"+tYears+",'%m/%y') and user_date <='"+years+"-"+months+"-30'  and year="+tYears+" and instid='"+instId+"'";

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

<form  name="form1" id="form1" method="post" action="revenueguw_save.jsp">
<input type="hidden" size="5" name="months" value="<%=request.getParameter("months")%>" />
<input type="hidden" size="5" name="years" value="<%=request.getParameter("years")%>" />
<input type="hidden" size="5" name="instId" value="<%=request.getParameter("instId")%>" />


<table width="100%" border="0" align="center" >
  <tr>
    <td width="26" class="tableheader">S.No</td>
    <td width="163" class="tableheader">Name Of Program </td>
    <td width="55" class="tableheader">MSMEDI-Guwahati</td>
    <td width="50" class="tableheader"> Silchar </td>
    <td width="50"class="tableheader"> Shillong</td>
    <td width="50"class="tableheader"> Diphu </td>
    <td width="50"class="tableheader"> Silchar </td>
    <td width="50"class="tableheader"> Tezpur </td>
    <td width="50"class="tableheader"> Tura </td>
  </tr>
    <%if(divFlag==0){%>
  <tr>
    <td class="tablecontent11">1</td>
	
    <input type="hidden" size="5" name="h_1" value="Common facility workshop revenue" />
    <td class="tablecontent11"><span class="pink">Common facility workshop revenue </span></td>
    
	 <td class="tablecontent1"><input type="text"  value="0" name="a_1" id="a_1"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_1" id="b_1"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_1" id="c_1"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="d_1" id="d_1"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="e_1" id="e_1"size="7" /></td>  
	<td class="tablecontent1"><input type="text"  value="0" name="f_1" id="f_1"size="7" /></td>
   <td class="tablecontent1"><input type="text"  value="0" name="g_1" id="g_1"size="7" /></td>
   
  
</tr>
  <tr>
    <td class="tablecontent12">2</td>
    <input type="hidden" size="5" name="h_2" value="sale of trainee products" />
    <td class="tablecontent12"><span class="pink">sale of trainee products</span></td>
    
   	 <td class="tablecontent1"><input type="text"  value="0" name="a_2" id="a_2"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_2" id="b_2"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_2" id="c_2"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="d_2" id="d_2"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="e_2" id="e_2"size="7" /></td>  
	<td class="tablecontent1"><input type="text"  value="0" name="f_2" id="f_2"size="7" /></td>
   <td class="tablecontent1"><input type="text"  value="0" name="g_2" id="g_2"size="7" /></td>
  
  </tr>
  <tr>
    <td class="tablecontent11">3</td>
    <input type="hidden" size="5" name="h_3" value="sdp (training fee - regular courses/sdp specialized hi tech courses including cad / cam" />
   <td class="tablecontent11"><span class="pink">sdp (training fee - regular courses/sdp specialized hi tech courses including cad / cam</span></td>
    
   	 <td class="tablecontent1"><input type="text"  value="0" name="a_3" id="a_3"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_3" id="b_3"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_3" id="c_3"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="d_3" id="d_3"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="e_3" id="e_3"size="7" /></td>  
	<td class="tablecontent1"><input type="text"  value="0" name="f_3" id="f_3"size="7" /></td>
   <td class="tablecontent1"><input type="text"  value="0" name="g_3" id="g_3"size="7" /></td>
   
  </tr>
  <tr>
    <td class="tablecontent12">4</td>
   <input type="hidden" size="5" name="h_4" value="EDP training fee" />
    <td class="tablecontent12"><span class="pink">EDP training fee</span></td>
    
   	 <td class="tablecontent1"><input type="text"  value="0" name="a_4" id="a_4"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_4" id="b_4"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_4" id="c_4"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="d_4" id="d_4"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="e_4" id="e_4"size="7" /></td>  
	<td class="tablecontent1"><input type="text"  value="0" name="f_4" id="f_4"size="7" /></td>
   <td class="tablecontent1"><input type="text"  value="0" name="g_4" id="g_4"size="7" /></td>
    
  </tr>
  <tr>
    <td class="tablecontent11">5</td>
   <input type="hidden" size="5" name="h_5" value="MDP training fee" />
    <td class="tablecontent11"><span class="pink">MDP training fee</span></td>
   
   	 <td class="tablecontent1"><input type="text"  value="0" name="a_5" id="a_5"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_5" id="b_5"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_5" id="c_5"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="d_5" id="d_5"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="e_5" id="e_5"size="7" /></td>  
	<td class="tablecontent1"><input type="text"  value="0" name="f_5" id="f_5"size="7" /></td>
   <td class="tablecontent1"><input type="text"  value="0" name="g_5" id="g_5"size="7" /></td>
     
  </tr>
  <tr>
    <td class="tablecontent12">6</td>
    <input type="hidden" size="5" name="h_6" value="Seminar fees" />
    <td class="tablecontent12"><span class="pink">Seminar fees</span></td>
  	
   	 <td class="tablecontent1"><input type="text"  value="0" name="a_6" id="a_6"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_6" id="b_6"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_6" id="c_6"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="d_6" id="d_6"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="e_6" id="e_6"size="7" /></td>  
	<td class="tablecontent1"><input type="text"  value="0" name="f_6" id="f_6"size="7" /></td>
   <td class="tablecontent1"><input type="text"  value="0" name="g_6" id="g_6"size="7" /></td>
   
  </tr>
  <tr>
    <td class="tablecontent11">7</td>
  <input type="hidden" size="5" name="h_7" value="Capacity accessment and consultancy" />
    <td class="tablecontent11"><span class="pink">Capacity accessment and consultancy</span></td>
   	 
  	 <td class="tablecontent1"><input type="text"  value="0" name="a_7" id="a_7"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_7" id="b_7"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_7" id="c_7"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="d_7" id="d_7"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="e_7" id="e_7"size="7" /></td>  
	<td class="tablecontent1"><input type="text"  value="0" name="f_7" id="f_7"size="7" /></td>
   <td class="tablecontent1"><input type="text"  value="0" name="g_7" id="g_7"size="7" /></td>
      
  </tr>
  <tr>
    <td class="tablecontent12">8</td>
   <input type="hidden" size="5" name="h_8" value="Project appraisals" />
    <td class="tablecontent12"><span class="pink">Project appraisals</span></td>
    
    	 <td class="tablecontent1"><input type="text"  value="0" name="a_8" id="a_8"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_8" id="b_8"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_8" id="c_8"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="d_8" id="d_8"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="e_8" id="e_8"size="7" /></td>  
	<td class="tablecontent1"><input type="text"  value="0" name="f_8" id="f_8"size="7" /></td>
   <td class="tablecontent1"><input type="text"  value="0" name="g_8" id="g_8"size="7" /></td>
      
  </tr>
  <tr>
    <td class="tablecontent11">9</td>
    <input type="hidden" size="5" name="h_9" value="Sick unit studies" />
   <td class="tablecontent11"><span class="pink">Sick unit studies</span></td>
  	
   	 <td class="tablecontent1"><input type="text"  value="0" name="a_9" id="a_9"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_9" id="b_9"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_9" id="c_9"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="d_9" id="d_9"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="e_9" id="e_9"size="7" /></td>  
	<td class="tablecontent1"><input type="text"  value="0" name="f_9" id="f_9"size="7" /></td>
   <td class="tablecontent1"><input type="text"  value="0" name="g_9" id="g_9"size="7" /></td>
     
  </tr>
  <tr>
    <td class="tablecontent12">10</td>
    <input type="hidden" size="5" name="h_10" value="Inplant studies" />
    <td class="tablecontent12"><span class="pink">Inplant studies</span></td>
    
   	 <td class="tablecontent1"><input type="text"  value="0" name="a_10" id="a_10"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_10" id="b_10"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_10" id="c_10"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="d_10" id="d_10"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="e_10" id="e_10"size="7" /></td>  
	<td class="tablecontent1"><input type="text"  value="0" name="f_10" id="f_10"size="7" /></td>
   <td class="tablecontent1"><input type="text"  value="0" name="g_10" id="g_10"size="7" /></td>
      
  </tr>
  <tr>
    <td class="tablecontent11">11</td>
   <input type="hidden" size="5" name="h_11" value="Surveys" />
    <td class="tablecontent11"><span class="pink">Surveys</span></td>

   	 <td class="tablecontent1"><input type="text"  value="0" name="a_11" id="a_11"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_11" id="b_11"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_11" id="c_11"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="d_11" id="d_11"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="e_11" id="e_11"size="7" /></td>  
	<td class="tablecontent1"><input type="text"  value="0" name="f_11" id="f_11"size="7" /></td>
   <td class="tablecontent1"><input type="text"  value="0" name="g_11" id="g_11"size="7" /></td>
    
  </tr>
  <tr>
    <td class="tablecontent12">12</td>
    <input type="hidden" size="5" name="h_12" value="Energy Audits" />
    <td class="tablecontent12"><span class="pink">Energy Audits</span></td>
  	
  	 <td class="tablecontent1"><input type="text"  value="0" name="a_12" id="a_12"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_12" id="b_12"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_12" id="c_12"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="d_12" id="d_12"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="e_12" id="e_12"size="7" /></td>  
	<td class="tablecontent1"><input type="text"  value="0" name="f_12" id="f_12"size="7" /></td>
   <td class="tablecontent1"><input type="text"  value="0" name="g_12" id="g_12"size="7" /></td>
   
  </tr>
  <tr>
    <td class="tablecontent11">13</td>
     <input type="hidden" size="5" name="h_13" value="NSIC  Regn./ gspp" />
    <td class="tablecontent11"><span class="pink">NSIC  Regn./ gspp</span></td>
  
  	 <td class="tablecontent1"><input type="text"  value="0" name="a_13" id="a_13"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_13" id="b_13"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_13" id="c_13"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="d_13" id="d_13"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="e_13" id="e_13"size="7" /></td>  
	<td class="tablecontent1"><input type="text"  value="0" name="f_13" id="f_13"size="7" /></td>
   <td class="tablecontent1"><input type="text"  value="0" name="g_13" id="g_13"size="7" /></td>
     
  </tr>
  <tr>
    <td class="tablecontent12">14</td>
   <input type="hidden" size="5" name="h_14" value="PD Accounts" />
    <td class="tablecontent12"><span class="pink">PD Accounts</span></td>
    
   	 <td class="tablecontent1"><input type="text"  value="0" name="a_14" id="a_14"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_14" id="b_14"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_14" id="c_14"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="d_14" id="d_14"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="e_14" id="e_14"size="7" /></td>  
	<td class="tablecontent1"><input type="text"  value="0" name="f_14" id="f_14"size="7" /></td>
   <td class="tablecontent1"><input type="text"  value="0" name="g_14" id="g_14"size="7" /></td>
      
  </tr>
  <tr>
    <td class="tablecontent11">15</td>
    	<input type="hidden" size="5" name="h_15" value="Sale of publications" />
    <td class="tablecontent11"><span class="pink">Sale of publications</span></td>

  	 <td class="tablecontent1"><input type="text"  value="0" name="a_15" id="a_15"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_15" id="b_15"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_15" id="c_15"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="d_15" id="d_15"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="e_15" id="e_15"size="7" /></td>  
	<td class="tablecontent1"><input type="text"  value="0" name="f_15" id="f_15"size="7" /></td>
   <td class="tablecontent1"><input type="text"  value="0" name="g_15" id="g_15"size="7" /></td>
  
  </tr>
  <tr>
    <td class="tablecontent12">16</td>
   <input type="hidden" size="5" name="h_16" value="Information Technology Royalty" />
    <td class="tablecontent12"><span class="pink">Information Technology Royalty</span></td>
    
   	 <td class="tablecontent1"><input type="text"  value="0" name="a_16" id="a_16"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_16" id="b_16"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_16" id="c_16"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="d_16" id="d_16"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="e_16" id="e_16"size="7" /></td>  
	<td class="tablecontent1"><input type="text"  value="0" name="f_16" id="f_16"size="7" /></td>
   <td class="tablecontent1"><input type="text"  value="0" name="g_16" id="g_16"size="7" /></td>
   
  </tr>
  <tr>
    <td class="tablecontent11">17</td>
   <input type="hidden" size="5" name="h_17" value="others" />
    <td class="tablecontent11"><span class="pink">others</span></td>
    
    	 <td class="tablecontent1"><input type="text"  value="0" name="a_17" id="a_17"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="b_17" id="b_17"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="c_17" id="c_17"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="d_17" id="d_17"size="7" /></td>
  <td class="tablecontent1"><input type="text"  value="0" name="e_17" id="e_17"size="7" /></td>  
	<td class="tablecontent1"><input type="text"  value="0" name="f_17" id="f_17"size="7" /></td>
   <td class="tablecontent1"><input type="text"  value="0" name="g_17" id="g_17"size="7" /></td>
  
  </tr>
  <% } else if(divFlag==1){
  String strSql = "SELECT * FROM tbl_revenue_branch WHERE months='"+months+"' AND years="+years+" AND   instid='"+instId+"'"; 
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
  <td class="tablecontent1"><input type="text"  name="d_<%=icnt%>" id="d_<%=icnt%>"size="7" value='<%=rsAdminResult.getString("branch3")%>' /></td>
   
    <td class="tablecontent1"><input type="text"   name="e_<%=icnt%>" id="e_<%=icnt%>"size="7" value='<%=rsAdminResult.getString("branch4")%>'/></td>
  <td class="tablecontent1"><input type="text"   name="f_<%=icnt%>" id="f_<%=icnt%>"size="7" value='<%=rsAdminResult.getString("branch5")%>' /></td>
   
    <td class="tablecontent1"><input type="text"   name="g_<%=icnt%>" id="g_<%=icnt%>"size="7" value='<%=rsAdminResult.getString("branch6")%>'/></td>
  
   
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
