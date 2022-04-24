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

String Totaltarget = request.getParameter("Totaltarget");

String vdp_conducted = request.getParameter("vdp_conducted");
String unit_participated = request.getParameter("unit_participated");
String Amount_Disbursed = request.getParameter("Amount_Disbursed");


String SVDPvdp_conducted = request.getParameter("SVDPvdp_conducted");
String SVDPunit_participated = request.getParameter("SVDPunit_participated");
String SVDPAmount_Disbursed = request.getParameter("SVDPAmount_Disbursed");





String cum_vdp_conducted = request.getParameter("cum_vdp_conducted");
String cum_unit_participated = request.getParameter("cum_unit_participated");
String cum_Amount_Disbursed = request.getParameter("cum_Amount_Disbursed");


String SVDPcum_vdp_conducted = request.getParameter("SVDPcum_vdp_conducted");
String SVDPcum_unit_participated = request.getParameter("SVDPcum_unit_participated");
String SVDPcum_Amount_Disbursed = request.getParameter("SVDPcum_Amount_Disbursed");
String user_date = request.getParameter("user_date");





String userAction = request.getParameter("submit");
	if(userAction.equalsIgnoreCase("Add")){
	String sqlPart1 = "insert into tbl_vendor(InstId, months, year, vdp_conducted, unit_participated, Amount_Disbursed, SVDPvdp_conducted, SVDPunit_participated, SVDPAmount_Disbursed, user_date, cum_vdp_conducted, cum_unit_participated, cum_Amount_Disbursed, SVDPcum_vdp_conducted, SVDPcum_unit_participated, SVDPcum_Amount_Disbursed,Totaltarget) values ( ";
String strQueryRow3 = sqlPart1+"'"+instId+"',"+months+","+years+"";
String strQueryRow4 = ","+vdp_conducted+","+unit_participated+","+Amount_Disbursed+"";
String strQueryRow5 = ","+SVDPvdp_conducted+","+SVDPunit_participated+","+SVDPAmount_Disbursed+",'"+user_date+"'";
String strQueryRow6 = ","+cum_vdp_conducted+","+cum_unit_participated+","+cum_Amount_Disbursed+"";
String strQueryRow7 = ","+SVDPcum_vdp_conducted+","+SVDPcum_unit_participated+","+SVDPcum_Amount_Disbursed+","+Totaltarget+")";



String result =strQueryRow3+strQueryRow4+strQueryRow5+strQueryRow6+strQueryRow7;
		System.out.println(result);
	
     System.out.println("Query"+result);

	        status15 = stmt.executeUpdate(result);
			}
			else{
// Administrator User
String sqlPart1 = "UPDATE tbl_vendor SET ";
String strQueryRow1 = sqlPart1;
String strQueryRow2 = "vdp_conducted = "+vdp_conducted+", unit_participated = "+unit_participated+",SVDPvdp_conducted = "+SVDPvdp_conducted+",SVDPunit_participated = "+SVDPunit_participated+",SVDPAmount_Disbursed = "+SVDPAmount_Disbursed+",Amount_Disbursed = "+Amount_Disbursed;
String strQueryRow3 = ",Totaltarget = "+Totaltarget+" ,cum_vdp_conducted = "+cum_vdp_conducted+", cum_unit_participated = "+cum_unit_participated+",cum_Amount_Disbursed = "+cum_Amount_Disbursed+",SVDPcum_unit_participated = "+SVDPcum_unit_participated+",SVDPAmount_Disbursed = "+SVDPAmount_Disbursed+",SVDPcum_Amount_Disbursed = "+SVDPcum_Amount_Disbursed;
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
<%}%>
<%

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
