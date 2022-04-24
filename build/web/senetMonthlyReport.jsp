<%-- 
    Document   : senetMonthlyReport
    Created on : 15 Oct, 2019, 5:23:30 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="common.*, java.sql.*" %>
<!DOCTYPE html>
<%
String sYear=request.getParameter("sYear");
String sMonth=request.getParameter("sMonth");
int month=Integer.parseInt(sMonth);
String MonthName="";
if(month==1){MonthName="April";}
if(month==2){MonthName="May";}
if(month==3){MonthName="June";}
if(month==4){MonthName="July";}
if(month==5){MonthName="August";}
if(month==6){MonthName="Sepetember";}
if(month==7){MonthName="October";}
if(month==8){MonthName="November";}
if(month==9){MonthName="December";}
if(month==10){MonthName="January";}
if(month==11){MonthName="February";}
if(month==12){MonthName="March";}

System.out.println("Year=="+sYear+" and Month="+sMonth );

Connection con = null;
Statement st = null;
ResultSet rs = null;
int cFlag = 0;
int count=0;
String NotIn="";
String buffer="<div id='main1'>";
buffer=buffer+"<div id='heading'> MPR Report Of "+MonthName+" - "+sYear+"</div>";
buffer=buffer+"<div id='record'><table id='dataRecieved'>";
buffer=buffer + "<tr>";
buffer=buffer+"<td id='head' class='pars'>Sno</td><td id='head1' class='pars'>Institute Name</td></tr>";
try
{
   con=ConnectionManager.getConnectionDirectForMySQL();
   st=con.createStatement();
   String Query=" SELECT b.INST_CITY as inst FROM tbl_senet a JOIN tbl_di_institute b ON a.Inst_id=b.INST_ID WHERE year='"+sYear+"' and months='"+sMonth+"';";
   System.out.println(Query);
   rs=st.executeQuery(Query);

       if(rs.next())
       {
           rs.beforeFirst();
      while(rs.next())
       {
           count=count+1;
           buffer=buffer+"<tr id='clr' style='height:8px;'><td class='pars'>"+count+".</td>";
           buffer=buffer+"<td class='pars'>"+rs.getString("inst")+"&nbsp;&nbsp;<img src='reportimg/right3.jpg' width='10px' height='10px'/></td></tr>";
         NotIn=  NotIn.concat("'"+rs.getString("inst")+"'"+",");
       }
       buffer=buffer+"</table></div>";  
   }
       else
{
    buffer=buffer+"<tr><td colspam='2'> No data found.</td></tr>";
  NotIn="'"+"NotIn"+"''";
}
}
catch(Exception error)
{
    error.printStackTrace();
}
         
        buffer=buffer+"<div id='not'>";
        buffer=buffer+"<table id='dataRecieved'>";
        int i=0;
        buffer=buffer+"<td id='head' class='pars'>Sno</td><td id='head1' class='pars'>Pending DI's Name</td></tr>";
        NotIn=NotIn.substring(0, NotIn.length()-1);
       // String Query1="select INST_CITY from tbl_di_institute where INST_CITY not in ("+NotIn+")";
        String Query1="select name from TotalInst where name not in ("+NotIn+") order by name;";
      //  System.out.println(Query1);
        rs=st.executeQuery(Query1);  
        while(rs.next())
        {
            i=i+1;
            buffer=buffer+"<tr id='clr' style='height:8px;'><td class='pars'>"+i+".</td>";
           buffer=buffer+"<td class='pars'>"+rs.getString("name")+"&nbsp;&nbsp;<img src='reportimg/error.png' width='10px' height='10px'/></td></tr>";
        }
        buffer=buffer+"</table>";
        
        buffer=buffer+"</div></div>";
       
        response.getWriter().println(buffer);

%>