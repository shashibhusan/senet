<%-- 
    Document   : ss_registration
    Created on : May 16, 2018, 3:35:53 PM
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
        <title>:: Registration SS ::</title>
        <style>
            input:hover, select:hover{
                background:  #bdc3f1 ;
}

            .mainDiv{

             border: 1px #7646f7 solid;
             background: white;
             border-radius: 10px;
             
}
input[type=text] ,[type=password]
{
    padding: 10px 10px 10px 10px;
}
input[type=button]
{
    padding: 10px 10px 10px 10px;
    width: 167px;
    background: green;
    color: white;
}
input[type=number]
{
    padding: 10px 10px 10px 10px;
    width: 315px;
}
select{
    padding: 10px 10px 10px 10px;
    width: 340px;
}
.head{
    font-family: Bookman Old Style;
    font-size: 32px;
    color: #7646f7;
    font-style: normal;
    margin-bottom: 0px;
}
.mainHeading
{
    font-family: Bookman Old Style;
    font-size: 20px;
    color: #7646f7;
    font-style: normal;
    margin-bottom: -10px;
    margin-top: 0px;
    font-weight: normal;
}
#errname,#erremail,#errdob,#errdesignation,#errcurntofc,#errcategory,#errmobile,#errgender,#errpass{
    font-family: vardana;
    font-size: 12px;
    color: red;
    margin-left: 90px;
}
#dddd
{
    position: relative;
    -moz-box-shadow: 1px 2px 4px rgba(0, 0, 0,0.5);
    -webkit-box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    border: 2px #64bb64 double;
   
}
#notice1{
    margin-top: -8px;
    font-family: vardana;
}
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="shortcut icon" href="fevicon.png" type="image/x-icon">
       <script>
$(function () {

    $(".datepicker").datepicker({
        changeMonth: true,
        changeYear: true,
       yearRange: "-68:-18",
       dateFormat: "dd/mm/yy"
  /*     monthNamesShort  : fullmonth_array         */

    });
});

$(document).ready(function() {
  $("#password2").keyup(validate);
});


function matchPass() {
  var password1 = $("#password").val();
  var password2 = $("#cnPassword").val();
var patt = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{7,}$/;

if (!patt.test(password1))
    {
        $("#errpass").text("Password must be 8 digits long. It must include character and numbers.");
        return false;
    }
   else if(password1 == password2) {
       document.getElementById("errpass").style.color = "green";
       $("#errpass").text("OK");
    }
    else {
        document.getElementById("errpass").style.color = "red";
        $("#errpass").text("invalid");
        return false;
    }

}

function myFunction() {
    
                 document.getElementById('name').value="";
                 document.getElementById('email').value="";
                 document.getElementById('dob').value="";
                 document.getElementById('designation').value="";
                 document.getElementById('curntofc').value="";
                 document.getElementById('category').value="";
                 document.getElementById('mobile').value="";
                 document.getElementById('gender').value="";
                 document.getElementById('password').value="";
                 document.getElementById('cnPassword').value="";

                 document.getElementById('errname').innerHTML="";
                 document.getElementById('erremail').innerHTML="";
                 document.getElementById('errdob').innerHTML="";
                 document.getElementById('errdesignation').innerHTML="";
                 document.getElementById('errcurntofc').innerHTML="";
                 document.getElementById('errcategory').innerHTML="";
                 document.getElementById('errmobile').innerHTML="";
                 document.getElementById('errgender').innerHTML="";
                 document.getElementById('errpass').innerHTML="";
}

