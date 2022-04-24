<%  
		String sessionid = request.getSession().getId();
		// be careful overwriting: JSESSIONID may have been set with other flags
		response.setHeader("SET-COOKIE", "JSESSIONID=" + sessionid + "; HttpOnly");
           // Set to expire far in the past.  
      response.setDateHeader("Expires", 0);  
	  response.setDateHeader("Expires",-1);  
  // Set standard HTTP/1.1 no-cache headers.  
     response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");  
  // Set IE extended HTTP/1.1 no-cache headers (use addHeader).  
     response.addHeader("Cache-Control", "post-check=0, pre-check=0");  
  // Set standard HTTP/1.0 no-cache header.  
      response.setHeader("Pragma", "no-cache");  
	  
          
        %> 
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE"> 
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="description" content="Styling Select Elements" />
<title>Home Page</title>
<script type="text/javascript" src="jquery-1.11.3.js"></script>
<script>
	$(function() {
	var d = new Date(),

    n = d.getMonth(),

    y = d.getFullYear();
    var m=(n-3);
	var x=y+1;
  var	z=y+("-")+x;

$('#cmbMonth option:eq('+m+')').prop('selected', true);

$('#cmbYear option[value="'+z+'"]').prop('selected', true);
	});
</script>
<script language="JavaScript">
window.history.forward(0);
</script>
<script type="text/javascript">
<!-- 
function fnSubmit() {
      
if(document.frmMain.cmbIns.value!="" && document.frmMain.cmbMonth.value!="" && document.frmMain.cmbYear.value!="" && document.frmMain.mnm.value!="") {
            document.frmMain.action="main1.jsp";
			return true;
      } else {
			alert('Please selected the Criteria.......');
            document.frmMain.cmbIns.focus();
            return false;
      }

}
//-->
</script>
<script type="text/javascript" src="jqueryy.js"></script>

<script type="text/javascript">
	$(document).ready(function(){	

		if (!$.browser.opera) {
    
			// select element styling
			$('select.select').each(function(){
				var title = $(this).attr('title');
				if( $('option:selected', this).val() != ''  ) title = $('option:selected',this).text();
				$(this)
					.css({'z-index':10,'opacity':0,'-khtml-appearance':'none'})
					.after('<span class="select">' + title + '</span>')
					.change(function(){
						val = $('option:selected',this).text();
						$(this).next().text(val);
						})
			});

		};
		
	});
	var sel = document.getElementById('select_id');
sel.addEventListener('click', function(el){
    var options = this.children;
    for(var i=0; i < this.childElementCount; i++){
        options[i].style.color = 'white';
    }
    var selected = this.children[this.selectedIndex];
        selected.style.color = 'red';
    }, false);
</script>
<script>

if(typeof(Storage) !== "undefined") {
sessionStorage.setItem("uniqueIdSessionStorage", "xyz");
}
</script>

<script>
var ss =  sessionStorage.getItem('uniqueIdSessionStorage');
if(ss==='' || ss===null)
{
window.location='slogin.jsp';
}
</script>

<style>
body {
	margin:0;
	padding:20px 40px;
	background:#fff;
	font:80% Arial, Helvetica, sans-serif;
	color:#555;
	line-height:180%;
}
h1{
	font-size:180%;
	font-weight:normal;
	}
h2{
	font-size:160%;
	font-weight:normal;
	}	
h3{
	font-size:140%;
	font-weight:normal;
	}	
pre{
	display:block;
	font:12px "Courier New", Courier, monospace;
	padding:10px;
	border:1px solid #bae2f0;
	background:#e3f4f9;	
	margin:.5em 0;
	width:500px;
	}		
.clear{
	clear:both;
	}	
img{border:none;}

/* */

/* all form DIVs have position property set to relative so we can easily position newly created SPAN */
form div{position:relative;} 

/* setting the width and height of the SELECT element to match the replacing graphics */
select.select{
		position:relative;
		z-index:10;
		width:166px !important;
		height:26px !important;
		line-height:26px;
}

