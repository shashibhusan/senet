<%-- 
    Document   : EISpensionerForm
    Created on : Jan 30, 2018, 10:20:08 AM
    Author     : Senet
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
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {

    $(".datepicker").datepicker({
        changeMonth: true,
        changeYear: true,
       yearRange: "-68:+42",
       dateFormat: "dd/mm/yy"
  /*     monthNamesShort  : fullmonth_array         */

    });
});

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


              newdiv.innerHTML ="<td id='dynamic7' align='center'><input type='text' id='tcname["+counter1+"]' name='tcname["+counter1 +"]'></td>"+
                  "<td id='dynamic8' align='center'>&nbsp;&nbsp;<input type='text' name='tcfrom["+counter1 +"]' id='tcfrom["+counter1 +"]' class='datepicker' readonly='true' placeholder='dd/mm/yyyy'></td>"+
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
        </script>
        <%
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        String Random=(String)session.getAttribute("Random");
        if(session.getAttribute("Random")==null){
        response.sendRedirect(request.getContextPath() + "/EISplogout.jsp");

}
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="EISpensionerStyle.css">
        <title>Pensioners' Data Base</title>
    </head>
    <%
 
  session.setAttribute("Random", Random);
  String email=(String)session.getAttribute("username");
   System.out.println("User email is=="+email);

String username="";
String user_last_ofc="";
String designation="";
String token="";
int flagCount=0;
int finalSubmit=0;
String dateOfBirth="";


               Connection con12=null;
               ResultSet rs12=null;
               try{
               con12 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt12 = con12.createStatement();
               String sql12="Select * from eisp_register where email='"+email+"'";
               rs12=stmt12.executeQuery(sql12);
               while(rs12.next()){
username=rs12.getString("name");
//user_last_ofc=rs12.getString("curnt_ofc");
token=rs12.getString("token");
dateOfBirth=rs12.getString("dob");
designation=rs12.getString("designation");
System.out.println("User designation is=="+designation);
 }
               con12.close();
 }
               catch(Exception ex){
               ex.printStackTrace();
               }


    %>
    <body>
        <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; " align="center">Government of India, Ministry of MSME </div>
        <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"></font>O/o  DCMSME </div>
        <%--         <div style="font-size: large;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"> <%=user_cur_ofc%></font></div> --%>
       <div style="font-size:14px;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center" ><font color="#990000">ALL INDIA MSME-DO PENSIONERS' DATABASE </font>
         </div>