function submitFOrm()
{
     
   var name=document.getElementById('name').value;
   var email=document.getElementById('email').value;
   var dob=document.getElementById('dob').value;
   var designation=document.getElementById('designation').value;
   var curntofc=document.getElementById('curntofc').value;
   var category=document.getElementById('category').value;
   var mobile=document.getElementById('mobile').value;
   var gender=document.getElementById('gender').value;
   var atpos = email.indexOf("@");
   var dotpos = email.lastIndexOf(".");

      if(name==null || name=="")
       {
           document.getElementById('errname').innerHTML="Please type full name."
           return false;
       }
       else if(email==null || email=="")
       {
           document.getElementById('erremail').innerHTML="Please type email."
           return false;
       }
       else if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length)
       {
            document.getElementById('erremail').innerHTML="Please type valid e-mail address."
                    return false;
       }
        else if(dob==null || dob=="")
       {
           document.getElementById('errdob').innerHTML="Please select date of birth."
           return false;
       }
       else if(designation==null || designation=="")
       {
           document.getElementById('errdesignation').innerHTML="Please select designation."
           return false;
       }
       else if(curntofc==null || curntofc=="")
       {
           document.getElementById('errcurntofc').innerHTML="Please select current office."
           return false;
       }
       else if(category==null || category=="")
       {
           document.getElementById('errcategory').innerHTML="Please select category."
           return false;
       }
       else if(mobile==null || mobile=="")
       {
           document.getElementById('errmobile').innerHTML="Please type mobile no."
           return false;
       }
       else if(gender==null || gender=="")
       {
           document.getElementById('errgender').innerHTML="Please select gender."
           return false;
       }

       else
           {
                 document.getElementById('errname').innerHTML="";
                 document.getElementById('erremail').innerHTML="";
                 document.getElementById('errdob').innerHTML="";
                 document.getElementById('errdesignation').innerHTML="";
                 document.getElementById('errcurntofc').innerHTML="";
                 document.getElementById('errcategory').innerHTML="";
                 document.getElementById('errmobile').innerHTML="";
                 document.getElementById('errgender').innerHTML="";
                 document.getElementById('errpass').innerHTML="";
                 submitFOrmFinal();
                  
           }
}

function submitFOrmFinal()
{
   var name=document.getElementById('name').value;
   var email=document.getElementById('email').value;
   var dob=document.getElementById('dob').value;
   var designation=document.getElementById('designation').value;
   var curntofc=document.getElementById('curntofc').value;
   var category=document.getElementById('category').value;
   var mobile=document.getElementById('mobile').value;
   var gender=document.getElementById('gender').value;
   var pass=document.getElementById('cnPassword').value;

   var url="ss-registration_submit.jsp?val="+name+"&val1="+email+"&val2="+dob+"&val3="+designation+"&val4="+curntofc+"&val5="+category+"&val6="+mobile+"&val7="+gender+"&val8="+pass;

if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=getInfo;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
}

function getInfo(){
if(request.readyState==4){
var val=request.responseText;
var msg=val.substr(val.length - 4);
var finalMsg=msg.trim();
if(finalMsg=="1")
    {
                 document.getElementById('msg').innerHTML="Registration  done successfully.";
                 document.getElementById('name').value="";
                 document.getElementById('email').value="";
                 document.getElementById('dob').value="";
                 document.getElementById('designation').value="";
                 document.getElementById('curntofc').value="";
                 document.getElementById('category').value="";
                 document.getElementById('mobile').value="";
                 document.getElementById('gender').value="";
                 document.getElementById('password').value="";
                 document.getElementById('cnPassword').value="";
                 document.getElementById('errmsg').value="";

    }
    else if(finalMsg=="2")
        {
            document.getElementById('errmsg').innerHTML="*There is some Problem in registration . Please try again..";
           

        }else
            {
                document.getElementById('errmsg').innerHTML="*This Email is already registered. Please try different.";
                
            }
       }

}
 /*
 function matchPass()
{
    var pass=document.getElementById('password').value;
    var rePass=document.getElementById('cnPassword').value;
    if(!pass==rePass){
        document.getElementById('errpass').innerHTML="unmatch";
        return false;
    }else
        {
            document.getElementById('errpass').innerHTML="match";
        }
    
}
*/
</script>
    </head>
    <body bgcolor=" #d1d1d1 ">
        <div id="dddd" style="width:750px; margin:0 auto; background: white" >
        <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; " align="center">Government of India, Ministry of MSME </div>
        <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"></font>O/o  DCMSME </div>
        <%--         <div style="font-size: large;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"> <%=user_cur_ofc%></font></div> --%>
       <div style="font-size:14px;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center" ><font color="#990000">ALL INDIA MSME-DO EMPLOYEE'S GRIEVANCE SYSTEM FOR SS</font>
         </div>

       
      <h2 align="center" class="head"> Registration Form </h2> <br/>
      <center> <p class="mainHeading">EIS SS (Secretarial Staff)</center><br/>
      <div style="width:510px; margin:0 auto; color: green; font-family: Bookman Old Style; padding-bottom: 15px; " id="msg"></div>
      <form id="ssForm">
       <div align="center" class="mainDiv" style="width:510px; margin:0 auto;">
           <br/><br/>
           <div>
               <input type="text" id="name" placeholder="Full Name" size="50"/>
           </div>
           <div id="errname" align="left"></div>
