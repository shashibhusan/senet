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
            #head1
            {
                margin-top: 0px;
                line-height: 18px;
                font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 4px 0px 4px 0px;
                width: 99.5%;
                background-color: #f1f1f1;
            } 
            tr td 
            {
                border: 1px #f1f1f1 solid;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;

            }
            table, th, tr,td { border-collapse: collapse;}
            #heading
            {
                background-color: #f1f1f1;
            }
            #heading1
            {
                background-color:  #e8e8e8 ;
                font: normal bold 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px #05b029 solid;
            }
            .btn{
                width: 250px;
                background-color:  #e2e2e2 ;
                color:  #000000 ;
                padding: 6px 10px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
            }
            .btn1
            {
                width: 200px;
                background-color:  #e2e2e2 ;
                color:  #000000 ;
                padding: 6px 10px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
            }
            .btn2
            {
                width: 150px;
                background-color:   #05b029  ;
                color:  #ffffff ;
                padding: 6px 10px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
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
            #button, #finalbtn,#button1,#err,#err1,#errormsg,#errorOnUpdatingCurrentDetails
            {
                border: none;
                color:  #ea1c00 ;
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
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
                width: 100px;
                padding: 4px 1px 4px 0px;
                display: inline-block;
                font: normal normal 9px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color: #ffffff;
                border: 1px #05b029 solid;
            }
            select
            {

                padding: 4px 1px 4px 0px;
                display: inline-block;
                font: normal normal 9px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color: #ffffff;
                border: 1px #05b029 solid;
            }
            .wdt
            {
                width: 98%;
                alignment-adjust: central;
            }
            .wdt1
            {
                width: 90%;
                alignment-adjust: central;
            }
            #update-posting-history
            {
                display: block;
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
            #inserttable
            {
                width: 99%;  
                display: block;
            }
            #myTable4
            {
                width: 99%;
            }
            .text-align
            {
                text-align: center;
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
//                var dol_curr_ofc = document.formUpdate.lDateLastofc.value;
                var office_cr = document.formUpdate.office_cr.value;
                var post_cr = document.formUpdate.post_cr.value;
                var mode = document.formUpdate.mode.value;
                var startDateCurrentOfc = document.formUpdate.startDateCurrentOfc.value;

//                if(dol_curr_ofc==null || dol_curr_ofc=="")
//                    {
//                        document.getElementById("err").innerHTML="! Plese select leaving date of previous office.";
//                        return false;
//                    }
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
//                        else if(startDateCurrentOfc==dol_curr_ofc)
//                        {
//                            document.getElementById("err1").innerHTML="! Date of leaving of previous office and date of joining of current office should not be same.";
//                            return false;
//                        }
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

        //System.out.println("session value on updatepostpref page = " + crosssite);

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
            <h3 id="head">Update posting details </h3>
            <%
                Connection con = null;
                ResultSet rs = null;
                Statement st = null;
                int flagCount = 0;

                con = ConnectionManager.getConnectionDirectForMySQL();
                st = con.createStatement();

                //            String QueryFlag = "select * from eis_transferandpromotiondata where email = '"+emp_email+"' and token = '"+token+"'";
                //            rs = st.executeQuery(QueryFlag);
                //            while(rs.next())
                //            {
                //                flagCount=1;
                //            }

                //            if(flagCount==0)
                //            {
                //     System.out.println("You didn't update your data till now");
            %>  
            <%--         <form name="formUpdate" action="updateTransferFinal.jsp" method="POST"> updateCurrentPosting.jsp --%>

            <form name="formUpdate" action="updateCurrentPosting.jsp" method="POST">                
                <div id="test">
                    <table align="center" id="myTable2" style="width: 100%;">
                        <tr id="heading1">
                            <td colspan="5" id="heading1">Posting history</td>
                        </tr>
                        <tr id="heading">
                            <td  style="width: 200px"> Office</td>
                            <td> Designation</td>
                            <td> Mode</td>
                            <td> From</td>
                            <td> To</td>
                        </tr>

                        <%
                            String qry = "select * from eis_posthistory where email = '" + emp_email + "'";
                            rs = st.executeQuery(qry);
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%=rs.getString("officeName")%></td>
                            <td><%=rs.getString("designation")%></td>
                            <td><%=rs.getString("phmode")%></td>
                            <td><%=rs.getString("phfrom")%></td>
                            <td><%=rs.getString("phto")%></td>
                        </tr>
                        <%}%>
                    </table>

                    <%--                   <table align="center" id="btntable">
                                           <tr>
                                               <td colspan="5" id="finalbtn">
                                                   <div align="center" >
                                                       <input class="btn" type="button" name="submitdata" value="Add Posting history" onclick="return updatePosting();"/> 
                                                   </div>
                                               </td>
                                           </tr>
                                           
                                       </table>
                    --%>                                         
                    <br/>
                    <div id="head1" style="border: 1px solid #000000; margin: 0px;"> Add Posting History <font  style="color: #d50000; font-size: 10px">(Exclude current posting)</font></div>
                    <table id="update-posting-history" style="width: 100%;">
                        <tr id="heading">
                            <td style="width: 200px"> Office name</td>
                            <td style="width: 180px"> Designation</td>
                            <td style="width: 180px"> Mode</td>
                            <td style="width: 180px"> From</td>
                            <td style="width: 180px"> To</td>
                        </tr>
                        <tr >
                            <td class="text-align">
                                <select class="wdt" name="officename" id="officename" onchange="return hideerrormsg();">
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
                                <select class="wdt" id="designation" name="designation" style="width: 170px;" onchange="return hideerrormsg();">
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
                                <select class="wdt" id="modeU" name="modeU" style="width: 150px;" onchange="return hideerrormsg();">
                                    <option value=""> Select</option>
                                    <option value="Transfer">Transfer</option>
                                    <option value="Promotion">Promotion</option>
                                    <option value="Direct Recruitment">Direct Recruitment</option>
                                    <option value="Promotion & Transfer">Promotion & Transfer</option>
                                </select>
                            </td>
                            <td class="text-align"><input type="text" style="width: 80%;" name="joiningdate" class="datepicker wdt" id="date" autocomplete="off" placeholder="from date" onkeypress="return hideerrormsg()"/></td> 
                            <td class="text-align"><input type="text" style="width: 80%;" name="relievingdate" class="datepicker wdt" id="date1" autocomplete="off" placeholder="To date" onkeypress="return hideerrormsg()"/></td> 

                        </tr>
                        <tr>
                            <td colspan="5">
                                <div id="errormsg" class="errorbg"></div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <div align="right" >
                                    <input class="btn2" type="button" name="submitdata" value="Add" onclick="return updatePostingData();"/> 
                                </div>
                            </td>
                        </tr>
                    </table>

                    <%-- This table is to update current posting details --%>

                    <br/>
                    <div id="head1" style="border: 1px solid #000000"> Current Posting Details</div>
                    <table id="inserttable" style="width: 100%">

                        <tr id="heading">
                            <td style="width: 28%;"> Office</td>
                            <td style="width: 25%;"> Designation</td>
                            <td style="width: 25%;"> Mode</td>
                            <td style="width: 30%;"> Date of joining</td>

                        </tr>
                        <tr>
                            <td class="text-align">
                                <select class="wdt" name="office_cr" id="office_cr" onchange="return hideerrormsg();">
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

                            <td class="text-align">
                                <select class="wdt" id="post_cr" name="post_cr" onchange="return hideerrormsg();">
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
                                <select class="wdt" id="mode" name="mode" onchange="return hideerrormsg();">
                                    <option value=""> Select</option>
                                    <option value="Transfer">Transfer</option>
                                    <option value="Promotion">Promotion</option>
                                    <option value="Direct Recruitment">Direct Recruitment</option>
                                    <option value="Promotion & Transfer">Promotion & Transfer</option>
                                </select>
                            </td>

                            <td class="text-align">
                                <input  type="text" name="joiningDateCurrentOfc" class="datepicker" style="width: 98%;" id="date5" autocomplete="off" placeholder="select date" onblur="return hideerrormsg();"/>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="4">
                                <br/>

                                <table align="left" id="myTable4" style="width: 100%; border: 1">
                                    <tr id="heading1">
                                        <td colspan="4" id="head" style="border: 1px solid #000000">posting Preferences</td>
                                    </tr>

                                    <tr style="font-weight: bold; background-color:#f0f0f0; line-height: 30px;">
                                        <td style="width: 25%"> &nbsp;</td>
                                        <td style="width: 20%"> First choice</td>
                                        <td style="width: 20%"> Second choice</td>
                                        <td style="width: 20%"> Third choice</td>
                                    </tr>
                                    <tr>
                                        <td><font style="ont-family: 'Open Sans'; font-stretch: normal; font-size: 12px"><br/>Select location </font><br/> <br/>
                                            <font  style="color: #d50000; font-size: 10px">Note- Please select different location,<br/> make sure selected location should not be same.</font>
                                        </td>
                                        <td> 
                                            <select name="prefone" class="wdt" id="prefone" onchange="return hideerrormsg();">
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
                                            <select name="preftwo" class="wdt" id="preftwo" onchange="return hideerrormsg();">
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
                                            <select name="prefthree" class="wdt" id="prefthree" onchange="return hideerrormsg();">
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

                                        <td>Reason For Preferences</td>
                                        <td colspan="3">:&nbsp;&nbsp;<textarea cols="70" rows="2" name="reasonForPreference" id="reasonForPreference"></textarea>
                                        </td>
                                    </tr>
                                </table>
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
                                    <input class="btn2" type="submit" name="submitcurrentdata" value="Submit" onclick="return UpdateCurrentDetails();"/> 
                                </div>
                            </td>
                        </tr>
                    </table>



                    <%--  This is current posting update table  --%>                    
                    <%--          <table align="center" id="myTable" style="width: 100%;">
                                  <tr id="heading1">
                                      <td colspan="5" id="heading1">Present Posting Details</td>
                                  </tr>
                                  <tr id="heading">
                                      <td style="width: 200px"> Current Office</td>
                                      <td> Designation</td>
                                      <td> Mode</td>
                                      <td> Date of joining</td>
                                  </tr>
                                  <tr>
                                      <%
                                                              String first="";
                                                              String second="";
                                                              String third="";


                                try {

                                    String sql2 = "select * from eis_postinginfo where email = '" + emp_email + "'";
                                    rs = st.executeQuery(sql2);
                                    while (rs.next()) {
                            %>
                            <td><%=rs.getString("state")%></td>
                            <td><%=rs.getString("curr_despln")%></td>
                            <td><%=rs.getString("cur_ofctype")%></td>
                            <td><%=rs.getString("curr_doj")%></td>
                            <%
                                        first=rs.getString("pst_pref_1");
                                        second=rs.getString("pst_pref_2");
                                        third=rs.getString("pst_pref_3");
                                    }
                                } catch (Exception err) {
                                    err.printStackTrace();
                                }
                            %>
                        </tr>
                        <tr>
                            <td colspan="5"> &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="5" id="heading1"> Posting Preferences</td>
                        </tr>
                        <tr>
                            <td>1.</td>
                            <td>First preference</td>
                            <td><%=first%></td>
                        </tr>
                        <tr>
                            <td>2.</td>
                            <td>First preference</td>
                            <td><%=second%></td>
                        </tr>
                        <tr>
                            <td>3.</td>
                            <td>First preference</td>
                            <td><%=third%></td>
                        </tr>
                        <tr>
                            <td colspan="4" id="button">
                                <div align="center">
                                    <input class="btn1" type="button" name="submitdata" value="Update" onclick="return updateCurrentPosting();"/> 
                                </div>
                            </td>
                        </tr>

                    </table>  --%>

                </div>

            </form>

        </div>
        <script>
            function updatePosting()
            {
                document.getElementById("update-posting-history").style.display = 'block';
                document.getElementById("btntable").style.display = 'none';

            }
            function UpdateCurrentDetails()
            {
                var office_cr = document.formUpdate.office_cr.value;
                var post_cr = document.formUpdate.post_cr.value;
                var mode1 = document.formUpdate.mode.value;
                var startDateCurrentOfc = document.formUpdate.joiningDateCurrentOfc.value;

                var pref_one = document.formUpdate.prefone.value;
                var pref_two = document.formUpdate.preftwo.value;
                var pref_three = document.formUpdate.prefthree.value;
                var reason_for_pref = document.formUpdate.reasonForPreference.value;

//                alert(office_cr+post_cr+mode1+startDateCurrentOfc+pref_one+pref_two+pref_three+reason_for_pref);
//                return false;


                if (office_cr == null || office_cr == "")
                {
                    document.getElementById("errorOnUpdatingCurrentDetails").innerHTML = "Error : Please select current office name";
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
                    document.getElementById("errorOnUpdatingCurrentDetails").innerHTML = "Error : Please select mode at current office";
                    document.getElementById("mode").focus();
                    return false;
                }
                else if (startDateCurrentOfc == null || startDateCurrentOfc == "")
                {
                    document.getElementById("errorOnUpdatingCurrentDetails").innerHTML = "Error : Please select start date at current office";
                    document.getElementById("startDateCurrentOfc").focus();
                    return false;
                }
                else if ((pref_one == null || pref_one == "") && (pref_two == null || pref_two == "") && (pref_three == null || pref_three == ""))
                {
                    document.getElementById("errorOnUpdatingCurrentDetails").innerHTML = "Error : Please select posting preferences !!";
                    return false;
                }
                else if (pref_one == null || pref_one == "")
                {
                    document.getElementById("errorOnUpdatingCurrentDetails").innerHTML = "Error : Please select 1st posting preference !!";
                    return false;
                }
                else if (pref_two == null || pref_two == "")
                {
                    document.getElementById("errorOnUpdatingCurrentDetails").innerHTML = "Error : Please select 2nd posting preference !!";
                    return false;
                }
                else if (pref_three == null || pref_three == "")
                {
                    document.getElementById("errorOnUpdatingCurrentDetails").innerHTML = "Error : Please select 3rd posting preference !!";
                    return false;
                }
                else if (reason_for_pref == null || reason_for_pref == "")
                {
                    document.getElementById("errorOnUpdatingCurrentDetails").innerHTML = "Error : Please enter reason for preferences !!";
                    return false;
                }
                else if ((pref_one == pref_two) || (pref_one == pref_three))
                {
                    document.getElementById("errorOnUpdatingCurrentDetails").innerHTML = "Error : preferences should not be same !!";
                    return false;
                }
                else if ((pref_two == pref_one) || (pref_two == pref_three))
                {
                    document.getElementById("errorOnUpdatingCurrentDetails").innerHTML = "Error : preferences should not be same !!";
                    return false;
                }
                else if ((pref_three == pref_one) || (pref_three == pref_two))
                {
                    document.getElementById("errorOnUpdatingCurrentDetails").innerHTML = "Error : preferences should not be same !!";
                    return false;
                }
                else
                {
                    var stm1 = "Please make sure the data you entered for current posting is correct. Are you sure?"
                    var con = confirm(stm1);
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
                    document.getElementById("errormsg").innerHTML = 'Error : Please enter joining date at ' + officename;
                    document.getElementById("joiningdate").focus();
                    return false;
                }
                else if (relievingdate == null || relievingdate == "")
                {
                    document.getElementById("errormsg").innerHTML = 'Error : Please enter relieving date at ' + officename;
                    document.getElementById("relievingdate").focus();
                    return false;
                }
                else
                {
                    var stm1 = "Please make sure the data entered is correct. Once clicked on ok you can not change it. If you want to proceed click ok otherwise click no. Are you sure?"
                    var con = confirm(stm1);
                    if (con == true)
                    {
                        var url = "updatePostingHistoryMain.jsp?ofcn=" + officename + "&desig=" + designation + "&md=" + mode + "&jdate=" + joiningdate + "&rdate=" + relievingdate;
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

                return true;
            }


            function updateCurrentPosting()
            {
                document.getElementById('myTable').style.display = 'none';
                document.getElementById('inserttable').style.display = 'block';
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
