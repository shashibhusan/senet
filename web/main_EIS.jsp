<%--
    Document   : main_EIS
    Created on : Dec 15, 2017, 2:38:14 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,common.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.text.ParseException" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EIS</title>
        <script>

        </script>
        <style>
            .first {
                width: 205px;
                height: 120px;
                background:  #38b3de ;
                color: white;
                 border-top-right-radius: 8px;
                 border-bottom-right-radius: 8px;
                 border-top-left-radius: 8px;
                 border-bottom-left-radius: 8px;
                margin-top: 0px;

                }
           .second {

                width: 205px;
                height: 120px;
                background:   #FF5733  ;
                color: white;
                border-top-right-radius: 8px;
                 border-bottom-right-radius: 8px;
                 border-top-left-radius: 8px;
                 border-bottom-left-radius: 8px;
                margin-top: 0px;
}
.third {
               width: 205px;
                height: 120px;
                background:   #FFC300  ;
                color: white;
                border-top-right-radius: 8px;
                 border-bottom-right-radius: 8px;
                 border-top-left-radius: 8px;
                 border-bottom-left-radius: 8px;
               
}

.fourth {
                width: 205px;
                height: 120px;
                background:   #0f9e48  ;
                color: white;
                border-top-right-radius: 8px;
                 border-bottom-right-radius: 8px;
                 border-top-left-radius: 8px;
                 border-bottom-left-radius: 8px;
                margin-top: 0px;
}

.total {
                width: 205px;
                height: 120px;
                background:    #C70039   ;
                color: white;
                border-top-right-radius: 8px;
                 border-bottom-right-radius: 8px;
                 border-top-left-radius: 8px;
                 border-bottom-left-radius: 8px;
                 margin-top: 0px;
}
.five {
                width: 205px;
                height: 120px;
                background:     #17202a   ;
                color: white;
                border-top-right-radius: 8px;
                 border-bottom-right-radius: 8px;
                 border-top-left-radius: 8px;
                 border-bottom-left-radius: 8px;
                 margin-top: 0px;
               
}
.six {
                width: 205px;
                height: 120px;
                background:     #c679e8  ;
                color: white;
                border-top-right-radius: 8px;
                 border-bottom-right-radius: 8px;
                 border-top-left-radius: 8px;
                 border-bottom-left-radius: 8px;
                 margin-top: 0px;
}
.seven {
                width: 205px;
                height: 120px;
                background:#ed7d4d;
                color: white;
                border-top-right-radius: 8px;
                 border-bottom-right-radius: 8px;
                 border-top-left-radius: 8px;
                 border-bottom-left-radius: 8px;
                 margin-top: 0px;
}
.eight {
                width: 205px;
                height: 120px;
                background: #1f618d ;
                color: white;
                border-top-right-radius: 8px;
                 border-bottom-right-radius: 8px;
                 border-top-left-radius: 8px;
                 border-bottom-left-radius: 8px;
                 margin-top: 0px;
}
.menu {
    width: 100%;
    height: 40px;
    background: #0f9e48 ;
    margin-top: -20px;

}
.num {
    text-align: left;
    font-size: 40px;
    margin-left: 10px;

}
.center {
    text-align: left;
    font-size: 15px;
    margin-top: -20px;
    margin-left: 10px;
   
}
.menu1 {
    width: 100%;
    height: 80px;
    background:  #175fd6  ;
    color: white;
}
a:link {
    text-decoration: none;
   }

a:visited {
    text-decoration: none;
    color: white;
}
a:hover {
    text-decoration: none;
    color: black;
}

a:active {
    text-decoration: underline;
    color: red;
}
span {
    border: 1px solid red;
    padding:  0em 1em;
    border-radius: 8px;
    font-size: 24px;
    line-height: 1.5;
}
.boxes
{
    background:  #fffffe ;
}

 </style>
    </head>
    <%
    // response.setIntHeader("Refresh", 20);
 Date date= new Date();
SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
String time=dateFormat.format(date);
    String ofcType="";
    int dataCount=0, di=0,branch=0,tc=0,ts=0, others=0,ti=0,hqOffice=0,httdc=0;
    int rdi=0, rbranch=0,rts=0,rtc=0,rhqofc=0, rhttdc=0,rti=0;
    int fdi=0, fbranch=0,fts=0,ftc=0,fhqofc=0, fhttdc=0,fti=0;
    int finalSubmit=0;
    int retDate=0;
         Connection conn= null;
         String userSql = null;
          try {
                  conn = ConnectionManager.getConnectionDirectForMySQL();
                  Statement stmt = conn.createStatement();
                  userSql = "select * from eis_basicinfo, eis_branch_list where eis_basicinfo.inst_id=eis_branch_list.Inst_id";
                  ResultSet resultSet = stmt.executeQuery(userSql);
                  while(resultSet.next()){
                   dataCount=dataCount+1;
                   ofcType=resultSet.getString("eis_branch_list.type");

                   if (ofcType.equals("MSME-DI")){
                   di=di+1;
                       }
                   else if (ofcType.equals("Branch MSME-DI")){
                       branch=branch+1;
                       }
                   else if (ofcType.equals("MSME-TC")){
                       tc=tc+1;
                       }
                   else if (ofcType.equals("MSME-TS")){
                       ts=ts+1;
                       }
                   else if(ofcType.equals("MSME-TI") || ofcType.equals("MSME-NC"))
                   {
                       ti=ti+1;
                   }
                   else if (ofcType.equals("HTTDC"))
                   {
                       httdc=httdc+1;
                       }
                   else if (ofcType.equals("HQ Office"))
                   {

                       
                       hqOffice=hqOffice+1;
                       }
                  }

                  System.out.println("Number of Entries in database :"+dataCount);
                  conn.close();
}
 catch (SQLException e)
              {
                  System.out.println(e.getErrorCode() + " = " + e.getMessage());
              }

