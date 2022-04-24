/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

// Bind state and district here

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
 
// bind service type and 2 digit code here

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

// bind 2 digit and 4 digit code here   

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

// bind 4 digit and 5 digit code here  
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
                      
            function SendToTable()
            {
                var state = document.getElementById('state').value;
                var district = document.getElementById('district').value;
                var data1 = document.getElementById('twodogitcode').value;
                var data2 = document.getElementById('fourdogitcode').value;
                var data3 = document.getElementById('fivedogitcode').value;
                
                if(state=="" || state==null)
                    {
                        alert("Please select state first.");
                        return false;
                    }
                    if(district=="" || district==null)
                    {
                        alert("Please select district.");
                        return false;
                    }
                    if(data1=="" || data1==null)
                    {
                        alert("Please select NIC 2 digit code.");
                        return false;
                    }
                    if(data2=="" || data2==null)
                    {
                        alert("Please select NIC 4 digit code.");
                        return false;
                    }
                    if(data3=="" || data3==null)
                    {
                        alert("Please select NIC 5 digit code.");
                        return false;
                    }
                    else
                        {
                            window.location="InsertPlan.jsp?state="+state
                            return true;
                        }
            }
            
            function SelectType()
            {
                var typeOfSelection = myForm.Type.value;
                
                if(typeOfSelection=="" || typeOfSelection==null)
                    {
                        alert('Please select type.');
                        return false;
                    }
            }