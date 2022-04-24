<%-- 
    Document   : EIS_main
    Created on : Dec 29, 2017, 4:53:40 PM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*"  %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <title>EIS Register</title>
        <link rel="shortcut icon" href="fevicon.png" type="image/x-icon">
        <style>
            h3{
               margin-left: -140px;
               font-style: normal;
               font-size: 18px;
               font-family: sans-serif;
}
            .menu1
{
    width: 100%;
    background: #FF5733;
    color: white;
    font-family: sans-serif;
    padding-top: 5px;
    padding-bottom: 10px;
 }
 .login{
     width: 350px;
     height: 570px;
     border-radius: 5px;
     border: 2px black solid;
     color:   #566573 ;
     background:  #ffffff ;
     margin: 0px;
     padding: 0px;
     

}
.data{
 
    font-size: 15px;
   
    margin-left: 20px;
    color: black;
    font-family: sans-serif;
    font-size: 12px;


}
.data1{

    font-size: 22px;
    font-weight: bold;
   

}
input[type=text], [type=date], [type=number], select{
    width: 80%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 3px;
    box-sizing: border-box;
}

input[type=submit],[type=button] {
    width: 80%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: no-drop; 
}

input[type=submit]:hover {
    background-color: #45a049;
}
a:link {
    text-decoration: none;
    color:  #2e00ff ;
}

a:visited {
    text-decoration: none;
    color: blue;
}

a:hover {
    text-decoration: none;
}

a:active {
    text-decoration: none;

}
h4{
               font-weight: bold;
               font-size: 14px;
               font-family: sans-serif;
               margin-right: 85px;
               margin-top: -54px;
               margin-bottom: 35px;
}
p{
font-family: sans-serif;
font-size: 15px;
color:   #ff6100  ;
padding-top: 6px;
}
div {
    border-radius: 5px;
   
}
  div.ui-datepicker{
       width: 270px;
    font-size:13px;
    padding-bottom: 0px;
    padding-left: -15px;
    padding-right: 0px;
    padding-top: 0px;
    margin-bottom: 0px;
    margin-left: 0px;
    margin-right: 0px;
    margin-top: 0px;
    display: inline-block;
    border-radius: 0px;

   }
   datepicker.select{
     padding-bottom: 0px;
    padding-left: -15px;
    padding-right: 0px;
    padding-top: 0px;
    margin-bottom: 0px;
    margin-left: 0px;
    margin-right: 0px;
    margin-top: 0px;
}
.dropbtn {
    color: blue;
    padding: 5px;
    font-size: 13px;
    border: none;
}
#dropbtn {
    color: blue;
    padding: 5px;
    font-size: 13px;
    border: none;
}
.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: fixed;
    background-color: #f1f1f1;
    min-width: 130px;
    z-index: 1;
    font-size: 12px;
    font-weight: normal;
}

.dropdown-content a {
    color: black;
    padding: 8px 12px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #ddd}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color: none;
}
alert{
    color: red;
    font-size: 15px;
}

        </style>
        <script>
$(function () {

    $(".datepicker").datepicker({
        changeMonth: true,
        changeYear: true,
       yearRange: "-68:+5",
       dateFormat: "dd/mm/yy"
  /*     monthNamesShort  : fullmonth_array         */

    });
});
            
         function myFunction() {
         var name=document.getElementById("name").value;
         var email=document.getElementById("email").value;
         var dob=document.getElementById("dob").value;
         var curr_post=document.getElementById("curr_post").value;
         var curr_ofc=document.getElementById("curr_ofc").value;
         var mobile=document.getElementById("mobile").value;
         
         if (name=="" || name==null){
                alert("Please enter your name.....");
                    return false;
            }

            if (email=="" || email==null){
                alert("Please enter your email.....");
                    return false;
            }
            var atpos = email.indexOf("@");
            var dotpos = email.lastIndexOf(".");
            if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length) {
            alert("Not a valid e-mail address");
                    return false;
            }

            if (mobile=="" || mobile==null){
                alert("Please enter your mobile no....");
                    return false;
            }
            if (dob=="" || dob==null){
                alert("Please enter Date of Birth.....");
                    return false;
            }

            if (curr_post=="" || curr_post==null){
                alert("Please select your Designation.....");
                    return false;
            }

            if (curr_ofc=="" || curr_ofc==null){
                alert("Please select Current Office.....");
                    return false;
            }
            else

           {
    document.forms[0].action = "EIS_success_register.jsp"
    return true;
        }
             }

             function warning(){
                 alert("Registration is Currently Unavailable. It will be open soon for new user only.")
                 return false;
             }
        </script>

    </head>
    <body background=" #ecf0f3 ">
        <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; " align="center">Government of India, Ministry of MSME </div>
        <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"></font>O/o  DCMSME </div>
        <%--         <div style="font-size: large;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"> <%=user_cur_ofc%></font></div> --%>
       <div style="font-size:14px;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center" ><font color="#990000">ALL INDIA MSME-DO EMPLOYEE'S INFORMATION SYSTEM </font>
         </div>
         
        
         
        
         <h4 align="right">
             <div class="dropdown" id="dropbtn">
		<%--	 <a href="SS/ss_registration.jsp">Grievance Signup [SS]</a>
		--%>
			 </div> |
  <div align="left" class="dropdown">
  <a class="dropbtn" >Login</a>
  <div class="dropdown-content">
      <a href="EIS_login.jsp">EIS login</a>
      <a href="EIS_Admin.jsp">Admin Login</a>
 <%--     <a href="gr_login.jsp">Grievance Login</a>
      <a href="ss_login.jsp">Grievance Login [SS]</a>
    
