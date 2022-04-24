<%-- 
    Document   : view_response
    Created on : Jun 19, 2018, 11:26:38 AM
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
        <title>MSME Feedback</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="shortcut icon" href="fevicon.png" type="image/x-icon">
        <style>
            b,.head{
                padding: 5px;
}
.dy{
    padding-left: 10px;
    padding: 3px;
}
body{
                font-family: Verdana, Geneva, sans-serif;
}
a:visited
{
    color: blue;
}
        </style>
        <script>
            var request;
            function submitResponse()
            {
             
              var adEmail=document.getElementById('adEmail').value;
              var userEmail=document.getElementById('userEmail').value;
             // alert(adEmail);
              var ref_num=document.getElementById('ref_num').value;;
              var url="";
              var response=document.getElementById('adminResponse').value;
              var issue_related=document.getElementById('issue_related').value;

              url="submitResponse.jsp?val="+userEmail+"&val1="+response+"&val2="+ref_num+"&val3="+adEmail+"&val4="+issue_related;
if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=getInfo;
request.open("POST",url,true);
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
document.getElementById('done').innerHTML=val;
}
            }
            </script>
    </head>
    <%
       
       String email=request.getParameter("xQj45yldf9UkikczXbGh");
       String department=request.getParameter("c");
       String admail=(String)session.getAttribute("admail");
    String Session=(String)session.getAttribute("Session");
    String admin_name=(String)session.getAttribute("adname");
       %>
    <body>
        <div style="font-size: 14px;font-family:Verdana; font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; " align="center">Government of India, Ministry of MSME </div>
        <div style="font-size: 14px;font-family:Verdana; font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"></font>O/o  DC-MSME </div>
        <div style="font-size: 14px;font-family:Verdana; font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; "align="center" ><font color="#990000">MSME RELATED ISSUE </font>
         </div>
<br/><br/>

<%
if(!Session.equals(null))
            {
%>

<h2 align="center"> Submit Response </h2>
<input type="hidden" value="<%=admail%>" id="adEmail" class="adEmail">
<input type="hidden" value="<%=email%>" id="userEmail" class="userEmail">

<table align="center" width="730px;" style=" padding-bottom: 7px;">
    <tr>
        <td align="left"><a href="create_response.jsp">Home</a></td>
        <td align="right"><a href="logout.jsp">logout</a></td>
    </tr>
</table>
           <%
           Connection con=null;
           ResultSet rs=null;
           Statement st=null;
           String name="";
           String uam="";
           String belongsTo="";
           String submitdate="";
           String ref_num="";
           String issue_related="";
           try{
               con=ConnectionManager.getConnectionDirectForMySQL();
               st=con.createStatement();
               String sql="select * from  msme_feedback_basic a join msme_issue_data_new b on a.email=b.email and b.msme_related_issue='"+department+"' and a.email='"+email+"' group by a.email";
               rs=st.executeQuery(sql);
               while(rs.next())
                   {
                   name=rs.getString("a.name");
                   uam=rs.getString("a.uam");
                   belongsTo=rs.getString("category");
                   submitdate=rs.getString("submit_date");
                   ref_num=rs.getString("ref_num");
                   issue_related=rs.getString("b.msme_related_issue");
               }
               con.close();
               }
           catch(Exception err){
               err.printStackTrace();
               }
submitdate=submitdate.substring(0, 11);
           %>
           <table align="center" width="700px;" border="1">
           <input type="hidden" value="<%=ref_num%>" id="ref_num" class="ref_num">
           <input type="hidden" value="<%=issue_related%>" id="issue_related" class="issue_related">
           <tr><td class="head"><b>Name : </b> <%=name%></td></tr>
            <tr><td class="head"><b>Email : </b><%=email%></td></tr>
               <tr>  <td class="head"><b>UAM : </b><%=uam%></td></tr>
               <tr>  <td class="head"><b>Feedback/Issue Submit Date : </b><%=submitdate%></td></tr>
               <tr>  <td class="head"><b>User belongs to : </b><%=belongsTo%></td></tr>
               <tr>  <td class="head"><b>Ref. No. : </b><%=ref_num%></td></tr>

           </table>
               <h3 align="center">Feedback / Suggestions :</h3>
               <table align="center" width="700px;" border="1">
                   <tr>
                       <th>Category</th>
                       <th>Issues / Feedback</th>
                   </tr>
                   <%
                   int count=1;
                   try{
               con=ConnectionManager.getConnectionDirectForMySQL();
               st=con.createStatement();
               String sql="select * from  msme_feedback_basic a join msme_issue_data_new b on a.email=b.email and b.msme_related_issue='"+department+"' and a.email='"+email+"' group by b.sugg" ;
               rs=st.executeQuery(sql);
               while(rs.next())
                   {
                   count=count+1;
                   }
               con.close();
               }
                   catch(Exception error)
                           {
                       error.printStackTrace();
                       }
                 
                   %>
                   <tr>
                       <td class="dy" rowspan="<%=count%>"><%=department%></td>
                       
                   </tr>
                       <%

                   try{
               con=ConnectionManager.getConnectionDirectForMySQL();
               st=con.createStatement();
               String sql="select * from  msme_feedback_basic a join msme_issue_data_new b on a.email=b.email and b.msme_related_issue='"+department+"' and a.email='"+email+"' group by b.sugg order by b.sno";
               rs=st.executeQuery(sql);
               while(rs.next())
                   {
                 %>
                   <tr>
                       <td class="dy"><%=rs.getString("b.sugg")%></td>
                   </tr>
                 <%
                   }
               con.close();
               }
                   catch(Exception error)
                           {
                       error.printStackTrace();
                       }
                   %>
                 
               </table>
<%
String submitCheck="no";
String response_data="";
String admin="";
try{
               con=ConnectionManager.getConnectionDirectForMySQL();
               st=con.createStatement();
               String sql1="select * from msme_response_data a join msme_feedback_user b on a.response_submit_by=b.username where userEmail='"+email+"' and response_submit_by='"+admail+"' and issue_related_to='"+department+"'";
               rs=st.executeQuery(sql1);
               while(rs.next())
                   {
                   submitCheck="yes";
                   response_data=rs.getString("reply_data");
                   admin=rs.getString("b.name");
                   }
               con.close();
               }
catch(Exception err1){
    err1.printStackTrace();
    }

%>
                   <h2 align="center">Your Response </h2>
                   <%
                   if(submitCheck.equals("no"))
                       {
                   %>
                   <table  align="center" width="700px;" border="1">
                       <tr>
                           <td style="padding: 5px;">Response :</td>
                       </tr>
                       
                       <tr>
                           <td align="center">
                               <textarea cols="83" rows="4" id="adminResponse" name="adminResponse" maxlength="500" placeholder="Max 100 Words"></textarea>
                           </td>
                       </tr>
                       <tr>
                           <td id="done"></td>
                       </tr>

                       <tr>
                         <span style="display: block">
                           <td align="right" style="padding: 5px;">
                               <input type="button" value="Submit" onclick="return submitResponse();">

                           </td>
                         </span>
                       </tr>
                      
                   </table>
                   <%
                   }else
                       {
                   %>

                   <table  align="center" width="700px;" >
                       <tr>
                           <td>
                               <span>
                                   <b> <%=admin%> &nbsp;: </b> &nbsp;<%=response_data%>
                               </span>
                           </td>
                       </tr>
                   </table>



                   <%
                   }
}else
            {
        %>
          <jsp:forward page="error.jsp" />
        <%
        }

        %>
    </body>
</html>
