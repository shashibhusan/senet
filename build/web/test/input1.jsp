<%-- 
    Document   : input1
    Created on : Jun 16, 2018, 8:42:51 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="shortcut icon" href="fevicon.png" type="image/x-icon">

        <script>
            var counter16 = 2;
var limit16=100;
function showdiv(divName)

{
  //  alert('=======working=============');
 if (counter16 == limit16)  {

           //   alert("You have reached the limit of adding " + counter14+ " inputs");
           //document.getElementById('input').innerHTML="you have reached max limit of "+(counter16-1)+ " issues ";
           alert("max limit");

         }else
             {

           var name = document.getElementById("test["+(counter16-1)+"]").value;

           if (name=="" || name==null){
                  document.getElementById("err16").innerHTML="Please type in above field first"
                    return false;
             }else
                 {

                 document.getElementById("err16").innerHTML="";

              var newdiv16 = document.createElement('tr');


              newdiv16.innerHTML = "<input type='text' name='test["+counter16+"]' id='test["+counter16+"]' rows='3' cols='60' placeholder='Max 50 words' maxlength='200'/>\n\
<input type='button' id='delete' value='X' onclick='return deleteBox(this);'>";


              document.getElementById(divName).appendChild(newdiv16);


              counter16++;
                 }

      }
}

function submitData()
{
   
    var tcname= [];
    var url="";
                 var data="";
                 var i=1;
                 for(i=1; i<=(counter16-1); i++)
                     {
                         data=document.getElementById('test['+i+']').value;
                         tcname.push(data);
                     }
                   //  alert(tcname);
var counter=(counter16-1);

                     url="testIssue.jsp?val="+tcname+"&counter="+counter;
if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=getInfo;
request.open("POST",url,true);
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
 function deleteBox(i)
 {
     document.getElementById("test['+i+']").deleteRow(0);
 }
        </script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <tr>
                <td>
                    Dynamic created input field
                </td>

            </tr>
            <tr><td>&nbsp;</td></tr>

            <tr>
                <td>
            <input type="text" name="test[1]" id="test[1]" /><input type='button' id='delete' value='X' onclick='return deleteBox(this);'>
            </td>
            </tr>
            <tr id="dynamicInput"></tr>
            <tr id="err16"></tr>
            <tr>
                <td>
                    <input type="button" value="add" onclick="return showdiv('dynamicInput');">
                    <input type="button" value="submit" onclick="return submitData();">
                </td>
            </tr>

            <tr id="result">

            </tr>
        </table>
    </body>
</html>
