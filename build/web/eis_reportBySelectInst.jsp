<%-- 
    Document   : eis_reportBySelectInst
    Created on : Mar 15, 2018, 3:08:47 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="common.ConnectionManager" %>
<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'
   'http://www.w3.org/TR/html4/loose.dtd'>

<%
String inst=request.getParameter("val");
String display="";
String instId="";
ArrayList<String> discipline=new ArrayList<String>();
Connection con=null;
ResultSet rs=null;
Statement st=null;
try
        {
    con=ConnectionManager.getConnectionDirectForMySQL();
    st=con.createStatement();
    String sql="select * from eis_discipline";
    rs=st.executeQuery(sql);
    while(rs.next())
        {
        discipline.add(rs.getString("discipline"));
    }
    con.close();
    }
catch(Exception ex){
ex.printStackTrace();
}
try
        {
    con=ConnectionManager.getConnectionDirectForMySQL();
    st=con.createStatement();
    String sql="select * from eis_branch_list where Inst_Name='"+inst+"'";
    rs=st.executeQuery(sql);
    while(rs.next())
        {
     instId=rs.getString("Inst_id");
    }
    con.close();
    }
catch(Exception ex){
ex.printStackTrace();
}

display="<tr>";
display=display+"<th width='50px;' class='head'>S. No.</th>" +
        "<th width='180px;' class='head'>Discipline</th>" +
        "<th width='60px;' class='head'>AIA </th>" +
                "<th width='60px;' class='head'>DIR</th>" +
                        "<th width='60px;' class='head'>DD</th>" +
                                "<th width='60px;' class='head'>AD-I</th>" +
                                        "<th width='60px;' class='head'>AD-II</th>" +
                                                "<th width='60px;' class='head'> Inves</th>" +
                                                        "<th width='60px;' class='head'>OS</th>" +
                                                                "<th width='80px;' class='head'>Total</th></tr>";
response.getWriter().println(display);

