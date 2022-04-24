<%-- 
    Document   : EISpen_reg_success
    Created on : Feb 7, 2018, 5:13:16 PM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Random" %>
<%@page import="java.util.Date"%>
<%@page import="java.util.UUID"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success !</title>
        <style>
            #success{
                width: 85%;
                height: 332px;
                background:   #76e2ef ;
                border: 1px thin;
                border-radius: 5px;
}
.innerDiv{
                width: 99%;
                height: 312px;
                background:   white ;
                 border: 1px thin;
                 border-radius: 5px;
}
.image{
    font-family: Comic Sans MS;
    font-size: 35px;
    margin-top: 0px;
}
.con{
    font-family: Courier New;
    font-size: 18px;
    margin-top: -20px;
    line-height: 1.3;
    font-stretch:ultra-expanded;
   
}
.conR{
    font-family: Courier New;
    font-size: 18px;
    margin-top: -20px;
    line-height: 1.3;
    font-stretch:ultra-expanded;
    color: red;
}
.con1{
    font-family: Courier New;
    font-size: 16px;
    margin-top: -10px;
    line-height: 1.5;
    font-stretch:ultra-expanded;
    padding-left: 40%;
}
.con2{
    font-family: Courier New;
    font-size: 16px;
    margin-top: -20px;
    line-height: 1.5;
    font-stretch:ultra-expanded;
    padding-left: 40%;
}
.click{
 padding-left: 50px;
 font-family: Courier New;
 font-size: 14px;
 margin-top: 0px;
}
           a:link {
    text-decoration: none;

}

a:visited {
    text-decoration: none;
    color: blue;
}


a:hover {
    text-decoration: none;
    color: black;
}

        </style>
        <%
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String mobile=request.getParameter("mobile");
        String dob=request.getParameter("dob");
        String designation=request.getParameter("curr_post");
        String key = UUID.randomUUID().toString().substring(0,8);

        Random rand = new Random();
        int num = rand.nextInt(9000000) + 1000000;

        System.out.println("/"+name+"/"+email+"/"+mobile+"/"+dob+"/"+designation+"/"+key);

        int flag=0;
        int count=0;
       
              Connection con1=null;
               ResultSet rs1=null;
               try{
               con1 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt1 = con1.createStatement();
    String sql1="SELECT * FROM eisp_register ;";
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
System.out.println("flag=="+flag);
        %>
    </head>
    <body>
      <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; " align="center">Government of India, Ministry of MSME </div>
        <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"></font>O/o  DCMSME </div>
        <%--         <div style="font-size: large;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"> <%=user_cur_ofc%></font></div> --%>
       <div style="font-size:14px;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center" ><font color="#990000">ALL INDIA MSME-DO PENSIONERS' DATA BASE </font>
       </div> 
       <br/><br/>
      
       
           <%
           
SimpleDateFormat dateFormat = new SimpleDateFormat("dd/mm/yyyy HH:mm:ss");
Date date = new Date();
String time=dateFormat.format(date);
System.out.println(time);

String sql=null;

ResultSet rs3= null;
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "mpr_dcmsme";
String userId = "root";
String password = "220047";
int sno=0;
               try{
 Connection con3 = DriverManager.getConnection(connectionUrl+dbName, userId, password);
con1 = ConnectionManager.getConnectionDirectForMySQL();
 Statement stmt1 = con1.createStatement();
 String sql1="SELECT * FROM eisp_register ;";
    rs1=stmt1.executeQuery(sql1);
    if(rs1.last())
        {
        sno=rs1.getInt("sno")+1;
        }


Statement st3=con3.createStatement();

sql ="insert into eisp_register values ('"+sno+"','"+email+"','"+name+"','"+key+"','"+mobile+"','"+dob+"','"+designation+"','"+num+"','"+time+"')";

int rs4 = st3.executeUpdate(sql);
if(rs4>0)
{
count=1;
}
else{
count=0;
}
con3.close();

}
catch (Exception e) {
e.printStackTrace();
}

if(count==1)
    {
           %>
           <h4 class="con"  style=" color:  #288311 ; font-size: 20px; margin-left: 8%; font-weight: normal; margin-bottom: -0px;">Hi <%=name%></h4>
            <table align="center" id="success"  bgcolor=" ">
           <tr>
               <td align="center">
                   <div class="innerDiv"><br>
                       <img src="eis_image/right.jpg" align="top" height="70px" width="70px"/><br>
                       <p align="center" class="image">Thank you!</p><br>
                       <p class="con">We have recieved your registration information and it will be done shortly. <br>Thanks again for registering
                       and welcome to <b> PENSIONERS' DATA BASE. </b></p>
                       <div align="crnter"> <p class="con1" align="left">Registered E-mail :<b> <%=email%></b></p>
                           <p class="con2" align="left"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               &nbsp;&nbsp;Password :<b> <%=key%></b></p></div>



                               <p align="left" class="click"> <a href="EISplogin.jsp">Click here </a> to login.</p>
                   </div>
               </td>
           </tr>
            </table>
          <%}
else{
          %>
          <h4 class="conR"  style=" font-size: 20px; margin-left: 8%; font-weight: normal; margin-bottom: -0px;">Hi <%=name%></h4>
          <table align="center" id="success"  bgcolor=" ">
           <tr>
               <td align="center">
                   <div class="innerDiv"><br>
                       <img src="eis_image/error.png" align="top" height="120px" width="120px"/><br>
                       <p align="center" class="image">Error !</p>
                       <p class="conR">Your email is already registered with us. <br>
                       Use different email..</p> <br>

                        <p align="left" class="click"> <a href="EISplogin.jsp">Click here </a> to login.</p>
                   </div>
               </td>
           </tr>
            </table>
          <%}%>
      
       
    </body>
</html>
