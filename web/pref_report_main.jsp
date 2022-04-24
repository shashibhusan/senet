<%-- 
    Document   : pref_report_main
    Created on : 8 May, 2019, 4:17:18 PM
    Author     : Senet
--%>
<%@page language="java" import="java.sql.*,common.*" errorPage="" %>
<%@include file="EIS_menu_header.jsp" %>
<%@page import="com.updategovemail.RandomString" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
              #mainDiv
            {
                width: 1250px;
                border: 1px #e2e2e2 solid;
                align:center;
                margin: auto;
                
            }            
            
#dataIn:hover{
    background-color:  #d7e4bf ;
}

#head
{
    
    background:  #dadada ;
    padding: 8px;
    font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
}
#color:hover
{
    background:  #e9e8e8;
}
#data{
   padding: 4px 0px 4px 2px;;
   border: 1px  #cacaca  solid;
   border-collapse: collapse;
   font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
}
#url-table
{
   width: 1050px;
   margin: auto;
   align:center;
   border: 1px  #cacaca  solid;
   min-height: 72vh;
   background-color: #ffffff;
}
table, tr,th, td {border-collapse: collapse;
border: 1px #000000 solid;}
#myTable
{
    width: 95%;
    border: 1px #000000 solid;
}
@media print
            {
             .mainDivR{
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                width: 990px;
                border: 1px black solid;
                }
              .content{
                  border: 1px black solid;

            }
                body {
                    line-height: 1.1;
                }
                .hide
                {
                    display: none !important;
                }
                .pr{width: 990px;
                    page-break-inside:auto }
                .tr-data{ page-break-inside:avoid;}
                #url-table
                {
                    font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                    height: 100%;
                }
            }
        </style>
    </head>
        
        <style>

            #mytable
            {
                width: 95%;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color: #996000 ;
            }
            .head
            {
                padding: 4px;
                ont: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            #headtr
            {
                background-color:  #eee5d2 ;
            }
            table tr td{
                border: 1px #d6bd8a solid;
            }
            td{
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                            }
            .loop
            {
                text-align: left;
                font: normal normal 10px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 2px;
            }
            #dataIn:hover
            {
                background-color:  #f3ecdd ;
            }
            table,tr,td{border-collapse: collapse;}
            .error{
                width: 100%;
                margin: auto;
                text-align: center;
                color:  #9f1300 ;
                font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 10px;
            }
            #search-head
            {
                width: 100%;
                font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                color: #996000 ;
                padding: 2px 0px 8px 4px;
                line-height: 25px;
                margin-top: 15px;
            }
            #print
            {
                width: 100%;
                margin: auto;
                align:right;
            }
            
        </style>
        <script src="javaScript/sorttable.js"></script>
    </head>
    
    <%
        
        String key =(String)session.getAttribute("userType");
        
       // if(!key.equals(null))
        if(1==1)
        {
          String email = (String)session.getAttribute("userEmail");
          
          String sql="";
          String sqlForOldReport="";
          
          String pref_one=request.getParameter("first");
          String pref_two=request.getParameter("second");
          String pref_three=request.getParameter("third");
          String head="";
          
          if(!pref_one.equals("") && pref_two.equals("") && pref_three.equals(""))
          {
              sql="select * from eis_postinginfo a join eis_basicinfo b on a.email=b.email where a.pst_pref_1='"+pref_one+"' and a.time_of_update_preferences!=''";
              sqlForOldReport="select * from eis_postinginfo a join eis_basicinfo b on a.email=b.email where a.pst_pref_1='"+pref_one+"' and a.time_of_update_preferences=''";
              head="Search for 1st pref :&nbsp;<b>"+pref_one+"</b> , 2nd pref : any and 3rd pref : any ";
          }
          else if(pref_one.equals("") && !pref_two.equals("") && pref_three.equals(""))
          {
              sql="select * from eis_postinginfo a join eis_basicinfo b on a.email=b.email where a.pst_pref_2='"+pref_two+"' and a.time_of_update_preferences!=''";
              sqlForOldReport="select * from eis_postinginfo a join eis_basicinfo b on a.email=b.email where a.pst_pref_2='"+pref_two+"' and a.time_of_update_preferences=''";
              head="Search for 1st pref : any , 2nd pref : &nbsp;<b>"+pref_two+"</b>  and 3rd pref : any ";
          }
          else if(pref_one.equals("") && pref_two.equals("") && !pref_three.equals(""))
          {
              sql="select * from eis_postinginfo a join eis_basicinfo b on a.email=b.email where a.pst_pref_3='"+pref_three+"' and a.time_of_update_preferences!=''";
              sqlForOldReport="select * from eis_postinginfo a join eis_basicinfo b on a.email=b.email where a.pst_pref_3='"+pref_three+"' and a.time_of_update_preferences=''";
              head="Search for 1st pref : any , 2nd pref : any and 3rd pref : &nbsp;<b>"+pref_three+"</b> ";
          }
          else if(!pref_one.equals("") && !pref_two.equals("") && pref_three.equals(""))
          {
              sql="select * from eis_postinginfo a join eis_basicinfo b on a.email=b.email where a.pst_pref_1='"+pref_one+"' and a.pst_pref_2='"+pref_two+"' and a.time_of_update_preferences!=''";
              sqlForOldReport="select * from eis_postinginfo a join eis_basicinfo b on a.email=b.email where a.pst_pref_1='"+pref_one+"' and a.pst_pref_2='"+pref_two+"' and a.time_of_update_preferences=''";
              head="Search for 1st pref :&nbsp;<b>"+pref_one+"</b> , 2nd pref : &nbsp;<b>"+pref_two+"</b> and 3rd pref : any ";
          }
          else if(pref_one.equals("") && !pref_two.equals("") && !pref_three.equals(""))
          {
              sql="select * from eis_postinginfo a join eis_basicinfo b on a.email=b.email where a.pst_pref_2='"+pref_two+"' and a.pst_pref_3='"+pref_three+"' and a.time_of_update_preferences!=''";
              sqlForOldReport="select * from eis_postinginfo a join eis_basicinfo b on a.email=b.email where a.pst_pref_2='"+pref_two+"' and a.pst_pref_3='"+pref_three+"' and a.time_of_update_preferences=''";
              head="Search for 1st pref : any , 2nd pref :&nbsp;<b>"+pref_two+"</b> and 3rd pref : &nbsp;<b>"+pref_three+"</b> ";
          }
          else if(!pref_one.equals("") && pref_two.equals("") && !pref_three.equals(""))
          {
              sql="select * from eis_postinginfo a join eis_basicinfo b on a.email=b.email where a.pst_pref_1='"+pref_one+"' and a.pst_pref_3='"+pref_three+"' and a.time_of_update_preferences!=''";
              sqlForOldReport="select * from eis_postinginfo a join eis_basicinfo b on a.email=b.email where a.pst_pref_1='"+pref_one+"' and a.pst_pref_3='"+pref_three+"' and a.time_of_update_preferences=''";
              head="Search for 1st pref :&nbsp;<b>"+pref_one+"</b> , 2nd pref : any and 3rd pref : &nbsp;<b>"+pref_three+"</b> ";
          }
          else if(!pref_one.equals("") && !pref_two.equals("") && !pref_three.equals(""))
          {
              sql="select * from eis_postinginfo a join eis_basicinfo b on a.email=b.email where a.pst_pref_1='"+pref_one+"' and a.pst_pref_2='"+pref_two+"' and a.pst_pref_3='"+pref_three+"' and a.time_of_update_preferences!=''";
              sqlForOldReport="select * from eis_postinginfo a join eis_basicinfo b on a.email=b.email where a.pst_pref_1='"+pref_one+"' and a.pst_pref_2='"+pref_two+"' and a.pst_pref_3='"+pref_three+"' and a.time_of_update_preferences=''";
              head="Search for 1st pref : &nbsp;<b>"+pref_one+"</b> , 2nd pref :&nbsp;<b>"+pref_two+"</b> and 3rd pref : &nbsp;<b>"+pref_three+"</b> ";
          }
          
          
          
    %>
 
       <%
        String Session=(String)session.getAttribute("Session");
        
       if(!Session.equals(null))
            {
    %>  
        
        <%
          Connection con=null;
          ResultSet rs=null;
          Statement st=null;
          int flagCount=0;
          
          RandomString randomString = new RandomString();
          try
          {
              con=ConnectionManager.getConnectionDirectForMySQL();
              st=con.createStatement();
              rs=st.executeQuery(sql);
              System.out.println("Queru used for the reportis ++++++++++++"+sql);
              while(rs.next())
              {
                flagCount=1;  
              }              
          }
          catch(Exception err)
          {
              err.printStackTrace();
          }
          System.out.println("the value of flagCount is -----"+flagCount);
        %>
        <body bgcolor="#ccc">
         <div id="url-table" >
                      <div id="search-head">
               <%=head%>
           </div>
            <table align="center" class="sortable" id="mytable">
                
                <thead id="headtr">
                    <td class="head" style="width: 5%; text-align: center">S.no.<a class="hide" href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                    <td class="head" style="width: 14%;">Name<a class="hide" href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                    <td class="head" style="width: 15%;">Designation<a class="hide" href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                    <td class="head" style="width: 13%;">Current Office<a class="hide" href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                    <td class="head" style="width: 8%;">Curr. DOJ<a class="hide" href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                    <td class="head" style="width: 12%;">Pref. one<a class="hide" href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                    <td class="head" style="width: 12%;">Pref. two<a class="hide" href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                    <td class="head" style="width: 12%;">Pref. three<a class="hide" href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>
                    <td class="head" style="width: 8%; text-align: center;">DOR<a class="hide" href="#"><img align="right" src="eis_image/filter_sort_788142.png" height="10" width="10"/></a></td>                    
                </thead>
              <%
          int i=0;
          if(flagCount==1)
          {
            rs=st.executeQuery(sql); 
          while(rs.next())
          {
              i=i+1;
              %>
              <tr  id="dataIn">
                  <td class="loop" style="text-align: center"><%=i%>.</td>   
                  <td class="loop"><a href="searchFinal.jsp?nMhds495ds6fhXxQjd=<%=rs.getString("b.token")%>&sec$key=/topics/<%=randomString.getAlphaNumericString(100)%>?hl=hi&gl=IN&ceid=IN%3Ahi"><%=rs.getString("name")%></a></td>   
                  <td class="loop"><%=rs.getString("a.curr_despln")%></td>   
                  <td class="loop"><%=rs.getString("a.state")%></td>   
                  <td class="loop" style="text-align: center"><%=rs.getString("a.curr_doj")%></td>   
                  <td class="loop"><%=rs.getString("a.pst_pref_1")%></td>   
                  <td class="loop"><%=rs.getString("a.pst_pref_2")%></td>   
                  <td class="loop"><%=rs.getString("a.pst_pref_3")%></td>   
                  <td class="loop" style="text-align: center"><%=rs.getString("b.dat_ret")%></td>   
              </tr>
              <%
          }
          }else
          {
              %>
              <tr>
                  <td colspan="9" class="error">
                      No result found for your search. Please try again later.
                  </td>
              </tr>
              
              <%              
          }
              %>
            </table>
             <div style="height: 10px;"></div> 
            <table align="center">
                <tr>
                    <td>
                        <input type="submit" value="print" onclick="window.print()"/>
                    </td>
                </tr>
            </table>
         <div style="height: 10px;"></div>  
         
        </div>
          
    </body>
    <%
          if(!rs.equals(null))
          {
              rs.close();
              st.close();
              con.close();
          }
             }else
                   {
                       response.sendRedirect("error.html");
                   }
        
    %>
    <%
            }else
       {
           %>
           <jsp:forward page="EIS_adError.jsp" />
           <%
       }
    %>
</html>
