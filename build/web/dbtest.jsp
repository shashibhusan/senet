<%-- 
    Document   : dbtest
    Created on : Mar 13, 2018, 5:17:48 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="common.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function myFunction()
            {
               var email=document.myForm.email.value;
               var ofcname=document.myForm.ofcname.value;
               var mode=document.myForm.mode.value;
               var from=document.myForm.from.value;
               var to=document.myForm.to.value;

               if(!email=='' && !ofcname=='' && !mode=='' && !from=='' && !to=='')
                   {
                      window.location="aa_submitdata.jsp";
                   }else
                       {
                           alert("Please enter the data");
                       }

            }
         
        </script>
    </head>
    <body><br><br>
        <center>
            <form name="myForm" id="myForm" method="POST" action="aa1_submit.jsp" onsubmit="">
           
            <table>
                <tr>
                    <th>Email</th>
                    <th>Office Name</th>
                    <th>Mode</th>
                    <th>From</th>
                    <th>To</th>
                </tr>
                <tr>
                    <td><input type="text" name="email" id="email"/></td>
                    <td><input type="text" name="ofcname" id="ofcname"/></td>
                    <td><input type="text" name="mode" id="mode"/></td>
                    <td><input type="date" name="from" id="from"/></td>
                    <td><input type="date" name="to" id="to"/></td>
                </tr>
                <tr>
                    <td colspan="5" align="right">
                        <input type="submit" value="Submit"/>
                    </td>
                </tr>

            </table>
            </form>
           
        </center>
    </body>
</html>
