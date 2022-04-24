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

String instId = request.getParameter("instId");
String months = request.getParameter("months");
String years =request.getParameter("years");

String AMC_of_pc1 = request.getParameter("AMC_of_pc1");
String web1 = request.getParameter("web1");
String Connectivity1 = request.getParameter("Connectivity1");

String Contg1 = request.getParameter("Contg1");
String Others1 = request.getParameter("Others1");

String userAction = request.getParameter("submit");
	if(userAction.equalsIgnoreCase("Add")){
	String sqlPart1 = "insert into tbl_targetsenet(Inst_id,months ,year, AMC_of_pc1, web1, Connectivity1, Contg1, Others1) values ( ";
String strQueryRow3 = sqlPart1+"'"+instId+"',"+months+",'"+years+"'";
String strQueryRow4 = ","+AMC_of_pc1+","+web1+","+Connectivity1+"";
String strQueryRow5 = ","+Contg1+","+Others1+")";
String result =strQueryRow3+strQueryRow4+strQueryRow5;
		System.out.println(result);
	
     System.out.println("Query"+result);

	        status15 = stmt.executeUpdate(result);
			}
			else{
// Administrator User
String sqlPart1 = "UPDATE tbl_targetsenet SET ";
String strQueryRow1 = sqlPart1;
String strQueryRow2 = "AMC_of_pc1 = "+AMC_of_pc1+", web1 = "+web1+",Connectivity1 = "+Connectivity1;
String strQueryRow3 = ",Contg1 = "+Contg1+",Others1 = "+Others1;
String strQueryRow4 =" WHERE  year='"+years+"' and Inst_id='"+instId+"'" ;
String result = strQueryRow1+strQueryRow2+strQueryRow3+strQueryRow4;
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
