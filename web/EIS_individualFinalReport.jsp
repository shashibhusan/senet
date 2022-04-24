<%-- 
    Document   : EIS_individualFinalReport
    Created on : Dec 21, 2017, 3:21:52 PM
    Author     : Senet
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
        <style>
body {font-family: Arial;}
 
.head{
    width: 100%;
}

/* Style the tab */
.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
   
    font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
}
.menu1 {
    width: 100%;
    height: 80px;
    background:  #175fd6  ;
    color: white;
}
.tab1 {
                padding-top: 20px;
                margin-top: 20px;
                font-size: 13px;
               background:  #e8f5e3;
                   }
                    .td {
                padding-top: 5px;
                padding-bottom: 5px;
                margin-top: 10px;
}
.main {
                       
                      
}
.td {
                padding-top: 5px;
                padding-bottom: 5px;
                margin-top: 10px;
                margin-left: 15px;
}
.ins {
    font-family:Arial, Helvetica, sans-serif;
    font-size: 12px;
    font-weight: inherit;
}
.logout {
    font-family:Arial, Helvetica, sans-serif;
    font-size: 14px;
    text-decoration: none;
}
.heading {
                padding-top: 5px;
                padding-bottom: 5px;
                margin-top: 10px;
                margin-left: 15px;
                font-size: 18px;
                font-weight: bold;
                color:  #FF5733 ;
                border-bottom: 2px red;
                border-bottom-style: solid;

}
.td1 {
    padding-top: 5px;
                padding-bottom: 5px;
                margin-top: 10px;
                margin-left: 15px;
                font-size: 15px;
                font-weight: bold;
                color:  #FF5733 ;

}
.heading1 {
                padding-top: 5px;
                padding-bottom: 5px;
                margin-top: 10px;
                margin-left: 15px;
                font-size: 18px;
                font-weight: bold;
                color:  #999999 ;
}
#mainTable{
               border: 4px green solid;
               border-style: double;
}
.menu1 {
    width: 100%;
    height: 80px;
    background:  #175fd6  ;
    color: white;
}
.menu {
    width: 100%;
    height: 40px;
    background: #0f9e48 ;
    margin-top: 0px;
    color: white;
    font-size: 18px;
    font-weight: bold;
     font-family:Arial, Helvetica, sans-serif;
     padding-bottom: -5px;

}

