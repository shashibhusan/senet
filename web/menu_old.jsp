<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" autoFlush="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE"> 
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="description" content="Styling Select Elements" />
<title>Home</title>
<style type="text/css">


.menu_div ul
{
    padding:0px;
    margin:0px;
    font-family:"Times New Roman", Times, serif;
    font-size:15px;
    color:#F7F7F7;
    list-style:none;
    text-indent:15px;
	width:200px;
}
.menu_div ul li
{
    background:#EFEFEF;
    line-height:28px;
    border-bottom:1px solid #333;
}
.menu_div ul li a
{
    text-decoration:none;
    color:#FFFFFF;
	size:auto;
	
	
    display:block;
}
.menu_div ul li a:hover
{
    background:#DFC4A8;
}
.menu_div ul li#active
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

<body>
<%
String Random5=(String)session.getAttribute("Random5");
String Crosssite=(String)session.getAttribute("Crosssite");
if(Random5.equals(Crosssite))
{
String sessionid = request.getSession().getId();
if(session != null ) {
String instId=(String)session.getAttribute("CmbIns");
System.out.println("The id of the institute is : "+instId);
 String role=(String)session.getAttribute("rol");
String years=(String)session.getAttribute("CmbYear");
String months=(String)session.getAttribute("CmbMonth");
String user=(String)session.getAttribute("user");
String Section=(String)session.getAttribute("Section");
String mnm = request.getParameter("mnm");

if(role!=null && role!="" && role!=null && role!="" && role!=null && role!="" ){
try
{
		Connection con = null;
	     Statement stmt = null;
		Statement stmt4 =null;
con = ConnectionManager.getConnectionDirectForMySQL();
	     stmt = (Statement)con.createStatement();
		 stmt4 = (Statement)con.createStatement();
		 Statement stmt1 = null;
 stmt1 = (Statement)con.createStatement();
%>	
<%

String strsql2="select * from tbl_month where months='"+months+"'" ;
System.out.println("record have found");
System.out.println("months" +strsql2);
ResultSet rs_month=stmt4.executeQuery(strsql2);
if(rs_month.next())
{
System.out.println("months" +strsql2);
String mon = rs_month.getString("mon");
System.out.println("months" +mon);
}
%>
<div id="dateshow">
 <font color="#990033" size="-1"><strong>  Month - <%=rs_month.getString("mon")%> ,Years - <%=years%></strong> </font>
</div>
<%

String strsql12="select * from user_di_mapping where USER_ID='"+user+"'" ;
System.out.println("record have found");
System.out.println("USER_ID" +strsql12);
ResultSet rs_role=stmt4.executeQuery(strsql12);
 for(int icnt=1;rs_role.next();icnt++)
{
System.out.println("USER_ID" +strsql12);
String inst_two = rs_role.getString("INST_ID");
System.out.println("USER ---prakash ---" +inst_two);

%>

 <% if((role.equalsIgnoreCase("SU")) && (role.equals(inst_two))){%>
 
<div class="menu_div" >
        <ul>
        <li id="active"><a href="main.jsp" target="_top">Home</a></li>
        <li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('chnagepsw.jsp?mnm=<%=Crosssite%>'),showdate()">
		  <font color="#EF2100"> Change password</font></a>
				</li>
	       <li class = "green"> <a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('targetsenet.jsp?mnm=<%=Crosssite%>'),showdate()">
		<font color="#EF2100"> SENET Amount Sanctioned</font> </a></li>
                
          <li > <a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('senet.jsp?mnm=<%=Crosssite%>'),showdate()">
		  <font color="#EF2100"> SENET Exp. Entry</font> </a></li>
		   <li > <a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('esdp.jsp?mnm=<%=Crosssite%>'),showdate()">
		  <font color="#EF2100"> LIB. Exp. Entry Form</font></a></li>

                   <li class = "green"> <a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('ISOtarget.jsp?mnm=<%=Crosssite%>'),abc()">
		<font color="#EF2100"> ISO Amount Sanctioned</font> </a></li>
                
                   <li > <a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('ISOEntry.jsp?mnm=<%=Crosssite%>'),abc()">
		  <font color="#EF2100">ISO 9000/14001/HACCP</font></a></li>
                  <li id="active">
                      <font color="white" size="4">Report Section</font> </li>

                   <%-- shashi start 20 aug--%>

        <li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('senetMain1.jsp?mnm=<%=Crosssite%>'),showdate()">
				<font color="#EF2100">SENET Exp. Report</font></a>				</li>
					<li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('senetMain.jsp?mnm=<%=Crosssite%>'),abc()">
				<font color="#EF2100">Sanctioned Amount (SENET)</font></a>				</li>
					<li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('senetMain1.jsp?mnm=<%=Crosssite%>'),abc()">
				<font color="#EF2100">Expenditure incurred (SENET)</font></a>				</li>

                                <li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('LibraryMain.jsp?mnm=<%=Crosssite%>'),abc()">
				<font color="#EF2100">Library Report(SENET)</font></a>
                                </li>
                                <li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('ISOReport.jsp?mnm=<%=Crosssite%>'),abc()">
				<font color="#EF2100">ISO Report</font></a>
                                </li>
                  
                  <%-- shashi ends --%>
		<li id="active"><a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('msmecontact.jsp')">
	   Contact Us</a></li>
	   <li id="active"><A HREF="logout.jsp?mnm=<%=Crosssite%>" target="_top"> Logout</a></li>
        </ul>
</div>
<%} else  if((role.equalsIgnoreCase("SU")) && (role.equals(inst_two))&& (Section.equals("2"))   ){%>
 
<div class="menu_div" >
        <ul>
       <li id="active"><a href="main.jsp" target="_top">Home</a></li>
	    <li id="active"><font color="WHITE">Senet Report</font></li>
        <li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('senetreport.jsp?mnm=<%=Crosssite%>'),showdate()">
				<font color="#EF2100">SENET Exp. Report</font></a>				</li>
					<li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('senetMain.jsp?mnm=<%=Crosssite%>'),abc()">
				<font color="#EF2100">Sanctioned Amount (SENET)</font></a>				</li>
					<li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('senetMain1.jsp?mnm=<%=Crosssite%>'),abc()">
				<font color="#EF2100">Expenditure incurred (SENET)</font></a>				</li>

                                <li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('LibraryMain.jsp?mnm=<%=Crosssite%>'),abc()">
				<font color="#EF2100">Library Report(SENET)</font></a>
                                </li>
                                <li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('ISOReport.jsp?mnm=<%=Crosssite%>'),abc()">
				<font color="#EF2100">ISO Report</font></a>
                                </li> 
			<%-- start commented by shashi bhusan patel(19may2015) to seprate the court case application and ACR application from the SENET application--%>

                <%-- End commented by shashi bhusan patel(19may2015) to seprate the court case application and ACR application from the SENET application--%>
		  <% if((user.equalsIgnoreCase("svsharma sir"))){%>
		 <li id="active"><font color="WHITE">ACR Report</FONT></li>
		 <li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwiseiaiar.jsp?mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> IA</a></li>
		 <li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwiseiar.jsp?mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> AIA </font></a></li>
<li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwisedirector.jsp?mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> Director </font></a></li>
		 <li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwisedydirector.jsp?mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> Dy.Director </font></a></li>
		  <li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwiseassis1director.jsp?mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> Assistant Director -I </font></a></li>
		  <li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwiseassis11director.jsp?mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> Assistant Director -II </font></a></li>
		 
		  <li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwiseSECr.jsp?mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> Section Officer </font></a></li>
		
		 
		 <li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwiseinvr.jsp?mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> Investigator </font></a></li>

		 <li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwise1.jsp?prog=OFFICE SUPDT.&mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> Office Sup. </font></a></li>
  </LI>
  <li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwise1.jsp?prog=ASSISTANT&mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> Assistant </font></a></li>
		 <li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwise1.jsp?prog=SECTION OFFICER&mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> Section Officer </font> </a></li>
		 <li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwise1.jsp?prog=UDC&mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> UDC </font> </a></li>
		 <li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwise1.jsp?prog=LDC&mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> LDC  </font></a></li>
		
		 <li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwise1.jsp?prog=SENIOR HINDI TRANSLATOR&mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> Senior Hindi Translator </font> </a></li>
		 <li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwise1.jsp?prog=JUNIOR HINDI TRANSLATOR&mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> Junior Hindi Translator </font> </a></li>
		 
<li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwise1.jsp?prog=DRAUGHT MAN&mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> Draught man </font></a></li>
		 <li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwise1.jsp?prog=DRAFT MAN&mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> Draft man </font></a></li>
		 
		 <li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwise1.jsp?prog=PA&mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> PA </font></a></li>
		 <li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwise1.jsp?prog=PS&mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> PS  </font> </a></li>
		 
		  <li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwise1.jsp?prog=STENO&mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> STENO </font></a></li>
		 <li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwise1.jsp?prog=ACCOUNTANT&mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> ACCOUNTANT </font> </a></li>
		 <li><a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('groupwise1.jsp?prog=HINDI OFFICER&mnm=<%=Crosssite%>')">
		 &nbsp;&nbsp; <font color="#EF2100"> Hindi Officer </font> </a></li>
		
		
		<%}%>
		  <li id="active"><a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('msmecontact.jsp')">
	  Contact us</a></li>
	   <li id="active"><A HREF="logout.jsp?mnm=<%=Crosssite%>" target="_top"> <strong>Logout</strong></a></li>
        </ul>
</div>
<%} else  if((role.equalsIgnoreCase("IU")) && (instId.equals(inst_two)) ){%>
 
<div class="menu_div" >
        <ul>
       <li id="active"><a href="main.jsp" target="_top">Home</a></li>
        <li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('chnagepsw.jsp?mnm=<%=Crosssite%>')">
		   <font color="#EF2100">Change password</font></a>
				</li>

           <li > <a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('senet.jsp?mnm=<%=Crosssite%>')">
		  <font color="#EF2100"> Senet Exp. Entry Form</font></a></li>
		   <li > <a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('esdp.jsp?mnm=<%=Crosssite%>')">
		  <font color="#EF2100"> LIB. Exp. Entry Form</font></a></li>
                   <% if ((!instId.equalsIgnoreCase("I100")) && (!instId.equalsIgnoreCase("I101"))&&(!instId.equalsIgnoreCase("I103"))&&(!instId.equalsIgnoreCase("I104"))
                    && (!instId.equalsIgnoreCase("I105"))&&(!instId.equalsIgnoreCase("I106"))&&(!instId.equalsIgnoreCase("I107"))
                           ){
                    %>
                  <li > <a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('ISOEntry.jsp?mnm=<%=Crosssite%>'),abc()">
		  <font color="#EF2100">ISO 9000/14001/HACCP</font></a></li>
                  <% } %>
                  <%-- shashi start 20 aug--%>
                 <li id="active">
                      <font color="white" size="4">Report Section</font> </li>

<li >
		 <a href="#" onMouseOver="window.status=''; return true;" onclick="linkopen('senetMain1.jsp?mnm=<%=Crosssite%>')">
		<font color="#EF2100"> Senet Exp. Report</font></a>
		  </li>
                <%-- shashi ends --%>
	       <li id="active"><a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('msmecontact.jsp')">
	  Contact Us</a></li>
	   <li id="active"><a HREF="logout.jsp?mnm=<%=Crosssite%>" target="_top"> <strong>Logout</strong></a></li>
        </ul>
</div>

<%} else  if((role.equalsIgnoreCase("IU")) && (instId.equals(inst_two))&& (Section.equals("2"))   ){%>
 
<div class="menu_div" >
        <ul>
       <li id="active"><a href="main.jsp" target="_top">Home</a></li>
        <li >
		 <a href="#" onMouseOver="window.status=''; return true;" onclick="linkopen('senetreport.jsp?mnm=<%=Crosssite%>')">
		<font color="#EF2100"> Senet Exp. Report</font></a>
		  </li>
		 
        <li id="active"><a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('msmecontact.jsp')">
	  Contact Us</a></li>
	   <li id="active"><A HREF="logout.jsp?mnm=<%=Crosssite%>" target="_top"> <strong>Logout</strong></a></li>
        </ul>
</div>
<%} else  if((role.equalsIgnoreCase("JU")) && (instId.equals(inst_two))&& (Section.equals("1"))   ){%>
 
<div class="menu_div" >
        <ul>
       <li id="active"><a href="main.jsp" target="_top">Home</a></li>
        <li>
				<a href="#" onMouseOver="window.status=''; return true;" onClick="linkopen('chnagepsw.jsp?mnm=<%=Crosssite%>')">
		   <font color="#EF2100">Change password</font></a>
				</li>
<%-- start commented by shashi bhusan patel(19may2015) to seprate the court case application and ACR application from the SENET application--%>
           <%--<li > <a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('casefile.jsp?mnm=<%=Crosssite%>')">
		  <font color="#EF2100">Court Cases Detail Entry Form</font></a></li>--%>
                  <%-- End commented by shashi bhusan patel(19may2015) to seprate the court case application and ACR application from the SENET application--%>
	       <li id="active"><a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('msmecontact.jsp')">
	  Contact Us</a></li>
	   <li id="active"><A HREF="logout.jsp?mnm=<%=Crosssite%>" target="_top"> <strong>Logout</strong></a></li>
        </ul>
</div>

<%} else  if((role.equalsIgnoreCase("JU")) && (instId.equals(inst_two))&& (Section.equals("2"))   ){%>
 
<div class="menu_div" >
        <ul>
       <li id="active"><a href="main.jsp" target="_top">Home</a></li>
       <%-- start commented by shashi bhusan patel(19may2015) to seprate the court case application and ACR application from the SENET application--%>
        <%--<li >
		 
		 <a href="#" onMouseOver="window.status=''; return true;" onclick="linkopen('Yearlyreport.jsp?mnm=<%=Crosssite%>')">
		<font color="#EF2100"> Yearly Report</font></a>  </li>--%>
		 <%--<li >
		 
		 <a href="#" onMouseOver="window.status=''; return true;" onclick="linkopen('rtmain1courtwise.jsp?mnm=<%=Crosssite%>')">
		<font color="#EF2100"> Courtwise Details</font></a>  </li>--%>
		 <%--<li >
		 
		 <a href="#" onMouseOver="window.status=''; return true;" onclick="linkopen('rtmain2consloidated.jsp?mnm=<%=Crosssite%>')">
		<font color="#EF2100"> Consolidated Details</font></a>  </li>--%>
		<%-- End commented by shashi bhusan patel(19may2015) to seprate the court case application and ACR application from the SENET application--%>
		 
        <li id="active"><a href="#" onMouseOver="window.status=''; return true;"  onclick="linkopen('msmecontact.jsp')">
	  Contact Us</a></li>
	   <li id="active"><A HREF="logout.jsp?mnm=<%=Crosssite%>" target="_top"> <strong>Logout</strong></a></li>
        </ul>
</div>
<%} else {%>

<jsp:forward page="stat.jsp"></jsp:forward>

<% }%>
<%}%>

  <%
}
catch(SQLException e){
			//e.printStackTrace();
			System.out.println(" SQLException = "+e.getErrorCode()+" = "+e.getMessage());
			int eCode = e.getErrorCode();
			String eMsg  =e.getMessage();
			if(e.getErrorCode()==1){
				System.out.println("Duplicate Entry");
				}

				%>
	 <jsp:forward  page="errorCode.jsp">	
	<jsp:param name="ecode" value="<%=eCode%>"/>
	<jsp:param name="emsg" value='<%=eMsg%>'/>
	</jsp:forward>
				<%
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			String eMsg  =e.getMessage();
			System.out.println(" Exception = "+e.getMessage());
				%>
	<jsp:forward page="errorCode.jsp">	
	<jsp:param name="ecode" value="0"/>
	<jsp:param name="emsg" value='<%=eMsg%>'/>
	</jsp:forward>
<%
			}
			}//end if
			else{
			// Session Expired.
			%>
			<jsp:forward page="stat.jsp" ></jsp:forward>
			<%			
			}
			} else {
    response.sendRedirect("/slogin.jsp");
}
} else {
    response.sendRedirect("/MprDi/stat.jsp");
}
%>
  
</body>
</html>
