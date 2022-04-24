<%-- 
    Document   : emailFinder
    Created on : May 22, 2018, 3:48:52 PM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <title>Find Email </title>
        <style>
            #mail{
                display: inline-block;
                
}

        </style>
        <script>
            
             var userEmail = [];
           function getId(email)
            {
               var emaill=email.value+"<br/>";
               userEmail.push(emaill);
               
               document.getElementById("emailprint").innerHTML=userEmail;

            }
   
        </script>
    </head>
    <center>
        <h2>
            Email Finder
        </h2>
    </center>
    <body>
        <form action="" name="myform" method="post"/>
        <table>
            <tr>
                <td style="width: 250px;  border: 2px black solid;">
                    <table>
                       
                            <%
                            Connection con=null;
                            ResultSet rs= null;
                            Statement st=null;
                            int i=0;
                            try{
                                con=ConnectionManager.getConnectionDirectForMySQL();
                                st=con.createStatement();
                                String Query="select * from eis_basicinfo";
                                rs=st.executeQuery(Query);
                                while(rs.next())
                                    {
                                    i=i+1;
                                    %>
                                     <tr>
                                    <td><%=i%></td>
                                    <td>
                                        <%--        <a style=" display: none" id="email" href="<%=rs.getString("email")%>"> <%=rs.getString("email")%>   </a>
                                        <input type="button" value="<%=rs.getString("name")%>"  onclick="return getId()"/>   --%>
                                        <button type="button" id="button-test" value="<%=rs.getString("email")%>" onclick=" getId(this)" ><%=rs.getString("email")%></button>
                                    </td>
</tr>
                            <%
                                    }
                                con.close();
                                }
                            catch(Exception ee){
                                ee.printStackTrace();
                                }
                            %>
                        
                    </table>
                </td>
                <td id="emailprint" style="width: 250px; border: 2px black solid; max-width: 250px; ">
                   
                </td>
            </tr>
        </table>
    </body>
</html>
