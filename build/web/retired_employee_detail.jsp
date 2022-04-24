<%-- 
    Document   : retired_employee_detail
    Created on : 3 Dec, 2019, 5:26:40 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="EIS_menu_header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@page import="java.sql.*,common.*" %>
        <title>Retired Details</title>
         <style>
            #mainDiv
            {
                width: 1150px;
                margin: auto;
                background-color:  #f7f7f7 ;
                border: 1px  #cacaca  solid;
                font: normal normal Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            #head
            {
                font: normal normal 15px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 8px;
                background-color: #e4e4e4;
                width: 69%;
                text-align: left;
            }
            #head1
            {
                font: normal normal 15px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 8px;
                background-color:  #d8d8d8 ;
            }
           table tr td
            {
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 5px;
            }
            #mytable{
                width: 59%;
                border: 1px #cacaca solid;
            }
            #data{
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 5px;
            }
            #data1
            {
                width: 29%;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 2px;
            }
            #sno{
                width: 9%;
            }
 
#url-table
{
   width: 1050px;
   margin: auto;
   align:center;
   border: 1px  #cacaca  solid;
   background-color: #ffffff;
   min-height: 72vh;
}
a:visited
{
    color: blue ;
}
#header
        {
            padding: 8px 3px 6px 8px;
            font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
            background-color:  #e1e1e1 ;
        }
        a
        {
            text-decoration: none;
        }
a:hover {
   cursor: url;
   text-decoration: underline;
}
#tr-data:nth-child(odd)
{
    background-color: #f5f5f5;
}
#td-head
{
    width: 50%;
}
#tr-data:hover
{
    background-color:  #f3f2ff ;
}
.li-ele
{
    text-align: left;
    font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
}
        </style>
    </head>
    <%
        String Session=(String)session.getAttribute("Session");
        String username=(String)session.getAttribute("username");
        session.setAttribute("username",username);
        session.setAttribute("Session",Session);
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        System.out.println("session value is="+Session);
       
        if(!Session.equals(null))
            {
        %>
    <body bgcolor="#ccc">
        <div id="url-table" align="center">
          
                      <%
                          String token=request.getParameter("0xZc-OzUv-Qxfy");
                          
                          System.out.println("we have recieved token===="+token);
                          
                          Connection con=null;
                          PreparedStatement psmt=null;
                          ResultSet rs=null;
                          Statement st= null;
                          
                          String query="call v_retired_employee_details(?)";
                          
                          try
                          {
                          con=ConnectionManager.getConnectionDirectForMySQL();
                          psmt=(PreparedStatement) con.prepareCall(query);
                          psmt.setString(1, token);
                          
                          
                          }
                          catch(Exception err)
                          {
                              err.printStackTrace();
                          }
                          
                         
                      %>
                      <div>
                          
                          <%
                          rs=psmt.executeQuery();
                          while(rs.next())
                          {
                              System.out.println("Name of employee==="+rs.getString("name"));
                          %>
                          <h3 align="center" id="head">Details of <b><%=rs.getString("name")%> </b>:</h3> 
                          <table id="mytable">
                              <tr id="tr-data">
                                  <td id="td-head">Name</td>  
                                  <td id="td-data">:&nbsp;<%=rs.getString("name")%></td>  
                              </tr>
                          <tr id="tr-data">
                              <td id="td-head">Email</td>  
                              <td>:&nbsp;<%=rs.getString("email")%></td>  
                          </tr>
                          <tr id="tr-data">
                              <td>Designation</td>  
                              <td>:&nbsp;<%=rs.getString("designation")%></td>  
                          </tr>
                          <tr id="tr-data">
                              <td>Discipline</td>  
                              <td>:&nbsp;<%=rs.getString("discipline")%></td>  
                          </tr>
                          <tr id="tr-data">
                              <td>Date Joining ( Govt. )</td>  
                              <td>:&nbsp;<%=rs.getString("dojgov")%></td>  
                          </tr>
                          <tr id="tr-data">
                              <td>Date Of Retirement</td>  
                              <td >:&nbsp;<%=rs.getString("dor")%></td>  
                          </tr>
                          <tr id="tr-data">
                              <td>Pay Level</td>  
                              <td>:&nbsp;<%=rs.getString("crpaylevel")%></td>  
                          </tr>
                          <tr id="tr-data">
                              <td>Qualification</td>  
                              <td>:&nbsp;<%=rs.getString("qualification")%></td>  
                          </tr>
                          <tr id="tr-data">
                              <td>Area of Specialisation in The Trade</td>  
                              <td>:&nbsp;<%=rs.getString("splintrade")%></td>  
                          </tr>
                          <tr id="tr-data">
                              <td>Specialisation in any other field</td>  
                              <td>:&nbsp;<%=rs.getString("splinothtrade")%></td>  
                          </tr>
                          <tr id="tr-data">
                              <td>Physical Fitness Status</td>  
                              <td>:&nbsp;<%=rs.getString("fitness")%></td>  
                          </tr>
                      </table>
                      
                      <%
                          }
                      %>
                      <br/><br/>
                      </div>
                      
                      
        </div>
    </body>
    <%
            }else
                {
            %>
            <jsp:forward page="EIS_adError.jsp" />
            <%}%>
</html>
