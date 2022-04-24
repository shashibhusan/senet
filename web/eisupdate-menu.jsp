<%-- 
    Document   : eisupdate-menu
    Created on : 1 Feb, 2019, 11:32:38 AM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" autoFlush="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE"> 
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="description" content="Styling Select Elements" />
<title>Home Page</title>
<style type="text/css">

            .style2 ul
{
    padding:0px;
    margin-left:0px;
    font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
    color:#F7F7F7;
    list-style:none;
    text-indent:20px;
	width:240px;
}
.style2 ul li
{
    background:#EFEFEF;
    line-height:28px;
    border-bottom:1px solid #333;
}
.style2 ul li a
{
    text-decoration:none;
    color:#FFFFFF;
	size:auto;
	
	
    display:block;
}
.style2 ul li a:hover
{
    background:#DFC4A8;
}
.style2 ul li#active
{
    background:#073354;
	color:#333333
}
        </style>
         <script language="JavaScript" type="text/javascript"><!--//--><![CDATA[//><!--
function linkopen(lnm,iid,mon,yrs){
	//alert(lnm);
	top.frames['content'].location.href = lnm; 
}
function linkopen1(lnm,iid,mon,yrs){
	var links = lnm+'?instId='+iid+'&months='+mon+'&years='+yrs;
	alert(links);
	top.frames['content'].location.href = links; 
}
    //--><!]]>
function  abc()
    {
         document.getElementById("dateshow").style.visibility = "hidden";
    }
    function showdate()
    {
      document.getElementById("dateshow").style.visibility = "visible";
    }
</script>
    </head>
    <%
        String crosssite = (String)session.getAttribute("crosssite");
        session.setAttribute("crosssite", crosssite);
        if(!crosssite.equals(null))
        {
            
        String token = (String)session.getAttribute("token");
        String emp_name = (String)session.getAttribute("emp_name");
        String emp_email = (String)session.getAttribute("emp_email");
        String emp_desig = (String)session.getAttribute("emp_desig");
        String emp_cur_ofc = (String)session.getAttribute("emp_cur_ofc");
        
        session.setAttribute("token", token);
        session.setAttribute("emp_name", emp_name);
        session.setAttribute("emp_email", emp_email);
        session.setAttribute("emp_desig", emp_desig);
        session.setAttribute("emp_cur_ofc", emp_cur_ofc);
    %>
    <body class="hide">
        <div align="center" style="margin: auto; text-align: left;"  id="menu-div" class="style2" >
            <ul class="hide" style="border: 1px green solid;">
                
                <li>  <a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('sidenav.jsp'),showdate()">
		<font color="#EF2100"> Home</font> </a></li>
                
              <%--    <li class = "green"> 
                    <a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('updatepostpref.jsp'),showdate()">
		<font color="#EF2100"> SENET Amount Sanctioned</font> </a>
                </li>
                     <li > <a href="myInfo.jsp" class="link1"><font color="#EF2100"> my account</font> </a>
</li>--%>
                
                <li>  
                    <a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('updatetransfer.jsp'),showdate()">
		<font color="#EF2100"> Update posting info</font> </a>
                </li>
                <%--         <li>  
                    <a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('updatepromotion.jsp'),showdate()">
		<font color="#EF2100"> update promotion</font> </a>
                </li>
                --%>
                <li>  
                    <a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('updatepostpref.jsp'),showdate()">
		<font color="#EF2100"> Update posting preferences </font> </a>
                </li>
                <li>  
                    <a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('updateotherinfo.jsp'),showdate()">
		<font color="#EF2100"> Update other info </font> </a>
                </li>
                
<!--                <li>  
                    <a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('updatetraining.jsp'),showdate()">
		<font color="#EF2100"> Update Training Info</font> </a>
                </li>-->
                
                <li>  
                    <a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('fullreport.jsp'),showdate()">
		<font color="#EF2100"> Full details</font> </a>
                </li>
              
              <li id="active"><A HREF="EIS_logout.jsp" target="_top"> <strong>Logout</strong></a></li>
                
            </ul>
            
        </div>
    </body>
              <%
        }else {
    response.sendRedirect("stat.jsp");
}
              %>
</html>
