<%-- 
    Document   : dateFormate
    Created on : Jan 15, 2018, 1:44:12 PM
    Author     : Senet
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
        <title>JSP Page</title>
    </head>
    <body>
        <script>

    var counter = 2;
    var limit = 10;
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
                  <option value=''>Select</option>\n\
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
<option value='HTTDC-Nagpur'>HTTDC-Nagpur</option>\n\
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
</select></td>&nbsp;" +
                  "<td align='center' id='dynamic2'><select id='desig["+counter+"]' name='desig["+counter +"]'>\n\
                   <option value=''>Select</option>\n\
                   <option value='AIA'>AIA</option>\n\
                   <option value='Director'>Director</option>\n\
                   <option value='Dy. Director'>Dy. Director</option>\n\
                   <option value='Asstt. Director Grade-I'>Asstt. Director Grade-I</option>\n\
                   <option value='Asstt. Director Grade-II'>Asstt. Director Grade-II</option>\n\
                   <option value='Investigator'>Investigator</option>\n\
                   </select></td>"+
                  "<td id='dynamic3' align='center'><select id='mode["+counter+"]' name='mode["+counter +"]'>\n\
                   <option value=''>Select</option>\n\
                   <option value='Direct Recruitment'>Direct Recruitment</option>\n\
                   <option value='Transfer'>Transfer</option>\n\
                   <option value='Promotion'>Promotion</option>\n\
                   </select></td>"+
                  "<td id='dynamic4' align='center'><input type='date' name='frm["+counter +"]' id='frm["+counter +"]'></td>"+
                  "<td id='dynamic5' align='center'><input type='date' name='to["+counter +"]' id='to["+counter +"]'></td>";


              document.getElementById(divName).appendChild(newdiv);


              counter++;
                 }
         }
    }


  var counter1 = 2;

    var limit1 = 10;

    function addInputTc(divName){
        

         if (counter1 == limit1)  {

              alert("You have reached the limit of adding " + counter1 + " inputs");

         }

         else {
             
             var name = document.getElementById("tcname["+(counter1-1)+"]").value;
             var date1 = document.getElementById("tcfrom["+(counter1-1)+"]").value;
             var date2 = document.getElementById("tcto["+(counter1-1)+"]").value;
             if (name=="" || name==null){
                alert("Please enter name.");
                    return false;
             }
          else if (date1=="" || date1==null){
                alert("Please enter date1.");
                    return false;
             }
            else if (date2=="" || date2==null){
                alert("Please enter date2.");
                    return false;
             }
else
    {
              var newdiv = document.createElement('tr');


              newdiv.innerHTML = "<td align='center' id='dynamic6'>&nbsp;&nbsp;&nbsp;<b></b></td>"+
                  "<td id='dynamic7' align='center'>&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' id='tcname["+counter1+"]' name='tcname["+counter1 +"]'></td>"+
                  "<td id='dynamic8' align='center'>&nbsp;&nbsp;&nbsp;&nbsp;<input type='date' name='tcfrom["+counter1 +"]' id='tcfrom["+counter1 +"]'></td>"+
                  "<td id='dynamic9' align='center'>&nbsp;&nbsp;<input type='date' name='tcto["+counter1 +"]' id='tcto["+counter1 +"]'></td>";


              document.getElementById(divName).appendChild(newdiv);


              counter1++;
    }
         }
    }
        </script>
     <table>

     <%--          <% String email="rgvjee@gmail.com";
               Connection con1=null;
               ResultSet rs1=null;
               String date1="", date2="",dd="",mm="",yy="";
               int ph=1;
                try{
               con1 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt1 = con1.createStatement();
               String sql="select * from eis_posthistory where email='"+email+"'";
               rs1=stmt1.executeQuery(sql);
               while(rs1.next()){
                   if(!(rs1.getString("officeName")).equals("") && !(rs1.getString("officeName")).equals(null))
                       {

     date1=rs1.getString("from");
     dd=date1.substring(8, 10);
     mm=date1.substring(5, 7);
     yy=date1.substring(0, 4);
     System.out.println("Date is=="+dd+"/"+mm+"/"+yy);
     %>
     <tr>
     <td align="center"><input type="text"  value="<%=rs1.getString("officeName")%>"/></td>
     <td align="center"><input type="text"  value="<%=rs1.getString("designation")%>"/></td>
     <td align="center"><input type="text"  value="<%=rs1.getString("mode")%>"/></td>
     <td align="center"><input type="text"  value="<%=dd%>/<%=mm%>/<%=yy%>"/></td>
     <td align="center"><input type="text"  value="<%=rs1.getString("to")%>"/></td>
     </tr>
     <%
     }
     }
               con1.close();
               }
                catch(Exception ex){
                    ex.printStackTrace();
                    }
     %>

     <tr>


        </table>--%>
    


           <tr>

  <td align="center">
      <select name="name[1]" id="name[1]">
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
          <input type="date" id="frm[1]" name="frm[1]"/>
      </td>
      <td align="center">
          <input type="date" id="to[1]" name="to[1]"/>
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

    </body>
</html>
