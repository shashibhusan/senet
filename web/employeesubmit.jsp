<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
</head>

<body>
	<%
	//try
	//{
	
	Connection con = ConnectionManager.getConnectionDirectForMySQL();
	Statement stmt = (Statement)con.createStatement();
	System.out.println("Call");
	 int status15=0;
	 int sno=1;
String name = request.getParameter("name");
String Designation = request.getParameter("Designation");
String Discipline = request.getParameter("Discipline");
String Division = request.getParameter("Division");
String date7 = request.getParameter("date7");
String date1 = request.getParameter("date1");
String date2 = request.getParameter("date2");

String date3 = request.getParameter("date3");
String date4 = request.getParameter("date4");
String date5 = request.getParameter("date5");
String years = request.getParameter("years");
String reference = request.getParameter("reference");
String date6 = request.getParameter("date6");


String userAction = request.getParameter("submit");
if(userAction.equalsIgnoreCase("Add")){
String sqlPart1 = "insert into tbl_employeeinformation(name, Designation, Discipline, Division, date7, date1, date2, date3, date4, date5, years, reference, date6) values ( ";
String strQueryRow3 = sqlPart1+"'"+name+"','"+Designation+"','"+Discipline+"'";
String strQueryRow4 = ",'"+Division+"',str_to_date('"+date7+"','%d-%m-%Y'),str_to_date('"+date1+"','%d-%m-%Y'),str_to_date('"+date2+"','%d-%m-%Y'),str_to_date('"+date3+"','%d-%m-%Y'),str_to_date('"+date4+"','%d-%m-%Y'),str_to_date('"+date5+"','%d-%m-%Y'),'"+years+"','"+reference+"',str_to_date('"+date6+"','%d-%m-%Y'))";
String result =strQueryRow3+strQueryRow4;
		System.out.println(result);
	
     System.out.println("Query"+result);

	        status15 = stmt.executeUpdate(result);
			}
			
			
		
		con.commit();
	    
              
		con.close();
		System.out.println("Query Executed");
		

%>

<%if(status15==1){%>
<jsp:forward page="status.jsp?status=TRUE"></jsp:forward>
<%}else{%>
<jsp:forward page="status.jsp?status=FALSE"></jsp:forward>
<%}%>
</body>
</html>
