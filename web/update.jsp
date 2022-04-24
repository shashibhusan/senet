<%-- 
    Document   : update
    Created on : 31 Jan, 2019, 5:02:38 PM
    Author     : Senet
--%>
<%@page import="java.sql.*,common.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>: : Update Info : :</title>
<script language="JavaScript">
window.history.forward(0);
</script>
<style>
    title
    {
        font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
    }
    #crt{
    font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
    padding: 5px;
  
        }
        #mainDiv
        {
            border: 1px #ccc solid;
            width : 1150px;
            margin: auto;
            align : center;
        }
        @media print
{
body {
      
       line-height: 1.1;
       

   }
    .hide
    {
        display: none !important;
    }
}
@page{
   
   
    margin:0px;

}

body.print-page
{
       -webkit-transform: scale(0.85);  /* Saf3.1+, Chrome */
             -moz-transform: scale(0.95);  /* FF3.5+ */
              -ms-transform: scale(0.85);  /* IE9 */
               -o-transform: scale(0.85);  /* Opera 10.5+ */
                  transform: scale(0.85);
        /* big hack to reposition the page top the top and left of the viewer control */
}





</style>

</head>


<script type="text/javascript">
<!--
function delayer(){
    window.location = "logout.jsp"
}
//-->
</script>
<%--
<body onLoad="setTimeout('delayer()', 1800000)">
--%>
    <body>
    <%
        String crosssite = (String)session.getAttribute("crosssite");
        session.setAttribute("crosssite", crosssite);
        
        session.setAttribute("Session",crosssite);
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        
        if(!crosssite.equals(null))
        {     
        String token= (String)session.getAttribute("token");
        String emp_name= (String)session.getAttribute("name");
        String emp_email= (String)session.getAttribute("email");
        String emp_desig= "";
        String emp_cur_ofc= "";
        
        Connection con=null;
        ResultSet rs=null;
        Statement st=null;
        int flag=0;
        
        try
        {
            con=ConnectionManager.getConnectionDirectForMySQL();
            st=con.createStatement();
            String query="select * from eis_postinginfo_new where email='"+emp_email+"' and token='"+token+"'";
            rs=st.executeQuery(query);
            if(rs.next())
            {
                flag=1;
            }
        }
        catch(Exception sqlerror)
        {
            sqlerror.printStackTrace();
        }
        if(flag==1)
        {
            rs.beforeFirst();
            while(rs.next())
            {
                emp_cur_ofc=rs.getString("curr_ofc");
                emp_desig=rs.getString("designation");
                System.out.println("====");
            }
        }else
        {
            String sql1="select * from eis_postinginfo where email='"+emp_email+"'";
            rs=st.executeQuery(sql1);
            while(rs.next())
            {
                emp_cur_ofc=rs.getString("state");
                emp_desig=rs.getString("curr_despln");
                System.out.println("******");
            }
            con.close();
        }
        
       
        session.setAttribute("token", token);
        session.setAttribute("emp_name", emp_name);
        session.setAttribute("emp_email", emp_email);
        session.setAttribute("emp_desig", emp_desig);
        session.setAttribute("emp_cur_ofc", emp_cur_ofc);
        
    %>
    
    <div id="mainDiv">
<table width='1150px' border='0px' cellspacing='0' cellpadding='0'  align="center">
	  
    <tr>
        <td>
        <div class="hide" style="font-size: 14px;font-family:Verdana;font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; " align="center">Government of India, Ministry of MSME </div>
        <div class="hide" style="font-size: 14px;font-family:Verdana;font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"></font>O/o  DCMSME </div>
        <div class="hide" style="font-size:14px;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center" ><font color="#990000">ALL INDIA MSME-DO EMPLOYEES' INFORMATION SYSTEM </font>
         </div>
        </td>
    </tr>		  
		 
		  
		  
		  <tr>
                      <td height="4" colspan="4" style="background-color:  #996b65 "></td>
    </tr>
 <tr>
   <td height="27" colspan="4" align="center"  ><strong>
<div style="text-align:center; border-top: 1px #ccc solid">
 
<IFRAME NAME="menu"  width="22%" height="630px"  align="left" SRC="eisupdate-menu.jsp" frameborder=0></IFRAME>

<IFRAME NAME="content"  id="content" width="78%"  SRC="sidenav.jsp" height="630px"  frameborder=0></IFRAME>
</div></strong></td></tr>
<tr>
    <td id="crt" align="center" class="hide">
        <div  colspan="13" style="margin-bottom:0px; background-color:green;" >
     
            <font color="#FFFFFF" size="-1">Created & Designed by O/o DC-MSME &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Contact Us : 011-23062354(Senet Division)
            </font>
       
    </div>
    </td>
    </tr>

</table>
</div>
    <%
        }else {
    response.sendRedirect("stat.jsp");
}
    %>
</body>
</html>