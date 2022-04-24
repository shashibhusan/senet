<%-- 
    Document   : retired_officer_detail
    Created on : 2 Dec, 2019, 4:21:53 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, common.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@include file="EIS_menu_header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details</title>
          <style>

            #head
            {
                font: normal normal 15px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 8px;
                background-color: #e4e4e4;
            }
            #head1
            {
                font: normal normal 15px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 8px;
                background-color:  #d8d8d8 ;
            }
           table tr td
            {
                border: 1px  #cacaca  solid;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 2px;
            }
            #mytable{
                width: 85%;
            }
            #data{
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 5px;
            }
            #data1
            {
                width: 29%;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 2px;
            }
            #sno{
                width: 9%;
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
a:visited
{
    color: blue ;
}
#header
        {
            padding: 8px 3px 6px 8px;
            font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
            background-color:  #e1e1e1 ;
        }
        a
        {
            text-decoration: none;
        }
a:hover {
   cursor: url;
   text-decoration: underline;
}

        </style>
    </head>
    <%
        String Session=(String)session.getAttribute("Session");
        String username=(String)session.getAttribute("username");
        session.setAttribute("username",username);
        session.setAttribute("Session",Session);
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        System.out.println("session value is="+Session);
       
        if(!Session.equals(null))
            {
        %>
   <body bgcolor="#ccc">
        <div id="url-table" align="center">
                <%
                    String client=request.getParameter("s");
                    
                    
                    String desig=request.getParameter("de");
                    
                    System.out.println("=====old==========="+client);
                    String designation="";
                    if(desig.equals("gahs-gd$b-dasf-hdra-tdeh")){designation="Director";}
                    if(desig.equals("gahs-gd$b-dajf-hdra-tdeh")){designation="Dy. Director";}
                    if(desig.equals("gahs-gd$b-dasf-hdnb-tdeh")){designation="AIA";}
                    if(desig.equals("gahs-gd$b-dasf-hdra-ddeh")){designation="Asstt. Director Grade-I";}
                    if(desig.equals("gahs-gd$b-dasf-hdra-tdih")){designation="Asstt. Director Grade-II";}
                    if(desig.equals("gahs-gd$b-da8f-hdra-tdeh")){designation="Office Superitendent";}
                    if(desig.equals("ga4s-g7$b-das5-hd5a-t48h")){designation="Investigator";}
                    
                    String token="";
                    
                    long a = 4534545345345445L;
                    String rand = Long.toString((long) (Math.random() * a));
                    
                    String sql="select bas.token as token, bas.name as name, bas.bas_designation as designation, bas.bas_descipline as discipline, bas.dat_ret as dor from eis_basicinfo bas where bas.bas_designation='"+designation+"'";
                    
                    Connection con=null;
                    ResultSet rs=null;
                    Statement st=null;
                    
                    try
                    {
                        con=ConnectionManager.getConnectionDirectForMySQL();
                        st=con.createStatement();
                    }
                    catch(Exception sqlerr)
                    {
                        sqlerr.printStackTrace();
                    }
                    
                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                    Date date = new Date();
                    String current_time=dateFormat.format(date);

                    DateFormat formatter;
                    formatter = new SimpleDateFormat("dd/MM/yyyy");


                    Calendar current_date_format = Calendar.getInstance();
            
                    try{
                        current_date_format.setTime(dateFormat.parse(current_time));
                        }catch(ParseException da)
                        {
                        da.printStackTrace();
                        }
            
            String ret_Date="";
            Date date_temp=null;
                    
                    
                %>      
                      <div id="mainDiv">
                          <%
            if(client.equals("OxZc"))
            {
                          %>
                          <h3 align="left" id="head">Retired List of <b><%=designation%>  </b> till last month:</h3>
                <%
            }
            else if(client.equals("OxZg"))
            {
                %>
                <h3 align="left" id="head"> <b><%=designation%> </b> going to retired next month:</h3>
                <%
            }
                %>        
                        <table id="mytable">
                            <tr>
                                <td id="header" style="width: 5%;">Sno</td>
                                <td id="header" style="width: 27%;">Name</td>
                                <td id="header" style="width: 27%;">Designation</td>
                                <td id="header" style="width: 25%;">Discipline</td>
                                <td id="header" style="width: 16%;">Dt. of Retirement</td>
                            </tr>
                            <%
                             int sno=0;
                             rs=st.executeQuery(sql);
                             while(rs.next())
                             { 
                                token=rs.getString("token");
                                 
                                 ret_Date=rs.getString("dor");
                                 date_temp = (Date) formatter.parse(ret_Date);
                                 if(client.equals("OxZc"))
                                 {
                                 if(date_temp.before(current_date_format.getTime()) || date_temp.equals(current_date_format.getTime()))
                                    {
                                        sno=sno+1;
                                %>
                                
                                        <tr>
                                            <td id="data"><%=sno%></td>
                                            <td id="data"><a href="retired_employee_detail.jsp?0xZc-OzUv-Qxfy=<%=token%>&t=<%=rand%>"><%=rs.getString("name")%></a></td>
                                            <td id="data"><%=rs.getString("designation")%></td>
                                            <td id="data"><%=rs.getString("discipline")%></td>
                                            <td id="data"><%=rs.getString("dor")%></td>
                                        </tr>
                                
                            <%
                                    }
                                 }
                                 else if(client.equals("OxZg"))
                                 {
                                        String next_ret="";
                                        int i=0;
                                        Calendar cal1 = Calendar.getInstance();
                                        Calendar current = Calendar.getInstance();
                                        DateFormat cur_format1;
                                        Date date_ret=null;
                                        cur_format1 = new SimpleDateFormat("dd/MM/yyyy");
                                        next_ret=rs.getString("dor");
                            
                                        date_ret = (Date) formatter.parse(next_ret);

                                        try{

                                                    cal1.setTime(dateFormat.parse(current_time));
                                                    }catch(ParseException e){
                                                            e.printStackTrace();
                                                     }
                                        Date cur=cal1.getTime();
                                               cal1.add(Calendar.MONTH,1);
                                         Date curplus30=cal1.getTime();
                                         
                                         if(date_ret.after(cur) && date_ret.before(curplus30))
                                            {
                                                i=i+1;
                                                 %>
                                                <tr>
                                                    <td id="data"><%=i%></td>
                                                    <td id="data"><a href="retired_employee_detail.jsp?0xZc-OzUv-Qxfy=<%=token%>&t=<%=rand%>"><%=rs.getString("name")%></a></td>
                                                    <td id="data"><%=rs.getString("designation")%></td>
                                                    <td id="data"><%=rs.getString("discipline")%></td>
                                                    <td id="data"><%=rs.getString("dor")%></td>
                                                </tr>
                                     
                                     
                                     <%
                                            }
                                 }
                             }
                            %>
                        </table>
                        <br/>
                      </div>
                      <br/>
                      <br/>
     </div>
    </body>
    <%
            }else
                {
            %>
            <jsp:forward page="EIS_adError.jsp" />
            <%}%>
</html>
