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

String Sensitization_programme_wto_Programmes = request.getParameter("Sensitization_programme_wto_Programmes");
String Sensitization_programme_wto_Participants = request.getParameter("Sensitization_programme_wto_Participants");
String Awareness_Bio_Programmes = request.getParameter("Awareness_Bio_Programmes");
String Awareness_Bio_Participants = request.getParameter("Awareness_Bio_Participants");

String Exports_Programmes = request.getParameter("Exports_Programmes");
String Exports_Participants = request.getParameter("Exports_Participants");
String Bar_coding_Programmes = request.getParameter("Bar_coding_Programmes");
String Bar_coding_Participants = request.getParameter("Bar_coding_Participants");

String Cluster_Programmes = request.getParameter("Cluster_Programmes");
String Cluster_Participants = request.getParameter("Cluster_Participants");
String Awareness_TEQUP_Programmes = request.getParameter("Awareness_TEQUP_Programmes");
String Awareness_TEQUP_Participants = request.getParameter("Awareness_TEQUP_Participants");

String TEQUP_Programmes = request.getParameter("TEQUP_Programmes");
String TEQUP_Participants = request.getParameter("TEQUP_Participants");
String IPR_Programmes = request.getParameter("IPR_Programmes");
String IPR_Participants = request.getParameter("IPR_Participants");


String Awareness_CLCSS_Programmes = request.getParameter("Awareness_CLCSS_Programmes");
String Awareness_CLCSS_Participants = request.getParameter("Awareness_CLCSS_Participants");
String Seminar_VSBK_Programmes = request.getParameter("Seminar_VSBK_Programmes");
String Seminar_VSBK_Participants = request.getParameter("Seminar_VSBK_Participants");




String Sensitization_programme_wto_target = request.getParameter("Sensitization_programme_wto_target");
String Awareness_Bio_target = request.getParameter("Awareness_Bio_target");
String Exports_target = request.getParameter("Exports_target");
String Bar_coding_target = request.getParameter("Bar_coding_target");


String Cluster_target = request.getParameter("Cluster_target");
String TEQUP_target = request.getParameter("TEQUP_target");
String IPR_target = request.getParameter("IPR_target");
String Awareness_CLCSS_target = request.getParameter("Awareness_CLCSS_target");
String Seminar_VSBK_target = request.getParameter("Seminar_VSBK_target");
String Awareness_TEQUP_target = request.getParameter("Awareness_TEQUP_target");





String user_date = request.getParameter("user_date");

String userAction = request.getParameter("submit");
	if(userAction.equalsIgnoreCase("Add")){
	String sqlPart1 = "insert into tbl_special_program(InstId, months, year, Sensitization_programme_wto_Programmes, Sensitization_programme_wto_Participants, Awareness_Bio_Programmes, Awareness_Bio_Participants, Exports_Programmes, Exports_Participants, Bar_coding_Programmes, Bar_coding_Participants, Cluster_Programmes, Cluster_Participants, TEQUP_Programmes, TEQUP_Participants, IPR_Programmes, IPR_Participants, Awareness_TEQUP_Programmes, Awareness_TEQUP_Participants, Awareness_CLCSS_Programmes, Awareness_CLCSS_Participants, Seminar_VSBK_Programmes, Seminar_VSBK_Participants,Sensitization_programme_wto_target, Awareness_Bio_target, Exports_target, Bar_coding_target, Cluster_target, TEQUP_target, IPR_target, Awareness_TEQUP_target, Awareness_CLCSS_target, Seminar_VSBK_target ,user_date) values ( ";
String strQueryRow3 = sqlPart1+"'"+instId+"',"+months+","+years+"";
String strQueryRow4 = ","+Sensitization_programme_wto_Programmes+","+Sensitization_programme_wto_Participants+","+Awareness_Bio_Programmes+","+Awareness_Bio_Participants+","+Exports_Programmes+","+Exports_Participants+","+Bar_coding_Programmes+","+Bar_coding_Participants+","+Cluster_Programmes+","+Cluster_Participants+","+TEQUP_Programmes+","+TEQUP_Participants+","+IPR_Programmes+","+IPR_Participants+","+Awareness_TEQUP_Programmes+","+Awareness_TEQUP_Participants+","+Awareness_CLCSS_Programmes+","+Awareness_CLCSS_Participants+","+Seminar_VSBK_Programmes+","+Seminar_VSBK_Participants+" ,"+Sensitization_programme_wto_target+","+Awareness_Bio_target+","+Exports_target+","+Bar_coding_target+","+Cluster_target+","+TEQUP_target+","+IPR_target+","+Awareness_TEQUP_target+","+Awareness_CLCSS_target+","+Seminar_VSBK_target+",'"+user_date+"')";
String result =strQueryRow3+strQueryRow4;
		System.out.println(result);
	
     System.out.println("Query"+result);

	        status15 = stmt.executeUpdate(result);
			}
			else{
// Administrator User
String sqlPart1 = "UPDATE tbl_special_program SET ";
String strQueryRow1 = sqlPart1;
String strQueryRow2 = "Sensitization_programme_wto_Programmes = "+Sensitization_programme_wto_Programmes+", Sensitization_programme_wto_Participants = "+Sensitization_programme_wto_Participants+",Awareness_Bio_Programmes = "+Awareness_Bio_Programmes+",Awareness_Bio_Participants = "+Awareness_Bio_Participants+",Bar_coding_Programmes = "+Bar_coding_Programmes+",Bar_coding_Participants = "+Bar_coding_Participants;
String strQueryRow3 = ",Cluster_Programmes = "+Cluster_Programmes+", Cluster_Participants = "+Cluster_Participants+",TEQUP_Programmes = "+TEQUP_Programmes+",TEQUP_Participants = "+TEQUP_Participants+",IPR_Programmes = "+IPR_Programmes+",IPR_Participants = "+IPR_Participants;
String strQueryRow4 = ",Awareness_TEQUP_Programmes = "+Awareness_TEQUP_Programmes+", Awareness_TEQUP_Participants = "+Awareness_TEQUP_Participants+",Awareness_CLCSS_Programmes = "+Awareness_CLCSS_Programmes+",Awareness_CLCSS_Participants = "+Awareness_CLCSS_Participants+",Seminar_VSBK_Programmes = "+Seminar_VSBK_Programmes+",Sensitization_programme_wto_target = "+Sensitization_programme_wto_target+" ,Awareness_Bio_target = "+Awareness_Bio_target+" ,Exports_target = "+Exports_target+" ,Bar_coding_target = "+Bar_coding_target+" ,Cluster_target = "+Cluster_target+" ,TEQUP_target = "+TEQUP_target+" ,IPR_target = "+IPR_target+" ,Awareness_TEQUP_target = "+Awareness_TEQUP_target+" ,Awareness_CLCSS_target = "+Awareness_CLCSS_target+" ,Seminar_VSBK_target = "+Seminar_VSBK_target+" ,Seminar_VSBK_Participants = "+Seminar_VSBK_Participants;
String strQueryRow5 =" WHERE InstId='"+instId+"' and months="+months+" and year="+years;
String result = strQueryRow1+strQueryRow2+strQueryRow3+strQueryRow4+strQueryRow5;
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
