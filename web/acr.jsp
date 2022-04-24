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
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="a.html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
         <title>CURRENT STATUS OF CR FOR US DATED </title>
		 
<link rel="stylesheet" type="text/css" href="inb.css" />

    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen"
     href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
		 
	 <script language="javascript" type="text/javascript" src="datetimepicker.js">
		 
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
</head>

<body  onLoad="initVars()">

<%
try
{
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


<FONT SIZE="4" FACE="courier" COLOR="#990099"><MARQUEE WIDTH=100% BEHAVIOR=scroll LOOP="">
</MARQUEE></FONT> 
	<CENTER>
<div id="hi" style="color: lime">

</div>

<h3 align="center" > <span id="ctl00_ContentPlaceHolder1_lbl_topic" style="color: rgb(204, 0, 0); font-family: Microsoft Sans Serif; font-size: medium; font-weight: bold; text-decoration: underline; text-align: center;">ACR Availability Entry Form Of An Employee</span></h3>
	<form  name="form1" id="form1" method="post" action="AcrActionpath.do" onSubmit="return validate()">

	<input type="hidden" size="5" name="mnm" value="<%=mnm%>" />

	<table width="69%"  border="0" align="center" cellpadding="0" cellspacing="0" BORDERCOLOR="#918002525" style="border-collapse: collapse" >
  <tr>
   
    <td colspan="2" align="center" class="tableheader">NAME</td>
    <td width="220" class="tableheader">DESIGNATION </td>
    <td width="241" align="center" class="tableheader">DATE OF BIRTH </td>
  </tr>
  <tr>
    
    <td align="center" colspan="2"><input type="text" name="name1" id="name1" size="20" onKeyUp="ToUpper(this)"></td>
    <!--<td><input type="text" name="Designation" id="Designation" size="20" onKeyUp="ToUpper(this)"></td>-->
	 
	 <td><select name="designation" id="designation">
<%

try{
  Connection conn = ConnectionManager.getConnectionDirectForMySQL();
			if(conn != null){
				Statement stmt = conn.createStatement();
				
				String strSql = "select distinct Designation  from tbl_designation order by Designation ";
				ResultSet resultSet = stmt.executeQuery(strSql);

				
				while(resultSet.next()){
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
    <input data-format="yyyy-MM-dd" type="text"  name="date_of_Birth" id="date_of_Birth"></input>
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


  <tr >
    <td class="tablecontent11" >2000-01</td>
    <td align="center"><input type="text" name="year2000" id="year2000" size="20" onKeyUp="ToUpper(this)" value="-"></td>
    <td class="tablecontent11">STATUS</td>
    <td><select name="status11" id="status11" style="width: 180px"  >
	<option value="NO">NO</option>
	<option value="YES">YES</option>   
    </select></td>
  </tr>
  <tr >
    <td class="tablecontent12">2001-02</td>
    <td align="center"><input type="text" name="year2001" id="year2001" size="20" onKeyUp="ToUpper(this)" value="-"></td>
    <td class="tablecontent12">STATUS</td>
    <td><select name="status12" id="status12" style="width: 180px"  >
	<option value="NO">NO</option>
	<option value="YES">YES</option>   
    </select></td>
  </tr>
  <tr >
    <td class="tablecontent11">2002-03</td>
    <td align="center"><input type="text" name="year2002" id="year2002" size="20" onKeyUp="ToUpper(this)" value="-"></td>
    <td class="tablecontent11">STATUS</td>
    <td><select name="status13" id="status13" style="width: 180px"  >
	<option value="NO">NO</option>
	<option value="YES">YES</option>   
    </select></td>
  </tr>
  <tr >
    <td class="tablecontent12">2003-04</td>
    <td align="center"><input type="text" name="year2003" id="year2003" size="20" onKeyUp="ToUpper(this)" value="-"></td>
    <td class="tablecontent12">STATUS</td>
    <td><select name="status14" id="status14" style="width: 180px"  >
	<option value="NO">NO</option>
	<option value="YES">YES</option>   
    </select></td>
  </tr>
  <tr >
    <td width="100" class="tablecontent11">2004-05</td>
    <td width="208" align="center"><input type="text" name="year2004" id="year2004" size="20" onKeyUp="ToUpper(this)" value="-"></td>
    <td width="220" class="tablecontent11">STATUS</td>
    <td width="241">
	<select name="status" id="status" style="width: 180px"  >
	<option value="NO">NO</option>
	<option value="YES">YES</option>   
    </select>	</td>
  </tr>
  <tr >
    <td class="tablecontent12">2005-06</td>
    <td align="center"><input type="text" name="year2005" id="year2005" size="20" onKeyUp="ToUpper(this)" value="-"></td>
    <td class="tablecontent12">STATUS</td>
    <td><select name="status1" id="status1" style="width: 180px"  >
	<option value="NO">NO</option>
	<option value="YES">YES</option>
    </select></td>
  </tr>
  <tr >
    <td class="tablecontent11">2006-07</td>
    <td align="center"><input type="text" name="year2006" id="year2006" size="20" onKeyUp="ToUpper(this)" value="-"></td>
    <td class="tablecontent11">STATUS</td>
    <td><select name="status2" id="status2" style="width: 180px"  >
	<option value="NO">NO</option>
	<option value="YES">YES</option>
    </select></td>
  </tr>
  <tr >
    <td class="tablecontent12">2007-08</td>
    <td align="center"><input type="text" name="year2007" id="year2007" size="20" onKeyUp="ToUpper(this)" value="-"></td>
    <td class="tablecontent12">STATUS</td>
    <td><select name="status3" id="status3" style="width: 180px"  >
	<option value="NO">NO</option>
	<option value="YES">YES</option>
    </select></td>
  </tr>
  <tr >
    <td class="tablecontent11">2008-09</td>
    <td align="center"><input type="text" name="year2008" id="year2008" size="20" onKeyUp="ToUpper(this)" value="-"></td>
    <td class="tablecontent11">STATUS</td>
    <td><select name="status4" id="status4" style="width: 180px"  >
	<option value="NO">NO</option>
	<option value="YES">YES</option>
    </select></td>
  </tr>
  <tr >
    <td class="tablecontent12">2009-10</td>
    <td align="center"><input type="text" name="year2009" id="year2009" size="20" onKeyUp="ToUpper(this)" value="-"></td>
    <td class="tablecontent12">STATUS</td>
    <td><select name="status5" id="status5" style="width: 180px"  >
	<option value="NO">NO</option>
	<option value="YES">YES</option>
    </select></td>
  </tr>
  <tr >
    <td class="tablecontent11">2010-11</td>
    <td align="center"><input type="text" name="year2010" id="year2010" size="20" onKeyUp="ToUpper(this)" value="-"></td>
    <td class="tablecontent11">STATUS</td>
    <td><select name="status6" id="status6" style="width: 180px"  >
	<option value="NO">NO</option>
	<option value="YES">YES</option>
    </select></td>
  </tr>
  <tr >
    <td class="tablecontent12">2011-12</td>
    <td align="center"><input type="text" name="year2011" id="year2011" size="20" onKeyUp="ToUpper(this)" value="-"></td>
    <td class="tablecontent12">STATUS</td>
    <td><select name="status7" id="status7" style="width: 180px"  >
	<option value="NO">NO</option>
	<option value="YES">YES</option>
    </select></td>
  </tr>
  <tr >
    <td class="tablecontent11">2012-13</td>
    <td align="center"><input type="text" name="year2012" id="year2012" size="20" onKeyUp="ToUpper(this)" value="-"></td>
    <td class="tablecontent11">STATUS</td>
    <td><select name="status8" id="status8" style="width: 180px"  >
	<option value="NO">NO</option>
	<option value="YES">YES</option>
    </select></td>
  </tr>
  <tr >
    <td class="tablecontent12">2013-14</td>
    <td align="center"><input type="text" name="year2013" id="year2013" size="20" onKeyUp="ToUpper(this)" value="-"></td>
    <td class="tablecontent12">STATUS</td>
    <td><select name="status9" id="status9" style="width: 180px"  >
	<option value="NO">NO</option>
	<option value="YES">YES</option>
    </select></td>
  </tr>
  <tr >
    <td class="tablecontent11">2014-15</td>
    <td align="center"><input type="text" name="year2014" id="year2014" size="20" onKeyUp="ToUpper(this)" value="-"></td>
    <td class="tablecontent11">STATUS</td>
    <td><select name="status10" id="status10" style="width: 180px"  >
	<option value="NO">NO</option>
	<option value="YES">YES</option>
    </select></td>
  </tr>
</table>
Note:-- Insert Date value in YYYY-mm-dd format.
 <HR color="#CCCCCC" noshade size="0"/>
<div align="center">
<input type="submit" name="submit" value="submit" tabindex= "28"/>  <input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
</div>
<HR color="#FFFFFF" noshade size="0"/>
</form>

<%

}// End of Try
catch(Exception e){
			
				}
				%>

	
	<%	
} else {
    response.sendRedirect("stat.jsp");
}

 %>
<%
 } catch (Exception e) {
	System.out.println("Duplicate vcvcEntry");
	%>
	<a href="Session.jsp" target="_top" id="linkid">GO HERE</a>
	<%
	}
	
	


 %>
</body>
<div align="center">
  <!-- <a href="reportMain1.jsp">
  <input name="button" type="button" value=" BACK">
  </a> -->
   
</div>

</html>
