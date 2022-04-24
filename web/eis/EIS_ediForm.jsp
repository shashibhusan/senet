<%--
    Document   : EIS_02test
    Created on : Dec 27, 2017, 9:32:49 PM
    Author     : Admin
--%>

<%@page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <title>EIS form</title>
        <link rel="shortcut icon" href="fevicon.png" type="image/x-icon">
        <script type="text/javascript" src="EIS_forms.js"></script>
         <link rel="stylesheet" type="text/css" href="EIS_02test.css">
          <style>
   div.ui-datepicker{
       width: 255px;
    font-size:14px;
    padding: 0px 0px;
    margin: 0px 0px;
    display: inline-block;
    border-radius: 0px;

   }
              a:link {
    text-decoration: none;
    color:  #2e00ff ;
}

a:visited {
    text-decoration: none;
}

a:hover {
    text-decoration: none;
}

a:active {
    text-decoration: none;
}
              p{
font-family: sans-serif;
font-size: 15px;
color:   #ff6100  ;
padding-top: 6px;
padding-top: 16px;
}
.warn{
    font-family: Bookman Old Style;
font-size: 15px;
color:    #f50505   ;
padding-top: 6px;
padding-top: 16px;}
#final{
    width: 800px;
}
@media print
{
body {

       line-height: 1.1;


   }
    .hide
    {
        display: none !important;
    }
}
@page{


    margin:0px;

}

body.print-page
{
       -webkit-transform: scale(0.85);  /* Saf3.1+, Chrome */
             -moz-transform: scale(0.95);  /* FF3.5+ */
              -ms-transform: scale(0.85);  /* IE9 */
               -o-transform: scale(0.85);  /* Opera 10.5+ */
                  transform: scale(0.85);
        /* big hack to reposition the page top the top and left of the viewer control */
}



          </style>
           <style>
            .mainDivR{
                font-family:Arial, Helvetica, sans-serif;
                width: 800px;
                border: 1px black solid;
                background: none;
                border-radius: 0px;

}
#dataR{
    font-family: Bookman Old Style;
     background: none;
    font-size:13px;
    padding-top: 2px;
    padding-bottom: 2px;
    padding-left: 6px;
}
.tHead{
     font-family: Bookman Old Style;
    border-bottom: 2px black solid;
   padding-top: 8px;
}
#tHead1{
    font-family: Bookman Old Style;
    font-size:14px;
    padding-top: 3px;
    padding-bottom: 3px;
    border-bottom: 1px black solid;

}
.mData{
    font-family: Bookman Old Style;
    font-size:12px;
    padding-top: 3px;
    padding-bottom: 3px;
    color:  #17202a ;

    padding-left: 0px;
}
.headerR{
  font-family: Bookman Old Style;
    font-size:20px;
    padding-left: 22px;
}
.headerR1{
  font-family: Bookman Old Style;
    font-size:20px;

    padding-right: 22px;

}
        </style>

         <script language="javascript" type="text/javascript">
 var xmlHttp
 var xmlHttp
function showState(str){
       if (typeof XMLHttpRequest != "undefined"){
   xmlHttp= new XMLHttpRequest();
       }
       else if (window.ActiveXObject){
   xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
       }
if (xmlHttp==null){
    alert ("Browser does not support XMLHTTP Request")
return
}
var url= "city.jsp";
url += "?count=" +str;
xmlHttp.onreadystatechange = stateChange;
xmlHttp.open("GET", url, true);
xmlHttp.send(null);
}
 function stateChange(){
 if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
 document.getElementById("state").innerHTML=xmlHttp.responseText
 }
 }
 </script>
         <script>

 /*  var fullmonth_array = $.datepicker.regional['en'].monthNames;  */
