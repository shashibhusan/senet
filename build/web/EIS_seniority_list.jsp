<%-- 
    Document   : EIS_seniority_list
    Created on : 11 Dec, 2019, 11:46:40 AM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="common.*, java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seniority List</title>
        <style>
            #url-table
            {
                width: 1050px;
                margin: auto;
                align:center;
                border: 1px  #cacaca  solid;
                background-color:  #ffffff ;
                min-height: 72vh;
            }
            #header
            {
                width: 100%;
                font: normal normal 15px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 8px 0px 8px 0px;
                background-color:  #afafaf ;
                text-align: left;                
            }
            .mainD
            {
                color: black;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                width: 1040px;
            }
            #msg
            {
                margin-top: 25px;
                border: 1px black solid;
                width: 95%;
            }
            #error
            {
                color:  #b60000 ;
                width: 100%;
                padding: 5px 0px 5px 0px;
                background-color:  #f8c2c2 ;
                display: none;
            }
            table tr td{
                border: 1px  #9f9f9f solid;
            }
            #data{
                padding: 4px 3px 4px 4px;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;

            }
            table, th, tr,td { border-collapse: collapse;}
            #head
            {
                padding: 8px 3px 6px 8px;
                font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color:  #e1e1e1 ;
            }
        </style>
        <script type="text/javascript" src="code.jquery.com/jquery-2.1.0.min.js"></script>
        <script>
            function postComment()
            {
                var getDesignation = document.seniorityList.seniority_list.value;

                if (getDesignation === "" || getDesignation === null)
                {
                    document.getElementById("error").innerHTML = 'Please select designation to get seniority list.';
                    document.getElementById("error").style.display = "block";
                    return false;
                }
                else
                {
                    document.getElementById("error").style.display = "none";
                    fetchSeniorityList();
                }
            }

            var request;
            function fetchSeniorityList()
            {
                var getDesignation = document.seniorityList.seniority_list.value;

                var url = "getSeniorityList.jsp?designation=" + getDesignation;

                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                }
                else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try
                {
                    request.onreadystatechange = getInfo;
                    request.open("GET", url, true);
                    request.send();
                }
                catch (e)
                {
                    alert("Unable to connect to server");
                }
            }
            function getInfo() {
                if (request.readyState === 4) {
                    var val = request.responseText;
                    document.getElementById('msg').innerHTML = val;
                }
            }
        </script>
    </head>
    <body bgcolor="#ccc">
        <%
            String Session = (String) session.getAttribute("Session");
            session.setAttribute("Session", Session);


            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);


            System.out.println("session value is=" + Session);
            System.out.println("session we get1 ::" + Session);


            if (!Session.equals(null)) {
        %>   
        <div id="url-table" align="center">

            <%@include file="EIS_menu_header.jsp" %>
            <%
                Connection con = null;
            %>
            <form id="seniorityList" name="seniorityList" method="">
                <h3 id="header"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seniority List of 
                    <select name="seniority_list" id="seniority_list" onselect="return errorHide();">
                        <option value="">Select</option>
                        <option value="AIA">AIA</option>
                        <option value="Director">Director</option>
                        <option value="Dy. Director">Dy. Director</option>
                        <option value="Asstt. Director Grade-I">Asstt. Director Grade-I</option>
                        <option value="Asstt. Director Grade-II">Asstt. Director Grade-II</option>
                        <option value="Investigator">Investigator</option>
                        <option value="Office Superitendent">Office Superitendent</option>
                    </select> 
                    <input type="button" id="btn" onclick="return postComment();" value="GO"/>  :
                </h3>
            </form>
            <table class="mainD" id="error"></table> 
            <table class="mainD" id="msg"></table> 
            <br/>
        </div>
        <%
        } else {
        %>
        <jsp:forward page="EIS_error.jsp" />
        <%            }

        %>  
    </body>
</html>
