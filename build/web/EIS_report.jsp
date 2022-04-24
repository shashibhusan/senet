<%-- 
    Document   : di_report
    Created on : Dec 20, 2017, 10:40:10 AM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table {
                border: 1px black groove;
                border-collapse: collapse;
}
            .head {
                 font-family:Arial, Helvetica, sans-serif;
                 background: #38b3de;
                 color: white;
                  padding-left: 10px;

}
.head1 {
    height: 35px;
    border: 1px blue double;
   
}
            .first {
                width: 190px;
                height: 100px;
                background:  #38b3de ;
                color: white;
                margin-left: 0px;
                margin-top: 0px;

}
.second {

                width: 190px;
                height: 100px;
                background:   #FF5733  ;
                color: white;
                margin-left: 0px;
                margin-top: 0px;
}
.third {
                width: 190px;
                height: 100px;
                background:   #FFC300  ;
                color: white;
                margin-left: 0px;
                margin-top: 0px;
}

.fourth {
                width: 190px;
                height: 100px;
                background:   #0f9e48  ;
                color: white;
                margin-left: 0px;
                margin-top: 0px;
}

.total {
                width: 190px;
                height: 100px;
                background:    #C70039   ;
                color: white;
                margin-left: 0px;
                margin-top: 0px;
}


.menu {
    width: 100%;
    height: 40px;
    background: #0f9e48 ;
    margin-top: -22px;
    color: white;
    font-size: 18px;
    font-weight: bold;
     font-family:Arial, Helvetica, sans-serif;
     padding-bottom: -5px;

}
.num {
    text-align: center;
    font-size: 40px;
    margin-left: 10px;

}
.center {
    text-align: center;
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
    color: blue;
}
a:hover {
    text-decoration: none;
    color: black;
   
}

a:active {
    text-decoration: underline;
    color: red;
}

#data {
     padding-left: 10px;
      font-family:Arial, Helvetica, sans-serif;
      font-size: 14px;
}
.res {
    height: 22px;
    padding-top: 5px;
    padding-bottom: 5px;
}
.data:hover {
     background-color:  #f0cbb4  ;
     font-style:  oblique;
   
}
        </style>
        
    <%
  
   String ofcType = request.getParameter("val");
  
    int dataCount=0, di=0,branch=0,tc=0,ts=0;
    String ofc="";
    
%>
    </head>
 
    <body>
        <table align="center" width="100%" >
            <tr>
                <td colspan="4"><div class="menu1" align="center">Ministry of MSME <br/>(Government of India)<br/>EMPLOYEE INFORMATION SYSTEM</div> </td>
            </tr>
            <tr>

                <td colspan="4">  <div class="menu" align="center"><p class="link1"> Report Section </p></div> </td>
        </tr>
      
        <tr>
    <%--    <table align="center" width="880px">
            <tr>
            <td> <a href="#" > <div class="first" > <h2 class="num"> <%=di%></h2><p class="center">MSME-DIs</p></div> </a></td>
            <td> <a href="#" > <div class="second"> <h2 class="num"> <%=branch%></h2><p class="center"> Branch MSME-DIs</p></div></a> </td>
            <td> <a href="#" > <div class="third">  <h2 class="num"> <%=tc%></h2><p class="center">MSME-TCs</p></div></a> </td>
            <td> <a href="#" > <div class="fourth"> <h2 class="num"> <%=ts%></h2><p class="center">MSME-TSs</p></div></a> </td>
            </tr>
             <tr>
            <td colspan="4" align="center">    <div class="total" > <h2 class="num"> <%=dataCount%></h2><p class="center">Total Employee</p></div> </td>
        </tr>
</table> --%>
    <%
    if (!ofcType.equals("recordTotal"))
            {
       
    %>
        <table align="center" border="1px" width="880px">
            <tr class="head1"><strong>
                <td class="head">S. No.</td>
                <td class="head">Name</td>
                <td class="head">Office</td></strong>
            </tr>
<br/><br/>
        <%

        String name="";
        String ofcName="";
        String ofc1="";
        int iCount=0;

    Connection conn=null;
    ResultSet rs1=null;
    try{
        conn = ConnectionManager.getConnectionDirectForMySQL();
        Statement stmt = conn.createStatement();
        String sql="select * from eis_basicinfo, eis_branch_list where eis_basicinfo.inst_id=eis_branch_list.Inst_id and eis_branch_list.type='"+ofcType+"'";
        rs1=stmt.executeQuery(sql);
       
         while(rs1.next()){
             iCount=iCount+1;
            name=rs1.getString("eis_basicinfo.name").toUpperCase();
            ofcName=rs1.getString("eis_branch_list.Inst_Name");
       
            String token=rs1.getString("email");
           
        %>
        <tr class="res">
    <td id="data" style=" width: 85px"><%=iCount%>.</td>
     <td id="data" class="data" style=" width: 399px"><a href="EIS_individualFinalReport.jsp?token=<%=token%>"><%=name%></a></td>
    
     <td id="data"><%=ofcName%></td>
   
    
</tr>
             <%                            
                  }
        conn.close();
        }

    catch(Exception e){
        e.printStackTrace();
        }
        %>


        </table>
        <%
        

        }
    else
        {
          %>
           <table align="center" border="1px" width="880px">
            <tr class="head1">
                <td class="head">S. No.</td>
                <td class="head">Name</td>
                <td class="head">Office</td>
            </tr>
<br/><br/>
        <%

        String name="";
        String ofcName="";
        String ofc1="";
        int iCount=0;

    Connection conn=null;
    ResultSet rs1=null;
    try{
        conn = ConnectionManager.getConnectionDirectForMySQL();
        Statement stmt = conn.createStatement();
        String sql="select * from eis_basicinfo, eis_branch_list where eis_basicinfo.inst_id=eis_branch_list.Inst_id";
        rs1=stmt.executeQuery(sql);
        
         while(rs1.next()){
             iCount=iCount+1;
            name=rs1.getString("eis_basicinfo.name").toUpperCase();
            ofcName=rs1.getString("eis_branch_list.Inst_Name");

            String token=rs1.getString("email");
           
        %>
        <tr class="res">
    <td id="data" style=" width: 85px"><%=iCount%>.</td>
     <td id="data" class="data" style=" width: 399px"><a href="EIS_individualFinalReport.jsp?token=<%=rs1.getString("token")%>"><%=name%></a></td>

     <td id="data"><%=ofcName%></td>


</tr>
             <%
                  }
        conn.close();
        }

    catch(Exception e){
        e.printStackTrace();
        }
        %>


        </table>
<%}%>


        </tr>
       
        </table>
    </body>
</html>
