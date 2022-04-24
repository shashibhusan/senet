<%-- 
    Document   : EIS_Admin
    Created on : Feb 13, 2018, 11:20:37 AM
    Author     : Senet
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,common.*,java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <style>


            .main{
                width: 350px;
                height: 250px;
                margin-top: 15px;
                border-radius: 3px;
                border: 2px fuchsia ridge;

            }
            .center{
                padding-top: 20px;
                padding-left: 30px;
                padding-right: 35px;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            .top{
                height: 55px;
                background:  #cccccf ;
                text-align: center;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                font-size: 22px;
                margin: 0px;

            }
            .bottom
            {
                height: 55px;
                background:  #cccccf ;
                text-align: center;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                font-size: 22px;
                margin: 0px;
            }

            .submit{
                padding-left: 8px;
                padding-right: 8px;
                padding-bottom: 4px;
                padding-top: 4px;
                margin-right: 70px;
                margin-bottom: 10px;
                font-family: Vardana;
                margin-top: 0px;
                width: 150px;
            }
            input{
                padding: 5px;
                margin: 0px;
                width: 150px;
            }
            #error{
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color: red;
                font-size: 12px;
                margin-top: -25px;
            }


            table {
                position: relative;
                -moz-box-shadow: 1px 2px 4px rgba(0, 0, 0,0.5);
                -webkit-box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

                background: white;
            }

            /* Make the image fit the box */
            table img {
                width: 100%;
                border: 1px solid #8a4419;
                border-style: inset;
            }
            #box{
                display: inline-block;
                height: 135px;
                width: 225px;
                margin-left: 3px;
                margin-right: 3px;
                border-radius: 10px;
                position: relative;
                -moz-box-shadow: 1px 2px 4px rgba(0, 0, 0,0.5);
                -webkit-box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                margin-bottom: 10px;


            }
            .gname{
                font-family: Verdana, Geneva, sans-serif;
                font-size: 14px;
                font-style: normal;
                font-variant: normal;
                padding-left: 12px;
                margin-top: -8px;
            }
            .num{
                font-family: Verdana, Geneva, sans-serif;
                font-size: 38px;
                font-style: normal;
                font-variant: normal;
                font-weight: bold;
                padding-left: 12px;
                margin-top: -8px;

            }
            img{
                margin-top: 5px;
                text-align: center;
            }
            #reee{


            }
            div{
                padding: 6px;
            }
            #pass{
                margin-left: -0.35px;
            }
            .fiDiv{
                border: 1px solid #9fa0a4 ;
                width: 1050px;
            }
            #loginBox{
                margin-right: 25px;
            }
            #mainBox
            {
                width: 595px;
                height: 365px;
                margin-top: 22px;
                margin-left: 30px;
                border-radius: 3px;
                border: 2px fuchsia ridge;
                float: left;
                position: relative;
                -moz-box-shadow: 1px 2px 4px rgba(0, 0, 0,0.5);
                -webkit-box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.6), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            .topBox
            {
                display: inline-block;
            }
            .content{
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                margin-left: 15px;
                margin-top: 10px;
            }
            #img1{

            }
            .japan{
                height: 250px;
                width: 180px;
                border: 1px  #babbc1 solid;
                margin-top: -6px;
                margin-right: -6px;
            }
            .ddd{
                border: 1px  #babbc1 solid;
                height: 350px;
            }
            .goto{
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px  #babbc1 solid;
                padding: 2px;
                margin-top: -12px;
                margin-bottom: 3px;
            }
            .goto1{
                margin: 0px;
                padding: opx;
            }
            a{
                text-decoration: none;
            }
            a:hover
            {
                text-decoration: underline;
            }
            .date
            {
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                margin-left: 23px;
                margin-bottom: -10px;
                margin-top: 0px;
                margin-right: 0px;
                padding: 0px;

            }
            span{

            }
            #crt{
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
        </style>
        <script>

            function validate() {
                var name = document.getElementById("user").value;
                var pass = document.getElementById("pass").value;
                if (pass == "" && name == "") {
                    document.getElementById("error").innerHTML = "Please enter Username and Password";
                    return false;
                }
                if (name == "" || name == null) {

                    document.getElementById("error").innerHTML = "Please enter username";
                    return false;
                }
                if (pass == "" || pass == null) {

                    document.getElementById("error").innerHTML = "Please enter Password";
                    return false;
                }


                else

                {
                    document.forms[0].action = "EISadloginc.jsp"
                    return true;
                }
            }

            function refresh()
            {
                document.getElementById("captcha").src = 'reCaptch.jsp?' + (new Date().getTime());
            }

            function startTime() {
                var today = new Date();
                var h = today.getHours();
                var m = today.getMinutes();
                var s = today.getSeconds();
                m = checkTime(m);
                s = checkTime(s);
                document.getElementById('txt').innerHTML =
                        h + ":" + m + ":" + s;
                var t = setTimeout(startTime, 500);
            }
            function checkTime(i) {
                if (i < 10) {
                    i = "0" + i
                }
                ;  // add zero in front of numbers < 10
                return i;
            }
        </script>
        <%
            Connection con = null;
            ResultSet res = null;
            Statement st = null;
            int postCounter = 0;
            ArrayList<String> name = new ArrayList<String>();
        %>
    </head>
    <body onload="startTime()">
        <br/><br/>

        <div align="center" class="fiDiv" style="margin: auto; background-color: #fdfdff;">
            <div align="center" style="margin: auto;">
                <form name="myForm" method="post" action="" autocomplete='off' onsubmit="return validate()">

                    <%-- To diplay current time on web page  --%>
                    <div class="date"  align="left" style="margin: auto;">
                        <p align="left" class="date" ><span id="txt"></span></p>
                    </div>

                    <div class="topBox" align="left"  id="mainBox">
                        <div class="ddd" align="left" style="margin: auto; float: left; width: 390px;">
                            <p class="content"><u><b>Summery :</b></u></p>
                                    <%--
                                <p class="content">1. &nbsp;&nbsp; Total no of eployee registered on EIS : <b>552</b></p>
                                <p class="content">2. &nbsp;&nbsp; Total no of Grievance received : <b>007</b></p>
                                    --%>
                                    <%
                                        con = ConnectionManager.getConnectionDirectForMySQL();
                                        st = con.createStatement();
                                        String Query1 = "select * from eis_other_details";
                                        res = st.executeQuery(Query1);
                                        while (res.next()) {
                                            postCounter = postCounter + 1;
                                        }

                                        int totalEmployeeRegistered = 0;
                                        String Query2 = "select * from eis_basicinfo";
                                        res = st.executeQuery(Query2);
                                        while (res.next()) {
                                            totalEmployeeRegistered = totalEmployeeRegistered + 1;
                                        }



                                        con.close();
                                        st.close();
                                        //  System.out.println("No of updation hav been done =" +postCounter);
                                    %>
                            <p class="content">1. &nbsp;&nbsp;Total no of employees' registered  : <b><%=totalEmployeeRegistered%></b></p>
                            <p class="content">2. &nbsp;&nbsp;No of details update : <b><%=postCounter%></b></p>
                        </div>
                        <div id="img1" align="right" style="margin: auto;">
                            <img class="japan" src="eis_image\imghind.jpg" alt="मेरा भारत महान" align="right" name="मेरा भारत महान" title="मेरा भारत महान"/>
                        </div>
                    </div>
                    <div class="tobBox" align="right" id="loginBox">
                        <table class="main">
                            <tr>
                                <td class="top">
                                    Admin Login
                                </td>
                            </tr>
                            <tr>
                                <td class="center">
                                    <div id="user1">
                                        Username : <input type="text" name="user" id="user" required>
                                    </div>

                                    <div id="pass1">
                                        Password &nbsp;: <input class="input" type="password" id="pass" autocomplete="off" name="pass" required>
                                    </div>

                                    <div class="captcha1">
                                        Captcha &nbsp;&nbsp;&nbsp;: <input type="text" id="reee" autocomplete="off" class="captcha" name="answer" align="center" required/>
                                    </div>

                                    <div align="center" style="margin: auto; ">
                                        &nbsp;&nbsp;&nbsp;&nbsp;<img id="captcha" height="40" style=" width: 100px;"
                                                                     src="<c:url value="reCaptch.jsp" />" width="90"><a href="JavaScript:refresh()"><img src="refresh.png" style="border:none; width: 20px; height: 20px;" /></a> <br>


                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td align="right" class="submit" >
                                    <input type="submit" class="submit" value="Login">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div id="error"></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="bottom">
                                    &nbsp;
                                </td>
                            </tr>
                        </table><br/>
                    </div>
                    <div class="goto" align="left" style="width: 94%;">
                        <p class="goto1"><font color="#4b4b4c">&nbsp;&nbsp;&nbsp;Go to :</font> &nbsp; <a href="http://mpr.dcmsme.gov.in/" target="_blank">mpr.dcmsme.gov.in</a>&nbsp;,
                            &nbsp;<a href="http://www.dcmsme.gov.in/" target="_blank">dcmsme.gov.in</a>&nbsp;,
                            &nbsp;<a href="https://www.india.gov.in/" target="_blank">india.gov.in</a>&nbsp;,
                            &nbsp;<a href="https://eoffice.dcmsme.gov.in/cas/login?service=http%3A%2F%2Feoffice.dcmsme.gov.in%2Flogin.php" target="_blank">eOffice</a>
                        </p>
                    </div>
                    <%

                        int grievance_main = 0;
                        int grievance_ss = 0;
                        int grievance_reply_done = 0;
                        int grievance_reply_main = 0;
                        int grievance_reply_ss = 0;
                        int total_grievance_reg = 0;
                        try {
                            con = ConnectionManager.getConnectionDirectForMySQL();
                            st = con.createStatement();
                            String Query = "select * from egs_basic";
                            res = st.executeQuery(Query);
                            while (res.next()) {
                                grievance_main = grievance_main + 1;
                            }
                            con.close();
                        } catch (Exception err) {
                            err.printStackTrace();
                        }
                        String zero = "";
                        int no_of_digit = 0;
                        int n = grievance_main;
                        while (n != 0) {
                            n = n / 10;
                            no_of_digit = no_of_digit + 1;
                        }
                        for (int j = 1; j <= (3 - no_of_digit); j++) {
                            zero = zero + "0";
                        }
                        // System.out.println("Zero count for grievance main ::"+zero);
                    %>
                    <div>
                        <div id="box" style="background:  #6c3483 ; color: white;"><br/><p class="num" align="left"><%=zero%><%=grievance_main%></p><p class="gname" align="left">Grievance Main</p></div>
                                <%
                                    try {
                                        con = ConnectionManager.getConnectionDirectForMySQL();
                                        st = con.createStatement();
                                        String Query = "select * from egs_ss_basic";
                                        res = st.executeQuery(Query);
                                        while (res.next()) {
                                            grievance_ss = grievance_ss + 1;
                                        }
                                        con.close();
                                    } catch (Exception err) {
                                        err.printStackTrace();
                                    }
                                    String zero2 = "";
                                    int no_of_digit2 = 0;
                                    int n2 = grievance_ss;
                                    while (n2 != 0) {
                                        n2 = n2 / 10;
                                        no_of_digit2 = no_of_digit2 + 1;
                                    }
                                    for (int j = 1; j <= (3 - no_of_digit2); j++) {
                                        zero2 = zero2 + "0";
                                    }
                                    // System.out.println("Zero count for grievance ss ::"+zero2);
                                %>
                        <div id="box" style="background:  #f0cf3a ; color: white;"><br/><p class="num" align="left"><%=zero2%><%=grievance_ss%></p><p class="gname" align="left">Grievance EIS-SS</p></div>
                                <%
                                    total_grievance_reg = grievance_main + grievance_ss;
                                    String zero3 = "";
                                    int no_of_digit3 = 0;
                                    int n3 = total_grievance_reg;
                                    while (n3 != 0) {
                                        n3 = n3 / 10;
                                        no_of_digit3 = no_of_digit3 + 1;
                                    }
                                    for (int j = 1; j <= (3 - no_of_digit3); j++) {
                                        zero3 = zero3 + "0";
                                    }
                                    //   System.out.println("Zero count for total grievance ::"+zero3);
                                %>
                        <div id="box" style="background:  #FF5733 ; color: white;"><br/><p class="num" align="left"><%=zero3%><%=total_grievance_reg%></p><p class="gname" align="left">Total Grievance</p></div>
                                <%
                                    try {
                                        con = ConnectionManager.getConnectionDirectForMySQL();
                                        st = con.createStatement();
                                        String Query = "select * from egs_file where replyType='Reply'";
                                        res = st.executeQuery(Query);
                                        while (res.next()) {
                                            grievance_reply_main = grievance_reply_main + 1;
                                        }
                                        con.close();
                                    } catch (Exception err) {
                                        err.printStackTrace();
                                    }
                                    try {
                                        con = ConnectionManager.getConnectionDirectForMySQL();
                                        st = con.createStatement();
                                        String Query = "select * from egs_ss_file where replyType='Reply'";
                                        res = st.executeQuery(Query);
                                        while (res.next()) {
                                            grievance_reply_ss = grievance_reply_ss + 1;
                                        }
                                        con.close();
                                    } catch (Exception err) {
                                        err.printStackTrace();
                                    }

                                    grievance_reply_done = grievance_reply_main + grievance_reply_ss;
                                    String zero4 = "";
                                    int no_of_digit4 = 0;
                                    int n4 = grievance_reply_done;
                                    while (n4 != 0) {
                                        n4 = n4 / 10;
                                        no_of_digit4 = no_of_digit4 + 1;
                                    }
                                    for (int j = 1; j <= (3 - no_of_digit4); j++) {
                                        zero4 = zero4 + "0";
                                    }
                                    // System.out.println("Zero count for grievance done ::"+zero4);
                                %>
                        <div id="box" style="background:  #28b463 ; color: white;"><br/><p class="num" align="left"><%=zero4%><%=grievance_reply_done%></p><p class="gname" align="left">Grievance Closed</p></div>
                    </div>
                </form>

            </div>
            <div  colspan="13" height="20px" style="margin-bottom:4px; background-color:green;" >
                <strong>
                    <font color="#FFFFFF" size="-1" id="crt">Created & Designed by O/O DC-MSME &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Contact Us : 011-23062354(Senet Division)
                    </font>
                </strong>
            </div>
        </div>






    </body>
</html>
