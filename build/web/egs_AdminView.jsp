<%-- 
    Document   : egs_AdminView
    Created on : Apr 14, 2018, 4:57:33 PM
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
        <title>Admin View grievance from SS</title>

        <script type="text/javascript">
            function showDiv(){

    document.getElementById('answer1').style.display = "block";
    document.getElementById('answer11').style.display = "none";
    document.getElementById('reply1').style.display = "none";

}

function showDivHQmain(){

    document.getElementById('answer1').style.display = "none";
    document.getElementById('answer11').style.display = "block";
    document.getElementById('reply1').style.display = "none";

}

function submitTransfer(){

var adEmail=document.getElementById('adEmail').value;
var grvId=document.getElementById('grvId').value;
var userEmail=document.getElementById('userEmail').value;
var instId=document.getElementById('instId').value;
var token=document.getElementById('token').value;
var reason=document.getElementById('reason_for_transfer').value;
if(reason==null || reason==""){
    document.getElementById("err").innerHTML="*Please type the reason for transfer.";
    return false;
}else
    {
        document.getElementById("err").innerHTML="";
        document.getElementById('answer11').style.display = "none";
        document.getElementById('reason1').style.display = "block";
        document.getElementById('reason').style.display = "block";
        document.getElementById("reason").innerHTML=reason;
    }

var url="EGS_TRANSFER.jsp?val="+adEmail+"&val1="+grvId+"&val2="+userEmail+"&val3="+instId+"&val4="+token+"&reason="+reason;

if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=getInfo;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
}

function getInfo(){
if(request.readyState==4){
var val=request.responseText;
document.getElementById('msg').innerHTML=val;
}
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
                    document.getElementById("repErr").innerHTML="*Attachment size exceeds the allowed size (1.5 MB)..!"
                    return false;
                }

                else
    {
        document.forms[0].action = "submitFile.jsp?type_of_reply="+replyType;
  return true;
    }

}

function cancel()
{
  document.getElementById('answer1').style.display = "none";
  document.getElementById('answer11').style.display = "none";
  document.getElementById('reply1').style.display = "block";
}

            </script>

        <style>

            input[type=submit],[type=button]{

              width: 150px;
                padding: 10px 10px 10px 10px;
}


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
    text-decoration: underline;

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
    padding-left: 29px;
    padding-top: 25px;
    color:  #FF5733 ;
    background-color: #ffffff;
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
.red-star {
    color: red;
    vertical-align: super;
    font-size: 17px;
    margin-bottom: 5px;
    margin-left: -32px;
}
.red-star1 {
    color: red;
    font-size: 17px;
    }
.note
{
    width: 100%;
    border-top: 1px gray thin;
    border-bottom: 1px black thin;
     background:  #d0f0f8 ;
     font-family: Bookman Old Style;
     font-size: 15px;
     height: 15px;

}
.note1{
    font-family: Bookman Old Style;
    font-weight: normal;
    color: red;
    font-size: 12px;
}
        </style>
    </head>
    <%
    System.out.println("=====we are on admin view page====");
    String Session=(String)session.getAttribute("Session");

    String adEmail=(String)session.getAttribute("adEmail");
    String instId=(String)session.getAttribute("instId");
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
    int iTransfer=0;
String date="";
String reason="";
String realTime="";
    try{
        con=ConnectionManager.getConnectionDirectForMySQL();
        st=con.createStatement();
        String sql="select * from eis_admin where email='"+adEmail+"'";
        rs=st.executeQuery(sql);
        while(rs.next())
            {
        adName=rs.getString("name");
        }
        }
    catch(Exception xex){
    xex.printStackTrace();
    }
    System.out.println("Admin is=="+adName);

    try{
        String Query="select * from egs_transfertohq where userEmail='"+email+"'";
        ResultSet result=st.executeQuery(Query);
        while(result.next())
            {
            iTransfer=1;
            date=result.getString("Time");
            reason=result.getString("reason");
        }
        realTime=date.substring(0,11);
        }
    catch(Exception tr){
        tr.printStackTrace();
    }


