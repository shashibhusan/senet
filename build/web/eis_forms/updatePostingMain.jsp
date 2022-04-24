

<%@page import="java.text.ParseException"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%-- 
    Document   : raghav1
    Created on : 30 Jan, 2019, 11:04:16 AM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,common.*,java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">        
        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <title>Update Transfer</title>
        <script>
            $(function() {

                $(".datepicker").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    yearRange: "-40:+0",
                    dateFormat: "dd/mm/yy",
                    maxDate: '0'
                            /*     monthNamesShort  : fullmonth_array         */

                });
            });

            setTimeout(function() {
                $('#msg').fadeOut('fast');
            }, 12000);
        </script>
        <style>
            #mainDiv
            {

                width: 100%;
                border: 1px #e2e2e2 solid;
                align:center;
                margin: auto;
                overflow: auto;
            }
            #myTable
            {


            }
            #head
            {
                margin-top: 0px;
                line-height: 18px;
                font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 4px 0px 4px 0px;
                width: 100%;
                background-color: #f1f1f1;
            } 
            tr td 
            {
                border: 1px #adadad solid;
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 4px 1px 4px 1px;

            }
            table, th, tr,td { border-collapse: collapse;}
            #heading
            {
                background-color: #f1f1f1;
            }
            #heading1
            {
                background-color:  #e8e8e8 ;
                font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px #000000 solid;
            }
            .btn{
                width: 150px;
                background-color:  #e2e2e2 ;
                color:  #000000 ;
                padding: 4px 0px 4px 0px;
                margin: 0px;
                border: none;
                cursor: pointer;
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px #000000 solid;
            }
            .btn1
            {
                width: 150px;
                background-color:  #e2e2e2 ;
                color:  #000000 ;
                padding: 4px 0px 4px 0px;
                margin: 0px;
                border: none;
                cursor: pointer;
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px #000000 solid;
            }
            .btn2
            {
                width: 150px;
                background-color:   #05b029  ;
                color:  #ffffff ;
                padding: 4px 0px 4px 0px;
                margin: 0px;
                border: none;
                cursor: pointer;
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }

            .btn1:hover
            {
                background-color:  #007f1b ;
                color: #ffffff ;
            }
            .btn2:hover
            {
                background-color:  #007f1b ;
                color: #ffffff ;
            }
            .btn:hover
            {
                background-color:  #007f1b ;
                color: #ffffff ;
            }
            #button, #finalbtn,#button1,#err,#err1,#errormsg,#errorOnUpdatingCurrentDetails,#errorOnUpdatingPreference
            {
                border: none;
                color:  #ea1c00 ;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            .errorbg
            {
                background-color: #FFDBDB;
            }
            #updateData
            {
                display: none;
            }
            #test{
                align:center;
                margin: auto;
            }
            input[type=text]
            {
                padding: 4px 1px 4px 0px;
                display: inline-block;
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color: #ffffff;
                border: 1px #05b029 solid;
            }
            select
            {

                padding: 4px 1px 4px 0px;
                display: inline-block;
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color: #ffffff;
                border: 1px #05b029 solid;
            }
            #update-posting-history
            {
                display: none;
            }
            #msg{
                height: 20px;
                background-color:  #e6fce5 ;
                border: 1px solid  #088600 ;
                color: #088600;
                padding: 5px;
                width: 50%;
                margin: auto;
                margin-top: 10px;
                border-radius: 2px;
                display: none;
            }
            #inserttable,#myTable4UpdatePreferences
            {
                display: none;
            }

            button
            {
                padding: 0px;
                margin: 0px;
                background-color:  white;
                color:  #000000 ;
                border: none;
                border-radius: 0px;
                cursor: pointer;
            }
            .text-align
            {
                text-align: center;
            }
            .th-width
            {
                width: 27%;
            }
            .posting-history-wdt
            {
                width: 22%;
            }
            .para
            {
                margin-left: 10px;
            }
        </style>

        <script>
            function validate()
            {
                document.getElementById('myTable').style.display = "none";
                document.getElementById('test').style.display = "block";
                document.getElementById('raghav').style.display = "none";
                document.getElementById('raghav').style.width = "90%";

            }

            function dataValidation()
            {
                var office_cr = document.formUpdate.office_cr.value;
                var post_cr = document.formUpdate.post_cr.value;
                var mode = document.formUpdate.mode.value;
                var startDateCurrentOfc = document.formUpdate.startDateCurrentOfc.value;

                if (office_cr == null || office_cr == "")
                {
                    document.getElementById("err").innerHTML = "";
                    document.getElementById("err1").innerHTML = "! Plese select current office name.";
                    return false;
                }
                else if (post_cr == null || post_cr == "")
                {
                    document.getElementById("err1").innerHTML = "! Plese select designation.";
                    return false;
                }
                else if (mode == null || mode == "")
                {
                    document.getElementById("err1").innerHTML = "! Plese select mode.";
                    return false;
                }

                else if (startDateCurrentOfc == null || startDateCurrentOfc == "")
                {
                    document.getElementById("err1").innerHTML = "! Plese select date of joining at current office.";
                    return false;
                }
                else
                {
                    document.getElementById("err").innerHTML = "";
                    document.getElementById("err1").innerHTML = "";
                    alert('worling update current office');
                }

            }
        </script>
    </head>
    <%
        String crosssite = (String) session.getAttribute("crosssite");
        session.setAttribute("crosssite", crosssite);


        if (!crosssite.equals(null)) {

            String token = (String) session.getAttribute("token");
            String emp_name = (String) session.getAttribute("emp_name");
            String emp_email = (String) session.getAttribute("emp_email");
            String emp_desig = (String) session.getAttribute("emp_desig");
            String emp_cur_ofc = (String) session.getAttribute("emp_cur_ofc");

            session.setAttribute("token", token);
            session.setAttribute("emp_name", emp_name);
            session.setAttribute("emp_email", emp_email);
            session.setAttribute("emp_desig", emp_desig);
            session.setAttribute("emp_cur_ofc", emp_cur_ofc);


    %>
    <body>
        <div  id="mainDiv">

            <div id="msg"></div>
            <h3 id="head">Update Posting details </h3>
            <%
                Connection con = null;
                ResultSet rs = null;
                Statement st = null;
                int flagCount = 0;

                con = ConnectionManager.getConnectionDirectForMySQL();
                st = con.createStatement();


            %>  

            <div id="test">
                <form name="formUpdate" action="" method="POST">
                    <table align="center" id="myTable2" style="width: 100%;">
                        <tr>
                            <td colspan="6" id="head">Posting history <font  style="color: #d50000; font-size: 10px">(Exclude current posting)</font></td>
                        </tr>
                        <tr id="heading">
                            <td > Sno</td>
                            <td > Office</td>
                            <td> Designation</td>
                            <td> Mode</td>
                            <td> From</td>
                            <td> To</td>
                        </tr>

                        <%
                            int i = 0;
                            String qry = "select * from eis_posthistory where email = '" + emp_email + "' order by sno asc";
                            rs = st.executeQuery(qry);
                            while (rs.next()) {
                                i = i + 1;
                        %>
                        <tr>
                        <input type="hidden" id="posting_history_sno" name="posting_history_sno" value="<%=rs.getString("sno")%>"/>
                        <input type="hidden" id="posting_history_email" name="posting_history_email" value="<%=rs.getString("email")%>"/>
                        <td style="text-align: center"><%=i%>.</td>
                        <td><%=rs.getString("officeName")%></td>
                        <td><%=rs.getString("designation")%></td>
                        <td><%=rs.getString("phmode")%></td>
                        <td><%=rs.getString("phfrom")%></td>
                        <td><%=rs.getString("phto")%></td>

                        </tr>
                        <%}%>
                    </table>
                    <table align="center" id="btntable">
                        <tr>
                            <td colspan="5" id="finalbtn">
                                <div align="center" >
                                    <input class="btn" type="button" name="submitdata" value="Add Posting history" onclick="return updatePosting();"/> 
                                </div>
                            </td>
                        </tr>

                    </table>

                    <br/>

                    <table id="update-posting-history" style="width: 100%;">
                        <tr id="heading">
                            <td class="posting-history-wdt"> Office name</td>
                            <td class="posting-history-wdt"> Designation</td>
                            <td class="posting-history-wdt">  Mode</td>
                            <td > From</td>
                            <td > To</td>
                        </tr>
                        <tr >
                            <td class="text-align">
                                <select name="officename" id="officename" onchange="return hideerrormsg();">
                                    <option value="">Select</option>
                                    <%
                                        String Query = "select * from eis_branch_list";
                                        rs = st.executeQuery(Query);
                                        while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString("Inst_Name")%>"><%=rs.getString("Inst_Name")%></option>
                                    <%
                                        }

                                    %>
                                </select>
                            </td>
                            <td class="text-align">
                                <select id="designation" name="designation" style="width: 170px;" onchange="return hideerrormsg();">
                                    <option value="">Select</option>
                                    <option value="AIA">AIA</option>
                                    <option value="Joint Director">Joint Director</option>
                                    <option value="Director">Director</option>
                                    <option value="Dy. Director">Dy. Director</option>
                                    <option value="Asstt. Director Grade-I">Asstt. Director Grade-I</option>
                                    <option value="Asstt. Director Grade-II">Asstt. Director Grade-II</option>
                                    <option value="Investigator">Investigator</option>
                                    <option value="Office Superitendent">Office Superitendent</option>
                                </select>
                            </td>
                            <td class="text-align">
                                <select id="modeU" name="modeU" style="width: 150px;" onchange="return hideerrormsg();">
                                    <option value=""> Select</option>
                                    <option value="Transfer">Transfer</option>
                                    <option value="Promotion">Promotion</option>
                                    <option value="Direct Recruitment">Direct Recruitment</option>
                                    <option value="Promotion & Transfer">Promotion & Transfer</option>
                                </select>
                            </td>
                            <td class="text-align"><input type="text" style="width: 160px;" name="joiningdate" class="datepicker" id="date" autocomplete="off" placeholder="from date" onkeypress="return hideerrormsg()"/></td> 
                            <td class="text-align"><input type="text" style="width: 160px;" name="relievingdate" class="datepicker" id="date1" autocomplete="off" placeholder="To date" onkeypress="return hideerrormsg()"/></td> 

                        </tr>
                        <tr>
                            <td colspan="5">
                                <div align="right" >
                                    <input class="btn2" type="button" name="submitdata" value="Add" onclick="return updatePostingData();"/> 
                                </div>
                            </td>
                        </tr>
                        <tr id="button">
                            <td id="button" colspan="4">&nbsp;<div id="errormsg" class="errorbg"></div></td>
                        </tr>
                    </table>
                </form>
                <%-- This table is to update current posting --%>


                <%--  This is current posting details update table updateCurrentPostingDB.jsp --%>                    


                <form name="UpdateCurrentDetails" id="UpdateCurrentDetails" class="UpdateCurrentDetails" action="updateCurrentPostingDB.jsp" method="POST" autocomplete="off">
                    <table align="center" id="inserttable" style="width: 99.5%;" border="1">
                        <tr>
                            <td colspan="4" id="head">Select Current Posting Details</td>
                        </tr>
                        <tr>
                            <td class="th-width"> Office</td>
                            <td class="th-width"> Designation</td>
                            <td class="th-width"> Mode</td>
                            <td > Date of joining</td>

                        </tr>
                        <tr>
                            <td>
                                <select style="width: 99%" name="office_cr" id="office_cr"  onchange="return hideerrormsg();">
                                    <option value="">Select</option>
                                    <%
                                        String Query1 = "select * from eis_branch_list";
                                        rs = st.executeQuery(Query1);
                                        while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString("Inst_Name")%>"><%=rs.getString("Inst_Name")%></option>
                                    <%
                                        }

                                    %>
                                </select>
                            </td>

                            <td >
                                <select style="width: 99%" id="post_cr" name="post_cr"  onchange="return hideerrormsg();">
                                    <option value="">Select</option>
                                    <option value="AIA">AIA</option>
                                    <option value="Joint Director">Joint Director</option>
                                    <option value="Director">Director</option>
                                    <option value="Dy. Director">Dy. Director</option>
                                    <option value="Asstt. Director Grade-I">Asstt. Director Grade-I</option>
                                    <option value="Asstt. Director Grade-II">Asstt. Director Grade-II</option>
                                    <option value="Investigator">Investigator</option>
                                    <option value="Office Superitendent">Office Superintendent</option>
                                </select>
                            </td>

                            <td >
                                <select style="width: 99%" id="mode" name="mode" onchange="return hideerrormsg();">
                                    <option value=""> Select</option>
                                    <option value="Transfer">Transfer</option>
                                    <option value="Promotion">Promotion</option>
                                    <option value="Direct Recruitment">Direct Recruitment</option>
                                    <option value="Promotion & Transfer">Promotion & Transfer</option>
                                </select>
                            </td>

                            <td>
                                <input type="text" style="width: 180px" name="joiningDateCurrentOfc" class="datepicker" id="date5" autocomplete="off" placeholder="select date" onblur="return hideerrormsg();"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <div id="errorOnUpdatingCurrentDetails" class="errorbg"></div> 
                            </td>
                        </tr>
                        <tr id="finalbtn">
                            <td colspan="4" id="finalbtn">
                                <div align="right" >
                                    <%--     <input class="btn1" type="submit" name="submitdata" value="Submit" onclick="return dataValidation();"/> --%>
                                    <input class="btn2" type="submit" name="submitcurrentdata" value="Submit" onclick="return UpdateCurrentDetailsDB()"/> 
                                </div>
                            </td>
                        </tr>
                    </table>                                                 
                </form>




                <%--  Showing current posting Details   --%>  
                <%--On click update it will show table with id inserttable --%>


                <table align="center" id="myTable" style="width: 99.5%;">
                    <tr>
                        <td colspan="5" id="head">Current Posting Details</td>
                    </tr>
                    <tr id="heading">
                        <td style="width: 27%"> Current Office</td>
                        <td style="width: 27%"> Designation</td>
                        <td style="width: 27%"> Mode</td>
                        <td style="width: 24%"> Date of joining</td>
                    </tr>
                    <tr>
                        <%
                            String first = "";
                            String second = "";
                            String third = "";
                            String current_posting_preference_updated_on = "";
                            String reason_for_preferences = "";


                            try {

                                String sql12 = "select * from eis_postinginfo where email = '" + emp_email + "'";
                                rs = st.executeQuery(sql12);
                                while (rs.next()) {
                        %>
                        <td><%=rs.getString("state")%></td>
                        <td><%=rs.getString("curr_despln")%></td>
                        <td><%=rs.getString("cur_ofctype")%></td>
                        <td><%=rs.getString("curr_doj")%></td>
                        <%
                                    first = rs.getString("pst_pref_1");
                                    second = rs.getString("pst_pref_2");
                                    third = rs.getString("pst_pref_3");
                                    reason_for_preferences = rs.getString("your_spl_pref");

                                    current_posting_preference_updated_on = rs.getString("time_of_update_preferences");

                                }
                            } catch (Exception err) {
                                err.printStackTrace();
                            }


                        %>
                    </tr>                        

                    <tr>
                        <td colspan="4" id="button">
                            <div align="center">
                                <input class="btn1" type="button" name="submitdata" value="update current posting" onclick="return updateCurrentPosting();"/> 
                            </div>
                        </td>
                    </tr>                    
                </table>


                <%--  This is posting preferences update table  --%>                               

                <br/>
                <form id="updatePreference" name="updatePreference" method="POST" action="updatePreferencedb.jsp" autocomplete="off" class="updatePreference">
                    <table align="left" id="myTable4UpdatePreferences" style="width: 99%;">
                        <tr id="heading1">
                            <td colspan="4" id="heading1">update posting Preferences</td>
                        </tr>

                        <tr style="font-weight: bold; background-color:#f0f0f0; line-height: 30px;">
                            <td style="width: 39%"> &nbsp;</td>
                            <td style="width: 25%"> First choice</td>
                            <td style="width: 25%"> Second choice</td>
                            <td style="width: 25%"> Third choice</td>
                        </tr>
                        <tr>
                            <td><font style="ont-family: 'Open Sans'; font-stretch: normal; font-size: 12px"><br/>Select location </font><br/> <br/>
                                <font  style="color: #d50000; font-size: 10px">Note- Please select different location,<br/> make sure selected location should not be same.</font></td>
                            <td>
                                <select style="width: 99%" name="prefone" id="prefone" onchange="return hideerrormsg();">
                                    <option value="">Select</option>
                                    <%
                                        String sql = "select * from eis_branch_list";
                                        rs = st.executeQuery(sql);
                                        while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString("Inst_Name")%>"><%=rs.getString("Inst_Name")%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <select style="width: 99%" name="preftwo" id="preftwo" onchange="return hideerrormsg();">
                                    <option value="">Select</option>
                                    <%
                                        String sql1 = "select * from eis_branch_list";
                                        rs = st.executeQuery(sql1);
                                        while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString("Inst_Name")%>"><%=rs.getString("Inst_Name")%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <select style="width: 99%" name="prefthree" id="prefthree" onchange="return hideerrormsg();">
                                    <option value="">Select</option>
                                    <%
                                        String sql3 = "select * from eis_branch_list";
                                        rs = st.executeQuery(sql3);
                                        while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString("Inst_Name")%>"><%=rs.getString("Inst_Name")%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>

                            <td><font style="font-stretch: normal; font-size: 12px">Reason For Preferences :</font>
                                
                            </td>
                            <td colspan="3"><textarea maxlength="600" cols="60" rows="2" name="reasonForPreference" id="reasonForPreference"></textarea><br/>
                                <font  style="color: #d50000; font-size: 10px">(max. 600 character allowed)</font>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <div id="errorOnUpdatingPreference" class="errorbg"></div>  
                            </td>
                        </tr>

                        <tr id="finalbtn">
                            <td colspan="4" id="finalbtn">
                                <div align="right" >

                                    <input class="btn2" type="submit" name="submitPreferenceData" value="Submit" onclick="return UpdatePreferenceDetails();"/> 
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>

                <%
                    int check_preference_updation_date = 0;

                    if (current_posting_preference_updated_on.equals("")) {
                        current_posting_preference_updated_on = "not updated";
                    } else {
                        check_preference_updation_date = 1;
                        current_posting_preference_updated_on = current_posting_preference_updated_on.substring(0, 10);
                    }
                %>


                <%-- Posting Preferences Showing--%>
                <%-- Click on update ,it will show table id=myTable4UpdatePreferences  --%>


                <table align="center" id="PostingPreferences" style="width: 100%;">
                    <tr>
                        <td colspan="5" id="head"> Posting Preferences  &nbsp;&nbsp;&nbsp; <span style="font-weight: normal; color:#d50000; font-size: 10px">(updated on : <%=current_posting_preference_updated_on%>)</span></td>
                    </tr>
                    <tr style="font-weight: bold; background-color:#f0f0f0; ">
                        <td style="width: 200px;"> S.No.</td>
                        <td> first choice</td>
                        <td> Second choice</td>
                        <td> third choice</td>
                    </tr>
                    <tr>
                        <td><font style="font-weight: normal; ">Name of place</td>
                        <td><%=first%></td>
                        <td><%=second%></td>
                        <td><%=third%></td>
                    </tr>
                    <tr>
                        <td><font style="font-weight: normal;">Reason for preferences :</td>
                            <%--      <td colspan="3"><textarea value="" rows="2" cols="70" disabled="2" readonly="2"><%=reason_for_preferences%></textarea></td>  --%>                      
                        <td colspan="3" ><p class="para" style="width: 90%;" ><%=reason_for_preferences%></p></td>                        
                    </tr>
                    <%
                        int check_preference_updation_status = 0;
                        if (check_preference_updation_date == 1) {
                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                            Date date = new Date();
                            String current_time = dateFormat.format(date);

                            DateFormat formatter;
                            formatter = new SimpleDateFormat("dd/MM/yyyy");


                            Calendar current_date_format = Calendar.getInstance();

                            try {
                                current_date_format.setTime(dateFormat.parse(current_time));
                            } catch (ParseException da) {
                                da.printStackTrace();
                            }

                            //String ret_Date=current_posting_preference_updated_on;
                            String last_Date = "20/01/2022";
                            Date date_of_updation = null;
                            Date last_fixed_date_of_updation = null;

                            date_of_updation = (Date) formatter.parse(current_posting_preference_updated_on);
                            last_fixed_date_of_updation = (Date) formatter.parse(last_Date);
                            System.out.println("date_of_updation=" + date_of_updation);
                            System.out.println("last_fixed_date_of_updation=" + last_fixed_date_of_updation);
                            if (date_of_updation.after(last_fixed_date_of_updation) || date_of_updation.equals(last_fixed_date_of_updation)) {
                                System.out.println("your update for this session is done");
                            } else {
                                System.out.println("your update is pending for the session");
                            }
                        } else {
                            System.out.println("Please update your preference");
                        }
                        if (check_preference_updation_date == 0) {
                    %>
                    <tr>
                        <td colspan="4" id="button">
                            <div align="center">
                                <input class="btn1" type="button" name="submitdata" value="update preferences" onclick="return updatePostingPreferences();"/> 
                            </div>
                        </td>
                    </tr>
                    <%} else {
                    %>
                    <tr>
                        <td colspan="4" id="button">
                            <div align="center">
                                Note: you have already updated your preference. It will open after decision taken by competent authority.
                            </div>
                        </td>
                    </tr>
                    <%                    }
                    %>
                </table> 
                <br/>
                <%
                    int old_preference_check = 0;
                    String query_for_old_preference = "select * from eis_old_posting_preference where email='" + emp_email + "' order by sno desc limit 1";
                    rs = st.executeQuery(query_for_old_preference);
                    if (rs.next()) {
                        old_preference_check = 1;
                    }
                    if (old_preference_check == 1) {
                        rs.beforeFirst();
                        while (rs.next()) {
                %>    
                <table align="center" id="PostingPreferences" style="width: 100%;" border="2">
                    <tr>
                        <td colspan="5" id="head">Old Posting Preferences  </td>
                    </tr>
                    <tr style="font-weight: bold; background-color:#f0f0f0; ">
                        <td> S.No.</font></td>
                        <td> first choice</td>
                        <td> Second choice</td>
                        <td> third choice</td>
                    </tr>
                    <tr>
                        <td><font style="font-weight: normal;">Name of place</td>
                        <td><%=rs.getString("pref_1")%></td>
                        <td><%=rs.getString("pref_2")%></td>
                        <td><%=rs.getString("pref_3")%></td>
                    </tr>
                    <tr>
                        <td><font style="font-weight: normal;">Reason for preferences :</td>
                        <td colspan="3"><p class="para" style="width: 90%;" ><%=rs.getString("preference_reason")%></p></td>                        
                    </tr>
                </table>  
                <%}
                        }%>
                <br/>
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
            %>                   


        </div>
        <%--
        <div id="note">
                    <div colspan="4" id="head">Important note :</div>
                    <ul>
                    <li>Please fill the form carefully.</li>
                    <li>Once filled there are no provision to change.</li>
                    <li>every section have separate submit button, so act accordingly .</li>
                    <li>For any changes you have to contact to administrator.</li>
                    <li>For any changes you have to contact to administrator.</li>
                    </ul>
                </div>
                <style>
                    ul{
                        width: 90%;
                        margin: auto;
                    }
                    li{
                        font: normal normal 9px Verdana, Geneva, Arial, Helvetica, sans-serif;
                    }
                    #note
                    {
                        width: 99%;
                        margin: auto;
                        border: 1px #05b029 solid;
                        background-color: #f0f0f0;
                    }
                </style>
        --%>
        <script>
            function doEdite(sno, email)
            {
                alert("Edit for email=" + email + " sno=" + sno);
                return false;
            }
            function doDelete(sno, email)
            {
                alert("delete for email=" + email + " sno=" + sno);
                return false;
            }
            function updatePosting()
            {
                document.getElementById("update-posting-history").style.display = 'block';
                document.getElementById("btntable").style.display = 'none';

            }
            function UpdateCurrentDetailsDB()
            {
                var office_cr = document.UpdateCurrentDetails.office_cr.value;
                var post_cr = document.UpdateCurrentDetails.post_cr.value;
                var mode1 = document.UpdateCurrentDetails.mode.value;
                var startDateCurrentOfc = document.UpdateCurrentDetails.joiningDateCurrentOfc.value;

                if (office_cr == null || office_cr == "")
                {
                    document.getElementById("errorOnUpdatingCurrentDetails").innerHTML = "Error : Please select current office";
                    document.getElementById("office_cr").focus();
                    return false;
                }
                else if (post_cr == null || post_cr == "")
                {
                    document.getElementById("errorOnUpdatingCurrentDetails").innerHTML = "Error : Please select designation at current office";
                    document.getElementById("post_cr").focus();
                    return false;
                }
                else if (mode1 == null || mode1 == "")
                {
                    document.getElementById("errorOnUpdatingCurrentDetails").innerHTML = "Error : Please select designation at current office";
                    document.getElementById("mode").focus();
                    return false;
                }
                else if (startDateCurrentOfc == null || startDateCurrentOfc == "")
                {
                    document.getElementById("errorOnUpdatingCurrentDetails").innerHTML = "Error : Please select designation at current office";
                    document.getElementById("startDateCurrentOfc").focus();
                    return false;
                }

                else
                {
                    var stm1 = "Please make sure the data you entered for current posting details is correct. Once it will update it can not be change, Please verify the details below- ";
                    var stmt2 = "\n\nCurrent office : " + office_cr;
                    var stmt3 = "\nDesignation : " + post_cr;
                    var stmt4 = "\nMode : " + mode1;
                    var stmt5 = "\nDate of posting : " + startDateCurrentOfc + "\n\nDo you want to proceed ?";
                    var con = confirm(stm1 + stmt2 + stmt3 + stmt4 + stmt5);
                    if (con == true)
                    {
                        return true;
                    } else
                    {
                        return false;
                    }
                }
            }


            function UpdatePreferenceDetails()
            {
                var pref_one = document.updatePreference.prefone.value;
                var pref_two = document.updatePreference.preftwo.value;
                var pref_three = document.updatePreference.prefthree.value;
                var reason_for_pref = document.updatePreference.reasonForPreference.value;

                if ((pref_one == null || pref_one == "") && (pref_two == null || pref_two == "") && (pref_three == null || pref_three == ""))
                {
                    document.getElementById("errorOnUpdatingPreference").innerHTML = "Error : Please select posting preferences !!";
                    return false;
                }
                else if (pref_one == null || pref_one == "")
                {
                    document.getElementById("errorOnUpdatingPreference").innerHTML = "Error : Please select 1st posting preference !!";
                    return false;
                }
                else if (pref_two == null || pref_two == "")
                {
                    document.getElementById("errorOnUpdatingPreference").innerHTML = "Error : Please select 2nd posting preference !!";
                    return false;
                }
                else if (pref_three == null || pref_three == "")
                {
                    document.getElementById("errorOnUpdatingPreference").innerHTML = "Error : Please select 3rd posting preference !!";
                    return false;
                }
                else if (reason_for_pref == null || reason_for_pref == "")
                {
                    document.getElementById("errorOnUpdatingPreference").innerHTML = "Error : Please enter reason for preferences !!";
                    return false;
                }
                else if ((pref_one == pref_two) || (pref_one == pref_three))
                {
                    document.getElementById("errorOnUpdatingPreference").innerHTML = "Error : preferences should not be same !!";
                    return false;
                }
                else if ((pref_two == pref_one) || (pref_two == pref_three))
                {
                    document.getElementById("errorOnUpdatingPreference").innerHTML = "Error : preferences should not be same !!";
                    return false;
                }
                else if ((pref_three == pref_one) || (pref_three == pref_two))
                {
                    document.getElementById("errorOnUpdatingPreference").innerHTML = "Error : preferences should not be same !!";
                    return false;
                }
                else
                {
                    var stm1 = "Please make sure that you have selected correct preferences. Once you update your preferred location you won't "
                            + "be able to change or update without permission of competent authority. Please verify the details below - ";
                    var stm2 = "\n\nfirst choice : " + pref_one;
                    var stm3 = "\nsecond choice : " + pref_two;
                    var stm4 = "\nthirsd choice : " + pref_three;
                    var stm5 = "\nReason : " + reason_for_pref;
                    var stm6 = "\n\nDo you want to proceed?";
                    var con = confirm(stm1 + stm2 + stm3 + stm4 + stm5 + stm6);
                    if (con == true)
                    {
                        return true;
                    } else
                    {
                        return false;
                    }
                }
            }

            function updatePostingData()
            {
                var officename = document.formUpdate.officename.value;
                var designation = document.formUpdate.designation.value;
                var mode = document.formUpdate.modeU.value;
                var joiningdate = document.formUpdate.joiningdate.value;
                var relievingdate = document.formUpdate.relievingdate.value;

                if (officename == null || officename == "")
                {
                    document.getElementById("errormsg").innerHTML = 'Error : Please select office name';
                    document.getElementById("officename").focus();
                    return false;
                }
                else if (designation == null || designation == "")
                {
                    document.getElementById("errormsg").innerHTML = 'Error : Please select designation';
                    document.getElementById("designation").focus();
                    return false;
                }
                else if (mode == null || mode == "")
                {
                    document.getElementById("errormsg").innerHTML = 'Error : Please select mode';
                    document.getElementById("mode").focus();
                    return false;
                }
                else if (joiningdate == null || joiningdate == "")
                {
                    document.getElementById("errormsg").innerHTML = 'Error : Please enter joiningdate';
                    document.getElementById("joiningdate").focus();
                    return false;
                }
                else if (relievingdate == null || relievingdate == "")
                {
                    document.getElementById("errormsg").innerHTML = 'Error : Please enter relievingdate';
                    document.getElementById("relievingdate").focus();
                    return false;
                }
                else
                {
                    var stm1 = "Please make sure the data entered is correct. Once clicked on ok you can not change it. If you want to proceed click ok otherwise click no. Are you sure?"
                    var con = confirm(stm1);
                    if (con == true)
                    {
                        var url = "updatePostingHistoryDB.jsp?ofcn=" + officename + "&desig=" + designation + "&md=" + mode + "&jdate=" + joiningdate + "&rdate=" + relievingdate;
                        Insertintodatabase(url);
                        return true;
                    } else
                    {
                        return false;
                    }
                }


            }
            var request;
            function Insertintodatabase(url)
            {


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

            function getInfo()
            {
                if (request.readyState === 4)
                {
                    var val = request.responseText;
                    document.getElementById('msg').innerHTML = val;
                    document.getElementById('msg').style.display = 'block';
                    window.location.reload();
                    var frm = document.getElementsByName('formUpdate')[0];
                    frm.reset();  // Reset all form data
                    return false;
                }
            }

            function refreshPage()
            {
                window.location.reload();
            }
            function hideerrormsg()
            {
                document.getElementById("errormsg").innerHTML = '';
                document.getElementById("errorOnUpdatingCurrentDetails").innerHTML = '';
                document.getElementById("errorOnUpdatingPreference").innerHTML = '';

                return true;
            }


            function updateCurrentPosting()
            {
                document.getElementById('myTable').style.display = 'none';
                document.getElementById('inserttable').style.display = 'block';
                return true;
            }
            function updatePostingPreferences()
            {
                document.getElementById('PostingPreferences').style.display = 'none';
                document.getElementById('myTable4UpdatePreferences').style.display = 'block';
                return true;
            }
        </script>

    </body>
    <%
        } else {
            response.sendRedirect("stat.jsp");
        }
    %>
</html>

