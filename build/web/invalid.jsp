
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>

<html>
<head>
<style type="text/css">
body
{
background-color:FEF5F1;
}
</style>

</head>

<body><marquee>
<script type="text/javascript">
function startTime()
{
var today=new Date();
var h=today.getHours();
var m=today.getMinutes();
var s=today.getSeconds();
// add a zero in front of numbers<10
m=checkTime(m);
s=checkTime(s);
document.getElementById('txt').innerHTML=h+":"+m+":"+s;
t=setTimeout('startTime()',500);
}

function checkTime(i)
{
if (i<10)
  {
  i="0" + i;
  }
return i;
}
</script>
</marquee>
</head>
<%
    String Name=(String)session.getAttribute("Name");
    String cmbIns=(String)session.getAttribute("cmbIns");
    String rol=(String)session.getAttribute("rol");
    		String IP_ADDRESS = request.getRemoteAddr();	
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                    Date date = new Date();
                    String time=dateFormat.format(date);
		String status="Login failure";
                
                
 Connection  con = ConnectionManager.getConnectionDirectForMySQL();
PreparedStatement stmt4 = (PreparedStatement) con.prepareStatement("INSERT INTO tbl_login_detail_senet(`Name`,`cmbIns`,`role`,`IP_ADDRESS`,`Datetim`,`status`)"
                                                                                       + " VALUES (?,?,?,?,?,?) ");


				stmt4.setString(1, Name);
				stmt4.setString(2, cmbIns);
                                stmt4.setString(3, rol);
				stmt4.setString(4, IP_ADDRESS);
                                stmt4.setString(5, time);
                                stmt4.setString(6, status);
				// ResultSet rs = stmt.executeQuery(sql);
                                System.out.println(stmt4);
                                stmt4.execute();


                         System.out.println("1 row affected");


                        con.commit();
                        con.close();

%>
<body onload="startTime()">
<table width='100%' border='0' cellspacing='0' cellpadding='0'  height="85px" bgcolor="#990033">
	<tr>
				<td width='25%' align='center'><img src="images/india-lion-01[1].gif"/></td>
				<td width='50%' align='center'><font color="#FFFFFF" face="garamond" size="+1" style="font-weight:bold">
				Office of Development Commissioner(MSME)<br />
				Ministry of Micro, Small & Medium Enterprises
				</font></td>
				<td width='25%' align='center'><img src="images/msme_logo_old.jpg"/></td>	   					
				</tr>
</table>
<table width="100%" valign="middle">
  <tr>
  <td width="100%"  bgcolor="#0000FF" align="center" height="20px"> </td>
</tr></table>

<div id="txt" ></div>

<h1><center>!SORRY!</center></h1>
<h2><center><i>you have enter either wrong password or username </center><i></h2>
		<center>
			<a href="slogin.jsp">click to go to the main page</a></center>
</body>
</html>

