
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
</head>

<body>
<%

int status = 0;
try{
	//Connection con = ConnectionManager.getConnectionDirect();
	Connection con = ConnectionManager.getConnectionDirectForMySQL();
	Statement stmt = (Statement)con.createStatement();
	Statement stmt_sno = (Statement)con.createStatement();
	ResultSet rsSno = null;
	
	String strQuery=null;
	
		String sno= "1";
	String instId = request.getParameter("instId");
	String months = request.getParameter("months");
	String years =request.getParameter("years");
	
	
	
	String ID_NO= request.getParameter("a_1");
	String PROGRAM_NAME=request.getParameter("b_1");
	String PROGRAM_DIV=request.getParameter("c_1");
	String PROGRAM_TYPE= request.getParameter("d_1");
	String YEARLY_TARGET= request.getParameter("e_1");
	String TARGET_REPORT_MONTH=request.getParameter("f_1");
	String ACHIV_REPORT_MONTH=request.getParameter("g_1");
	
System.out.println("Submit = "+request.getParameter("submit"));  
 String userAction = request.getParameter("submit");
if(userAction.equalsIgnoreCase("Add")){ 
System.out.println("(userAction = ");  
int j=0;
int k=0;
k=Integer.parseInt(sno);
for (int i=1;i<=17;i++){
j= k;
String sqlPart1 = "INSERT INTO  tbl_revenue_branch(instId, months, years, msmedi, branch1,branch2,branch3,name,branch4) values('"+instId+"', '"+months+"', "+years+", "+request.getParameter("a_"+i)+", "+request.getParameter("b_"+i)+", "+request.getParameter("c_"+i)+"  , "+request.getParameter("d_"+i)+" ,'"+request.getParameter("h_"+i)+"', "+request.getParameter("e_"+i)+") ";
String result = sqlPart1;
System.out.println("ANNCCresult="+result);	  
status = stmt.executeUpdate(result);
k=j+1;
System.out.println("result="+result);

}

}
else {
int j=0;
int k=0;
k=Integer.parseInt(sno);				
for (int i=1;i<=17;i++){
j= k;
System.out.println("dfgggggggggggggggggggggggggggggggggggggggggggggg"); 
System.out.println("result");
// Administrator User
String sqlPart1 = "UPDATE tbl_revenue_branch SET ";
String strQueryRow1 = sqlPart1;
String strQueryRow2 = "instId = '"+instId+"',months ='"+months+"',years = "+years;
String strQueryRow3 = ",msmedi ="+request.getParameter("a_"+i)+" ,branch1 ="+request.getParameter("b_"+i)+",branch2 ="+request.getParameter("c_"+i)+",branch3 ="+request.getParameter("d_"+i)+",branch4 ="+request.getParameter("e_"+i);
String strQueryRow4=" WHERE instId = '"+instId+"'AND name ='"+request.getParameter("h_"+i)+"' and months='"+months+"' AND years="+years ;

String result =strQueryRow1+strQueryRow2+strQueryRow3+strQueryRow4;
		System.out.println(result);
        status = stmt.executeUpdate(result);
		//System.out.println("result="+result);
		}
		}
//-----------------------------------------------		
		con.commit();
		con.close();
		System.out.println("Query Executed");
		
}// End of Try
catch(SQLException e){
			//e.printStackTrace();
			System.out.println(" SQLException = "+e.getErrorCode()+" = "+e.getMessage());
			int eCode = e.getErrorCode();
			String eMsg  =e.getMessage();
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
<% } %>
<%if(status==1){%>
<jsp:forward page="status.jsp?status=TRUE"></jsp:forward>
<%}else{%>
<jsp:forward page="status.jsp?status=FALSE"></jsp:forward>
<%}%>


</body>
</html>
