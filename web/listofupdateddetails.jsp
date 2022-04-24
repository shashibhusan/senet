<%-- 
    Document   : listofupdateddetails
    Created on : 12 Mar, 2021, 1:54:18 PM
    Author     : msme
--%>

<%@page import="java.time.Duration"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" import="java.sql.*,common.*" errorPage="" %>
<%@include file="EIS_menu_header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, common.*" %>
<%@page import="java.util.Random" %>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Updated details</title>
    </script>
        <style>
              #mainDiv
            {
                width: 1250px;
                border: 1px #e2e2e2 solid;
                align:center;
                margin: auto;
                
            }    
            #url-table
                {
                   width: 1050px;
                   margin: auto;
                   align:center;
                   border: 1px  #0000FF  solid;
                   min-height: 72vh;
                   background-color: #ffffff;
                   
                    overflow: auto;
                }
            #maintable{border: 1px solid #dadada;border-collapse: collapse;}
            .head
                {

                    background:  #dadada ;
                    font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
                    border: 1px black solid;
                    
                }
                #maintable
                {
                    
                    width: 170%;
                }
                .data1{
                font: normal normal 10.5px Verdana, Geneva, Arial, Helvetica, sans-serif;
                 border: 1px #e2e2e2 solid;
                 padding: 8px;
            }
            #innerTable
            {
               
            }
            #pst:nth-child(odd)
            {
                 background-color: #f5f5f5;
            }
        </style>
    </head>
    <%
        String Session=(String)session.getAttribute("Session");
        
       if(!Session.equals(null))
            {
                ArrayList<String> email_list=new ArrayList<String>();
                
                Connection con=null;
                ResultSet rs=null;
                ResultSet rs1=null;
                Statement st=null;
                int countPostingHistory=0;
                
                int flagCounter=0;
                try
                {
                    con=ConnectionManager.getConnectionDirectForMySQL();
                    st=con.createStatement();                    
                }
                catch(Exception error)
                {
                    error.printStackTrace();
                }
                
               String email="";
                
    %>
    <body  bgcolor="#ccc">
        <div id="url-table">
            <br/> 
            <div style="width: 20%; " align="left">
               <button id="btnExport" onclick="fnExcelReport();"> Export to excel </button>             

            </div>
            <br/>
            <table id="maintable">
                <tr>
                    <td  class="head" style="width: 10px;">Sno</td>
                    <td  class="head">Name</td>
                    <td  class="head">DOB</td>
                    <td  class="head">Designation</td>
                    <td  class="head">Group</td>
                    <td  class="head">dt of Joining (MSME)</td>
                    <td  class="head">Present Posting</td>
                    <td  class="head" style="width: 100px;">dt of joining (Present posting)</td>
                    <td  class="head" style="width: 70px;">Tenure (present posting)</td>
                    <td  class="head">Hometown</td>
                    <td  class="head" style="width: 160px;">Served at hometown  during service(duration)</td>
                    <td  class="head" style="width: 160px;">Served at NER during  service(duration)</td>
                    <td  class="head"><br/>
                        <table align="center" style="width: 100%;">
                            <tr>
                                <td style="text-align: center" colspan="4" class="head">Posting History</td>
                                
                            </tr>
                            <tr>
                                <td class="head">Office Name</td>
                                <td class="head">Designation</td>
                                <td class="head">From</td>
                                <td class="head">To</td>
                            </tr>
                        </table></td>
                </tr>
                
                <%
               long years=0,months=0,days=0;
               String startdate="";
               String mode="";
               
               String sql1="select a4.sno,a3.cur_ofctype as mode, a4.email as email,a2.name as employee_name,a2.dob as dateofbirth,a3.curr_despln as designation,"
                       + "a4.job_group as job_group,a2.doj_msme as doj_msme,a3.state as current_posting,a3.curr_doj as doj_current,"
                       + "a4.hometown_district_name as district,a4.hometown_state_name as state,a4.served_at_ner as serve_at_ner,"
                       + "a4.served_at_hometown as served_at_hometown,a4.served_at_hometown_date_from as served_at_hometown_date_from,"
                       + "a4.served_at_hometown_date_to as served_at_hometown_date_to,a4.served_at_ner_date_from as served_at_ner_date_from, "
                       + "a4.served_at_ner_date_to as served_at_ner_date_to "
                       + "from eis_data_update_info a1 left join eis_basicinfo a2 on a1.email=a2.email left join eis_postinginfo a3 on a1.email=a3.email "
                       + "left join eis_other_details a4 on a1.email=a4.email left join eis_final_submit_report a5 on a1.email=a5.email "
                       + "where a4.isDisplay=1 and a5.submitflag=1 group by a1.email order by a4.sno asc;";
               
//                 String sql1="select a3.cur_ofctype as mode, a4.email as email,a2.name as employee_name,a2.dob as dateofbirth,a3.curr_despln as designation,a4.job_group as job_group,a2.doj_msme as doj_msme,a3.state as current_posting,"
//                         + "                a3.curr_doj as doj_current,a4.hometown_district_name as district,a4.hometown_state_name as state,a4.served_at_ner as serve_at_ner,a4.served_at_hometown as served_at_hometown,"
//                         + "                a4.served_at_hometown_date_from as served_at_hometown_date_from,a4.served_at_hometown_date_to as served_at_hometown_date_to,a4.served_at_ner_date_from as served_at_ner_date_from,"
//                         + "                a4.served_at_ner_date_to as served_at_ner_date_to "
//                         + "                from eis_data_update_info a1 left join eis_basicinfo a2 on a1.email=a2.email left join eis_postinginfo a3 on a1.email=a3.email "
//                         + "                left join eis_other_details a4 on a1.email=a4.email left join eis_final_submit_report a5 on a1.email=a5.email "
//                         + "                where a4.isDisplay=1 and a5.submitflag=1 group by a1.email;";
                 rs1=st.executeQuery(sql1);
                
                 if(rs1.next())
                 {
                     flagCounter=1;
                     
                   
                 }
 int sno=0;                   
if(flagCounter==1)
{
   rs1.beforeFirst();
    while(rs1.next())
    {
        sno=sno+1;
        ArrayList<String> posthistoryofficename=new ArrayList<String>(); 
        ArrayList<String> designation=new ArrayList<String>(); 
        ArrayList<String> posthistoryFrom=new ArrayList<String>(); 
        ArrayList<String> posthistoryTo=new ArrayList<String>();
        
        System.out.println("====="+rs1.getString("employee_name")+"=="+rs1.getString("email"));
        
        
                     startdate = rs1.getString("doj_current");
                    
                        // System.out.println("date of joining to current post-===" + startdate);
                         SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                         Date date = new Date();
                         String current_time = dateFormat.format(date);

                         DateFormat formatter;
                         formatter = new SimpleDateFormat("dd/MM/yyyy");
                         DateFormat formatter1;
                         formatter1 = new SimpleDateFormat("yyyy-MM-dd");


                         Calendar current_date_format = Calendar.getInstance();

                         try {
                             current_date_format.setTime(dateFormat.parse(current_time));
                         } catch (ParseException da) {
                             da.printStackTrace();
                         }
                         Date d1 = null;
                         try {
                             d1 = formatter.parse(startdate);
                         } catch (ParseException e) {
                             e.printStackTrace();
                         }
                      //   System.out.println("=========" + d1 + "//" + current_date_format.getTime());
                  
                 
                  
                  long diff = current_date_format.getTimeInMillis()-d1.getTime();
                  
                  days=diff/(1000*60*60*24);
                   
                   months=days/30;                   
                   years=months/12;
                   months=months%12;
        
        
        
               //   System.out.println("difference is=="+days+" days");
               //   System.out.println("difference is=="+years+" years");
               //   System.out.println("difference is=="+months+" months");  
        
        
        Connection con1=ConnectionManager.getConnectionDirectForMySQL();
        Statement st1=con1.createStatement();
        String sql5="select * from eis_posthistory where email='"+rs1.getString("email")+"'";
        rs=st1.executeQuery(sql5);
        while(rs.next())
        {
        posthistoryofficename.add(rs.getString("officeName"));
        designation.add(rs.getString("designation"));
        posthistoryFrom.add(rs.getString("phfrom"));
        posthistoryTo.add(rs.getString("phto"));
        }
    con1.close();
    
                   
                 int a=0; 
                  if(years>=1)
                  {
                      a=1;
                //      System.out.println("year and months");
                  }else if(months>0 && years<=0)
                  {
                      a=2;
                //      System.out.println("only months");
                  }
                  else
                  {
                 //      System.out.println("only days");
                  }
                      long working_at_current_station_days=0;
                      long working_at_current_station_months=0;
                      long working_at_current_station_years=0;
                      int daysFlaf=0;
              mode = rs1.getString("mode");
              String from_day_of_working_current_station="";
              if(mode.equals("Promotion"))
                  {
                     System.out.println("for ==testing"+rs1.getString("employee_name"));
                     
if (posthistoryFrom.size() > 0) {
        from_day_of_working_current_station = posthistoryFrom.get(posthistoryFrom.size() - 1);
    } else {

        System.out.println("for " + rs1.getString("employee_name") + " do not have posting history");
        from_day_of_working_current_station = rs1.getString("doj_current");
    }
                      
                      //System.out.println("day_of_working_current_station from="+from_day_of_working_current_station+" of "+rs1.getString("email"));
                      
                      Date d5 = null;
                         try {
                             d5 = formatter.parse(from_day_of_working_current_station);
                         } catch (ParseException e) {
                             e.printStackTrace();
                         }
                      long working_at_current_station = current_date_format.getTimeInMillis()-d5.getTime();
                      
                      working_at_current_station_days=working_at_current_station/(1000*60*60*24);
                      working_at_current_station_months=working_at_current_station_days/30;
                      working_at_current_station_years=working_at_current_station_months/12;
                      working_at_current_station_months=working_at_current_station_months%12;
                      
                     // System.out.println("working at current="+working_at_current_station_days+" days");
                     // System.out.println("working at current="+working_at_current_station_months+" months");
                    //  System.out.println("working at current="+working_at_current_station_years+" years");
                      
                      if(working_at_current_station_years>=1)
                      {
                          
                          daysFlaf=1;
                      }
                      else if(working_at_current_station_months>0 && working_at_current_station_years<=0)
                      {
                          daysFlaf=2;
                      }
                      else if(working_at_current_station_years==0 && working_at_current_station_months==0 && working_at_current_station_days>0)
                      {
                          daysFlaf=3;
                      }
                      
                      
                  }    
                  %>
                <tr>
                    <td class="data1"><%=sno%></td>
                    <td class="data1"><%=rs1.getString("employee_name")%></td>
                    <td class="data1"><%=rs1.getString("dateofbirth")%></td>
                    <td class="data1"><%=rs1.getString("designation")%></td>
                    <td class="data1"><%=rs1.getString("job_group")%></td>
                    <td class="data1"><%=rs1.getString("doj_msme")%></td>
                    <td class="data1"><%=rs1.getString("current_posting")%></td>
                    <%
         if(!mode.equals("Promotion"))
         {
             
                    %>
                    <td class="data1"><%=rs1.getString("doj_current")%></td>  
                    <%
         }else{
          //   System.out.println("date of joining is last joining date");
                    %>
                    <td class="data1"><%=from_day_of_working_current_station%></td> 
                    
                    <%
         }
                    %>
                    <%
        if(!mode.equals("Promotion"))
        {
        if(a==1)
        {
                    %>
                     <td class="data1"><%=years%> years,<%=months%> months </td>
                    <%
        }
        else if(a==2)
        {
                    %>
                    <td class="data1"><%=months%> months </td>
                    <%
        }else{
                    %>
                    <td class="data1"><%=days%> days </td>
                    <%
        }
        }else
        {
        //    System.out.println("in promotion mode");
            if(daysFlaf==1)
            {
        //        System.out.println("======years and months="+working_at_current_station_years+"//"+working_at_current_station_months);
                %>
                     <td class="data1"><%=working_at_current_station_years%> years,<%=working_at_current_station_months%> months </td>
                    <%
            }
            else if(daysFlaf==2)
            {
        //         System.out.println("======months and days="+working_at_current_station_months+"//"+working_at_current_station_days);
                working_at_current_station_days=working_at_current_station_days%30;
                 %>
                     <td class="data1"><%=working_at_current_station_months%> months,<%=working_at_current_station_days%> days </td>
                    <%
            }
            else 
            {
          //       System.out.println("======only days="+working_at_current_station_days);
                 %>
                     <td class="data1"><%=working_at_current_station_days%> days</td>
                    <%
            }
        }
   
                    %>
                   
                    <td class="data1"><%=rs1.getString("district")%>,<%=rs1.getString("state")%></td>
                    <td class="data1"><%=rs1.getString("served_at_hometown")%>
                        <%
                //      System.out.println("hometown worked="+rs1.getString("served_at_hometown"));
                       if ((rs1.getString("served_at_hometown")).equals("Yes")) {
                                
//                          long years1=0,months1=0,days1=0, rdays1;
//                         Date start = null;
//                         Date end = null;
//                         try {
//                             start = formatter.parse(rs1.getString("served_at_hometown_date_from"));
//                            // start = formatter1.parse("2019-01-10");
//                         } catch (ParseException e) {
//                             e.printStackTrace();
//                         }
//                         try {
//                             end = formatter.parse(rs1.getString("served_at_hometown_date_to"));
//                          //   end = formatter1.parse("2019-01-20");
//                         } catch (ParseException e) {
//                             e.printStackTrace();
//                         }
//                         System.out.println("====date formate=====" + start + "//" + end);
//                  
//                 
//                  
//                  long duration = end.getTime()-start.getTime();
//                  
//                  days1=duration/(1000*60*60*24);
//                   
//                   months1=days1/(long)30.41;                   
//                   years1=months1/12;
//                   rdays1=days1%30;
//                  
//                   System.out.println("duration=="+days1+" days");
//                   System.out.println("duration=="+months1+" months");
//                   System.out.println("duration=="+years1+" years");
//                   int a1=0; 
//                  if(years1>=1)
//                  {
//                      a1=1;
//                      System.out.println("year and months");
//                  }else if(months1>0 && years1<=0)
//                  {
//                      a1=2;
//                      System.out.println("only months and days");
//                  }
//                  else
//                  {
//                       System.out.println("only days");
//                  }
                        %>
                        <div> <%=rs1.getString("served_at_hometown_date_from")%>-<%=rs1.getString("served_at_hometown_date_to")%></div> 
                          <%--
                                if(a1==1)
                                {
                                    %>
                                    <b>    <%=years1%> year, <%=days1%> month</b>
                                    <%
                                }
                                else if(a1==2)
                                {
                                    %>
                                    <b>  <%=months1%> month, <%=rdays1%> days</b>
                                    <%
                                }
                                else
                                {
                                    %>
                                    <b>  <%=rdays1%> days</b>
                                    <%
                                }
                          --%>  
                        <%
                          //      System.out.println("hometown worked start date "+rs1.getString("served_at_hometown_date_from"));
                            }
                        %>


                    </td>
                    <td class="data1"><%=rs1.getString("serve_at_ner")%>
         <%
        if ((rs1.getString("serve_at_ner")).equals("Yes")) {

//                long years1 = 0, months1 = 0, days1 = 0, rdays1;
//                Date start = null;
//                Date end = null;
//                try {
//                    start = formatter.parse(rs1.getString("served_at_ner_date_from"));
//                    // start = formatter1.parse("2019-01-10");
//                } catch (ParseException e) {
//                    e.printStackTrace();
//                }
//                try {
//                    end = formatter.parse(rs1.getString("served_at_ner_date_to"));
//                    //   end = formatter1.parse("2019-01-20");
//                } catch (ParseException e) {
//                    e.printStackTrace();
//                }
//                System.out.println("====date formate NER=====" + start + "//" + end);
//
//
//
//                long duration = end.getTime() - start.getTime();
//
//                days1 = duration / (1000 * 60 * 60 * 24);
//
//                months1 = days1 / (long) 30.41;
//                years1 = months1 / 12;
//                rdays1 = days1 % 30;
//
//                System.out.println("duration==" + days1 + " days");
//                System.out.println("duration==" + months1 + " months");
//                System.out.println("duration==" + years1 + " years");
//                int a1 = 0;
//                if (years1 >= 1) {
//                    a1 = 1;
//                    System.out.println("year and months");
//                } else if (months1 > 0 && years1 <= 0) {
//                    a1 = 2;
//                    System.out.println("only months and days");
//                } else {
//                    System.out.println("only days");
//                }
//                
//                
               %>
               <div> <%=rs1.getString("served_at_ner_date_from")%>-<%=rs1.getString("served_at_ner_date_to")%></div> 
               <%--
                if(a1==1)
                                {
                                    %>
                                    <b>    <%=years1%> year, <%=days1%> month</b>
                                    <%
                                }
                                else if(a1==2)
                                {
                                    %>
                                    <b>  <%=months1%> month, <%=rdays1%> days</b>
                                    <%
                                }
                                else
                                {
                                    %>
                                    <b>  <%=rdays1%> days</b>
                                    <%
                                }
                --%>
                <%
            }
        
                        %>
                    </td>
                    <td class="data1">
                        <table id="innerTable" style="width: 100%; text-align: left;">

                            <%
                                for (int j = 0; j < posthistoryofficename.size(); j++) {
                            %>
                            <tr id="pst">
                                <td><%=posthistoryofficename.get(j)%></td>
                                <td><%=designation.get(j)%></td>
                                <td><%=posthistoryFrom.get(j)%></td>
                                <td><%=posthistoryTo.get(j)%></td>
                            </tr>
                            <%
                                }
                            %>
                        </table>
                    </td>
                    
                </tr>
                <%}}%>
            </table>
        </div>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
           <script>
              function fnExcelReport()
              {
                  var tab_text="<table border='1px'><tr bgcolor='#87AFC6'>";
                    var textRange; var j=0;
                    tab = document.getElementById('maintable'); // id of table

                    for(j = 0 ; j < tab.rows.length ; j++) 
                    {     
                        tab_text=tab_text+tab.rows[j].innerHTML+"</tr>";
                        //tab_text=tab_text+"</tr>";
                    }

                    tab_text=tab_text+"</table>";
                    tab_text= tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
                    tab_text= tab_text.replace(/<img[^>]*>/gi,""); // remove if u want images in your table
                    tab_text= tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params

                    var ua = window.navigator.userAgent;
                    var msie = ua.indexOf("MSIE "); 

                    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer
                    {
                        txtArea1.document.open("txt/html","replace");
                        txtArea1.document.write(tab_text);
                        txtArea1.document.close();
                        txtArea1.focus(); 
                        sa=txtArea1.document.execCommand("SaveAs",true,"Say Thanks to Sumit.xls");
                    }  
                    else                 //other browser not tested on IE 11
                        sa = window.open('data:application/vnd.ms-excel,' + encodeURIComponent(tab_text));  

                    return (sa);
              }
            </script>
        <script>
//            $(document).ready(function(){
//$("#btnExport").click(
//            function () {
//                tableToExcel('maintable','test','Updated Report of EIS');
//            }            
//        );
//})
//function getIEVersion()
//// Returns the version of Windows Internet Explorer or a -1
//// (indicating the use of another browser).
//{
//    var rv = -1; // Return value assumes failure.
//    if (navigator.appName == 'Microsoft Internet Explorer') {
//        var ua = navigator.userAgent;
//        var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
//        if (re.exec(ua) != null)
//            rv = parseFloat(RegExp.$1);
//    }
//    return rv;
//}
//
//function tableToExcel(table, sheetName, fileName) {
//    
//
//    var ua = window.navigator.userAgent;
//    var msie = ua.indexOf("MSIE ");
//    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer
//    {
//        return fnExcelReport(table, fileName);
//    }
//
//    var uri = 'data:application/vnd.ms-excel;base64,',
//        templateData = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>',
//        base64Conversion = function (s) { return window.btoa(unescape(encodeURIComponent(s))) },
//        formatExcelData = function (s, c) { return s.replace(/{(\w+)}/g, function (m, p) { return c[p]; }) }
//
//    $("tbody > tr[data-level='0']").show();
//
//    if (!table.nodeType)
//        table = document.getElementById(table)
//
//    var ctx = { worksheet: sheetName || 'Worksheet', table: table.innerHTML }
//
//    var element = document.createElement('a');
//    element.setAttribute('href', 'data:application/vnd.ms-excel;base64,' + base64Conversion(formatExcelData(templateData, ctx)));
//    element.setAttribute('download', fileName);
//    element.style.display = 'none';
//    document.body.appendChild(element);
//    element.click();
//    document.body.removeChild(element);
//
//    $("tbody > tr[data-level='0']").hide();
//}
//
//function fnExcelReport(table, fileName) {
//    
//    var tab_text = "<table border='2px'>";
//    var textRange;
//
//    if (!table.nodeType)
//        table = document.getElementById(table)
//
//    $("tbody > tr[data-level='0']").show();
//    tab_text =  tab_text + table.innerHTML;
//
//    tab_text = tab_text + "</table>";
//    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
//    tab_text = tab_text.replace(/<img[^>]*>/gi, ""); // remove if u want images in your table
//    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params
//
//    txtArea1.document.open("txt/html", "replace");
//    txtArea1.document.write(tab_text);
//    txtArea1.document.close();
//    txtArea1.focus();
//    sa = txtArea1.document.execCommand("SaveAs", false, fileName + ".xls");
//    $("tbody > tr[data-level='0']").hide();
//    return (sa);
//}
        </script>
                
    </body>
    <%
con.close();
if(con!=null)
{
    con.close();
}
if(rs!=null)
{
    rs.close();
}
if(rs1!=null)
{
    rs1.close();
}
if(st!=null)
{
    st.close();
}

            }else
       {
           %>
           <jsp:forward page="EIS_adError.jsp" />
           <%
       }
    %>
</html>
