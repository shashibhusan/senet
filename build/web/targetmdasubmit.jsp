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
	 //String sno = request.getParameter("sno");
	String instId = request.getParameter("instId");
String months = request.getParameter("months");
String years =request.getParameter("years");
String mnm = request.getParameter("mnm");
String role = request.getParameter("role");
String serial = request.getParameter("serial");
System.out.println(months);
System.out.println(years);
System.out.println(instId);
System.out.println(serial);

   
	 String Serial_number = request.getParameter("Serial_number");
	String Detail_of_case = request.getParameter("Detail_of_case");
	String stakes_involved = request.getParameter("stakes_involved"); 
	String status = request.getParameter("status");
	String status_of_case = request.getParameter("status_of_case");
	String Detail_of_application = request.getParameter("Detail_of_application"); 
	String Present_status_of_the_case = request.getParameter("Present_status_of_the_case"); 
	String date_of_entry = request.getParameter("date_of_entry");
	String nature_of_court = request.getParameter("nature_of_court"); 
	String Controlling_Officers = request.getParameter("Controlling_Officers");
	
	
	String date_of_next_hearing = request.getParameter("date_of_next_hearing"); 
	String expected_date_of_filing = request.getParameter("expected_date_of_filing"); 
	String Affidavit_date_of_filing_CA = request.getParameter("Affidavit_date_of_filing_CA");
	String year_of_case = request.getParameter("year_of_case"); 
	String cases_related_to = request.getParameter("cases_related_to");
	
	
	 String userAction = request.getParameter("submit");
	if(userAction.equalsIgnoreCase("Add")){
	String sqlPart1 = "insert into tbl_judical_detail(Serial_number, Detail_of_case, date_of_entry,stakes_involved,nature_of_court, Controlling_Officers,INST_ID,months,year,status,Detail_of_application,date_of_next_hearing,expected_date_of_filing,Affidavit_date_of_filing_CA,cases_related_to,year_of_case,Present_status_of_the_case,status_of_case) values ( ";
	
String strQueryRow1 = sqlPart1+"'"+Serial_number+"','"+Detail_of_case+"'";
String strQueryRow2 = ",SYSDATE(),'"+stakes_involved+"','"+nature_of_court+"','"+Controlling_Officers+"'";
String strQueryRow3 = ",'"+instId+"','"+months+"',"+years+"";
String strQueryRow4 = ",'"+status+"','"+Detail_of_application+"',str_to_date('"+date_of_next_hearing+"','%d-%m-%Y'),str_to_date('"+expected_date_of_filing+"','%d-%m-%Y'),str_to_date('"+Affidavit_date_of_filing_CA+"','%d-%m-%Y'),'"+cases_related_to+"',"+year_of_case+",'"+Present_status_of_the_case+"','"+status_of_case+"')";
String result = strQueryRow1+strQueryRow2+strQueryRow3+strQueryRow4;
		System.out.println(result);
	
     System.out.println("Query"+result);

	        status15 = stmt.executeUpdate(result);
			}
			else{
// Administrator User
String sqlPart1 = "UPDATE tbl_judical_detail SET ";
System.out.println("fgfdghfresult");
String strQueryRow1 = sqlPart1;
String strQueryRow2 = "Serial_number = '"+Serial_number+"', Detail_of_case = '"+Detail_of_case;
String strQueryRow3 = "',stakes_involved = '"+stakes_involved+"',nature_of_court = '"+nature_of_court+"',status ='"+status;
String strQueryRow4 = "',Detail_of_application ='"+Detail_of_application+"',Present_status_of_the_case ='"+Present_status_of_the_case;
String strQueryRow5 = "',cases_related_to ='"+cases_related_to+"',date_of_next_hearing =str_to_date('"+date_of_next_hearing+"','%d-%m-%Y'),expected_date_of_filing =str_to_date('"+expected_date_of_filing+"','%d-%m-%Y'),Affidavit_date_of_filing_CA =str_to_date('"+Affidavit_date_of_filing_CA+"','%d-%m-%Y'),year_of_case ="+year_of_case;
String strQueryRow6 =" WHERE Serial_number="+serial+" and months='"+months+"' and year="+years;
String result = strQueryRow1+strQueryRow2+strQueryRow3+strQueryRow4+strQueryRow5+strQueryRow6;
		System.out.println(result);
		
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
