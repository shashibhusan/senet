<%-- 
    Document   : EmployeeInfo
    Created on : Dec 15, 2017, 9:51:54 AM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
        <style>
            body {font-family:Arial, Helvetica, sans-serif;}
            .his {

}
            .td {
                padding-top: 5px;
                padding-bottom: 5px;
                margin-top: 10px;
}
            .num {
                color: blue;
}
            .tab1 {
                padding-top: 20px;
                margin-top: 20px;
                font-size: 13px;
               width: 1000px;
                height: 15px;
               background:  #e8f5e3;
                   }
                   .main {
                        background:  none ;
                       border: 1px;
                       border-style: dotted;
}


        </style>
        <title>Employee Information System</title>
    </head>

    <%
                String institute_name = " ";
                String mnm = request.getParameter("mnm");
                String instId = (String) session.getAttribute("CmbIns");
                String role = (String) session.getAttribute("rol");
                String years = (String) session.getAttribute("CmbYear");
                String months = (String) session.getAttribute("CmbMonth");
                String user = (String) session.getAttribute("user");
                if (instId != null) {
                    institute_name = ConnectionManager.instituteName(instId);
                }
    %>

    <body>
        <div style="font-size:large;font-family:Verdana;font-weight:bold" align="center"><font color="#990000"> <%= institute_name%></font></div>
       <div style="font-size:large;font-family:Verdana;font-weight:bold;  " align="center" ><font color="#990000">Employee Information System</font></div>
       <br/><br/>
       <form action="#" method="post">

           <table class="main" align="center"  style="width: 100%; height: 100%">
               <tr>
                   <td> <br/>
                       
                       <table align="center">
                                                  
                           <tr class="tab1">    <td class="td"> Name<b style=" color: red; font: 20px;">*</b>  </td>
                               <td class="td"> : &nbsp; <input type="text" size="43" id="name" class="name" placeholder="Full Name"/> </td>   </tr>

                           <tr class="tab1">  <br/>  <td class="td"> Designation <b style=" color: red; font: 20px;">*</b> </td>
                               <td class="td"> : &nbsp; <input type="text" size="43" id="degin" class="degin" placeholder="Designation"/> </td>  </tr>

                           <tr class="tab1">    <td class="td"> Date Of Borth<b style=" color: red; font: 20px;">*</b> </td>
                               <td class="td"> : &nbsp; <input type="text" size="43" id="dob" class="dob" placeholder="DD/MM/YYYY"/> </td> </tr>

                           <tr class="tab1">    <td class="td"> Date Of Joining <b style=" color: red; font: 20px;">*</b> </td>
                               <td class="td"> : &nbsp; <input type="text" size="43" id="doj-G" class="doj-G" placeholder="DD/MM/YYYY"/> </td> </tr>

                           <tr class="tab1">    <td class="td"> Date Of Joining To The O/o DCMSME / MSME-DIs<b style=" color: red; font: 20px;">*</b> </td>
                               <td class="td"> : &nbsp; <input type="text" size="43" id="doj-msme" class="doj-msme" placeholder="DD/MM/YYYY"/> </td> </tr>

                           <tr class="tab1">    <td class="td"> Date Of Retirement<b style=" color: red; font: 20px;">*</b> </td>
                               <td class="td"> : &nbsp; <input type="text" size="43" id="doR" class="doR" placeholder="DD/MM/YYYY"/> </td> </tr>
                           
                           <tr align="left"><td> <br/><b>Posting History in O/o DCMSME / MSME-DIs</b></td></tr>
                           
                           <tr class="tab1">    <td class="his" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong class="num">1 </strong>. Office Name </td>
                               <td> : &nbsp; <input type="text" size="35" id="ofc1" class="ofc1" placeholder="Name Of Office 1 "/> </td> </tr>
                           <tr class="tab1">    <td class="his"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Duration </td>
                               <td> : &nbsp; <input type="text" size="5" id="yr1" class="yr1" placeholder="year "/>
                                             <input type="text" size="5" id="mnth1" class="mnth1" placeholder="month "/>
                               </td> </tr>

                           <tr class="tab1">    <td class="his"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong class="num">2 </strong>. Office Name </td>
                               <td> : &nbsp; <input type="text" size="35" id="ofc2" class="ofc2" placeholder="Name Of Office 2 "/> </td> </tr>
                           <tr class="tab1">    <td class="his"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Duration </td>
                               <td> : &nbsp; <input type="text" size="5" id="yr2" class="yr2" placeholder="year "/>
                                             <input type="text" size="5" id="mnth2" class="mnth2" placeholder="month "/> </td> </tr>

                           <tr class="tab1">    <td class="his"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong class="num">3 </strong>. Office Name </td>
                               <td> : &nbsp; <input type="text" size="35" id="ofc3" class="ofc3" placeholder="Name Of Office 3 "/> </td> </tr>
                           <tr class="tab1">    <td class="his"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Duration </td>
                               <td> : &nbsp; <input type="text" size="5" id="yr3" class="yr3" placeholder="year "/>
                                             <input type="text" size="5" id="mnth3" class="mnth3" placeholder="month "/> </td> </tr>
                           <tr><td></td><td></td></tr>

                           <tr class="tab1">    <td class="td"> Current Posting<b style=" color: red; font: 20px;">*</b> </td>
                               <td class="td"> : &nbsp; <input type="text" size="43" id="doR" class="doR" placeholder="Current Office Name"/> </td> </tr>

                           <tr width="263" align="left"  class="tab1">    <td class="td"> 3 Option For Desire Postings<b style=" color: red; font: 20px;">*</b> </td>
                               <td colspan="2" align="left" class="td"><textarea id="desire_posting_location" rows="2" cols="42" name="desire_posting_location"   title="mandatory to field by institute"tabindex="15"  maxlength="375" wrap="EIS"  class="desire_posting_location"
                                                                                  onKeyDown="textCounter(document.form1.detail_of_case,document.form1.remLen12,125)"
                                                                                  onKeyUp="textCounter(document.form1.detail_of_case,document.form1.remLen12,125)">
                        </textarea>	       </td> </tr>


                           <tr width="263" align="left"  class="tab1">    <td class="td"> Training Obtained Till Date<b style=" color: red; font: 20px;">*</b> </td>
                               <td colspan="2" align="left" class="td"><textarea id="training_detail" rows="2" cols="42" name="training_detail"   title="mandatory to field by institute"tabindex="15"  maxlength="375" wrap="EIS"  class="training_detail"
                                                                                  onKeyDown="textCounter(document.form1.detail_of_case,document.form1.remLen12,125)"
                                                                                  onKeyUp="textCounter(document.form1.detail_of_case,document.form1.remLen12,125)">
                        </textarea>	       </td> </tr>

                           <tr width="263" align="left"  class="tab1">    <td class="td"> Training Desired </td>
                               <td colspan="2" align="left" class="td"><textarea id="training_desired" rows="2" cols="42" name="training_desired"   title="mandatory to field by institute"tabindex="15"  maxlength="375" wrap="EIS"  class="training_desired"
                                                                                  onKeyDown="textCounter(document.form1.detail_of_case,document.form1.remLen12,125)"
                                                                                  onKeyUp="textCounter(document.form1.detail_of_case,document.form1.remLen12,125)">
                        </textarea>	       </td> </tr>

                            <tr width="263" align="left"  class="tab1">    <td class="td"> Remark </td>
                               <td colspan="2" align="left" class="td"><textarea id="remark" rows="2" cols="42" name="remark"   title="mandatory to field by institute"tabindex="15"  maxlength="375" wrap="EIS"  class="remark"
                                                                                  onKeyDown="textCounter(document.form1.detail_of_case,document.form1.remLen12,125)"
                                                                                  onKeyUp="textCounter(document.form1.detail_of_case,document.form1.remLen12,125)">
                        </textarea>	 <br/><br/>      </td> </tr>

                          
                       </table>
                       <br/><br/>

                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      
                      <input type="submit" value="Submit" name="submit"></input>


                   </td>
               </tr>
           </table>
	</form>
    </body>
</html>
