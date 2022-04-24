<%-- 
    Document   : EIS_02test
    Created on : Dec 27, 2017, 9:32:49 PM
    Author     : Admin
--%>


<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
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
        <title>EIS form</title>
        <link rel="shortcut icon" href="fevicon.png" type="image/x-icon">
        <script type="text/javascript" src="EIS_forms.js"></script>
         <link rel="stylesheet" type="text/css" href="EIS_02test.css">
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
<SCRIPT language="javascript">
    var counter = 1;

    var limit = 10;

    function addInput(divName){

         if (counter == limit)  {

              alert("You have reached the limit of adding " + counter + " inputs");

         }

         else {

              var newdiv = document.createElement('tr');


              newdiv.innerHTML = +counter+"<td id='dynamic1' align='center'><input type='text' name='myInputs1["+counter +"]'></td>&nbsp;" +
                  "<td id='dynamic2' align='center'><select id='sel' name='sel["+counter +"]'>\n\
                   <option>Select</option>\n\
                   <option value='AIA'>AIA</option>\n\
                   <option value='Director'>Director</option>\n\
                   <option value='Dy. Director'>Dy. Director</option>\n\
                   <option value='Asstt. Director Grade-I'>Asstt. Director Grade-I</option>\n\
                   <option value='Asstt. Director Grade-II'>Asstt. Director Grade-II</option>\n\
                   <option value='Investigator'>Investigator</option>\n\
                   </select></td>"+
                  "<td id='dynamic3' align='center'><select id='sel' name='sel["+counter +"]'>\n\
                   <option>Select</option>\n\
                   <option value='Direct Recruitment'>Direct Recruitment</option>\n\
                   <option value='Transfer'>Transfer</option>\n\
                   <option value='Promotion'>Promotion</option>\n\
                   </select></td>"+
                  "<td id='dynamic4' align='center'><input type='date' name='myInputs2["+counter +"]'></td>"+
                  "<td id='dynamic5' align='center'><input type='date' name='myInputs3["+counter +"]'></td>";


              document.getElementById(divName).appendChild(newdiv);


              counter++;

         }
var url= "EIS_success.jsp";
url += "?counter=" +counter;
xmlHttp.open("GET", url, true);
    }

</SCRIPT>
        
<%
int flagCount=0;
String email=(String)session.getAttribute("username");
String crosssite=(String)session.getAttribute("nmm");
session.setAttribute("crosssite",crosssite);
System.out.println("email is=="+email);
String username="";
String user_cur_ofc="";
String userdesig="";
String token="";
String mobile="";


               Connection con12=null;
               ResultSet rs12=null;
               try{
               con12 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt12 = con12.createStatement();
               String sql12="Select * from eis_register where email='"+email+"'";
               rs12=stmt12.executeQuery(sql12);
               while(rs12.next()){
username=rs12.getString("name");
user_cur_ofc=rs12.getString("curnt_ofc");
userdesig=rs12.getString("designation");
token=rs12.getString("token");
mobile=rs12.getString("mobile");

 }
               con12.close();
 }
               catch(Exception ex){
               ex.printStackTrace();
               }
 
 session.setAttribute("token",token);
 session.setAttribute("name",username);
 session.setAttribute("email",email);
 session.setAttribute("userdesig",userdesig);
 session.setAttribute("user_cur_ofc",user_cur_ofc);
