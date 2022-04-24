<%-- 
    Document   : basicDetails
    Created on : 17 Mar, 2021, 4:34:00 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,common.*,java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<html>
    <head>
        <meta charset="utf-8">
        <title>Home</title>
        <%--
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function() {
    $(".link1").click(function(event){
       event.preventDefault();
       var url =$(this).attr("href");

        $('.right-pane').load(url, function(data) {
        console.log(data);
    });
       console.log(url);
    });
});
        </script>
        --%>
        <style>
#table1
{
    width: 60%;
}

table tr td 
            {
                border: 1px #f1f1f1 solid;
                font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 6px;
            }

            #head1
            {
                line-height: 18px;
                font: normal normal 19px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 8px;
                width: 98%;
                background-color: #f1f1f1;
            }
            #mainDiv
            {
                width: 100%;
                border: 1px #e2e2e2 solid;
                align:center;
                margin: auto;
                height: 612px;
            }            
    </style>
    </head>
    <%
        String crosssite = (String)session.getAttribute("crosssite");
        session.setAttribute("crosssite", crosssite);
        
        if(!crosssite.equals(null))
        {     
            String token = (String)session.getAttribute("token");
            String emp_name = (String)session.getAttribute("emp_name");
            String emp_email = (String)session.getAttribute("emp_email");
        
            session.setAttribute("token", token);
            session.setAttribute("emp_name", emp_name);
            session.setAttribute("emp_email", emp_email);
        
        Connection con = null;
        ResultSet rs = null;
        Statement st = null;
        
        String cr_ofc ="";
        String cr_desig ="";
        int flag =0;
        
        
        try
        {
            con = ConnectionManager.getConnectionDirectForMySQL();
            st = con.createStatement();
            String sql = "select * from eis_postinginfo where email= '"+emp_email+"'";
            rs = st.executeQuery(sql);
            while(rs.next())
            {
                cr_ofc = rs.getString("state");
                cr_desig = rs.getString("curr_despln");
                flag=1;
            }
        }
        catch(Exception sqlerr)
        {
            sqlerr.printStackTrace();
        }
 if(flag==0)
 {
     String sql = "select * from eis_updated_user_gov_mail where gov_email= '"+emp_email+"'";
            rs = st.executeQuery(sql);
            while(rs.next())
            {
                cr_ofc = rs.getString("current_office");
                cr_desig = rs.getString("designation");
            }
 }
 
            con.close();
    %>
    <body>
        <div id="mainDiv">

                <h3 id="head1">Employee Detail -</h3>
                
                    <table id="table1" align="center">
                        
                        
                        <tr>
                            <td>Name </td><td>:&nbsp;&nbsp;<%=emp_name%></td>
                        </tr>
                        <tr > 
                            <td>Email </td><td>:&nbsp;&nbsp;<%=emp_email%></td>
                        </tr>
                        <tr>
                            <td>Designation </td><td>:&nbsp;&nbsp;<%=cr_desig%></td>
                        </tr>
                        <tr>
                            <td>Current Office </td><td>:&nbsp;&nbsp;<%=cr_ofc%></td>
                        </tr>  
                        
                   </table>
             
                
        </div>
      
    </body>
    <%
        }else {
    response.sendRedirect("stat.jsp");
}
    %>
</html>