/* dynamically created SPAN, placed below the SELECT */
span.select{
	position:absolute;
	bottom:0;
	float:left;
	left:0;
	width:166px;
	height:26px;
	line-height:26px;
	text-indent:10px;
	background:url(images/bg_select.gif) no-repeat 0 0;
	cursor:default;
	z-index:1;
	}
	
/* first variation (LABEL is above the SELECT) */	
form div.variation1 label{display:block;line-height:26px;}

/* second variation (LABEL is placed on the left of the SELECT) */	
form div.variation2 label{float:left;width:100px;line-height:26px;}
form div.variation2 span.select{left:100px;}

</style>
	<style type="text/css">


/* The CSS */
select {
    padding:3px;
    margin: 0;
    -webkit-border-radius:4px;
    -moz-border-radius:4px;
    border-radius:4px;
    -webkit-box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
    -moz-box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
    box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
    background: #f8f8f8;
    color:#666666;
    border:none;
    outline:none;
    display: inline-block;
    -webkit-appearance:none;
    -moz-appearance:none;
    appearance:none;
    cursor:pointer;
}

/* Targetting Webkit browsers only. FF will show the dropdown arrow with so much padding. */
@media screen and (-webkit-min-device-pixel-ratio:0) {
    select {padding-right:18px}
}

label {position:relative}
label:after {
    content:'<>';
    font:11px "Consolas", monospace;
    color:#aaa;
    -webkit-transform:rotate(90deg);
    -moz-transform:rotate(90deg);
    -ms-transform:rotate(90deg);
    transform:rotate(90deg);
    right:8px; top:2px;
    padding:0 0 2px;
    border-bottom:1px solid #ddd;
    position:absolute;
    pointer-events:none;
}
label:before {
    content:'';
    right:6px; top:0px;
    width:20px; height:20px;
    background:#f8f8f8;
    position:absolute;
    pointer-events:none;
    display:block;
}</style>
	<body bgcolor="#F4F4F4" >
	   <%  long a=4534545345345445L;
	 String Random2 = Long.toString((long) (Math.random() * a));

