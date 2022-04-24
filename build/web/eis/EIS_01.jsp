<%-- 
    Document   : EIS_01
    Created on : Dec 16, 2017, 9:27:00 AM
    Author     : Raghavendra
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
          <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
        <title>EIS</title>
        <style>
.container {
  width: 600px;
  padding: 20px;
  margin: auto;
  background: #ddd;
}
body {font-family: Arial;}

/* Style the tab */
.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
}
.menu1 {
    width: 100%;
    height: 80px;
    background:  #175fd6  ;
    color: white;
}
.tab1 {
                padding-top: 20px;
                margin-top: 20px;
                font-size: 13px;
                background:  #e8f5e3;
                border: 1px black solid;
                padding-left: 5px;
}
.tab2 {
                padding-top: 20px;
                margin-top: 20px;
                font-size: 15px;
                background:  #323130;
                
}

.td {
                padding-top: 5px;
                padding-bottom: 5px;
                margin-top: 10px;
                margin-left: 15px;
                padding-left: 15px;

}
.ins {
    font-family:Arial, Helvetica, sans-serif;
    font-size: 12px;
    font-weight: inherit;
}
.logout {
    font-family:Arial, Helvetica, sans-serif;
    font-size: 14px;
    text-decoration: none;
    margin-right: 55px;
}
.heading {
                padding-top: 5px;
                padding-bottom: 5px;
                margin-top: 10px;
                margin-left: 15px;
                font-size: 18px;
                font-weight: bold;
                color:  #FF5733 ;
                border-bottom: 2px red;
                border-bottom-style: solid;

}
.td1 {
    padding-top: 5px;
                padding-bottom: 5px;
                margin-top: 10px;
                margin-left: 15px;
                font-size: 15px;
                font-weight: bold;
                color:  #FF5733 ;

}
.heading1 {
                padding-top: 5px;
                padding-bottom: 5px;
                margin-top: 10px;
                margin-left: 15px;
                font-size: 18px;
                font-weight: bold;
                color:  #999999 ;
}
select {
    height: 25px;
    width: 280px;
}
input:hover {
color: red;
border: 2px green outset;
}
input:date{
    width: 590px;
}

</style>
 <%
                String ofcType="";
                String space="";
                String institute_name = " ";
                String mnm = request.getParameter("mnm");
                String instId = (String) session.getAttribute("CmbIns");
                String role = (String) session.getAttribute("rol");
                String years = (String) session.getAttribute("CmbYear");
                String months = (String) session.getAttribute("CmbMonth");
                String user = (String) session.getAttribute("user");
                String Crosssite = (String) session.getAttribute("Crosssite");
                session.setAttribute("instId",instId);
                session.setAttribute("Crosssite",Crosssite);
                if (instId != null) {
                    institute_name = ConnectionManager.instituteName(instId);
                }
                 session.setAttribute("institute_name",institute_name);
                 String branchType=institute_name.substring(0,4);

                 if(branchType.equals("MSME"))
                     {
                     ofcType=(institute_name.substring(5, 7));
                     ofcType=ofcType.toLowerCase();
                     }
                 else
                     {
                     ofcType=institute_name.substring(0, 2);
                     ofcType=ofcType.toLowerCase();
                     }
                 session.setAttribute("ofcType",ofcType);
                // System.out.println("Office type=="+branchType);
                // System.out.println("Office type=="+ofcType);
                 if(ofcType.equals("tc")){ space=" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";}
                 else {space=" &nbsp;&nbsp;&nbsp;";}
    %>
    <script>

 $(function() {
$( "#datepicker" ).datepicker();
})
</script>
    <script>
        function myFunction() {
         var name=document.getElementById("name").value;
         var designation=document.getElementById("degin").value;
         var DOB=document.getElementById("dob").value;
         var DOJ=document.getElementById("doj-G").value;
         var DOJMSME=document.getElementById("doj-msme").value;
         var DOR=document.getElementById("doR").value;

            if (name=="" || name==null){
                alert("Please enter name.....");
                    return false;
            }

            if (designation=="" || designation==null){
                alert("Please enter designation.....");
                    return false;
            }

            if (DOB=="" || DOB==null){
                alert("Please enter Date of Birth.....");
                    return false;
            }

            if (DOJ=="" || DOJ==null){
                alert("Please enter Date of Joining.....");
                    return false;
            }

            if (DOJMSME=="" || DOJMSME==null){
                alert("Please enter name.....");
                    return false;
            }
            if (DOR=="" || DOR==null){
                alert("Please enter name.....");
                    return false;
            }



            
else {
    document.forms[0].action = "success_01.jsp"
    return true;
        }}
    </script>
    </head>
    <%


