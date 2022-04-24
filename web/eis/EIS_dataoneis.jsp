<%-- 
    Document   : EIS_dataoneis
    Created on : Feb 12, 2018, 3:25:56 PM
    Author     : Senet
--%>

<%@page language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.text.ParseException" %>
<%@page import="java.text.*"%>
<%@page import="java.lang.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="EIS_menu_header.jsp" %>
<html>
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <title>Info</title>
        <style>
h3{
                margin-top: -35px;
}
#data
     {
     width: 90%;
     
     }
 #data1{
         font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
         font-weight: normal;

}
.loop{
     font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
     border: 1px  #bbbbbb  solid;
     padding: 3px 3px ;
     text-align: center;
   
}
.loop1{
     font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
     border: 1px  #bbbbbb  solid;
     padding: 3px 3px ;
     text-align: left;

}

.head{
     padding: 8px 3px 6px 8px;
     font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
     background-color:  #e1e1e1 ;
     border: 1px  #bbbbbb  solid;
}

table, th, tr,td { border-collapse: collapse;}


#dataIn:hover{
    background-color:  #d7e4bf ;
}
.heading
{
    font: normal normal 17px Verdana, Geneva, Arial, Helvetica, sans-serif;
    padding: 8px;
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
 <script src="javaScript/sorttable.js"></script>
    </head>
    <body bgcolor="#ccc">
        
        <div id="url-table" align="center" >
           <br/><br/>
           
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
        <h3 align="center" class="heading">EIS Data ( Designation )</h3>

            <table id="data">
            <thead>
                <th width="40px;" class="head">S. No.</th>
                <th width="190px;"class="head">Institute Name</th>
                <th width="60px;" class="head">AIA </th>
                <th width="60px;" class="head">Director</th>
                <th width="60px;" class="head">DD</th>
                <th width="60px;" class="head">AD-I</th>
                <th width="60px;" class="head">AD-II</th>
                <th width="60px;" class="head">Investigator</th>
                <th width="60px;" class="head">OS</th>
                <th width="60px;" class="head">Total</th>
            </thead>
            <%
            int count=0;
            
            Connection con1=null;
               ResultSet rs1=null;
               ArrayList<String> instId=new ArrayList<String>();
               ArrayList<String> instName=new ArrayList<String>();
               try{
               con1 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt1 = con1.createStatement();
    String sql1="select * from eis_branch_list;";
    rs1=stmt1.executeQuery(sql1);
    while(rs1.next())
        {
        instId.add(rs1.getString("Inst_id"));
    }
    }
               catch(Exception e){
                   e.printStackTrace();
                   }




               try{
               con1 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt1 = con1.createStatement();
                for(count=0; count<instId.size(); count++)
                {
    String sql1="select * from eis_branch_list where Inst_id='"+instId.get(count)+"'";
    rs1=stmt1.executeQuery(sql1);
    while(rs1.next())
        {
        instName.add(rs1.getString("Inst_Name"));
    }
    }
               con1.close();
               }
               catch(Exception e1){
                   e1.printStackTrace();
}

int Taia=0,Tdir=0, Tdd=0, Tad_1=0,Tad_2=0,Tinvs=0,Tos=0, Ttotal=0, Ftotal=0;
               
               try{
               con1 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt1 = con1.createStatement();
               for(count=0; count<instId.size(); count++){
                   int aia=0;
            int dir=0, dd=0, ad_1=0,ad_2=0,invs=0,os=0, total=0;

    String sql1="select * from eis_basicinfo a JOIN eis_postinginfo b ON a.email=b.email where a.inst_id='"+instId.get(count)+"'";
    rs1=stmt1.executeQuery(sql1);
    while(rs1.next())
        {
    if(rs1.getString("b.curr_despln").equals("AIA")){aia=aia+1;}
    if(rs1.getString("b.curr_despln").equals("Director")){dir=dir+1;}
    if(rs1.getString("b.curr_despln").equals("Dy. Director")){dd=dd+1;}
    if(rs1.getString("b.curr_despln").equals("Asstt. Director Grade-I")){ad_1=ad_1+1;}
    if(rs1.getString("b.curr_despln").equals("Asstt. Director Grade-II")){ad_2=ad_2+1;}
    if(rs1.getString("b.curr_despln").equals("Investigator")){invs=invs+1;}
    if(rs1.getString("b.curr_despln").equals("Office Superitendent")){os=os+1;}
    
    }
    Tdir=Tdir+dir;
    Taia=Taia+aia;
    Tdd=Tdd+dd;
    Tad_1=Tad_1+ad_1;
    Tad_2=Tad_2+ad_2;
    Tinvs=Tinvs+invs;
    Tos=Tos+os;

total=aia+dir+dd+ad_1+ad_2+invs+os;
    
    %>
    <tr id="dataIn">
        <td class="loop"><%=count+1%></td>
        <td class="loop1"><%=instName.get(count)%></td>
        <td class="loop"><%=aia%></td>
        <td class="loop"><%=dir%></td>
        <td class="loop"><%=dd%></td>
        <td class="loop"><%=ad_1%></td>
        <td class="loop"><%=ad_2%></td>
        <td class="loop"><%=invs%></td>
        <td class="loop"><%=os%></td>
        <td class="loop"><%=total%></td>
    </tr>



            <%
    }
               con1.close();
      }         catch(Exception ex){
                   ex.printStackTrace();
                   }
Ftotal=Ftotal+Taia+Tdir+Tdd+Tad_1+Tad_2+Tinvs+Tos;
            %>
            <tr>
                <td colspan="2" class="loop">Total</td>
                <td class="loop"><%=Taia%></td>
                <td class="loop"><%=Tdir%></td>
                <td class="loop"><%=Tdd%></td>
                <td class="loop"><%=Tad_1%></td>
                <td class="loop"><%=Tad_2%></td>
                <td class="loop"><%=Tinvs%></td>
                <td class="loop"><%=Tos%></td>
                <td class="loop"><%=Ftotal%></td>
            </tr>
        </table>
            <%
            }else
                {
            %>
            <jsp:forward page="EIS_adError.jsp" />
            <%}%>
            <br/>
       </div>
       
    </body>
</html>