System.out.println("Number of Entries in database :"+hqOffice);
         try
                 {
             conn=ConnectionManager.getConnectionDirectForMySQL();
             Statement stmt = conn.createStatement();
             String sql = "select * from eis_basicinfo, eis_branch_list where eis_basicinfo.inst_id=eis_branch_list.Inst_id ";
             ResultSet rs=stmt.executeQuery(sql);
             while(rs.next()){
                 Date today=dateFormat.parse(time);
                 Date user_retDate=dateFormat.parse(rs.getString("dat_ret"));

                 if(user_retDate.compareTo(today)<0){
                    if(rs.getString("eis_branch_list.type").equals("MSME-DI")){rdi=rdi+1;}
                    if(rs.getString("eis_branch_list.type").equals("Branch MSME-DI")){rbranch=rbranch-1;}
                    if(rs.getString("eis_branch_list.type").equals("MSME-TC")){rtc=rtc+1;}
                    if(rs.getString("eis_branch_list.type").equals("MSME-TS")){rts=rts+1;}
                    if(rs.getString("eis_branch_list.type").equals("MSME-TI") || rs.getString("eis_branch_list.type").equals("MSME-NC")){rti=rti+1;}
                    if(rs.getString("eis_branch_list.type").equals("HTTDC")){rhttdc=rhttdc+1;}
                    if(rs.getString("eis_branch_list.type").equals("HQ Office")){rhqofc=rhqofc+1;}
                     retDate=retDate+1;
                     }
                 }
             }
             catch(Exception ex){
                 ex.printStackTrace();
             }

fdi=di-rdi;
fbranch=branch-rbranch;
ftc=tc-rtc;
fts=ts-rts;
fti=ti-rti;
fhttdc=httdc-rhttdc;
fhqofc=hqOffice-rhqofc;
    %>
    <body>
        
        <table align="center" width="100%" bgcolor="">
            <tr>
                <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; " align="center">Government of India, Ministry of MSME </div>
        <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"></font>O/o  DCMSME </div>
        <%--         <div style="font-size: large;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"> <%=user_cur_ofc%></font></div> --%>
       <div style="font-size:14px;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center" ><font color="#990000">ALL INDIA MSME-DO EMPLOYEE'S INFORMATION SYSTEM </font>
         </div>
            </tr>
            
        
        <tr>
        
        <table align="center" width="780px" >
            <tr>
                <td align="center"> <a href="#"><div class="first" ><h2 class="num"> <%=di%>&nbsp;,&nbsp;<%=rdi%></h2><p class="center"> MSME-DIs</p></div> </a></td>
            <td align="center"> <a href="#" ><div class="second"><h2 class="num"> <%=branch%>&nbsp;,&nbsp;<%=rbranch%></h2><p class="center"> Branch MSME-DIs</p></div></a> </td>
            <td align="center"> <a href="#" > <div class="third"> <h2 class="num"> <%=tc%>&nbsp;,&nbsp;<%=rtc%></h2><p class="center">MSME-TCs</p></div></a> </td>
            
      </tr>
      <tr>
          <td align="center"> <a href="#" >  <div class="fourth"><h2 class="num"> <%=ts%>&nbsp;,&nbsp;<%=rts%></h2><p class="center">MSME-TSs</p></div></a> </td>
          <td align="center"><a href="#" >   <div class="five" > <h2 class="num"> <%=ti%>&nbsp;,&nbsp;<%=rti%></h2><p class="center">MSME-TI</p></div></a>  </td>
          <td align="center"><a href="#" >   <div class="six" > <h2 class="num"> <%=hqOffice%>&nbsp;,&nbsp;<%=rhqofc%></h2><p class="center">HQ Office<br>New Delhi</p></div></a>  </td>
        </tr>
<%
try {
                  conn = ConnectionManager.getConnectionDirectForMySQL();
                  Statement stmt = conn.createStatement();
                  userSql = "select * from eis_final";
                  ResultSet resultSet = stmt.executeQuery(userSql);
                  while(resultSet.next()){
                      finalSubmit=finalSubmit+1;
                      }

}
              catch (SQLException e)
              {
                  System.out.println(e.getErrorCode() + " = " + e.getMessage());
              }
%>
        <tr>
            <td align="center"> <a href="#" >  <div class="seven"><h2 class="num"> <%=httdc%>&nbsp;,&nbsp;<%=rhttdc%></h2><p class="center">HTTDC</p></div></a> </td>
            <td align="center"> <a href="#" >  <div class="eight"><h2 class="num"> <%=finalSubmit%></h2><p class="center">No of Final <br>Submission</p></div></a> </td>
          <td align="center"><a href="#" >   <div class="total" > <h2 class="num"> <%=dataCount%></h2><p class="center">Total Employee</p></div></a>  </td>


        </tr>
        <tr>
            <td>&nbsp;</td>
          <td align="center"><a href="#" >   <div class="six" > <h2 class="num"> <%=retDate%></h2><p class="center">Retired Employee</p></div></a>  </td>
         <td>&nbsp;</td>
        </tr>
        </table>
        
        </tr>
        
        </table>
    </body>
</html>
