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
            $(function () {

                $(".datepicker").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    yearRange: "-10:+5",
                    dateFormat: "dd/mm/yy"
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
                line-height: 18px;
                font: normal normal 19px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 8px;
                width: 98%;
                background-color: #f1f1f1;
            } 
            tr td 
            {
                border: 1px #f1f1f1 solid;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 4px;
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
                border: 1px #000000 solid;
            }
            .btn{
                width: 250px;
                background-color:  #e2e2e2 ;
                color:  #000000 ;
                padding: 6px 10px;
                margin: 8px 0;
                border: none;
                border-radius: 2px;
                cursor: pointer;
            }
            .btn1
            {
                width: 100px;
                background-color:  #e2e2e2 ;
                color:  #000000 ;
                padding: 6px 10px;
                margin: 8px 0;
                border: none;
                border-radius: 2px;
                cursor: pointer;
            }
            
            .btn1:hover
            {
                background-color:  #cacaca ;
            }
            #button, #finalbtn,#button1,#err,#err1,#errormsg,#errorOnUpdatingCurrentDetails
            {
                border: none;
                color:  #ea1c00 ;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
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
                padding: 8px 10px;
                display: inline-block;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            select
            {
                
                padding: 8px 10px;
                display: inline-block;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
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
            #inserttable
            {
                width: 85%;  
                display: none;
            }
        </style>
        
        <script>
            function validate()
            {
                document.getElementById('myTable').style.display="none";
                document.getElementById('test').style.display="block";
                document.getElementById('raghav').style.display="none";
                document.getElementById('raghav').style.width="90%";
                
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
                    if(office_cr==null || office_cr=="")
                        {
                            document.getElementById("err").innerHTML="";
                            document.getElementById("err1").innerHTML="! Plese select current office name.";
                            return false;
                        }
                        else if(post_cr==null || post_cr=="")
                        {
                            document.getElementById("err1").innerHTML="! Plese select designation.";
                            return false;
                        }
                        else if(mode==null || mode=="")
                        {
                            document.getElementById("err1").innerHTML="! Plese select mode.";
                            return false;
                        }
                        
                        else if(startDateCurrentOfc==null || startDateCurrentOfc=="")
                        {
                            document.getElementById("err1").innerHTML="! Plese select date of joining at current office.";
                            return false;
                        }
//                        else if(startDateCurrentOfc==dol_curr_ofc)
//                        {
//                            document.getElementById("err1").innerHTML="! Date of leaving of previous office and date of joining of current office should not be same.";
//                            return false;
//                        }
                        else
                            {
                                document.getElementById("err").innerHTML="";
                                document.getElementById("err1").innerHTML="";
                                alert('worling update current office');
                            }
                
            }
        </script>
    </head>
    <%
        String crosssite = (String)session.getAttribute("crosssite");
        session.setAttribute("crosssite", crosssite);
        
     //   System.out.println("session value on updatepostpref page = " +crosssite);
        
        if(!crosssite.equals(null))
        {
            
            String token = (String)session.getAttribute("token");
            String emp_name = (String)session.getAttribute("emp_name");
            String emp_email = (String)session.getAttribute("emp_email");
            String emp_desig = (String)session.getAttribute("emp_desig");
            String emp_cur_ofc = (String)session.getAttribute("emp_cur_ofc");
            
            session.setAttribute("token", token);
            session.setAttribute("emp_name", emp_name);
            session.setAttribute("emp_email", emp_email);
            session.setAttribute("emp_desig", emp_desig);
            session.setAttribute("emp_cur_ofc", emp_cur_ofc);
            
            
    %>
    <body>
        <div  id="mainDiv">
            
            <div id="msg"></div>
            <h3 id="head">Update Transfer & Promotion</h3>
          <%
            Connection con=null;
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
   <%--         <form name="formUpdate" action="updateTransferFinal.jsp" method="POST"> --%>
   
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
                    <table align="center" id="btntable">
                        <tr>
                            <td colspan="5" id="finalbtn">
                                <div align="center" >
                                    <input class="btn" type="button" name="submitdata" value="Add Posting history" onclick="return updatePosting();"/> 
                                </div>
                            </td>
                        </tr>
                        
                    </table>
                       
                    <br/><br/>
                    
                    <table id="update-posting-history" style="width: 100%;">
                        <tr id="heading">
                            <td  style="width: 200px"> Office name</td>
                            <td> Designation</td>
                            <td> Mode</td>
                            <td> From</td>
                            <td> To</td>
                        </tr>
                        <tr >
                            <td>
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
                            <td>
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
                            <td>
                                <select id="modeU" name="modeU" style="width: 150px;" onchange="return hideerrormsg();">
                                    <option value=""> Select</option>
                                    <option value="Transfer">Transfer</option>
                                    <option value="Promotion">Promotion</option>
                                </select>
                            </td>
                            <td><input type="text" style="width: 80%;" name="joiningdate" class="datepicker" id="date" autocomplete="off" placeholder="from date" onkeypress="return hideerrormsg()"/></td> 
                            <td><input type="text" style="width: 80%;" name="relievingdate" class="datepicker" id="date1" autocomplete="off" placeholder="To date" onkeypress="return hideerrormsg()"/></td> 

                        </tr>
                        <tr>
                            <td colspan="5">
                                <div align="right" >
                                    <input class="btn1" type="button" name="submitdata" value="Add" onclick="return updatePostingData();"/> 
                                </div>
                            </td>
                        </tr>
                        <tr id="button">
                            <td id="button" colspan="4">&nbsp;<div id="errormsg"></div></td>
                        </tr>
                    </table>
                    <%-- This table is to update current posting --%>


                    <table align="center" id="inserttable">
                        <tr id="heading1">
                            <td colspan="4" id="heading1">Current Posting Details</td>
                        </tr>
                        <tr id="heading">
                            <td> Office</td>
                            <td> Designation</td>
                            <td> Mode</td>
                            <td> Date of joining</td>

                        </tr>
                        <tr>
                            <td>
                                <select name="office_cr" id="office_cr" onchange="return hideerrormsg();">
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

                            <td>
                                <select id="post_cr" name="post_cr" style="width: 170px;" onchange="return hideerrormsg();">
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

                            <td>
                                <select id="mode" name="mode" style="width: 150px;" onchange="return hideerrormsg();">
                                    <option value=""> Select</option>
                                    <option value="Transfer">Transfer</option>
                                    <option value="Promotion">Promotion</option>
                                </select>
                            </td>

                            <td>
                                <input type="text" name="joiningDateCurrentOfc" class="datepicker" id="date5" autocomplete="off" placeholder="select date" onblur="return hideerrormsg();"/>
                            </td>
                        <tr id="finalbtn">
                            <td colspan="4" id="finalbtn">
                                <div align="right" >
                                    <%--     <input class="btn1" type="submit" name="submitdata" value="Submit" onclick="return dataValidation();"/> --%>
                                    <input class="btn1" type="submit" name="submitcurrentdata" value="Submit" onclick="return UpdateCurrentDetails();"/> 
                                </div>
                            </td>
                        </tr>
                    </table>
                    <div id="errorOnUpdatingCurrentDetails"></div>


                    <%--  This is current posting update table  --%>                    
                    <table align="center" id="myTable" style="width: 100%;">
                        <tr id="heading1">
                            <td colspan="5" id="heading1">Posting history</td>
                        </tr>
                        <tr id="heading">
                            <td style="width: 200px"> Current Office</td>
                            <td> Designation</td>
                            <td> Mode</td>
                            <td> Date of joining</td>
                        </tr>
                        <tr>
                            <%


                                try {

                                    String sql = "select * from eis_postinginfo where email = '" + emp_email + "'";
                                    rs = st.executeQuery(sql);
                                    while (rs.next()) {
                            %>
                            <td><%=rs.getString("state")%></td>
                            <td><%=rs.getString("curr_despln")%></td>
                            <td><%=rs.getString("cur_ofctype")%></td>
                            <td><%=rs.getString("curr_doj")%></td>
                            <%
                                    }
                                } catch (Exception err) {
                                    err.printStackTrace();
                                }
                            %>
                        </tr>
                        <tr>
                            <td colspan="4" id="button">
                                <div align="center">
                                    <input class="btn1" type="button" name="submitdata" value="Update" onclick="return updateCurrentPosting();"/> 
                                </div>
                            </td>
                        </tr>

                    </table> 
                                
                </div>
                                    
                </form>
<%--                                

                                
            <%
            //            }else
            //            {
                String cur_office = "";
                String time = "";
                String cur_doj = "";
                String cur_desig = "";
                String cur_mode = "";

               // System.out.println("You have updated your data already");
                String sql22 = "select * from eis_postinginfo a join  eis_transferandpromotiondata b on a.email=b.email where a.email= '" + emp_email + "'";
                rs = st.executeQuery(sql22);
                while (rs.next()) {
                    cur_office = rs.getString("a.state");
                    cur_doj = rs.getString("a.curr_doj");
                    cur_desig = rs.getString("a.curr_despln");
                    cur_mode = rs.getString("a.cur_ofctype");
                    time = rs.getString("b.timeStamp");
                }
                con.close();

            %>
            <table style="display: none" align="center" id="myTable">
                <tr><td colspan="3" style="padding: 5px; color: #389006; line-height: 25px">Done ! You have updated your current status ON dt. <%=time%> . </td></tr>

                <tr>
                    <td>1.</td>
                    <td>Current Office</td>
                    <td>:&nbsp;&nbsp;<%=cur_office%></td>
                </tr>

                <tr>
                    <td>2.</td>
                    <td>Designation</td>
                    <td>:&nbsp;&nbsp;<%=cur_desig%></td>
                </tr>

                <tr>
                    <td>3.</td>
                    <td>Mode</td>
                    <td>:&nbsp;&nbsp;<%=cur_mode%></td>
                </tr> 
                <tr>
                    <td>4.</td>
                    <td>Date of joining</td>
                    <td>:&nbsp;&nbsp;<%=cur_doj%></td>
                </tr> 
            </table>
            <%
//            }
%>
--%>
        </div>
        <script>
            function updatePosting()
            {
                document.getElementById("update-posting-history").style.display='block';
                document.getElementById("btntable").style.display='none';
                
            }
             function UpdateCurrentDetails()
            {
                var office_cr = document.formUpdate.office_cr.value;
                var post_cr = document.formUpdate.post_cr.value;
                var mode1 = document.formUpdate.mode.value;
                var startDateCurrentOfc = document.formUpdate.joiningDateCurrentOfc.value;
                
                
                if(office_cr==null || office_cr=="")
                    {
                        document.getElementById("errorOnUpdatingCurrentDetails").innerHTML="Please select current office";
                        document.getElementById("office_cr").focus();
                        return false;
                    }
                  else if(post_cr==null || post_cr=="")
                            {
                                document.getElementById("errorOnUpdatingCurrentDetails").innerHTML="Please select designation at current office";
                                document.getElementById("post_cr").focus();
                                return false;
                            }
                        else if(mode1==null || mode1=="")
                                  {
                                      document.getElementById("errorOnUpdatingCurrentDetails").innerHTML="Please select designation at current office";
                                      document.getElementById("mode").focus();
                                      return false;
                                  }
                            else if(startDateCurrentOfc==null || startDateCurrentOfc=="")
                                      {
                                          document.getElementById("errorOnUpdatingCurrentDetails").innerHTML="Please select designation at current office";
                                          document.getElementById("startDateCurrentOfc").focus();
                                          return false;
                                      }
                                      else
                                          {
                                            var stm1="Please make sure the data you entered for current posting is correct. Are you sure?"
                                            var con=confirm(stm1);
                                            if(con==true)
                                                 {
                                                     return true;
                                                 }else
                                                     {
                                                         return false;
                                                     }                                              
                                          }
                
                
            }
            
            function updatePostingData()
            {
                var officename=document.formUpdate.officename.value;
                var designation=document.formUpdate.designation.value;
                var mode=document.formUpdate.modeU.value;
                var joiningdate=document.formUpdate.joiningdate.value;
                var relievingdate=document.formUpdate.relievingdate.value;
                
                if(officename==null || officename=="")
                    {
                        document.getElementById("errormsg").innerHTML='Please select office name';
                        document.getElementById("officename").focus();
                        return false;
                    }
                    else if(designation==null || designation=="")
                        {
                            document.getElementById("errormsg").innerHTML='Please select designation';
                            document.getElementById("designation").focus();
                            return false;
                        }
                        else if(mode==null || mode=="")
                            {
                                document.getElementById("errormsg").innerHTML='Please select mode';
                                document.getElementById("mode").focus();
                                return false;
                            }
                            else if(joiningdate==null || joiningdate=="")
                                {
                                    document.getElementById("errormsg").innerHTML='Please enter joiningdate';
                                    document.getElementById("joiningdate").focus();
                                    return false;
                                }
                                else if(relievingdate==null || relievingdate=="")
                                    {
                                        document.getElementById("errormsg").innerHTML='Please enter relievingdate';
                                        document.getElementById("relievingdate").focus();
                                        return false;
                                    }
                                    else
                                        {
                                            var stm1="Please make sure the data entered is correct. Once clicked on ok you can not change it. If you want to proceed click ok otherwise click no. Are you sure?"
                                            var con=confirm(stm1);
                                             if(con==true)
                                                 {
                                                     var url="updatePostingHistoryMain.jsp?ofcn="+officename+"&desig="+designation+"&md="+mode+"&jdate="+joiningdate+"&rdate="+relievingdate;
                                                     Insertintodatabase(url);
                                                     return true;
                                                 }else
                                                     {
                                                         return false;
                                                     }
                                        }
                
               
            }
           var request;
            function Insertintodatabase(url)
            {
                
                
                if(window.XMLHttpRequest){
                    request=new XMLHttpRequest();
                    }
                    else if(window.ActiveXObject){
                    request=new ActiveXObject("Microsoft.XMLHTTP");
                    }

                    try
                    {
                    request.onreadystatechange=getInfo;
                    request.open("GET",url,true);
                    request.send();
                    }
                    catch(e)
                    {
                    alert("Unable to connect to server");
                    }
            }
            
            function getInfo()
            {
                if(request.readyState===4)
                {
                var val=request.responseText;
                document.getElementById('msg').innerHTML=val;
                document.getElementById('msg').style.display='block';
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
                document.getElementById("errormsg").innerHTML='';
                document.getElementById("errorOnUpdatingCurrentDetails").innerHTML='';
                
                return true;
            }
            
            
            function updateCurrentPosting()
            {
                document.getElementById('myTable').style.display='none';
                document.getElementById('inserttable').style.display='block';
                return true;
            }
            
            
           
            
            
        </script>
             
    </body>
    <%
        }
        else {
    response.sendRedirect("stat.jsp");
}
    %>
</html>
