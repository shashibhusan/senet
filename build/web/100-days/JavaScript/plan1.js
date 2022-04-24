/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

            function validate(n)
            {
                var data=n.value;
                if(!(data===null || data===''))
                    {
                      // search1000();
                       //  var name=document.getElementById('state').value;
                      //  alert(name +"paya gaya");
                        var url="DataBind.jsp?val="+data;

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
            }
            
           var request;
           function getInfo(){
                   if(request.readyState==4){
                    var val=request.responseText;
                 //   document.getElementById('BeforeSelectField').style.display='none';
                     document.getElementById('district').innerHTML=val;
                    //document.getElementsByClassName("sortable").innerHTML=val;
                        }
                        }
                        
                        
                     function getFourDigitCode(nic2digit)
                     {
                       //  validateError();
                         var code=nic2digit.value;
                         if(!(code==='' || code===null))
                             {
                                 var url="GetFourDigitCode.jsp?nic2digit="+code;
                                 if(window.XMLHttpRequest){
                        request=new XMLHttpRequest();
                        }
                        else if(window.ActiveXObject){
                        request=new ActiveXObject("Microsoft.XMLHTTP");
                        }

                    try
                        {
                        request.onreadystatechange=getInfo4Digit;
                        request.open("GET",url,true);
                        request.send();
                        }
                        catch(e)
                        {
                        alert("Unable to connect to server");
                        }                      

                        }
                      }
                      
                      function getInfo4Digit()
                      {
                          if(request.readyState==4)
                          {
                          var val1=request.responseText;
                          document.getElementById('fourDigitCode').innerHTML=val1;
                          }
                      }
                      
                      function getFiveDigitCode(fourDigit)
                      {
                          var selectedFourDigit=fourDigit.value;
                          if( !(selectedFourDigit==='' || selectedFourDigit===null) )
                              {
                                  
                                 var url="GetFiveDigitCode.jsp?nic4digit="+selectedFourDigit;
                                 if(window.XMLHttpRequest){
                                  request=new XMLHttpRequest();
                                }
                                    else if(window.ActiveXObject){
                                    request=new ActiveXObject("Microsoft.XMLHTTP");
                                }

                    try
                        {
                        request.onreadystatechange=getInfo5Digit;
                        request.open("GET",url,true);
                        request.send();
                        }
                        catch(e)
                        {
                        alert("Unable to connect to server");
                        }                      

                              }
                      }
                      function getInfo5Digit()
                      {
                          if(request.readyState==4)
                          {
                          var val2=request.responseText;
                          document.getElementById('fiveDigitCode').innerHTML=val2;
                          }
                      }
                      
                      function GetTwoDigitCode()
                      {
                          var typeOfSelection = myForm.Type.value;
                          if(!(typeOfSelection==='') || !(typeOfSelection===null))
                              {
                                  
                                  
                                 var url="GetTwoDigitCode.jsp?type="+typeOfSelection;
                                 if(window.XMLHttpRequest){
                                  request=new XMLHttpRequest();
                                }
                                    else if(window.ActiveXObject){
                                    request=new ActiveXObject("Microsoft.XMLHTTP");
                                }

                    try
                        {
                        request.onreadystatechange=getInfo2Digit;
                        request.open("GET",url,true);
                        request.send();
                        }
                        catch(e)
                        {
                        alert("Unable to connect to server");
                        }                      

                              }
                      }
                      
                      function getInfo2Digit()
                      {
                          if(request.readyState==4)
                          {
                          var val3=request.responseText;
                          document.getElementById('twoDigitCode').innerHTML=val3;
                          }
                      }
                      
                      var userDataDigit = [];
                      var sno=1;
                      var i=1;
                      var j=1;
                      var k=1;
                      function SendToTable()
                      { 
                          var data1 = document.getElementById('twodogitcode').value;
                          var data2 = document.getElementById('fourdogitcode').value;
                          var data3 = document.getElementById('fivedogitcode').value;
                          if(!(data1==='' || data1===null) && !(data2==='' || data2===null) && !(data3==='' || data3===null))
                              {
                          if(sno===1)
                              {
                          var datanichead='<tr id="head11"><td id="sno">Sno</td><td id="divHead">NIC 2 Digit</td><td id="divHead">NIC 4 Digit</td><td id="divHead">NIC 5 Digit</td><td id="sno">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>';
                          userDataDigit.push(datanichead);
                                var mainData='<tr><td>'+sno+'</td><td id="nic2digit['+i+']">'+data1+'</td><td id="nic2digit['+i+']">'+data2+'</td><td id="nic2digit['+i+']">'+data3+'</td><td><button type="button" onclick="SomeDeleteRowFunction(this)"><img src="error.png" height="20" width="20"></img></button></td></tr>';
                                sno=sno+1;
                                i=i+1;
                                userDataDigit.push(mainData);
                                var selecteddataniccode=userDataDigit.join("");
                                document.getElementById('nicData').innerHTML=selecteddataniccode;
                                document.getElementById('finalDiv').style.display='block';
                              }else
                              {
                                 var dataF=data1+data2+data3;
                                 var table1=document.getElementById('nicData');
                                 var nn, mm;
                                 var iFlag=0;
                                 for( nn=1; nn<table1.rows.length; nn++)
                                    {
                                        var raghav1="";
                                        
                                        for( mm =1; mm < 4; mm++)
                                            {
                                                raghav1=raghav1 +table1.rows[nn].cells[mm].innerHTML;
                                                
                                            }
                                            
                                          var n=dataF.localeCompare(raghav1);
                                          //alert('Camparision is='+n);
                                          if(n==0)
                                              {
                                                iFlag=1;
                                                
                                               }
                                    }
                                    if(iFlag!==1)
                                        {
                                            var mainData='<tr><td>'+sno+'</td><td id="nic2digit['+i+']">'+data1+'</td><td id="nic2digit['+i+']">'+data2+'</td><td id="nic2digit['+i+']">'+data3+'</td><td><button type="button" onclick="SomeDeleteRowFunction(this)"><img src="error.png" height="20" width="20"></img></button></td></tr>';
                                            sno=sno+1;
                                            i=i+1;i
                                            userDataDigit.push(mainData);
                                            var selecteddataniccode=userDataDigit.join("");
                                            document.getElementById('nicData').innerHTML=selecteddataniccode;
                                            document.getElementById('finalDiv').style.display='block';
                                            return true;
                                        }else
                                            {
                                                alert('this is already selected , select different');
                                            }
                              }
                      }else
                          {
                              alert('Please select code first.');
                              return false;
                          }
                      }
                      
                      function resetForm()
                      {
                        document.getElementById('nicData').innerHTML='';
                        document.getElementById('twoDigitCode').reset();
                        myForm.reset();
                        document.getElementById('finalDiv').style.display='none';
                        userDataDigit = [];
                        sno=1;
                      }
                      
                      function FinalReset()
                      {
                        userDataDigit = [];
                        document.getElementById('nicData').innerHTML='';
                        document.getElementById('twoDigitCode').reset();
                        myForm.reset();
                        document.getElementById('finalDiv').innerHTML='';
                        sno=1;
                        
                      }
                      
                     
//                      function TestSubmitDataSQL()
//                      {
//                         var table=document.getElementById('nicData');
//                         var raghav='', nn, mm;
//                         for( nn=1; nn<table.rows.length; nn++)
//                             {
//                                 for( mm =1; mm < 4; mm++)
//                                     {
//                                        raghav=raghav +' '+table.rows[nn].cells[mm].innerHTML;
//                                     }
//                             }
//                             alert(raghav);
//                      }
//                      
//                      
                      function SubmitDataSQL()
                      { 
                          var state = document.getElementById('state').value;
                          var district = document.getElementById('district').value;
                          if( state==='' || state===null)
                              {
                                  alert('Please Select state');
                                  return false;
                              }
                              if(district==='' || district===null)
                                  {
                                      alert('Please Select district');
                                      return false;
                                  }else
                                      {
                                          window.location="InsertPlan.jsp?state="+state
                                        //  document.myForms[0].action="InsertPlan.jsp";
                                        //  document.forms[0].action = "InsertPlan.jsp"
                                          return true;
                                      }
                      }
                      
                        function SomeDeleteRowFunction(o) {
                         //no clue what to put here?
                         var p=o.parentNode.parentNode;
                             p.parentNode.removeChild(p);
                        }
                        
//                        function addData()
//                        {
//                            var state = document.getElementById("state").value;
//                            var district = document.getElementById("district").value;
//                            if(state==="" || state===null)
//                                {
//                                    alert("Please select state.");
//                                    return false;
//                                }
//                            if( district==="" || district===null)
//                                {
//                                    alert("Please select District.");
//                                    return false;
//                                }
//                        }


//function addDatassssssssss()
//{
//   if(document.getElementById("state").value==='' || document.getElementById("state").value===null)
//       {
//           
//           return false;
//       }
//       if(document.getElementById("district").value==='' || document.getElementById("district").value===null)
//           {
//               alert('Please select districy==');
//               return false;
//           }
//}


function SendToDataBase()
{
    alert('working');
}