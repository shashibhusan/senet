<%-- 
    Document   : EIS_ss_Grievance_register
    Created on : May 18, 2018, 2:54:27 PM
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

        <script type="text/javascript">
    var wordLen = 10; // Maximum word length
    function checkWordLen(obj) {
        var len = obj.value.split(/[\s]+/);
        if (len.length > wordLen) {
            alert("You cannot put more than " + wordLen + " words in this text area.");
            obj.oldValue = obj.value != obj.oldValue ? obj.value : obj.oldValue;
            obj.value = obj.oldValue ? obj.oldValue : "";
            return false;
        }
        return true;
    }
   </script>
<script language="javascript" type="text/javascript">
    function printDiv(divName) {
        var printContents = document.getElementById(divName).innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
    }
    </script>
    <script>
        function validateForm() {
            var x = document.forms["myForm"]["fname"].value;
            if (x == "") {
                alert("Name must be filled out");
                return false;
            }
        }
</script>
        <script type="text/javascript">
function showStuff(id) {
    document.getElementById(id).style.display = 'block';

}


function showDiv(select){
   if(select.value=='Other'){
    document.getElementById('answer1').style.display = "block";
   } else{
    document.getElementById('answer1').style.display = "none";
   }
}


function saveEis()
{


  var grType = document.getElementById("grType").value;
  var grDetail=document.getElementById("grDetail").value;
  var fileSize;
  //var check=document.getElementById("Decleration").value;
  //alert("====working====="+grType+"//"+grDetail);
  if(grType==null || grType=="")
      {
          document.getElementById("errCat").innerHTML="*Please Select Category !"
          return false;
      }else{
          document.getElementById("errCat").innerHTML="";

      }
   var x = document.getElementById("file");
  if (x.files.length == 0) {
      document.getElementById("err").innerHTML="*Please select any file !";
      return false;
        }else{
          document.getElementById("err").innerHTML="";

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
                    document.getElementById("err").innerHTML="*Attachment size exceeds the allowed limit.."
                    return false;
                }else{
          document.getElementById("err").innerHTML="";

      }

  if(document.getElementById("Decleration").checked==false)
      {
          document.getElementById("errDec").innerHTML="*Please accept declaration !"
          return false
      }

 /*   var upload=document.myForm.upload.value;
    if(upload==null || upload=="")
      {
          document.getElementById("msg").innerHTML = "*Please select file";
          return false;
      }*/
  else
      {
  document.forms[0].action = "EIS_SS_grievance_submit.jsp?v="+grType+"&vl="+grDetail;
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
#err{
    font-family: Bookman Old Style;
    color: red;
    font-size: 16px;
}
#errDec{
    font-family: Bookman Old Style;
    color: red;
    font-size: 16px;
}
#errCat{
    font-family: Bookman Old Style;
    color: red;
    font-size: 16px;
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
.head{
    font-family: Bookman Old Style;
    font-size: 32px;
    color: #7646f7;
    font-style: normal;
    font-weight: normal;
    margin-bottom: -15px;
    margin-top: 0px;
   
}

        </style>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
    <title>:: EIS Grievance Form [ss] ::</title>
    <link rel="shortcut icon" href="fevicon.png" type="image/x-icon">
    <script type="text/javascript" src="http://mpr.dcmsme.gov.in/dcmsme/mprsenet/EIS_forms.js"></script>
    <link href="EIS_0211test.css" rel="stylesheet" type="text/css" />
    </head>
    <%
        int mFlag=0;
        int token=0;
        String name="";
        String email=(String)session.getAttribute("email");
        String Session=(String)session.getAttribute("Session");
        session.setAttribute("email",email);
        session.setAttribute("Session",Session);

        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        System.out.println("session value is="+Session);

        if(!Session.equals(null))
            {
System.out.println("token generated=="+Session);


        Connection con=null;
        ResultSet rs=null;
        Statement st=null;
        try{
            con=ConnectionManager.getConnectionDirectForMySQL();
            st=con.createStatement();
            String query="select * from egs_ss_logindata where email='"+email+"'";
            rs=st.executeQuery(query);
           if(rs.next()){
             mFlag=1;

            }
        }
        catch(Exception e){
            e.printStackTrace();
        }

    %>
   <body>
    <br />
    <%
    if(mFlag==0)
            {
    %>
    <form id="divPrint" name="myForm" action="" method="POST" enctype="multipart/form-data">
    <table width="70%" align="center" >
        <tr>
            <td>
                <div class="hide" style="font-size: 14px; font-family: Verdana; font-weight: bold;
                    background: #ff903a; padding-top: 5px; padding-bottom: 5px; width: 100%" align="center">
                    Government of India, Ministry of MSME
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="hide" style="font-size: 14px; font-family: Verdana; font-weight: bold;
                    background: white; padding-top: 5px; padding-bottom: 5px;" align="center">
                    <font color="#990000"></font>O/o DCMSME
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="hide" style="font-size: 14px; font-family: Verdana; font-weight: bold;
                    background: #64bb64; padding-top: 5px; padding-bottom: 5px;" align="center">
                    <font color="#990000">ALL INDIA MSME-DO EMPLOYEES GRIEVANCE SYSTEM - SS </font>
                </div>
                
            </td>
        </tr>
        <tr>
            <td>
                <h2 align="center" class="head">:: Grievance Form ::
                </h2>
            </td>
        </tr>
        
        <%


        try{
            con=ConnectionManager.getConnectionDirectForMySQL();
            st=con.createStatement();
            String sql="Select * from eis_ss_registration where email='"+email+"'";
            rs=st.executeQuery(sql);
            while(rs.next())
                {
token=rs.getInt("token");
name=rs.getString("name");

        %>
        <%--     <div style=" display: none;"><input type="text" id="token" name="token" value="<%=token%>"/></div>  --%>
       <tr>
            <td >
                <div style="float: left !important">
                    <b> Hello &nbsp;  <%=name%></b>
                </div>
                <div style="float: right">
                    <b align="right"><a HREF="EIS_ss_logout.jsp" > <strong>Logout</strong></a></b>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                <div>

                    <fieldset>
                        <legend>Basic Information</legend>
                        <br />
                        <table align="center" width="100%">
                            <tr>
                                <td width="50%">
                                    <div>
                                        <div align="left" id="element">
                                            <b id="ele_head">Name :</b><br />
                                            <input type="text" id="bas_name" name="bas_name" value="<%=rs.getString("name")%>" class="bas_name" />
                                        </div>
                                        <div align="left" id="element">
                                            <b id="ele_head">Designation :</b><br />
                                            <input type="text" id="bas_designation" name="bas_designation" value="<%=rs.getString("designation")%>">
                                        </div>
                                        <div align="left" id="element">
                                            <b id="ele_head">Date of Birth :</b><br />
                                            <input type="text" id="dob" name="dob" class="datepicker" value="<%=rs.getString("dob")%>" placeholder="dd/mm/yyyy"
                                                readonly='true' value="" />
                                        </div>
                                    </div>
                                </td>
                                <td>
                                <div>
                                    <div  align="left" id="element">
                                        <b id="ele_head">Gender :</b><br />
                                        <input type="text" id="discipline" name="discipline"  value="<%=rs.getString("gender")%>" />
                                    </div>
                                    <div align="left" id="element">
                                        <b id="ele_head">Current Posting :</b><br />
                                        <input type="text" id="cur_posting" name="cur_posting"  value="<%=rs.getString("inst_id")%>" />
                                    </div>
                                    <div align="left" id="element">
                                        <b id="ele_head">Category</b><br />
                                        <input type="text" id="doj" name="doj"  value="<%=rs.getString("category")%>" />
                                    </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </fieldset>
                </div>
            </td>
        </tr>
        <%
        }
            con.close();
            }
        catch(Exception basic){
        basic.printStackTrace();
        }
        %>
        <tr>
            <td>
                <br />
                <br />
                <div>
                    <fieldset>
                        <legend>Grievance Details</legend>
                        <br />
                        <table align="center" width="86%">
                            <tr>
                                <td style=" margin-left:0px;">
                                    <b>Category</b><br />
                                    <select id="grType" name="grType" onchange="showDiv(this)" style="width: 400px">
                                        <option value="">Select</option>
                                        <option value="Service Matter(Except for Pay/Medical)">Service Matter(Except for Pay/Medical)</option>
                                        <option value="Pay Related Issue">Pay Related Issue</option>
                                        <option value="Medical Issue">Medical Issue</option>

                                            <option value="Other">Other</option>
                                    </select>
                                    <div id="errCat"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Grievance Description</b><br />
                                    <span id="answer1" style="display: none;">
                                        <textarea  rows="10" cols="100" placeholder="max 300 characters" id="grDetail" name="grDetail" onchange="checkWordLen(this);"></textarea></span>
                                </td>
                            </tr>
                            <tr>
                                <td>

                                    <br/>
                                    <b>Select PDF to upload upto 1.5 MB:</b>
                                    <input type="file" name="file" id="file"  style=" color:green" accept="application/pdf,application/vnd.ms-excel" />
                                    <%--      <input type="submit" onclick="return uploadFile();"   value="Upload" style="width: 80px" /> --%>
                                    <div id="err"></div>
                                    <p>[All relevant enclosures also may be enclosed along with the forwarding letter as one single document. if there are more number of documents, or more voluminous then that may be sent in hard copy.]</p>
                                </td>
                            </tr>
                            <tr>
                                <td >
                                    <input type="radio" name="Decleration" id="Decleration" value="Decleration" value="check" /><b  >Declarataion &#8628;</b>
                                    <div id="errDec"></div>
                                    <p >
                                        I hereby declare that the above grievance has been created by me and contents are uploaded by me. The hard copy of this representation has been submitted to my office redressal .</p>

                                </td>

                            </tr>
                                <tr>
                                <td>

                                 <p style=" color:red">
                                     <b> Note:</b>This initiative has been taken by this office to expedite grievances digitally.Therefore it may be used by employees for their speedy redressal of grievances.
                                     However, the normal official channel has to be followed in case of hard copy.Any grievance would be transmitted on line to HQtrs automatically on lapse of 30 days from the date
                                 of submission of representation online.</p>
                                </td>
                                </tr>
                        </table>

                        <br />
                    </fieldset>
                </div>
            </td>
        </tr>
    </table>
    <br />
    <table width="500px" align="center" >
        <tr>
            <td >
                <input type="submit" onclick="return saveEis();confirm(' Are you sure you want to submit and sent.');" value="Submit" />
            </td>

            <td >
                 <input id="btnPrint" runat="server"
                                 type="submit" value="Print" onclick="printDiv('divPrint')" />
            </td>
        </tr>
    </table>
    </form>
        <%
        }else
            {
        %>
<jsp:forward page="EIS_SS_userView.jsp" />

 <%
        }
        %>
    <br />
    <br />
    <br />
</body>
<%
}else
    {
%>
<jsp:forward page="EIS_ss_error.jsp" />

 <%}%>
</html>

