<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ page autoFlush="true" buffer="1094kb"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<link href="inb.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>Court Cases Details </title>
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen"
     href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
 <script src="new2.js" type="text/javascript"></script>
<SCRIPT LANGUAGE="JavaScript">
function textCounter(field,cntfield,maxlimit) {
if (field.value.length > maxlimit) // if too long...trim it!
field.value = field.value.substring(0, maxlimit);
// otherwise, update 'characters left' counter
else
cntfield.value = maxlimit - field.value.length;
}
//  End -->
</script>

<script language="javascript" type="text/javascript" src="datetimepicker.js">
		 
		 function fntextval(objtxt)
		 {
		     if(objtxt.value=="")
			 alert("Value is missing");
			 return;
		 }
</script>
<script language="javascript">
  function validate(){
	var serial_number=trim(document.form1.serial_number.value);
	var nature_of_court=trim(document.form1.nature_of_court.value);
	var detail_of_case=trim(document.form1.detail_of_case.value);
	var present_status_of_the_case=trim(document.form1.present_status_of_the_case.value);
	var controlling_Officers=trim(document.form1.controlling_Officers.value);
	var cases_related_to=trim(document.form1.cases_related_to.value);
	var year_of_case=trim(document.form1.year_of_case.value);
	var detail_of_application=trim(document.form1.detail_of_application.value);
	var stakes_involved=trim(document.form1.stakes_involved.value);
	var status=trim(document.form1.status.value);
	var affidavit_date_of_filing_CA=trim(document.form1.affidavit_date_of_filing_CA.value);
	var expected_date_of_filing=trim(document.form1.expected_date_of_filing.value);
	var date_of_next_hearing=trim(document.form1.date_of_next_hearing.value);


		if(serial_number=="")
  {
    alert(" serial_number Field is Empty");
    document.form1.serial_number.focus();
    return false;
  }
  	else if(nature_of_court=="")
  {
    alert(" nature_of_court Field is Empty");
    document.form1.nature_of_court.focus();
    return false;
  }
  else if(detail_of_case=="")
  {
    alert(" detail_of_case Field is Empty");
    document.form1.detail_of_case.focus();
    return false;
  }
   else if(present_status_of_the_case=="")
  {
    alert(" present_status_of_the_case Field is Empty");
    document.form1.present_status_of_the_case.focus();
    return false;
  }
   else if(controlling_Officers=="")
  {
    alert(" controlling_Officers Field is Empty");
    document.form1.controlling_Officers.focus();
    return false;
  }
  else if(cases_related_to=="")
  {
    alert(" cases_related_to Field is Empty");
    document.form1.cases_related_to.focus();
    return false;
  }
  else if(year_of_case=="")
  {
    alert(" year_of_case Field is Empty");
    document.form1.year_of_case.focus();
    return false;
  }
  else if(detail_of_application=="")
  {
    alert(" detail_of_application Field is Empty");
    document.form1.detail_of_application.focus();
    return false;
  }
  else if(stakes_involved=="")
  {
    alert(" stakes_involved Field is Empty");
    document.form1.stakes_involved.focus();
    return false;
  }
  else if(status=="")
  {
    alert(" status Field is Empty");
    document.form1.status.focus();
    return false;
  }

   }
   function trim(s) {
    return s.replace( /^\s*/, "" ).replace( /\s*$/, "" );

}

  </script>
</head>

<body bgcolor="#FBFBFB">



<center>


<form  name="form1" id="form1" method="post" action="Courtcases.do" onSubmit="return validate()">

<%

