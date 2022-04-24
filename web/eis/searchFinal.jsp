<%-- 
    Document   : searchFinal
    Created on : Feb 16, 2018, 12:47:45 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="EIS_menu_header.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>:: Employee info ::</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>

        <style>
.mainDivR{
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                width: 800px;
                border: 1px black solid;

}
#dataR{
    font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
    font-size:13px;
    padding-top: 2px;
    padding-bottom: 2px;
    padding-left: 6px;
}
.tHead{
     font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
    border-bottom: 2px black solid;
   padding-top: 8px;
}
#tHead1{
    font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
    font-size:14px;
    padding-top: 3px;
    padding-bottom: 3px;
    border-bottom: 1px black solid;

}
.mData{
    font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
    font-size:12px;
    padding-top: 3px;
    padding-bottom: 3px;
    color:  #17202a ;

    padding-left: 0px;
}
.headerR{
  font: normal normal 20px Verdana, Geneva, Arial, Helvetica, sans-serif;
    font-size:20px;
    padding-left: 22px;
}
.headerR1{
  font: normal normal 20px Verdana, Geneva, Arial, Helvetica, sans-serif;
    font-size:20px;
    padding-right: 22px;

}
#url-table
{
   width: 1050px;
   margin: auto;
   align:center;
   border: 1px  #cacaca  solid;
   background-color:  #ffffff ;
   min-height: 72vh;
}
        </style>
    </head>
    <body bgcolor="#ccc">
        <div id="url-table" align="center">
        <table align="center" id="content">
            <tr>
                <td align="center" class="headerR">Employees' Information System</td>

            </tr>

            <tr>
                <td colspan="">
                    
<div class="mainDivR">
                        <%
     System.out.println("your final submit is done already.");
     String token=request.getParameter("nMhds495ds6fhXxQjd");
     System.out.println("value we get ::"+token);
     String email="";
               Connection con13=null;
               ResultSet rs13=null;
             try{
               con13 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt13 = con13.createStatement();
               String sql13="SELECT * FROM eis_basicinfo where token='"+token+"'";
               rs13=stmt13.executeQuery(sql13);
               while(rs13.next()){
               email=rs13.getString("email");
               }
               con13.close();
               }
