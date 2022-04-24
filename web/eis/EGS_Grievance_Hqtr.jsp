<%-- 
    Document   : EGS_Grievance_Hqtr
    Created on : Apr 19, 2018, 10:07:59 AM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@include file="EIS_menu_header.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>:: Grievance ::</title>
       <style>
           #url-table
                {
                   width: 1050px;
                   margin: auto;
                   align:center;
                   border: 1px  #cacaca  solid;
                   min-height: 72vh;
                   background-color: #ffffff;
                } 
           .main{
                background:  #ffffff ;
                border-radius : 0px;
                width: 955px;
                border: 1px black solid;
               }
               .main2{
                background:  #ffffff ;
                width: 955px;
                border: 1px black solid;
                
                
               }
               .main1{
                background:  #ffffff ;
                width: 955px;
                border: 1px black solid;
                height: 320px;
                overflow: auto;
               }
               .data-over
               {
                   background:  #ffffff ;
                width: 955px;
                height: 240px;
                overflow: auto;
}
               .data{
                  font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                  font-size: 14px;
                  width: 100%;
                 
}
               h3{
                   font: bold 16px Verdana, Geneva, Arial, Helvetica, sans-serif;

}
.head{
    font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
    font-size: 18px;
    padding-top: 8px;
    padding-bottom: 8px;
    background-color:  #bad4be ;
    margin-bottom: -2px;
   
}
.Ghead{
    font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
    font-size: 21px;
    padding-top: 10px;
    padding-bottom: 10px;
    color: red;
}
.dHead{
    font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
    border: 1px black solid;
    padding: 5px 5px 5px 5px;
    font-size: 14.5px;
    border-collapse: collapse;
    background:  #d7e4bf;
}
.mainData{
    font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
   
    padding: 4px 4px 4px 4px;
}
a {
    display: inline-block;
    color: Blue;
    text-align: center;
    padding: 0px;
    text-decoration: none;
}
h3{
    margin: 0px;
    padding: 0px;
}

 a:hover {
   text-decoration: underline;
}
#trdata:nth-child(even)
{
    background: #FFF;
}
#trdata:nth-child(odd) {
    background: #e5e5e5;
}
        </style>
    </head>
    <%
    String Session=(String)session.getAttribute("Session");
    String user=(String)session.getAttribute("username");
    session.setAttribute("Session",Session);

        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        System.out.println("session value is="+Session);

