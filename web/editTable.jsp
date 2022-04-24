<%-- 
    Document   : editTable
    Created on : Jan 30, 2018, 11:21:44 AM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>  
            div.ui-datepicker
            {
       width: 255px;
    font-size:14px;
    padding: 0px 0px;
    margin: 0px 0px;
    display: inline-block;
    border-radius: 0px;
   
   }
        </style>
        
    </head>
    <body>
         <%
        String email="rgvjee@gmail.com";
         Connection con1=null;
         ResultSet rs1=null;
        %>
        <form action="editTableSubmit.jsp" method="post" name="myForm"/>
        <table align="center" width="70%">
        <tr>
              <td colspan="5">
                  <div align="left" id="head">Posting History  &nbsp;<a style=" color: #FFC300">( Excluding Current Posting )</a></div>
              </td>
          </tr>
          <tr id="head1">
              <th>Name of Office</th>
              <th>Designation</th>
              <th>Mode </th>
              <th>From </th>
              <th>To </th>
          </tr>
     <%--Posting History 1--%>
     <%
               
int ii=1;
              
                try{
               con1 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt1 = con1.createStatement();
               String sql="select * from eis_posthistory where email='"+email+"'";
               rs1=stmt1.executeQuery(sql);
               while(rs1.next()){

                       String date1="", date2="";

     date1=rs1.getString("from");
     date2=rs1.getString("to");
     %>
     <tr>
     <td align="center"><input type="text" name="name[<%=ii%>]" id="name[<%=ii%>]"  value="<%=rs1.getString("officeName")%>"/></td>
     <td align="center"><input type="text" name="deg[<%=ii%>]" id="deg[<%=ii%>]"  value="<%=rs1.getString("designation")%>"/></td>
     <td align="center"><input type="text" name="md[<%=ii%>]" id="md[<%=ii%>]" value="<%=rs1.getString("mode")%>"/></td>
     <td align="center"><input type="text" name="fromn[<%=ii%>]" id="fromn[<%=ii%>]" value="<%=date1%>"/></td>
     <td align="center"><input type="text" name="too[<%=ii%>]" id="too[<%=ii%>]" value="<%=date2%>"/></td>
     </tr>
     <%
ii=ii+1;
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
           <td colspan="5" align="center">
               <input type="submit" value="submit">
              </td>
          </tr>

      </table>
    </body>
</html>