<%
if(!Random.equals(null))
    {
%>
<h4 align="left">Hello&nbsp; <%=username%> !</h4><h5 align="right"><a HREF="EISplogout.jsp" > <strong>Logout</strong></a></h5>
<table align="center">
       <tr>
           <td align="center">


         <div class="main" align="center"><br/>
       <form name="myform" method="post" action=""  />

       <div align="center" id="first">
        <fieldset>
      <legend>Basic Information</legend>
      <table align="center" width="100%">
          <tr>
              <td width="475px" align="center">
      <div class="col">
          <div align="left" id="element"><b id="ele_head">Name :</b><br/>
              <input type="text" id="bas_name" name="bas_name" class="bas_name" value="<%=username%>" disabled="disable"/>
      </div>
          <div align="left" id="element"><b id="ele_head">E-mail :</b><br/>
          <input type="text" id="email" name="email" class="email" value="<%=email%>" disabled="disable"/>
      </div>
      <div align="left" id="element"><b id="ele_head">Discipline :</b><br/>
       <select id="bas_descipline" name="bas_descipline">

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


                                   </select>
      </div>
     <div align="left" id="element"><b id="ele_head">Date of joining - Govt. Service  :</b><br/>
              <input type="text" id="doj_gov" name="doj_gov" class="datepicker" placeholder="dd/mm/yyyy" readonly='true' value=""/>
      </div>
          <div align="left" id="element"><b id="ele_head">Date of joining - MSME-DO  :</b><br/>
              <input type="text" id="doj_msme" name="doj_msme" class="datepicker" placeholder="dd/mm/yyyy" readonly='true' value=""/>
      </div>
           <div align="left" id="element"><b id="ele_head">Date of Retirement :</b><br/>
               <input type="text" id="dat_ret" name="dat_ret" class="datepicker" value="" placeholder="dd/mm/yyyy"/>
      </div>
       <div align="left" id="element"><b id="ele_head">Last Pay Level :</b><br/>
              <select id="CrPayLevel" name="CrPayLevel" class="CrPayLevel">

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
       

      </div></td>
      <td width="475px" align="center">
      <div class="col">
       <div align="left" id="element"><b id="ele_head">Designation :</b><br/>
          <input type="text" id="designation" name="designation" value="<%=designation%>" disabled="disable"/>

      </div>

          <div align="left" id="element"><b id="ele_head">Date of Birth :</b><br/>
              <input type="text" id="dob" name="dob" class="datepicker" placeholder="dd/mm/yyyy" readonly='true' value="<%=dateOfBirth%>" disabled="disable"/>
      </div>
          
      <div align="left" id="element"><b id="ele_head">Total Pension ( as on date ) :</b><br/>
          <input type="text" name="totalPension" id="totalPension"/>
      </div>
      <div align="left" id="element"><b id="ele_head">Reference for location if re-engaged in any capacity <br>( Only DIs/TCs are located ) :</b><br/>
              <select id="Category" name="Category" class="Category">

              <option value="">Select</option>
              <option value="SC">SC</option>
              <option value="ST">ST</option>
              <option value="Others">Others</option>


          </select>
      </div>
          <div align="left" id="element"><b id="ele_head">Present Address ( Name Of city/town/village/state/district) :</b><br/>
           <textarea cols="35" rows="8" type="text" id="aptPrPost" name="aptPrPost" maxlength="150" class="datepicker" value=""></textarea>
      </div>

      </div></td>
        </tr>

      </table>
</fieldset>
                 <br/>
    </div>
              <div align="center" id="first">
 
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
                   <option>Select</option>

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
      <div align="left" id="element"><b id="ele_head">Area of Specialisation in The Trade :</b><br/>
          <textarea type="text" cols="56" rows="2" maxlength="150" placeholder="max 150 char." id="splTrade" name="splTrade"></textarea>

      </div>
      <div align="left" id="element"><b id="ele_head">Specialisation in any other field :</b><br/>
              <textarea type="text" cols="56" rows="2" maxlength="150" placeholder="max 150 char." id="splOTrade" name="splOTrade"></textarea>
      </div>




      </div>
              </td>


      <td width="475px" align="center">
      <div class="col">
      <div align="left" id="element"><b id="ele_head">Physical Fitness Status :</b><br/>
          <input type="text" id="phyFit" name="phyFit" class="phyFit" value=""/>
      </div>
          <div align="left" id="element"><b id="ele_head">Qualification :</b><br/>
              <textarea type="text" cols="56" rows="2" id="qualification" maxlength="350" placeholder="max 350 char." name="qualification"></textarea>
      </div>


          <div align="left" id="element"><b id="ele_head">Hobbies :</b><br/>
              <textarea type="text" cols="56" rows="2" maxlength="150" placeholder="max 150 char." id="hobbies" name="hobbies"></textarea>
      </div>


      </div></td>
        </tr>

      </table><br/>
      <table align="center" width="100%">
       <tr>
              <td colspan="3">
                  <div align="left" id="headT">Training Completed </div>
              </td>
        </tr>
        <tr id="head1">
             
              <th  width="60%">Name of Training & Institution</th>
              <th  width="20%">From </th>
              <th  width="20%">To </th>
          </tr>

           <%
           String date3="";
           String date4="";
           Connection con1=null;
           ResultSet rs1=null;
            try{
               con1 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt1 = con1.createStatement();
               String sql="select * from eis_trainingcompleted where email="+email;
               rs1=stmt1.executeQuery(sql);
               while(rs1.next()){
     date3=rs1.getString("tcFrom");
     date4=rs1.getString("tcTo");
    
                   %>
       <tr>
           <td align="center">&nbsp;</td>
           <td align="center"><input type="text" value="<%=rs1.getString("trainingName")%>"/></td>
           <td align="center"><input type="text" value="<%=date3%>"/></td>
           <td align="center"><input type="text" value="<%=date4%>"/></td>
       </tr>

           <%
               }
               con1.close();
               }
               catch(Exception ex){
               ex.printStackTrace();
               }
           %>
           <tr>
              
              <td align="center"> <input type="text" id="tcname[1]" name="tcname[1]" />
              <td align="center"> <input type="text" id="tcfrom[1]" name="tcfrom[1]" class="datepicker" placeholder="dd/mm/yyyy" readonly='true'/>
              <td align="center"> <input type="text" id="tcto[1]" name="tcto[1]" class="datepicker" placeholder="dd/mm/yyyy" readonly='true'/>
          </tr>

         
<td id="dynamicInputTc" colspan="3">
</td>


           <tr>

               <td colspan="3" align="right">
                  <input type="button" value="Add" onClick="addInputTc('dynamicInputTc');">
              </td>
          </tr>

      </table>
<br/>
      
</fieldset>

    </div>
 <br/>
 <br/>
 <p class="warn"> Warning : No edit option is available after final submission.</p>

<div align="center">
    <table width="50%" align="center">
        <tr>
            <td align="right" style="margin-right: 2px;"><input type="submit" onclick="return myFunction();" value="Save as Draft"></td>
            <td align="left" style="margin-left: 2px;"><input type="submit" name="action" onclick="confirm('There is no edit option once you final submit. Are you sure you want to continue.');return saveEis();" value="Final Submit"></td>
        </tr>
    </table>

</div><br/><br/>
         </div>
       </table>
           <%
           }
   else{
           %>
         <jsp:forward page="EIS_perror.jsp" />

<%
}
%>
    </body>
</html>
