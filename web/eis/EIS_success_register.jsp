<%-- 
    Document   : success_register
    Created on : Dec 29, 2017, 6:22:52 PM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Random" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EIS</title>
        <link rel="shortcut icon" href="fevicon.png" type="image/x-icon">
        <script>
       function  myFunction()
           {
    document.forms[0].action = "EIS_main.jsp"
    return true;
           }
        </script>
        <style>
            body {font-family: Bookman Old Style;}
            .box {
                width: 100%;
                height: 225px;
                background:  #f1f5f1 ;
                color:  #199f19 ;
               
                border-style: double;

}
.success {
            
                height: 225px;
                background:  #f1f5f1 ;
                color:   #FF5733  ;
                font-weight: bolder;
                font-family: Bookman Old Style;
                border-style: double;
}
.fail {
                color:   #FF5733  ;
                font-family: Bookman Old Style;
                font-weight: bolder;
                margin-top: 100px;
}
.img{
    padding-top: 20px;
}
.menu1 {
    width: 100%;
    height: 80px;
    background:  #175fd6  ;
    color: white;
    padding-top: 8px;
    padding-bottom: -14px;
}
      </style>
        <%
        String name =request.getParameter("name");
        String email =request.getParameter("email");
        String dob =request.getParameter("dob");
        String curr_post =request.getParameter("curr_post");
        String curr_ofc =request.getParameter("curr_ofc");
        String mobile =request.getParameter("mobile");
        int flag=0;
        int token=11538;
        String new_Token="";
        int new_token=0;
              Connection con1=null;
               ResultSet rs1=null;
               try{
               con1 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt1 = con1.createStatement();
    String sql1="SELECT * FROM eis_register ;";
    rs1=stmt1.executeQuery(sql1);
    while(rs1.next())
        {
         if(email.equals(rs1.getString("email")))
                 {
             flag=1;
             }
         else
             {
             flag=0;
             }

        }
    con1.close();
  }
catch(Exception e){
    e.printStackTrace();
    }

%>
    </head>
    <body bgcolor="#f0eae3">
  
<div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; " align="center">Government of India, Ministry of MSME </div>
        <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"></font>O/o  DCMSME </div>
        <%--         <div style="font-size: large;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"> <%=user_cur_ofc%></font></div> --%>
       <div style="font-size:14px;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center" ><font color="#990000">ALL INDIA MSME-DO EMPLOYEE'S INFORMATION SYSTEM </font>
         </div>
         <div align="center" title="Success" class="box">
             <form name="myform" method="post" action="" onsubmit="return myFunction()" />  
    <table>

            <%
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
Date date = new Date();
String time=dateFormat.format(date);
System.out.println(time);
if(flag==0)
     {
 //*  To Generate the 7 digit token Number *//
Random rand = new Random();
int num = rand.nextInt(9000000) + 1000000;
String pass1=email.substring(0, 4);
String pass2="@";
String pass=pass1.concat(pass2);
String eis_password=pass+num;
// to get token no;
               Connection con2=null;
               ResultSet rs2=null;
               try{
               con2 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt2 = con2.createStatement();
    String sql1="SELECT * FROM eis_register ;";
    rs2=stmt2.executeQuery(sql1);
    while(rs2.next())
        {
         new_Token=rs2.getString("token");

        }
    con2.close();
  }
catch(Exception e){
    e.printStackTrace();
    }

System.out.println("Old last Token is : "+new_Token);
new_token=Integer.parseInt(new_Token) ;
token=new_token+73;
System.out.println("Token for new user==="+token);
String sql=null;

ResultSet rs3= null;
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "mpr_dcmsme";
String userId = "root";
String password = "220047";
               try{
 Connection con3 = DriverManager.getConnection(connectionUrl+dbName, userId, password);

Statement st3=con3.createStatement();
sql ="insert into eis_register values ('"+name+"','"+email+"','"+curr_post+"','"+curr_ofc+"','"+eis_password+"','"+num+"','"+mobile+"','"+dob+"')";

int rs4 = st3.executeUpdate(sql);
if(rs4>0) {
flag=5;
    %>
    

            <%
con3.close();
}
}
catch (Exception e) {
e.printStackTrace();
}


    if (flag==5)
        {
%>
<br/><br/>

<tr>
       <td>
            Your registration has been done successfully. <br/>
          <br/> You will get your password on your registered mail within 24 hrs.
        <br/> Your registered email : <a style=" color: #FF5733; padding-bottom: 4px; margin-bottom: 6px;"> <%=email%></a><br/>
        <%--  Your Password : <a style=" color: #161a10 ; padding-top: 2px"> <%=eis_password%></a> <br/> --%>

             </td>
            </tr>
   
<%}
else
    {
%>
<br/><br/>
<tr>
    <td class="fail"  rowspan="2">

            <img src="alert.png" class="img" alt="Alert" width="40" height="40">
    <td class="fail">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Your Email is already registered.<br/><br/>
         &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;  Try with different email <a href="EIS_main.jsp"> click here.</a> for register again.
        </td>
</tr>
    <%}
}
%>
  </table><br/>
  <tr><td>
          <input type="submit" value="&nbsp;&nbsp;&nbsp;&nbsp;OK&nbsp;&nbsp;&nbsp;&nbsp;" size="50px" />
      </td>     </tr>
        </div>

    </body>
</html>