System.out.println("Transfer value==="+iTransfer);


    System.out.println("Admin Name is :="+adName);

    String grvId="";
    int token=0;

            try{
            con=ConnectionManager.getConnectionDirectForMySQL();
            st=con.createStatement();
            String Query="select * from egs_basic a join egs_data b on a.token=b.token where a.email='"+email+"' ";
            rs=st.executeQuery(Query);
            System.out.println(Query);
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
            <div style=" display: none;"><input type="text" id="grvId" name="grvId" value="<%=grvId%>"/></div>
            <div style=" display: none;"><input type="text" id="userEmail" name="userEmail" value="<%=email%>"/></div>
            <div style=" display: none;"><input type="text" id="instId" name="instId" value="<%=instId%>"/></div>
            <div style=" display: none;"><input type="text" id="token" name="token" value="<%=token%>"/></div>
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
           <%
           if(iTransfer==1)
               {
           %>
           Grievance No  :<b class="grv"> <%=rs.getString("a.grvId")%></b> <b class="note1"> (This grievance has been transferred to HQ Office , New Delhi on <%=realTime%>.)</b>
           <%
           }else
               {
           %>
           Grievance No  :<b class="grv"> <%=rs.getString("a.grvId")%></b>
           <%
           }
           %>
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
                                        Date of Joining &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=rs.getString("a.curr_doj")%>
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
                                <td colspan="2">&nbsp;</td>
                            </tr>
                             <tr>
                                 <td colspan="2" class="data" style=" padding-top: 10px; padding-bottom: 10px;">Grievance Detail
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;<%=rs.getString("b.grDetail")%></td>
                            </tr>

                            <tr>
                                <td align="left" class="pdf" colspan="">Uploaded Document &nbsp;&nbsp; : </td>
                            </tr>
                            <tr>
                                <%
                                String user="";
                                String printUser="";
                                String show="block";
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

                                <table width="50%" align="left">
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
                                           show="none";
                                       }
                                        %>
                                        <td class="daata" width="250px" align="right"><%=printUser%>&nbsp(<%=rs.getString("replyType")%>) :-</td>
                                    <td class="daata">&nbsp;&nbsp;&nbsp;<a href="aa_download.jsp?f=<%=rs.getString("file")%>">View Document</a></td>

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
                                        <td class="reply" width="150px" align="center" colspan="">

                                            <span id="answer1" style="display: none;"><p style="margin-bottom: -10px;">Select File :</p><br/>
                                                <Select name="type_of_reply" id="type_of_reply">
                                                    <option value="Query">Query</option>
                                                    <option value="Reply">FInal Reply</option>
                                                </Select>          <input type="file" name="replyFile" id="replyFile"/> <br/><br/><div id="repErr"></div><br/>
                                                <input type="submit" value="Submit" onclick="return submitReply()" /><input type="button" value="Cancel" onclick="cancel()" />
                                            </span> </td> </tr>
                                    <tr>

                                        <td>
                                            <table width="50%" align="center" id="reason1" style="display: none; height: 50px; background: #fffff">
                                                <tr >
                                                    <td align="left" width="170px" style=" font-family: Bookman Old Style; ">Reason For Transfer  :</td>
                                                    <td align="left" id="reason" style="display: none; font-family: Bookman Old Style; ">&nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                           <span id="answer11" style="display: none;"><p style="margin-bottom: -10px;">Reason For Transfer  :</p><br/>
                                                <textarea cols="100" rows="4" placeholder="Max 100 Char." id="reason_for_transfer" name="reason_for_transfer" maxlength="100"></textarea>
                                                <br/><br/><div id="repErr"></div>
                                                <input type="button" value="Transfer" onclick="return submitTransfer()" /><input type="button" value="Cancel" onclick="cancel()" />
                                            </span>
                                        </td>
 </tr>

      <%
      if(iTransfer==0)
          {
      %>
      <tr>
 <td class="daata" id="reply1" style="display: <%=show%>;" colspan="2" align="center">
     <input type="button" value="Reply" name="reply" onclick="showDiv()">
     <input type="button" value="Transfer to HQ" name="transferHQ" onclick="showDivHQmain()"><span class="red-star">*</span>
 </td>
      </tr>
 <%
 }else
     {
 %>
 <tr>
     <td align="left" style="padding-left: 29px; font-family: Bookman Old Style; font-size: 16px;">

         <b style="color: green; font-weight: normal;">  Reason :</b> <%=reason%>.
     </td>

 </tr>

 <%}%>

 <tr><td id="msg" align="center" style=" color: green;"></td></tr>
 <tr><td id="err" align="center" style=" color: red;"></td></tr>

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

                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                      <tr>
                          <%
                          if(iTransfer==0){
                          %>
                    <td class="note">
                        <p class="notice"><a class="red-star1">*</a>&nbsp;If the Grievance needs to be forwarded to HQ Office.</p>
                    </td>
                    <%}else
                        {%>
                        <td class="note">
                            <p class="notice">&nbsp;</p>
                    </td>
                        <%}%>
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