System.out.println("msn  main page"+Random2);

  session.setAttribute("Random5",Random2);	
 String role=(String)session.getAttribute("rol");
 String inst=(String)session.getAttribute("inst");

  %>
  <html:form action="/FileSave" method="post" enctype="multipart/form-data">

		<table width="960" style="border:1px dotted black;" align="center" >
  <tr>
    <td colspan="2" >
	 <% 
    if(role.equalsIgnoreCase("AU")){
 
   %>
	<table width='100%' border='0' cellspacing='0' cellpadding='0'  height="101">
	<tr>
				<td width='20%' height="91" align='center' bgcolor="#297E43"><font color="#FFFFFF" size="+3">ACR </font><BR/>
		  <font color="#FFFFFF" size="+1">Vigilance</font></td>
				<td width='6%' valign="middle" bgcolor="#FFFFFF"><img src="images/images (1).jpg" width="53" height="63"/></td>
				<td width='55%' valign="middle" bgcolor="#FFFFFF">
<font color="#181818" face="garamond" size="+1" style="font-weight:bold">
				Office of Development Commissioner(MSME)<br />
				Ministry of Micro, Small & Medium Enterprises
		  </font></td>
				<td width='19%' align='center' bgcolor="#FFFFFF"><img src="images/imagesmsme.jpg" width="179" height="73"/></td>	   					
	    </tr>
		 <tr>
    <td height="27" colspan="4" align="center" background="images/bg-grad-long-sml.png" bgcolor="#FFFFCC"><strong><font color="#FFFFFF"> Welcome , Development Institutes </font></strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <A HREF="logout.jsp?mnm=<%=Random2%>" target="_top"><font color="#FFFFFF" style="text-decoration:none" >LOGOUT</font></a>  </td>
	
    </tr>
</table>

<% }else if (role.equalsIgnoreCase("JU")) {%>

<table width='100%' border='0' cellspacing='0' cellpadding='0'  height="101">
	<tr>
				<td width='20%' height="91" align='center' bgcolor="#297E43"><font color="#FFFFFF" size="+1">Court Cases</font><BR/>
		  <font color="#FFFFFF" size="+1">Development Institutes</font></td>
				<td width='6%' valign="middle" bgcolor="#FFFFFF"><img src="images/images (1).jpg" width="53" height="63"/></td>
				<td width='55%' valign="middle" bgcolor="#FFFFFF">
<font color="#181818" face="garamond" size="+1" style="font-weight:bold">
				Office of Development Commissioner(MSME)<br />
				Ministry of Micro, Small & Medium Enterprises
		  </font></td>
				<td width='19%' align='center' bgcolor="#FFFFFF"><img src="images/imagesmsme.jpg" width="179" height="73"/></td>	   					
	    </tr>
		 <tr>
    <td height="27" colspan="4" align="center" background="images/bg-grad-long-sml.png" bgcolor="#FFFFCC"><strong><font color="#FFFFFF"> Welcome , Development Institutes </font></strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <A HREF="logout.jsp?mnm=<%=Random2%>" target="_top"><font color="#FFFFFF" style="text-decoration:none" >LOGOUT</font></a>  </td>
	
    </tr>
</table>

<% }else {%>

<table width='100%' border='0' cellspacing='0' cellpadding='0'  height="101">
	<tr>
				<td width='20%' height="91" align='center' bgcolor="#297E43"><font color="#FFFFFF" size="+3">MPR </font><BR/>
		  <font color="#FFFFFF" size="+1">Development Institutes</font></td>
				<td width='6%' valign="middle" bgcolor="#FFFFFF"><img src="images/images (1).jpg" width="53" height="63"/></td>
				<td width='55%' valign="middle" bgcolor="#FFFFFF">
<font color="#181818" face="garamond" size="+1" style="font-weight:bold">
				Office of Development Commissioner(MSME)<br />
				Ministry of Micro, Small & Medium Enterprises
		  </font></td>
				<td width='19%' align='center' bgcolor="#FFFFFF"><img src="images/imagesmsme.jpg" width="179" height="73"/></td>	   					
	    </tr>
		 <tr>
    <td height="27" colspan="4" align="center" background="images/bg-grad-long-sml.png" bgcolor="#FFFFCC"><strong><font color="#FFFFFF"> Welcome , Development Institutes </font></strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <A HREF="logout.jsp?mnm=<%=Random2%>" target="_top"><font color="#FFFFFF" style="text-decoration:none" >LOGOUT</font></a>  </td>
	
    </tr>
</table>


<% }%>
</td>
    </tr>
 


 
  <%  
  String intid=(String)session.getAttribute("ins");
    if(role.equalsIgnoreCase("AU")){
 
   %>
   <tr>
   <td>
  	<table width="493" height="89" style="border:1px dotted black;" align="center" >
   	  <tr>
		<td height="30" colspan="2" align="center" bgcolor="#C2EBFE"> <strong>Entry of ACR Availability Record </strong></td>
      </tr>
   <tr><td height="29">
      <strong><font color="#990033">Section</font>
      &nbsp;</strong></td>
	  <td>
    <label>  <select name="section" id="section" style="width:400px"  >
        <%--<option value="">-Select Section-</option>--%> commented by shashi 
        <option value="1">Entry Form Section</option>
        <option value="2">Report Section</option>
        </select></label>      </td>  </tr>
 </table>
 </td></tr>
  
   
   
   <% } else {%>
   
  <tr>
    <td height="128" colspan="2" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  	
		
		
		
		<table width="493" height="231" style="border:1px dotted black;" align="center" >
<tr><td colspan="2" bgcolor="#D0A9F5" height="20"><div align="center">
	  <font color="#0066FF" size="-1"><STRONG>Welcome <%=inst%> </STRONG></font>
	  
	  
	 </div></td></tr>
						  <tr>
						    <td height="29" colspan="2" align="center" bgcolor="#C2EBFE"> <strong>Choose your Respective Month & Year</strong></td>
	      </tr>
					<% 
	    if(intid!=null && intid!=""  ){
   if(role.equalsIgnoreCase("SU")){
   
   %>	 
						 
						  <tr>
						  
						
<td height="29">
      <strong><font color="#990033">MSME-DIs</font>
      &nbsp;</strong></td>
<td colspan="1"><label>
  <select name="cmbIns" id="cmbIns" style="width: 400px"  >
      
	
  <%
	 
Connection conn = null;
    

    int sumcount=0;
	Statement st;
try{
  conn = ConnectionManager.getConnectionDirectForMySQL();
    		if(conn != null){
				Statement stmt = conn.createStatement();
				System.out.println("dfdfdfdf"+intid);
                                System.out.println("dfdfdfdf--------chan"+role);
				String userSql=null;
				if(role.equalsIgnoreCase("SU")){
					userSql="select INST_ID,INST_NAME,ID from tbl_di_institute where LOGIN_TYPE='Institute' order by INST_TYPE ";
                                        System.out.println(userSql);
				}
				

				ResultSet resultSet = stmt.executeQuery(userSql);
				while(resultSet.next()){
%>
          <option value='<%=resultSet.getString("INST_ID")%>'><%=resultSet.getString("INST_NAME")%></option>
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

			
			<% 
			
			
			} else {
			
		
		%>
		 <input type="hidden" name="cmbIns" id="cmbIns" value='<%=intid%>' />
		  <% }%>
		  <%
			} else
			{response.sendRedirect("stat.jsp"); }
			%>
  </select></label>  </td></tr>
      <tr><td height="29">
      <strong><font color="#990033">Section</font>
      &nbsp;</strong></td>
	  <td>
    <label>  <select name="section" id="section" style="width:400px"  >
       <%-- <option value="">-Select Section-</option>--%> commented by shashi bhusan
        <option value="1">Entry Form Section</option>
        <option value="2">Report Section</option>
        </select></label>      </td>  </tr>
  <tr><td height="29">
      <strong><font color="#990033">Month</font>
      &nbsp;</strong></td>
	  <td>
    <label>  <select name="cmbMonth" id="cmbMonth" style="width:400px"  >
        
        <option value="1">APRIL</option>
        <option value="2">MAY</option>
        <option value="3">JUNE</option>
        <option value="4">JULY</option>
        <option value="5">AUGUST</option>
        <option value="6">SEPTEMBER</option>
        <option value="7">OCTOBER</option>
        <option value="8">NOVEMBER</option>
        <option value="9">DECEMBER</option>
        <option value="10">JANUARY</option>
        <option value="11">FEBRUARY</option>
        <option value="12">MARCH</option>
      </select></label>      </td>  </tr>
	    <tr>
      <td height="29"><strong><font color="#990033">Year</font></strong> </td>
      <td><label><select name="cmbYear" id="cmbYear" style="width: 400px" class="textbox">
          <option value="2024-2025">2024-2025</option>
          <option value="2023-2024">2023-2024</option>
          <option value="2022-2023">2022-2023</option>
          <option value="2021-2022">2021-2022</option>
          <option value="2020-2021">2020-2021</option>
          <option value="2019-2020">2019-2020</option>
          <option value="2018-2019">2018-2019</option>
          <option value="2017-2018">2017-2018</option>
          <option value="2016-2017">2016-2017</option>
          <option value="2015-2016">2015-2016</option>
          <option value="2014-2015">2014-2015</option>
          <option value="2013-2014">2013-2014</option>
          <option value="2012-2013">2012-2013</option>
          <option value="2011-2012">2011-2012</option>
        </select></label>      </td>
    </tr>
	 <% }%>
	 <input type="hidden" name="crosssite" id="crosssite" value="<%=Random2%>" >
<tr >
      <td height="36" colspan="2" align="center" ><html:submit>Submit</html:submit></td>
    
    </tr>
	     
	     
    
			</html:form>
					
		  </table>
    
   </td> </tr>
	 <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
	
  </tr>
   <tr>
    <td width="100%" align="center" bgcolor="#0099FF"><strong><font color="#FFFFFF" size="-1">Created & Designed by O/O DC-MSME</font></strong></td>
    </tr>
   </table>
 
  
  



	


</body></html>