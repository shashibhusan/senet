/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function myFunction() {
    document.getElementById("myForm").reset();
    document.getElementById("msg").innerHTML="";
    document.getElementById("error").innerHTML="";

}

function postComment()
{
   var instname=document.myform.inst.value;
   if(!instname=='' || !instname==null)
       {
         document.getElementById("error").innerHTML="";
         dataOnInst();
       }else
       {
            document.getElementById("error").innerHTML = "*Please select any Institute";
       }
  
}

var request;
function dataOnInst()
{
var instname=document.myform.inst.value;
var url="empatinst.jsp?val="+instname;

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
