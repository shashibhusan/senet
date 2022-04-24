<%-- 
    Document   : feedbackForm
    Created on : Jun 15, 2018, 12:15:35 PM
    Author     : Senet
--%>

<%@page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Random" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MSME Related Issue</title>
        <script type="text/javascript" src="feedbackForm.js"></script>
         <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="shortcut icon" href="fevicon.png" type="image/x-icon">
        <style>
 body
 {
     font: normal normal Verdana, Geneva, Arial, Helvetica, sans-serif;
 }
            
            input[type=text],[type=select]
{
    padding: 10px 10px 10px 10px;
    
}
    select{
       
    padding: 10px 10px 10px 10px;
    width: 430px;}
    .dy{
        margin-top: 15px;
    background-color: #e7e7e7;
    border-radius: 5px;
    padding-top: 5px;
}
.data{
    margin-top: 8px;
}
a:visited {
    text-decoration: none;
    color: blue;

}
a{
    font-family: Bookman Old Style;
}
body{
    font-family: Bookman Old Style
}
#err1,#err2,#err3,#err4,#err5,#err6,#err7,#err8,#err9,#err10,#err11,#err12,#err13,#err14,#errname,#erremail,#erruam,#errcatrel,#err_other,#input{
    color: red;
    font-size: 13px;
}
.mainDiv{
    padding-left: 100px;
}
input[type=submit] {
    width: 80%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
input[type=button] {

    padding: 5px;
    margin: 4px 0;
    cursor: pointer;
    
}
.button{margin-right: 20px;}

input[type=submit]:hover {
    background-color: #45a049;
}
.success
{
    color: green;
    font-size: 12px;
}
.fail
{
    color: red;
    font-size: 15px;
}
b,span{
    font-family: Verdana, Geneva, sans-serif;
    
}
.popup{
   
}
ul {
     font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
    list-style-type: none;
    background-color: #efeede;
    padding: 0;
    overflow: hidden;
    margin-top: 0px;
    margin-bottom: 40px;

}

li {
    float: left;
    font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
}

li a {
     
    display: inline-block;
    color: Blue;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    font-family: Georgia;
    font-size: 17px;
}

li a:hover {
   cursor: url;
}
li:hover{
    background-color:   #d6cf6f  ;
}
#mainDiv
{
    font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
    border: 1px #efeede solid;
    width: 50%;
    margin: auto;
    align: center;
    background-color: #ffffff;
}
        </style>
    

    </head>
    <body bgcolor=" #eeeeee ">
        
        
       <div class="hide" style="font-size: 14px;font-family:Verdana;font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; " align="center">Government of India, Ministry of MSME </div>
       <div class="hide" style="font-size: 14px;font-family:Verdana;font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"></font>O/o  DC-MSME </div>
       <div class="hide" style="font-size:14px;font-family:Verdana;font-weight:bold; background:  #64bb64; padding-top: 5px; padding-bottom: 5px; " align="center" ><font color="#990000">MSME RELATED ISSUE </font>
         </div>

<%
Random rand = new Random();
int token = rand.nextInt(900000) + 100000;

SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Date date = new Date();
String submit_date=dateFormat.format(date);
String year=submit_date.substring(6, 11);

//System.out.println("Year :"+year);

String ref_num=token+"/"+year;
session.setAttribute("ref_num",ref_num);
%>
<div id="mainDiv">
<table align="center" width="550px">
            <tr>
                <td align="center">
                  <ul>
                      <li id="link"><a href="admin_login.jsp">Admin login</a>|</li>
                      <li id="link"><a href="search_suggestion.jsp">Search your Suggestion</a></li>
                     </ul>
                </td>
            </tr>
        </table>
          
            <h2 align="center" style="font-family: vardana; margin: 0px;">Inputs For Addressing The MSME - Related Issues</h2>
        
            <h3 align="center" style="font-family: Verdana, Geneva, sans-serif; color: green; font-size: 17px; margin: 0px;">S. No. : <%=ref_num%></h3>
            <div class="mainDiv" style="width: 550px; margin: auto;">
            <form name="feedback" action="" method="post">
            <div>&nbsp;</div>
            <div><b> Name ( Full Name ): </b><br/>
                <input type="text" name="name" id="name" class="data" size="65" placeholder="Full Name"/>
            </div>
            <div id="errname"></div>

            <div>&nbsp;</div>

            <div><b> Email: </b><br/>
                <input type="text" name="email" id="email" class="data" size="65" placeholder="Email"/>
            </div>
            <div id="erremail"></div>

            <div>&nbsp;</div>

            <div><b>Category you Belong to :</b> <br/>
            
                <select name="category" id="category" class="data" onchange=" showDiv(this)">
                <option value="">Select</option>
            <option value="MSME Association">MSME Association</option>
            <option  value="MSME">MSME</option>
            <option  value="Volunteer">Volunteer</option>
            <option  value="Prospective Entrepreneur (Intending to commence business)"> MSME Association (Intending to commence business)</option>
            <option  value="Cluster Federation / Association">Cluster Federation / Association</option>
            <option  value="Research Scholar/Student">Research Scholar/Student</option>
            <option  value="Think Tank">Think Tank</option>
            <option  value="Government Official State Government">Government Official State Government</option>
            <option  value="Government Official Central Government">Government Official Central Government</option>
            <option  value="Autonomous Body / Society(Regd.)/Livelihood Project">Autonomous Body / Society(Regd.)/Livelihood Project</option>
            <option  value="Other">Other</option>
            </select>


            </div>
            <div id="errcatrel"></div>
            <div align="center">
                <span id="answer1" style="display: none;" class="dy">
                    <div align="left" style="padding-bottom: 5px; padding-top: 5px; margin-left: 20px;"><b>Please Specify :</b></div>
                    <textarea rows="3" cols="60" placeholder="Max 60 characters" maxlength="60" id="other_cat" name="other_cat" ></textarea>
                <br/>
                <div>&nbsp;</div>
                <div>&nbsp;</div>
                </span>
                
            </div>
            <div id="err_other"></div>

            <div>&nbsp;</div>

            <div>
                <b>  If MSME then provide UAM No:</b> &nbsp;&nbsp;<br/>( else may be registered <a href="https://udyogaadhaar.gov.in" target="_blank"> here </a>)
                <input type="text" name="uam" id="uam" class="data" size="65" placeholder="UAM NUMBER"/>
            </div>
            <div id="erruam"></div>

            <div>&nbsp;</div>

            <div> <b>  MSME Related Issues :</b>

                <select name="msme_related_issue" id="msme_related_issue" class="data" onchange="showDivFeedback(this)">
                    <option value="">Select</option>
                    <option value="Agri- business and rural enterprise value chains">1- Agri- business and rural enterprise value chains </option>
                    <option value="Trade in Services">2-Trade in Services</option>
                    <option value="Manufacturing and Technology">3- Manufacturing and Technology </option>
                    <option value="Social Entrepreneurship">4- Social Entrepreneurship</option>
                    <option value="Policy and Governance">5- Policy and Governance</option>
                    <option value="Industrial Research and Tech Services">6- Industrial Research and Tech Services</option>
                    <option value="Energy and Transport">7- Energy and Transport</option>
                    <option value="Digital Services">8- Digital Services</option>
                    <option value="Investment Promotion and Financial Issues ( including credit and delayed payment)">9- Investment Promotion and Financial Issues ( including credit and delayed payment)</option>
                    <option value="Market Access (including Public Procurement Policy)">10- Market Access (including Public Procurement Policy)</option>
                    <option value="Skills">11- Skills</option>
                    <option value="Clusters">12- Clusters</option>
                    <option value="Knowledge Services for MSMEs">13- Knowledge Services for MSMEs</option>
                    <option value="Innovative Ideas">14- Innovative Ideas</option>
                    <option value="Art-based Enterprise">15- Art-based Enterprise</option>
                    <option value="Any other issue">16- Any other issue</option>
                </select>

            </div>
<%-- 1st Issue   --%>
            <div align="center">
                <span id="issue1" style="display: none;" class="dy">
                    <div align="left" style="padding-bottom: 5px; padding-top: 5px; margin-left: 20px;"><b>Agri- business and rural enterprise value chains  :</b></div>
                    <textarea onkeypress="return RestrictCommaSemicolon(event);" ondrop="return false;" onpaste="return false;"  rows="3" cols="60" placeholder="Max 50 words" maxlength="200" id="tcname[1]" name="tcname[1]"></textarea>

                    <div style="margin-top: 5px;" id="dynamicInput"></div>
                    <div style="margin-top: 5px;" id="err1"></div>

                    <div class="button" align="right">
                        <input type="button" value="Upload Issue" onclick="return submitIssue();"/>
                        <input type="button" value="Add one more Issue" onClick="return addInput1('dynamicInput');"></div>
                </span>
            </div>

<%-- 2st Issue   --%>

            <div align="center">
                <span id="issue2" style="display: none;" class="dy">
                    <div><b>Trade in Services  :</b></div>
                    <textarea  rows="3" cols="60" placeholder="Max 50 words" maxlength="200" id="TIS[1]" name="TIS[1]"></textarea>

                    <div style="margin-top: 5px;" id="dynamicInput2"></div>
                    <div style="margin-top: 5px;" id="err2"></div>

                    <div class="button" align="right">
                        <input type="button" value="Upload Issue" onclick="return submitIssue();"/>
                        <input type="button" value="Add one more Issue" onClick="return addInput2('dynamicInput2');"></div>
                </span>
            </div>

<%-- 3rd Issue   --%>

            <div align="center">
                <span id="issue3" style="display: none;" class="dy">
                    <div><b>Manufacturing and Technology  :</b></div>
                    <textarea  rows="3" cols="60" placeholder="Max 50 words" maxlength="200" id="MT[1]" name="MT[1]"></textarea>

                    <div style="margin-top: 5px;" id="dynamicInput3"></div>
                    <div style="margin-top: 5px;" id="err3"></div>

                    <div class="button" align="right">
                        <input type="button" value="Upload Issue" onclick="return submitIssue();"/>
                        <input type="button" value="Add one more Issue" onClick="return addInput3('dynamicInput3');"></div>
                </span>
            </div>


<%-- 4th Issue   --%>

            <div align="center">
                <span id="issue4" style="display: none;" class="dy">
                    <div><b>Social Entrepreneurship :</b></div>
                    <textarea  rows="3" cols="60" placeholder="Max 50 words" maxlength="200" id="SE[1]" name="SE[1]"></textarea>

                    <div style="margin-top: 5px;" id="dynamicInput4"></div>
                    <div style="margin-top: 5px;" id="err4"></div>

                    <div class="button" align="right">
                        <input type="button" value="Upload Issue" onclick="return submitIssue();"/>
                        <input type="button" value="Add one more Issue" onClick="return addInput4('dynamicInput4');"></div>
                </span>
            </div>

<%-- 5th Issue   --%>

            <div align="center">
                <span id="issue5" style="display: none;" class="dy">
                    <div><b>Policy and Governance :</b></div>
                    <textarea  rows="3" cols="60" placeholder="Max 50 words" maxlength="200" id="PG[1]" name="PG[1]"></textarea>

                    <div style="margin-top: 5px;" id="dynamicInput5"></div>
                    <div style="margin-top: 5px;" id="err5"></div>

                    <div class="button" align="right">
                        <input type="button" value="Upload Issue" onclick="return submitIssue();"/>
                        <input type="button" value="Add one more Issue" onClick="return addInput5('dynamicInput5');"></div>
                </span>
            </div>


<%-- 6th Issue   --%>

            <div align="center">
                <span id="issue6" style="display: none;" class="dy">
                    <div><b>Industrial Research and Tech Services :</b></div>
                    <textarea  rows="3" cols="60" placeholder="Max 50 words" maxlength="200" id="IRTS[1]" name="IRTS[1]"></textarea>

                    <div style="margin-top: 5px;" id="dynamicInput6"></div>
                    <div style="margin-top: 5px;" id="err6"></div>

                    <div class="button" align="right">
                        <input type="button" value="Upload Issue" onclick="return submitIssue();"/>
                        <input type="button" value="Add one more Issue" onClick="return addInput6('dynamicInput6');"></div>
                </span>
            </div>

<%-- 7th Issue   --%>

           <div align="center">
                <span id="issue7" style="display: none;" class="dy">
                    <div><b>Energy and Transport :</b></div>
                    <textarea  rows="3" cols="60" placeholder="Max 50 words" maxlength="200" id="ET[1]" name="ET[1]"></textarea>

                    <div style="margin-top: 5px;" id="dynamicInput7"></div>
                    <div style="margin-top: 5px;" id="err7"></div>

                    <div class="button" align="right">
                        <input type="button" value="Upload Issue" onclick="return submitIssue();"/>
                        <input type="button" value="Add one more Issue" onClick="return addInput7('dynamicInput7');"></div>
                </span>
            </div>

<%-- 8th Issue   --%>

            <div align="center">
                <span id="issue8" style="display: none;" class="dy">
                    <div><b>Digital Services :</b></div>
                    <textarea  rows="3" cols="60" placeholder="Max 50 words" maxlength="200" id="DS[1]" name="DS[1]"></textarea>

                    <div style="margin-top: 5px;" id="dynamicInput8"></div>
                    <div style="margin-top: 5px;" id="err8"></div>

                    <div class="button" align="right">
                        <input type="button" value="Upload Issue" onclick="return submitIssue();"/>
                        <input type="button" value="Add one more Issue" onClick="return addInput8('dynamicInput8');"></div>
                </span>
            </div>

<%-- 9th Issue   --%>

            <div align="center">
                <span id="issue9" style="display: none;" class="dy">
                    <div><b>Investment Promotion and Financial Issues ( including credit and delayed payment) :</b></div>
                    <textarea  rows="3" cols="60" placeholder="Max 50 words" maxlength="200" id="IPFI[1]" name="IPFI[1]"></textarea>

                    <div style="margin-top: 5px;" id="dynamicInput9"></div>
                    <div style="margin-top: 5px;" id="err9"></div>

                    <div class="button" align="right">
                        <input type="button" value="Upload Issue" onclick="return submitIssue();"/>
                        <input type="button" value="Add one more Issue" onClick="return addInput9('dynamicInput9');"></div>
                </span>
            </div>

<%-- 10th Issue   --%>

            <div align="center">
                <span id="issue10" style="display: none;" class="dy">
                    <div><b>Market Access (including Public Procurement Policy) :</b></div>
                    <textarea  rows="3" cols="60" placeholder="Max 50 words" maxlength="200" id="MAC[1]" name="MAC[1]"></textarea>

                    <div style="margin-top: 5px;" id="dynamicInput10"></div>
                    <div style="margin-top: 5px;" id="err10"></div>

                    <div class="button" align="right">
                        <input type="button" value="Upload Issue" onclick="return submitIssue();"/>
                        <input type="button" value="Add one more Issue" onClick="return addInput10('dynamicInput10');"></div>
                </span>
            </div>

<%-- 11th Issue   --%>

            <div align="center">
                <span id="issue11" style="display: none;" class="dy">
                    <div><b>Skills :</b></div>
                    <textarea  rows="3" cols="60" placeholder="Max 50 words" maxlength="200" id="SKILL[1]" name="SKILL[1]"></textarea>

                    <div style="margin-top: 5px;" id="dynamicInput11"></div>
                    <div style="margin-top: 5px;" id="err11"></div>

                    <div class="button" align="right">
                        <input type="button" value="Upload Issue" onclick="return submitIssue();"/>
                        <input type="button" value="Add one more Issue" onClick="return addInput11('dynamicInput11');"></div>
                </span>
            </div>

<%-- 12th Issue   --%>

            <div align="center">
                <span id="issue12" style="display: none;" class="dy">
                    <div><b>Clusters :</b></div>
                    <textarea  rows="3" cols="60" placeholder="Max 50 words" maxlength="200" id="Cluster[1]" name="Cluster[1]"></textarea>

                    <div style="margin-top: 5px;" id="dynamicInput12"></div>
                    <div style="margin-top: 5px;" id="err12"></div>

                    <div class="button" align="right">
                        <input type="button" value="Upload Issue" onclick="return submitIssue();"/>
                        <input type="button" value="Add one more Issue" onClick="return addInput12('dynamicInput12');"></div>
                </span>
            </div>

<%-- 13th Issue   --%>

            <div align="center">
                <span id="issue13" style="display: none;" class="dy">
                    <div><b>Knowledge Services for MSMEs :</b></div>
                    <textarea  rows="3" cols="60" placeholder="Max 50 words" maxlength="200" id="KSMSME[1]" name="KSMSME[1]"></textarea>

                    <div style="margin-top: 5px;" id="dynamicInput13"></div>
                    <div style="margin-top: 5px;" id="err13"></div>

                    <div class="button" align="right">
                        
                        <input type="button" value="Upload Issue" onclick="return submitIssue();"/>
                        <input type="button" value="Add one more Issue" onClick="return addInput13('dynamicInput13');"></div>
                </span>
            </div>

<%-- 14th Issue   --%>

<div align="center">
                <span id="issue14" style="display: none;" class="dy">
                    <div><b>Any other issue :</b>
                    <textarea  rows="3" cols="60" placeholder="Max 50 words" maxlength="200" id="other[1]" name="other[1]"></textarea></div>
                    <div id="errtext"> </div>

                    <div align="center" style="margin-top: 5px;" id="dynamicInput14"></div>
                    <div style="margin-top: 5px;" id="err14"></div>

                    <div class="button" align="right">
                        
                        <input type="button" value="Upload Issue" onclick="return submitIssue();"/>
                        <input type="button" value="Add one more Issue" onClick="return addInput14('dynamicInput14');"></div>
                </span>
            </div>

<%-- 15th Issue   --%>

<div align="center">
                <span id="issue15" style="display: none;" class="dy">
                    <div><b>Innovative Ideas :</b>
                    <textarea  rows="3" cols="60" placeholder="Max 50 words" maxlength="200" id="ideas[1]" name="ideas[1]"></textarea></div>

                    <div align="center" style="margin-top: 5px;" id="dynamicInput15"></div>
                    <div style="margin-top: 5px;" id="err15"></div>

                    <div class="button" align="right">

                        <input type="button" value="Upload Issue" onclick="return submitIssue();"/>
                        <input type="button" value="Add one more Issue" onClick="return addInput15('dynamicInput15');"></div>
                </span>
            </div>

<%-- 16th Issue   --%>

<div align="center">
                <span id="issue16" style="display: none;" class="dy">
                    <div><b>Art-based Enterprise :</b>
                    <textarea  rows="3" cols="60" placeholder="Max 50 words" maxlength="200" id="ABE[1]" name="ABE[1]"></textarea></div>

                    <div align="center" style="margin-top: 5px;" id="dynamicInput16"></div>
                    <div style="margin-top: 5px;" id="err16"></div>

                    <div class="button" align="right">

                        <input type="button" value="Upload Issue" onclick="return submitIssue();"/>
                        <input type="button" value="Add one more Issue" onClick="return addInput16('dynamicInput16');"></div>
                </span>
            </div>

<div id="input"></div>
<div>&nbsp;</div>
<div class="success" id="result"></div>
<div class="fail" id="resulterr"></div>
<input type="submit" value="Final Submit" size="65" onclick="return submitFeedback();"/>

            </form>
  <div>&nbsp;</div>
  <div>&nbsp;</div>

        </div>
</div>
<div class="note" style="width: 100%; height: 220px; background-color:  #dbd0d0 ">
    <span>
        <div style="width: 750px; margin: auto; font-size: 14px;">
            <br/>
            <a style="">  Note:</a><br/><br/>
            1.&nbsp;&nbsp;	Any response would be automatically saved, in draft mode once<b> ‘Upload Issue’</b> button is hit.<br/>
            2.&nbsp;&nbsp;	The responses may be edited before hitting <b>‘Final Submit’</b> button.<br/>
            3.&nbsp;&nbsp;	If a response under any topic is to be edited, the respondent may go to the same topic again.<br/>
            4.&nbsp;&nbsp;	Once<b> ‘Final Submit’</b> button is hit, no editing is possible. <br/>
            5.&nbsp;&nbsp;	One can raise as many issues as one likes, before hitting the<b> ‘Final Submit’</b> button- there is no limit.<br/>
</div>

    </span>
</div>

    </body>
</html>
