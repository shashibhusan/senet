<%-- 
    Document   : EGS_hQtrView
    Created on : Apr 24, 2018, 2:01:45 PM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*"  %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
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

    var replyType=document.getElementById('type_of_reply').value;
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
                }else
    {
        document.forms[0].action = "EGS_reply_by_Hqtr.jsp?type_of_reply="+replyType;
  return true;
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
        </style>
    </head>
    <%
    String Session=(String)session.getAttribute("Session");

    String adEmail=(String)session.getAttribute("adEmail");
    String val=request.getParameter("nnMQFds495dS6fhXxQjd");
    String email=request.getParameter("vax");


        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        System.out.println("session value is="+Session);

System.out.println("token we get=="+val);
    if(!Session.equals(null))
    {
session.setAttribute("Session",Session);
       session.setAttribute("adEmail",adEmail);
       session.setAttribute("email",email);
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
   <form name="reForm" action="" id="reForm" method="post" enctype="multipart/form-data">
            <br>
            <div style=" display: none;"><input type="text" id="adEmail" name="adEmail" value="<%=adEmail%>"/></div>
            <h2 class="head" align="center">Grievance Detail</h2>
            <center><p class="mainHeading">Acknowledgement (System Generated)</center>

            <table align="center" width="1050px"  id="mainTable1">
                <tr>
              <td align="left" style="font-family: Bookman Old Style; font-weight: 10px; color: #9e0bc2 ">Admin mode</td>
                    <td class="logout" align="right"><a HREF="EIS_aduser.jsp" >Home</a>&nbsp;&nbsp;&nbsp;<a HREF="EISadlogout.jsp" >Logout</a></td>
                </tr>
            </table>

            <table align="center" width="1050px"  id="mainTable">

                <tr>
                <br/>
                <td align="" class="data1" bgcolor="#d0f0f8">
           Hello <%=adName%> ! <br>
           Grievance No  :<b class="grv"> <%=rs.getString("a.grvId")%></b>
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
                                String user="";
                                String printUser="";
                                String show="none";
                                try{
                                    con=ConnectionManager.getConnectionDirectForMySQL();
                                    st=con.createStatement();
                                    String data="Select * from egs_file where egsId='"+grvId+"' and token='"+token+"'";
                                    rs=st.executeQuery(data);
                                    while(rs.next())
                                        {
                                       user=rs.getString("email");
                                       show=rs.getString("replyType");
                                %>

                                <table width="40%" align="center">
                                    <tr>
                                        <%
                                        if(adEmail.equals(user))
                                            {
                                            printUser=adName;
                                            }
                                       else{
                                           printUser=userName;
                                           }
                                       if(show.equals("Reply"))
                                           {
                                           show="disable";
                                       }
                                        %>
                                        <td class="daata" width="250px" align="right"><%=printUser%>&nbsp(<%=rs.getString("replyType")%>) :-</td>
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
                                                <Select name="type_of_reply" id="type_of_reply">
                                                    <option value="Query">Query</option>
                                                    <option value="Reply">FInal Reply</option>
                                                </Select>          <input type="file" name="replyFile" id="replyFile"/> <br/><br/>
                                                <input type="submit" value="Submit" onclick="return submitReply()" />
                                            </span>
                                            <div id="repErr"></div>
                                        </td>


 </tr>
 <tr>

     <td class="daata" id="reply1" style="display: block;" colspan="2" align="center"><input type="button" value="Reply" disabled="<%=show%>" name="reply" onclick="showDiv()"></td>
                                    </tr>
                                    <%
                                    if(show.equals("disable"))
                                        {
                                    %>
                                    <tr>
                                        <td align="center" colspan="2" style=" font-family: Bookman Old Style; font-size: 18px; color: red;">
                                            *Your final reply has been submitted already.
                                        </td>
                                    </tr>

                                    <%
                                    }
                                    %>

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
