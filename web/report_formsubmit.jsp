<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
</head>

<body>
	<%
	int status=0;
	Connection con = null;
	Statement stmt = null;
	try
	{
	
	 con = ConnectionManager.getConnectionDirectForMySQL();
	 stmt = (Statement)con.createStatement();
	System.out.println("Call");
	 int status15=0;
	 int sno=1;

String instId = request.getParameter("instId");
String months = request.getParameter("months");
String years =request.getParameter("years");

String Monthly_Achievment_new = request.getParameter("Monthly_Achievment_new");
String Monthly_Achievment_updated = request.getParameter("Monthly_Achievment_updated");
String state_industrial_Achievment = request.getParameter("state_industrial_Achievment");
String Survey_Report_Achievment = request.getParameter("Survey_Report_Achievment");

String Status_Report_Achievment = request.getParameter("Status_Report_Achievment");
String Technology_Study_Achievment = request.getParameter("Technology_Study_Achievment");
String Trade_Directories_Achievment = request.getParameter("Trade_Directories_Achievment");

String Training_Programme_Achievment = request.getParameter("Training_Programme_Achievment");
String Distict_Potenial_Achievment = request.getParameter("Distict_Potenial_Achievment");
String Detail_Project_Achievment = request.getParameter("Detail_Project_Achievment");



String cum_Monthly_Achievment_new = request.getParameter("cum_Monthly_Achievment_new");
String cum_Monthly_Achievment_updated = request.getParameter("cum_Monthly_Achievment_updated");
String user_date = request.getParameter("user_date");




String Project_Profiles_target_new = request.getParameter("Project_Profiles_target_new");
String Project_Profiles_target_updated = request.getParameter("Project_Profiles_target_updated");
String state_industrial_target = request.getParameter("state_industrial_target");
String Distict_Potenial_target = request.getParameter("Distict_Potenial_target");

String Survey_Report_target = request.getParameter("Survey_Report_target");
String Status_Report_target = request.getParameter("Status_Report_target");
String Technology_Study_target = request.getParameter("Technology_Study_target");

String Trade_Directories_target = request.getParameter("Trade_Directories_target");
String Training_Programme_target = request.getParameter("Training_Programme_target");
String Detail_Project_target = request.getParameter("Detail_Project_target");







String userAction = request.getParameter("submit");
	if(userAction.equalsIgnoreCase("Add")){
	String sqlPart1 = "insert into tbl_report(InstId, months, year, Monthly_Achievment_new, Monthly_Achievment_updated, state_industrial_Achievment, Survey_Report_Achievment, Status_Report_Achievment, Technology_Study_Achievment, Trade_Directories_Achievment, Training_Programme_Achievment,Detail_Project_Achievment,Distict_Potenial_Achievment,user_date,cum_Monthly_Achievment_new,cum_Monthly_Achievment_updated,Project_Profiles_target_new, Project_Profiles_target_updated, state_industrial_target, Distict_Potenial_target, Survey_Report_target, Status_Report_target,Technology_Study_target, Trade_Directories_target,Training_Programme_target, Detail_Project_target) values ( ";
String strQueryRow3 = sqlPart1+"'"+instId+"',"+months+","+years+"";
String strQueryRow4 = ","+Monthly_Achievment_new+","+Monthly_Achievment_updated+","+state_industrial_Achievment+","+Survey_Report_Achievment+","+Status_Report_Achievment+","+Technology_Study_Achievment+","+Trade_Directories_Achievment+","+Training_Programme_Achievment+","+Detail_Project_Achievment+","+Distict_Potenial_Achievment+",'"+user_date+"',"+cum_Monthly_Achievment_new+","+cum_Monthly_Achievment_updated+","+Project_Profiles_target_new+","+Project_Profiles_target_updated+","+state_industrial_target+","+Distict_Potenial_target+","+Survey_Report_target+","+Status_Report_target+","+Technology_Study_target+","+Trade_Directories_target+","+Training_Programme_target+","+Detail_Project_target+")";
String result =strQueryRow3+strQueryRow4;
		System.out.println(result);
	
     System.out.println("Query"+result);

	        status15 = stmt.executeUpdate(result);
			}
			else{
// Administrator User
String sqlPart1 = "UPDATE tbl_report SET ";
String strQueryRow1 = sqlPart1;
String strQueryRow2 = "Monthly_Achievment_new = "+Monthly_Achievment_new+", Monthly_Achievment_updated = "+Monthly_Achievment_updated+",state_industrial_Achievment = "+state_industrial_Achievment+",Survey_Report_Achievment = "+Survey_Report_Achievment+",Status_Report_Achievment = "+Status_Report_Achievment+",Technology_Study_Achievment = "+Technology_Study_Achievment;
String strQueryRow3 = ",Trade_Directories_Achievment = "+Trade_Directories_Achievment+", Training_Programme_Achievment = "+Training_Programme_Achievment+",Detail_Project_Achievment = "+Detail_Project_Achievment+",Distict_Potenial_Achievment = "+Distict_Potenial_Achievment+",cum_Monthly_Achievment_new = "+cum_Monthly_Achievment_new+",cum_Monthly_Achievment_updated = "+cum_Monthly_Achievment_updated+" ,Project_Profiles_target_new = "+Project_Profiles_target_new+",Project_Profiles_target_updated = "+Project_Profiles_target_updated+",state_industrial_target = "+state_industrial_target+",Distict_Potenial_target = "+Distict_Potenial_target+",Survey_Report_target = "+Survey_Report_target+",Status_Report_target = "+Status_Report_target+",Technology_Study_target = "+Technology_Study_target+",Trade_Directories_target = "+Trade_Directories_target+",Training_Programme_target = "+Training_Programme_target+",Detail_Project_target = "+Detail_Project_target;
String strQueryRow4 =" WHERE InstId='"+instId+"' and  months="+months+" and year="+years;
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
<%}

}// end try
		catch(SQLException e){
			//e.printStackTrace();
			int eCode = e.getErrorCode();
			String eMsg  =e.getMessage();
			System.out.println(" SQLException = "+e.getErrorCode()+" = "+e.getMessage());
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
		finally{
			stmt=null;
			con.close();
	}





%>
</body>
</html>