$(function () {

    $(".datepicker").datepicker({
        changeMonth: true,
        changeYear: true,
       yearRange: "-68:+42",
       dateFormat: "dd/mm/yy"
  /*     monthNamesShort  : fullmonth_array         */

    });
});


    var counter = 2;
    var limit = 11;
    function addInput(divName){

         if (counter == limit)  {

              alert("You have reached the limit of adding " + counter + " inputs");

         }

         else {

             var officeName=document.getElementById("name["+(counter-1)+"]").value;
             var design=document.getElementById("desig["+(counter-1)+"]").value;
             var mode=document.getElementById("mode["+(counter-1)+"]").value;
             var frm=document.getElementById("frm["+(counter-1)+"]").value;
             var to=document.getElementById("to["+(counter-1)+"]").value;

             if (officeName=="" || officeName==null){
                alert("Please select Office Name.");
                    return false;
             }
             else if (design=="" || design==null){
                alert("Please select  Designation.");
                    return false;
             }
             else if (mode=="" || mode==null){
                alert("Please select mode.");
                    return false;
             }
             else if (frm=="" || frm==null){
                alert("Please enter training start date.");
                    return false;
             }
             else if (to=="" || to==null){
                alert("Please enter training finish date.");
                    return false;
             }
             else
                 {


              var newdiv = document.createElement('tr');


              newdiv.innerHTML = "<td id='dynamic1' align='center'><select id='name["+counter+"]' name='name["+counter +"]'>\n\
                  <option>Select</option>\n\
 <option value='MSME-DI Agra'>MSME-DI Agra</option>\n\
<option value='MSME-DI Agartala'>MSME-DI Agartala</option>\n\
<option value='MSME-DI Haldwani'>MSME-DI Haldwani</option>\n\
<option value='MSME-DI Ahmedabad'>MSME-DI Ahmedabad</option>\n\
<option value='MSME-DI Allahabad'>MSME-DI Allahabad</option>\n\
<option value='MSME-DI Bangalore'>MSME-DI Bangalore</option>\n\
<option value='MSME-DI Mumbai'>MSME-DI Mumbai</option>\n\
<option value='MSME-DI Kolkatta'>MSME-DI Kolkatta</option>\n\
<option value='MSME-DI Cuttack'>MSME-DI Cuttack</option>\n\
<option value='MSME-DI Guwahati'>MSME-DI Guwahati</option>\n\
<option value='MSME-DI Hubli'>MSME-DI Hubli</option>\n\
<option value='MSME-DI Hyderabad'>MSME-DI Hyderabad</option>\n\
<option value='MSME-DI Indore'>MSME-DI Indore</option>\n\
<option value='MSME-DI Imphal'>MSME-DI Imphal</option>\n\
<option value='MSME-DI Jaipur'>MSME-DI Jaipur</option>\n\
<option value='MSME-DI Kanpur'>MSME-DI Kanpur</option>\n\
<option value='MSME-DI  Karnal'>MSME-DI  Karnal</option>\n\
<option value='MSME-DI Ludhiana'>MSME-DI Ludhiana</option>\n\
<option value='MSME-DI Chennai'>MSME-DI Chennai</option>\n\
<option value='MSME-DI Margoa'>MSME-DI Margoa</option>\n\
<option value='MSME-DI  Muzaffarpur'>MSME-DI  Muzaffarpur</option>\n\
<option value='MSME-DI Ranchi'>MSME-DI Ranchi</option>\n\
<option value='MSME-DI  Solan'>MSME-DI  Solan</option>\n\
<option value='MSME-DI Jammu'>MSME-DI Jammu</option>\n\
<option value='MSME-DI  Gangtok'>MSME-DI  Gangtok</option>\n\
<option value='MSME-DI Thrissur'>MSME-DI Thrissur</option>\n\
<option value='MSME-DI Raipur'>MSME-DI Raipur</option>\n\
<option value='MSME-DI  Patna'>MSME-DI  Patna</option>\n\
<option value='MSME-DI  New Delhi'>MSME-DI  New Delhi</option>\n\
<option value='MSME-DI Nagpur'>MSME-DI Nagpur</option>\n\
<option value='HQ Office New Delhi'>HQ Office New Delhi</option>\n\
<option value='TC-Kolkata'>TC-Kolkata</option>\n\
<option value='TC-Chennai'>TC-Chennai</option>\n\
<option value='TC-Mumbai'>TC-Mumbai</option>\n\
<option value='TC-New Delhi'>TC-New Delhi</option>\n\
<option value='TI-Tiruvalla'>TI-Tiruvalla</option>\n\
<option value='TI-Ettumanoor'>TI-Ettumanoor</option>\n\
<option value='HTTDC-Nagaur'>HTTDC-Nagpur</option>\n\
<option value='MSME-TS Hyderabad'>MSME-TS Hyderabad</option>\n\
<option value='MSME-TS Bangalore'>MSME-TS Bangalore</option>\n\
<option value='MSME-TS Changacherry'>MSME-TS Changacherry</option>\n\
<option value='MSME-TS Bhopal'>MSME-TS Bhopal</option>\n\
<option value='MSME-TS Kolhapur'>MSME-TS Kolhapur</option>\n\
<option value='MSME-TS Jaipur'>MSME-TS Jaipur</option>\n\
<option value='MSME-TS Pondicherry'>MSME-TS Pondicherry</option>\n\
<option value='Br MSME-DI Bhiwani'>Br MSME-DI Bhiwani</option>\n\
<option value='Br MSME-DI Rourkela'>Br MSME-DI Rourkela</option>\n\
<option value='Br MSME-DI Tezpur'>Br MSME-DI Tezpur</option>\n\
<option value='Br MSME-DI Silchar'>Br MSME-DI Silchar</option>\n\
<option value='Br MSME-DI Diphu'>Br MSME-DI Diphu</option>\n\
<option value='Br MSME-DI Shilong'>Br MSME-DI Shilong</option>\n\
<option value='Br MSME-DI Tura'>Br MSME-DI Tura</option>\n\
<option value='Br MSME-DI Itanagar'>Br MSME-DI Itanagar</option>\n\
<option value='Br MSME-DI Gulbarga'>Br MSME-DI Gulbarga</option>\n\
<option value='Br MSME-DI Visakhapatnam'>Br MSME-DI Visakhapatnam</option>\n\
<option value='Br MSME-DI Dimapur'>Br MSME-DI Dimapur</option>\n\
<option value='Br MSME-DI Aizwal'>Br MSME-DI Aizwal</option>\n\
<option value='Br MSME-DI Gwalior'>Br MSME-DI Gwalior</option>\n\
<option value='Br MSME-DI Rewa'>Br MSME-DI Rewa</option>\n\
<option value='Br MSME-DI Jammu Tawi'>Br MSME-DI Jammu Tawi</option>\n\
<option value='Br MSME-DI Durgapur'>Br MSME-DI Durgapur</option>\n\
<option value='Br MSME-DI Siliguri'>Br MSME-DI Siliguri</option>\n\
<option value='Br MSME-DI Suri'>Br MSME-DI Suri</option>\n\
<option value='Br MSME-DI Port Blair'>Br MSME-DI Port Blair</option>\n\
<option value='Br MSME-DI Aurangabad'>Br MSME-DI Aurangabad</option>\n\
<option value='Br MSME-DI Dhanbad'>Br MSME-DI Dhanbad</option>\n\
<option value='Br MSME-DI Rajkot'>Br MSME-DI Rajkot</option>\n\
<option value='Br MSME-DI Silvassa'>Br MSME-DI Silvassa</option>\n\
<option value='Br MSME-DI Varanasi'>Br MSME-DI Varanasi</option>\n\
<option value='Br MSME-DI Manglore'>Br MSME-DI Manglore</option>\n\
<option value='Br MSME-DI CoimBatore'>Br MSME-DI CoimBatore</option>\n\
<option value='Br MSME-DI Tuticorin'>Br MSME-DI Tuticorin</option>\n\
<option value='Br MSME-DI Rayagada'>Br MSME-DI Rayagada</option>\n\
<option value='MSME-NC Lakshadweep'>MSME-NC Lakshadweep</option>\n\
</select></td>&nbsp;" +
                  "<td align='center' id='dynamic2'><select id='desig["+counter+"]' name='desig["+counter +"]'>\n\
                   <option>Select</option>\n\
                   <option value='AIA'>AIA</option>\n\
                   <option value='Director'>Director</option>\n\
                   <option value='Dy. Director'>Dy. Director</option>\n\
                   <option value='Asstt. Director Grade-I'>Asstt. Director Grade-I</option>\n\
                   <option value='Asstt. Director Grade-II'>Asstt. Director Grade-II</option>\n\
                   <option value='Investigator'>Investigator</option>\n\
                   <option value='Office Superitendent'>Office Superitendent</option>\n\
                   </select></td>"+
                  "<td id='dynamic3' align='center'><select id='mode["+counter+"]' name='mode["+counter +"]'>\n\
                   <option>Select</option>\n\
                   <option value='Direct Recruitment'>Direct Recruitment</option>\n\
                   <option value='Transfer'>Transfer</option>\n\
                   <option value='Promotion'>Promotion</option>\n\
                   </select></td>"+
                  "<td id='dynamic4' align='center'><input type='text' name='frm["+counter +"]' id='frm["+counter +"]' class='datepicker' readonly='true' placeholder='dd/mm/yyyy'></td>"+
                  "<td id='dynamic5' align='center'><input type='text' name='to["+counter +"]' id='to["+counter +"]' class='datepicker' readonly='true' placeholder='dd/mm/yyyy'></td>";


document.getElementById(divName).appendChild(newdiv);
counter++;
                 }
         }
        $(function () {

    $(".datepicker").datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "-68:+42",
       dateFormat: "dd/mm/yy"
  /*     monthNamesShort  : fullmonth_array         */

    });
});
    }

    var counter1 = 2;

    var limit1 = 11;

    function addInputTc(divName){

         if (counter1 == limit1)  {

              alert("You have reached the limit of adding " + counter1 + " inputs");

         }

         else {
              var name = document.getElementById("tcname["+(counter1-1)+"]").value;
             var date1 = document.getElementById("tcfrom["+(counter1-1)+"]").value;
             var date2 = document.getElementById("tcto["+(counter1-1)+"]").value;
             if (name=="" || name==null){
           alert("Please enter Name of Training .");
                    return false;
             }
          else if (date1=="" || date1==null){
                alert("Please enter Training start date.");
                    return false;
             }
            else if (date2=="" || date2==null){
                alert("Please enter Training end date.");
                    return false;
             }
else
    {

              var newdiv = document.createElement('tr');


              newdiv.innerHTML = "<td align='center' id='dynamic6'>&nbsp;&nbsp;&nbsp;<b></b></td>"+
                  "<td id='dynamic7' align='center'>&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' id='tcname["+counter1+"]' name='tcname["+counter1 +"]'></td>"+
                  "<td id='dynamic8' align='center'>&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' name='tcfrom["+counter1 +"]' id='tcfrom["+counter1 +"]' class='datepicker' readonly='true' placeholder='dd/mm/yyyy'></td>"+
                  "<td id='dynamic9' align='center'>&nbsp;&nbsp;<input type='text' name='tcto["+counter1 +"]' id='tcto["+counter1 +"]' class='datepicker' readonly='true' placeholder='dd/mm/yyyy'></td>";


              document.getElementById(divName).appendChild(newdiv);


              counter1++;
    }
         }
          $(function () {

    $(".datepicker").datepicker({
        changeMonth: true,
        changeYear: true,
       yearRange: "-68:+42",
       dateFormat: "dd/mm/yy"
  /*     monthNamesShort  : fullmonth_array         */

    });
});
    }


