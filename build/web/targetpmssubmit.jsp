
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

String instId = request.getParameter("instId1");
String months = request.getParameter("months");
String years =request.getParameter("years1");

String esdp = request.getParameter("esdp");
String edp = request.getParameter("edp");
String bsdp = request.getParameter("bsdp");
String mdp = request.getParameter("mdp");
String sdp = request.getParameter("sdp");
String imc = request.getParameter("imc");
String other = request.getParameter("other");
String vdp = request.getParameter("vdp");


String project_new = request.getParameter("project_new");
String project_updated = request.getParameter("project_updated");
String state_industrial = request.getParameter("state_industrial");
String survey = request.getParameter("survey");
String status_report = request.getParameter("status_report");
String technology_study = request.getParameter("technology_study");


String trade = request.getParameter("trade");
String Training_programmes = request.getParameter("Training_programmes");
String identification = request.getParameter("identification");
String detail_of_projects = request.getParameter("detail_of_projects");
String Sensitization_wto = request.getParameter("Sensitization_wto");
String Awareness_bio = request.getParameter("Awareness_bio");
String Programmes_Packaging = request.getParameter("Programmes_Packaging");
String Programmes_bar = request.getParameter("Programmes_bar");
String Awareness_cluster = request.getParameter("Awareness_cluster");
String TEQUP = request.getParameter("TEQUP");
String Awareness_tequp = request.getParameter("Awareness_tequp");
String Sensitization_ipr = request.getParameter("Sensitization_ipr");
String seminar_on_vsbk = request.getParameter("seminar_on_vsbk");


String Indl_Potenial = request.getParameter("Indl_Potenial");
String workshop = request.getParameter("workshop");
System.out.println("gfggfgfdworkshp"+workshop);










String userAction = request.getParameter("submit");
	if(userAction.equalsIgnoreCase("Add")){
	String sqlPart1 = "insert into tbl_pms_target( inst_id,year, esdp, edp, bsdp, mdp, sdp, imc, other, vdp, project_new, project_updated, state_industrial, survey, status_report, technology_study, trade,identification, Training_programmes, detail_of_projects, Sensitization_wto, Awareness_bio, Programmes_Packaging, Programmes_bar, Awareness_cluster, TEQUP, Sensitization_ipr, Awareness_tequp,seminar_on_vsbk,Indl_Potenial,workshop) values ( ";
String strQueryRow3 = sqlPart1+"'"+instId+"',"+years+"";
String strQueryRow4 = ","+esdp+","+edp+","+bsdp+","+mdp+","+sdp+","+imc+","+other+","+vdp+","+project_new+","+project_updated+","+state_industrial+","+survey+","+status_report+","+technology_study+","+trade+","+identification+","+Training_programmes+","+detail_of_projects+","+Sensitization_wto+","+Awareness_bio+","+Programmes_Packaging+","+Programmes_bar+","+Awareness_cluster+","+TEQUP+","+Sensitization_ipr+","+Awareness_tequp+","+seminar_on_vsbk+","+Indl_Potenial+","+workshop+")";
String result =strQueryRow3+strQueryRow4;
		System.out.println(result);
	
     System.out.println("Query"+result);

	        status15 = stmt.executeUpdate(result);
			}
			else{
// Administrator User
String sqlPart1 = "UPDATE tbl_pms_target SET ";
String strQueryRow1 = sqlPart1;
String strQueryRow2 = "esdp = "+esdp+", edp = "+edp+",bsdp = "+bsdp+",mdp = "+mdp+",sdp = "+sdp+",imc = "+imc;
String strQueryRow3 = ",other = "+other+", vdp = "+vdp+",project_new = "+project_new+",project_updated = "+project_updated+",state_industrial = "+state_industrial+",survey = "+survey;
String strQueryRow4 = ",status_report = "+status_report+", technology_study = "+technology_study+",trade = "+trade+",identification = "+identification+",Training_programmes = "+Training_programmes+",detail_of_projects = "+detail_of_projects;
String strQueryRow5 = ",Sensitization_wto = "+Sensitization_wto+", Awareness_bio = "+Awareness_bio+",Programmes_Packaging = "+Programmes_Packaging+",Programmes_bar = "+Programmes_bar+",Awareness_cluster = "+Awareness_cluster+",TEQUP = "+TEQUP;
String strQueryRow6 = ",Sensitization_ipr = "+Sensitization_ipr+", Awareness_tequp = "+Awareness_tequp+",seminar_on_vsbk = "+seminar_on_vsbk+",Indl_Potenial = "+Indl_Potenial+",workshop = "+workshop;
String strQueryRow7 =" WHERE year='"+years+"' and  inst_id='"+instId+"'";
String result = strQueryRow1+strQueryRow2+strQueryRow3+strQueryRow4+strQueryRow5+strQueryRow6+strQueryRow7;
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
