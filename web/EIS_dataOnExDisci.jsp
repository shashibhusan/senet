<%-- 
    Document   : EIS_dataOnExDisci
    Created on : Mar 15, 2018, 11:04:01 AM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.text.ParseException" %>
<%@page import="java.text.*"%>
<%@page import="java.lang.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Info</title>
        <style>
            h3{
                margin-top: -35px;
}
            #data{
                 font-family: Bookman Old Style;
                font-weight: normal;
                border: 1px black solid;


}
 #data1{
                 font-family: Bookman Old Style;
                font-weight: normal;
               font-size: 13px;

}
.loop{
     font-family: Bookman Old Style;
     font-size: 13px;
     border: 1px black solid;
     padding: 3px 3px ;
     text-align: center;

}
.loop1{
     font-family: Bookman Old Style;
     font-size: 13px;
     border: 1px black solid;
     padding: 3px 3px ;
     text-align: left;

}
.head{
     font-family: Bookman Old Style;
     height: 25px;
     background:  #4b5eb6 ;
     color: white;
     font-size: 14px;
     border: 1px white solid;
     
}
table, th, tr,td { border-collapse: collapse;}
ul {
    list-style-type: none;
    background-color: #efeede;
    padding: 0;
    overflow: hidden;
    margin-top: 0px;
    margin-bottom: 40px;

}

li {
    float: left;



}

li a {
    display: inline-block;
    color: Blue;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    font-family: Georgia;
    font-size: 17px;
}

li a:hover {
   cursor: url;
}
li:hover{
    background-color:   #d6cf6f  ;
}
tr:hover{
   background-color:   #d6cf6f  ;
   color: white;
}
        </style>

    </head>
    <body>
        <table align="center" width="1250px">
            <tr>
                <td align="center">
                  <ul>
                      <li id="link"><a href="EIS_dataoneis.jsp">Home</a></li>
                      <li id="link"><a href="searchInfo.jsp">Search on EIS</a></li>
                      <li id="link"><a href="EIS_instwise.jsp">Institute Wise Data</a></li>
                     <%--       <li id="link"><a href="EIS_dataOnExDisci.jsp">Discipline Wise Data</a></li> --%>
                      <li id="link"><a href="EIS_report_BySelecting_Inst.jsp">Discipline Wise Report</a></li>
                      <li id="link"><a HREF="EISadlogout.jsp" >Logout</a></li>
                     </ul>
                </td>
            </tr>
        </table>
        <%
        String Session=(String)session.getAttribute("Session");
        session.setAttribute("Session",Session);
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        System.out.println("session value is="+Session);

        if(!Session.equals(null))
            {
        %>
        <center>
            <h3 class="heading">EIS Data ( Discipline )</h3>
            <table id="data">
            <tr>
                <th width="50px;" class="head">S. No.</th>
                <th width="200px;" class="head">Discipline</th>
                <th width="60px;" class="head">AIA </th>
                <th width="60px;" class="head">DIR</th>
                <th width="60px;" class="head">DD</th>
                <th width="60px;" class="head">AD-I</th>
                <th width="60px;" class="head">AD-II</th>
                <th width="60px;" class="head"> Inves</th>
                <th width="60px;" class="head">OS</th>
                <th width="80px;" class="head">Total</th>
            </tr>
            <%
            int count=0;

            Connection con1=null;
               ResultSet rs1=null;
               ArrayList<String> discipline=new ArrayList<String>();
             
               try{
               con1 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt1 = con1.createStatement();
    String sql1="select * from eis_discipline;";
    rs1=stmt1.executeQuery(sql1);
    while(rs1.next())
        {
        discipline.add(rs1.getString("discipline"));
    }
    }
               catch(Exception e){
                   e.printStackTrace();
                   }




               

int Taia=0,Tdir=0, Tdd=0, Tad_1=0,Tad_2=0,Tinvs=0,Tos=0, Ttotal=0, Ftotal=0;

               try{
               con1 = ConnectionManager.getConnectionDirectForMySQL();
               Statement stmt1 = con1.createStatement();
               for(count=0; count<discipline.size(); count++){
                   int aia=0;
            int dir=0, dd=0, ad_1=0,ad_2=0,invs=0,os=0, total=0;

    String sql1="select * from eis_basicinfo where bas_descipline='"+discipline.get(count)+"'";
    rs1=stmt1.executeQuery(sql1);
    while(rs1.next())
        {
    if(rs1.getString("bas_designation").equals("AIA")){aia=aia+1;}
    if(rs1.getString("bas_designation").equals("Director")){dir=dir+1;}
    if(rs1.getString("bas_designation").equals("Dy. Director")){dd=dd+1;}
    if(rs1.getString("bas_designation").equals("Asstt. Director Grade-I")){ad_1=ad_1+1;}
    if(rs1.getString("bas_designation").equals("Asstt. Director Grade-II")){ad_2=ad_2+1;}
    if(rs1.getString("bas_designation").equals("Investigator")){invs=invs+1;}
    if(rs1.getString("bas_designation").equals("Office Superitendent")){os=os+1;}

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
    <tr>
        <td class="loop"><%=count+1%></td>
        <td class="loop1"><%=discipline.get(count)%></td>
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
            </center>
            <%
            }else
                {
            %>
            <jsp:forward page="EIS_adError.jsp" />
            <%}%>
    </body>
</html>

