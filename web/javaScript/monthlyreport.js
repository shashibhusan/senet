/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

//function myFunction() {
//    document.getElementById("myForm").reset();
//    document.getElementById("msg").innerHTML="";
//    document.getElementById("error").innerHTML="";
//    
//}

function Check()
{
   var year=document.monthlyReportForm.yearSelected.value;
   var month=document.monthlyReportForm.monthSelected.value;
   
   
   if((year==="" || year===null) && (month==="" || month===null))
       {
          document.getElementById('error').innerHTML='Please select Year and month';
          return false;
       }
       else if(month==="" || month===null)
           {
            document.getElementById('error').innerHTML='Please select Month';
            return false;
           }
            else if(year==="" || year===null)
            {
                document.getElementById('error').innerHTML='Please select Year ';
                return false;
            }
           else
                {
                    getRecord();
                    document.getElementById("error").innerHTML="";
                }
}

var request;

function getRecord()
{
    var year=document.monthlyReportForm.yearSelected.value;
    var month=document.monthlyReportForm.monthSelected.value;
    
    
    var url="senetMonthlyReport.jsp?sYear="+year+"&sMonth="+month; 
    
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


function getInfo()
{
    if(request.readyState===4)
    {
        var val=request.responseText;
        
        document.getElementById('dataIn').innerHTML=val;
    }
}