</style>
    </head>
    <body>
        <%
           String token = request.getParameter("token");
           Connection con=null;
           ResultSet rs=null;
           try
           {
           con = ConnectionManager.getConnectionDirectForMySQL();
           Statement stmt = con.createStatement();
           String sql="select * from eis_general01 where token='"+token+"'";
           rs=stmt.executeQuery(sql);
           while(rs.next())
               { %>
               <div class="head">
                   <tr>
                <td><div class="menu1" align="center">Ministry of MSME <br/>(Government of India)<br/>EMPLOYEE INFORMATION SYSTEM</div> </td>
            </tr>
            <tr>

                <td>  <div class="menu" align="center"> Report Section </div> </td>
        </tr>
               </div>
               <div>
                   
                   <h3 align="center"><%=rs.getString("name")%></h3>
                   <table align="center" width="880px" id="mainTable">
                    
                       
                       <tr>

                           <td>
           <table class="main" align="center"  style="width: 750px; height: 100%">
         <br/>
        <td class="heading" colspan="2"> Basic Detail </td>


        <tr class="tab1">    <td class="td"> <br/>Name <b style=" color: red; font: 20px;">*<br/>&nbsp;</b>  </td>
            <td class="td"> : &nbsp; <input type="text" name="name" size="43" id="name" class="name" value="<%=rs.getString("name")%>" disabled="disable" /> </td>   </tr>

        <tr class="tab1">    <td class="td"> <br/>Designation <b style=" color: red; font: 20px;">*<br/>&nbsp;</b> </td>
        <td class="td"> : &nbsp; <input type="text" name="degin" size="43" id="degin" class="degin" value="<%=rs.getString("designation")%>" disabled="disable"/> </td>  </tr>

        <tr class="tab1">    <td class="td"><br/> Date Of Birth<b style=" color: red; font: 20px;">*<br/>&nbsp;</b> </td>
        <td class="td"> : &nbsp; <input type="text" name="dob" size="43" id="dob" class="dob" value="<%=rs.getString("dob")%>" disabled="disable" </td> </tr>

        <tr class="tab1">    <td class="td"><br/> Date Of Joining <b style=" color: red; font: 20px;">*<br/>&nbsp;</b> </td>
        <td class="td"> : &nbsp; <input type="text" name="doj-G" size="43" id="doj-G" class="doj-G" value="<%=rs.getString("doJ")%>" disabled="disable"> </td> </tr>

        <tr class="tab1">    <td class="td"><br/> Date Of Joining To The O/o DCMSME / MSME-DIs<b style=" color: red; font: 20px;">*<br/>&nbsp;</b> </td>
        <td class="td"> : &nbsp; <input type="text" name="doj-msme" size="43" id="doj-msme" class="doj-msme" value="<%=rs.getString("doJ_msme")%>" disabled="disable"/> </td> </tr>

        <tr class="tab1">    <td class="td"><br/> Date Of Retirement<b style=" color: red; font: 20px;">*<br/>&nbsp;</b> </td>
         <td class="td"> : &nbsp; <input type="text" name="doR" size="43" id="doR" class="doR" value="<%=rs.getString("doR")%>" disabled="disable"/> </td> </tr>

                           <tr>
                               <td class="heading" colspan="2"> Posting Detail </td>
                           </tr>

                           <tr class="tab1">    <td class="heading1" colspan="2"> Current Posting<b style=" color: red; font: 20px;">*</b> </td>
                                </tr>

  <tr class="tab1">    <td class="td" align="right"><br/> Office <b style=" color: red; font: 20px;">*<br/>&nbsp;</b><br/>Duration <b style=" color: red; font: 20px;">*<br/>&nbsp;</b> </td>
        <td class="td"> :
            &nbsp; <input type="text" name="curr_ofc" size="43" id="curr_ofc" class="curr_ofc" value="<%=rs.getString("curr_pos_ofc")%>" disabled="disable"/> <br/>
         : &nbsp;  <input type="text" name="curr_dur_yr" size="10" id="curr_dur_yr" class="curr_dur_ye" value="<%=rs.getString("curr_pos_dur_yr")%>" disabled="disable"/>
                   <input type="text" name="curr_dur_mnth" size="10" id="curr_dur_mnth" class="curr_dur_mnth" value="<%=rs.getString("curr_pos_dur_mnth")%>" disabled="disable"/></td> </tr>




                           <tr class="tab1">    <td class="heading1" colspan="2"> Posting History  </td> </tr>


                                 <tr class="tab1">    <td class="td" align="right">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Office <br/>Duration  </td>
        <td class="td"> : &nbsp; <input type="text" name="pos_his_ofc1" size="43" id="pos_his_ofc1" class="pos_his_ofc1" value="<%=rs.getString("pos_his_ofc_1")%>" disabled="disable"/> <br/>
         : &nbsp;    <input type="text" name="pos_his_dur_yr1" size="10" id="pos_his_dur_yr1" class="pos_his_dur_yr1" value="<%=rs.getString("pos_his_ofc_dur_yr_1")%>" disabled="disable"/>
         <input type="text" name="pos_his_dur_mnt1" size="10" id="pos_his_dur_mnt1" class="pos_his_dur_mnt1" value="<%=rs.getString("pos_his_ofc_dur_mnth_1")%>" disabled="disable"/></td> </tr>



                             <tr class="tab1">    <td class="td" align="right">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Office <br/>Duration  </td>
        <td class="td"> : &nbsp; <input type="text" name="pos_his_ofc2" size="43" id="pos_his_ofc2" class="pos_his_ofc2" value="<%=rs.getString("pos_his_ofc_2")%>" disabled="disable"/> <br/>
         : &nbsp;    <input type="text" name="pos_his_dur_yr2" size="10" id="pos_his_dur_yr2" class="pos_his_dur_yr2" value="<%=rs.getString("pos_his_ofc_dur_yr_2")%>" disabled="disable"/>
         <input type="text" name="pos_his_dur_mnt2" size="10" id="pos_his_dur_mnt2" class="pos_his_dur_mnt2" value="<%=rs.getString("pos_his_ofc_dur_mnth_2")%>" disabled="disable"/></td> </tr>

                             <tr class="tab1">    <td class="td" align="right">3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Office <br/>Duration  </td>
        <td class="td"> : &nbsp; <input type="text" name="pos_his_ofc3" size="43" id="pos_his_ofc3" class="pos_his_ofc3" value="<%=rs.getString("pos_his_ofc_3")%>" disabled="disable"/> <br/>
         : &nbsp;    <input type="text" name="pos_his_dur_yr3" size="10" id="pos_his_dur_yr3" class="pos_his_dur_yr3" value="<%=rs.getString("pos_his_ofc_dur_yr_3")%>" disabled="disable"/>
         <input type="text" name="pos_his_dur_mnt3" size="10" id="pos_his_dur_mnt3" class="pos_his_dur_mnt3" value="<%=rs.getString("pos_his_ofc_dur_mnth_3")%>" disabled="disable"/></td> </tr>

                             <tr class="tab1">    <td class="td" align="right">4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Office <br/>Duration  </td>
        <td class="td"> : &nbsp; <input type="text" name="pos_his_ofc4" size="43" id="pos_his_ofc4" class="pos_his_ofc4" value="<%=rs.getString("pos_his_ofc_4")%>" disabled="disable"/> <br/>
         : &nbsp;    <input type="text" name="pos_his_dur_yr4" size="10" id="pos_his_dur_yr4" class="pos_his_dur_yr4" value="<%=rs.getString("pos_his_ofc_dur_yr_4")%>" disabled="disable"/>
         <input type="text" name="pos_his_dur_mnt4" size="10" id="pos_his_dur_mnt4" class="pos_his_dur_mnt4" value="<%=rs.getString("pos_his_ofc_dur_mnth_4")%>" disabled="disable"/></td> </tr>

                             <tr class="tab1">    <td class="td" align="right">5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Office <br/>Duration  </td>
        <td class="td"> : &nbsp; <input type="text" name="pos_his_ofc5" size="43" id="pos_his_ofc5" class="pos_his_ofc5" value="<%=rs.getString("pos_his_ofc_5")%>" disabled="disable"/> <br/>
         : &nbsp;    <input type="text" name="pos_his_dur_yr5" size="10" id="pos_his_dur_yr5" class="pos_his_dur_yr5" value="<%=rs.getString("pos_his_ofc_dur_yr_5")%>" disabled="disable"/>
         <input type="text" name="pos_his_dur_mnt5" size="10" id="pos_his_dur_mnt5" class="pos_his_dur_mnt5" value="<%=rs.getString("pos_his_ofc_dur_mnth_5")%>" disabled="disable"/></td> </tr>

                            <tr>
                               <td class="heading" colspan="2"> Training Detail </td>
                           </tr>
                           <tr class="tab1">    <td class="heading1" colspan="2"> Training History  </td>
                                </tr>

                                <tr class="tab1">    <td class="td" align="right">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Training Name <br/>Duration  </td>
        <td class="td"> : &nbsp; <input type="text" name="train_1" size="43" id="train_1" class="train_1" value="<%=rs.getString("train_his_1")%>" disabled="disable"/> <br/>
         : &nbsp;    <input type="text" name="trn_his_dur_yr1" size="10" id="trn_his_dur_yr1" class="trn_his_dur_yr1" value="<%=rs.getString("train_his_dur_yr_1")%>" disabled="disable"/>
         <input type="text" name="trn_his_dur_mnt1" size="10" id="trn_his_dur_mnt1" class="trn_his_dur_mnt1" value="<%=rs.getString("train_his_dur_mnth_1")%>" disabled="disable"/></td> </tr>

                                <tr class="tab1">    <td class="td" align="right">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Training Name <br/>Duration  </td>
        <td class="td"> : &nbsp; <input type="text" name="train_2" size="43" id="train_2" class="train_2" value="<%=rs.getString("train_his_2")%>" disabled="disable"/> <br/>
         : &nbsp;    <input type="text" name="trn_his_dur_yr2" size="10" id="trn_his_dur_yr2" class="trn_his_dur_yr2" value="<%=rs.getString("train_his_dur_yr_2")%>" disabled="disable"/>
         <input type="text" name="trn_his_dur_mnt2" size="10" id="trn_his_dur_mnt2" class="trn_his_dur_mnt2" value="<%=rs.getString("train_his_dur_mnth_2")%>" disabled="disable"/></td> </tr>

                                <tr class="tab1">    <td class="td" align="right">3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Training Name <br/>Duration  </td>
        <td class="td"> : &nbsp; <input type="text" name="train_3" size="43" id="train_3" class="train_3" value="<%=rs.getString("train_his_3")%>" disabled="disable"/> <br/>
         : &nbsp;    <input type="text" name="trn_his_dur_yr3" size="10" id="trn_his_dur_yr3" class="trn_his_dur_yr3" value="<%=rs.getString("train_his_dur_yr_3")%>" disabled="disable"/>
         <input type="text" name="trn_his_dur_mnt3" size="10" id="trn_his_dur_mnt3" class="trn_his_dur_mnt3" value="<%=rs.getString("train_his_dur_mnth_3")%>" disabled="disable"/></td> </tr>

                                <tr class="tab1">    <td class="td" align="right">4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Training Name <br/>Duration  </td>
        <td class="td"> : &nbsp; <input type="text" name="train_4" size="43" id="train_4" class="train_4" value="<%=rs.getString("train_his_4")%>" disabled="disable"/> <br/>
         : &nbsp;    <input type="text" name="trn_his_dur_yr4" size="10" id="trn_his_dur_yr4" class="trn_his_dur_yr4" value="<%=rs.getString("train_his_dur_yr_4")%>" disabled="disable"/>
         <input type="text" name="trn_his_dur_mnt4" size="10" id="trn_his_dur_mnt4" class="trn_his_dur_mnt4" value="<%=rs.getString("train_his_dur_mnth_4")%>" disabled="disable"/></td> </tr>

                                <tr class="tab1">    <td class="td" align="right">5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Training Name <br/>Duration  </td>
        <td class="td"> : &nbsp; <input type="text" name="train_5" size="43" id="train_5" class="train_5" value="<%=rs.getString("train_his_5")%>" disabled="disable"/> <br/>
         : &nbsp;    <input type="text" name="trn_his_dur_yr5" size="10" id="trn_his_dur_yr5" class="trn_his_dur_yr5" value="<%=rs.getString("train_his_dur_yr_5")%>" disabled="disable"/>
         <input type="text" name="trn_his_dur_mnt5" size="10" id="trn_his_dur_mnt5" class="trn_his_dur_mnt5" value="<%=rs.getString("train_his_dur_mnth_5")%>" disabled="disable"/></td> </tr>





<tr class="tab1">    <td class="heading1" colspan="2"> Training Required  </td>
                                </tr>

                           <tr class="tab1">    <td class="td" align="right"> Training Required  </td>
        <td class="td"> : &nbsp; <input type="text" name="train_req_1" size="43" id="train_req_1" class="train_req_1" value="<%=rs.getString("training_required")%>" disabled="disable"/> <br/>
         </td> </tr>


                     <%--     <tr class="tab1">     <td colspan="2" class="td" align="center"> <br/>   <input type="submit" value="Submit" name="submit"/><br/> &nbsp;</td>   </tr> --%>

</table>
                           </td>
                       </tr>
                   </table><br/><br/>

       </div>

         <%      }
           }
           catch (Exception e){
           e.printStackTrace();
           }
           System.out.println("The Employee ID which we get=="+token);
        %>
        
        
    </body>
</html>
