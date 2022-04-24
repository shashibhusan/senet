<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<head>
    <style>
        .table_border_both{
        border:solid #A9D0F5 1px;
        padding-top:3px;
        padding-bottom:3px;
        padding-left:3px;
        font-family:Arial, Helvetica, sans-serif;
        font-size:12px;
        }
        .table_head_all{
        padding-top:3px;
        padding-bottom:3px;
        padding-left:3px;
        font-family:Arial, Helvetica, sans-serif;
        font-size:18px;
}

    </style>

        <%
       String Year=request.getParameter("cmbMonth");
        int total=0  ;
        int total1=0  ;
        int total2=0  ;
        int total3=0  ;
     %>


</head>

     <h2 style=" background-color: #82e0aa"><center><strong>Re-validation Amount For <%=Year%> </strong></center>
           </h2> </br></br>
            <html>
<body>
    <table bgcolor=" #b2babb " align="left" width="100%">
        <tr class="table_head_all">
            <td>MSME-DIs</td>
        </tr>
    </table>
    </br></br>

    <table align="center" width="60%" border="1"  cellspacing="0" cellpadding="0" style="border-collapse: collapse">

        

        <tr align="center" bgcolor=" #d1f2eb ">
            <th width="55%"><strong>Name of DIs</strong></th>

             <th width="45%"><strong>Amount</strong></th>
                              
             </tr>
      
                                        <%
try{  
Connection connection = ConnectionManager.getConnectionDirectForMySQL();
Statement statement=connection.createStatement();

String sql ="SELECT  allmsme.name, revalidationamount.amount FROM revalidationamount, allmsme where allmsme.Inst_Id=revalidationamount.inst  and   year='"+Year+"'";

ResultSet resultSet = statement.executeQuery(sql);
while(resultSet.next()){
      int amt= Integer.parseInt(   resultSet.getString("revalidationamount.amount"));                                               %>
                                                          <tr class="table_border_both" >                                <td><%=resultSet.getString("allmsme.name")%></td>
                                                    <td align="center"><%=resultSet.getString("revalidationamount.amount")%></td>

                                                          <%
             total=total+    amt;
              }
%>
                                                         
                                                    <%

   } catch (Exception e)
   {
e.printStackTrace();

}
                                        %>
                                    </tr>   
                                    
                        </table>
</br>


   <table bgcolor=" #b2babb " align="left" width="100%">
        <tr class="table_head_all">
            <td>Branch MSME-DIs</td>
        </tr>
    </table>
    </br></br>

  <table align="center" width="60%" border="1"  cellspacing="0" cellpadding="0" style="border-collapse: collapse">



        <tr align="center" bgcolor=" #d1f2eb ">
            <th width="55%"><strong>Name of Branch</strong></th>

             <th width="45%"><strong>Amount</strong></th>

             </tr>

                                        <%
try{
Connection connection = ConnectionManager.getConnectionDirectForMySQL();
Statement statement=connection.createStatement();

String sql ="SELECT  allbranch.name, br_revalidationamount.amount FROM br_revalidationamount, allbranch where allbranch.branch_id=br_revalidationamount.br_id  and   year='"+Year+"'";

ResultSet resultSet = statement.executeQuery(sql);
while(resultSet.next()){
    int amt1=Integer.parseInt(resultSet.getString("br_revalidationamount.amount"));
                                                          %>
                                                          <tr class="table_border_both" >                                <td><%=resultSet.getString("allbranch.name")%></td>
                                                    <td align="center"><%=resultSet.getString("br_revalidationamount.amount")%></td>

                                                          <%
total1=total1+amt1;
 }

   } catch (Exception e)
   {
e.printStackTrace();

}
                                        %>

                            </tr>
                        </table>
</br>


 <table bgcolor=" #b2babb " align="left" width="100%">
        <tr class="table_head_all">
            <td>MSME-TCs</td>
        </tr>
    </table>
    </br></br>
  <table align="center" width="60%" border="1"  cellspacing="0" cellpadding="0" style="border-collapse: collapse">



        <tr align="center" bgcolor=" #d1f2eb ">
            <th width="55%"><strong>Name of MSME-TCs</strong></th>

             <th width="45%"><strong>Amount</strong></th>

             </tr>

                                        <%
try{
Connection connection = ConnectionManager.getConnectionDirectForMySQL();
Statement statement=connection.createStatement();

String sql ="SELECT  * FROM tc_revalidationamount where  year='"+Year+"'";

ResultSet resultSet = statement.executeQuery(sql);
while(resultSet.next()){
    int amt2=Integer.parseInt(resultSet.getString("amount"));
                                                          %>
                                                          <tr class="table_border_both" >
                                                    <td><%=resultSet.getString("name")%></td>
                                                    <td align="center"><%=resultSet.getString("amount")%></td>

                                                          <%
total2=total2+amt2;
 }
   } catch (Exception e)
   {
e.printStackTrace();

}
                                        %>

                            </tr>
                        </table>
</br>


 <table bgcolor=" #b2babb " align="left" width="100%">
        <tr class="table_head_all">
            <td>MSME-TSs</td>
        </tr>
    </table>
    </br></br>
  <table align="center" width="60%" border="1"  cellspacing="0" cellpadding="0" style="border-collapse: collapse">



        <tr align="center" bgcolor=" #d1f2eb ">
            <th width="55%"><strong>Name of MSME-TSs</strong></th>

             <th width="45%"><strong>Amount</strong></th>

             </tr>

                                        <%
try{
Connection connection = ConnectionManager.getConnectionDirectForMySQL();
Statement statement=connection.createStatement();

String sql ="SELECT  * FROM ts_revalidationamount where  year='"+Year+"'";

ResultSet resultSet = statement.executeQuery(sql);
while(resultSet.next()){
    int amt3=Integer.parseInt(resultSet.getString("amount"));
                                                          %>
                                                          <tr class="table_border_both" >                                <td><%=resultSet.getString("name")%></td>
                                                    <td align="center"><%=resultSet.getString("amount")%></td>

                                                          <%
total3=total3+amt3;
 }
   } catch (Exception e)
   {
e.printStackTrace();

}
                                        %>

                            </tr>
                                        <tr align="center" bgcolor=" #d1f2eb ">
            <th width="55%"><strong>Total</strong></th>

             <th width="45%"><strong><%=total+total1+total2+total3%></strong></th>

             </tr>
                        </table>
    
</body>
</html>

