<html>
<head>
<body>
<%
String instId = request.getParameter("instId");
System.out.println(instId);
  if(instId.equals("I10"))
  {
%>
    <jsp:forward page="revenueguw.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
<%
  }else if(instId.equals("I8"))
  {
%>
 <jsp:forward page="revenuekol.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I9"))
  {
%>
 <jsp:forward page="revenuecuttack.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  } else if(instId.equals("I19"))
  {
%>
 <jsp:forward page="revenuechennai.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I11"))
  {
%>
 <jsp:forward page="revenuehubli.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I6"))
  {
%>
 <jsp:forward page="revenuebanglore.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I4"))
  {
%>
 <jsp:forward page="revenueallhabad.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I1"))
  {
%>
 <jsp:forward page="revenueagartala.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I12"))
  {
%>
 <jsp:forward page="revenuehyderabad.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I14"))
  {
%>
 <jsp:forward page="revenueimphal.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I17"))
  {
%>
 <jsp:forward page="revenuekarnal.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I22"))
  {
%>
 <jsp:forward page="revenueranchi.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I26"))
  {
%>
 <jsp:forward page="revenuelakhdee.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I7"))
  {
%>
 <jsp:forward page="revenueemumbai.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I13"))
  {
%>
 <jsp:forward page="revenueeindore.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }else if(instId.equals("I3"))
  {
%>
 <jsp:forward page="revenueeAhemdabad.jsp">
      <jsp:param name="FailReason" value="Wrong page"/>
    </jsp:forward>
	<%
  }%>
	
<H2 align="center">Sorry Check for your Branches</H2>
</body>
</head>
</html>