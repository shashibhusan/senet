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



String esdp3 = request.getParameter("esdp3");
String edp3 = request.getParameter("edp3");
String bsdp3 = request.getParameter("bsdp3");
String mdp3 = request.getParameter("mdp3");
String sdp3 = request.getParameter("sdp3");
String imc3 = request.getParameter("imc3");
String other3 = request.getParameter("other3");

String esdp2 = request.getParameter("esdp2");
String edp2 = request.getParameter("edp2");
String bsdp2 = request.getParameter("bsdp2");
String mdp2 = request.getParameter("mdp2");
String sdp2 = request.getParameter("sdp2");
String imc2 = request.getParameter("imc2");
String other2 = request.getParameter("other2");

String esdp4 = request.getParameter("esdp4");
String edp4 = request.getParameter("edp4");
String bsdp4 = request.getParameter("bsdp4");
String mdp4 = request.getParameter("mdp4");
String sdp4 = request.getParameter("sdp4");
String imc4 = request.getParameter("imc4");
String other4 = request.getParameter("other4");

String esdp5 = request.getParameter("esdp5");
String edp5 = request.getParameter("edp5");
String bsdp5 = request.getParameter("bsdp5");
String mdp5 = request.getParameter("mdp5");
String sdp5 = request.getParameter("sdp5");
String imc5 = request.getParameter("imc5");
String other5 = request.getParameter("other5");

String esdp1 = request.getParameter("esdp1");
String edp1 = request.getParameter("edp1");
String bsdp1 = request.getParameter("bsdp1");
String mdp1 = request.getParameter("mdp1");
String sdp1 = request.getParameter("sdp1");
String imc1 = request.getParameter("imc1");
String other1 = request.getParameter("other1");
String user_date = request.getParameter("user_date");

String userAction = request.getParameter("submit");
if(userAction.equalsIgnoreCase("Add")){
String sqlPart1 = "insert into tbl_esdp(InstId, months, year, esdp2, esdp3, edp2, edp3, bsdp2, bsdp3, mdp2, mdp3, sdp2, sdp3, imc2, imc3, other2, other3, user_date, esdp4, esdp5, edp4, edp5, bsdp4, bsdp5, mdp4, mdp5,sdp4, sdp5, imc4, imc5, other4, other5 ,esdp1, edp1, bsdp1, mdp1, sdp1, imc1, other1) values ( ";
String strQueryRow3 = sqlPart1+"'"+instId+"',"+months+","+years+"";
String strQueryRow4 = ","+esdp2+","+esdp3+","+edp2+","+edp3+","+bsdp2+","+bsdp3+","+mdp2+","+mdp3+","+sdp2+","+sdp3+","+imc2+","+imc3+","+other2+","+other3+",'"+user_date+"'";
String strQueryRow5 = ","+esdp4+","+esdp5+","+edp4+","+edp5+","+bsdp4+","+bsdp5+","+mdp4+","+mdp5+","+sdp4+","+sdp5+","+imc4+","+imc5+","+other4+","+other5+","+esdp1+","+edp1+","+bsdp1+","+mdp1+","+sdp1+","+imc1+","+other1+")";
String result =strQueryRow3+strQueryRow4+strQueryRow5;
		System.out.println(result);
	
     System.out.println("Query"+result);

	        status15 = stmt.executeUpdate(result);
			}
			else{
// Administrator User
String sqlPart1 = "UPDATE tbl_esdp SET ";
String strQueryRow1 = sqlPart1;
String strQueryRow2 = "esdp2 = "+esdp2+", esdp3 = "+esdp3+",edp2 = "+edp2+",edp3 = "+edp3+",bsdp2 = "+bsdp2+",bsdp3 = "+bsdp3;
String strQueryRow3 = ",mdp2 = "+mdp2+", mdp3 = "+mdp3+",sdp2 = "+sdp2+",sdp3 = "+sdp3+",imc2 = "+imc2+",imc3 = "+imc3;
String strQueryRow4 = ",other2 = "+other2+", other3 = "+other3+",esdp4 = "+esdp4+",esdp5 = "+esdp5+",edp4 = "+edp4+",edp5 = "+edp5;
String strQueryRow5 = ",bsdp4 = "+bsdp4+", bsdp5 = "+bsdp5+",mdp4 = "+mdp4+",mdp5 = "+mdp5+",sdp4 = "+sdp4+",sdp5 = "+sdp5;
String strQueryRow6 = ",imc4 = "+imc4+", imc5 = "+imc5+",other4 = "+other4+",other5 = "+other5;
String strQueryRow7 = ",esdp1 = "+esdp1+", edp1 = "+edp1+",bsdp1 = "+bsdp1+",imc1 = "+imc1+",other1 = "+other1+",mdp1 = "+mdp1;
String strQueryRow8 =" WHERE InstId='"+instId+"' and months="+months+" and year="+years;
String result = strQueryRow1+strQueryRow2+strQueryRow3+strQueryRow4+strQueryRow5+strQueryRow6+strQueryRow7+strQueryRow8;
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
