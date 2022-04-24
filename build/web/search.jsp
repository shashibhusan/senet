<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@taglib uri="/web-INF/struts-bean.tld" prefix="bean" %>
<%@taglib uri="/web-INF/struts-html.tld" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>

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
<script type="text/javascript">
            function submitForm()
            {
                document.forms[0].action = "Courtcases.do?method=add";
                document.forms[0].submit();
            }
        </script>
</head>

<body bgcolor="#CADDE4">


<center>
<html:form action="Courtcases" onsubmit="return validate()">


<table align="center">

</table><br />
  <table id="MainTbl" align="center" border=1 width="52%"  bordercolor="#FFFFFF" cellpadding="5" cellspacing="0" style="border-collapse: collapse">
  
 
	
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
<script src="JS/jquery.autocomplete.js"></script>
	
	
	
	
	 <tr>
      
	  <td width="46" align="left">Search  </td>
      <td width="206" align="left">
         <input type="text" id="cases_related_to" name="cases_related_to" class="input_text1"/> &nbsp;&nbsp;&nbsp; <html:submit value="Add" onclick="submitForm()" />
      <script>
	jQuery(function(){
		$("#cases_related_to").autocomplete("list1.jsp");
	});
	</script>          </td>
      <!--<td width="414" align="left"><input type="text" size="63" name="nature_of_court" /></td>-->
    </tr>
</table>
 
</body>

</html:form>

</div>
</html>
