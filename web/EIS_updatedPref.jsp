<%-- 
    Document   : EIS_updatedPref
    Created on : 8 Feb, 2019, 12:50:55 PM
    Author     : Senet
--%>

<%@page language="java" import="java.sql.*,common.*" errorPage="" %>
<%@include file="EIS_menu_header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Updated List</title>
        <style>
              #mainDiv
            {
                width: 1250px;
                border: 1px #e2e2e2 solid;
                align:center;
                margin: auto;
                
            }            
            
#dataIn:hover{
    background-color:  #d7e4bf ;
}

#head
{
    
    background:  #dadada ;
    padding: 8px;
    font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
}
#color:hover
{
    background:  #e9e8e8;
}
#data{
   padding: 4px 0px 4px 2px;;
   border: 1px  #cacaca  solid;
   border-collapse: collapse;
   font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
}
#url-table
{
   width: 1050px;
   margin: auto;
   align:center;
   border: 1px  #cacaca  solid;
   min-height: 72vh;
   background-color: #ffffff;
}
table th tr td {border-collapse: collapse;}

        </style>
    </head>
    <%
        String Session=(String)session.getAttribute("Session");
        
       if(!Session.equals(null))
            {
    %>
    <body bgcolor="#ccc">
         <div id="url-table" align="center">
 <br/>           
            <table id="myTable" align="center">
               
                <tr id="head">
                    <td id="head">Sno.</td>
                    <td id="head">Name</td>
                    <td id="head">Designation</td>
                    <td id="head">Current Office</td>
                    <td id="head">1st Preference</td>
                    <td id="head">2nd Preference</td>
                    <td id="head">3rd Preference</td>
                </tr>
                <%
                int i=0;
                Connection con = null;
                ResultSet rs = null;
                Statement st = null;
                
                try
                {
                    con = ConnectionManager.getConnectionDirectForMySQL();
                    st = con.createStatement();
                    String Query = "select * from eis_postinginfo_new order by sno desc";
                    rs = st.executeQuery(Query);
                    while(rs.next())
                    {
                        i=i+1;
                        %>
                        <tr id="color">
                            <td id='data' align="center"><%=i%>.</td>
                            <td id='data'><%=rs.getString("name")%></td>
                            <td id='data'><%=rs.getString("designation")%></td>
                            <td id='data'><%=rs.getString("curr_ofc")%></td>
                            <td id='data'><%=rs.getString("pref_one")%></td>
                            <td id='data'><%=rs.getString("pref_two")%></td>
                            <td id='data'><%=rs.getString("pref_three")%></td>
                        </tr>
                        <%
                    }
                    con.close();
                    rs.close();
                }
                catch(Exception err)
                {
                    err.printStackTrace();
                }
                %>
            </table>
            <br/>
            <br/>
        </div>
    </body>
    <%
            }else
       {
           %>
           <jsp:forward page="EIS_adError.jsp" />
           <%
       }
    %>
</html>
