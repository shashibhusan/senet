<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="header-img1.html"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>case complain </title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style>
<!--
.intro{
position:absolute;
left:0;
top:0;
layer-background-color:yellow;
background-color:#808080;
border:0.1px solid yellow;
z-index:10;
}
-->
</style>
<body  background="images/msm34343e.bmp">
<script language="JavaScript1.2">

/*
Top-Down Curtain Script- By Dynamic Drive (www.dynamicdrive.com)
For full source code, installation instructions, and TOS,
visit http://www.dynamicdrive.com
*/

var ns4=document.layers?1:0
var ie4=document.all?1:0
var ns6=document.getElementById&&!document.all?1:0
var speed=20
var temp=new Array()
var temp2=new Array()
if (ns4){
for (i=1;i<=2;i++){
temp[i]=eval("document.i"+i+".clip")
temp2[i]=eval("document.i"+i)
temp[i].width=window.innerWidth
temp[i].height=window.innerHeight/2
temp2[i].top=(i-1)*temp[i].height
}
}
else if (ie4||ns6){
var clipbottom=ns6?parseInt(window.innerHeight)/2:document.body.offsetHeight/2
cliptop=0
for (i=1;i<=2;i++){
temp[i]=ns6?document.getElementById("i"+i).style:eval("document.all.i"+i+".style")
temp[i].width=ns6?window.innerWidth-15:document.body.clientWidth
temp[i].height=ns6?window.innerHeight/2:document.body.offsetHeight/2
temp[i].top=(i-1)*parseInt(temp[i].height)
}
}

function openit(){
window.scrollTo(0,0)
if (ns4){
temp[1].bottom-=speed
temp[2].top+=speed
if (temp[1].bottom<=0)
clearInterval(stopit)
}
else if (ie4||ns6){
clipbottom-=speed
temp[1].clip="rect(0 auto "+clipbottom+" 0)"
cliptop+=speed
temp[2].clip="rect("+cliptop+" auto auto auto)"
if (clipbottom<=-5){
clearInterval(stopit)
if (ns6){
temp[1].display="none"
temp[2].display="none"
}
}
}
}
function gogo(){
stopit=setInterval("openit()",100)
}
gogo()

</script>
<script type="text/javascript">
<!-- 
function fnSubmit() {
      
if(document.frmMain.cmbIns.value!="" && document.frmMain.cmbMonth.value!="" && document.frmMain.cmbYear.value!="" && document.frmMain.mnm.value!="") {
            document.frmMain.action="main1.jsp";
			return true;
      } else {
			alert('Please selected the Criteria.......');
            document.frmMain.cmbIns.focus();
            return false;
      }

}
//-->
</script>

<br>
<h3 align="center" ><font  color="#000099"> <i> Select your Institute , Month, Year to Proceed further </i></font></h3>



<form name="frmMain" method="post" onSubmit="return fnSubmit()">
	

<table width="335" BORDER="2" align="center"  bgcolor=""    bordercolordark="#FFFFCC"  >
<tr>		
<td width="325">
<br>
<table width="450">
<tr>
<td width="130" height="38" ><strong>&nbsp;&nbsp;<font color="#990033">Institute </font></strong></td>

<td width="308">
  <select name="cmbIns" id="cmbIns" style="width: 230px">
      
<%

try{
  Connection conn = ConnectionManager.getConnectionDirectForMySQL();
			if(conn != null){
				Statement stmt = conn.createStatement();
				String intid=request.getParameter("cmbIns");
				System.out.println(intid);
				String userSql=null;
				if(request.getParameter("role").equalsIgnoreCase("SU")){
					userSql="select INST_ID,INST_NAME from tbl_DI_institute";
				}
				else{
				userSql="select INST_ID,INST_NAME from tbl_DI_institute where INST_ID='"+intid+"'";
				}
				
				ResultSet resultSet = stmt.executeQuery(userSql);
				//String cmbIns = resultSet.getString("INST_ID");
				while(resultSet.next()){
%>
<option value='<%=resultSet.getString("INST_ID")%>'><%=resultSet.getString("INST_NAME")%></option>

<%}}}
catch(SQLException e){
			//e.printStackTrace();
			System.out.println(e.getErrorCode()+" = "+e.getMessage());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println(e.getMessage());
		}

%>
  </select>
  </td></tr>
  <tr><td height="35">
      <strong>&nbsp;&nbsp;<font color="#990033">Month</font>
      &nbsp;</strong></td>
	  <td>
      <select name="cmbMonth" id="cmbMonth" style="width: 230px">
        <option value="">-Select Month-</option>
        <option value="10">JANUARY</option>
        <option value="11">FEBRUARY</option>
        <option value="12">MARCH</option>
        <option value="01">APRIL</option>
        <option value="02">MAY</option>
        <option value="03">JUNE</option>
        <option value="04">JULY</option>
        <option value="05">AUGUST</option>
        <option value="06">SEPTEMBER</option>
        <option value="07">OCTOBER</option>
        <option value="08">NOVEMBER</option>
        <option value="09">DECEMBER</option>
      </select>
      </td>  </tr>
	  <tr><td height="39">
      <strong>&nbsp;&nbsp;<font color="#990033">Year</font></strong>
	  </td> 
	  <td>
      <select name="cmbYear" id="cmbYear" style="width: 230px">
        <option value="">-Select Year-</option>
        <option value="2011">2011-12</option>
        <option value="2012">2012-13</option>
        <option value="2013">2013-14</option>
        <option value="2014">2014-15</option>
        <option value="2015">2015-16</option>
        <option value="2016">2016-17</option>
        <option value="2017">2017-18</option>
        <option value="2018">2018-19</option>
        <option value="2019">2019-20</option>
        <option value="2020">2020-21</option>
        </select>
      </td>  </tr>
	  <tr><td align="center" colspan="2" height="35px" valign="bottom">
      <center>
	      <input  type="hidden" name="mnm" value='<%=request.getParameter("mnm1")%>'/>
	      <input  type="hidden" name="role" value='<%=request.getParameter("role")%>'/>
    <input  type="submit" name="submit" value="Submit"/>

</center>
    
  </td>
</tr>
</table>
<br>
  </td>
</tr>
</table>

</form>
</body>
</html>