%>
<body bgcolor="#f0eae3">
         <div class="menu1" align="center">Ministry of MSME <br/>(Government of India)<br/>EMPLOYEE MONITORING SYSTEM</div>
         <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:  #64bb64; " align="right"><font color="#990000"> <%= institute_name%><%=space%></font></div>
       <div style="font-size:large;font-family:Verdana;font-weight:bold; background:  #64bb64 " align="center" ><font color="#990000">Employee Information System</font>
         
           <div align="right" style=" position: relative">   <a HREF="logout.jsp?mnm=<%=Crosssite%>" target="_top"  class="logout"> <strong>Logout</strong></a></div>
       </div>  
          <%   if(!Crosssite.equals(null))
              {
    %>
     <div class="tab">
 <%-- <button class="tablinks" onclick="openTab(event, 'general')">General</button>
  <%-- <button class="tablinks" onclick="openTab(event, 'post_dtl')">Posting Detail</button>
  <button class="tablinks" onclick="openTab(event, 'ret_dtl')">Training Detail</button> --%>
  
</div>
   <form name="myform" method="post" action="" onsubmit="return myFunction()" >
  <%--<div align="center" id="ofcType" class="ofcType"><br/>
      <tr>
          <td> Select your Office Type :   <select type="ofcType" name="ofcType" id="ofcType" style="width: 150px">
                  <option> select</option>
                  <option value="di"> Development Institute (DIs)</option>
                  <option value="branch"> Branch (Branch DIs)</option>
                  <option value="tc"> Testing Center (TCs)</option>
                  <option value="ts"> Testing Station (TSs)</option>


              </select>                  </td>

      </tr>

  </div>--%>

       <div><br/>
           <table class="main" align="center"  style="width: 880px; height: 100%; border: 1px green thick;">
               
        <td class="heading" colspan="5"> Basic Detail -</td>


        <tr class="tab1">    
            <td class="td" colspan="2"> <br/>Name <b style=" color: red; font: 20px;">*<br/>&nbsp;</b>
            </td>
            <td class="td" colspan="3">
                : &nbsp; <input type="text" name="name" size="43" id="name" class="name" placeholder="Full Name"/> </td>   </tr>

                           <tr class="tab1">    <td class="td" colspan="2"> <br/>Designation <b style=" color: red; font: 20px;">*<br/>&nbsp;</b> </td>
                               <td class="td" colspan="3"> : &nbsp; <input type="text" name="degin" size="43" id="degin" class="degin" placeholder="Designation"/> </td>  </tr>

                           <tr class="tab1">    <td class="td" colspan="2"> <br/>Discipline <b style=" color: red; font: 20px;">*<br/>&nbsp;</b> </td>
                               <td class="td" colspan="3"> : &nbsp;
                                   <select id="discipline" name="discipline">
                                       <option>Select </option>
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
                                       

                                   </select>
                               </td>  </tr>

                           <tr class="tab1">    <td class="td" colspan="2"><br/> Date Of Birth<b style=" color: red; font: 20px;">*<br/>&nbsp;</b> </td>
                               <td class="td" colspan="3"> : &nbsp; <input type="date" name="dob" size="140" id="dob" class="dob" placeholder="DD/MM/YYYY"/> </td> </tr>

                           <tr class="tab1">    <td class="td" colspan="2"><br/> Date Of Joining ( in Govt Service ) <b style=" color: red; font: 20px;">*<br/>&nbsp;</b> </td>
                               <td class="td" colspan="3"> : &nbsp; <input type="text" name="doj-G" size="43" id="doj-G" class="doj-G" placeholder="DD/MM/YYYY"/> </td> </tr>

                           <tr class="tab1">    <td class="td" colspan="2"><br/> Date Of Joining ( in MSME DO )<b style=" color: red; font: 20px;">*<br/>&nbsp;</b> </td>
                               <td class="td" colspan="3"> : &nbsp; <input type="text" name="doj-msme" size="43" id="doj-msme" class="doj-msme" placeholder="DD/MM/YYYY"/> </td> </tr>

                           <tr class="tab1">    <td class="td" colspan="2"><br/> Date Of Retirement<b style=" color: red; font: 20px;">*<br/>&nbsp;</b> </td>
                               <td class="td" colspan="3"> : &nbsp; <input type="text" name="doR" size="43" id="doR" class="doR" placeholder="DD/MM/YYYY"/> </td> </tr>
 <tr>
      <td><br/></td>
  </tr>
                           <tr>
                               <td class="heading" colspan="5"> Posting Detail - </td>
                           
                           </tr>
                           

                           <tr class="tab1">    <td class="heading1" colspan="5"> Current Posting :<b style=" color: red; font: 20px;">*</b> </td>
                                </tr>
                                <tr class="tab2" style="height: 35px; color: white;"><strong>
                               <th>Office Name</th>
                               <th colspan="2">Post</th>
                               <th colspan="2">From</th>
                               
                               </strong>   </tr>

  <tr class="tab1">
      <td class="td">
               <input type="text" name="curr_ofc" size="43" id="curr_ofc" class="curr_ofc" placeholder="-"/>
      </td>
      <td class="td" colspan="2"  align="center">
      <select id="curr_post" name="curr_post">
        <option>Select Post...</option>
        <option value="AIA">AIA</option>
        <option value="Director">Director</option>
        <option value="Dy. Director">Dy. Director</option>
        <option value="Asstt. Director Grade-I">Asstt. Director Grade-I</option>
        <option value="Asstt. Director Grade-II">Asstt. Director Grade-II</option>
        <option value="Investigator">Investigator</option>

    </select>
</td>
<td class="td" colspan="2" align="center">
         <input type="text" name="curr_dur_yr" size="35" id="datepicker" class="curr_dur_ye" placeholder="DD/MM/YYYY"/>
         </td>
   



  <tr>
      <td><br/></td>
  </tr>
                           <tr class="tab1">   <td class="heading1" colspan="4"> Posting History  :</td> </tr>

                            <tr class="tab2" style="height: 35px; color: white;"><strong>
                               <th>Office Name</th>
                               <th>Post</th>
                               <th>Mode</th>
                               <th>From</th>
                               <th>TO</th>
                               
                               </strong>   </tr>
                           


<tr class="tab1">
<td class="td" >
    1.&nbsp; <input type="text" name="pos_his_ofc1" size="36" id="pos_his_ofc1" class="pos_his_ofc1" placeholder="-"/>
</td>
<td class="td" >
    <select id="post_his_1" name="post_his_1">
        <option>Select Post</option>
        <option value="AIA">AIA</option>
        <option value="Director">Director</option>
        <option value="Dy. Director">Dy. Director</option>
        <option value="Asstt. Director Grade-I">Asstt. Director Grade-I</option>
        <option value="Asstt. Director Grade-II">Asstt. Director Grade-II</option>
        <option value="Investigator">Investigator</option>

    </select>
</td>
<td class="td" colspan=""><select id="mode_1" name="mode_1">
        <option> Select mode..</option>
        <option value="Transfer">Transfer</option>
        <option value="Promotion">Promotion</option>
    </select>
</td>
<td class="td" colspan=""> 
<input type="text" name="pos_his_dur_yr1" size="25" id="pos_his_dur_yr1" class="pos_his_dur_yr1" placeholder="From"/>
</td>
<td class="td" colspan="">
<input type="text" name="pos_his_dur_mnt1" size="25" id="pos_his_dur_mnt1" class="pos_his_dur_mnt1" placeholder="To"/>
</td>

</tr>



<tr class="tab1">
    <td class="td" >
 2. &nbsp;     <input type="text" name="pos_his_ofc2" size="36" id="pos_his_ofc2" class="pos_his_ofc2" placeholder="-"/>
    </td>

    <td class="td" >
    <select id="post_his_2" name="post_his_2">
        <option>Select Post</option>
        <option value="AIA">AIA</option>
        <option value="Director">Director</option>
        <option value="Dy. Director">Dy. Director</option>
        <option value="Asstt. Director Grade-I">Asstt. Director Grade-I</option>
        <option value="Asstt. Director Grade-II">Asstt. Director Grade-II</option>
        <option value="Investigator">Investigator</option>

    </select>
</td>

<td class="td" colspan=""><select id="mode_2" name="mode_2">
        <option> Select mode..</option>
        <option value="Transfer">Transfer</option>
        <option value="Promotion">Promotion</option>
    </select>
</td>

<td class="td" > 
<input type="text" name="pos_his_dur_yr2" size="25" id="pos_his_dur_yr2" class="pos_his_dur_yr2" placeholder="From"/>

</td>
<td class="td">
 <input type="text" name="pos_his_dur_mnt2" size="25" id="pos_his_dur_mnt2" class="pos_his_dur_mnt2" placeholder="To"/>
</td>

</tr>


<tr class="tab1">
<td class="td">
3. &nbsp; <input type="text" name="pos_his_ofc3" size="36" id="pos_his_ofc3" class="pos_his_ofc3" placeholder="-"/>
</td>

<td class="td" >
    <select id="post_his_3" name="post_his_3">
        <option>Select Post</option>
        <option value="AIA">AIA</option>
        <option value="Director">Director</option>
        <option value="Dy. Director">Dy. Director</option>
        <option value="Asstt. Director Grade-I">Asstt. Director Grade-I</option>
        <option value="Asstt. Director Grade-II">Asstt. Director Grade-II</option>
        <option value="Investigator">Investigator</option>

    </select>
</td>
<td class="td" colspan=""><select id="mode_3" name="mode_3">
        <option> Select mode..</option>
        <option value="Transfer">Transfer</option>
        <option value="Promotion">Promotion</option>
    </select>
</td>

<td class="td" colspan="">
<input type="text" name="pos_his_dur_yr3" size="25" id="pos_his_dur_yr3" class="pos_his_dur_yr3" placeholder="From"/>

</td>
<td class="td" colspan="">
 <input type="text" name="pos_his_dur_mnt3" size="25" id="pos_his_dur_mnt3" class="pos_his_dur_mnt3" placeholder="To"/>
</td>

</tr>

<tr class="tab1">
<td class="td">
4. &nbsp;   <input type="text" name="pos_his_ofc4" size="36" id="pos_his_ofc4" class="pos_his_ofc4" placeholder="-"/>
</td>

<td class="td" >
    <select id="post_his_4" name="post_his_4">
        <option>Select Post</option>
        <option value="AIA">AIA</option>
        <option value="Director">Director</option>
        <option value="Dy. Director">Dy. Director</option>
        <option value="Asstt. Director Grade-I">Asstt. Director Grade-I</option>
        <option value="Asstt. Director Grade-II">Asstt. Director Grade-II</option>
        <option value="Investigator">Investigator</option>

    </select>
</td>
<td class="td" colspan=""><select id="mode_4" name="mode_4">
        <option> Select mode..</option>
        <option value="Transfer">Transfer</option>
        <option value="Promotion">Promotion</option>
    </select>
</td>

<td class="td" colspan="">
<input type="text" name="pos_his_dur_yr4" size="25" id="pos_his_dur_yr4" class="pos_his_dur_yr4" placeholder="From"/>

</td>
<td class="td" colspan="">
 <input type="text" name="pos_his_dur_mnt3" size="25" id="pos_his_dur_mnt4" class="pos_his_dur_mnt4" placeholder="To"/>
</td>

</tr>

<tr class="tab1">
<td class="td">
5. &nbsp;  <input type="text" name="pos_his_ofc5" size="36" id="pos_his_ofc5" class="pos_his_ofc5" placeholder="-"/>
</td>

<td class="td" >
    <select id="post_his_5" name="post_his_5">
        <option>Select Post</option>
        <option value="AIA">AIA</option>
        <option value="Director">Director</option>
        <option value="Dy. Director">Dy. Director</option>
        <option value="Asstt. Director Grade-I">Asstt. Director Grade-I</option>
        <option value="Asstt. Director Grade-II">Asstt. Director Grade-II</option>
        <option value="Investigator">Investigator</option>

    </select>
</td>
<td class="td" colspan=""><select id="mode_5" name="mode_5">
        <option> Select mode..</option>
        <option value="Transfer">Transfer</option>
        <option value="Promotion">Promotion</option>
    </select>
</td>

<td class="td" colspan="">
<input type="text" name="pos_his_dur_yr5" size="25" id="pos_his_dur_yr5" class="pos_his_dur_yr5" placeholder="From"/>

</td>
<td class="td" colspan="">
 <input type="text" name="pos_his_dur_mnt5" size="25" id="pos_his_dur_mnt5" class="pos_his_dur_mnt5" placeholder="To"/>
</td>

</tr>
 <tr>
      <td><br/></td>
  </tr>
<tr class="tab1">    <td class="heading1" colspan="4">Posting Option : </td>
                                </tr>
                                <tr class="tab2" style="height: 35px; color: white;"><strong>
                                    <th></th>
                                    <th colspan="2">Name of Office</th>
                                    <th colspan="2">Place</th>

                                </strong>
                                </tr>
                                <tr class="tab1">
                                    <td  class="td" colspan="" align="center">
                                       Option - 1 :
                                    </td>
                                    <td  class="td" colspan="2" align="center">
                                        <select id="post_opt_ofc_type_1" name="post_opt_ofc_type_1">
                                            <option> Select Office Type</option>
                                            <option value="O/o DC(MSME)"> O/o DC(MSME)</option>
                                            <option value="MSME-DIs"> MSME-DIs</option>
                                            <option value="Branch MSME-DIs"> Branch MSME-DIs</option>
                                            <option value="MSME-TCs"> MSME-TCs</option>
                                            <option value="MSME-TS"> MSME-TS</option>
                                        </select>
                                    </td>
                                    <td  class="td" colspan="2" align="center"><input type="text" name="post_opt_ofc_1" id="post_opt_ofc_1" size="40px"/></td>

                                </tr>

                                <tr class="tab1">
                                    <td  class="td" colspan="" align="center">
                                       Option - 2 :
                                    </td>
                                    <td  class="td" colspan="2" align="center">
                                        <select id="post_opt_ofc_type_2" name="post_opt_ofc_type_2">
                                            <option> Select Office Type</option>
                                            <option value="O/o DC(MSME)"> O/o DC(MSME)</option>
                                            <option value="MSME-DIs"> MSME-DIs</option>
                                            <option value="Branch MSME-DIs"> Branch MSME-DIs</option>
                                            <option value="MSME-TCs"> MSME-TCs</option>
                                            <option value="MSME-TS"> MSME-TS</option>
                                        </select>
                                    </td>
                                    <td  class="td" colspan="2" align="center"><input type="text" name="post_opt_ofc_2" id="post_opt_ofc_2" size="40px"/></td>

                                </tr>

                                <tr class="tab1">
                                    <td  class="td" colspan="" align="center">
                                       Option - 3 :
                                    </td>
                                    <td  class="td" colspan="2" align="center">
                                        <select id="post_opt_ofc_type_3" name="post_opt_ofc_type_3">
                                            <option> Select Office Type</option>
                                            <option value="O/o DC(MSME)"> O/o DC(MSME)</option>
                                            <option value="MSME-DIs"> MSME-DIs</option>
                                            <option value="Branch MSME-DIs"> Branch MSME-DIs</option>
                                            <option value="MSME-TCs"> MSME-TCs</option>
                                            <option value="MSME-TS"> MSME-TS</option>
                                        </select>
                                    </td>
                                    <td  class="td" colspan="2" align="center"><input type="text" name="post_opt_ofc_3" id="post_opt_ofc_3" size="40px"/></td>

                                </tr>
<tr>
      <td><br/></td>
</tr>
                                
                            <tr>
                               <td class="heading" colspan="5"> Training Detail -</td>
                           </tr>
                           <tr class="tab1">    <td class="heading1" colspan="5"> Training Completed :</td>
                                </tr>

                                <tr class="tab2" style="height: 35px; color: white;">
                                <strong>
                                    <th colspan="">S.No.</th>
                                    <th colspan="2"> Training Name</th>
                                    <th colspan="">From</th>
                                    <th colspan="">To</th>
                                </strong>
                                </tr>
                                

<tr class="tab1" >
    <td class="td" align="center"><b>1.</b></td>
    <td class="td" align="center" colspan="2"> <input type="text" name="train_1" size="75" id="train_1" class="train_1" placeholder="Training Name - 1"/></td>
    <td class="td" >
     <input type="text" name="trn_his_dur_yr1" size="25" id="trn_his_dur_yr1" class="trn_his_dur_yr1" placeholder="From"/>

    </td>
    <td  class="td" colspan="">
     <input type="text" name="trn_his_dur_mnt1" size="25" id="trn_his_dur_mnt1" class="trn_his_dur_mnt1" placeholder="To"/>
    </td>
</tr>

                                <tr class="tab1" >
                                    <td class="td" align="center"><b>2.</b></td>
    <td class="td" align="center" colspan="2"> <input type="text" name="train_2" size="75" id="train_2" class="train_2" placeholder="Training Name - 2"/></td>
    <td class="td" >
     <input type="text" name="trn_his_dur_yr2" size="25" id="trn_his_dur_yr2" class="trn_his_dur_yr2" placeholder="From"/>

    </td>
    <td  class="td" colspan="">
     <input type="text" name="trn_his_dur_mnt2" size="25" id="trn_his_dur_mnt2" class="trn_his_dur_mnt2" placeholder="To"/>
    </td>
</tr>

                                <tr class="tab1" >
                                    <td class="td" align="center"><b>3.</b></td>
    <td class="td" align="center" colspan="2"> <input type="text" name="train_3" size="75" id="train_3" class="train_3" placeholder="Training Name - 3"/></td>
    <td class="td" >
     <input type="text" name="trn_his_dur_yr3" size="25" id="trn_his_dur_yr3" class="trn_his_dur_yr3" placeholder="From"/>

    </td>
    <td  class="td" colspan="">
     <input type="text" name="trn_his_dur_mnt3" size="25" id="trn_his_dur_mnt3" class="trn_his_dur_mnt3" placeholder="To"/>
    </td>
</tr>

                                <tr class="tab1" >
                                    <td class="td" align="center"><b>4.</b></td>
    <td class="td" align="center" colspan="2"> <input type="text" name="train_4" size="75" id="train_4" class="train_4" placeholder="Training Name - 4"/></td>
    <td class="td" >
     <input type="text" name="trn_his_dur_yr4" size="25" id="trn_his_dur_yr4" class="trn_his_dur_yr4" placeholder="From"/>

    </td>
    <td  class="td" colspan="">
     <input type="text" name="trn_his_dur_mnt4" size="25" id="trn_his_dur_mnt4" class="trn_his_dur_mnt4" placeholder="To"/>
    </td>
</tr>

                                <tr class="tab1" >
                                    <td class="td" align="center"><b>5.</b></td>
    <td class="td" align="center" colspan="2"> <input type="text" name="train_5" size="75" id="train_5" class="train_5" placeholder="Training Name - 5"/></td>
    <td class="td" >
     <input type="text" name="trn_his_dur_yr5" size="25" id="trn_his_dur_yr5" class="trn_his_dur_yr5" placeholder="From"/>

    </td>
    <td  class="td" colspan="">
     <input type="text" name="trn_his_dur_mnt5" size="25" id="trn_his_dur_mnt5" class="trn_his_dur_mnt5" placeholder="To"/>
    </td>
</tr>

<tr>
      <td><br/></td>
</tr>



<tr class="tab1">    <td class="heading1" colspan="5"> Training Preferences  :</td>
                                </tr>

        <tr class="tab1">  
            <td class="td" align="center"><b>1.</b></td>
            <td class="td" align="center" colspan=""><b>Name of Training  </b> </td>
        <td class="td" colspan="3">   <input type="text" name="train_req_1" size="105" id="train_req_1" class="train_req_1" placeholder="Name of required training"/> <br/>
         </td>
        </tr>
        <tr class="tab1">  
            <td class="td" align="center"><b>2.</b></td>
            <td class="td" align="center" colspan=""><b>Name of Training  </b> </td>
        <td class="td" colspan="3">   <input type="text" name="train_req_2" size="105" id="train_req_2" class="train_req_2" placeholder="Name of required training"/> <br/>
         </td>
        </tr>
        <tr class="tab1">   
            <td class="td" align="center"><b>3.</b></td>
            <td class="td" align="center" colspan=""><b> Name of Training  </b> </td>
        <td class="td" colspan="3">   <input type="text" name="train_req_3" size="105" id="train_req_3" class="train_req_3" placeholder="Name of required training"/> <br/>
         </td>
        </tr>
        <tr>
      <td><br/></td>
</tr>



                           <tr class="tab1">     <td colspan="5" class="td" align="center"> <br/>
                                   <input type="submit" value="Submit" name="submit"/><br/> &nbsp;</td>   </tr>
           
</table>
           <br/><br/>

       </div>
          


<%}
                else
                    {
%>
<div align="center" style="font-family: Arial, Helvetica, sans-serif; border: 2px; border-style: double "> Please login again or Contact to administrator. </div>
<%}%>
    </body>
</html>