if(inst.equals("All"))
    {
    int Taia=0,Tdir=0, Tdd=0, Tad_1=0,Tad_2=0,Tinvs=0,Tos=0, Ttotal=0, Ftotal=0, count=0;
try{
con=ConnectionManager.getConnectionDirectForMySQL();
    st=con.createStatement();
               for(count=0; count<discipline.size(); count++){
            int aia=0;
            String buffer="";
            int dir=0, dd=0, ad_1=0,ad_2=0,invs=0,os=0, total=0;

    String sql1="select * from eis_basicinfo where bas_descipline='"+discipline.get(count)+"'";
    rs=st.executeQuery(sql1);
    while(rs.next())
        {
    if(rs.getString("bas_designation").equals("AIA")){aia=aia+1;}
    if(rs.getString("bas_designation").equals("Director")){dir=dir+1;}
    if(rs.getString("bas_designation").equals("Dy. Director")){dd=dd+1;}
    if(rs.getString("bas_designation").equals("Asstt. Director Grade-I")){ad_1=ad_1+1;}
    if(rs.getString("bas_designation").equals("Asstt. Director Grade-II")){ad_2=ad_2+1;}
    if(rs.getString("bas_designation").equals("Investigator")){invs=invs+1;}
    if(rs.getString("bas_designation").equals("Office Superitendent")){os=os+1;}

    }
    Tdir=Tdir+dir;
    Taia=Taia+aia;
    Tdd=Tdd+dd;
    Tad_1=Tad_1+ad_1;
    Tad_2=Tad_2+ad_2;
    Tinvs=Tinvs+invs;
    Tos=Tos+os;

total=aia+dir+dd+ad_1+ad_2+invs+os;

buffer="<tr id='dataIn'><td class='loop'>"+(count+1)+"</td>";
buffer=buffer+"<td class='loop1'>"+discipline.get(count)+"</td>";
buffer=buffer+"<td class='loop'>"+aia+"</td>";
buffer=buffer+"<td class='loop'>"+dir+"</td>";
buffer=buffer+"<td class='loop'>"+dd+"</td>";
buffer=buffer+"<td class='loop'>"+ad_1+"</td>";
buffer=buffer+"<td class='loop'>"+ad_2+"</td>";
buffer=buffer+"<td class='loop'>"+invs+"</td>";
buffer=buffer+"<td class='loop'>"+os+"</td>";
buffer=buffer+"<td class='loop'>"+total+"</td>";
buffer=buffer+"</tr>";

response.getWriter().println(buffer);
 }
               con.close();
      }         catch(Exception ex){
                   ex.printStackTrace();
                   }
String buffer1="";
Ftotal=Ftotal+Taia+Tdir+Tdd+Tad_1+Tad_2+Tinvs+Tos;
buffer1="<tr><td colspan='2' class='loop'>Total</td>";
buffer1=buffer1+"<td class='loop'>"+Taia+"</td>";
buffer1=buffer1+"<td class='loop'>"+Tdir+"</td>";
buffer1=buffer1+"<td class='loop'>"+Tdd+"</td>";
buffer1=buffer1+"<td class='loop'>"+Tad_1+"</td>";
buffer1=buffer1+"<td class='loop'>"+Tad_2+"</td>";
buffer1=buffer1+"<td class='loop'>"+Tinvs+"</td>";
buffer1=buffer1+"<td class='loop'>"+Tos+"</td>";
buffer1=buffer1+"<td class='loop'>"+Ftotal+"</td>";
buffer1=buffer1+"</tr>";

response.getWriter().println(buffer1);
    }else
        {
    int Taia=0,Tdir=0, Tdd=0, Tad_1=0,Tad_2=0,Tinvs=0,Tos=0, Ttotal=0, Ftotal=0, count=0;
try{
con=ConnectionManager.getConnectionDirectForMySQL();
    st=con.createStatement();
               for(count=0; count<discipline.size(); count++){
            int aia=0;
            String buffer="";
            int dir=0, dd=0, ad_1=0,ad_2=0,invs=0,os=0, total=0;

    String sql1="select * from eis_basicinfo where inst_id='"+instId+"' and bas_descipline='"+discipline.get(count)+"'";
    rs=st.executeQuery(sql1);
    while(rs.next())
        {
    if(rs.getString("bas_designation").equals("AIA")){aia=aia+1;}
    if(rs.getString("bas_designation").equals("Director")){dir=dir+1;}
    if(rs.getString("bas_designation").equals("Dy. Director")){dd=dd+1;}
    if(rs.getString("bas_designation").equals("Asstt. Director Grade-I")){ad_1=ad_1+1;}
    if(rs.getString("bas_designation").equals("Asstt. Director Grade-II")){ad_2=ad_2+1;}
    if(rs.getString("bas_designation").equals("Investigator")){invs=invs+1;}
    if(rs.getString("bas_designation").equals("Office Superitendent")){os=os+1;}

    }
    Tdir=Tdir+dir;
    Taia=Taia+aia;
    Tdd=Tdd+dd;
    Tad_1=Tad_1+ad_1;
    Tad_2=Tad_2+ad_2;
    Tinvs=Tinvs+invs;
    Tos=Tos+os;

total=aia+dir+dd+ad_1+ad_2+invs+os;

buffer="<tr id='dataIn'><td class='loop'>"+(count+1)+"</td>";
buffer=buffer+"<td class='loop1'>"+discipline.get(count)+"</td>";
buffer=buffer+"<td class='loop'>"+aia+"</td>";
buffer=buffer+"<td class='loop'>"+dir+"</td>";
buffer=buffer+"<td class='loop'>"+dd+"</td>";
buffer=buffer+"<td class='loop'>"+ad_1+"</td>";
buffer=buffer+"<td class='loop'>"+ad_2+"</td>";
buffer=buffer+"<td class='loop'>"+invs+"</td>";
buffer=buffer+"<td class='loop'>"+os+"</td>";
buffer=buffer+"<td class='loop'>"+total+"</td>";
buffer=buffer+"</tr>";

response.getWriter().println(buffer);
 }
               con.close();
      }         catch(Exception ex){
                   ex.printStackTrace();
                   }
String buffer1="";
Ftotal=Ftotal+Taia+Tdir+Tdd+Tad_1+Tad_2+Tinvs+Tos;
buffer1="<tr><td colspan='2' class='loop'>Total</td>";
buffer1=buffer1+"<td class='loop'>"+Taia+"</td>";
buffer1=buffer1+"<td class='loop'>"+Tdir+"</td>";
buffer1=buffer1+"<td class='loop'>"+Tdd+"</td>";
buffer1=buffer1+"<td class='loop'>"+Tad_1+"</td>";
buffer1=buffer1+"<td class='loop'>"+Tad_2+"</td>";
buffer1=buffer1+"<td class='loop'>"+Tinvs+"</td>";
buffer1=buffer1+"<td class='loop'>"+Tos+"</td>";
buffer1=buffer1+"<td class='loop'>"+Ftotal+"</td>";
buffer1=buffer1+"</tr>";

response.getWriter().println(buffer1);
    }

%>
