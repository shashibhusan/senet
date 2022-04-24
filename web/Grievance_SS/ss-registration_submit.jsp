<%-- 
    Document   : ss-registration_submit
    Created on : May 16, 2018, 5:18:42 PM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="common.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Random" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
System.out.println("====page is working====");

String name=request.getParameter("val");
String email=request.getParameter("val1");
String dob=request.getParameter("val2");
String designation=request.getParameter("val3");
String curntofc=request.getParameter("val4");
String category=request.getParameter("val5");
String mobile=request.getParameter("val6");
String gender=request.getParameter("val7");
String pass=request.getParameter("val8");

SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Date date = new Date();
String time=dateFormat.format(date);

Random rand = new Random();
int num = rand.nextInt(9000000) + 1000000;

Connection con=null;
ResultSet res=null;
Statement stm=null;
String already_register="no";

try{
    con=ConnectionManager.getConnectionDirectForMySQL();
    stm=con.createStatement();
    String Query="select * from eis_ss_registration where email='"+email+"'";
    res=stm.executeQuery(Query);
    while(res.next())
        {
        already_register="yes";
        }
    con.close();
    }
catch(Exception ee){
    ee.printStackTrace();
    }



PreparedStatement psmt=null;
Connection connection = null;
String connectionURL = "jdbc:mysql://localhost:3306/mpr_dcmsme";

if(already_register.equalsIgnoreCase("no"))
    {
try{

connection = DriverManager.getConnection(connectionURL, "root", "220047");
psmt = connection.prepareStatement("insert into eis_ss_registration(name, email, dob, token, designation, inst_id, category, mobile, time, gender, password) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
psmt.setString(1, name);
psmt.setString(2, email);
psmt.setString(3, dob);
psmt.setInt(4, num);
psmt.setString(5, designation);
psmt.setString(6, curntofc);
psmt.setString(7, category);
psmt.setString(8, mobile);
psmt.setString(9, time);
psmt.setString(10, gender);
psmt.setString(11, pass);

int rs=psmt.executeUpdate();
if(rs>0)
    {
    System.out.println("Registration  done successfully.");
    out.println("1");
    }
else
    {
    System.out.println("There is some Problem in registration . Please try again..");
    out.println("2");
    }
}
catch(Exception error)
        {
    error.printStackTrace();
    System.out.println("Error is ::"+error);
    }
}else
    {
    System.out.println("This Email is already registered. Please try different.");
    out.println("3");
    }

%>
