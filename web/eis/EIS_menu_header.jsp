<%-- 
    Document   : EIS_menu_header
    Created on : 5 Dec, 2019, 12:41:35 PM
    Author     : msme
--%>

<!DOCTYPE html>
<html>
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <style>
            #mainDiv11
            {
                width: 1053px;
                margin: auto;
                margin-bottom: -41px;
            }
            .dropdown 
            {
                    position: relative;
                    display: inline-block;
                }

            .dropdown-content {
                display: none;
                position: fixed;
                background-color:#efeede;
                min-width: 130px;
                z-index: 1;
                font-size: 12px;
                font-weight: normal;
                text-align: left;
            }

            .dropdown-content a {
                padding: 8px 12px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover {background-color: #dad189 ;}

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropdown:hover .dropbtn {
                background-color: none;
            }
            .li-ele
            {
                text-align: left;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
             ul {
                 border: 1px #7d9df3 solid;
    list-style-type: none;
    background-color: #efeede;
    padding: 0;
    overflow: hidden;
    margin-top: 0px;
    margin-bottom: 40px;
    font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
}

li {
    float: left;
    font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
}

li a {
    display: inline-block;
    color: Blue;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    font-family: Georgia;
    font-size: 17px;
    font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
}

li a:hover {
   cursor: url;
   text-decoration: underline;
   background: #cdbe8b ;
}
#innerDiv1
            {
                height: 100px;
                background-color: white;
                text-align: center;
                font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px #7d9df3 solid;
                width: 100%;
                margin: auto;
                padding: 0px;
                align: center;
            }
            li{font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;}
            #innerDiv1-one
            {
                float: left;
                width: 20%;
            }
            #innerDiv1-two
            {
                width: 59.5%;
                float: left;
            }
            #innerDiv1-three
            {
                float: right;
                width: 20%;                 
            }
        </style>
        <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
        <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
    </head>
    <body>
        <div id="mainDiv11">
            <div id="innerDiv1">
                <div>&nbsp;</div>
                <div id="innerDiv1-one"> <img width="60px" height="75px" src="../eis_image/emblem-dark.png"/></div>
                <div id="innerDiv1-two">  भारत सरकार <br/>सूक्ष्म , लघु और मध्यम उद्यम मंत्रालय<br/>Government Of India<br/>Ministry of Micro, Small & Medium Enterprises</div>
                <div id="innerDiv1-three"><img width="150px" height="75px" src="../eis_image/swach-bharat.png"/></div>                
            </div>
            <div id="myDiv">
            <ul>
                      <li id="link"><a href="EIS_dataoneis.jsp">Home</a></li>
                      <li id="link"><a href="EGS_Grievance_Hqtr.jsp">Grievance</a></li>
                      <li id="link"><a href="searchInfo.jsp">Search on EIS</a></li>
                      <li id="link"><a href="EIS_instwise.jsp">Institute Wise Data</a></li>
                      <li id="link"><a href="EIS_updatedPref.jsp">Updated Preference List</a></li>
                      <%--       <li id="link"><a href="EIS_dataOnExDisci.jsp">Discipline Wise Data</a></li> --%>
                      <li id="link"><a href="EIS_report_BySelecting_Inst.jsp">Discipline Wise Report</a></li>
                      <%--<li id="link"><a href="retired_employee_detail1.jsp">Ret.List</a></li>--%>
                      <li id="link" class="dropdown">
                          <a class="dropbtn" >List</a>
                          <div class="dropdown-content">
                              <a class="li-ele" href="total_emp_list.jsp">Complete List (Incl. all)</a>
                              <a class="li-ele" href="all_retired_list1.jsp">All Retired List</a>
                              <a class="li-ele" href="EIS_retired_list1.jsp">Retired List designation wise</a> 
                              <a class="li-ele" href="#">Officer List( Excluding Ret. )</a> 
                              <a class="li-ele" href="EIS_seniority_list.jsp">Seniority List</a> 
                          </div>
                      </li>
                      <li id="link"><a HREF="EISadlogout.jsp" >Logout</a></li>
           </ul>
            </div>
        </div>

    </body>
</html>
