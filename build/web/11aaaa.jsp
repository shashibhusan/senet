<%-- 
    Document   : 11aaaa
    Created on : Apr 13, 2018, 2:43:15 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <center>
            <form name="myForm"  action="11111test.jsp" method="post">
                <table>
                    <thead>Select File</thead>
                    
                    <tr>
                        <td> 
                            <img src="Cap_Img.jsp" alt=""/>
                            <a href="JavaScript:window.location.href=window.location.href"><img src="images/refresh.png" style="border:none" width="20" height="25"/></a></td>
                                                                      <td width="20%">
                                                                          <input type="text" name="captcha" id="captcha"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2">
                            <input type="file" name="upload" id="upload"/>
                            <input type="submit" value="OK"/>
                        </td>
                    </tr>


                </table>
            </form>
        </center>
    </body>
</html>
