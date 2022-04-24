<%-- 
    Document   : success_register
    Created on : Dec 29, 2017, 6:22:52 PM
    Author     : Senet
--%>

<%@page import="java.net.UnknownHostException"%>
<%@page import="java.net.InetAddress"%>
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
                document.forms[0].action = "EIS_login.jsp"
                return true;
            }
        </script>
        <style>

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
            #success-div{
                border: 1px #64bb64 solid;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color: #ffffff;
                width: 80%;
            }
            #error-div{
                border: 1px #D00606 solid;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color: #ffffff;
                width: 80%;
            }
            .head
            {
                font: normal normal 15px Verdana, Geneva, Arial, Helvetica, sans-serif;

                padding: 6px 0px 6px 0px;
                text-align: center;
                color: #ffffff;
                margin: 0px;
            }
            .success{background-color: #64bb64;}
            .fail{background-color: #D00606;}
            .btn1,.btn2
            {
                width: 120px;
                background-color: #F6F6F6;
                padding: 6px 0px 6px 0px;
                cursor: pointer;
            }
            .clr1{color: #126D00; border: 1px #126D00 solid;}
            .clr2{color: #D30000; border: 1px #D30000 solid;}

            .btn1:hover {
                background-color:#126D00;
                color: #ffffff
            }
            .btn2:hover {
                background-color:#D30000;
                color: #ffffff
            }
        </style>
        <%  
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String dob = request.getParameter("dob");
            String curr_post = request.getParameter("curr_post");
            String curr_ofc = request.getParameter("curr_ofc");
            String mobile = request.getParameter("mobile");

            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            int flag = 0;
            int Oldflag = 0;
            int token = 0;
            String new_Token = "";
            int new_token = 0;
            Connection con = null;
            ResultSet rs = null;
            Statement st = null;
            PreparedStatement psmt = null;
            
            System.out.println("selected designation="+curr_post);
            
            if(curr_post.equals("0001")){curr_post="JDC";}
            else if(curr_post.equals("0010")){curr_post="Joint Director";}
            else if(curr_post.equals("0011")){curr_post="Director";}
            else if(curr_post.equals("0100")){curr_post="Dy. Director";}
            else if(curr_post.equals("0101")){curr_post="Asstt. Director Grade-I";}
            else if(curr_post.equals("0110")){curr_post="Asstt. Director Grade-II";}
            else if(curr_post.equals("0111")){curr_post="Investigator";}
            else if(curr_post.equals("1000")){curr_post="Office Superintendent";}
            
            System.out.println("actual designation="+curr_post);
            try {
                con = ConnectionManager.getConnectionDirectForMySQL();
                st = con.createStatement();
                String sql1 = "SELECT * FROM eis_register where email='"+email+"' or (name='"+name+"' and dob='"+dob+"')";
                rs = st.executeQuery(sql1);
                con.commit();
                while(rs.next()) {
                        flag = 1;
                        System.out.println("user already registered ");
                        System.out.println("flag=="+flag);
                    }

                

            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                String sql1 = "SELECT * FROM eis_updated_user_gov_mail where gov_email='" + email + "'";
                rs = st.executeQuery(sql1);
                con.commit();
                if (rs.next()) {
                    Oldflag = 1;
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        %>
    </head>
    <body bgcolor="#f0eae3">
        <div style="width: 1000px; margin: auto; border: 1px solid #cacaca; background-color: #ffffff;">
            <div align="center" title="Success" class="box">
                <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; " align="center">Government of India, Ministry of MSME </div>
                <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"></font>O/o  DCMSME </div>
                <div style="font-size:14px;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center" ><font color="#990000">ALL INDIA MSME-DO EMPLOYEE'S INFORMATION SYSTEM </font>
                </div>
                <br/>
                <br/>
                <form name="myform" method="post" action="" onsubmit="return myFunction()" />  


                <%
                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                    Date date = new Date();
                    String time = dateFormat.format(date);
                 
                    System.out.println(time);
                    
                    if (flag == 0 && Oldflag == 0) {
                        //*  To Generate the 7 digit token Number *//
                        Random rand = new Random();
                        int num = rand.nextInt(9000000) + 1000000;

                        String pass1 = email.substring(0, 4);
                        System.out.println("substring pass1" + pass1);
                        String pass2 = "@";
                        String pass = pass1.concat(pass2);
                        String eis_password = pass + num;
                        // to get token no;


                        String ip_address = request.getRemoteAddr();
                        System.out.println("IP Address :- " + ip_address);

                        System.out.println("Token for new user===" + num);
                        String sql = "";

                        System.out.println(num);
                        System.out.println(name);
                        System.out.println(curr_post);
                        System.out.println(curr_ofc);
                        System.out.println(email);
                        System.out.println(eis_password);
                        System.out.println(mobile);
                        System.out.println(dob);
                        System.out.println(time);
                        System.out.println(ip_address);

                        try {

                            sql = "insert into eis_updated_user_gov_mail (token, name, designation, current_office, old_email, gov_email, password, en_password, mobile, dob, time, "
                                    + "ip, isDisplay, isDelete,remark) values( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

                            psmt = (PreparedStatement) con.prepareStatement(sql);

                            psmt.setInt(1, num);
                            psmt.setString(2, name);
                            psmt.setString(3, curr_post);
                            psmt.setString(4, curr_ofc);
                            psmt.setString(5, email);
                            psmt.setString(6, email);
                            psmt.setString(7, eis_password);
                            psmt.setString(8, eis_password);
                            psmt.setString(9, mobile);
                            psmt.setString(10, dob);
                            psmt.setString(11, time);
                            psmt.setString(12, ip_address);
                            psmt.setString(13, "1");
                            psmt.setString(14, "0");
                            psmt.setString(15, "new_registration");

                            int isInserted = psmt.executeUpdate();
                            con.commit();
                            if (isInserted > 0) {
                                flag = 5;
                                System.out.println("1 row inserted " + email);
                            } else {
                                System.out.println("there is some technical issue while inserting data");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }


                        if (flag == 5) {
                %>
                <table id="success-div">
                    <tr>
                        <td ><h3 class="head success">Registration successful</h3></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>

                    <tr>
                        <td>
                            Your registration has been done successfully. <br/>
                            <br/> You will get your password on your registered mail within 24 hrs.<br/>
                            <br/> Your registered email : <a style=" color: #FF5733; padding-bottom: 4px; margin-bottom: 6px;"> <%=email%></a><br/>
                            <%--  Your Password : <a style=" color: #161a10 ; padding-top: 2px"> <%=eis_password%></a> <br/> --%>

                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <input class="btn1 clr1" type="submit" value="ok" size="50px" />
                        </td>     
                    </tr>
                </table>
                <%    
                        } 
                        
                %>
                

                <%
                    }else 
                    {
                        if(flag==1)
                        {
                            %>
                            <table id="error-div" >
                    <tr>
                        <td ><h3 class="head fail">Registration failed</h3></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>

                    <tr>
                        <td>
                            Your registration has failed due to following possible reason- <br/>
                            <ul>
                                <li>Your have already registered as name and date of birth found .</li>
                                <li>Please use your old email to update with government email.</li>
                                <li>or try with different credentials.</li>
                                <li>Try  to login <a href="EIS_login.jsp">click here</a>.</li>
                            </ul>

                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <input class="btn2 clr2" type="submit" value="ok" size="50px" />
                        </td>     
                    </tr>
                </table>
                            
                            <%
                        }else
                        {
                    System.out.println("this is else section");
                %>
                <table id="error-div" >
                    <tr>
                        <td ><h3 class="head fail">Registration failed</h3></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>

                    <tr>
                        <td>
                            Your registration has failed due to following possible reason- <br/>
                            <ul>
                                <li>Your email might be already registered.</li>
                                <li>Entered wrong details possibly.</li>
                                <li>Some technical error occurred.</li>
                                <li>Try with different government email.</li>
                                <li>Try again to register <a href="EIS_main.jsp">click here</a>.</li>
                            </ul>

                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <input class="btn2 clr2" type="submit" value="ok" size="50px" />
                        </td>     
                    </tr>
                </table>
                
                <%}}
                %>

                <br/>
                <br/>
                <br/>

            </div>
        </div>
        <%
            if (con != null) {
                con.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
            if (psmt != null) {
                psmt.close();
            }
        %>
    </body>
</html>
