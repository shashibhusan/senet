<%-- 
    Document   : EGS_EditByHqOffice
    Created on : May 16, 2018, 3:52:49 PM
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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin View</title>

        <script type="text/javascript">
            function showDiv(){

    document.getElementById('answer1').style.display = "block";
    document.getElementById('reply1').style.display = "none";

}
function submitReply()
{

    var reply=document.getElementById('replyFile').value;
    if(reply==null || reply=="")
        {
    alert("Please select file");

}
}

            </script>

        <style>
            #mainTable{
                border-radius: 6px;
                border: 2px  #7646f7 solid;
                font-family: Bookman Old Style;
}
.head{
    font-family: Bookman Old Style;
    font-size: 32px;
    color: #7646f7;
    font-style: normal;
    margin-bottom: 0px;
}
.data{
    padding-left: 25px;
    font-family: Bookman Old Style;
    font-size: 15px;
   padding-bottom: 3px;
   padding-top: 3px;
}
.data1{
  padding-left: 25px;
    font-family: Bookman Old Style;
    padding-bottom: 15px;
    padding-top: 15px;
}
.onedata{
    margin-top: 8px;
    padding-bottom: 5px;
    padding-top: 5px;
    font-family: Bookman Old Style;
    border: 1px black solid;
}
.ss{
    display: inline;
width: 150px;
}
.logout
{
margin-top: 0px;
margin-bottom: -8px;
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
.pdf{
    padding-left: 55px;
    padding-top: 35px;
    color:  #FF5733 ;
}
.daata{
    margin-bottom: 25px;
padding-bottom: 25px;
}
.mainHeading
{
    font-family: Bookman Old Style;
    font-size: 20px;
    color: #7646f7;
    font-style: normal;
    margin-bottom: -10px;
    margin-top: 0px;
    font-weight: normal;
}
.grv{
    font-family: Bookman Old Style;
    font-size: 20px;
    color: #7646f7;
     font-weight: normal;
}
div{

    border-radius: 5px;
    background-color: #f2f2f2;
}
.reply{
    background-color: #f2f2f2;
}
.detail{
     font-family: Verdana;
}
        </style>
    </head>
    <%
    String Session=(String)session.getAttribute("Session");
    String adEmail=(String)session.getAttribute("adEmail");

    response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        System.out.println("session value is="+Session);

    String val=request.getParameter("nnMQFds495dS6fhXxQjd");
    String email=request.getParameter("vax");

System.out.println("token we get=="+val);
    if(!Session.equals(null))
    {

       session.setAttribute("adEmail",adEmail);
       session.setAttribute("email",email);

       try{
           String reason=(String)session.getAttribute("reason");
           System.out.println("==========reason we found================"+reason);
        }
    catch(Exception ex1)
            {
        ex1.printStackTrace();
        System.out.println("error is=="+ex1);
    }

    Connection con=null;
    ResultSet rs=null;
    Statement st=null;
    String timeOfSub="";
    String adName="";
    String userName="";

    try{
        con=ConnectionManager.getConnectionDirectForMySQL();
        st=con.createStatement();
        String sql="select * from eis_admin where email='"+adEmail+"'";
        rs=st.executeQuery(sql);
        while(rs.next())
            {
        adName=rs.getString("name");
        }
        con.close();
        }
    catch(Exception xex){
    xex.printStackTrace();
    }
    System.out.println("Admin Name is :="+adName);

    String grvId="";
    int token=0;

            try{
            con=ConnectionManager.getConnectionDirectForMySQL();
            st=con.createStatement();
            String Query="select * from egs_basic a join egs_data b on a.token=b.token where a.email='"+email+"' ";
            rs=st.executeQuery(Query);
            while(rs.next())
                {
                timeOfSub=rs.getString("time");
                timeOfSub=timeOfSub.substring(0, 11);
                userName=rs.getString("name");
                grvId=rs.getString("grvId");
                token=rs.getInt("token");

        %>
   <form name="reForm" action="EGS_reply_by_Hqtr.jsp" id="reForm" method="post" enctype="multipart/form-data">
            <br>
            <div style=" display: none;"><input type="text" id="adEmail" name="adEmail" value="<%=adEmail%>"/></div>
            <h2 class="head" align="center">Grievance Detail</h2>
            <center><p class="mainHeading">Acknowledgement (System Generated)</center>

            <table align="center" width="1050px"  id="mainTable1">
                <tr>
              <td align="left" style="font-family: Bookman Old Style; font-weight: 10px; color: #9e0bc2 ">Admin mode</td>
                    <td class="logout" align="right"><a HREF="EGS_Grievance_Hqtr.jsp" >Home</a>&nbsp;&nbsp;&nbsp;<a HREF="EISadlogout.jsp" >Logout</a></td>
                </tr>
            </table>

            <table align="center" width="1050px"  id="mainTable">

                <tr>
                <br/>
                <td align="" class="data1" bgcolor="#d0f0f8">
           Hello <%=adName%> ! <br>
           Grievance Id  :<b class="grv"> <%=rs.getString("a.grvId")%></b>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td width="550px" align="left" style=" border-right:  2px black dashed" class="Div_one">

                                    <div class="data">
                                        Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=rs.getString("name")%>
                                    </div>
                                    <div class="data">
                                        Designation &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=rs.getString("a.designation")%>
                                    </div>
                                    <div class="data">
                                        Date Of Birth &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=rs.getString("a.dob")%>
                                    </div>

                                </td>
                                <td width="550px" align="left" class="Div_two">
                                    <br>
                                  <div class="data">
                                        Discipline &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=rs.getString("a.discipline")%>
                                    </div>
                                    <div class="data">
                                        Current Posting &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=rs.getString("a.curr_posting")%>
                                    </div>
                                    <div class="data">
                                        Date Of Joining &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=rs.getString("a.curr_doj")%>
                                    </div>
                                    <br/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="" class="data">Grievance Category&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;<b><%=rs.getString("b.grType")%></b></td>
                            </tr>
                            <tr>
                                <td class="data" rowspan=""> Date of Submission in the System &nbsp;:&nbsp;<b><%=timeOfSub%></b></td>
                            </tr>
                             <tr>
                                 <td colspan="2">
                                     <table>
                                         <tr>
                                             <td colspan="" class="data" width="150px">Grievance Detail&nbsp; :</td>
                                 <td colspan="" class="data">&nbsp;<span class="detail"><b><%=rs.getString("b.grDetail")%></b></span></td>
                                 </tr>
                                     </table>
                                     </td>
                            </tr>

                            <tr>
                                <td class="pdf" colspan="">Uploaded Document &nbsp;&nbsp; : </td>
                            </tr>
                            <tr>
                                <%
                                String user="";
                                String printUser="";
                                try{
                                    con=ConnectionManager.getConnectionDirectForMySQL();
                                    st=con.createStatement();
                                    String data="Select * from egs_file where egsId='"+grvId+"' and token='"+token+"'";
                                    rs=st.executeQuery(data);
                                    while(rs.next())
                                        {
                                       user=rs.getString("email");
                                %>

                                <table width="70%" align="center">
                                    <tr>
                                        <%
                                        if(adEmail.equals(user))
                                            {
                                            printUser=adName;
                                            }
                                       else{
                                           printUser=userName;
                                           }
                                        %>
                                        <td class="daata" width="250px" align="right"><%=printUser%>&nbsp; :-</td>
                                    <td class="daata"><a href="aa_download.jsp?f=<%=rs.getString("file")%>">&nbsp;&nbsp;&nbsp;View Document</a></td>

                                    </tr>



                                </table>



                                <%
                                }
                                    }
                                catch(Exception java){
                                    java.printStackTrace();
                                }
                                %>
                                </tr>

                                    <tr>
                                        <td class="reply" width="150px" align="center" colspan="2">

                                            <span id="answer1" style="display: none;"><p style="margin-bottom: -10px;">Select File :</p><br/>
                                                <input type="file" name="replyFile" id="replyFile"/> <br/><br/>
                                                 <input type="submit" value="Reply"/>
                                            </span>
                                        </td>


 </tr>
 <tr>

                                        <td class="daata" id="reply1" style="display: block;" colspan="2" align="center"><input type="button" value="Reply" name="reply" onclick="showDiv()"></td>
                                    </tr>

                        </table>
                    </td>
                </tr>
            </table>
        </form>
                                 <%
    }
            con.close();
            }
            catch(Exception ex){
                ex.printStackTrace();
            }

        %>
    </body>
     <%

                            }else
                                {
                            %>
                             <jsp:forward page="EIS_adError.jsp" />
                            <%}%>
</html>
