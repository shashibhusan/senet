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

<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="description" content="Styling Select Elements" />
<title>Untitled Document</title>
<script language="JavaScript">
window.history.forward(0);
</script>
<script type="text/javascript">
<!-- 
function fnSubmit() {
      
if(document.frmMain.cmbIns.value!="" && document.frmMain.cmbMonth.value!="" && document.frmMain.cmbYear.value!="" ) {
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

System.out.println("hjhjhjghjjhjhg  main page"+Random2);

  session.setAttribute("Random5",Random2);	 %>
 
  	<form  action="FileSave.do" method="post" enctype="application/x-www-form-urlencoded" onsubmit="return fnSubmit()" >
<center>
		<table width="930" style="border:1px dotted black;" >
  <tr>
    <td colspan="2" ><table width="1030" style="border:1px dotted black;"  >
  <tr>
    <td colspan="2"  bgcolor="#990033" height="79">
	
		<table width='100%' border='0' cellspacing='0' cellpadding='0'  height="101">
	<tr>
				<td width='20%' height="91" align='center' bgcolor="#297E43"><font color="#FFFFFF" size="+3">MPR</font><BR/>
		  <font color="#FFFFFF" size="+1">Development Institutes</font></td>
				<td width='6%' valign="middle" bgcolor="#FFFFFF"><img src="images/images (1).jpg" width="53" height="63"/></td>
				<td width='55%' valign="middle" bgcolor="#FFFFFF">
<font color="#181818" face="garamond" size="+1" style="font-weight:bold">
				Office of Development Commissioner(MSME)<br />
				Ministry of Micro, Small & Medium Enterprises
		  </font></td>
				<td width='19%' align='center' bgcolor="#FFFFFF"><img src="images/imagesmsme.jpg" width="179" height="73"/></td>	   					
	    </tr>
</table></td>
    </tr>
  <tr>
   
	 <td height="30" colspan="2"  align="right" valign="bottom" background="images/bg-grad-long-sml.png" >&nbsp;&nbsp; <A HREF="logo.jsp?mnm=<%=Random2%>" <font color="white" size="-1" style="text-decoration:none" ><strong>Logout</strong></font></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <a href="chnagepsw.jsp" style="text-decoration:none"></a></td>
    </tr>
 

 
 
  <%  System.out.println("prakash chandra ---------chanda======"+sessionid);
 String role=(String)session.getAttribute("rol");
 String inst=(String)session.getAttribute("inst");

 
   System.out.println("prakash chandra ---------chanda======"+role);
  //String role=request.getParameter("role");
  String intid=(String)session.getAttribute("ins");
  
  
 

   
   %>
  <tr>
    <td height="128" colspan="2" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <div align="center">
	  <font color="#0066FF" size="-1"><STRONG>MPR-DIs</STRONG></font>
	  
	  
	 </div>	
		
		
		
		<table width="493" height="231" style="border:1px dotted black;" align="center" >

						  <tr>
						    <td height="29" colspan="2" align="center" bgcolor="#C2EBFE"> <strong>Choose your Respective Month & Year</strong></td>
	      </tr>
					<% 
	    if(intid!=null && intid!=""  ){
   if(role.equalsIgnoreCase("SU")){
   
   %>	 
						 
						  <tr>
						  
						
<td height="29">
      <strong><font color="#990033">MSME-ABs</font>
      &nbsp;</strong></td>
<td colspan="1"><label>
  <select name="cmbIns" id="cmbIns" style="width: 400px"  >
      
	
  <%
	 
Connection conn = null;
    

    int sumcount=0;
	Statement st;
try{
  conn = ConnectionManager.getConnectionDirectForMySQL();
    //Class.forName(driver).newInstance();

     // conn = DriverManager.getConnection(url+dbName,userName,password);

			if(conn != null){
				Statement stmt = conn.createStatement();
				
                              
                //String intid=request.getParameter("cmbIns");
				System.out.println("dfdfdfdf"+intid);
                                System.out.println("dfdfdfdf--------chan"+role);
				String userSql=null;
				if(role.equalsIgnoreCase("SU")){
					userSql="select INST_ID,INST_NAME,ID from tbl_di_institute order by ID ";
                                        System.out.println(userSql);
				}
				

				ResultSet resultSet = stmt.executeQuery(userSql);
				//String cmbIns = resultSet.getString("INST_ID");
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
       <option value="1">Entry Form Section</option>
        <option value="2">Report Section</option>
        </select></label>      </td>  </tr>
  <tr><td height="29">
      <strong><font color="#990033">Month</font>
      &nbsp;</strong></td>
	  <td>
    <label>  <select name="cmbMonth" id="cmbMonth" style="width:400px"  >
        <option value="10">JANUARY</option>
        <option value="11">FEBRUARY</option>
        <option value="12">MARCH</option>
        <option value="1">APRIL</option>
        <option value="2">MAY</option>
        <option value="3">JUNE</option>
        <option value="4">JULY</option>
        <option value="5">AUGUST</option>
        <option value="6">SEPTEMBER</option>
        <option value="7">OCTOBER</option>
        <option value="8">NOVEMBER</option>
        <option value="9">DECEMBER</option>
      </select></label>      </td>  </tr>
	    <tr>
      <td height="29"><strong><font color="#990033">Year</font></strong> </td>
      <td><label><select name="cmbYear" id="cmbYear" style="width: 400px" class="textbox">
          <option value="2011-2012">2005-2006</option>
          <option value="2012-2013">2006-2007</option>
          <option value="2013-2014">2007-2008</option>
          <option value="2014-2015">2008-2009</option>
          <option value="2015-2016">2009-2010</option>
          <option value="2016-2017">2010-2011</option>
	  <option value="2011-2012">2011-2012</option>
          <option value="2012-2013">2012-2013</option>
          <option value="2013-2014">2013-2014</option>
          <option value="2014-2015">2014-2015</option>
          <option value="2015-2016">2015-2016</option>
          <option value="2016-2017">2016-2017</option>
		  <option value="2011-2012">2017-2018</option>
          <option value="2012-2013">2018-2019</option>
          <option value="2013-2014">2019-2020</option>
       </select></label>      </td>
    </tr>
	 <input type="hidden" name="crosssite" id="crosssite" value="<%=Random2%>" >
	  
	  <tr><td align="center" colspan="2" height="35px" valign="bottom"><tr >
      <td height="36" colspan="2" align="center" ><input type="submit" name="Go"/></td>
    
  
	     
	      
    
					</form></table>
    </td>
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
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" bgcolor="#0099FF" align="center"><strong><font color="#FFFFFF" size="-1">Created & Designed by O/O DC-MSME</font></strong></td>
    </tr>
</table>

</center>

	


</body></html>