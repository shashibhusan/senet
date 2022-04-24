<%-- 
    Document   : EGS_userView
    Created on : Apr 24, 2018, 11:05:14 AM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.UUID" %>
<%@page import="java.util.Random" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
    <title>EIS Grievance Form</title>
    <link rel="shortcut icon" href="fevicon.png" type="image/x-icon">
    <script type="text/javascript" src="http://mpr.dcmsme.gov.in/dcmsme/mprsenet/EIS_forms.js"></script>
    <link href="EIS_0211test.css" rel="stylesheet" type="text/css" />
        <title>User View</title>
        <style>
                  #repErr{
    font-family: Bookman Old Style;
    color: red;
    font-size: 16px;
}

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
.user{
    font-family: Bookman Old Style;
     font-size: 17px;
    padding-bottom: -10x;

}
        </style>
        <script>
            function showDiv1(){

    document.getElementById('answer1').style.display = "block";
    document.getElementById('reply1').style.display = "none";

}

function submitReply()
{


    var x = document.getElementById("replyFile");
    if (x.files.length == 0) {
      document.getElementById("repErr").innerHTML="*Please select any file !";
      return false;
        }else{
          document.getElementById("repErr").innerHTML="";

      }

            for (var i = 0; i < x.files.length; i++) {

                var file = x.files[i];

                if ('size' in file) {
                    fileSize=file.size;
                  //  txt += "size: " + file.size + " bytes <br>";
                }
            }

            if(fileSize>1572864)
                {
                    document.getElementById("repErr").innerHTML="*Attachment size exceeds the allowed size (1.5 MB).."
                    return false;
                }
      else
    {
        document.forms[0].action = "EGS_reply_by_user.jsp"
  return true;
    }

}
        </script>
    </head>
    <body>
       <%
       System.out.println("---Redirected to user view----");
       String email=(String)session.getAttribute("email");
       String Session=(String)session.getAttribute("Session");

       response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        System.out.println("session value is="+Session);

        if(!Session.equals(null))
            {

       Connection con=null;
       ResultSet rs=null;
       Statement st=null;
            String timeOfSub="";
            int token=0;
            String grvId="";
            try{
            con=ConnectionManager.getConnectionDirectForMySQL();
            st=con.createStatement();
            String Query="select * from egs_basic a join egs_data b on a.token=b.token where a.email='"+email+"' ";
            rs=st.executeQuery(Query);
            while(rs.next())
                {
                token=rs.getInt("token");
                timeOfSub=rs.getString("time");
                grvId=rs.getString("grvId");
                timeOfSub=timeOfSub.substring(0, 11);

        %>
   <form id="divPrint" name="myForm" action="" method="POST" enctype="multipart/form-data">
            <br>

            <h2 class="head" align="center">Grievance Detail</h2>
            <center><p class="mainHeading">Acknowledgement (System Generated)</center>

            <table align="center" width="1050px"  id="mainTable1">
                <tr>
                    <td align="left" style="font-family: Bookman Old Style; font-weight: 10px; color: #9e0bc2; padding-bottom: 0px; ">User mode</td>
                    <td align="right" style="font-family: Bookman Old Style; font-weight: 10px; color: #9e0bc2 "><a HREF="EGS_logout.jsp" >Logout</a></td>


                </tr>
            </table>

            <table align="center" width="1050px"  id="mainTable">

                <tr>
                <br/>
                <td align="" class="data1" bgcolor="#d0f0f8">
           Hello <%=rs.getString("name")%> ! <br>
           Your Grievance Registration No is :     <b>  <%=rs.getString("a.grvId")%></b>
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
                                <td colspan="" class="data">Grievance Category&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;<%=rs.getString("b.grType")%></td>
                                <td class="data" rowspan="2"> Date of Submission <br> in the System&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=timeOfSub%></td>
                            </tr>
                             <tr>
                                <td colspan="2" class="data">Grievance Detail&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;<%=rs.getString("b.grDetail")%></td>
                            </tr>

                            <tr>
                                <td class="pdf" colspan="">Uploaded Document &nbsp;&nbsp; : </td>
                            </tr>

                            <tr>
                                <%
                                String replyType="";
                                String space="";
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
                                       replyType=rs.getString("replyType");
                                %>

                                <table width="40%" align="center">
                                    <tr>
                                        <%
                                        if(email.equals(user))
                                            {
                                            printUser="Grievance";
                                            }
                                       else{
                                           printUser="Grievance ";
                                           }

                                       if((rs.getString("replyType")).equals("user")){space="";}else{space="("+rs.getString("replyType")+")";}
                                        %>
                                        <td class="daata" width="250px" align="right"><%=printUser%>&nbsp<%=space%> :-</td>
                                        <td class="daata" width="250px" align="left"><a href="aa_download.jsp?f=<%=rs.getString("file")%>">&nbsp;&nbsp;&nbsp;View Document</a></td>

                                    </tr>


                                <%
                                }
                                    }
                                catch(Exception java){
                                    java.printStackTrace();
                                }
                                %>
                                <tr>
                                    <form id="divPrintReply" name="myForm" action="" method="POST" enctype="multipart/form-data"/>
                                        <td class="reply" width="150px" align="center" colspan="2">

                                            <span id="answer1" style="display: none;"><p style="margin-bottom: -10px;">Select File :</p><br/>
                                                        <input type="file" name="replyFile" id="replyFile"/> <br/><br/><div id="repErr"></div><br/>
                                                <input type="submit" value="Submit" onclick="return submitReply()" />
                                            </span>
                                            
                                        </td>


 </tr>
                                    <%
if(replyType.equals("Query"))
    {
    %>
    <tr>

                                        <td class="daata" id="reply1" style="display: block;" colspan="3" align="center">
                                            <input type="button" value="Reply" name="reply" onclick="showDiv1()"></td>
                                    </tr>
                                        <%
    }
%>

                                </table>

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

        <%
}else
    {
%>
<jsp:forward page="EGS_error.jsp" />

 <%}%>
    </body>
</html>
