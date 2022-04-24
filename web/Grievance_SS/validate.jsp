<%-- 
    Document   : EIS_ss_login_check
    Created on : May 18, 2018, 2:13:01 PM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@ page import="nl.captcha.Captcha"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>:: SS Login ::</title>
    </head>
    <%
 String username=request.getParameter("user");
 String pass=request.getParameter("password");
  int flag=0;

	String captcha = (String)session.getAttribute("key");
	request.setCharacterEncoding("UTF-8");
	String answer = request.getParameter("answer");
                                    long a = 4534545345345445L;
                                    String Random = Long.toString((long) (Math.random() * a));
                                    System.out.println("EIS_ss_login_check.jsp" + Random);
                                    session.setAttribute("email",username);
                                    session.setAttribute("Session", Random);


                                    System.out.println("username=="+username+"/password=="+pass);
	if (captcha.endsWith(answer)) {


            Connection con1=null;
            ResultSet rs1=null;


               try{
               con1 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt1 = con1.createStatement();
               String sql1="SELECT * FROM eis_ss_registration where email='"+username+"' ;";
               rs1=stmt1.executeQuery(sql1);
               while(rs1.next())
               {
               if( username.equals(rs1.getString("email")) && pass.equals(rs1.getString("password")) )
               {
               flag=1;
                           }
        }
con1.close();
}
catch(Exception e){
e.printStackTrace();
}
}
        else
        {
 %>
 <jsp:forward page="login.jsp" />
 <%
 	}

  if(flag==1)
  {%>
      <jsp:forward page="Grievance_Register.jsp" />
<%} else
{%>
<jsp:forward page="error.jsp?val=<%=Random%>" />
<%}


 %>

</html>
