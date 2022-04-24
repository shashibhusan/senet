<%-- 
    Document   : testIssue
    Created on : Jun 16, 2018, 9:33:50 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%

String data=request.getParameter("val");
int counter=Integer.parseInt(request.getParameter("counter"));

System.out.println("data ::"+data);
System.out.println("Counter ::"+counter);

ArrayList<String> suggestion=new ArrayList<String>();
String[] dataGet=data.split(",");

for(String sug:dataGet)
    {
    System.out.println("Suggestion ::"+sug);
    suggestion.add(sug);
    }

for(int i=0; i<suggestion.size(); i++)
    {
    out.println((i+1)+". "+suggestion.get(i));
    }
%>
