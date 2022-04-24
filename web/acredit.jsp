<%
String sessionid = request.getSession().getId();
response.setHeader("SET-COOKIE", "JSESSIONID=" + sessionid + "; HttpOnly");
%>
<%
           // Set to expire far in the past.
      response.setDateHeader("Expires", 0);
  // Set standard HTTP/1.1 no-cache headers.
     response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
  // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
     response.addHeader("Cache-Control", "post-check=0, pre-check=0");
  // Set standard HTTP/1.0 no-cache header.
      response.setHeader("Pragma", "no-cache");
          request.getSession(false);
        %>
		<%
int timeout = session.getMaxInactiveInterval();
response.setHeader("Refresh", timeout + "; URL = sloginlog.jsp");
Cookie[] cookies = request.getCookies();
if(cookies!=null)
for (int i = 0; i < cookies.length; i++) {
 cookies[i].setMaxAge(0);
}
%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%  
           // Set to expire far in the past.  
      response.setDateHeader("Expires", 0);  
  // Set standard HTTP/1.1 no-cache headers.  
     response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");  
  // Set IE extended HTTP/1.1 no-cache headers (use addHeader).  
     response.addHeader("Cache-Control", "post-check=0, pre-check=0");  
  // Set standard HTTP/1.0 no-cache header.  
      response.setHeader("Pragma", "no-cache");  
          
        %> 
<html>
	<head>
	 <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen"
     href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
	<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE"> 
	<META HTTP-EQUIV="Expires" CONTENT="-1">
		 		 <link rel="stylesheet" type="text/css" href="inb.css" />
         <title>Current ACR status of an Employee  </title>
			 <script language="javascript">
		 function fntextval(objtxt)
		 {
		     if(objtxt.value=="")
			 alert("Value is missing");
			 return;
		 }
		 
	function formSubmit()
{
	var today=new Date();
	var dd,mm,yyyy,curdate;
	dd=today.getDate();
	mm=today.getMonth()+1;
	yyyy=today.getFullYear();
	var curr_hour = today.getHours();
	var curr_min = today.getMinutes();
	//alert("Today's date is " + dd+"-"+mm+"-"+yyyy+" "+curr_hour+":"+curr_min);
	//curdate = dd+"-"+mm+"-"+yyyy+""+curr_hour+":"+curr_min;
	curdate = dd+"-"+mm+"-"+yyyy;
	document.getElementById('currdate').value=curdate;
	document.form1.action="crSubmit.jsp";
}



 </script> 
  <script language="javascript">
  function validate(){
	var name1=trim(document.form1.name1.value);
	var designation=trim(document.form1.designation.value);
	var date_of_Birth=trim(document.form1.date_of_Birth.value);
	var year2004=trim(document.form1.year2004.value);
	var year2005=trim(document.form1.year2005.value);
	var year2006=trim(document.form1.year2006.value);
	var year2007=trim(document.form1.year2007.value);
	var year2008=trim(document.form1.year2008.value);
	var year2009=trim(document.form1.year2009.value);
	var year2010=trim(document.form1.year2010.value);
	var year2011=trim(document.form1.year2011.value);
	var year2012=trim(document.form1.year2012.value);
	var year2013=trim(document.form1.year2013.value);
	var year2014=trim(document.form1.year2014.value);
	var year2000=trim(document.form1.year2000.value);
	var year2001=trim(document.form1.year2001.value);
	var year2003=trim(document.form1.year2003.value);
	var year2002=trim(document.form1.year2002.value);

	if(name1=="")
  {
    alert(" Field is Empty");
    document.form1.name1.focus();
    return false;
  }
  else if(designation=="")
  {
   alert("Field is Empty");
   document.form1.Designation.focus();
   return false;
  }
  else if(date_of_Birth=="")
  {
   alert("Field is Empty");
   document.form1.Date_of_Birth.focus();
   return false;
  }
  else if(year2004=="")
  {
   alert("Field is Empty");
   document.form1.year2004.focus();
   return false;
  }
  else if(year2005=="")
  {
   alert("Field is Empty");
   document.form1.year2005.focus();
   return false;
  }
  else if(year2006=="")
  {
   alert("Field is Empty");
   document.form1.year2006.focus();
   return false;
  }
  else if(year2007=="")
  {
   alert("Field is Empty");
   document.form1.year2007.focus();
   return false;
  }
  else if(year2008=="")
  {
   alert("Field is Empty");
   document.form1.year2008.focus();
   return false;
  }
  else if(year2009=="")
  {
   alert("Field is Empty");
   document.form1.year2009.focus();
   return false;
  }
  else if(year2010=="")
  {
   alert("Field is Empty");
   document.form1.year2010.focus();
   return false;
  }
  else if(year2011=="")
  {
   alert("Field is Empty");
   document.form1.year2011.focus();
   return false;
  }
  else if(year2012=="")
  {
   alert("Field is Empty");
   document.form1.year2012.focus();
   return false;
  }
  else if(year2013=="")
  {
   alert("Field is Empty");
   document.form1.year2013.focus();
   return false;
  }
  else if(year2014=="")
  {
   alert("Field is Empty");
   document.form1.year2014.focus();
   return false;
  }
   else if(year2000=="")
  {
   alert("Field is Empty");
   document.form1.year2000.focus();
   return false;
  }
   else if(year2001=="")
  {
   alert("Field is Empty");
   document.form1.year2001.focus();
   return false;
  }
   else if(year2002=="")
  {
   alert("Field is Empty");
   document.form1.year2002.focus();
   return false;
  }
   else if(year2003=="")
  {
   alert("Field is Empty");
   document.form1.year2003.focus();
   return false;
  }
 
  }
   function trim(s) {
    return s.replace( /^\s*/, "" ).replace( /\s*$/, "" );
	
}
  
  </script>
 		 

	<script language="javascript">
 		function ToUpper(ctrl)

    {  

    var t = ctrl.value;

    ctrl.value = t.toUpperCase();

    }

    function ToLower(ctrl)

    {  

    var t = ctrl.value;

    ctrl.value = t.toLowerCase();

    } 

	</script>
		
