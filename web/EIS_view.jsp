<%-- 
    Document   : view
    Created on : Jan 14, 2018, 7:51:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>

        <style>
            .mainDivR{
                font-family:Arial, Helvetica, sans-serif;
                width: 800px;
                border: 1px black solid;
               
}
#dataR{
    font-family: Bookman Old Style;
   
    font-size:13px;
    padding-top: 2px;
    padding-bottom: 2px;
    padding-left: 6px;
}
.tHead{
     font-family: Bookman Old Style;
    border-bottom: 2px black solid;
   padding-top: 8px;
}
#tHead1{
    font-family: Bookman Old Style;
    font-size:14px;
    padding-top: 3px;
    padding-bottom: 3px;
  
    border-bottom: 1px black solid;

}
.mData{
    font-family: Bookman Old Style;
    font-size:12px;
    padding-top: 3px;
    padding-bottom: 3px;
    color:  #17202a ;
    
    padding-left: 0px;
}
.headerR{
  font-family: Bookman Old Style;
    font-size:20px;
    padding-left: 22px;
}
.headerR1{
  font-family: Bookman Old Style;
    font-size:20px;
    
    padding-right: 22px;

}
        </style>
    </head>
    <body>
        <br/>
        <table align="center" id="content">
            <tr>
                <td align="center" class="headerR">Employees' Information System</td>
               
            </tr>

            <tr>
                <td colspan="">
                    <div class="mainDivR">
                        <%
     System.out.println("your final submit is done already.");