try
{

String instId="I5";
System.out.println("==instId==="+instId);
String role="SU";
System.out.println("==role==="+role);
String years="2011-2012";
System.out.println("==years==="+years);
String months="10";
System.out.println("==months==="+months);
String user="admin";
System.out.println("==user==="+user);
String Random5=(String)session.getAttribute("Random5");
System.out.println("==Random5==="+Random5);
String mnm = request.getParameter("mnm");
System.out.println("prakash chandradeynccffffff ---------chanda financial page ======"+mnm);
if ( (instId.matches("[a-zA-Z_0-9 ]+")) && ((years.length()==9) && (years.substring(0, 1).matches("[0-9]"))) &&( months.matches("[0-9]+")))  {
	System.out.println("pattern matches");
%>
<%

try{
Connection con = ConnectionManager.getConnectionDirectForMySQL();
Statement stmt4 = (Statement)con.createStatement();
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
<table width="563" align="center">
<tr><td align="center">
<div style="font-size:large;font-family:Verdana;font-weight:bold" align="center"><font color="#990000"> JUDICAL DETAILS OF THE <%=rs_instName.getString("INST_NAME")%>,  Year <%=years%></font></div>

</td></tr>
</table><br />
  <table id="MainTbl" align="center" border=1 width="100%"  bordercolor="#FFFFFF" cellpadding="5" cellspacing="0" style="border-collapse: collapse">
<input type="hidden" size="5" name="months" value="<%=months%>" />
<input type="hidden" size="5" name="years" value="<%=years%>" />
<input type="hidden" size="5" name="instId" value="<%=instId%>" />
<input type="hidden" size="5" name="mnm" value="<%=mnm%>" />
<input type="hidden" size="5" name="user_date" value='<%=years%>-<%=months%>-20' />
   <tr>
      <td width="263" align="left" class="tablecontent11">File Number </td>
      <td colspan="2" align="left" class="tablecontent11"><input type="text" size="43" name="serial_number" id="serial_number" class="input_text" /></td>
    </tr>

<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
<script src="JS/jquery.autocomplete.js"></script>

	 <tr>
	   <td align="left" class="tablecontent12" >Status</td>
	   <td colspan="2" align="left" class="tablecontent12"><input type="radio" name="status_of_case" value="completed" /> Completed
<input type="radio" name="status_of_case" value="Running" />
Running</td>
	 </tr>
	 <tr>
      <td width="263" align="left" class="tablecontent11">Type of Court </td>
      <td colspan="2" align="left" class="tablecontent11">



		<select name="nature_of_court" id="nature_of_court" style="width: 180px"  >
		<option value="S">Supreme Court</option>
		<option value="H">High Court</option>
		<option value="C">CAT</option>
		<option value="O">Others</option>
		</select>


	  </td>

    </tr>
	<tr>
      <td align="left" class="tablecontent12">Detail of Case </td>
      <td colspan="2" align="left" class="tablecontent12"><textarea id="detail_of_case" rows="2" cols="42" name="detail_of_case"   title="mandatory to field by institute"tabindex="15"  maxlength="375" wrap="physical"  class="input_text1"
	   onKeyDown="textCounter(document.form1.detail_of_case,document.form1.remLen1,125)"
		onKeyUp="textCounter(document.form1.detail_of_case,document.form1.remLen1,125)">
	  </textarea>	       </td>
    </tr>
	 <tr>

	  <td width="263" align="left" class="tablecontent11">Controlling Sections   </td>
      <td colspan="2" align="left" class="tablecontent11">
		<select name="cases_related_to" id="cases_related_to" style="width: 180px"  >
		<option value="MPC">Marketing,planning & co-ordinate</option>
		<option value="INV">Innovation</option>
		<option value="CHE">Chemical</option>
		<option value="SDT">skill development & Training</option>
		<option value="ADM">Adminstartive Matters</option>
		<option value="MEC">Mechanical</option>
		<option value="IFV">Infrastructure & Vigilance</option>
		<option value="INF">institutional finance</option>
		<option value="MIS">miscellaneous</option>
		</select>

		 </td>
      
    </tr>



    <tr>
      <td align="left" class="tablecontent11">Stakes involved </td>
      <td colspan="2" align="left" class="tablecontent11" ><input type="text" size="43" name="stakes_involved" id="stakes_involved" class="input_text1"/></td>
    </tr>
    <tr>
      <td align="left" class="tablecontent12">Status of Stay,if any </td>
      <td colspan="2" align="left" class="tablecontent12"><input type="text" size="43" name="status" id="status"  class="input_text1"/></td>
    </tr>
    <tr>
      <td align="left" class="tablecontent11">Detail of applications filed for early hearing </td>
    <td colspan="2" align="left" class="tablecontent11"><textarea  rows="2" cols="42" name="detail_of_application" id="detail_of_application"  class="input_text1" title="mandatory to field by institute"tabindex="15"  maxlength="375" wrap="physical"
	   onKeyDown="textCounter(document.form1.detail_of_application,document.form1.remLen12,125)"
		onKeyUp="textCounter(document.form1.detail_of_application,document.form1.remLen12,125)" >
	  </textarea>    </tr>
    <tr>
      <td height="34" align="left" class="tablecontent12">Present Status of the case </td>
      <td colspan="2" align="left"class="tablecontent12" ><textarea  rows="2" cols="42" name="present_status_of_the_case"  class="input_text1" id="present_status_of_the_case"   title="mandatory to field by institute"tabindex="15"  maxlength="375" wrap="physical"
	  onKeyDown="textCounter(document.form1.present_status_of_the_case,document.form1.remLen11,125)"
		onKeyUp="textCounter(document.form1.present_status_of_the_case,document.form1.remLen11,125)"></textarea></td>
    </tr>
	<tr>
      <td align="left" class="tablecontent11">Controlling Officers </td>
      <td colspan="2" align="left" class="tablecontent11"><input type="text" size="43" name="controlling_Officers"  id="controlling_Officers" class="input_text"/></td>
    </tr>
	 <tr>
	   <td rowspan="4" align="left" class="tablecontent12">Important Dates</td>
	   <td width="178" align="left" class="tablecontent12">Year of case</td>
	   <td width="276" align="left" class="tablecontent12"><input type="text" size="20" name="year_of_case" id="year_of_case"  class="input_text" value="2012" /></td>
	 </tr>
	 <tr>
	   <td align="left" class="tablecontent11"> date of filing latest Response  </td>
	   <td align="left" class="tablecontent11">
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
    <input data-format="yyyy-MM-dd" type="text"  name="affidavit_date_of_filing_CA" id="affidavit_date_of_filing_CA"></input>
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
	 <tr>
	   <td align="left" class="tablecontent12">Expected date of filing Counter Affidavit Reply(if yet to be filled)</td>
	   <td align="left" class="tablecontent12">

	    <div id="datetimepicker5" class="input-append">
    <input data-format="yyyy-MM-dd" type="text"  name="expected_date_of_filing" id="expected_date_of_filing"></input>
    <span class="add-on">
      <i data-time-icon="icon-time" data-date-icon="icon-calendar" >
      </i>
    </span>

</div>
	   <script type="text/javascript">
  $(function() {
    $('#datetimepicker5').datetimepicker({
      pickTime: false
    });
  });
</script>
	   </td>
    </tr>
	 <tr>
	   <td align="left" class="tablecontent11">Date of next Hearing</td>
	   <td align="left" class="tablecontent11">




	    <div id="datetimepicker6" class="input-append">
    <input data-format="yyyy-MM-dd" type="text"  name="date_of_next_hearing" id="date_of_next_hearing"></input>
    <span class="add-on">
      <i data-time-icon="icon-time" data-date-icon="icon-calendar" >
      </i>
    </span>

</div>
	   <script type="text/javascript">
  $(function() {
    $('#datetimepicker6').datetimepicker({
      pickTime: false
    });
  });
</script>

	   </td>
    </tr>
</table>
Note:-- Insert Date  value in YYYY-mm-dd format.
</body>
<br><br><br>




<input type="submit" name="submit" value="submit" tabindex= "28"/>

<input class="butt" type="button" name="reset" value="Reset" tabindex="18" onclick="pageReload()"/>&nbsp;
<input name="button2" type="button" onClick="window.print();return false;" value=" Print" />

<%

}// End of Try
catch(SQLException e){
			//e.printStackTrace();
			int eCode = e.getErrorCode();
			String eMsg  =e.getMessage();
			System.out.println(" SQLException = "+e.getErrorCode()+" = "+e.getMessage());
			if(e.getErrorCode()==1){
				System.out.println("Duplicate Entry");
				}
				%>
	<jsp:forward  page="error.jsp">
	<jsp:param name="ecode" value="<%=eCode%>"/>
	<jsp:param name="emsg" value='<%=eMsg%>'/>
	</jsp:forward>
				<%
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			String eMsg  =e.getMessage();
			System.out.println(" Exception = "+e.getMessage());
				%>
	<jsp:forward page="error.jsp">
	<jsp:param name="ecode" value="0"/>
	<jsp:param name="emsg" value='<%=eMsg%>'/>
	</jsp:forward>
<%
	}
	finally{

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
	<a href="Session.jsp" target="_top" id="linkid"></a>
	<%
	}
 %>
</form>

</div>
</html>