function myFunction()
{
    
         
         var name = document.getElementById("bas_name").value;
         var designation =document.getElementById("bas_designation").value;
         var DOB =document.getElementById("dob").value;
         var DOJ =document.getElementById("doj_gov").value;
         var DOJMSME =document.getElementById("doj_msme").value;
         var DOR =document.getElementById("dat_ret").value;
         var email =document.getElementById("email").value;
         var descipline=document.getElementById("bas_descipline").value;
         var CrPayLevel=document.getElementById("CrPayLevel").value;
         var aptPrPost=document.getElementById("aptPrPost").value;
         var payLevelSub=document.getElementById("payLevelSub").value;
         var Category=document.getElementById("Category").value;


    if (name=="" || name==null){
                alert("Please enter name.");
                    return false;
            }
            if (email=="" || email==null){
                alert("Please enter email.....");
                    return false;
            }

            if (designation=="" || designation==null){
                alert("Please select designation.");
                    return false;
            }
            if (descipline=="" || descipline==null){
                alert("Please select descipline.....");
                    return false;
            }

            if (DOB=="" || DOB==null){
                alert("Please enter Date of birth.");
                    return false;
            }

            if (DOJ=="" || DOJ==null){
                alert("Please enter Date of joining to Government Services.");
                    return false;
            }

            if (DOJMSME=="" || DOJMSME==null){
                alert("Please enter date of joining to MSME.");
                    return false;
            }
            if (DOR=="" || DOR==null){
                alert("Please select date of retirement.");
                    return false;
            }
            if (CrPayLevel=="" || CrPayLevel==null){
                alert("Please select Current Pay Level.");
                    return false;
            }
            if (aptPrPost=="" || aptPrPost==null){
                alert("Please select Date Of Regular Appointment to The Present Post.");
                    return false;
            }
            if (payLevelSub=="" || payLevelSub==null){
                alert("Please select Pay Level In Substantive Pay.");
                    return false;
            }
            if (Category=="" || Category==null){
                alert("Please select Category.");
                    return false;
            }

else{
                 document.forms[0].action = "EIS_edisub.jsp?nam="+counter+"&val="+counter1
    return true;
        }
}

 function saveEis()
     {
         var post1 = document.getElementById("pst_pref_1").value;
         var post2 = document.getElementById("pst_pref_2").value;
         var post3 = document.getElementById("pst_pref_3").value;
         var name = document.getElementById("bas_name").value;
         var designation =document.getElementById("bas_designation").value;
         var DOB =document.getElementById("dob").value;
         var DOJ =document.getElementById("doj_gov").value;
         var DOJMSME =document.getElementById("doj_msme").value;
         var DOR =document.getElementById("dat_ret").value;
         var email =document.getElementById("email").value;
         var descipline=document.getElementById("bas_descipline").value;
         var CrPayLevel=document.getElementById("CrPayLevel").value;
         var aptPrPost=document.getElementById("aptPrPost").value;
         var payLevelSub=document.getElementById("payLevelSub").value;
         var Category=document.getElementById("Category").value;




    if (name=="" || name==null){
                alert("Please enter name.");
                    return false;
            }
            if (email=="" || email==null){
                alert("Please enter email.....");
                    return false;
            }

          if (designation=="" || designation==null){
                alert("Please select designation.");
                    return false;
            }
           if (descipline=="" || descipline==null){
                alert("Please select descipline.....");
                    return false;
            }

          if (DOB=="" || DOB==null){
                alert("Please enter Date of birth.");
                    return false;
            }

            if (DOJ=="" || DOJ==null){
                alert("Please enter Date of joining to Government Services.");
                    return false;
            }

           if (DOJMSME=="" || DOJMSME==null){
                alert("Please enter date of joining to MSME.");
                    return false;
            }
            if (DOR=="" || DOR==null){
                alert("Please select date of retirement.");
                    return false;
            }
            if (CrPayLevel=="" || CrPayLevel==null){
                alert("Please select Current Pay Level.");
                    return false;
            }
            if (aptPrPost=="" || aptPrPost==null){
                alert("Please select Date Of Regular Appointment to The Present Post.");
                    return false;
            }
            if (payLevelSub=="" || payLevelSub==null){
                alert("Please select Pay Level In Substantive Pay.");
                    return false;
            }
            if (Category=="" || Category==null){
                alert("Please select Category.");
                    return false;
            }


            if (post1=="" || post1==null){
                alert("Please select 1st Posting preferences.");
                    return false;
            }
            if (post2=="" || post2==null){
                alert("Please select 2nd Posting preferences.");
                    return false;
            }
            if (post3=="" || post3==null){
                alert("Please select 3rd Posting preferences.");
               return false;
            }
            else if(post1==post2 || post2==post3 || post1==post3)
                {
                    alert("Posting preferences should not be same.");
                    return false;
                }




else{

       document.forms[0].action = "EIS_finalChange.jsp?nam="+counter+"&val="+counter1
       return true;
}
     }

         </script>

