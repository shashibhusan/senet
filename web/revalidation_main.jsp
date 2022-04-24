<%--
    Document   : index
    Created on : 2 May, 2017, 12:15:01 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Re-validation</title>
    </head>
    <script>
     function validate() {

var months=document.frmMain.cmbMonth.value;

//if(months==1) {
// document.forms[0].action = "mainDaily.jsp"
//}
//if(months==2) {
// document.forms[0].action = "Att_main.jsp"
//}
//else if(months==3) {
// document.forms[0].action = "indMain.jsp"
//}
     }
</script>
</head>

<body>



<form name="frmMain"  method="post" action="SenetPerformance.jsp" >



<INPUT type=hidden value=server%3DRep60_WEB6+report%3DD%3A%5Cmsmeab%2ERDF+userid%3Dsenet%2Fsenet%40livedb1+destype%3Dcache+desformat%3DPDF name=hidden_run_parameters>
<br><br>
          <br>
          
<h2 align="center" ><font  color="#000099">  Revalidation Amount  </font></h2>
<br>
         
<!-- <form name="frmMain" method="post" onSubmit="return fnSubmit()"> -->
	<table  BORDER="1" align="center"  bgcolor=""  bordercolordark="#0000FF" width="550px"background="images/pc.png">


  <tr>
      <td>
          <br>


          <table align="center">
              <tr>
                  <%--           <td>
          <strong>&nbsp;&nbsp;Employee ID
              &nbsp;</strong> <input type="EmpID" name="EmpID"/><br> </td>

--%>

  <td>
       <strong>&nbsp;&nbsp;Please select Year:
      &nbsp;</strong>
      <br>
</td><td>
      <select name="cmbMonth" id="cmbMonth" style="width: 200px">
          <option> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;---- Option ----</option>

          <option value="2016-2017">2016-2017</option>
          <option value="2017-2018">2017-2018</option>
          <option value="2018-2019">2018-2019</option>
          <option value="2019-2020">2019-2020</option>

      </select>
    <br> </td>
              <br>


  </tr>

  <tr align="center">
      <td colspan="4" ><center>
  <br/>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="submit" name="submitHTML" value="Submit" onclick=" return validate()"/>
 </center> </td>
</tr>
</table>
<br>
</td>
</tr>
</table>
</form>
</body>
</html>

