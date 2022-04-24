<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<html>
<head>
  <title>CHANGE PASSWORD</title>
  <script type="text/javascript">

   function changeScreenSize(w,h)
     {
       window.resizeTo( w,h )
     }
	 
  </script>
   <script type="text/javascript">
    function checkPass(){
      //Store the password field objects into variables ...
      var Passwd = document.getElementById('Passwd');
      var PasswdAgain = document.getElementById('PasswdAgain');
      //Store the Confimation Message Object ...
      var message = document.getElementById('confirmMessage');
      //Set the colors we will be using ...
      var goodColor = "#66cc66";
      var badColor = "#ff6666";
      //Compare the values in the password field 
      //and the confirmation field
      if(Passwd.value == PasswdAgain.value){
       
        PasswdAgain.style.backgroundColor = goodColor;
		alert("password match");
        message.style.color = goodColor;
		alert("password match");
        message.innerHTML = "Passwords Match!"
		alert("password match");
      }else{
        
        PasswdAgain.style.backgroundColor = badColor;
		//alert("Password didn't match");
        message.style.color = badColor;
        message.innerHTML = "Passwords Do Not Match!"
		 //alert("Password didn't match");
      }
	  } 
	  
   function checkForm(form)
  {
    var OldPasswd=document.getElementById('OldPasswd');
    if(form.OldPasswd.value == '') {
      alert("Error: old password shouldn't be blank");
      form.OldPasswd.focus();
      return false;
    }
	var Passwd=document.getElementById('Passwd');
    if(form.Passwd.value == '') {
      alert("Error: password shouldn't be blank");
      form.Passwd.focus();
      return false;
    }
	var PasswdAgain=document.getElementById('PasswdAgain');
    if(form.PasswdAgain.value == '') {
      alert("Error: password shouldn't be blank");
      form.PasswdAgain.focus();
      return false;
    }
	
	  return true;
  }
  
</script>

</head>
 <body >
 <% 
 
	String USER_ID = request.getParameter("user_id");
	System.out.println("12345"+request.getParameter("user_id"));
	String PASSWORD =request.getParameter("OldPasswd");
	System.out.println("PASSWORD"+PASSWORD);
	String NewPASSWORD =request.getParameter("PasswdAgain");
	
	
		ResultSet rsAdminResult = null;
		Connection con = null;
	     Statement stmt = null;
	
	     con = ConnectionManager.getConnectionDirect();
	     stmt = (Statement)con.createStatement();

String strSql = "select count(USER_ID) cnum from MSME_USERS where USER_ID='"+USER_ID+"' and PASSWORD='"+PASSWORD+"'";
rsAdminResult = stmt.executeQuery(strSql);

	if(rsAdminResult.next()){
		System.out.println("Result Set have record"+strSql);
		//divFlag=1;
	}
	else{
	System.out.println(" Result Set have not record");
	//buttonFlag=1;
	}	
	%>
 <%
 Connection con1 = ConnectionManager.getConnectionDirect();
Statement stmt1 = (Statement)con1.createStatement();
	
	System.out.println("In Condition cnum"+rsAdminResult.getDouble("cnum"));
if (rsAdminResult.getInt("cnum")>0)
	{
		System.out.println("In Condition");
		String strSql1= "UPDATE MSME_USERS SET PASSWORD = '"+NewPASSWORD+"' WHERE USER_ID = '"+USER_ID+"' ";
		System.out.println("In Condition cnum praksh"+ strSql1);
		int status=0;
		
	   status = stmt1.executeUpdate(strSql1);
System.out.println("In Condition cnum"+ strSql1);
	
	}
	%>	
	 <table width="100%" align="center">
	<div class="body">
  <font face="Arial, sans-serif" > <table width="100%" cellpadding="3">
  <tr>
  <td nowrap>
    <div align="center"><b><font color="#333333">Change password</font></b></div></td>
  </tr>
  </table>
  
  <table width="100%" align="center" cellpadding="0" border="1"BORDERCOLOR="#990066" style="border-collapse: collapse">
  <tr>
  <td  valign="top" width="0%"><br/>
  <form action="EditPassword.jsp" method="post" onSubmit="return checkForm(this);">
  <% 
  String userid=request.getParameter("mnm");
  %>
  <input type="hidden" value='<%=userid%>' name="user_id" id="user_id"size="25" /> 
    <table width="0%" border="0" cellspacing="2" cellpadding="2" BORDERCOLOR="#990066" style="border-collapse: collapse">
  <tr>
  <td valign="top" nowrap="nowrap" id="currPasswdDiv">

  <font size="-1">Current password:</font>  </td>
  <td width="*"><input type="password" name="OldPasswd" id="OldPasswd" size="25" />  </td>
  </tr>
  <tr>
<td colspan="2"><font size="-2">&nbsp;  </font>  </td> </tr>
<tr><td valign="top" nowrap="nowrap"><font size="-1">New password:  </font>  </td>
  <td valign="top"><table cellpadding="0" bgcolor="#ffffff" cellspacing="0" border="0">
  <tbody>
  <tr>
  <td valign="top"><input type="password" name="Passwd" id="Passwd"size="25" onkeyup="CreateRatePasswdReq(0)"/>  </td>
  <td width="10px"></td> <td nowrap="nowrap" valign="top" id="passwdBarDiv" style="display:none" width="180">&nbsp;</td> </tr>
  </tbody>
  </table>  </td>
  </tr>
    <tr>
<td colspan="2"><font size="-2">&nbsp;  </font>  </td> </tr>
<tr><td valign="top" nowrap="nowrap"><font size="-1">Confirm New password:  </font>  </td>
  <td valign="top"><table cellpadding="0" bgcolor="#ffffff" cellspacing="0" border="0">
  <tbody>
  <tr>
  <td valign="top"><input type="password" name="PasswdAgain" id="PasswdAgain"onkeyup="checkPass(); return false;"size="25" onkeyup="CreateRatePasswdReq(0)"/>  </td>
  <td width="10px"></td> <td nowrap="nowrap" valign="top" id="passwdBarDiv" style="display:none" width="180">&nbsp;</td> </tr>
  </tbody>
  </table>  </td>
  </tr>
 <!-- <tr>
  <td valign="top" nowrap="nowrap" <font size="-1"> Confirm new password:  </font>  </td>
  <td> <input type="password" name="PasswdAgain" id="PasswdAgain"onkeyup="checkPass(); return false;"size="25" />  </td>
  </tr><input type="hidden" name="p" value="" />-->
  <tr>
  <td colspan="1">&nbsp;</td>
  
  <td nowrap="nowrap" align="left   style="{padding-top:10px;}">
  <input type="submit" name="save" id="save" value="change password" style='font-weight:bold;' />
  <input type="submit" name="cancel" id="cancel" value="Cancel" />  </td>
  </tr>
  
  </table>
    <div align="CENTER"><br />
      </div>
  </form>  </td>
  </tr>
  </table>
  </font>
  </div>
</body>
 </html>
