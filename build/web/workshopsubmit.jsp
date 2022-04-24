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
String No_Of_unit_benefitted = request.getParameter("No_Of_unit_benefitted");
String No_jobs_underTaken = request.getParameter("No_jobs_underTaken");
String No_Trainees_Trained = request.getParameter("No_Trainees_Trained");
String No_jobs_Completed = request.getParameter("No_jobs_Completed");
String No_units_Registered = request.getParameter("No_units_Registered");
String Capacity_Assessment = request.getParameter("Capacity_Assessment");
String workshop = request.getParameter("workshop");


String cum_No_Of_unit_benefitted = request.getParameter("cum_No_Of_unit_benefitted");
String cum_No_jobs_underTaken = request.getParameter("cum_No_jobs_underTaken");
String cum_No_Trainees_Trained = request.getParameter("cum_No_Trainees_Trained");
String cum_No_jobs_Completed = request.getParameter("cum_No_jobs_Completed");
String cum_No_units_Registered = request.getParameter("cum_No_units_Registered");
String cum_Capacity_Assessment = request.getParameter("cum_Capacity_Assessment");
String user_date = request.getParameter("user_date");


String userAction = request.getParameter("submit");
	if(userAction.equalsIgnoreCase("Add")){
	String sqlPart1 = "insert into tbl_workshop(Instid, months,year, No_Of_unit_benefitted, No_jobs_underTaken, No_Trainees_Trained, No_jobs_Completed, No_units_Registered, Capacity_Assessment, user_date, cum_No_Of_unit_benefitted, cum_No_jobs_underTaken, cum_No_Trainees_Trained, cum_No_jobs_Completed, cum_No_units_Registered, cum_Capacity_Assessment,target) values ( ";
String strQueryRow3 = sqlPart1+"'"+instId+"',"+months+","+years+"";
String strQueryRow4 = ","+No_Of_unit_benefitted+","+No_jobs_underTaken+","+No_Trainees_Trained+","+No_jobs_Completed+","+No_units_Registered+","+Capacity_Assessment+",'"+user_date+"'";
String strQueryRow5 = ","+cum_No_Of_unit_benefitted+","+cum_No_jobs_underTaken+","+cum_No_Trainees_Trained+","+cum_No_jobs_Completed+","+cum_No_units_Registered+","+cum_Capacity_Assessment+","+workshop+")";
String result =strQueryRow3+strQueryRow4+strQueryRow5;
		System.out.println(result);
	
     System.out.println("Query"+result);

	        status15 = stmt.executeUpdate(result);
			}
			else{
// Administrator User
String sqlPart1 = "UPDATE tbl_workshop SET ";
String strQueryRow1 = sqlPart1;
String strQueryRow2 = "No_Of_unit_benefitted = "+No_Of_unit_benefitted+", No_jobs_underTaken = "+No_jobs_underTaken+",No_Trainees_Trained = "+No_Trainees_Trained+",No_jobs_Completed = "+No_jobs_Completed+",No_units_Registered = "+No_units_Registered+",Capacity_Assessment = "+Capacity_Assessment;
String strQueryRow3 = ",cum_No_Of_unit_benefitted = "+cum_No_Of_unit_benefitted+", cum_No_jobs_underTaken = "+cum_No_jobs_underTaken+",target = "+workshop+",cum_No_Trainees_Trained = "+cum_No_Trainees_Trained+",cum_No_jobs_Completed = "+cum_No_jobs_Completed+",cum_No_units_Registered = "+cum_No_units_Registered+",cum_Capacity_Assessment = "+cum_Capacity_Assessment;
String strQueryRow4 =" WHERE InstId='"+instId+"' and months="+months+"  and year="+years;
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