String email="rgvjee@gmail.com";
               Connection con13=null;
               ResultSet rs13=null;
        try{
               con13 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt13 = con13.createStatement();
               String sql13="SELECT * FROM eis_basicinfo INNER JOIN eis_postinginfo ON eis_basicinfo.email=eis_postinginfo.email left JOIN eis_traininginfo ON eis_postinginfo.email=eis_traininginfo.email WHERE eis_basicinfo.email='"+email+"';";
               rs13=stmt13.executeQuery(sql13);
               while(rs13.next()){


      %>
                       
                        <table width="96%" align="center">

                            <tr>
                                <td colspan="2" class="tHead">
                                    <strong>Basic Information</strong>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" width="50%">
                                    <div id="dataR">Name :<a class="mData"> <%=rs13.getString("eis_basicinfo.name").toUpperCase()%></a></div>
                                    <div id="dataR">Email : <a class="mData"> <%=rs13.getString("eis_basicinfo.email")%></a></div>
                                    <div id="dataR">DOB : <a class="mData"> <%=rs13.getString("eis_basicinfo.dob")%></a></div>
                                    <div id="dataR">Discipline : <a class="mData"> <%=rs13.getString("eis_basicinfo.bas_descipline")%></a></div>
                                    <div id="dataR">Current Pay Level: <a class="mData"> <%=rs13.getString("eis_basicinfo.CrPayLevel")%></a></div>
                                    <div id="dataR">Pay Level In Substantive Pay : <a class="mData"> <%=rs13.getString("eis_basicinfo.payLevelSub")%></a></div>
                                </td>
                                <td align="left" width="50%">
                                    <div id="dataR">Designation : <a class="mData"> <%=rs13.getString("eis_basicinfo.bas_designation")%></a></div>
                                    <div id="dataR">Doj-GOV : <a class="mData"> <%=rs13.getString("eis_basicinfo.doj_gov")%></a></div>
                                    <div id="dataR">DOJ-MSME : <a class="mData"> <%=rs13.getString("eis_basicinfo.doj_msme")%></a></div>
                                    <div id="dataR">DOR : <a class="mData"> <%=rs13.getString("eis_basicinfo.dat_ret")%></a></div>
                                    <div id="dataR">Date of Regular Appointment to The Present Post : <a class="mData"> <%=rs13.getString("eis_basicinfo.aptPrPost")%></a></div>
                                    <div id="dataR">Category : <a class="mData"> <%=rs13.getString("eis_basicinfo.Category")%></a></div>
                                </td>
                            </tr>
                        </table>
                       
                        <table  width="96%" align="center">
                            <tr>
                                <td colspan="2" class="tHead">
                                    <strong>Current Posting :</strong>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" width="50%">
                                    <div id="dataR">Office Name : <a class="mData"> <%=rs13.getString("eis_postinginfo.state")%></a></div>
                                    <div id="dataR">Designation : <a class="mData"> <%=rs13.getString("eis_basicinfo.bas_designation")%></a></div>
                                </td>
                                <td align="left" width="50%">
                                    <div id="dataR">Mode : <a class="mData"><%=rs13.getString("eis_postinginfo.cur_ofctype")%></a></div>
                                    <div id="dataR">Date of Joining :<a class="mData"><%=rs13.getString("eis_postinginfo.curr_doj")%></a></div>
                                </td>
                            </tr>
                        </table>
                       
                        <table  width="96%" align="center">
                            <tr>
                                <td class="tHead" colspan="5">
                                    <strong>Posting History :</strong>
                                </td>
                            </tr>
                            <tr>
                                <td id="tHead1" width="22%" align="center">Name Of Office</td>
                                <td id="tHead1" width="22%" align="center">Designation</td>
                                <td id="tHead1" width="20%" align="center">Mode</td>
                                <td id="tHead1" width="18%" align="center">From</td>
                                <td id="tHead1" width="18%" align="center">To</td>
                            </tr>
                            <%
               Connection con1=null;
               ResultSet rs1=null;

               int ph=1;
                try{
               con1 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt1 = con1.createStatement();
               String sql="select * from eis_posthistory where email='"+email+"'";
               rs1=stmt1.executeQuery(sql);
               while(rs1.next()){

                       String date1="", date2="";
            
     date1=rs1.getString("phfrom");
     date2=rs1.getString("phto");
     
     %>
     <tr>
     <td align="left"><a class="mData"><%=rs1.getString("officeName")%></a></td>
     <td align="left"><a class="mData"><%=rs1.getString("designation")%></a></td>
     <td align="left"><a class="mData"><%=rs1.getString("phmode")%></a></td>
     <td align="center"><a class="mData"><%=date1%></a></td>
     <td align="center"><a class="mData"><%=date2%></a></td>
     </tr>
      <%

     }
               con1.close();
               }
                catch(Exception ex){
                    ex.printStackTrace();
                    }
     %>

                        </table>
                       
                        <table  width="96%" align="center">
                            <tr>
                                <td class="tHead" colspan="3">
                                    <strong>Posting Preferences :</strong>
                                </td>
                            </tr>
                            <tr>
                                <td id="dataR" width="22%" align="left">1. <a class="mData"><%=rs13.getString("eis_postinginfo.pst_pref_1")%></a></td>
                                <td id="dataR" width="22%" align="left">2.<a class="mData"><%=rs13.getString("eis_postinginfo.pst_pref_2")%></a></td>
                                <td id="dataR" width="20%" align="left">3.<a class="mData"><%=rs13.getString("eis_postinginfo.pst_pref_3")%></a></td>

                            </tr>
                            <tr>
                                <td id="dataR">Reason For Preferences :</td>
                                <td colspan="2"><a class="mData"><%=rs13.getString("eis_postinginfo.your_spl_pref")%></a></td>
                            </tr>
                        </table>

                        <table  width="96%" align="center">
                            <tr>
                                <td class="tHead" colspan="2">
                                    <strong>About Yourself :</strong>
                                </td>
                            </tr>
                            <tr>
                                <td id="dataR" width="33%">Trade :</td>
                               <td>
                                   <a class="mData"><%=rs13.getString("eis_traininginfo.Trade")%></a>
                                </td>
                            </tr>
                            <tr>
                                 <td id="dataR">Physical Fitness Status :</td>
                                 <td>
                                    <a class="mData"><%=rs13.getString("eis_traininginfo.phyFit")%></a>
                                </td>
                            </tr>
                            <tr>
                                <td id="dataR" width="33%">
                                    Area of Specialisation in The Trade :
                                </td>
                                 <td>
                                    <a class="mData"><%=rs13.getString("eis_traininginfo.sptTrade")%></a>
                                </td>
                            </tr>
                            <tr>
                                <td id="dataR" width="33%">
                                    Specialisation in any other field :
                                </td>
                                 <td>
                                  <a class="mData"><%=rs13.getString("eis_traininginfo.splOTrade")%></a>
                                </td>
                            </tr>
                            <tr>
                                <td id="dataR" width="33%">
                                    Qualification :
                                </td>
                                 <td>
                                   <a class="mData"><%=rs13.getString("eis_traininginfo.qualification")%></a>
                                </td>
                            </tr>
                            <tr>
                                <td id="dataR" width="33%">
                                    Hobbies :
                                </td>
                                 <td>
                                   <a class="mData"><%=rs13.getString("eis_traininginfo.hobbies")%></a>
                                </td>
                            </tr>
                             </table>

                        <table  width="96%" align="center">
                            <tr>
                                <td class="tHead" colspan="3">
                                    <strong>Training Completed :</strong>
                                </td>
                            </tr>
                            <tr>
                                <td id="tHead1" width="40%" align="center">Name Of Training</td>
                                <td id="tHead1" width="30%" align="center">From</td>
                                <td id="tHead1" width="30%" align="center">To</td>
                               </tr>
                               <%
           String date3="";
           String date4="";
            try{
               con1 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt1 = con1.createStatement();
               String sql="select * from eis_trainingcompleted where email='"+email+"'";
               rs1=stmt1.executeQuery(sql);
               while(rs1.next()){
      date3=rs1.getString("tcFrom");
     date4=rs1.getString("tcTo");

                   %>
                   <tr>
            <td align="left"><a class="mData"><%=rs1.getString("trainingName")%></a></td>
           <td align="center"><a class="mData"><%=date3%></a></td>
           <td align="center"><a class="mData"><%=date4%></a></td>

                   </tr>
                   <%
               }
               con1.close();
               }
               catch(Exception ex){
               ex.printStackTrace();
               }
           %>
                               
                               <tr>
                                   <td>
                                       &nbsp;
                                   </td>
                               </tr>
                                </table>

                        <table  width="96%" align="center">
                            <tr>
                                <td class="tHead" colspan="3">
                                    <strong>Training Preferences :</strong>
                                </td>
                            </tr>
                            <tr>
                                <td id="tHead1" width="5%" align="center">S. no</td>
                                <td id="tHead1" width="45%" align="left">Name Of Training</td>
                                <td id="tHead1" width="50%" align="left">Details</td>
                               </tr>
                               <tr>
          <td align="center"> <b>1.</b></td>
          <td align="left"> <a class="mData"> <%=rs13.getString("eis_traininginfo.tp_name_req_1")==null ||rs13.getString("eis_traininginfo.tp_name_req_1")=="0"?" ":rs13.getString("eis_traininginfo.tp_name_req_1")%></a></td>
          <td align="left"> <a class="mData"> <%=rs13.getString("eis_traininginfo.tp_det_1")==null?" ":rs13.getString("eis_traininginfo.tp_det_1")%></a>
 </td>
        </tr>
        <tr>
          <td align="center"> <b>2.</b></td>
          <td align="left"> <a class="mData"> <%=rs13.getString("eis_traininginfo.tp_name_req_2")==null?" ":rs13.getString("eis_traininginfo.tp_name_req_2")%></a></td>
          <td align="left"><a class="mData"> <%=rs13.getString("eis_traininginfo.tp_det_2")==null?" ":rs13.getString("eis_traininginfo.tp_det_2")%></a>
 </td>
        </tr>
        <tr>
          <td align="center"> <b>3.</b></td>
          <td align="left"><a class="mData"><%=rs13.getString("eis_traininginfo.tp_name_req_3")==null?" ":rs13.getString("eis_traininginfo.tp_name_req_3")%></a></td>
          <td align="left"><a class="mData"><%=rs13.getString("eis_traininginfo.tp_det_3")==null?" ":rs13.getString("eis_traininginfo.tp_det_3")%></a>
 </td>
        </tr>
                               

                        </table>
 <br/>
 <%
}
               }
               catch(Exception ex){
               ex.printStackTrace();
               }
               %>
                    </div>
                    <br><br><br>
                </td>

            </tr>
            
        </table>
    </body>
</html>