<%
Connection con12=null;
ResultSet rs12=null;
String email="";
String mToken=(String)session.getAttribute("token");
String adUser=(String)session.getAttribute("adUser");  //Admin name
String adUserOfc=(String)session.getAttribute("adUserOfc");  //Admin ofc
String adEmail=(String)session.getAttribute("adEmail"); //Admin email
session.setAttribute("adUser",adUser);
session.setAttribute("adUserOfc",adUserOfc);
session.setAttribute("adEmail",adEmail);


String name="";
try{
   con12 = ConnectionManager.getConnectionDirectForMySQL();
   Statement stmt12 = con12.createStatement();
   String sql="select * from eis_basicinfo where token='"+mToken+"'";
    rs12=stmt12.executeQuery(sql);
    while(rs12.next())
        {
        email=rs12.getString("email");
        name=rs12.getString("name");
        }
    }
catch(Exception e){
e.printStackTrace();
}
//String email=(String)session.getAttribute("username");
String crosssite=(String)session.getAttribute("Session");



 session.setAttribute("crosssite",crosssite);
 session.setAttribute("token",mToken);
 session.setAttribute("email",email);
 int iFinal=0;
 try{
   con12 = ConnectionManager.getConnectionDirectForMySQL();
   Statement stmt12 = con12.createStatement();
   String sql="select * from eis_finalchange where email='"+email+"'";
    rs12=stmt12.executeQuery(sql);
    while(rs12.next())
        {
        iFinal=1;
        }
    }
catch(Exception e){
e.printStackTrace();
}


