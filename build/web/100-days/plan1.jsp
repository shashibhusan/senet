<%-- 
    Document   : plan1
    Created on : 14 Jun, 2019, 4:46:08 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="common.*, java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="plan1.css">
        <script type="text/javascript" src="code.jquery.com/jquery-2.1.0.min.js"></script>
        <script type="text/javascript" src="JavaScript/plan.js"></script>
        <script type="text/javascript" src="JavaScript/plan2.js"></script>
        <title>JSP Page</title>
        
            <style>
#divHead
{
    font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
    padding: 4px;
    color:  #044dd6 ;
    width: 32%;
    background-color:  #f4f3e0 ;
}
#sno{
    color:  #044dd6 ;
    width: 4%;
    background-color:  #f4f3e0 ;
}
legend
{
    font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
    color:  #e74c3c ;
}
#error
{
   font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif; 
   color: red;
   border: 1px solid  #9b0000 ;
   background-color: #fff5f5;
   padding: 15px 10px;
   display: none;
}
option{
   font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif; 
}
fieldset
{
    width: 600px;
}

table tr td{
    border: 1px  #cdcdcd solid;
    font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;   
    border-collapse: collapse;
}
            </style>
    </head>
    <%
        String instId=(String)session.getAttribute("CmbIns");
        String role=(String)session.getAttribute("rol");
       //String instId=(String)session.getAttribute("CmbIns");
        String years=(String)session.getAttribute("CmbYear");
        String months=(String)session.getAttribute("CmbMonth");
        String user=(String)session.getAttribute("user");
        String Random5=(String)session.getAttribute("Random5");
        String mnm = request.getParameter("mnm"); 
          Connection con = null;
          ResultSet rs=null;
          Statement st =null;
          try{
              con=ConnectionManager.getConnectionDirectForMySQL();
              st = con.createStatement();
          }
          catch(Exception err)
          {
              err.printStackTrace();
          }
    %>
    <form name="myForm" method="post" id="myForm" action="" >
         
    <input type="hidden" name="instId" id="instId" value="<%=instId%>"/>
    <input type="hidden" name="role" id="role" value="<%=role%>"/>
    <input type="hidden" name="months" id="months" value="<%=months%>"/>
    <input type="hidden" name="years" id="years" value="<%=years%>"/>
    <input type="hidden" name="user" id="user" value="<%=user%>"/>
    <body bgcolor=" #fafafa ">
       
        <div id="head">
            100 Days Programme<br/>
            <font style="color:  #044dd6 ; font-size: 15px;">Data Entry Form Agri- Natural Resources in the Country</font>
       </div>
       <div id="mainDiv" style="width: 100%;">
        <div class="select-div">
                            <div>State / राज्य  :</div>
                            <div>
                                <select class="state" id="state" name="state" onchange="validate(this);">
                                    <option value=''>Select</option>
                                <%
          int i=0;
          String sql="select state_name,state_id, state_code, state_name_hindi from state_id order by state_name ";
          rs=st.executeQuery(sql);
          while(rs.next())
          {
              i=i+1;
                                %>
                                <option value="<%=rs.getString("state_id")%>"><%=i%>&nbsp-&nbsp;<%=rs.getString("state_name")%>/<%=rs.getString("state_name_hindi")%></option>
                                <%
          }
                                %>
                            </select>
                                </div>
        </div>
        <div class="select-div">
                            <div>District / जिला :</div>
                                    <select class="district" name="district" id="district" >
                    <option value=''>Select</option>
                    <%
                              String state="";
                              sql="select city_name from cities where city_state='"+state+"'";
                              rs=st.executeQuery(sql);
                              while(rs.next())
                              {

                    %>
                                <option value="<%=rs.getString("city_name")%>"><%=rs.getString("city_name")%></option>
                    <%
                                }
                    %>
                            </select>
                                </div>
          
                            <div style="height: 8px;"></div>
                            <fieldset>
                                <legend>NIC Code Selector</legend>
                            <div class="select-div">
                                <input type="radio" name="Type" value="01" onclick="GetTwoDigitCode(this);"/> Manufacturing/विनिर्माण  
                                <input type="radio" name="Type" value="02" onclick="GetTwoDigitCode(this);"/> Services/सेवा
                            </div>
                            <div style="height: 8px;"></div>
          <%--
        This is 2 Digit Code Section
        --%>                           
         <div id="error"></div>                   
        <div class="select-div">
                            <div>2 Digit Code :</div>
                            <div id="twoDigitCode">
                                <select class="twoDigitCode" name="twoDigitCode" id="twoDigitCode" onblur="SelectType();">
                                <option value=''>Select</option>
                            </select>
                                </div>
        </div>
                            
        <%--
        This is 4 Digit Code Section
        --%>                    
        <div class="select-div">
                            <div>4 Digit Code :</div>
                            <div id="fourDigitCode" >
                                <select class="fourDigitCode" name="fourDigitCode" id="fourDigitCode" >
                                <option value=''>Select</option>
                            </select>
                                </div>
        </div>
        
        <%--
        This is 5 Digit Code Section
        --%> 
        
        
                            <div class="select-div">
                            <div>5 Digit Code :</div>
                            <div id="fiveDigitCode">
                                <select class="fiveDigitCode" name="fiveDigitCode" id="fiveDigitCode">
                                <option value=''>Select</option>
                            </select>
                                </div>
        </div>
        </fieldset>
       
        <div id="formButton" style="width: 200px; margin: auto; align:center; padding: 10px;">
            <input type="button" name="submit" id="formSubmit" value="Add" onclick="SendToTable();"/>
            <input type="reset" name="reset" id="formreset1" value="reset" onclick="FinalReset();"/>
            
        </div>
        
        <table id="nicData"></table>
        
        <div id="test"></div>
        <div id="test1"></div>
        <div id="finalDiv" style="display: none;">
            <input type="button" name="submit" id="formSubmit" value="Submit" onclick="SubmitDataSQL();"/>
            <input type="reset" name="reset" id="formreset1" value="reset" onclick="FinalReset();"/>
        </div>
                           
        </div>
         </form>
    </body>
</html>