<br/>

<div>
               <input type="text" id="email" name="email" placeholder="Email" size="50"/>
           </div>
<div id="erremail" align="left"></div>

<br/>
<div>
    <input type="text" id="dob" name="dob" class="datepicker" readonly="true" placeholder="Date of birth" size="50" />
           </div>
<div id="errdob" align="left"></div>
<br/>
<div>
               <select id="designation" name="designation">
                   <option value="">- Select Designation -</option>
                   <option value="MTS">MTS</option>
                   <option value="LDC">LDC</option>
                   <option value="UDC">UDC</option>
                   <option value="Stenographer">Stenographer</option>
                   <option value="PA">PA</option>
                   <option value="Sr PA">Sr PA</option>
                   <option value="Accountant">Accountant</option>
                   <option value="Sr Accountant">Sr Accountant</option>
                   
               </select>
           </div>
<div id="errdesignation" align="left"></div>
<br/>
<div>
    <select id="curntofc" name="curntofc" >
       <option value="">- Select Current Office -</option>
    <%
    Connection con=null;
    ResultSet res=null;
    Statement st=null;
    try{
        con=ConnectionManager.getConnectionDirectForMySQL();
        st=con.createStatement();
        String Query="select * from eis_branch_list";
        res=st.executeQuery(Query);
        while(res.next())
            {
            %>
            <option value="<%=res.getString("Inst_Name")%>"><%=res.getString("Inst_Name")%></option>
            <%
    }
        }
        catch(Exception opt){
            opt.printStackTrace();
            }
    %>
    </select>
           </div>
<div id="errcurntofc" align="left"></div>

<br/>
<div>
               <select id="category" name="category">
                   <option value="">- Select Category -</option>
                   <option value="General">General</option>
                   <option value="SC">SC</option>
                   <option value="ST">ST</option>
                   <option value="PWD-BL">PWD-BL</option>
                   <option value="PWD-OL">PWD-OL</option>
                   <option value="PWD-MW">PWD-MW</option>
                   <option value="PWD-OH">PWD-OH</option>
                   <option value="PWD-HH">PWD-HH</option>
                   <option value="PWD-VH">PWD-VH</option>
               </select>
           </div>
<div id="errcategory" align="left"></div>
<br/>

<div>
    <input type="number" id="mobile" name="mobile"  min="1000000000" max="9999999999" maxlength="10" size="50" placeholder="Mobile"/>
           </div>
<div id="errmobile" align="left"></div>
<br/>

<div>
               <select id="gender" name="gender" >
                   <option value="" style="">- Select Gender -</option>
                   <option value="Male">Male</option>
                   <option value="Female">Female</option>
                   <option value="Transgender">Transgender</option>
               </select>
           </div>
<div id="errgender" align="left"></div>
<br/>

<div>
    <input type="password" id="password" name="password" placeholder="password"  size="21" autocomplete="off"/>
    <input type="password" id="cnPassword" name="cnPassword" placeholder="re-password" autocomplete="off" size="21" onkeyup="return matchPass()"/>
           </div>
<div style=" padding-top: 7px;" id="errpass" align="left"></div>
<br/>
<div align="right" style=" margin-right: 87px">
    <input type="button" id="reset" name="reset" onclick="myFunction()" value="Reset form"/>   
    <input type="button" id="signup" name="signup" value="Signup" onclick="return submitFOrm();"/>
           </div>
    <div align="left" style=" font-family: vardana; font-size: 15px; color: red; padding-bottom: -35px; padding-top: 15px; font-weight: bold; margin-left: 75px;" id="errmsg"></div>
<br/>
<div align="left" id="notice" style=" font-family: vardana; font-size: 15px; margin-left: 75px;"><a style=" color: red">*</a> All Fiels are Mandatory.</div><br/>
<div align="left" id="notice1" style=" font-family: vardana; font-size: 15px; margin-left: 75px;"><a style=" color: red">*</a> Already registered,<a href="ss_login.jsp"> login here.</a></div><br/>

       </div>
      </form>
    <br/><br/>
    </div>
    </body>
</html>
