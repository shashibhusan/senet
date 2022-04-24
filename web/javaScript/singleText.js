/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function postPref(){
alert("functiom is working");
}

//mainn from here


function myFunction() {
    document.getElementById("myForm").reset();
    document.getElementById("msg").innerHTML="";
    document.getElementById("error").innerHTML="";
    
}

function postComment()
{
   var name=document.myform.data.value;
   var desig=document.myform.data1.value;
   var discip=document.myform.data2.value;
   var inst=document.myform.data3.value;

      if(!name=='' && desig=='' && discip=='' && inst=='')
       {
         //  alert("case 1");//1000
         document.getElementById("error").innerHTML="";
         search1000();
       }
       else if(name=='' && !desig=='' && discip=='' && inst=='')
       {
          // alert("case 2");//0100
           document.getElementById("error").innerHTML="";
           search0100();
       }
       else if(name=='' && desig=='' && !discip=='' && inst=='')
       {
         //  alert("case 3");//0010
           document.getElementById("error").innerHTML="";
           search0010();
       }
       else if(name=='' && desig=='' && discip=='' && !inst=='')
       {
           //alert("case 4");//0001
           document.getElementById("error").innerHTML="";
           search0001();
       }
       else if(!name=='' && !desig=='' && discip=='' && inst=='')
       {
          // alert("case 5");//1100
           document.getElementById("error").innerHTML="";
           search1100();
       }
       else if(!name=='' && desig=='' && !discip=='' && inst=='')
       {
           //alert("case 6");//1010
           document.getElementById("error").innerHTML="";
           search1010();
       }
       else if(!name=='' && desig=='' && discip=='' && !inst=='')
       {
           //alert("case 7");//1001
           document.getElementById("error").innerHTML="";
           search1001();
       }
       else if(name=='' && !desig=='' && !discip=='' && inst=='')
       {
          // alert("case 8");//0110
           document.getElementById("error").innerHTML="";
           search0110();
       }
       else if(name=='' && !desig=='' && discip=='' && !inst=='')
       {
           //alert("case 9");//0101
           document.getElementById("error").innerHTML="";
           search0101();
       }
       else if(name=='' && desig=='' && !discip=='' && !inst=='')
       {
          // alert("case 10");//0011
           document.getElementById("error").innerHTML="";
           search0011();
       }
        else if(!name=='' && !desig=='' && discip=='' && !inst=='')
       {
          // alert("case 11");//1101
           document.getElementById("error").innerHTML="";
           search1101();
       }
       else if(name=='' && !desig=='' && !discip=='' && !inst=='')
       {
          // alert("case 12");//0111
           document.getElementById("error").innerHTML="";
           search0111();
       }
       else if(!name=='' && desig=='' && !discip=='' && !inst=='')
       {
           //alert("case 13");//1011
           document.getElementById("error").innerHTML="";
           search1011();
       }
        else if(!name=='' && !desig=='' && !discip=='' && inst=='')
       {
           //alert("case 14");//1110
            document.getElementById("error").innerHTML="";
            search1110();
       }
       else if(!name=='' && !desig=='' && !discip=='' && !inst=='')
       {
           //alert("case 15");//1111
           document.getElementById("error").innerHTML="";
           search1111();
       }
       else{
          document.getElementById("error").innerHTML = "*Please type something to search";
       }
}


var request;


function search1000()
{
var name=document.myform.data.value;
var url="case1000.jsp?val="+name;

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


function search0100()
{
var desig=document.myform.data1.value;
var url="case0100.jsp?val="+desig;

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

function search0010()
{
var discip=document.myform.data2.value;
var url="case0010.jsp?val="+discip;
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

function search0001()
{
var inst=document.myform.data3.value;
var url="case0001.jsp?val="+inst;


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

function search1100()
{
var name=document.myform.data.value;
var desig=document.myform.data1.value;
var url="case1100.jsp?val="+name+"&val1="+desig;


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

function search1010()
{
var name=document.myform.data.value;
var disci=document.myform.data2.value;
var url="case1010.jsp?val="+name+"&val1="+disci;


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

function search1001()
{
var name=document.myform.data.value;
var inst=document.myform.data3.value;
var url="case1001.jsp?val="+name+"&val1="+inst;


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


function search0110()
{
var desig=document.myform.data1.value;
var disci=document.myform.data2.value;
var url="case0110.jsp?val="+desig+"&val1="+disci;


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

function search0101()
{
var desig=document.myform.data1.value;
var inst=document.myform.data3.value;
var url="case0101.jsp?val="+desig+"&val1="+inst;


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


function search0011()
{
var disci=document.myform.data2.value;
var inst=document.myform.data3.value;
var url="case0011.jsp?val="+disci+"&val1="+inst;


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

function search1101()
{
var name=document.myform.data.value;
var desig=document.myform.data1.value;
var inst=document.myform.data3.value;
var url="case1101.jsp?val="+name+"&val1="+desig+"&val2="+inst;


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


function search0111()
{
var desig=document.myform.data1.value;
var disci=document.myform.data2.value;
var inst=document.myform.data3.value;
var url="case0111.jsp?val="+desig+"&val1="+disci+"&val2="+inst;


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


function search1011()
{
var name=document.myform.data.value;
var disci=document.myform.data2.value;
var inst=document.myform.data3.value;
var url="case1011.jsp?val="+name+"&val1="+disci+"&val2="+inst;


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

function search1110()
{
var name=document.myform.data.value;
var desig=document.myform.data1.value;
var disci=document.myform.data2.value;
var url="case1110.jsp?val="+name+"&val1="+desig+"&val2="+disci;


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

function search1111()
{
var name=document.myform.data.value;
var desig=document.myform.data1.value;
var disci=document.myform.data2.value;
var inst=document.myform.data3.value;
var url="case1111.jsp?val="+name+"&val1="+desig+"&val2="+disci+"&val3="+inst;


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
if(val!="" || val!=null)
    {
        var element = document.getElementById("msg");
        element.classList.add("mainDT");
        document.getElementById('msg').innerHTML=val;
    }
}
}

