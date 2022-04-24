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

String fund_release_mda = request.getParameter("fund_release_mda");
String target_release_mda = request.getParameter("target_release_mda");
String Exp_mda = request.getParameter("Exp_mda");
String MSEs_mda = request.getParameter("MSEs_mda");
String Cumm_exp_mda = request.getParameter("Cumm_exp_mda");
String Cumm_MSEs_mda = request.getParameter("Cumm_MSEs_mda");

String fund_release_nmcp = request.getParameter("fund_release_nmcp");
String target_release_nmcp = request.getParameter("target_release_nmcp");
String Exp_nmcp = request.getParameter("Exp_nmcp");
String MSEs_nmcp = request.getParameter("MSEs_nmcp");
String Cumm_exp_nmcp = request.getParameter("Cumm_exp_nmcp");
String Cumm_MSEs_nmcp = request.getParameter("Cumm_MSEs_nmcp");

String fund_release_nmcp_seminar = request.getParameter("fund_release_nmcp_seminar");
String target_release_nmcp_seminar = request.getParameter("target_release_nmcp_seminar");
String Exp_nmcp_seminar = request.getParameter("Exp_nmcp_seminar");
String MSEs_nmcp_seminar = request.getParameter("MSEs_nmcp_seminar");
String Cumm_exp_nmcp_seminar = request.getParameter("Cumm_exp_nmcp_seminar");
String Cumm_MSEs_nmcp_seminar = request.getParameter("Cumm_MSEs_nmcp_seminar");
   
	
	
	
	 String userAction = request.getParameter("submit");
	if(userAction.equalsIgnoreCase("Add")){
	String sqlPart1 = "insert into tbl_ssi_mda( inst_id, months, year, fund_release_mda, target_release_mda, Exp_mda, MSEs_mda, Cumm_exp_mda, Cumm_MSEs_mda, fund_release_nmcp, target_release_nmcp, Exp_nmcp, MSEs_nmcp, Cumm_exp_nmcp, Cumm_MSEs_nmcp, fund_release_nmcp_seminar, target_release_nmcp_seminar, Exp_nmcp_seminar, MSEs_nmcp_seminar, Cumm_exp_nmcp_seminar, Cumm_MSEs_nmcp_seminar,user_date) values ( ";
	

String strQueryRow3 = sqlPart1+"'"+instId+"','"+months+"',"+years+"";
String strQueryRow4 = ","+fund_release_mda+","+target_release_mda+","+Exp_mda+","+MSEs_mda+","+Cumm_exp_mda+","+Cumm_MSEs_mda+","+fund_release_nmcp+","+target_release_nmcp+","+Exp_nmcp+","+MSEs_nmcp+","+Cumm_exp_nmcp+","+Cumm_MSEs_nmcp+","+fund_release_nmcp_seminar+","+target_release_nmcp_seminar+","+Exp_nmcp_seminar+","+MSEs_nmcp_seminar+","+Cumm_exp_nmcp_seminar+","+Cumm_MSEs_nmcp_seminar+",'"+years+"-"+months+"-20')";
String result =strQueryRow3+strQueryRow4;
		System.out.println(result);
	
     System.out.println("Query"+result);

	        status15 = stmt.executeUpdate(result);
			}
			else{
// Administrator User
String sqlPart1 = "UPDATE tbl_ssi_mda SET ";
String strQueryRow1 = sqlPart1;
String strQueryRow2 = "fund_release_mda = "+fund_release_mda+", target_release_mda = "+target_release_mda;
String strQueryRow3 = ",Exp_mda = "+Exp_mda+",MSEs_mda ="+MSEs_mda+",Cumm_exp_mda ="+Cumm_exp_mda;
String strQueryRow4 = ",Cumm_MSEs_mda = "+Cumm_MSEs_mda+",fund_release_nmcp ="+fund_release_nmcp+",target_release_nmcp ="+target_release_nmcp;
String strQueryRow5 = ",Exp_nmcp = "+Exp_nmcp+",MSEs_nmcp ="+MSEs_nmcp+",Cumm_exp_nmcp ="+Cumm_exp_nmcp;
String strQueryRow6 = ",Cumm_MSEs_nmcp = "+Cumm_MSEs_nmcp+",fund_release_nmcp_seminar ="+fund_release_nmcp_seminar+",target_release_nmcp_seminar ="+target_release_nmcp_seminar;
String strQueryRow7 = ",Exp_nmcp_seminar = "+Exp_nmcp_seminar+",MSEs_nmcp_seminar ="+MSEs_nmcp_seminar+",Cumm_exp_nmcp_seminar ="+Cumm_exp_nmcp_seminar;
String strQueryRow8 = ",Cumm_MSEs_nmcp_seminar ="+Cumm_MSEs_nmcp_seminar;
String strQueryRow9 =" WHERE inst_id='"+instId+"' and months='"+months+"' and year="+years;
String result = strQueryRow1+strQueryRow2+strQueryRow3+strQueryRow4+strQueryRow5+strQueryRow6+strQueryRow7+strQueryRow8+strQueryRow9;
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
