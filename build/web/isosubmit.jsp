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

String GENERALappication_received_during_month = request.getParameter("GENERALappication_received_during_month");
String GENERALappication_disburded_during_month = request.getParameter("GENERALappication_disburded_during_month");
String GENERALamount_disburded_during_month = request.getParameter("GENERALamount_disburded_during_month");

String NERappication_received_during_month = request.getParameter("NERappication_received_during_month");
String NERappication_disburded_during_month = request.getParameter("NERappication_disburded_during_month");
String NERamount_disburded_during_month = request.getParameter("NERamount_disburded_during_month");

String SCPappication_received_during_month = request.getParameter("SCPappication_received_during_month");
String SCPappication_disburded_during_month = request.getParameter("SCPappication_disburded_during_month");
String SCPamount_disburded_during_month = request.getParameter("SCPamount_disburded_during_month");

String TSPappication_received_during_month = request.getParameter("TSPappication_received_during_month");
String TSPappication_disburded_during_month = request.getParameter("TSPappication_disburded_during_month");
String TSPamount_disburded_during_month = request.getParameter("TSPamount_disburded_during_month");










String TSPamount_disburded_upto_month = request.getParameter("TSPamount_disburded_upto_month");
String TSPappication_disburded_upto_month = request.getParameter("TSPappication_disburded_upto_month");
String TSPappication_received_upto_month = request.getParameter("TSPappication_received_upto_month");

String SCPappication_received_upto_month = request.getParameter("SCPappication_received_upto_month");
String SCPappication_disburded_upto_month = request.getParameter("SCPappication_disburded_upto_month");
String SCPamount_disburded_upto_month = request.getParameter("SCPamount_disburded_upto_month");

String NERappication_received_upto_month = request.getParameter("NERappication_received_upto_month");
String NERappication_disburded_upto_month = request.getParameter("NERappication_disburded_upto_month");
String NERamount_disburded_upto_month = request.getParameter("NERamount_disburded_upto_month");

String GENERALappication_received_upto_month = request.getParameter("GENERALappication_received_upto_month");
String GENERALappication_disburded_upto_month = request.getParameter("GENERALappication_disburded_upto_month");
String GENERALamount_disburded_upto_month = request.getParameter("GENERALamount_disburded_upto_month");
String user_date = request.getParameter("user_date");





String userAction = request.getParameter("submit");
	if(userAction.equalsIgnoreCase("Add")){
	String sqlPart1 = "insert into tbl_iso(Inst_id, months, year, GENERALappication_received_during_month, GENERALappication_disburded_during_month, GENERALamount_disburded_during_month, NERappication_received_during_month, NERappication_disburded_during_month, NERamount_disburded_during_month, SCPappication_received_during_month, SCPappication_disburded_during_month, SCPamount_disburded_during_month, TSPappication_received_during_month, TSPappication_disburded_during_month, TSPamount_disburded_during_month, user_date, GENERALappication_received_upto_month, GENERALappication_disburded_upto_month, GENERALamount_disburded_upto_month, NERappication_received_upto_month, NERappication_disburded_upto_month, NERamount_disburded_upto_month, SCPappication_received_upto_month, SCPappication_disburded_upto_month, SCPamount_disburded_upto_month, TSPappication_received_upto_month, TSPappication_disburded_upto_month, TSPamount_disburded_upto_month) values ( ";
String strQueryRow3 = sqlPart1+"'"+instId+"',"+months+","+years+"";
String strQueryRow4 = ","+GENERALappication_received_during_month+","+GENERALappication_disburded_during_month+","+GENERALamount_disburded_during_month+"";
String strQueryRow5 = ","+NERappication_received_during_month+","+NERappication_disburded_during_month+","+NERamount_disburded_during_month+"";
String strQueryRow6 = ","+SCPappication_received_during_month+","+SCPappication_disburded_during_month+","+SCPamount_disburded_during_month+"";
String strQueryRow7 = ","+TSPappication_received_during_month+","+TSPappication_disburded_during_month+","+TSPamount_disburded_during_month+",'"+user_date+"'";
String strQueryRow8 = ","+GENERALappication_received_upto_month+","+GENERALappication_disburded_upto_month+","+GENERALamount_disburded_upto_month+"";
String strQueryRow9 = ","+NERappication_received_upto_month+","+NERappication_disburded_upto_month+","+NERamount_disburded_upto_month+"";
String strQueryRow10 = ","+SCPappication_received_upto_month+","+SCPappication_disburded_upto_month+","+SCPamount_disburded_upto_month+"";
String strQueryRow11 = ","+TSPappication_received_upto_month+","+TSPappication_disburded_upto_month+","+TSPamount_disburded_upto_month+")";





String result =strQueryRow3+strQueryRow4+strQueryRow5+strQueryRow6+strQueryRow7+strQueryRow8+strQueryRow9+strQueryRow10+strQueryRow11;
		System.out.println(result);
	
     System.out.println("Query"+result);

	        status15 = stmt.executeUpdate(result);
			}
			else{
// Administrator User
String sqlPart1 = "UPDATE tbl_iso SET ";
String strQueryRow1 = sqlPart1;
String strQueryRow2 = "GENERALappication_received_during_month = "+GENERALappication_received_during_month+", GENERALappication_disburded_during_month = "+GENERALappication_disburded_during_month+",GENERALamount_disburded_during_month = "+GENERALamount_disburded_during_month+",NERappication_received_during_month = "+NERappication_received_during_month+",NERappication_disburded_during_month = "+NERappication_disburded_during_month+",NERamount_disburded_during_month = "+NERamount_disburded_during_month;
String strQueryRow3 = ",SCPappication_received_during_month = "+SCPappication_received_during_month+", SCPappication_disburded_during_month = "+SCPappication_disburded_during_month+",SCPamount_disburded_during_month = "+SCPamount_disburded_during_month+",TSPappication_received_during_month = "+TSPappication_received_during_month+",TSPappication_disburded_during_month = "+TSPappication_disburded_during_month+",TSPamount_disburded_during_month = "+TSPamount_disburded_during_month;
String strQueryRow4 = ",GENERALappication_received_upto_month = "+GENERALappication_received_upto_month+", GENERALappication_disburded_upto_month = "+GENERALappication_disburded_upto_month+",GENERALamount_disburded_upto_month = "+GENERALamount_disburded_upto_month+",NERappication_received_upto_month = "+NERappication_received_upto_month+",NERappication_disburded_upto_month = "+NERappication_disburded_upto_month+",NERamount_disburded_upto_month = "+NERamount_disburded_upto_month;
String strQueryRow5 = ",SCPappication_received_upto_month = "+SCPappication_received_upto_month+", SCPappication_disburded_upto_month = "+SCPappication_disburded_upto_month+",SCPamount_disburded_upto_month = "+SCPamount_disburded_upto_month+",TSPappication_received_upto_month = "+TSPappication_received_upto_month+",TSPappication_disburded_upto_month = "+TSPappication_disburded_upto_month+",TSPamount_disburded_upto_month = "+TSPamount_disburded_upto_month;
String strQueryRow6 =" WHERE Inst_id='"+instId+"' and  months="+months+" and year="+years;
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