<%-- 
    Document   : getSearch
    Created on : Jun 20, 2018, 2:05:19 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="common.ConnectionManager" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
String search_data=request.getParameter("val");
System.out.println("search data recieved ::"+search_data);
ArrayList<String> issueList=new ArrayList<String>();

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String buffer="";
int flag=0;
try{
connection = ConnectionManager.getConnectionDirectForMySQL();
statement=connection.createStatement();

String sql = "select * from msme_feedback_basic where ref_num='"+search_data+"'";
resultSet=statement.executeQuery(sql);
if(resultSet.next()){ flag=1;}else{flag=0;}
connection.close();
}
catch(Exception e){
e.printStackTrace();
}

if(flag==1)
{
 try{
connection = ConnectionManager.getConnectionDirectForMySQL();
statement=connection.createStatement();

String sql = "select * from msme_feedback_basic a join msme_issue_data_new b on a.email=b.email where a.ref_num='"+search_data+"' group by a.email";
System.out.println("++++++++++"+sql);
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
buffer="<tr><th colspan='2' id='feed' align='left'>Your Details :</th></tr>";
buffer=buffer+"<tr><td colspan='2' class='head'><b>Name : </b> "+resultSet.getString("a.name")+"</td></tr>";
buffer=buffer+"<tr><td colspan='2' class='head'><b>Email : </b> "+resultSet.getString("a.email")+"</td></tr>";
buffer=buffer+"<tr><td colspan='2' class='head'><b>UAM : </b> "+resultSet.getString("a.uam")+"</td></tr>";
buffer=buffer+"<tr><td colspan='2' class='head'><b>Reference No. : </b> "+resultSet.getString("a.ref_num")+"</td></tr>";
buffer=buffer+"<tr><td colspan='2' class='head'><b>Feedback/Issue Submit Date :</b> "+(resultSet.getString("a.submit_date")).substring(0, 11)+"</td></tr><br/>";
buffer=buffer+"<tr><td colspan='2' class='head'><b>User belongs to :</b> "+resultSet.getString("a.category")+"</td></tr>";



 }
connection.close();
}
 catch(Exception e)
         {
     e.printStackTrace();
}
 buffer=buffer+"<tr><th id='feed' colspan='2' align='left'>Feedback / Suggestions :</th></tr>";
buffer=buffer+"<tr><th>Category</th><th>Issues / Feedback</th></tr>";

try{
     connection = ConnectionManager.getConnectionDirectForMySQL();
     statement=connection.createStatement();
     String sql = "select * from  msme_feedback_basic a join msme_issue_data_new b on a.email=b.email and a.ref_num='"+search_data+"' group by b.msme_related_issue";
    resultSet = statement.executeQuery(sql);
     while(resultSet.next()){

      issueList.add(resultSet.getString("b.msme_related_issue"));
     }
    connection.close();

     }
 catch(Exception exp){
     exp.printStackTrace();
     }

for(int j=0; j<issueList.size(); j++)
    {

int count=1;
String department="";
 try{
     connection = ConnectionManager.getConnectionDirectForMySQL();
     statement=connection.createStatement();
     String sql = "select * from  msme_feedback_basic a join msme_issue_data_new b on a.email=b.email and a.ref_num='"+search_data+"' and b.msme_related_issue='"+issueList.get(j)+"' group by b.sugg";
    resultSet = statement.executeQuery(sql);
     while(resultSet.next()){
      count=count+1;
      department=resultSet.getString("b.msme_related_issue");
      
     }
    connection.close();
 System.out.println("Suggestion count ::"+count)   ;
     }
 catch(Exception exp){
     exp.printStackTrace();
     }

buffer=buffer+"<tr><td class='dy' rowspan="+count+">"+(j+1)+".&nbsp;&nbsp;"+issueList.get(j)+"</td></tr>";

int n=0;
try{
     connection = ConnectionManager.getConnectionDirectForMySQL();
     statement=connection.createStatement();
     String sql = "select * from  msme_feedback_basic a join msme_issue_data_new b on a.email=b.email and a.ref_num='"+search_data+"' and b.msme_related_issue='"+issueList.get(j)+"' group by b.sugg order by b.sno";
     resultSet = statement.executeQuery(sql);
     while(resultSet.next()){
         n=n+1;
         buffer=buffer+"<tr><td class='dy'>"+(n)+".&nbsp;"+resultSet.getString("b.sugg")+"</td></tr>";

     }
    connection.close();
     }
 catch(Exception exp){
     exp.printStackTrace();
     }

}
String submitCheck="no";
String response_data="";
String admin="";
try{
               connection=ConnectionManager.getConnectionDirectForMySQL();
               statement=connection.createStatement();
               String sql1="select * from msme_response_data a join msme_feedback_user b on a.response_submit_by=b.username where a.ref_num='"+search_data+"' ";
               resultSet=statement.executeQuery(sql1);
               while(resultSet.next())
                   {
                   submitCheck="yes";
                   response_data=resultSet.getString("reply_data");
                   admin=resultSet.getString("b.name");
                   }
               connection.close();
               }
catch(Exception err1){
    err1.printStackTrace();
    }


buffer=buffer+"<tr><th id='feed' colspan='2' align='left'>Response :</th></tr>";
if(submitCheck.equals("yes"))
                       {
    buffer=buffer+"<tr><td colspan='2' class='head'><span><b> "+admin+" &nbsp;: </b> &nbsp;"+response_data+"</span></td></tr>";
    }else
        {
    buffer=buffer+"<tr><td colspan='2' class='head' style='color :red'><span> &nbsp;The response is pending on your Issue / Feedback.</span></td></tr>";
    }

buffer=buffer+"<input type='button' value='Print' onclick='window.print()'>";

response.getWriter().println(buffer);
}
else
    {
   buffer="<td>No Result found.</td>";
   response.getWriter().println(buffer);
    }

%>