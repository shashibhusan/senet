<%-- 
    Document   : EIS_adfSubmit
    Created on : Feb 27, 2018, 2:19:26 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Success</title>
        <link rel="shortcut icon" href="fevicon.png" type="image/x-icon">
        <style>
            body {font-family:Arial, Helvetica, sans-serif;}
            .box {
                width: 100%;
                height: 225px;
                background:  #f1f5f1 ;
                color:  #199f19 ;
                border: 4px red solid;
                border-style: double;

}
.success {
    font-size: 19px;
    font-weight: normal;
    color: red;
    font-family: sans-serif;
}
.menu1 {
    width: 100%;
    height: 80px;
    background:  #175fd6  ;
    color: white;
    padding-top: 8px;
}
      </style>
       <script>
            function myFunction(){
                 document.forms[0].action = "EISadlogout.jsp"
                 return true;
            }
            function returnHome(){
                 document.forms[0].action = "EIS_ediForms.jsp"
                 return true;
            }
        </script>

    </head>
    <body>
        <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; " align="center">Government of India, Ministry of MSME </div>
        <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"></font>O/o  DCMSME </div>
        <%--         <div style="font-size: large;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"> <%=user_cur_ofc%></font></div> --%>
       <div style="font-size:14px;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center" ><font color="#990000">ALL INDIA MSME-DO EMPLOYEE'S INFORMATION SYSTEM </font>
         </div>
<%
       String Crosssite=(String)session.getAttribute("nmm");
   if (!Crosssite.equals(null))
    {
       %>
        <div align="center" title="Reciept" class="box">
        <form method="post" action="" onsubmit="">
            <table><br/><br/>
                <%
               String name=(String)session.getAttribute("name");
             //  String name="Raghav";
                %>
<tr>
        <td class="success">
           Hello <%=name%> !
        </td>
    </tr>
            <tr>
                <td class="success"><br/> Something is going wrong. Please try again or contact to Administrator. </td>
            </tr>



             <tr>
            <td align="center" class="success"><br/>
                <input type="submit"  value="Go Back" onclick="returnHome();">
                <input type="submit" value="logout" onclick="myFunction();">
            </td>
        </tr>
        </table>
       </form>
        </div>
         <%
        }
         else
        {
    %>
    <jsp:forward page="EIS_adError.jsp" />

    <%}%>
    </body>
</html>

