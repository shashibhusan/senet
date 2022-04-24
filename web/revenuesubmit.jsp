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
String Common_total = request.getParameter("Common_total");
String sale_total = request.getParameter("sale_total");
String sdp_total = request.getParameter("sdp_total");
String edp_total = request.getParameter("edp_total");
String mdp_total = request.getParameter("mdp_total");

String Seminar_total = request.getParameter("Seminar_total");
String Capacity_total = request.getParameter("Capacity_total");
String Project_total = request.getParameter("Project_total");
String Sick_total = request.getParameter("Sick_total");

String Inplant_total = request.getParameter("Inplant_total");
String Surveys_total = request.getParameter("Surveys_total");
String Energy_total = request.getParameter("Energy_total");
String Accounts_total = request.getParameter("Accounts_total");
String cum_Common_total = request.getParameter("cum_Common_total");
String NSIC_total = request.getParameter("NSIC_total");
String sale_publication_total = request.getParameter("sale_publication_total");
String Information_total = request.getParameter("Information_total");
String others_total = request.getParameter("others_total");

String total = request.getParameter("total");
String cum_total = request.getParameter("cum_total");
String cum_Capacity_Assessment = request.getParameter("cum_Capacity_Assessment");
String user_date = request.getParameter("user_date");

String userAction = request.getParameter("submit");
	if(userAction.equalsIgnoreCase("Add")){
	String sqlPart1 = "insert into tbl_revenue(InstId, months, year, Common_total, sale_total, sdp_total, edp_total, mdp_total, Seminar_total, Capacity_total, Project_total, Sick_total, Inplant_total, Surveys_total, Energy_total, NSIC_total, sale_publication_total, Information_total, others_total, Accounts_total,user_date,cum_Common_total,total,cum_total) values ( ";
String strQueryRow3 = sqlPart1+"'"+instId+"',"+months+","+years+"";
String strQueryRow4 = ","+Common_total+","+sale_total+","+sdp_total+","+edp_total+","+mdp_total+","+Seminar_total+","+Capacity_total+","+Project_total+","+Sick_total+","+Inplant_total+","+Surveys_total+","+Energy_total+","+NSIC_total+","+sale_publication_total+","+Information_total+","+others_total+","+Accounts_total+",'"+user_date+"',"+cum_Common_total+","+total+","+cum_total+")";
String result =strQueryRow3+strQueryRow4;
		System.out.println(result);
	
     System.out.println("Query"+result);

	        status15 = stmt.executeUpdate(result);
			}
			else{
// Administrator User
String sqlPart1 = "UPDATE tbl_revenue SET ";
String strQueryRow1 = sqlPart1;
String strQueryRow2 = "Common_total="+Common_total+", sale_total = "+sale_total+",sdp_total = "+sdp_total+",edp_total = "+edp_total+",mdp_total = "+mdp_total+",Seminar_total = "+Seminar_total;
String strQueryRow3 = ",Capacity_total = "+Capacity_total+", Project_total = "+Project_total+",Sick_total = "+Sick_total+",Inplant_total = "+Inplant_total+",Surveys_total = "+Surveys_total+",Energy_total = "+Energy_total;
String strQueryRow4 = ",NSIC_total = "+NSIC_total+", sale_publication_total = "+sale_publication_total+",Information_total = "+Information_total+",others_total = "+others_total+",Accounts_total = "+Accounts_total+",cum_Common_total = "+cum_Common_total;
String strQueryRow5 = ",total = "+total+", cum_total = "+cum_total;
String strQueryRow6 =" WHERE InstId='"+instId+"' and  months="+months+" and year="+years;
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