<script>
<!--



var divs = new Array();
var da = document.all;
var start;

//CONFIGUER THESE VARS!!!!!!
//speed of pulsing
var speed = 50;

function initVars(){

if (!document.all)
return

//Extend of shrink the below list all you want
//put an "addDiv(1,"2",3,4); for each div you made, 
//1)'id' of div
//2)color or glow(name or hex)(in quotes!!!)
//3)minimum strength
//4)maximum strength

addDiv(welcome,"red",4,9);



//NO MORE EDITING!!!!!!



startGlow();
}

function addDiv(id,color,min,max)
{
var j = divs.length;
divs[j] = new Array(5);
divs[j][0] = id;
divs[j][1] = color;
divs[j][2] = min;
divs[j][3] = max;
divs[j][4] = true;
}

function startGlow()
{
	if (!document.all)
		return 0;

	for(var i=0;i<divs.length;i++)
	{
		divs[i][0].style.filter = "Glow(Color=" + divs[i][1] + ", Strength=" + divs[i][2] + ")";
		divs[i][0].style.width = "100%";
	}

	start = setInterval('update()',speed);
}

function update()
{
	for (var i=0;i<divs.length;i++)
	{
		if (divs[i][4])
		{
			divs[i][0].filters.Glow.Strength++;
			if (divs[i][0].filters.Glow.Strength == divs[i][3])
				divs[i][4] = false;
		}
	
		if (!divs[i][4])
		{
			divs[i][0].filters.Glow.Strength--;
			if (divs[i][0].filters.Glow.Strength == divs[i][2])
				divs[i][4] = true;
		}
	}
}
-->
</script>
		 <h3><b><center>
		 <script>


// ********** MAKE YOUR CHANGES HERE

Var text="EDIT ACR STATUS OF AN EMPLOYEE" // YOUR TEXT
var speed=80 // SPEED OF FADE

// ********** LEAVE THE NEXT BIT ALONE!


