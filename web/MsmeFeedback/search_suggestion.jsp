<%-- 
    Document   : search_suggestion
    Created on : Jun 20, 2018, 10:54:19 AM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="shortcut icon" href="fevicon.png" type="image/x-icon">
        <title>Search</title>
        <style>
input[type=text] {
    width: 250px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
    background-image: url('searchicon.jpg');
    background-position: 10px 10px;
    background-repeat: no-repeat;
    padding: 12px 20px 12px 40px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}

input[type=text]:focus {
    width: 60%;
}
input[type=button] {

    padding: 8px;
    margin: 4px 0;
    cursor: pointer;
    width: 100px;

}
b,.head{
                padding: 5px;
}
body{
                font-family: Verdana, Geneva, sans-serif;
}
h2{margin: 5px;}
#feed{
    padding: 10px;
    font-size: 25px;
    color:  #239b56 ;
}
.dy{
    padding-left: 10px;
    padding: 3px;}
@media print
{
body {

       line-height: 1.1;


   }
    .hide,.div,input[type=button]
    {
        display: none !important;
    }
}
table,tr.td{
    border-collapse: collapse;
}
</style>
        <script>
var request;
function searchinfo()
{
var search_data=document.myform.search.value;
var url="getSearch.jsp?val="+search_data;

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
document.getElementById('result').innerHTML=val;
}
}
           
            </script>
    </head>
       <div class="hide" style="font-size: 14px;font-family:Verdana;font-weight:bold; background:#ff903a; padding-top: 5px; padding-bottom: 5px; " align="center">Government of India, Ministry of MSME </div>
       <div class="hide" style="font-size: 14px;font-family:Verdana;font-weight:bold; background:  white; padding-top: 5px; padding-bottom: 5px; " align="center"><font color="#990000"></font>O/o  DC-MSME </div>
       <div class="hide" style="font-size: 14px;font-family:Verdana;font-weight:bold; background:#64bb64; padding-top: 5px; padding-bottom: 5px; " align="center" ><font color="#990000">MSME RELATED ISSUE </font>
         </div>
    <body>
        <div align="center" style="width: 950px; margin: auto;">
            <div class="div" style="margin-top: 25px;">
                <form name="myform" method="post">
       <input type="text" id="search" name="search" placeholder="Search.."><br/>
       <input type="button" align="right"  value="Search" onclick="return searchinfo();"/>
</form>
                </div>
            <table align="center" width="700px;" border="1" id="result"></table>
        </div>
    </body>
</html>
