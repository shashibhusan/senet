<%-- 
    Document   : EIS_grievance
    Created on : Mar 9, 2018, 10:15:02 AM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grievance Registration</title>
        <style>
            .title{
                font-size: 28px;
                font-family: Verdana;
                padding-top: 8px;

}
.titlesub{
    margin-left: 10px;
    font-family: Verdana;
    font-size: 15px;
    color:  #9e9e9e;
       padding-top: 8px;
}

#mainTable{
   
    background-color: white;
    height: 40px;
    border: 1px  #d5d5d5 solid;
    overflow: scroll;
}
.mainH{
    width: 100%;
    height: 14px;
    background:   #30a4e7 ;
    padding-top: 5px;
    padding-bottom: 5px;
    font-family: Verdana;
    padding-left: 10px;
    color: white;
}
input[type=text],[type=date],select {
    width: 80%;
    padding: 6px 10px;
    margin: 4px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 2px;
    box-sizing: border-box;
}
.tableBasic{
    background-color: white;
    border-radius: 4px;
}
.input{
    padding-left: 50px;
    padding-bottom: -5px;
    font-family: Verdana;
}
.tableCate{
    padding-left: 70px;
    padding-bottom: -5px;
    font-family: Verdana;
}
p{
    font-size: 12px;
    padding-left: 4px;
    color:  #078705 ;
}
.note{
    font-size: 15px;
    padding-left: 4px;
    color: red;
    font-weight: bold;
}
        </style>
    </head>
    <body bgcolor="#e2eef1">
        <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; " align="center">Government of India, Ministry of MSME </div>
        <div style="font-size: 14px;font-family:Verdana;font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"></font>O/o  DCMSME </div>
        <%--         <div style="font-size: large;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"> <%=user_cur_ofc%></font></div> --%>
       <div style="font-size:14px;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center" ><font color="#990000">ALL INDIA MSME-DO EMPLOYEE'S INFORMATION SYSTEM </font>
         </div>

       <table align="center" width="1100px">
           <tr>
               <td align="left">
                   <div>
                       &nbsp;
                   </div>
           <div>
               <a class="title">Grievance</a><a class="titlesub"> REGISTRATION FORM </a>
           </div>
                   <div>
                       &nbsp;
                   </div>
               </td>
           </tr>
           <tr>
               <td>
                   <table id="mainTable" align="center" width="100%" bgcolor="white">
                       <tr>
                           <td class="mainH" colspan="2">
                               Basic Details
                         <br>  </td>
                       </tr>
                       </table>
                   <table align="center" width="100%" class="tableBasic">
                       <tr>
                           <td>
                               &nbsp;
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <table width="100%">
                                   <tr>
                                       <td width="120px" class="input">Name&nbsp;:<br/></td></tr>
                                   <tr> <td width="100%" class="input">&nbsp;<input type="text" name="name" id="name"/></td></tr>
                                   <tr><td class="input">Email&nbsp;:</td></tr>
                                   <tr>  <td class="input">&nbsp;<input type="text" name="email" id="email"/></td>
                                   </tr>
                                   <tr>
                                       <td class="input">Designation&nbsp;:</td></tr>
                                   <tr>   <td class="input">&nbsp;<input type="text" name="designation" id="designation"/></td>
                                   </tr>

                               </table>

                           </td>
                           <td>
                                <table width="100%">
                                   <tr>
                                       <td width="120px" class="input">Current Office&nbsp;:</td> </tr>
                                   <tr>   <td width="100%" class="input">&nbsp;<input type="text" name="currOfc" id="currOfc"/></td>
                                   </tr>
                                   <tr>
                                       <td class="input">Date Of Joining ( MSME-DO )&nbsp;:</td></tr>
                                <tr>   <td class="input">&nbsp;<input type="text" name="dojmsme" id="dojmsme"/></td>
                                   </tr>
                                   <tr>
                                       <td class="input">Current Pay Level&nbsp;:</td></tr>
                                   <tr>    <td class="input">&nbsp;<input type="text" name="currpaylvl" id="currpaylvl"/></td>
                                   </tr>

                               </table>
                               

                           </td>
                       </tr>
                       <tr>
                           <td>
                               &nbsp;
                           </td>
                       </tr>


                   </table>
                   </td>


           </tr>

       </table><br/><br/>

<table align="center" width="1100px">

           <tr>
               <td>
                   <table id="mainTable" align="center" width="100%" bgcolor="white">
                       <tr>
                           <td class="mainH" colspan="2">
                               Grievance Details
                         <br>  </td>
                       </tr>
                       </table>
                   <table align="center" width="100%" class="tableBasic">
                       <tr>
                           <td>
                               &nbsp;
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <table align="center" width="70%" class="tableBasic">


                       <tr>
                           <td align="Left" class="tableCate">
                               Grievance Category &nbsp;:
                           </td>
                       </tr>
                       <tr>
                           <td align="center">
                               <select name="grCategory" id="grCategory" style="max-width:100%;">
                                   <option>--Select Grievance Category--</option>
                               </select>
                           </td>
                       </tr>
                       <tr>
                       <td class="tableCate"><br/>
                                    
                                    <span id="answer1" style="display: none;"><b>Grievance Description &nbsp;:</b><br />
                                        &nbsp;<textarea  rows="10" cols="72" placeholder="max 300 characters" id="grDetail" name="grDetail" onchange="checkWordLen(this);"></textarea>
                                    </span>
                                </td>
                       </tr>

                       <tr>
                           <td class="tableCate"> Upload File&nbsp;<b>(size upto 1.5 MB only)</b></td>
                       </tr>
                       <tr>
                           <td class="tableCate">
                                &nbsp;<input type="file" id="file" name="file" accept="pdf/JPEG"/>
                           </td>
                       </tr>

                       <tr>
                           <td class="tableCate">
                               <p>[ &nbsp;All relevant enclosures also may be enclosed along with the forwarding letter as one single document. if there are more number of documents,
                                   or more voluminous then that may be sent in hard copy. &nbsp;]</p>
                           </td>
                       </tr>

                       <tr>
                           <td class="tableCate" style="font-size: 12px;padding-left: 72px;"><br/>
                               <input type="checkbox" name="Decleration" id="Decleration" checked="checked" />
                               I hereby declare that the above grievance has been created by me and contents are uploaded by me.
                                   The hard copy of this representation has been submitted to my office redressal .
                           </td>
                       </tr>

                       <tr>
                           <td class="tableCate"><br/>
                               <p style="font-size: 12px; padding-left: 4px; color: red;"> <a class="note">Note&nbsp;:</a>This initiative has been taken by this office to expedite grievances digitally.Therefore it may be used by employees
                               for their speedy redressal of grievances. However,the normal official channel has to be followed in case of hard copy.Any grievance would be
                               transmitted on line to HQtrs automatically on lapse of 30 days from the date of submission of representation online.</p>
                           </td>
                       </tr>



                       <tr>
                           <td>
                               &nbsp;
                           </td>
                       </tr>
</table>
                           </td>
                       </tr>

                   </table>
                   </td>


           </tr>

       </table>

    </body>
</html>