if (document.all||document.getElementById){
document.write('<span id="highlight">' + text + '</span>')
var storetext=document.getElementById? document.getElementById("highlight") : document.all.highlight
}
else
document.write(text)
var hex=new Array("00","14","28","3C","50","64","78","8C","A0","B4","C8","DC","F0")
var r=1
var g=1
var b=1
var seq=1
function changetext(){
rainbow="#"+hex[r]+hex[g]+hex[b]
storetext.style.color=rainbow
}
function change(){
if (seq==6){
b--
if (b==0)
seq=1
}
if (seq==5){
r++
if (r==12)
seq=6
}
if (seq==4){
g--
if (g==0)
seq=5
}
if (seq==3){
b++
if (b==12)
seq=4
}
if (seq==2){
r--
if (r==0)
seq=3
}
if (seq==1){
g++
if (g==12)
seq=2
}
changetext()
}
function starteffect(){
if (document.all||document.getElementById)
flash=setInterval("change()",speed)
}
starteffect()
</script>
<script language="javascript">
 		function ToUpper(ctrl)

    {  

    var t = ctrl.value;

    ctrl.value = t.toUpperCase();

    }

    function ToLower(ctrl)

    {  

    var t = ctrl.value;

    ctrl.value = t.toLowerCase();

    } 

	</script>
</b></center></h3>
<%

int divFlag=0,buttonFlag=0;

 String role=(String)session.getAttribute("rol");