//System.out.println("This is HQ grievance page"+Session+ "//"+user);
    if(!Session.equals(null))
    {
    Connection con=null;
    ResultSet res=null;
    Statement stm=null;
    String name="";
    String adEmail="";
    try{
       con=ConnectionManager.getConnectionDirectForMySQL();
       stm=con.createStatement();
       String sql="select * from eis_admin where username='"+user+"'";
       res=stm.executeQuery(sql);
     while(res.next()){
         name=res.getString("name");
         adEmail=res.getString("email");
         }
       con.close();
        }
    catch(Exception e){
        e.printStackTrace();
        }
     session.setAttribute("user",name);
     session.setAttribute("username",user);
     session.setAttribute("adEmail",adEmail);

    // System.out.println("name="+name+"//"+adEmail);
    %>
    <body bgcolor="#ccc">
      <div id="url-table" align="center">
        <table align="center">
            <tr>
                <td align="center" colspan="2">
                    <div class="main1">
                        <div align="center" class="head"> Employees' List on EIS </div>
                        <table class="data">
                            <tr>
                                <td class="dHead" align="center"> S.no.</td>
                                <td class="dHead"  align="center"> Name</td>
                                <td class="dHead" align="center"> Office</td>
                                <td class="dHead" align="center"> Designation</td>
                                <td class="dHead" align="center"> Date of Joining</td>
                            </tr>
                            
                            <%

                            ResultSet rs=null;
                            Statement st=null;
                            String instId="";
                            if(user.equals("bbsahoo") || user.equals("raghav")){instId="I70";}else
                                {
                            try{
                                con=ConnectionManager.getConnectionDirectForMySQL();
                                st=con.createStatement();
                                String sql="Select * from eis_branch_list where Inst_Name='"+user+"'";
                                rs=st.executeQuery(sql);
                                while(rs.next()){
                                 instId=rs.getString("Inst_id");
                                }
                                con.close();
                                }
                            catch(Exception ex){
                                 ex.printStackTrace();
                                              }}
                            

if(instId.equals("I70"))
    {

     int dataCount=0;
                                try{
                                con=ConnectionManager.getConnectionDirectForMySQL();
                                st=con.createStatement();
                                String sql= "select * from eis_basicinfo a join eis_postinginfo b on a.email=b.email and inst_id='I70'";
                                rs=st.executeQuery(sql);
                                while(rs.next())
                                {
                                    dataCount=1;
                                    }
                                con.close();
                                }
                                catch(Exception err){
                                    err.printStackTrace();
                                    }

     if(dataCount==1)
         {
                            int iCount=0;
                            try{
                                con=ConnectionManager.getConnectionDirectForMySQL();
                                st=con.createStatement();
                                String sql= "select * from eis_basicinfo a join eis_postinginfo b on a.email=b.email and inst_id='I70'";
                                rs=st.executeQuery(sql);
                                while(rs.next())

                                    {
                                     iCount=iCount+1;
                                   %>
                                   <tr id="trdata">
                                       <td class="mainData" align="center"><%=iCount%>.</td>
                                       <td class="mainData"><a href="EIS_empform.jsp?nnMQFds495dS6fhXxQjd=<%=rs.getString("token")%>"><%=rs.getString("name").toUpperCase()%></a></td>
                                        <td class="mainData"><%=rs.getString("state")%></td>
                                       <td class="mainData"><%=rs.getString("bas_designation")%></td>
                                       <td class="mainData"><%=rs.getString("curr_doj")%></td>
                                   </tr>

                            <%
                                }
                                con.close();
                                }
                            catch(Exception ex){
                            ex.printStackTrace();
                            }
                            }else
                                {
         %>
                            <tr id="trdata">
                                <td colspan="6" align="center" style=" font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 14px; color: red; padding-top: 25px;">
                                    No registration found on EIS System.
                                </td>

                            </tr>
                                   <%
         }
     }
                            %>
                            
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                  <td align="center" colspan="2">
            
                            <div class="main1">
                                <div class="head" align="center">  Grievance Register</div>
                             <table class="data">
                               
                              <tr>
                                <td class="dHead" align="center"> S.no.</td>
                                <td class="dHead"  align="center"> Name</td>
                                <td class="dHead" align="center"> Office</td>
                                <td class="dHead" align="center"> Designation</td>
                                <td class="dHead" align="center"> Date of Joining</td>
                                <td class="dHead" align="center"> Status</td>
                            </tr>
                            <%
                            if(instId.equals("I70"))    //HQ Office New Delhi
    {
                                int dataCount=0;
                                try{
                                con=ConnectionManager.getConnectionDirectForMySQL();
                                st=con.createStatement();
                                String sql= "select * from egs_basic a join egs_data b on a.token=b.token where inst_id='I70'";
                                rs=st.executeQuery(sql);
                                while(rs.next())
                                {
                                    dataCount=1;
                                    }
                                con.close();
                                }
                                catch(Exception err){
                                    err.printStackTrace();
                                    }


                                if(dataCount==1)
                                    {
                            int iCount=0;
                            try{
                                con=ConnectionManager.getConnectionDirectForMySQL();
                                st=con.createStatement();
                                String sql= "select * from egs_basic a join egs_data b on a.token=b.token where inst_id='I70'";
                                rs=st.executeQuery(sql);
                                while(rs.next())

                                    {
                                     iCount=iCount+1;
                                   %>
                                   <tr id="trdata">
                                       <td class="mainData" align="center"><%=iCount%>.</td>
                                       <td class="mainData"><a href="EGS_hQtrView.jsp?nnMQFds495dS6fhXxQjd=<%=rs.getString("a.token")%>&vax=<%=rs.getString("a.email")%>"><%=rs.getString("a.name").toUpperCase()%></a></td>
                                        <td class="mainData"><%=rs.getString("a.curr_posting")%></td>
                                       <td class="mainData"><%=rs.getString("a.designation")%></td>
                                       <td class="mainData"><%=rs.getString("a.curr_doj")%></td>
                                       <td class="mainData" style=" color: blue;">Active</td>
                                   </tr>

                            <%
                                }
                                
                                }
                            catch(Exception ex){
                            ex.printStackTrace();
                            }
                            }else
                                {
                                    %>
                            <tr id="trdata">
                                <td colspan="6" align="center" style=" font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 14px; color: red; padding-top: 25px;">
                                    No grievance found .
                                </td>

                            </tr>
                                   <%
                                    }
                                }
                             %>
                            </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                  <td align="center" colspan="2">

                            <div class="main1">
                             <div class="head" align="center"> Pending From Other Branches</div>
                             
                             <table class="data">
                             <tr>
                                <td class="dHead" align="center"> S.no.</td>
                                <td class="dHead"  align="center"> Name</td>
                                <td class="dHead" align="center"> Office</td>
                                <td class="dHead" align="center"> Designation</td>
                                <td class="dHead" align="center"> Date of Joining</td>
                                <td class="dHead" align="center"> Submit Date</td>
                            </tr>
<%
System.out.println("--------Code is working------------");
String submitDate="";
int dataCount=0;
                                try{
                                con=ConnectionManager.getConnectionDirectForMySQL();
                                st=con.createStatement();
                                String sql= "select * from egs_basic a join egs_data b on a.token=b.token where a.email not in (select userEmail from egs_reply) and a.email not in (select userEmail from egs_transfertohq)";
                                rs=st.executeQuery(sql);
                                while(rs.next())
                                {
                                    dataCount=1;
                                    }
                                con.close();
                                }
                                catch(Exception err){
                                    err.printStackTrace();
                                    }




SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Date date = new Date();
String time=dateFormat.format(date);
Calendar c = Calendar.getInstance();
Calendar cc = Calendar.getInstance();
try{
    cc.setTime(dateFormat.parse(time));
	}catch(ParseException e){
		e.printStackTrace();
	 }
//String todayDate = dateFormat.format(cc.getTime());

if(dataCount==1)
    {


int iCount=0;

try{
                                con=ConnectionManager.getConnectionDirectForMySQL();
                                stm=con.createStatement();
                                String sql= "select * from egs_basic a join egs_data b on a.token=b.token where a.email not in (select userEmail from egs_reply) and a.email not in (select userEmail from egs_transfertohq)";
                                res=stm.executeQuery(sql);
                                while(res.next())

                                    {
                                     iCount=iCount+1;
                                     submitDate=res.getString("time");
                                     String ll=submitDate.substring(0, 11);
                                     System.out.println("Submit Date is="+submitDate);
                                     try{

	c.setTime(dateFormat.parse(submitDate));
	}catch(ParseException e){
		e.printStackTrace();
	 }
                                   c.add(Calendar.DAY_OF_MONTH,30);
                                   String finalDate = dateFormat.format(c.getTime());

                                   System.out.println("Date after addition="+finalDate);
if(cc.getTime().after(c.getTime()))
                                       {
                                   %>
                                   <tr id="trdata">
                                       <td class="mainData" align="center"><%=iCount%>.</td>
                                       <td class="mainData"><a href="EGS_EditByHqOffice.jsp?nnMQFds495dS6fhXxQjd=<%=res.getString("a.token")%>&vax=<%=res.getString("a.email")%>" target="_blank"><%=res.getString("a.name").toUpperCase()%></a></td>
                                       <td class="mainData"><%=res.getString("a.curr_posting")%></td>
                                       <td class="mainData"><%=res.getString("a.designation")%></td>
                                       <td class="mainData"><%=res.getString("a.curr_doj")%></td>
                                       <td class="mainData"><%=ll%>&nbsp; (Active)</td>
                                   </tr>

                            <%
                            }
                                }
                                
                                }
                            catch(Exception ex){
                            ex.printStackTrace();
                            }
}else
    {
    %>
                            <tr id="trdata">
                                <td colspan="6" align="center" style=" font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 14px; color: red; padding-top: 25px;">
                                    No pending grievance found .
                                </td>

                            </tr>
                                   <%
    }
                            

%>
 </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                  <td align="center" colspan="2">

                            <div class="main1">
                                 <div class="head" align="center"> Transferred From Other Branches</div>
                               <table class="data">
                             
                                <tr>
                                <td class="dHead" align="center"> S.no.</td>
                                <td class="dHead" align="center"> Name</td>
                                <td class="dHead" align="center"> Office</td>
                                <td class="dHead" align="center"> Designation</td>
                                <td class="dHead" align="center"> Transfer From</td>
                                <td class="dHead" align="center"> Transfer Date</td>
                                </tr>
                            <%

                            int dataCount1=0;
                                try{
                                con=ConnectionManager.getConnectionDirectForMySQL();
                                st=con.createStatement();
                                String sql= "select * from egs_transfertohq a left join egs_basic b on a.userEmail=b.email inner join eis_branch_list c on a.transferFrom=c.Inst_id";
                                rs=st.executeQuery(sql);
                                while(rs.next())
                                {
                                    dataCount1=1;
                                    }
                                con.close();
                                }
                                catch(Exception err){
                                    err.printStackTrace();
                                    }

                            if(dataCount1==1)
                                {

                            int itCount=0;
                            try{
                                con=ConnectionManager.getConnectionDirectForMySQL();
                                st=con.createStatement();
                                String sql= "select * from egs_transfertohq a left join egs_basic b on a.userEmail=b.email inner join eis_branch_list c on a.transferFrom=c.Inst_id";
                                rs=st.executeQuery(sql);
                                while(rs.next())

                                    {
                                     itCount=itCount+1;
                                     submitDate=rs.getString("time");
                                     String ll=submitDate.substring(0, 11);
                                     System.out.println("Submit Date is="+submitDate);
                                     String reason=rs.getString("reason");
                                     session.setAttribute("reason",reason);
         %>
         <tr id="trdata">
                                       <td class="mainData" align="center"><%=itCount%>.</td>
                                       <td class="mainData"><a href="EGS_EditByHqOffice.jsp?nnMQFds495dS6fhXxQjd=<%=rs.getInt("token")%>&vax=<%=rs.getString("userEmail")%>"><%=rs.getString("b.name").toUpperCase()%></a></td>
                                       <td class="mainData"><%=rs.getString("b.curr_posting")%></td>
                                       <td class="mainData"><%=rs.getString("b.designation")%></td>
                                       <td class="mainData"><%=rs.getString("c.Inst_Name")%></td>
                                       <td class="mainData"><%=ll%>&nbsp;</td>
                                   </tr>

         <%
         }
                                con.close();
                                }
                            catch(Exception ex){
                                ex.printStackTrace();
                                }
                            }else
                                {
                                %>
                            <tr id="trdata">
                                <td colspan="6" align="center" style=" font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 14px; color: red; padding-top: 25px;">
                                    No transferred grievance found .
                                </td>

                            </tr>
                                   <%
                                }
         %>
                            

                        </table>
                    </div>
                </td>
            </tr>
        </table>
         </div>
    </body>
    <%

                            }else
                                {
                            %>
                             <jsp:forward page="EIS_adError.jsp" />
                            <%}%>
</html>