%>
    </head>
    <body bgcolor="#f0eae3">

       <div class="menu1" align="center">Government of India<br/>Ministry of MSME <br/> O/o  DCMSME </div>
         <div style="font-size: large;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"> <%=user_cur_ofc%></font></div>
       <div style="font-size:large;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-bottom: 5px; " align="center" ><font color="#990000">Employee Information System</font>
           <div></div>
   </div><br/>

   <%
   if(!crosssite.equals(null))
       {

       Connection con14=null;
               ResultSet rs14=null;
               try{
               con14 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt14 = con14.createStatement();
               String sql14="Select * from eis_postinginfo where email='"+email+"'";
               rs14=stmt14.executeQuery(sql14);
               while(rs14.next()){
flagCount=1;

 }
               con14.close();
 }
               catch(Exception ex){
               ex.printStackTrace();
               }
%>
   <h4 align="left">Hello <%=username%> !</h4><h5 align="right"><a HREF="EIS_logout.jsp" > <strong>Logout</strong></a></h5>
         <div class="main" align="center"><br/>
          <form name="myform" method="post" action="" onsubmit="return myFunction()"/>
             
        <%
        if(flagCount==1)
            {
               Connection con13=null;
               ResultSet rs13=null;
        try{
               con13 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt13 = con13.createStatement();
               String sql13="SELECT * FROM eis_basicinfo INNER JOIN eis_postinginfo ON eis_basicinfo.email=eis_postinginfo.email INNER JOIN eis_traininginfo ON eis_postinginfo.email=eis_traininginfo.email WHERE eis_basicinfo.email='"+email+"';";
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
              <input type="text" id="bas_name" name="bas_name" value="<%=username%>" disabled="disable" class="bas_name"/>
      </div>
      <div align="left" id="element"><b id="ele_head">Designation :</b><br/>
          <input type="text" id="bas_designation" name="bas_designation" value="<%=userdesig%>" disabled="disable">
       <%--       <option value="">Select</option>
        <option value="AIA">AIA</option>
        <option value="Director">Director</option>
        <option value="Dy. Director">Dy. Director</option>
        <option value="Asstt. Director Grade-I">Asstt. Director Grade-I</option>
        <option value="Asstt. Director Grade-II">Asstt. Director Grade-II</option>
        <option value="Investigator">Investigator</option>
        <option value="Office Superitendent">Office Superitendent</option>

    </select> --%>
      </div>
          
          <div align="left" id="element"><b id="ele_head">Date of Birth :</b><br/>
              <input type="date" id="dob" name="dob" value="<%=rs13.getString("eis_basicinfo.bod")%>" class="dob"/>
      </div>
           <div align="left" id="element"><b id="ele_head">Date of Retirement :</b><br/>
               <input type="date" id="dat_ret" name="dat_ret" class="dat_ret" value="<%=rs13.getString("eis_basicinfo.dat_ret")%>"/>
      </div>
          <div align="left" id="element">&nbsp;
</div>
      </div></td>
      <td width="475px" align="center">
      <div class="col">
      <div align="left" id="element"><b id="ele_head">E-mail :</b><br/>
          <input type="text" id="email" name="email" disabled="disable" class="email" value="<%=email%>"/>
      </div>
      <div align="left" id="element"><b id="ele_head">Descipline :</b><br/>
       <select id="bas_descipline" name="bas_descipline">
           <option value="<%=rs13.getString("eis_basicinfo.bas_descipline")%>"><%=rs13.getString("eis_basicinfo.bas_descipline")%></option>
           <option value="">Select</option>
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
      </div>
          <div align="left" id="element"><b id="ele_head">Date of joining ( Govt. Service ) :</b><br/>
              <input type="date" id="doj_gov" name="doj_gov" class="doj_gov" value="<%=rs13.getString("eis_basicinfo.doj_gov")%>"/>
      </div>
          <div align="left" id="element"><b id="ele_head">Date of joining ( O/o MSME-DO ) :</b><br/>
              <input type="date" id="doj_msme" name="doj_msme" class="doj_msme" value="<%=rs13.getString("eis_basicinfo.doj_msme")%>"/>
      </div>
<div align="left" id="element">&nbsp;
</div>
      </div></td>
        </tr>  </table>
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
          <tr>
              <td width="475px" align="center" colspan="2">
      <div class="col">
          <div align="left" id="element" class="element"><b id="ele_head">Office Name :</b><br/>
              <input type="text" id="cur_ofctype" name="cur_ofctype" value="<%=rs13.getString("eis_postinginfo.state")%>"/>
              <%--            <select id="cur_ofctype" name="cur_ofctype">
  <option>Select</option>
 <%
               Connection con11=null;
               ResultSet rs11=null;
               try{
               con11 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt11 = con11.createStatement();
               String sql="select * from eis_branch_list group by type";
               rs11=stmt11.executeQuery(sql);
               while(rs11.next()){
     %>
 <option value="<%=rs11.getString("type")%>"><%=rs11.getString("type")%></option>
 <%
 }
               con11.close();
               }
               catch(Exception ex){
               ex.printStackTrace();
               }

     %>
 </select>  --%>

 
      <div align="left" id="state"  class="element">
          <b id="ele_head">Mobile :</b><br/>
          <input type="text" id="mobile" name="mobile" value="<%=mobile%>"
          <%--   <select name="state" id="state" >
          <option value='-1'></option>
          </select> --%>
        </div>
        <div align="left" id="element">&nbsp;
        </div>

      </div>
      </div>
              </td>
              <td width="475px" align="center" colspan="2">
      <div class="col">
      <div align="left" id="element"><b id="ele_head">Designation :</b><br/>
          <input type="text"  id="curr_despln" name="curr_despln" value="<%=userdesig%>"/>

          <%--    <select id="curr_despln" name="curr_despln">
        <option>Select</option>
        <option value="AIA">AIA</option>
        <option value="Director">Director</option>
        <option value="Dy. Director">Dy. Director</option>
        <option value="Asstt. Director Grade-I">Asstt. Director Grade-I</option>
        <option value="Asstt. Director Grade-II">Asstt. Director Grade-II</option>
        <option value="Investigator">Investigator</option>

    </select>  --%>
      </div>
      
          
          <div align="left" id="element"><b id="ele_head">Date of Joining ( Current office ):</b><br/>
              <input type="date" id="curr_doj" name="curr_doj" class="curr_doj" value="<%=rs13.getString("eis_postinginfo.curr_doj")%>"/>
      </div>
<div align="left" id="element">&nbsp;
</div>
      </div></td>
        </tr>
      </table><br/>
 <table align="center" width="100%">
        <tr>
              <td colspan="5">
                  <div align="left" id="head">Posting History </div>
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
          <tr>

  <td align="center">
      <select id="ph_ofc_1" name="ph_ofc_1">
  <option value="<%=rs13.getString("eis_postinginfo.ph_ofc_1")%>"><%=rs13.getString("eis_postinginfo.ph_ofc_1")%></option>
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
 
 </td>
      <td align="center">
          <select id="ph_desig_1" name="ph_desig_1">
              <option value="<%=rs13.getString("eis_postinginfo.ph_desig_1")%>"><%=rs13.getString("eis_postinginfo.ph_desig_1")%></option>
        <option>Select</option>
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
          <select id="ph_mode_1" name="ph_mode_1">
        <option value="<%=rs13.getString("eis_postinginfo.ph_mode_1")%>"><%=rs13.getString("eis_postinginfo.ph_mode_1")%></option>
              <option> Select</option>
         <option value="Direct Recruitment">Direct Recruitment</option>
        <option value="Transfer">Transfer</option>
        <option value="Promotion">Promotion</option>
       
    </select>
      </td>

             
      <td align="center">
          <input type="date" id="ph_date_frm_1" name="ph_date_frm_1" value="<%=rs13.getString("ph_date_frm_1")%>"/>
      </td>
      <td align="center">
          <input type="date" id="ph_date_to_1" name="ph_date_to_1" value="<%=rs13.getString("ph_date_to_1")%>"/>
     </td>
     
          </tr>
<%--Posting History 2--%>
           <tr>

  <td align="center">
      <select id="ph_ofc_2" name="ph_ofc_2">
          <option value="<%=rs13.getString("eis_postinginfo.ph_ofc_2")%>"><%=rs13.getString("eis_postinginfo.ph_ofc_2")%></option>
  <option value="">Select</option>
 <%
               //Connection con1=null;
               //ResultSet rs1=null;
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
          <select id="ph_desig_2" name="ph_desig_2">
              <option value="<%=rs13.getString("eis_postinginfo.ph_desig_2")%>"><%=rs13.getString("eis_postinginfo.ph_desig_2")%></option>
        <option>Select</option>
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
          <select id="ph_mode_2" name="ph_mode_2">
              <option value="<%=rs13.getString("eis_postinginfo.ph_mode_2")%>"><%=rs13.getString("eis_postinginfo.ph_mode_2")%></option>
        <option> Select</option>
         <option value="Direct Recruitment">Direct Recruitment</option>
        <option value="Transfer">Transfer</option>
        <option value="Promotion">Promotion</option>

    </select>
      </td>


      <td align="center">
          <input type="date" id="ph_date_frm_2" name="ph_date_frm_2" value="<%=rs13.getString("ph_date_frm_2")%>"/>
      </td>
      <td align="center">
          <input type="date" id="ph_date_to_2" name="ph_date_to_2" value="<%=rs13.getString("ph_date_to_2")%>"/>
     </td>

          </tr>
<%--Posting History 3--%>
          <tr>

  <td align="center">
      <select id="ph_ofc_3" name="ph_ofc_3">
          <option value="<%=rs13.getString("eis_postinginfo.ph_ofc_3")%>"><%=rs13.getString("eis_postinginfo.ph_ofc_3")%></option>
  <option value="">Select</option>
 <%
            //   Connection con1=null;
            //   ResultSet rs1=null;
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
          <select id="ph_desig_3" name="ph_desig_3">
              <option value="<%=rs13.getString("eis_postinginfo.ph_desig_3")%>"><%=rs13.getString("eis_postinginfo.ph_desig_3")%></option>
        <option>Select</option>
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
          <select id="ph_mode_3" name="ph_mode_3">
              <option value="<%=rs13.getString("eis_postinginfo.ph_mode_3")%>"><%=rs13.getString("eis_postinginfo.ph_mode_3")%></option>
        <option> Select</option>
         <option value="Direct Recruitment">Direct Recruitment</option>
        <option value="Transfer">Transfer</option>
        <option value="Promotion">Promotion</option>

    </select>
      </td>


      <td align="center">
          <input type="date" id="ph_date_frm_3" name="ph_date_frm_3" value="<%=rs13.getString("ph_date_frm_3")%>"/>
      </td>
      <td align="center">
          <input type="date" id="ph_date_to_3" name="ph_date_to_3" value="<%=rs13.getString("ph_date_to_3")%>"/>
     </td>

          </tr>
<%--Posting History 4--%>
          <tr>

  <td align="center">
      <select id="ph_ofc_4" name="ph_ofc_4">
          <option value="<%=rs13.getString("eis_postinginfo.ph_ofc_4")%>"><%=rs13.getString("eis_postinginfo.ph_ofc_4")%></option>
  <option value="">Select</option>
 <%
           //    Connection con1=null;
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
      <td align="center">
          <select id="ph_desig_4" name="ph_desig_4">
              <option value="<%=rs13.getString("eis_postinginfo.ph_desig_4")%>"><%=rs13.getString("eis_postinginfo.ph_desig_4")%></option>
        <option>Select</option>
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
          <select id="ph_mode_4" name="ph_mode_4">
              <option value="<%=rs13.getString("eis_postinginfo.ph_mode_4")%>"><%=rs13.getString("eis_postinginfo.ph_mode_4")%></option>
        <option> Select</option>
         <option value="Direct Recruitment">Direct Recruitment</option>
        <option value="Transfer">Transfer</option>
        <option value="Promotion">Promotion</option>

    </select>
      </td>


      <td align="center">
          <input type="date" id="ph_date_frm_4" name="ph_date_frm_4" value="<%=rs13.getString("ph_date_frm_4")%>" />
      </td>
      <td align="center">
          <input type="date" id="ph_date_to_4" name="ph_date_to_4" value="<%=rs13.getString("ph_date_to_4")%>"/>
     </td>

          </tr>
<%--Posting History 5--%>
          <tr>

  <td align="center">
      <select id="ph_ofc_5" name="ph_ofc_5">
          <option value="<%=rs13.getString("eis_postinginfo.ph_ofc_5")%>"><%=rs13.getString("eis_postinginfo.ph_ofc_5")%></option>
  <option value="">Select</option>
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
      <td align="center">
          <select id="ph_desig_5" name="ph_desig_5">
              <option value="<%=rs13.getString("eis_postinginfo.ph_desig_5")%>"><%=rs13.getString("eis_postinginfo.ph_desig_5")%></option>
        <option>Select</option>
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
          <select id="ph_mode_5" name="ph_mode_5">
              <option value="<%=rs13.getString("eis_postinginfo.ph_mode_5")%>"><%=rs13.getString("eis_postinginfo.ph_mode_5")%></option>
        <option> Select</option>
         <option value="Direct Recruitment">Direct Recruitment</option>
        <option value="Transfer">Transfer</option>
        <option value="Promotion">Promotion</option>

    </select>
      </td>


      <td align="center">
          <input type="date" id="ph_date_frm_5" name="ph_date_frm_5" value="<%=rs13.getString("ph_date_frm_5")%>"/>
      </td>
      <td align="center">
          <input type="date" id="ph_date_to_5" name="ph_date_to_5" value="<%=rs13.getString("ph_date_to_5")%>"/>
     </td>

          </tr>
         
     <%--    <td id="dynamicInput" colspan="5">


         </td>

           <tr>
              
               <td colspan="5" align="right">
                  <input type="button" value="Add" onClick="addInput('dynamicInput');">
              </td> 
          </tr> --%>

      </table>
        <br>
        <table align="center" width="100%">

        <tr>
              <td colspan="2">
                  <div align="left" id="head">Posting Preferences </div>
              </td>
        </tr>
        <tr>
            <td align="center">
                <b>    1st Option : </b></td>
            <td><select id="pst_pref_1" name="pst_pref_1">
  <option value="<%=rs13.getString("eis_postinginfo.pst_pref_1")%>"><%=rs13.getString("eis_postinginfo.pst_pref_1")%></option>
  <option value="">Select</option>
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
            <td align="center">
                <b>    2nd Option : </b></td>
              <td><select  id="pst_pref_2" name="pst_pref_2">
                      <option value="<%=rs13.getString("eis_postinginfo.pst_pref_2")%>"><%=rs13.getString("eis_postinginfo.pst_pref_2")%></option>
  <option value="none">Select</option>
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
            <td align="center">
                <b>    3rd Option : </b></td>
              <td><select id="pst_pref_3" name="pst_pref_3">
                      <option value="<%=rs13.getString("eis_postinginfo.pst_pref_3")%>"><%=rs13.getString("eis_postinginfo.pst_pref_3")%></option>
  <option value="none">Select</option>
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
            <td align="center">
                <b>Any other  :</b>

            </td>
            <td align="left">
                 <textarea cols="107" rows="4" type="text" id="your_spl_pref" name="your_spl_pref" maxlength="800" placeholder="Reason for Preferences.">
<%=rs13.getString("eis_postinginfo.your_spl_area")%>
                 </textarea>
            </td>
        </tr>

        </table> <br/><br/>

 <table align="center" width="100%">

        <tr>
              <td colspan="2">
                  <div align="left" id="head">Yourself  </div>
              </td>
        </tr>
        <tr>
            <td align="center" style="">
                <b> Specialization Area  :</b>
               
            </td>
            <td align="left">
                 <textarea cols="98" rows="4" type="text"  id="your_spl_area" name="your_spl_area" maxlength="1000">
<%=rs13.getString("eis_postinginfo.your_spl_pref")%>
                 </textarea>
            </td>
        </tr>
        
 </table>

</fieldset>
                 </div>
 <br/><br/>
 <div align="center" id="first">
<fieldset>

      <legend>Training Details</legend>
      <table align="center" width="100%">
       <tr>
              <td colspan="4">
                  <div align="left" id="head">Training Completed </div>
              </td>
        </tr>
        <tr id="head1">
              <th width="5%">S.No.</th>
              <th  width="39%">Name of Training</th>
              <th  width="28%">From </th>
              <th  width="28%">To </th>
          </tr>
          <tr>
              <td align="center"> <b>1.</b></td>
              <td align="center"> <input type="text" id="tc_train_1" name="tc_train_1" value="<%=rs13.getString("eis_traininginfo.tc_train_1")%>" />
              <td align="center"> <input type="date" id="tc_date_frm_1" name="tc_date_frm_1" value="<%=rs13.getString("eis_traininginfo.tc_date_frm_1")%>"/>
              <td align="center"> <input type="date" id="tc_date_to_1" name="tc_date_to_1" value="<%=rs13.getString("eis_traininginfo.tc_date_to_1")%>"/>
          </tr>
          <tr>
              <td align="center"> <b>2.</b></td>
              <td align="center"> <input type="text" id="tc_train_2" name="tc_train_2" value="<%=rs13.getString("eis_traininginfo.tc_train_2")%>"/>
              <td align="center"> <input type="date" id="tc_date_frm_2" name="tc_date_frm_2" value="<%=rs13.getString("eis_traininginfo.tc_date_frm_2")%>"/>
              <td align="center"> <input type="date" id="tc_date_to_2" name="tc_date_to_2" value="<%=rs13.getString("eis_traininginfo.tc_date_to_2")%>"/>
          </tr>
          <tr>
              <td align="center"> <b>3.</b></td>
              <td align="center"> <input type="text" id="tc_train_3" name="tc_train_3" value="<%=rs13.getString("eis_traininginfo.tc_train_3")%>"/>
              <td align="center"> <input type="date" id="tc_date_frm_3" name="tc_date_frm_3" value="<%=rs13.getString("eis_traininginfo.tc_date_frm_3")%>"/>
              <td align="center"> <input type="date" id="tc_date_to_3" name="tc_date_to_3" value="<%=rs13.getString("eis_traininginfo.tc_date_to_3")%>"/>
          </tr>
          <tr>
              <td align="center"> <b>4.</b></td>
              <td align="center"> <input type="text" id="tc_train_4" name="tc_train_4" value="<%=rs13.getString("eis_traininginfo.tc_train_4")%>"/>
              <td align="center"> <input type="date" id="tc_date_frm_4" name="tc_date_frm_4" value="<%=rs13.getString("eis_traininginfo.tc_date_frm_4")%>"/>
              <td align="center"> <input type="date" id="tc_date_to_4" name="tc_date_to_4" value="<%=rs13.getString("eis_traininginfo.tc_date_to_4")%>"/>
          </tr>
          <tr>
              <td align="center"> <b>5.</b></td>
              <td align="center"> <input type="text" id="tc_train_5" name="tc_train_5" value="<%=rs13.getString("eis_traininginfo.tc_train_5")%>"/>
              <td align="center"> <input type="date" id="tc_date_frm_5" name="tc_date_frm_5" value="<%=rs13.getString("eis_traininginfo.tc_date_frm_5")%>"/>
              <td align="center"> <input type="date" id="tc_date_to_5" name="tc_date_to_5" value="<%=rs13.getString("eis_traininginfo.tc_date_to_5")%>"/>
          </tr>
      </table>
<br/>
      <table align="center" width="100%">
          <tr>
              <td colspan="3">
                  <div align="left" id="head">Training Preferences</div>
              </td>
        </tr>
        <tr id="head1">
              <th width="5%">S.No.</th>
              <th  width="40%">Name of Training</th>
              <th  width="55%">Details</th>
        </tr>
        <tr>
          <td align="center"> <b>1.</b></td>
          <td align="center">  <input type="text" id="tp_name_req_1" name="tp_name_req_1" value="<%=rs13.getString("eis_traininginfo.tp_name_req_1")%>"/></td>
          <td align="center">  <textarea cols="60" rows="2" maxlength="300" id="tp_det_1" name="tp_det_1"><%=rs13.getString("eis_traininginfo.tp_det_1")%></textarea>
 </td>
        </tr>
        <tr>
          <td align="center"> <b>2.</b></td>
          <td align="center">  <input type="text" id="tp_name_req_2" name="tp_name_req_2" value="<%=rs13.getString("eis_traininginfo.tp_name_req_2")%>"/></td>
          <td align="center">  <textarea cols="60" rows="2" maxlength="300" id="tp_det_2" name="tp_det_2"><%=rs13.getString("eis_traininginfo.tp_det_2")%></textarea>
 </td>
        </tr>

        <tr>
          <td align="center"> <b>3.</b></td>
          <td align="center">  <input type="text" id="train_name_req_3" name="train_name_req_3" value="<%=rs13.getString("eis_traininginfo.tp_name_req_3")%>"/></td>
          <td align="center">  <textarea cols="60" rows="2" maxlength="300" id="tp_det_3" name="tp_det_3"><%=rs13.getString("eis_traininginfo.tp_det_3")%></textarea>
 </td>
        </tr>

      </table>
</fieldset>
 <br/>
 <br/>
<div align="center">
    <input type="submit" value="Submit">
</div>
 <br/>
 <br/>

 </div>
            
 <%
 
 }

                          }
        catch (Exception ex){
            ex.printStackTrace();
            }
               }
               else
                   {
 %>
 <div align="center" id="first">
 <fieldset>

      <legend>Basic Information</legend>
      <table align="center" width="100%">
          <tr>
              <td width="475px" align="center">
      <div class="col">
          <div align="left" id="element"><b id="ele_head">Name :</b><br/>
              <input type="text" id="bas_name" name="bas_name" value="<%=username%>" disabled="disable" class="bas_name"/>
      </div>
      <div align="left" id="element"><b id="ele_head">Designation :</b><br/>
          <input type="text" id="bas_designation" name="bas_designation" value="<%=userdesig%>" disabled="disable">
       <%--       <option value="">Select</option>
        <option value="AIA">AIA</option>
        <option value="Director">Director</option>
        <option value="Dy. Director">Dy. Director</option>
        <option value="Asstt. Director Grade-I">Asstt. Director Grade-I</option>
        <option value="Asstt. Director Grade-II">Asstt. Director Grade-II</option>
        <option value="Investigator">Investigator</option>
        <option value="Office Superitendent">Office Superitendent</option>

    </select> --%>
      </div>

          <div align="left" id="element"><b id="ele_head">Date of Birth :</b><br/>
              <input type="date" id="dob" name="dob" class="dob"/>
      </div>
           <div align="left" id="element"><b id="ele_head">Date of Retirement :</b><br/>
               <input type="date" id="dat_ret" name="dat_ret" class="dat_ret">
      </div>
          <div align="left" id="element">&nbsp;
</div>
      </div></td>
      <td width="475px" align="center">
      <div class="col">
      <div align="left" id="element"><b id="ele_head">E-mail :</b><br/>
          <input type="text" id="email" name="email" disabled="disable" class="email" value="<%=email%>"/>
      </div>
      <div align="left" id="element"><b id="ele_head">Descipline :</b><br/>
       <select id="bas_descipline" name="bas_descipline">
           <option value="">Select</option>
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
      </div>
          <div align="left" id="element"><b id="ele_head">Date of joining ( Govt. Service ) :</b><br/>
              <input type="date" id="doj_gov" name="doj_gov" class="doj_gov"/>
      </div>
          <div align="left" id="element"><b id="ele_head">Date of joining ( O/o MSME-DO ) :</b><br/>
              <input type="date" id="doj_msme" name="doj_msme" class="doj_msme" />
      </div>
<div align="left" id="element">&nbsp;
</div>
      </div></td>
        </tr>  </table>
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
          <tr>
              <td width="475px" align="center" colspan="2">
      <div class="col">
          <div align="left" id="element" class="element"><b id="ele_head">Office Name :</b><br/>
              <input type="text" id="cur_ofctype" name="cur_ofctype"/>
                     <select id="cur_ofctype" name="cur_ofctype">
  <option>Select</option>
 <%
               Connection con11=null;
               ResultSet rs11=null;
               try{
               con11 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt11 = con11.createStatement();
               String sql="select * from eis_branch_list group by type";
               rs11=stmt11.executeQuery(sql);
               while(rs11.next()){
     %>
 <option value="<%=rs11.getString("type")%>"><%=rs11.getString("type")%></option>
 <%
 }
               con11.close();
               }
               catch(Exception ex){
               ex.printStackTrace();
               }

     %>
 </select>


      <div align="left" id="state"  class="element">
          <b id="ele_head">Mobile :</b><br/>
          <input type="text" id="mobile" name="mobile" value="<%=mobile%>"
          <%--   <select name="state" id="state" >
          <option value='-1'></option>
          </select> --%>
        </div>
        <div align="left" id="element">&nbsp;
        </div>

      </div>
      </div>
              </td>
              <td width="475px" align="center" colspan="2">
      <div class="col">
      <div align="left" id="element"><b id="ele_head">Designation :</b><br/>
          <input type="text"  id="curr_despln" name="curr_despln" value="<%=userdesig%>"/>

          <%--    <select id="curr_despln" name="curr_despln">
        <option>Select</option>
        <option value="AIA">AIA</option>
        <option value="Director">Director</option>
        <option value="Dy. Director">Dy. Director</option>
        <option value="Asstt. Director Grade-I">Asstt. Director Grade-I</option>
        <option value="Asstt. Director Grade-II">Asstt. Director Grade-II</option>
        <option value="Investigator">Investigator</option>

    </select>  --%>
      </div>


          <div align="left" id="element"><b id="ele_head">Date of Joining ( Current office ):</b><br/>
              <input type="date" id="curr_doj" name="curr_doj" class="curr_doj"/>
      </div>
<div align="left" id="element">&nbsp;
</div>
      </div></td>
        </tr>
      </table><br/>
 <table align="center" width="100%">
        <tr>
              <td colspan="5">
                  <div align="left" id="head">Posting History </div>
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
          <tr>

  <td align="center">
      <select id="ph_ofc_1" name="ph_ofc_1">
  <option value="none">Select</option>
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

 </td>
      <td align="center">
          <select id="ph_desig_1" name="ph_desig_1">
        <option>Select</option>
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
          <select id="ph_mode_1" name="ph_mode_1">
        <option> Select</option>
         <option value="Direct Recruitment">Direct Recruitment</option>
        <option value="Transfer">Transfer</option>
        <option value="Promotion">Promotion</option>

    </select>
      </td>


      <td align="center">
          <input type="date" id="ph_date_frm_1" name="ph_date_frm_1"/>
      </td>
      <td align="center">
          <input type="date" id="ph_date_to_1" name="ph_date_to_1"/>
     </td>

          </tr>
<%--Posting History 2--%>
           <tr>

  <td align="center">
      <select id="ph_ofc_2" name="ph_ofc_2">
  <option value="none">Select</option>
 <%
               //Connection con1=null;
               //ResultSet rs1=null;
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
          <select id="ph_desig_2" name="ph_desig_2">
        <option>Select</option>
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
          <select id="ph_mode_2" name="ph_mode_2">
        <option> Select</option>
         <option value="Direct Recruitment">Direct Recruitment</option>
        <option value="Transfer">Transfer</option>
        <option value="Promotion">Promotion</option>

    </select>
      </td>


      <td align="center">
          <input type="date" id="ph_date_frm_2" name="ph_date_frm_2"/>
      </td>
      <td align="center">
          <input type="date" id="ph_date_to_2" name="ph_date_to_2"/>
     </td>

          </tr>
<%--Posting History 3--%>
          <tr>

  <td align="center">
      <select id="ph_ofc_3" name="ph_ofc_3">
  <option value="none">Select</option>
 <%
            //   Connection con1=null;
            //   ResultSet rs1=null;
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
          <select id="ph_desig_3" name="ph_desig_3">
        <option>Select</option>
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
          <select id="ph_mode_3" name="ph_mode_3">
        <option> Select</option>
         <option value="Direct Recruitment">Direct Recruitment</option>
        <option value="Transfer">Transfer</option>
        <option value="Promotion">Promotion</option>

    </select>
      </td>


      <td align="center">
          <input type="date" id="ph_date_frm_3" name="ph_date_frm_3"/>
      </td>
      <td align="center">
          <input type="date" id="ph_date_to_3" name="ph_date_to_3"/>
     </td>

          </tr>
<%--Posting History 4--%>
          <tr>

  <td align="center">
      <select id="ph_ofc_4" name="ph_ofc_4">
  <option value="none">Select</option>
 <%
           //    Connection con1=null;
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
      <td align="center">
          <select id="ph_desig_4" name="ph_desig_4">
        <option>Select</option>
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
          <select id="ph_mode_4" name="ph_mode_4">
        <option> Select</option>
         <option value="Direct Recruitment">Direct Recruitment</option>
        <option value="Transfer">Transfer</option>
        <option value="Promotion">Promotion</option>

    </select>
      </td>


      <td align="center">
          <input type="date" id="ph_date_frm_4" name="ph_date_frm_4"/>
      </td>
      <td align="center">
          <input type="date" id="ph_date_to_4" name="ph_date_to_4"/>
     </td>

          </tr>
<%--Posting History 5--%>
          <tr>

  <td align="center">
      <select id="ph_ofc_5" name="ph_ofc_5">
  <option value="none">Select</option>
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
      <td align="center">
          <select id="ph_desig_5" name="ph_desig_5">
        <option>Select</option>
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
          <select id="ph_mode_5" name="ph_mode_5">
        <option> Select</option>
         <option value="Direct Recruitment">Direct Recruitment</option>
        <option value="Transfer">Transfer</option>
        <option value="Promotion">Promotion</option>

    </select>
      </td>


      <td align="center">
          <input type="date" id="ph_date_frm_5" name="ph_date_frm_5"/>
      </td>
      <td align="center">
          <input type="date" id="ph_date_to_5" name="ph_date_to_5"/>
     </td>

          </tr>

     <%--    <td id="dynamicInput" colspan="5">


         </td>

           <tr>

               <td colspan="5" align="right">
                  <input type="button" value="Add" onClick="addInput('dynamicInput');">
              </td>
          </tr> --%>

      </table>
        <br>
        <table align="center" width="100%">

        <tr>
              <td colspan="2">
                  <div align="left" id="head">Posting Preferences </div>
              </td>
        </tr>
        <tr>
            <td align="center">
                <b>    1st Option : </b></td>
            <td><select id="pst_pref_1" name="pst_pref_1">
  <option value="none">Select</option>
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
            <td align="center">
                <b>    2nd Option : </b></td>
              <td><select  id="pst_pref_2" name="pst_pref_2">
  <option value="none">Select</option>
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
            <td align="center">
                <b>    3rd Option : </b></td>
              <td><select id="pst_pref_3" name="pst_pref_3">
  <option value="none">Select</option>
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
            <td align="center">
                <b>Any other  :</b>

            </td>
            <td align="left">
                 <textarea cols="107" rows="4" type="text" id="your_spl_pref" name="your_spl_pref" maxlength="800" placeholder="Reason for Preferences."></textarea>
            </td>
        </tr>

        </table> <br/><br/>

 <table align="center" width="100%">

        <tr>
              <td colspan="2">
                  <div align="left" id="head">Yourself  </div>
              </td>
        </tr>
        <tr>
            <td align="center" style="">
                <b> Specialization Area  :</b>

            </td>
            <td align="left">
                 <textarea cols="98" rows="4" type="text"  id="your_spl_area" name="your_spl_area" maxlength="1000"></textarea>
            </td>
        </tr>

 </table>

</fieldset>

 <br/><br/>
<fieldset>

      <legend>Training Details</legend>
      <table align="center" width="100%">
       <tr>
              <td colspan="4">
                  <div align="left" id="head">Training Completed </div>
              </td>
        </tr>
        <tr id="head1">
              <th width="5%">S.No.</th>
              <th  width="39%">Name of Training</th>

              <th  width="28%">From </th>
              <th  width="28%">To </th>
          </tr>
          <tr>
              <td align="center"> <b>1.</b></td>
              <td align="center"> <input type="text" id="tc_train_1" name="tc_train_1" />
              <td align="center"> <input type="date" id="tc_date_frm_1" name="tc_date_frm_1" />
              <td align="center"> <input type="date" id="tc_date_to_1" name="tc_date_to_1" />
          </tr>
          <tr>
              <td align="center"> <b>2.</b></td>
              <td align="center"> <input type="text" id="tc_train_2" name="tc_train_2" />
              <td align="center"> <input type="date" id="tc_date_frm_2" name="tc_date_frm_2" />
              <td align="center"> <input type="date" id="tc_date_to_2" name="tc_date_to_2" />
          </tr>
          <tr>
              <td align="center"> <b>3.</b></td>
              <td align="center"> <input type="text" id="tc_train_3" name="tc_train_3" />
              <td align="center"> <input type="date" id="tc_date_frm_3" name="tc_date_frm_3" />
              <td align="center"> <input type="date" id="tc_date_to_3" name="tc_date_to_3" />
          </tr>
          <tr>
              <td align="center"> <b>4.</b></td>
              <td align="center"> <input type="text" id="tc_train_4" name="tc_train_4" />
              <td align="center"> <input type="date" id="tc_date_frm_4" name="tc_date_frm_4" />
              <td align="center"> <input type="date" id="tc_date_to_4" name="tc_date_to_4" />
          </tr>
          <tr>
              <td align="center"> <b>5.</b></td>
              <td align="center"> <input type="text" id="tc_train_5" name="tc_train_5" />
              <td align="center"> <input type="date" id="tc_date_frm_5" name="tc_date_frm_5" />
              <td align="center"> <input type="date" id="tc_date_to_5" name="tc_date_to_5" />
          </tr>
      </table>
<br/>
      <table align="center" width="100%">
          <tr>
              <td colspan="3">
                  <div align="left" id="head">Training Preferences</div>
              </td>
        </tr>
        <tr id="head1">
              <th width="5%">S.No.</th>
              <th  width="40%">Name of Training</th>
              <th  width="55%">Details</th>
        </tr>
        <tr>
          <td align="center"> <b>1.</b></td>
          <td align="center">  <input type="text" id="tp_name_req_1" name="tp_name_req_1"/></td>
          <td align="center">  <textarea cols="60" rows="2" maxlength="300" id="tp_det_1" name="tp_det_1"></textarea>
 </td>
        </tr>
        <tr>
          <td align="center"> <b>2.</b></td>
          <td align="center">  <input type="text" id="tp_name_req_2" name="tp_name_req_2"/></td>
          <td align="center">  <textarea cols="60" rows="2" maxlength="300" id="tp_det_2" name="tp_det_2"></textarea>
 </td>
        </tr>

        <tr>
          <td align="center"> <b>3.</b></td>
          <td align="center">  <input type="text" id="train_name_req_3" name="train_name_req_3"/></td>
          <td align="center">  <textarea cols="60" rows="2" maxlength="300" id="tp_det_3" name="tp_det_3"></textarea>
 </td>
        </tr>

      </table>
</fieldset>
 </div>
 <br/>
 <br/>
<div align="center">
    <input type="submit" value="Submit">
</div>
 <br/>
 <br/>
 <%
}
 %>
 
   

 
         </div>
 
  <%

  }
else
    {
  %>

  <jsp:forward page="EIS_error.jsp" />
  <%}%>
    </body>
</html>