String user=(String)session.getAttribute("user");
String Random5=(String)session.getAttribute("Random5");
String mnm = request.getParameter("mnm");
System.out.println("prakash chandradeynccffffff ---------chanda financial page======"+Random5);
System.out.println("prakash chandradeynccffffff ---------chanda financial page ======"+mnm);
if(Random5.equals(mnm))
{


System.out.println(role);
try{
%>
		  <%


	String name=request.getParameter("name");
	
	if (name.substring(0, 1).matches("[a-zA-Z_0-9]+"))  {
	System.out.println("pattern matches");
	
		ResultSet rsAdminResult = null;
		Connection con = null;
	     Statement stmt = null;
		// String userDate=months+"-"+years;
		
		
	     con = ConnectionManager.getConnectionDirectForMySQL();
	     stmt = (Statement)con.createStatement();

String strSql = "select sno, name, Designation, Date_of_Birth , year2004, status, year2005, status1, year2006, status2, year2007, status3, year2008, status4, year2009, status5, year2010, status6, year2011, status7, year2012, status8, year2013, status9, year2014, status10,year2000, status11, year2001, status12, year2002, status13, year2003, status14 from tbl_acr where name='"+name+"'";
rsAdminResult = stmt.executeQuery(strSql);
System.out.println(strSql);

	if(rsAdminResult.next()){
		System.out.println("Result Set have record");
	}
	else{
	System.out.println(" Result Set have not record");
	}	
	


%>
        </head>

<body>
	
	
		<form  name="form1" id="form1" method="post" action="Acrupdate.do" onSubmit="return validate()">
<table  width="68%"  border="0" align="center" BORDERCOLOR="#912002525" cellpadding="0" cellspacing="0" style="border-collapse: collapse" i>
  <tr>
   
    <td class="tableheader" colspan="2" align="center">NAME</td>
    <td width="225" class="tableheader" align="center">DESIGNATION </td>
    <td width="241" class="tableheader" align="center">DATE OF BIRTH </td>
  </tr>
  <tr>
    <input type="hidden" name="sno" id="sno" size="2" readonly="true" value='<%=rsAdminResult.getString("sno")%>' >
    <td colspan="2"><input type="text" name="name1" id="name1" size="20" value='<%=rsAdminResult.getString("name")%>' onKeyUp="ToUpper(this)"></td>
    
	<!--<td><input type="text" name="Designation" id="Designation" size="20" value='<%=rsAdminResult.getString("Designation")%>' onKeyUp="ToUpper(this)"></td>-->
    <td><select name="designation" id="designation">
<%

try{
  Connection conn = ConnectionManager.getConnectionDirectForMySQL();
			if(conn != null){
				Statement stmt1 = conn.createStatement();
				
				String strSql1 = "select distinct Designation  from tbl_designation order by Designation ";
				ResultSet resultSet = stmt1.executeQuery(strSql1);
%>
<option value='<%=rsAdminResult.getString("Designation")%>'><%=rsAdminResult.getString("Designation")%></option>				
			<%	while(resultSet.next()){
%>

<option value='<%=resultSet.getString("Designation")%>'><%=resultSet.getString("Designation")%></option>
<%}}}
catch(SQLException e){
			//e.printStackTrace();
			System.out.println(e.getErrorCode()+" = "+e.getMessage());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println(e.getMessage());
		}
		%>
  </select>
  </td>
	<td>
	

	 <script type="text/javascript"
     src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js">
    </script> 
    <script type="text/javascript"
     src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/js/bootstrap.min.js">
    </script>
    <script type="text/javascript"
     src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js">
    </script>
    <script type="text/javascript"
     src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js">
    </script>
	  
  <div id="datetimepicker4" class="input-append">
    <input data-format="yyyy-MM-dd" type="text"  name="date_of_Birth" id="date_of_Birth" value='<%=rsAdminResult.getString("Date_of_Birth")%>'></input>
    <span class="add-on">
      <i data-time-icon="icon-time" data-date-icon="icon-calendar" >
      </i>
    </span>
  
</div>
<script type="text/javascript">
  $(function() {
    $('#datetimepicker4').datetimepicker({
      pickTime: false
    });
  });
</script>
	
	
	
	
	
	
	</td>
  </tr>


&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


  <tr>
    <td class="tablecontent11">2000-01</td>
    <td><input type="text" name="year2000" id="year2000" size="20" value='<%=rsAdminResult.getString("year2000")%>'onKeyUp="ToUpper(this)" ></td>
    <td class="tablecontent11">STATUS</td>
    <td>	<select name="status11" id="status11" style="width: 180px"  >
	<option value='<%=rsAdminResult.getString("status11")%>'><%=rsAdminResult.getString("status11")%></option>   
	<option value="N">YES</option>
    <option value="N">NO</option>
    </select>
</td>
  </tr>
  <tr>
    <td class="tablecontent12">2001-02</td>
    <td><input type="text" name="year2001" id="year2001" size="20" value='<%=rsAdminResult.getString("year2001")%>' onKeyUp="ToUpper(this)"></td>
    <td class="tablecontent12">STATUS</td>
    <td>	<select name="status12" id="status12" style="width: 180px"  >
	<option value='<%=rsAdminResult.getString("status12")%>'><%=rsAdminResult.getString("status12")%></option>   
	<option value="YES">YES</option>
    <option value="NO">NO</option>
    </select>
</td>
  </tr>
  <tr>
    <td class="tablecontent11">2002-03</td>
    <td><input type="text" name="year2002" id="year2002" size="20" value='<%=rsAdminResult.getString("year2002")%>' onKeyUp="ToUpper(this)" ></td>
    <td class="tablecontent11">STATUS</td>
    <td>	<select name="status13" id="status13" style="width: 180px"  >
	<option value='<%=rsAdminResult.getString("status13")%>'><%=rsAdminResult.getString("status13")%></option>   
	<option value="YES">YES</option>
    <option value="NO">NO</option>
    </select>
</td>
  </tr>
  <tr>
    <td class="tablecontent12">2003-04</td>
    <td><input type="text" name="year2003" id="year2003" size="20" value='<%=rsAdminResult.getString("year2003")%>' onKeyUp="ToUpper(this)" ></td>
    <td class="tablecontent12">STATUS</td>
    <td>	<select name="status14" id="status14" style="width: 180px"  >
	<option value='<%=rsAdminResult.getString("status14")%>'><%=rsAdminResult.getString("status14")%></option>   
	<option value="YES">YES</option>
    <option value="NO">NO</option>
    </select>
</td>
  </tr>
  <tr>
    <td width="74" class="tablecontent11">2004-05</td>
    <td width="208"><input type="text" name="year2004" id="year2004" size="20" value='<%=rsAdminResult.getString("year2004")%>' onKeyUp="ToUpper(this)"></td>
    <td width="225" class="tablecontent11">STATUS</td>
    <td width="241">
	<select name="status" id="status" style="width: 180px"  >
	<option value='<%=rsAdminResult.getString("status")%>'><%=rsAdminResult.getString("status")%></option>   
<option value="YES">YES</option>
    <option value="NO">NO</option>    </select>
	</td>
  </tr>
  <tr>
    <td class="tablecontent12">2005-06</td>
    <td><input type="text" name="year2005" id="year2005" size="20" value='<%=rsAdminResult.getString("year2005")%>' onKeyUp="ToUpper(this)"></td>
    <td class="tablecontent12">STATUS</td>
    <td>
	<select name="status1" id="status1" style="width: 180px"  >
	<option value='<%=rsAdminResult.getString("status1")%>'><%=rsAdminResult.getString("status1")%></option>
	<option value="YES">YES</option>
    <option value="NO">NO</option>
    </select>
	<!--<input type="text" name="status1" id="status1" style="width: 120px" value='<%=rsAdminResult.getString("status1")%>' onkeyup="ToUpper(this)" >--></td>
  </tr>
  <tr>
    <td class="tablecontent12">2006-07</td>
    <td><input type="text" name="year2006" id="year2006" size="20" value='<%=rsAdminResult.getString("year2006")%>' onKeyUp="ToUpper(this)"></td>
    <td class="tablecontent12">STATUS</td>
    <td>
	<select name="status2" id="status2" style="width: 180px"  >
	<option value='<%=rsAdminResult.getString("status2")%>'><%=rsAdminResult.getString("status2")%></option>
<option value="YES">YES</option>
    <option value="NO">NO</option>
    </select>
	<!--<input type="text" name="status2" id="status2" style="width: 120px" value='<%=rsAdminResult.getString("status2")%>' onkeyup="ToUpper(this)">
--></td>
  </tr>
  <tr>
    <td class="tablecontent11">2007-08</td>
    <td><input type="text" name="year2007" id="year2007" size="20" value='<%=rsAdminResult.getString("year2007")%>' onKeyUp="ToUpper(this)"></td>
    <td class="tablecontent11">STATUS</td>
    <td>
	<select name="status3" id="status3" style="width: 180px"  >
	<option value='<%=rsAdminResult.getString("status3")%>'><%=rsAdminResult.getString("status3")%></option> 
	<option value="YES">YES</option>
    <option value="NO">NO</option>
    </select>
	<!--<input type="text" name="status3" id="status3" style="width: 120px"  value='<%=rsAdminResult.getString("status3")%>' onkeyup="ToUpper(this)">--> </td>
  </tr>
  <tr>
    <td class="tablecontent12">2008-09</td>
    <td><input type="text" name="year2008" id="year2008" size="20" value='<%=rsAdminResult.getString("year2008")%>' onKeyUp="ToUpper(this)"></td>
    <td class="tablecontent12">STATUS</td>
    <td>
	<select name="status4" id="status4" style="width: 180px"  >
	<option value='<%=rsAdminResult.getString("status4")%>'><%=rsAdminResult.getString("status4")%></option>   
   <option value="YES">YES</option>
   <option value="NO">NO</option>
    </select>
	<!--<input type="text" name="status4" id="status4" style="width: 120px"  value='<%=rsAdminResult.getString("status4")%>' onkeyup="ToUpper(this)">
--></td>
  </tr>
  <tr>
    <td class="tablecontent11">2009-10</td>
    <td><input type="text" name="year2009" id="year2009" size="20" value='<%=rsAdminResult.getString("year2009")%>' onKeyUp="ToUpper(this)"></td>
    <td class="tablecontent11">STATUS</td>
    <td>
	<select name="status5" id="status5" style="width: 180px"  >
	<option value='<%=rsAdminResult.getString("status5")%>'><%=rsAdminResult.getString("status5")%></option>   
  <option value="YES">YES</option>
    <option value="NO">NO</option>
    </select>
	<!--<input type="text" name="status5" id="status5" style="width: 120px" value='<%=rsAdminResult.getString("status5")%>' onkeyup="ToUpper(this)">--> </td>
  </tr>
  <tr>
    <td class="tablecontent12">2010-11</td>
    <td><input type="text" name="year2010" id="year2010" size="20" value='<%=rsAdminResult.getString("year2010")%>' onKeyUp="ToUpper(this)"></td>
    <td class="tablecontent12">STATUS</td>
    <td>
	<select name="status6" id="status6" style="width: 180px"  >
	<option value='<%=rsAdminResult.getString("status6")%>'><%=rsAdminResult.getString("status6")%></option>   
   <option value="YES">YES</option>
    <option value="NO">NO</option>
    </select>
	<!--<input type="text" name="status6" id="status6" style="width: 120px"value='<%=rsAdminResult.getString("status6")%>' onkeyup="ToUpper(this)" >--></td>
  </tr>
  <tr>
    <td class="tablecontent11">2011-12</td>
    <td><input type="text" name="year2011" id="year2011" size="20" value='<%=rsAdminResult.getString("year2011")%>' onKeyUp="ToUpper(this)"></td>
    <td class="tablecontent11">STATUS</td>
    <td>
	<select name="status7" id="status7" style="width: 180px"  >
	<option value='<%=rsAdminResult.getString("status7")%>' ><%=rsAdminResult.getString("status7")%></option>   
   <option value="YES">YES</option>
   <option value="NO">NO</option>
    </select>
	<!--<input type="text" name="status7" id="status7" style="width: 120px" value='<%=rsAdminResult.getString("status7")%>' onkeyup="ToUpper(this)" >--></td>
  </tr>
  <tr>
    <td class="tablecontent12">2012-13</td>
    <td><input type="text" name="year2012" id="year2012" size="20" value='<%=rsAdminResult.getString("year2012")%>' onKeyUp="ToUpper(this)"></td>
    <td class="tablecontent12">STATUS</td>
    <td>
	<select name="status8" id="status8" style="width: 180px"  >
	<option value='<%=rsAdminResult.getString("status8")%>'><%=rsAdminResult.getString("status8")%></option>   
   <option value="YES">YES</option>
   <option value="NO">NO</option>
    </select>
	<!--<input type="text" name="status8" id="status8" style="width: 120px" value='<%=rsAdminResult.getString("status8")%>'onkeyup="ToUpper(this)" >-->	  </td>
  </tr>
  <tr>
    <td class="tablecontent11">2013-14</td>
    <td><input type="text" name="year2013" id="year2013" size="20" value='<%=rsAdminResult.getString("year2013")%>'onkeyup="ToUpper(this)"></td>
    <td class="tablecontent11">STATUS</td>
    <td>
	<select name="status9" id="status9" style="width: 180px"  >
	<option value='<%=rsAdminResult.getString("status9")%>'><%=rsAdminResult.getString("status9")%></option>   
   <option value="YES">YES</option>
   <option value="NO">NO</option>
    </select>
	<!--<input type="text" name="status9" id="status9" style="width: 120px" value='<%=rsAdminResult.getString("status9")%>'onkeyup="ToUpper(this)" >-->	 </td>
  </tr>
  <tr>
    <td class="tablecontent12">2014-15</td>
    <td><input type="text" name="year2014" id="year2014" size="20" value='<%=rsAdminResult.getString("year2014")%>' onKeyUp="ToUpper(this)"></td>
    <td class="tablecontent12">STATUS</td>
    <td>
	<select name="status10" id="status10" style="width: 180px"  >
	<option value='<%=rsAdminResult.getString("status10")%>'><%=rsAdminResult.getString("status10")%></option>   
   <option value="YES">YES</option>
   <option value="NO">NO</option>
    </select>
	<!--<input type="text" name="status10" id="status10" style="width: 120px" value='<%=rsAdminResult.getString("status10")%>'onkeyup="ToUpper(this)" >-->	 </td>
  </tr>
</table>
 <HR color="#CCCCCC" noshade size="0"/>
 <div align="center">
<html:submit>Submit</html:submit>
<input class="butt" type="button" name="reset" value="Reset" tabindex="18" onClick="pageReload()"/>&nbsp;
<input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
</form></div>
<HR color="#FFFFFF" noshade size="0"/>
<%	
} else {
    response.sendRedirect("/senet/stat.jsp");
}

 %>

<%

}// End of Try
catch(Exception e){
			
				}
				%>

	
	<%	
} else {
    response.sendRedirect("/senet/stat.jsp");
}

 %>
</body>

</html>
