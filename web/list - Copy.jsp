<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
	String countries[] = { 
						 	"Supreme Court",
							"High Court",
							"CAT",
							"Others"
							
							};
	
	String query = (String)request.getParameter("q");
	//System.out.println("1"+request.getParameterNames().nextElement());
	response.setHeader("Content-Type", "text/html");
	int cnt=1;
	for(int i=0;i<countries.length;i++)
	{
		if(countries[i].toUpperCase().startsWith(query.toUpperCase()))
		{
			out.print(countries[i]+"\n");
			if(cnt>=10)
				break;
			cnt++;
		}
	}
%>