catch(Exception ex){
ex.printStackTrace();
}

                int flagUpdatePost = 0;
                int flagUpdateTransfer = 0;
             
             
     Connection con_1=null;
     ResultSet res_1 = null;
     Statement stm = null;
     con_1 = ConnectionManager.getConnectionDirectForMySQL();
     stm = con_1.createStatement();
     String Query1="Select flag, time from eis_postinginfo_new where email='"+email+"'";
     res_1 = stm.executeQuery(Query1);
     while(res_1.next())
     {
         flagUpdatePost = 1;
     }
     
     String Query2="Select flag, timeStamp from eis_transferandpromotiondata where email='"+email+"'";
     res_1 = stm.executeQuery(Query2);
     while(res_1.next())
     {
         flagUpdateTransfer = 1;
     }
     con_1.close();
     res_1.close();
     stm.close();
             
             


        try{
               con13 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt13 = con13.createStatement();
               String sql13="SELECT * FROM eis_basicinfo a INNER JOIN eis_postinginfo b ON a.email=b.email left JOIN eis_traininginfo c ON b.email=c.email WHERE a.email='"+email+"';";
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
                                    <div id="dataR">Name :<a class="mData"> <%=rs13.getString("a.name").toUpperCase()%></a></div>
                                    <div id="dataR">Email : <a class="mData"> <%=rs13.getString("a.email")%></a></div>
                                    <div id="dataR">DOB : <a class="mData"> <%=rs13.getString("a.dob")%></a></div>
                                    <div id="dataR">Discipline : <a class="mData"> <%=rs13.getString("a.bas_descipline")%></a></div>
                                    <div id="dataR">Current Pay Level: <a class="mData"> <%=rs13.getString("a.CrPayLevel")%></a></div>
                                    <div id="dataR">Pay Level In Substantive Pay : <a class="mData"> <%=rs13.getString("a.payLevelSub")%></a></div>
                                </td>
                                <td align="left" width="50%">
                                    <div id="dataR">Designation : <a class="mData"> <%=rs13.getString("b.curr_despln")%></a></div>
                                    <div id="dataR">Doj-GOV : <a class="mData"> <%=rs13.getString("a.doj_gov")%></a></div>
                                    <div id="dataR">DOJ-MSME : <a class="mData"> <%=rs13.getString("a.doj_msme")%></a></div>
                                    <div id="dataR">DOR : <a class="mData"> <%=rs13.getString("a.dat_ret")%></a></div>
                                    <div id="dataR">Date of Regular Appointment to The Present Post : <a class="mData"> <%=rs13.getString("a.aptPrPost")%></a></div>
                                    <div id="dataR">Category : <a class="mData"> <%=rs13.getString("a.Category")%></a></div>
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
                                    <div id="dataR">Office Name : <a class="mData"> <%=rs13.getString("b.state")%></a></div>
                                    <div id="dataR">Designation : <a class="mData"> <%=rs13.getString("b.curr_despln")%></a></div>
                                </td>
                                <td align="left" width="50%">
                                    <div id="dataR">Mode : <a class="mData"><%=rs13.getString("b.cur_ofctype")%></a></div>
                                    <div id="dataR">Date of Joining :<a class="mData"><%=rs13.getString("b.curr_doj")%></a></div>
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
               String sql="select * from eis_posthistory where email='"+email+"' group by phfrom";
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
                                <%
                if(flagUpdatePost==1)
                {
                                %>
                                <td class="tHead" colspan="3">
                                    <strong>Posting Preferences :</strong>
                                    <font style="font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif; color: green;">updated</font>
                                </td>
                                <%
                }else
                {
                    %>
                                <td class="tHead" colspan="3">
                                    <strong>Posting Preferences :</strong>
                                    <font style="font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif; color: red;">not updated</font>
                                </td>
                    <%
                }
                                %>
                            </tr>
                            <tr>
                                <%
                if(flagUpdatePost==0)
                {
                                %>
                                <td id="dataR" width="22%" align="left">1. <a class="mData"><%=rs13.getString("b.pst_pref_1")%></a></td>
                                <td id="dataR" width="22%" align="left">2.<a class="mData"><%=rs13.getString("b.pst_pref_2")%></a></td>
                                <td id="dataR" width="20%" align="left">3.<a class="mData"><%=rs13.getString("b.pst_pref_3")%></a></td>
                                <%
                }else
                {
                    Connection con = null;
                    ResultSet rs = null;
                    Statement st = null;
                    try
                    {
                        con = ConnectionManager.getConnectionDirectForMySQL();
                        st = con.createStatement();
                        String Query = "Select * from eis_postinginfo_new where email = '"+email+"'";
                        rs = st.executeQuery(Query);
                        while(rs.next())
                        {
                                %>
                                <td id="dataR" width="22%" align="left">1. <a class="mData"><%=rs.getString("pref_one")%></a></td>
                                <td id="dataR" width="22%" align="left">2.<a class="mData"><%=rs.getString("pref_two")%></a></td>
                                <td id="dataR" width="20%" align="left">3.<a class="mData"><%=rs.getString("pref_three")%></a></td>
                                <%
                        }
                        con.close();
                    }
                    catch(Exception error){
                        error.printStackTrace();
                    }
                }
                                %>

                            </tr>
                            <tr>
                                <td id="dataR">Reason For Preferences :</td>
                                <td colspan="2"><a class="mData"><%=rs13.getString("b.your_spl_pref")%></a></td>
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
                                   <a class="mData"><%=rs13.getString("c.Trade")%></a>
                                </td>
                            </tr>
                            <tr>
                                 <td id="dataR">Physical Fitness Status :</td>
                                 <td>
                                    <a class="mData"><%=rs13.getString("c.phyFit")%></a>
                                </td>
                            </tr>
                            <tr>
                                <td id="dataR" width="33%">
                                    Area of Specialisation in The Trade :
                                </td>
                                 <td>
                                    <a class="mData"><%=rs13.getString("c.sptTrade")%></a>
                                </td>
                            </tr>
                            <tr>
                                <td id="dataR" width="33%">
                                    Specialisation in any other field :
                                </td>
                                 <td>
                                  <a class="mData"><%=rs13.getString("c.splOTrade")%></a>
                                </td>
                            </tr>
                            <tr>
                                <td id="dataR" width="33%">
                                    Qualification :
                                </td>
                                 <td>
                                   <a class="mData"><%=rs13.getString("c.qualification")%></a>
                                </td>
                            </tr>
                            <tr>
                                <td id="dataR" width="33%">
                                    Hobbies :
                                </td>
                                 <td>
                                   <a class="mData"><%=rs13.getString("c.hobbies")%></a>
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
          <td align="left"> <a class="mData"> <%=rs13.getString("c.tp_name_req_1")==null ||rs13.getString("c.tp_name_req_1")=="0"?" ":rs13.getString("c.tp_name_req_1")%></a></td>
          <td align="left"> <a class="mData"> <%=rs13.getString("c.tp_det_1")==null?" ":rs13.getString("c.tp_det_1")%></a>
 </td>
        </tr>
        <tr>
          <td align="center"> <b>2.</b></td>
          <td align="left"> <a class="mData"> <%=rs13.getString("c.tp_name_req_2")==null?" ":rs13.getString("c.tp_name_req_2")%></a></td>
          <td align="left"><a class="mData"> <%=rs13.getString("c.tp_det_2")==null?" ":rs13.getString("c.tp_det_2")%></a>
 </td>
        </tr>
        <tr>
          <td align="center"> <b>3.</b></td>
          <td align="left"><a class="mData"><%=rs13.getString("c.tp_name_req_3")==null?" ":rs13.getString("c.tp_name_req_3")%></a></td>
          <td align="left"><a class="mData"><%=rs13.getString("c.tp_det_3")==null?" ":rs13.getString("c.tp_det_3")%></a>
 </td>
        </tr>


                        </table>
 <br/>
 <%
}
               con13.close();
               }
               catch(Exception ex){
               ex.printStackTrace();
               }
               %>
                    </div>
                    
                </td>

            </tr>

        </table>
                    <br/>
                    </div>
    </body>
</html>

