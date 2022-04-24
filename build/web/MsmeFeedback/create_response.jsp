<%-- 
    Document   : create_response
    Created on : Jun 18, 2018, 5:35:05 PM
    Author     : Senet
--%>

<%@page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.UUID" %>
<%@page import="java.util.Random" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.*,java.sql.*,java.util.zip.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
        <style>
            body{
                font-family: Verdana, Geneva, sans-serif;
}
td{
    font-size: 14px;
    padding: 3px;
}
#data:hover{
    background-color:  #d8d4d4 ;
}
.data
{
    padding-left: 10px;
}
a:visited{
    color: blue;
}
        </style>
    </head>
    
    <body>
        <div style="font-size: 14px;font-family:Verdana; font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; " align="center">Government of India, Ministry of MSME </div>
        <div style="font-size: 14px;font-family:Verdana; font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"></font>O/o  DC-MSME </div>
        <div style="font-size: 14px;font-family:Verdana; font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center" ><font color="#990000">MSME RELATED ISSUE </font>
         </div>
        <%
    String aduser=(String)session.getAttribute("username");
    String Session=(String)session.getAttribute("Session");
    System.out.println("Session Value is: "+Session);
    session.setAttribute("Session",Session);
    session.setAttribute("admail",aduser);
    String department="";
    if(aduser.equals("raghav@gmail.com"))
        {
        department="Art-based Enterprise";
        }

   if(!Session.equals(null))
            {
       System.out.println("Session value is ="+Session);
    %>
        <h2 align="center">List of Feedback / Suggestions</h2>
        <h3 align="center"> Related to : <%=department%></h3>
        <table align="center" width="1100px;">
            <tr>
                <%
                Connection con=null;
        ResultSet res=null;
        Statement stm=null;
        String name="";
        try{
            con=ConnectionManager.getConnectionDirectForMySQL();
            stm=con.createStatement();
            String Query="select * from msme_feedback_user where username='"+aduser+"'";
            res=stm.executeQuery(Query);
            while(res.next())
                {
                name=res.getString("name");
                }
            }
        catch(Exception err){
            err.printStackTrace();
            }
        session.setAttribute("adname",name);
                %>
                <td style="padding-bottom: 8px; font-size: 17px;">Hello <a style="padding-bottom: 8px; font-size: 17px; color: green;">
                  <%=name%> !</a>
                </td>
                <td align="right"><a href="logout.jsp">logout</a></td>
            </tr>
        </table>
        <table align="center" width="1100px;" border="1">
            <tr>
                <th width="50px;">S.no.</th>
                <th width="250px">Name</th>
                <th>Email</th>
                <th>User belongs to</th>
                <th>Reference No.</th>
              <%--  <th>Response</th>--%>
                
            </tr>

        <%




        int i=0;
        try{
            con=ConnectionManager.getConnectionDirectForMySQL();
            stm=con.createStatement();
            String sql="select * from  msme_feedback_basic a join msme_issue_data_new b on a.email=b.email and b.msme_related_issue='"+department+"' group by b.email order by a.submit_date desc";
            res=stm.executeQuery(sql);
            while(res.next())
            {
                i=i+1;
                %>
                <tr id="data">
                    <td class="data"><%=i%>.</td>
                    <td class="data"> <a href="view_response.jsp?xQj45yldf9UkikczXbGh=<%=res.getString("a.email")%>&c=<%=department%>"><%=res.getString("a.name")%></a></td>
                    <td class="data"><%=res.getString("a.email")%></td>
                    <td class="data"><%=res.getString("a.category")%></td>
                    <td class="data"><%=res.getString("a.ref_num")%></td>
                    
        </tr>
                <%

                }
            con.close();
        }
        catch(Exception err){
            err.printStackTrace();
            }
        }else
            {
        %>
          <jsp:forward page="error.jsp" />
        <%
        }
        
        %>

        </table>
    </body>
</html>
