<%-- 
    Document   : dropdown
    Created on : Dec 17, 2017, 11:35:32 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>dropdown</title>
        <script type="text/javascript" src="jquery-1.11.3.js"></script>
        <script>

            var scheme=[];
            function getXMLHttpRequest() {
                var xmlHttpReq = false;
                // to create XMLHttpRequest object in non-Microsoft browsers
                if (window.XMLHttpRequest) {
                    xmlHttpReq = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    try {
                        // to create XMLHttpRequest object in later versions
                        // of Internet Explorer
                        xmlHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
                    } catch (exp1) {
                        try {
                            // to create XMLHttpRequest object in older versions
                            // of Internet Explorer
                            xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                        } catch (exp2) {
                            xmlHttpReq = false;
                        }
                    }
                }
                return xmlHttpReq;
            }

            function makeRequest() {

                var year=document.getElementById("one").value;

                if(!(year==null || year==""))
                {
alert("=============");
                    var xmlHttpRequest = getXMLHttpRequest();
                    xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest);
                    xmlHttpRequest.open("POST", "newAction.do?branch="+year, true);
                    xmlHttpRequest.setRequestHeader("Content-Type",
                    "application/x-www-form-urlencoded");
                    xmlHttpRequest.send(null);
                }
            }

                        function getReadyStateHandler(xmlHttpRequest) {


                return function() {
                    if (xmlHttpRequest.readyState == 4) {
                        if (xmlHttpRequest.status == 200)
                        {
                            alert("===xmlHttpRequest===="+xmlHttpRequest);
                          //  var dom=(new DOMParser()).parseFromString(xmlHttpRequest.responseText,"text/xml");
                          //  scheme=(dom.getElementsByTagName("sanction")).childNodes[0].nodeValue;
                          // document.getElementById("two").innerHTML=scheme;
                           }
                        else {
                            alert("HTTP error " + xmlHttpRequest.status + ": " + xmlHttpRequest.statusText);
                        }
                    }
                };
            }


        </script>
    </head>
    <body>
        <table>
            <tr>
                <td>
                    drop 1 <select id="one" onchange="makeRequest()">
                        <option>select</option>
                        <option value="di">di</option>
                        <option value="branch">branch</option>
                        <option value="tc">tc</option>
                        <option value="ts">ts</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="two">
                        drop 2: <select id="drop2">

                                </select>
                    </div>
                </td>
            </tr>
        </table>
    </body>
</html>
