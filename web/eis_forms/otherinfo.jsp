<%-- 
    Document   : otherinfo
    Created on : 24 Mar, 2021, 4:17:39 PM
    Author     : msme
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, common.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Other Info</title>
        <style>
            #mainDiv{
                width: 99%;
                margin: auto;
                border: 1px #e2e2e2 solid;
            }
            #mainhead
            {
                width: 90%;
                border: 1px #e2e2e2 solid;
                font: normal normal 16px Verdana, Geneva, Arial, Helvetica, sans-serif;
                text-align: center;
                padding: 6px;
                align: center;
                background-color: #c8c8c8 ;
            }
            #MyTable
            {
                width: 95%;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border: 1px #e2e2e2 solid;
            }
            .data{
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                 border: 1px #e2e2e2 solid;
                 height: 35px;
                 padding: 10px;
            }
            .data1{
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                 border: 1px #e2e2e2 solid;
                 padding: 8px;
            }
            .btnDiv
            {
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                 border: 1px #e2e2e2 solid;
                 padding: 8px;
                 text-align: center;
            }
            .sno{width: 5%; text-align: center; color: #000 ;} 
            .mid{width: 35%; padding-left: 8px; color: #000 ;}
            .lst{width: 57.5%;}
            table,th,tr,td{border-collapse: collapse;}
            .inptbox
            {
                width: 97.7%;
                padding: 5px;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            .selDiv, option, select
            {
                width: 99.7%;
                padding: 5px;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            .selS,.selD{
                width: 40%;padding: 5px;
            }
            #seldateDivHomtown,#seldateDivNorthEast
            {
                display: none;
            }
            .HometownDateSelect,.NorthEastDateSelect
            {
                margin-top: 8px;
                margin-bottom: 8px;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color: red;
            }
            .btn{
                padding: 8px;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                border-radius: 2px; 
                min-width: 80px;
                cursor: pointer;
                width: 150px;
            }
            .clr3{background-color:  #c4dfc6 ;border: 1px #1e8b03 solid;}
            .clr4{background-color:  #dfc4c4 ;border: 1px #ff0000 solid;}
            .clr5{background-color:  #dfdeef ;border: 1px #4f4dec solid;}
            .clr3:hover{background-color: #1e8b03;color: #ffffff;}
            .clr4:hover{background-color: #ff0000;color: #ffffff;}
            .clr5:hover{background-color: #4f4dec;color: #ffffff;}
            #err1,#err2,#err3,#err4,#err
            {
                color: red;
                margin-top: 4px;
                width: 90%;
                margin: auto;
                background-color: #ffe5e5;
                border-radius: 3px;
                padding: 4px;
            }
            .datepicker{
                margin-top: 2px;
            }
        </style>
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
//            session.setAttribute("emp_email", emp_email);
//            session.setAttribute("emp_desig", emp_desig);
//            session.setAttribute("emp_cur_ofc", emp_cur_ofc);
            
            Connection con=null;
            ResultSet rs=null;
            Statement st=null;
            int flag=0;
            System.out.println("Session true!!");
            try
                {
                    con=ConnectionManager.getConnectionDirectForMySQL();
                    st=con.createStatement();
                }
                catch(Exception sqlerror)
                {
                    sqlerror.printStackTrace();
                    System.out.println("error while connecting db is="+sqlerror.getMessage());
                }
            
            String current_posting_location="";
            String current_designation="";
            String sqll="select * from eis_postinginfo where email='"+emp_email+"'";
            ResultSet rs2=st.executeQuery(sqll);
            while(rs2.next())
            {
               current_posting_location= rs2.getString("state");
               current_designation= rs2.getString("curr_despln");
            }
            
            
            
            int isUpdated=0;
            String query="select * from eis_other_details where email='"+emp_email+"' and token='"+token+"'";
            ResultSet rs1=st.executeQuery(query);
            if(rs1.next())
            {
                isUpdated=1;
            }
            
            
    %>
    <body>        
        
        <div id="mainDiv">
            <%
                if (isUpdated == 0) {
            %>
            <form name="updateOtherdetailEis" class="updateOtherdetailEis" id="updateOtherdetailEis" action="InsertOtherDetails.jsp" method="POST" autocomplete="off">
                <table id="MyTable" align="center">
                    <tr>
                        <td colspan="3" id="mainhead">Update Other Details</td>
                    </tr>  
                    <tr>
                        <td class="data sno">1.</td>
                        <td class="data mid">Name :<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="data lst"><input type="text" class="inptbox" name="employee_name" id="employee_name" value="<%=emp_name%>" index="1" readonly="2" disabled="2"/></td>
                    </tr>
                    <tr   bgcolor=" #f9f9f9 ">
                        <td class="data sno">2.</td>
                        <td class="data mid">Designation :<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="data lst"><input type="text" class="inptbox" name="employee_name" id="employee_name" value="<%=current_designation%>" index="1" readonly="2" disabled="2"/></td>
                    </tr>
                    <tr>
                        <td class="data sno">3.</td>
                        <td class="data mid">Email :<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="data lst"><input type="text" class="inptbox" name="employee_name" id="employee_name" value="<%=emp_email%>" index="1" readonly="2" disabled="2"/></td>
                    </tr>
                    <tr  bgcolor=" #f9f9f9 ">
                        <td class="data sno">4.</td>
                        <td class="data mid">Current office :<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="data lst"><input type="text" class="inptbox" name="employee_name" id="employee_name" value="<%=current_posting_location%>" index="1" readonly="2" disabled="2"/></td>
                    </tr>
                    <tr>
                        <td class="data sno">5.</td>
                        <td class="data mid">Group :<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="data lst">
                            <select name="group" id="group" class="selDiv">
                                <option value="">select group</option>
                                <option value="A">A</option>
                                <option value="B">B</option>
                            </select>
                        </td>
                    </tr>
                    <tr  bgcolor=" #f9f9f9 ">
                        <td class="data sno">6.</td>
                        <td class="data mid">Home Town :<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="data lst">
                            <select name="selState" id="selState" class="selS" onchange="getDistrict(this)">
                                <option value="">select state</option>
                                <% int i = 0;
                                    String sql = "select state_id,state_name from state_id order by state_name asc";
                                    rs = st.executeQuery(sql);
                                    while (rs.next()) {
                                        i = i + 1;
                                %>
                                <option value="<%=rs.getString("state_id")%>"><%=rs.getString("state_name")%></option>
                                <%
                                    }
                                %> 
                            </select>
                            &nbsp;-&nbsp;
                            <select name="selDistrict" id="selDistrict" class="selD">
                                <option value=''>Select district</option>

                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="data sno">7.</td>
                        <td class="data mid">Whether served at hometown during service :<span style="vertical-align: super; color: #ff0000;">*</span><br/>
                            <font style="color:  #fa0000 "> (if yes please select duration)</font>
                        </td>
                        <td class="data lst">
                            <select name="servedatHometown" id="servedatHometown" class="selDiv" onchange="showspanDivHomtown(this);">
                                <option value="">select</option>
                                <option value="Yes">Yes</option>
                                <option value="No">No</option>
                            </select>
                            <span id="seldateDivHomtown">
                                <div class="HometownDateSelect" style="float: left">Select duration :<span style="vertical-align: super; color: #ff0000;">*</span></div>
                                <div>
                                    <input type="text" name="DateFromHmt" class="datepicker" id="DateFromHmt" placeholder="date from(dd/mm/yyyy)"/><br/>
                                    <input type="text" name="DateToHmt" class="datepicker" id="DateToHmt" placeholder="till date(dd/mm/yyyy)" />
                                </div>
                            </span>
                        </td>
                    </tr>
                    <tr bgcolor=" #f9f9f9 ">
                        <td class="data sno">8.</td>
                        <td class="data mid">Whether served North East Region/Hard Station during service :<span style="vertical-align: super; color: #ff0000;">*</span><br/>
                            <font style="color:  #fa0000 "> (if yes please select duration)</font>
                        </td>
                        <td class="data lst">
                            <select name="servedNER" id="servedNER" class="selDiv" onchange="showspanDivNorthEast(this);">
                                <option value="">select</option>
                                <option value="Yes">Yes</option>
                                <option value="No">No</option>
                            </select>
                            <span id="seldateDivNorthEast">
                                <div  class="NorthEastDateSelect" style="float: left">Select duration :<span style="vertical-align: super; color: #ff0000;">*</span></div>
                                <div style="float: ">
                                    <input type="text" name="DateFromNER" class="datepicker" id="DateFromNER" placeholder="date from (dd/mm/yyyy)" /><br/>
                                    <input type="text" name="DateToNER" class="datepicker" id="DateToNER" placeholder="till date (dd/mm/yyyy)"/>
                                </div>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="btnDiv">
                            <input class="btn clr4" type="reset" value="reset"/>
                            <input type="submit" class="btn clr5" name="Submit" value="Submit" onclick="return validateForm();"/>
                        </td>
                    </tr>
                </table>
            </form>
            <%} else {
                    
                rs1.beforeFirst();
                 while(rs1.next()) 
                 {
                     
                 System.out.println("already updated other info");
                %> 
                <table id="MyTable" align="center">
                    <tr>
                        <td colspan="3" id="mainhead">Details updated</td>
                    </tr>  
                    <tr>
                        <td class="data1 sno">1.</td>
                        <td class="data1 mid">Name :<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="data1 lst"><%=emp_name%></td>
                    </tr>
                    <tr   bgcolor=" #f9f9f9 ">
                        <td class="data1 sno">2.</td>
                        <td class="data1 mid">Designation :<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="data1 lst"><%=current_designation%></td>
                    </tr>
                    <tr>
                        <td class="data1 sno">3.</td>
                        <td class="data1 mid">Email :<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="data1 lst"><%=emp_email%></td>
                    </tr>
                    <tr  bgcolor=" #f9f9f9 ">
                        <td class="data1 sno">4.</td>
                        <td class="data1 mid">Current office :<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="data1 lst"><%=current_posting_location%></td>
                    </tr>
                    <tr>
                        <td class="data1 sno">5.</td>
                        <td class="data1 mid">Group :<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="data1 lst"><%=rs1.getString("job_group")%></td>
                    </tr>
                    <tr  bgcolor=" #f9f9f9 ">
                        <td class="data1 sno">6.</td>
                        <td class="data1 mid">Home Town :<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="data1 lst"><%=rs1.getString("hometown_district_name")%>,&nbsp;<%=rs1.getString("hometown_state_name")%></td>
                    </tr>
                    <tr>

                        <%
                            if ((rs1.getString("served_at_hometown")).equals("Yes")) {
                        %>
                        <td rowspan="2" class="data1 sno">7.</td>
                        <%} else {%>
                        <td class="data1 sno">7.</td>                        
                        <%}%>
                        <td class="data1 mid">Whether served at hometown during service :<span style="vertical-align: super; color: #ff0000;">*</span></td>
                        <td class="data1 lst"><%=rs1.getString("served_at_hometown")%></td>
                    </tr>
                    <%
                     if((rs1.getString("served_at_hometown")).equals("Yes"))
                     {
                    %>
                         <td class="data1 mid">Duration :<span style="vertical-align: super; color: #ff0000;">*</span></td>
                         <td class="data1 lst">From: <%=rs1.getString("served_at_hometown_date_from")%> &nbsp;&nbsp;To: <%=rs1.getString("served_at_hometown_date_to")%></td>
                    <%
                     }
                    %>
                    <tr bgcolor=" #f9f9f9 ">
                        <%
                            if ((rs1.getString("served_at_ner")).equals("Yes")) {
                        %>
                        <td rowspan="2" class="data1 sno">8.</td>
                        <%}else{%>
                        <td class="data1 sno">8.</td>
                        <%}%>
                        <td class="data1 mid">Whether served North East Region/Hard Station during service :<span style="vertical-align: super; color: #ff0000;">*</span><br/></td>
                        <td class="data1 lst"><%=rs1.getString("served_at_ner")%></td>
                    </tr>
                    <%
                            if ((rs1.getString("served_at_ner")).equals("Yes")) {
                      %>
                      <td class="data1 mid">Duration :<span style="vertical-align: super; color: #ff0000;">*</span></td>
                         <td class="data1 lst">From: <%=rs1.getString("served_at_ner_date_from")%> &nbsp;&nbsp;To: <%=rs1.getString("served_at_ner_date_to")%></td>
                      <%}%>
                </table>
            <%                        }
                
                }
                 con.close();
            %>
        </div>
                    <script>
                       function validateForm()
                       {
                           var group=0;
                           var hometownState=0;
                           var hometownDistrict=0;
                           var servedAtHometown=0;
                           var HomeTowndateFrom=0;
                           var HomeTowndateTo=0;
                           var servedNER=0;
                           var servedNERdateFrom=0;
                           var servedNERdateTo=0;
                           
                           group=document.updateOtherdetailEis.group.value;
                           hometownState=document.updateOtherdetailEis.selState.value;
                           hometownDistrict=document.updateOtherdetailEis.selDistrict.value;
                           servedAtHometown=document.updateOtherdetailEis.servedatHometown.value;
                           HomeTowndateFrom=document.updateOtherdetailEis.DateFromHmt.value;
                           HomeTowndateTo=document.updateOtherdetailEis.DateToHmt.value;
                           servedNER=document.updateOtherdetailEis.servedNER.value;
                           servedNERdateFrom=document.updateOtherdetailEis.DateFromNER.value;
                           servedNERdateTo=document.updateOtherdetailEis.DateToNER.value;
                           
                           if(group==null || group=="")
                               {
                                   alert('Please select your group !');
                                   return false;
                               }
                               else if(hometownState==null || hometownState=="")
                                   {
                                       alert('Please select your State !');
                                       return false;
                                   }
                                   else if(hometownDistrict==null || hometownDistrict=="")
                                       {
                                           alert('Please select your District !');
                                           return false;
                                       }
                                       else if(servedAtHometown==null || servedAtHometown=="")
                                           {
                                               alert("Please select, have you worked at your hometown or not ?");
                                               return false
                                           }
                                           else if(servedAtHometown=="Yes")
                                               {
                                                   if(HomeTowndateFrom==null || HomeTowndateFrom=="")
                                                       {
                                                           alert("Please select date since when you worked at your hometown !");
                                                           return false;
                                                       }
                                                       else if(HomeTowndateTo==null || HomeTowndateTo=="")
                                                           {
                                                               alert("Please select date till when you worked at your hometown !");
                                                               return false;
                                                           }
                                               }
                                               if(servedNER==null || servedNER=="")
                                                   {
                                                       alert("Please select, have you worked North East Region or not ?");
                                                       return false;
                                                   }
                                                   else if(servedNER=="Yes")
                                                       {
                                                           if(servedNERdateFrom==null || servedNERdateFrom=="")
                                                               {
                                                                   alert("Please select date since when you worked at North East Region !");
                                                                   return false;
                                                               }
                                                               else if(servedNERdateTo==null || servedNERdateTo=="")
                                                                   {
                                                                       alert("Please select date till when you worked at North East Region !");
                                                                       return false;
                                                                   }
                                                       }
                                                       else
                                                           {
                                                              return true;                                                               
                                                           }
                       }
                       
                       
                        function getDistrict(state)
                        {
                           var data=state.value;
                            if(!(data===null || data===''))
                                {
                                    
                                    var url="getDistrict.jsp?val="+data;

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
                                    }
                         var request;
                                   function getInfo()
                                   {
                                    if(request.readyState==4){
                                     var val=request.responseText;
                                  //   document.getElementById('BeforeSelectField').style.display='none';
                                      document.getElementById('selDistrict').innerHTML=val;
                                     
                                     //document.getElementsByClassName("sortable").innerHTML=val;
                                         }
                                   }
                                   
                                   function showspanDivHomtown(st)
                                   {
                                       var status=st.value;
                                       if(status=="Yes")
                                           {
                                               document.getElementById("seldateDivHomtown").style.display='block';
                                               return false;
                                           }else
                                               {
                                                   document.getElementById("seldateDivHomtown").style.display='none';
                                                    return false;
                                               }
                                   }
                                   function showspanDivNorthEast(st)
                                   {
                                       var status=st.value;
                                       if(status=="Yes")
                                           {
                                               document.getElementById("seldateDivNorthEast").style.display='block';
                                               return false;
                                           }else
                                               {
                                                   document.getElementById("seldateDivNorthEast").style.display='none';
                                                    return false;
                                               }
                                   }
                                   
                    </script>   
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">        
        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {

                $(".datepicker").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    yearRange: "-68:+0",
                    dateFormat: "dd/mm/yy",
                    maxDate: '0'
              /*     monthNamesShort  : fullmonth_array         */

                });
            });
        </script>
    </body>
    <%
        }
        else {
            System.out.println("//////////////////////////////////////////////////////////////Session is null");
    response.sendRedirect("stat.jsp");
}
    %>
</html>
