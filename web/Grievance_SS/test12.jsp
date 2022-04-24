<%-- 
    Document   : test12
    Created on : Nov 28, 2018, 3:45:01 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function linkopen(lnm,iid,mon,yrs){
	//alert(lnm);
	top.frames['content'].location.href = lnm;
}
        </script>>
    </head>
    <body>
        <%
        String Crosssite="15fsfd45";
        %>
        <div align="left">
            <ul>
                <li>
                    <a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('index.jsp?mnm=<%=Crosssite%>')">
		<font color="#EF2100"> SENET Amount Sanctioned</font> </a>
                </li>
            </ul>

        </div>
    </body>
</html>