%>
    </head>
    <body>

        <div class="hide" style="font-size: 14px;font-family:Verdana;font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; " align="center">Government of India, Ministry of MSME </div>
        <div class="hide" style="font-size: 14px;font-family:Verdana;font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"></font>O/o  DCMSME </div>
        <%--         <div style="font-size: large;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"> <%=user_cur_ofc%></font></div> --%>
       <div class="hide" style="font-size:14px;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center" ><font color="#990000">ALL INDIA MSME-DO EMPLOYEES' INFORMATION SYSTEM </font>
         </div>
       <br/>

   <%

   if(!crosssite.equals(null))
       {

       if(iFinal==0)
       {
   %>
   <h4 align="left">Hello <%=adUser%> , you are in edit mode !!</h4><h5  align="right"><a HREF="EISadlogout.jsp" > <strong>Logout</strong></a></h5>
   <table align="center">
       <tr>
           <td align="center">


         <div class="main" align="center"><br/>
       <form name="myform" method="post" action=""  />
      <%
               Connection con13=null;
               ResultSet rs13=null;
        try{
               con13 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt13 = con13.createStatement();
               String sql13="SELECT * FROM eis_basicinfo INNER JOIN eis_postinginfo ON eis_basicinfo.email=eis_postinginfo.email left JOIN eis_traininginfo ON eis_postinginfo.email=eis_traininginfo.email WHERE eis_basicinfo.email='"+email+"';";
               rs13=stmt13.executeQuery(sql13);
               while(rs13.next()){


      %>
      <div align="center" id="first">
        <fieldset>
      <legend>Basic Information</legend>
      <table align="center" width="100%">
          <tr>
              <td width="475px" align="center">
      <div class="col">
          <div align="left" id="element"><b id="ele_head">Name :</b><br/>
              <input type="text" id="bas_name" name="bas_name" value="<%=rs13.getString("eis_basicinfo.name")%>" class="bas_name"/>
      </div>
      <div align="left" id="element"><b id="ele_head">Designation :</b><br/>
          <input type="text" id="bas_designation" name="bas_designation" value="<%=rs13.getString("eis_basicinfo.bas_designation")%>" >

      </div>

          <div align="left" id="element"><b id="ele_head">Date of Birth :</b><br/>
              <input type="text" id="dob" name="dob" class="datepicker" placeholder="dd/mm/yyyy" readonly='true' value="<%=rs13.getString("eis_basicinfo.dob")%>"/>
      </div>
           <div align="left" id="element"><b id="ele_head">Date of Retirement :</b><br/>
               <input type="text" id="dat_ret" name="dat_ret" class="datepicker" value="<%=rs13.getString("eis_basicinfo.dat_ret")%>"/>
      </div>
       <div align="left" id="element"><b id="ele_head">Current Pay Level :</b><br/>
              <select id="CrPayLevel" name="CrPayLevel" class="CrPayLevel">
              <option value="<%=rs13.getString("eis_basicinfo.CrPayLevel")%>"><%=rs13.getString("eis_basicinfo.CrPayLevel")%></option>
              <option value="">Select</option>
              <option value="Level-6">Level-6</option>
              <option value="Level-7">Level-7</option>
              <option value="Level-10">Level-10</option>
              <option value="Level-11">Level-11</option>
              <option value="Level-12">Level-12</option>
              <option value="Level-13">Level-13</option>

          </select>
      </div>
       <div align="left" id="element"><b id="ele_head">Date of Regular Appointment to The Present Post :</b><br/>
           <input type="text" id="aptPrPost" name="aptPrPost" class="datepicker" placeholder="dd/mm/yyyy" readonly='true' value="<%=rs13.getString("eis_basicinfo.aptPrPost")%>"/>
      </div>

      </div></td>
      <td width="475px" align="center">
      <div class="col">
      <div align="left" id="element"><b id="ele_head">E-mail :</b><br/>
          <input type="text" id="email" name="email" class="email" value="<%=email%>"/>
      </div>
      <div align="left" id="element"><b id="ele_head">Discipline :</b><br/>
       <select id="bas_descipline" name="bas_descipline">
            <option value="<%=rs13.getString("eis_basicinfo.bas_descipline")%>"><%=rs13.getString("eis_basicinfo.bas_descipline")%></option>
           <option value="">Select </option>
                                       <option value="Chemical">Chemical </option>
                                       <option value="Economic Investigation">Economic Investigation </option>
                                       <option value="Electrical">Electrical </option>
                                       <option value="Electronics">Electronics </option>
                                       <option value="Export Promotion">Export Promotion </option>
                                       <option value="Food">Food </option>
                                       <option value="GAD">GAD </option>
                                       <option value="Glass & Ceramic">Glass & Ceramic </option>
                                       <option value="Hosiery">Hosiery </option>
                                       <option value="IMT">IMT </option>
                                       <option value="Leather & Footwear">Leather & Footwear </option>
                                       <option value="Mechanical">Mechanical </option>
                                       <option value="Metal Finishing">Metal Finishing </option>
                                       <option value="Metallurgy">Metallurgy </option>
                                       <option value="Statistics">Statistics </option>
                                       <option value="Tailoring">Tailoring </option>
                                       <option value="Cane & Bamboo Making">Cane & Bamboo Making </option>


                                   </select>
      </div>
          <div align="left" id="element"><b id="ele_head">Date of joining - Govt. Service  :</b><br/>
              <input type="text" id="doj_gov" name="doj_gov" class="datepicker" placeholder="dd/mm/yyyy" readonly='true' value="<%=rs13.getString("eis_basicinfo.doj_gov")%>"/>
      </div>
          <div align="left" id="element"><b id="ele_head">Date of joining - MSME-DO  :</b><br/>
              <input type="text" id="doj_msme" name="doj_msme" class="datepicker" placeholder="dd/mm/yyyy" readonly='true' value="<%=rs13.getString("eis_basicinfo.doj_msme")%>"/>
      </div>
      <div align="left" id="element"><b id="ele_head">Pay Level In Substantive Pay :</b><br/>
          <select id="payLevelSub" name="payLevelSub" class="payLevelSub">
              <option value="<%=rs13.getString("eis_basicinfo.payLevelSub")%>"><%=rs13.getString("eis_basicinfo.payLevelSub")%></option>
              <option value="">Select</option>
              <option value="Level-6">Level-6</option>
              <option value="Level-7">Level-7</option>
              <option value="Level-8">Level-8</option>
              <option value="Level-9">Level-9</option>
              <option value="Level-10">Level-10</option>
              <option value="Level-11">Level-11</option>
              <option value="Level-12">Level-12</option>
              <option value="Level-13">Level-13</option>

          </select>
      </div>
      <div align="left" id="element"><b id="ele_head">Category :</b><br/>
              <select id="Category" name="Category" class="Category">
              <option value="<%=rs13.getString("eis_basicinfo.Category")%>"><%=rs13.getString("eis_basicinfo.Category")%></option>
              <option value="">Select</option>
              <option value="SC">SC</option>
              <option value="ST">ST</option>
              <option value="Others">Others</option>


          </select>
      </div>

      </div></td>
        </tr>

      </table>
</fieldset>
                 <br/>
    </div>
             <div align="center" id="first">
 <fieldset>

      <legend>Posting Information</legend>
      <table align="center" width="100%">
          <tr>
              <td colspan="4">
                  <div align="left" id="head">Current Posting</div>
              </td>
          </tr>
          <tr id="head1">
              <th width="25%">Name of Office</th>
              <th  width="25%">Designation</th>
              <th  width="25%">Mode </th>
              <th  width="25%">Date of Joining ( Current office )</th>

          </tr>
          <tr>
              <td width="475px" align="center" >
              <select id="state" name="state">
              <option value="<%=rs13.getString("eis_postinginfo.state")%>"><%=rs13.getString("eis_postinginfo.state")%></option>

<%
               Connection con11=null;
               ResultSet rs11=null;
               try{
               con11 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt11 = con11.createStatement();
               String sql="select * from eis_branch_list";
               rs11=stmt11.executeQuery(sql);
               while(rs11.next()){
     %>
 <option value="<%=rs11.getString("Inst_Name")%>"><%=rs11.getString("Inst_Name")%></option>
 <%
 }
               con11.close();
               }
               catch(Exception ex){
               ex.printStackTrace();
               }

     %>
              </select>  </td>




     <td align="center">

      <select id="curr_despln" name="curr_despln">
        <option value="<%=rs13.getString("eis_postinginfo.curr_despln")%>"><%=rs13.getString("eis_postinginfo.curr_despln")%></option>

        <option value="AIA">AIA</option>
        <option value="Director">Director</option>
        <option value="Dy. Director">Dy. Director</option>
        <option value="Asstt. Director Grade-I">Asstt. Director Grade-I</option>
        <option value="Asstt. Director Grade-II">Asstt. Director Grade-II</option>
        <option value="Investigator">Investigator</option>
        <option value="Office Superitendent">Office Superitendent</option>

    </select>
     </td>

      <td align="center">

          <select name="cur_ofctype" id="cur_ofctype" >
              <option value="<%=rs13.getString("eis_postinginfo.cur_ofctype")%>"><%=rs13.getString("eis_postinginfo.cur_ofctype")%></option>

        <option value="Direct Recruitment">Direct Recruitment</option>
        <option value="Transfer">Transfer</option>
        <option value="Promotion">Promotion</option>
          </select>
     </td>

     <td align="center">
    <input type="text" id="curr_doj" name="curr_doj" class="datepicker" readonly='true' placeholder="dd/mm/yyyy"  value="<%=rs13.getString("eis_postinginfo.curr_doj")==null?"11":rs13.getString("eis_postinginfo.curr_doj")%>"/>
     </td>
        </tr>
      </table><br/><br/>
 <table align="center" width="100%">
        <tr>
              <td colspan="5">
                  <div align="left" id="head">Posting History  &nbsp;<a style=" color: #FFC300">( Excluding Current Posting )</a></div>
              </td>
          </tr>
          <tr id="head1">
              <th width="26%">Name of Office</th>
              <th  width="22%">Designation</th>
              <th  width="20%">Mode </th>
              <th  width="16%">From </th>
              <th  width="16%">To </th>
          </tr>
     <%--Posting History 1--%>
     <%
               Connection con1=null;
               ResultSet rs1=null;

               int ph=1;
                try{
               con1 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt1 = con1.createStatement();
               String sql="select * from eis_posthistory where email='"+email+"'";
               rs1=stmt1.executeQuery(sql);
               while(rs1.next()){

                       String date1="", date2="";

     date1=rs1.getString("phfrom");
     date2=rs1.getString("phto");
     %>
     <tr>
         <td align="center"><input type="text" name="ofcName[<%=ph%>]"  value="<%=rs1.getString("officeName")%>" required/></td>
         <td align="center"><input type="text" name="dsn[<%=ph%>]"  value="<%=rs1.getString("designation")%>" required/></td>
         <td align="center"><input type="text" name="mod[<%=ph%>]"  value="<%=rs1.getString("phmode")%>" required/></td>
         <td align="center"><input type="text" name="fromm[<%=ph%>]"  class="datepicker" readonly="true" value="<%=date1%>" required/></td>
         <td align="center"><input type="text" name="too[<%=ph%>]" class="datepicker" readonly="true"  value="<%=date2%>" required/></td>
     </tr>
     <%
     ph=ph+1;
     }
               con1.close();
               }
                catch(Exception ex){
                    ex.printStackTrace();
                    }
     %>

     <tr>

  <td align="center">
      <select name="name[1]" id="name[1]">
          <option value="">Select</option>
<%

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
 </td>
      <td align="center">
          <select id="desig[1]" name="desig[1]">
        <option value="">Select</option>
        <option value="AIA">AIA</option>
        <option value="Director">Director</option>
        <option value="Dy. Director">Dy. Director</option>
        <option value="Asstt. Director Grade-I">Asstt. Director Grade-I</option>
        <option value="Asstt. Director Grade-II">Asstt. Director Grade-II</option>
        <option value="Investigator">Investigator</option>
        <option value="Office Superitendent">Office Superitendent</option>

    </select>
  </td>
      <td align="center">
          <select id="mode[1]" name="mode[1]">
        <option value=""> Select</option>
         <option value="Direct Recruitment">Direct Recruitment</option>
        <option value="Transfer">Transfer</option>
        <option value="Promotion">Promotion</option>

    </select>
      </td>


      <td align="center">
          <input type="text" id="frm[1]" name="frm[1]" class="datepicker" placeholder="dd/mm/yyyy" readonly='true'/>
      </td>
      <td align="center">
          <input type="text" id="to[1]" name="to[1]" class="datepicker" placeholder="dd/mm/yyyy" readonly='true'/>
     </td>

          </tr>

 <td id="dynamicInput" colspan="5">
</td>

           <tr>

               <td colspan="5" align="right">
                  <input type="button" value="Add" onClick="addInput('dynamicInput');">
              </td>
          </tr>

      </table>
        <br>
        <table align="center" width="100%">

        <tr>
              <td colspan="2">
                  <div align="left" id="head">Posting Preferences &nbsp;&nbsp;<a style=" color: #FFC300 ">( For Next Posting )</a></div>
              </td>
        </tr>
        <tr>
            <td id="opt" align="left">
                <b>    1st Option : </b></td>
            <td><select id="pst_pref_1" name="pst_pref_1">
                    <option value="<%=rs13.getString("eis_postinginfo.pst_pref_1")%>"><%=rs13.getString("eis_postinginfo.pst_pref_1")%></option>

 <%
          //     Connection con1=null;
          //     ResultSet rs1=null;
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
              </td>
          </tr>

          <tr>
            <td id="opt" align="left">
                <b>    2nd Option : </b></td>
              <td><select  id="pst_pref_2" name="pst_pref_2">
                      <option value="<%=rs13.getString("eis_postinginfo.pst_pref_2")%>"><%=rs13.getString("eis_postinginfo.pst_pref_2")%></option>

 <%
          //     Connection con1=null;
          //     ResultSet rs1=null;
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
              </td>
          </tr>



          <tr>
            <td id="opt" align="left">
                <b>    3rd Option : </b></td>
              <td><select id="pst_pref_3" name="pst_pref_3">
                      <option value="<%=rs13.getString("eis_postinginfo.pst_pref_3")%>"><%=rs13.getString("eis_postinginfo.pst_pref_3")%></option>

 <%
          //     Connection con1=null;
          //     ResultSet rs1=null;
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
              </td>
          </tr>

<tr>
            <td id="opt" align="left">
                <b>Reason For Preferences  :</b>

            </td>
            <td align="left">
                 <textarea cols="106" rows="2" type="text" id="your_spl_pref" name="your_spl_pref" maxlength="150" placeholder="max 150 char."><%=rs13.getString("eis_postinginfo.your_spl_pref")==null?"":rs13.getString("eis_postinginfo.your_spl_pref")%></textarea>
            </td>
        </tr>
        <tr>
        <style>
            .save1
            {
                width: 100px;
                background:#45a049;
                color: white;
                border-radius: 3px;


}
        </style>

            <td align="right" colspan="2"><br>
                <button  class="save1" onclick="return myFunction();">Save</button>
            </td>
        </tr>

        </table> <br/>


</fieldset>
 <br/><br/>
<fieldset>

      <legend>About Yourself </legend>
      <table align="center" width="100%">
          <tr>
              <td colspan="4">
                  <div align="left" id="headT">Personal & Training</div>
              </td>
        </tr>
          <tr>

              <td width="475px" align="center">
      <div class="col">
          <div align="left" id="element"><b id="ele_head">Trade :</b><br/>

               <select type="text" id="Trade" name="Trade" class="Trade">
                   <option value="<%=rs13.getString("eis_traininginfo.Trade")%>"><%=rs13.getString("eis_traininginfo.Trade")%></option>

                                       <option value="Chemical">Chemical </option>
                                       <option value="Economic Investigation">Economic Investigation </option>
                                       <option value="Electrical">Electrical </option>
                                       <option value="Electronics">Electronics </option>
                                       <option value="Export Promotion">Export Promotion </option>
                                       <option value="Food">Food </option>
                                       <option value="GAD">GAD </option>
                                       <option value="Glass & Ceramic">Glass & Ceramic </option>
                                       <option value="Hosiery">Hosiery </option>
                                       <option value="IMT">IMT </option>
                                       <option value="Leather & Footwear">Leather & Footwear </option>
                                       <option value="Mechanical">Mechanical </option>
                                       <option value="Metal Finishing">Metal Finishing </option>
                                       <option value="Metallurgy">Metallurgy </option>
                                       <option value="Statistics">Statistics </option>
                                       <option value="Tailoring">Tailoring </option>
                                       <option value="Cane & Bamboo Making">Cane & Bamboo Making </option>


                                   </select>
      </div>
      <div align="left" id="element"><b id="ele_head">Area of Specialisation in The Trade :</b><br/>
          <textarea type="text" cols="56" rows="2" maxlength="150" placeholder="max 150 char." id="splTrade" name="splTrade"><%=rs13.getString("eis_traininginfo.sptTrade")%></textarea>

      </div>
      <div align="left" id="element"><b id="ele_head">Specialisation in any other field :</b><br/>
              <textarea type="text" cols="56" rows="2" maxlength="150" placeholder="max 150 char." id="splOTrade" name="splOTrade"><%=rs13.getString("eis_traininginfo.splOTrade")%></textarea>
      </div>




      </div>
              </td>


      <td width="475px" align="center">
      <div class="col">
      <div align="left" id="element"><b id="ele_head">Physical Fitness Status :</b><br/>
          <input type="text" id="phyFit" name="phyFit" class="phyFit" value="<%=rs13.getString("eis_traininginfo.phyFit")%>"/>
      </div>
          <div align="left" id="element"><b id="ele_head">Qualification :</b><br/>
              <textarea type="text" cols="56" rows="2" id="qualification" maxlength="350" placeholder="max 350 char." name="qualification"><%=rs13.getString("eis_traininginfo.qualification")%></textarea>
      </div>


          <div align="left" id="element"><b id="ele_head">Hobbies :</b><br/>
              <textarea type="text" cols="56" rows="2" maxlength="150" placeholder="max 150 char." id="hobbies" name="hobbies"><%=rs13.getString("eis_traininginfo.hobbies")%></textarea>
      </div>


      </div></td>
        </tr>

      </table><br/>
      <table align="center" width="100%">
       <tr>
              <td colspan="4">
                  <div align="left" id="headT">Training Completed </div>
              </td>
        </tr>
        <tr id="head1">
              <th width="5%">S.No.</th>
              <th  width="39%">Name of Training & Institution</th>
               <th  width="28%">From </th>
              <th  width="28%">To </th>
          </tr>

           <%
           String date3="";
           String date4="";
           int tc=1;
            try{
               con1 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt1 = con1.createStatement();
               String sql="select * from eis_trainingcompleted where email='"+email+"'";
               rs1=stmt1.executeQuery(sql);
               while(rs1.next()){
      date3=rs1.getString("tcFrom");
     date4=rs1.getString("tcTo");

                   %>
       <tr>
           <td align="center">&nbsp;</td>
           <td align="center"><input type="text" name="Tc_Name[<%=tc%>]" value="<%=rs1.getString("trainingName")%>" required/></td>
           <td align="center"><input type="text" name="Tc_Frm[<%=tc%>]" class="datepicker" readonly="true" value="<%=date3%>" required/></td>
           <td align="center"><input type="text" name="Tc_To[<%=tc%>]" class="datepicker" readonly="true" value="<%=date4%>" required/></td>
       </tr>

           <%
           tc=tc+1;
               }
               con1.close();
               }
               catch(Exception ex){
               ex.printStackTrace();
               }
           %>
           <tr>
              <td align="center"> <b>&nbsp;</b></td>
              <td align="center"> <input type="text" id="tcname[1]" name="tcname[1]" />
              <td align="center"> <input type="text" id="tcfrom[1]" name="tcfrom[1]" class="datepicker" placeholder="dd/mm/yyyy" readonly='true'/>
              <td align="center"> <input type="text" id="tcto[1]" name="tcto[1]" class="datepicker" placeholder="dd/mm/yyyy" readonly='true'/>
          </tr>

          <tr>
<td id="dynamicInputTc" colspan="4">
</td>
</tr>

           <tr>

               <td colspan="4" align="right">
                  <input type="button" value="Add" onClick="addInputTc('dynamicInputTc');">
              </td>
          </tr>

      </table>
<br/>
      <table align="center" width="100%">
          <tr>
              <td colspan="3">
                  <div align="left" id="headT">Training Preferences</div>
              </td>
        </tr>
        <tr id="head1">
              <th width="5%">S.No.</th>
              <th  width="40%">Name of Training & Institution</th>
              <th  width="55%">Details</th>
        </tr>
        <tr>
          <td align="center"> <b>1.</b></td>
          <td align="center">  <input type="text" id="tp_name_req_1" name="tp_name_req_1" value="<%=rs13.getString("eis_traininginfo.tp_name_req_1")==null ||rs13.getString("eis_traininginfo.tp_name_req_1")=="0"?" ":rs13.getString("eis_traininginfo.tp_name_req_1")%>"/></td>
          <td align="center">  <textarea cols="60" rows="2" maxlength="300" id="tp_det_1" name="tp_det_1"><%=rs13.getString("eis_traininginfo.tp_det_1")==null?" ":rs13.getString("eis_traininginfo.tp_det_1")%></textarea>
 </td>
        </tr>
        <tr>
          <td align="center"> <b>2.</b></td>
          <td align="center">  <input type="text" id="tp_name_req_2" name="tp_name_req_2" value="<%=rs13.getString("eis_traininginfo.tp_name_req_2")==null?" ":rs13.getString("eis_traininginfo.tp_name_req_2")%>"/></td>
          <td align="center">  <textarea cols="60" rows="2" maxlength="300" id="tp_det_2" name="tp_det_2"><%=rs13.getString("eis_traininginfo.tp_det_2")==null?" ":rs13.getString("eis_traininginfo.tp_det_2")%></textarea>
 </td>
        </tr>

        <tr>
          <td align="center"> <b>3.</b></td>
          <td align="center">  <input type="text" id="train_name_req_3" name="train_name_req_3" value="<%=rs13.getString("eis_traininginfo.tp_name_req_3")==null?" ":rs13.getString("eis_traininginfo.tp_name_req_3")%>"/></td>
          <td align="center">  <textarea cols="60" rows="2" maxlength="300" id="tp_det_3" name="tp_det_3"><%=rs13.getString("eis_traininginfo.tp_det_3")==null?" ":rs13.getString("eis_traininginfo.tp_det_3")%></textarea>
 </td>
        </tr>

      </table>
</fieldset>

    </div>
<br/>
 <br/>
             <div class="third">

             </div>
 <p class="warn"> Warning : No edit option is available after final submission.</p>

<div align="center">
    <table width="50%" align="center">
        <tr>
            <td align="right" style="margin-right: 2px;"><input type="submit" onclick="return myFunction();" value="Save as Draft"></td>
            <td align="left" style="margin-left: 2px;"><input type="submit" name="action" onclick="confirm('There is no edit option once you final submit. Are you sure you want to continue.');return saveEis();" value="Final Submit"></td>
        </tr>
    </table>


</div>
         </div>
  </td>
       </tr>
   </table>
 <br/><br/>
<%
}
               }
               catch(Exception ex){
               ex.printStackTrace();
               }
 }else{
 %>

 <h2>Final submission has been done</h2>
 
 <%
 
 }
       }

else
    {
  %>

  <jsp:forward page="EIS_adError.jsp" />
  <%}%>

  <div class="hide" align="center" style=" width: 100%; height: 90px; background:  #f8f5de  ; border: 1px gray thin;">
        <p style="margin-bottom: -15px;"> <a onClick="openTab(this)" href="http://mpr.dcmsme.gov.in/dcmsme/mprsenet/EIS_Approval_letter.pdf" ><b>Approval Letter, Sample Forms & Training Details From 2012-13 to 2017-18 .</b></a></p>
        <p>  Best view on mozilla firefox 52.0.0 and later version</p>
    </div>
  <div class="hide">&nbsp;</div>
    </body>
</html>
