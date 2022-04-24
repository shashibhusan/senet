<html>
<head>
<body>
<%
String instId = request.getParameter("instId");
System.out.println(instId);
  if(instId.equals("I10"))
  {
%>
    <jsp:forward page="reportrevenueguw.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
<%
  }else if(instId.equals("I8"))
  {
%>
 <jsp:forward page="reportrevenuekol.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I9"))
  {
%>
 <jsp:forward page="reportrevenuecuttack.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  } else if(instId.equals("I19"))
  {
%>
 <jsp:forward page="revenuerevenuechennai.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I11"))
  {
%>
 <jsp:forward page="reportrevenuehubli.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I6"))
  {
%>
 <jsp:forward page="report revenuebanglore.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I4"))
  {
%>
 <jsp:forward page="reportrevenueallhabad.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I1"))
  {
%>
 <jsp:forward page="report revenueagartala.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I12"))
  {
%>
 <jsp:forward page="reportrevenuehyderabad.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I14"))
  {
%>
 <jsp:forward page="reportrevenueimphal.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I17"))
  {
%>
 <jsp:forward page="reportrevenuekarnal.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I22"))
  {
%>
 <jsp:forward page="reportrevenueranchi.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I26"))
  {
%>
 <jsp:forward page="reportrevenuelakhdee.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I7"))
  {
%>
 <jsp:forward page="reportrevenueemumbai.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I13"))
  {
%>
 <jsp:forward page="report revenueeindore.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I3"))
  {
%>
 <jsp:forward page="reportrevenueeAhemdabad.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  } else
  {%>
	<jsp:forward page="revenuereport.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<% }%>

</body>
</head>
</html>