--%>
  </div>
</div></h4>
         <table align="center" border="0px">
             <tr>
                 <td  align="center">
                     <strong style=" font-size: 20px; font-weight: 100;  font-family:sans-serif;"><b>Registration Form</b></strong>
                 </td>
             </tr>
             <tr>
                 <td>&nbsp;</td>
             </tr>
             <tr><td>
             <div align="center" class="login">
                 <br><br>
                 
    <form name="myform" method="post" action="" onsubmit="return myFunction()" >
    <div id="fname" align="left" class="data">Full Name<br/></div>
    <input type="text" id="name" name="name" placeholder="Your name.." onkeypress="return warning()" >

    <div for="lname" align="left" class="data">Email<br/></div>
    <input type="text" id="email" name="email" placeholder="Your email.." onkeypress="return warning()" >

    <div for="lname" align="left" class="data">Mobile<br/></div>
    <input type="number" id="mobile" name="mobile"  min="1000000000" max="9999999999" maxlength="10" placeholder="Your mobile no.." onkeypress="return warning()" >

    <div align="left" class="data">Date of Birth<br/></div>
    <input type="text" class="datepicker" id="dob" name="dob" placeholder="dd/mm/yyyy" onkeypress="return warning()" >

    <div align="left" class="data">Designation<br/></div>
    <select id="curr_post" name="curr_post" onchange="return warning()">
        <option value="">Select</option>
        <option value="AIA">AIA</option>
        <option value="Director">Director</option>
        <option value="Dy. Director">Dy. Director</option>
        <option value="Asstt. Director Grade-I">Asstt. Director Grade-I</option>
        <option value="Asstt. Director Grade-II">Asstt. Director Grade-II</option>
        <option value="Investigator">Investigator</option>
        <option value="Office Superitendent">Office Superitendent</option>

    </select>

     <div align="left" class="data">Current office<br/></div>
     <select id="curr_ofc" name="curr_ofc" onchange="return warning()">
  <option value="">Select</option>
<%
               Connection con1=null;
               ResultSet rs1=null;
               try{
               con1 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt1 = con1.createStatement();
               String sql="select * from eis_branch_list";
               rs1=stmt1.executeQuery(sql);
               while(rs1.next()){
     %>
 <option value="<%=rs1.getString("Inst_Name")%>"><%=rs1.getString("Inst_Name")%></option>
 <%
 }
               con1.close();
               }
               catch(Exception ex){
               ex.printStackTrace();
               }

     %>
 </select>

     <input disabled="disable" type="button" value="Submit" onclick="return warning();">
  </form>
<br/><br/>
<h4 class="data" align="center" style=" margin-top: 14px;">Already registered !<a href="EIS_login.jsp"> login here for EIS</a></h4>
<h4 class="data" align="center" style=" margin-top: -30px; margin-bottom: -20px;"><a href="gr_login.jsp"> Login here for Grievance</a></h4>
</div>
 </td></tr> </table>
 <br/>
 <br/>
    <br/>
    <br/>
   
    <div align="center" style=" width: 100%; height: 90px; background: #f5f1f1 ; border: 1px gray thin;">
        <p style="padding-top: 15px;"> <a onClick="openTab(this)" href="http://mpr.dcmsme.gov.in/dcmsme/mprsenet/EIS_Approval_letter.pdf" ><b>Approval Letter, Sample Forms & Training Details From Session 2012-13 to 2017-18 .</b></a></p>
        <p>  Best view on mozilla firefox 52.0.0 and later version</p>
    </div>
    <div>&nbsp;</div>
    </body>
</html>
