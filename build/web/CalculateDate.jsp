<%-- 
    Document   : CalculateDate
    Created on : Apr 27, 2018, 12:15:58 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
String dob=request.getParameter("dob");
System.out.println("DAte of retirement ::"+dob);
/*SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Date date = new Date();
//String time=dateFormat.format(date);
Calendar c = Calendar.getInstance();
try{

	c.setTime(dateFormat.parse(dob));
	}catch(ParseException e){
		e.printStackTrace();
	 }
	
//c.add(Calendar.DAY_OF_MONTH, 21900);
String finalDate = dateFormat.format(c.getTime());
System.out.println("DAte of retirement ::"+finalDate);*/
String day_of_month=dob.substring(0, 2);
String month_of_year=dob.substring(3, 5);
int Year=Integer.parseInt(dob.substring(6, 10));


System.out.println("final day :"+day_of_month+"month :"+month_of_year+"year :"+Year);

int final_year=Year+60;

%>
<h1><%=dob%></h1>