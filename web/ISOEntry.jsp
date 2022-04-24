<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>

<script type="text/javascript" src="jquery-1.11.3.js"></script>
<script>
	$(function() {
	var d = new Date(),

    n = d.getMonth(),

  k = d.getFullYear();
    var m=(n-3);
var x=k+1;
  var	y=k+("-")+x;
$('#cmbYear option[value="'+y+'"]').prop('selected', true);
	});
</script>


        <link href="inb.css" rel="stylesheet" type="text/css"></link>
        <script>
            var g5=0; var g6=0; var g7=0;
            var s5=0; var s6=0; var s7=0;
            var t5=0; var t6=0; var t7=0;
            var w5=0; var w6=0; var w7=0;
            var tt2=0; var tt3=0; var tt4=0; var tt5=0; var tt6=0; var tt7=0;
            var balance1=0;var balance2=0;var balance3=0;
            var general=[];
            var scsp=[];
            var tsp=[];
            var women=[];
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
            /*
             * AJAX call starts with this function
             */
            function makeRequest() {

                var year=document.getElementById("cmbYear").value;
                var month=document.getElementById("cmbMonth").value;
                var msme=document.getElementById("institute").value;
                
                if(!(year==null || year=="")&&(month>0))
                {
                   // alert("hi howggggggggg are u");
                   if(month>12)
                       {
                           year=1000;
                           
                       }
                    var xmlHttpRequest = getXMLHttpRequest();
                    xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest);
                    xmlHttpRequest.open("POST", "HelloWorld.do?institute="+msme+"&cmbMonth="+month+"&cmbYear="+year, true);
                    xmlHttpRequest.setRequestHeader("Content-Type",
                    "application/x-www-form-urlencoded");
                    xmlHttpRequest.send(null);
                }
            }

            /*
             * Returns a function that waits for the state change in XMLHttpRequest
             */
            function getReadyStateHandler(xmlHttpRequest) {

                // an anonymous function returned
                // it listens to the XMLHttpRequest instance
                return function() {
                    if (xmlHttpRequest.readyState == 4) {
                        if (xmlHttpRequest.status == 200) {
                           
                            var dom=(new DOMParser()).parseFromString(xmlHttpRequest.responseText,"text/xml");

                            for(var i=0;i<3;i++)
                            {
                                scheme[i]=(dom.getElementsByTagName("sanction"))[i].childNodes[0].nodeValue;
                            }
                            document.getElementById("ge1").value=scheme[0];
                            document.getElementById("sc1").value=scheme[1];
                            document.getElementById("ts1").value=scheme[2];
                            document.getElementById("tt1").value=parseInt(scheme[0])+parseInt(scheme[1])+parseInt(scheme[2]);
 

                            if(((dom.getElementsByTagName("update"))[0].childNodes[0].nodeValue)=="update")
                            {
                                document.getElementById("add").style.display = "none";
                                document.getElementById("update").style.display = "block";

                            }
                            if(((dom.getElementsByTagName("update"))[0].childNodes[0].nodeValue)=="add")
                            {
                                document.getElementById("update").style.display = "none";
                                document.getElementById("add").style.display = "block";
                            }

                            for(var i=0;i<6;i++)
                            {
                                general[i]=(dom.getElementsByTagName("c1"))[i].childNodes[0].nodeValue;
                            }
                            for(var i=0;i<6;i++)
                            {
                                scsp[i]=(dom.getElementsByTagName("c2"))[i].childNodes[0].nodeValue;
                            }
                            for(var i=0;i<6;i++)
                            {
                                tsp[i]=(dom.getElementsByTagName("c3"))[i].childNodes[0].nodeValue;
                            }
                            for(var i=0;i<6;i++)
                            {
                                women[i]=(dom.getElementsByTagName("c4"))[i].childNodes[0].nodeValue;
                            }




                            var selectedmonth=document.getElementById("cmbMonth").value;
                            if(selectedmonth==1)
                            {
                               
                                document.getElementById("ge2").value=general[0];
                                document.getElementById("ge3").value=general[1];
                                document.getElementById("ge4").value=general[2];
                                document.getElementById("ge5").value=general[0];
                                document.getElementById("ge6").value=general[1];
                                document.getElementById("ge7").value=general[2];

                                document.getElementById("sc2").value=scsp[0];
                                document.getElementById("sc3").value=scsp[1];
                                document.getElementById("sc4").value=scsp[2];
                                document.getElementById("sc5").value=scsp[0];
                                document.getElementById("sc6").value=scsp[1];
                                document.getElementById("sc7").value=scsp[2];

                                document.getElementById("ts2").value=tsp[0];
                                document.getElementById("ts3").value=tsp[1];
                                document.getElementById("ts4").value=tsp[2];
                                document.getElementById("ts5").value=tsp[0];
                                document.getElementById("ts6").value=tsp[1];
                                document.getElementById("ts7").value=tsp[2];

                                document.getElementById("wo2").value=women[0];
                                document.getElementById("wo3").value=women[1];
                                document.getElementById("wo4").value=women[2];
                                document.getElementById("wo5").value=women[0];
                                document.getElementById("wo6").value=women[1];
                                document.getElementById("wo7").value=women[2];

                                tt2=parseInt(general[0])+parseInt(scsp[0])+parseInt(tsp[0])+parseInt(women[0]);
                                document.getElementById("tt2").value=tt2;
                                tt3=parseInt(general[1])+parseInt(scsp[1])+parseInt(tsp[1])+parseInt(women[1]);
                                document.getElementById("tt3").value=tt3;
                                tt4=parseInt(general[2])+parseInt(scsp[2])+parseInt(tsp[2])+parseInt(women[2]);
                                document.getElementById("tt4").value=tt4;
                                tt5=parseInt(general[0])+parseInt(scsp[0])+parseInt(tsp[0])+parseInt(women[0]);
                                document.getElementById("tt5").value=tt5;
                                tt6=parseInt(general[1])+parseInt(scsp[1])+parseInt(tsp[1])+parseInt(women[1]);
                                document.getElementById("tt6").value=tt6;
                                tt7=parseInt(general[2])+parseInt(scsp[2])+parseInt(tsp[2])+parseInt(women[2]);
                                document.getElementById("tt7").value=tt7;
                                balance1= parseInt(scheme[0])-parseInt(general[2]);
                                balance2=parseInt(scheme[1])-parseInt(scsp[2]);
                                balance3=parseInt(scheme[2])-parseInt(tsp[2]);
                                document.getElementById("bal1").value=balance1;
                                document.getElementById("bal2").value=balance2;
                                document.getElementById("bal3").value=balance3;
                                document.getElementById("bal5").value=parseInt(balance1)+parseInt(balance2)+parseInt(balance3);

                            }
                            else
                            {
                                document.getElementById("ge2").value=general[0];
                                document.getElementById("ge3").value=general[1];
                                document.getElementById("ge4").value=general[2];
                                document.getElementById("ge5").value=general[3];
                                g5=general[3];
                                document.getElementById("ge6").value=general[4];
                                g6=general[4];
                                document.getElementById("ge7").value=general[5];
                                g7=general[5];

                                document.getElementById("sc2").value=scsp[0];
                                document.getElementById("sc3").value=scsp[1];
                                document.getElementById("sc4").value=scsp[2];
                                document.getElementById("sc5").value=scsp[3];
                                s5=scsp[3];
                                document.getElementById("sc6").value=scsp[4];
                                s6=scsp[4];
                                document.getElementById("sc7").value=scsp[5];
                                s7=scsp[5];

                                document.getElementById("ts2").value=tsp[0];
                                document.getElementById("ts3").value=tsp[1];
                                document.getElementById("ts4").value=tsp[2];
                                document.getElementById("ts5").value=tsp[3];
                                t5=tsp[3];
                                document.getElementById("ts6").value=tsp[4];
                                t6=tsp[4];
                                document.getElementById("ts7").value=tsp[5];
                                t7=tsp[5];

                                document.getElementById("wo2").value=women[0];
                                document.getElementById("wo3").value=women[1];
                                document.getElementById("wo4").value=women[2];
                                document.getElementById("wo5").value=women[3];
                                w5=women[3];
                                document.getElementById("wo6").value=women[4];
                                w6=women[4];
                                document.getElementById("wo7").value=women[5];
                                w7=women[5];

                                tt2=parseInt(general[0])+parseInt(scsp[0])+parseInt(tsp[0]);
                                document.getElementById("tt2").value=tt2;
                                tt3=parseInt(general[1])+parseInt(scsp[1])+parseInt(tsp[1]);
                                document.getElementById("tt3").value=tt3;
                                tt4=parseInt(general[2])+parseInt(scsp[2])+parseInt(tsp[2]);
                                document.getElementById("tt4").value=tt4;
                                tt5=parseInt(general[3])+parseInt(scsp[3])+parseInt(tsp[3]);
                                document.getElementById("tt5").value=tt5;
                                tt6=parseInt(general[4])+parseInt(scsp[4])+parseInt(tsp[4]);
                                document.getElementById("tt6").value=tt6;
                                tt7=parseInt(general[5])+parseInt(scsp[5])+parseInt(tsp[5]);
                                document.getElementById("tt7").value=tt7;
                                balance1= parseInt(scheme[0])-parseInt(general[5]);
                                balance2=parseInt(scheme[1])-parseInt(scsp[5]);
                                balance3=parseInt(scheme[2])-parseInt(tsp[5]);
                                document.getElementById("bal1").value=balance1;
                                document.getElementById("bal2").value=balance2;
                                document.getElementById("bal3").value=balance3;
                                document.getElementById("bal5").value=parseInt(balance1)+parseInt(balance2)+parseInt(balance3);


                            }
                       
                         
                            //shashi ends



                        }

                        else {
                            alert("HTTP error " + xmlHttpRequest.status + ": " + xmlHttpRequest.statusText);
                        }



                    }
                };
            }


            function AddData()
            {


                var year=document.getElementById("cmbYear").value;
                var month=document.getElementById("cmbMonth").value;
                var msme=document.getElementById("institute").value;

                var ge2=document.getElementById("ge2").value;
                var ge3=document.getElementById("ge3").value;
                var ge4=document.getElementById("ge4").value;

                var sc2=document.getElementById("sc2").value;
                var sc3=document.getElementById("sc3").value;
                var sc4=document.getElementById("sc4").value;

                var ts2=document.getElementById("ts2").value;
                var ts3=document.getElementById("ts3").value;
                var ts4=document.getElementById("ts4").value;

                var wo2=document.getElementById("wo2").value;
                var wo3=document.getElementById("wo3").value;
                var wo4=document.getElementById("wo4").value;

                if((year<0))
                {
                    alert("Please select  Year");
                    return false;
                }
                if((month>12))
                {
                    alert("Please select  Month");
                    return false;
                }
                if((msme<0))
                {
                    alert("Please select  MSME-DIs");

                    return false;
                }
                if(isNaN(ge2)){
                    alert("Please Enter the Numeric Value for No of Application Received ");
                    return false;
                }
                if(isNaN(ge3)){
                    alert("Please Enter the Numeric Value for No of Application processed ");
                    return false;
                }
                if(isNaN(ge4)){
                    alert("Please Enter the Numeric Value for Amount Disbursed ");
                    return false;
                }
                if(isNaN(sc2)){
                    alert("Please Enter the Numeric Value for No of Application Received ");
                    return false;
                }
                if(isNaN(sc3)){
                    alert("Please Enter the Numeric Value for No of Application processed ");
                    return false;
                }
                if(isNaN(sc4)){
                    alert("Please Enter the Numeric Value for Amount Disbursed ");
                    return false;
                }
                if(isNaN(ts2)){
                    alert("Please Enter the Numeric Value for No of Application Received ");
                    return false;
                }
                if(isNaN(ts3)){
                    alert("Please Enter the Numeric Value for No of Application processed ");
                    return false;
                }
                if(isNaN(ts4)){
                    alert("Please Enter the Numeric Value for Amount Disbursed ");
                    return false;
                }if(isNaN(wo2)){
                    alert("Please Enter the Numeric Value for No of Application Received ");
                    return false;
                }
                if(isNaN(wo3)){
                    alert("Please Enter the Numeric Value for No of Application processed ");
                    return false;
                }
                if(isNaN(wo4)){
                    alert("Please Enter the Numeric Value for Amount Disbursed ");
                    return false;
                }


                if (ge2== '') {
                    document.getElementById("ge2").value=0;
                }
                if (ge3== '') {
                    document.getElementById("ge3").value=0;
                }
                if (ge4== '') {
                    document.getElementById("ge4").value=0;
                }
                if (sc2== '') {
                    document.getElementById("sc2").value=0;
                }
                if (sc3== '') {
                    document.getElementById("sc3").value=0;
                }
                if (sc4== '') {
                    document.getElementById("sc4").value=0;
                }
                if (ts2== '') {
                    document.getElementById("ts2").value=0;
                }
                if (ts3== '') {
                    document.getElementById("ts3").value=0;
                }
                if (ts4== '') {
                    document.getElementById("ts4").value=0;
                }
                if (wo2== '') {
                    document.getElementById("wo2").value=0;
                }
                if (wo3== '') {
                    document.getElementById("wo3").value=0;
                }
                if (wo4== '') {
                    document.getElementById("wo4").value=0;
                }
                document.forms[0].action = "ISOAction.do?method=add"
            }
            function Updatedata()
            {
                  
                var ge2=document.getElementById("ge2").value;
                var ge3=document.getElementById("ge3").value;
                var ge4=document.getElementById("ge4").value;

                var sc2=document.getElementById("sc2").value;
                var sc3=document.getElementById("sc3").value;
                var sc4=document.getElementById("sc4").value;

                var ts2=document.getElementById("ts2").value;
                var ts3=document.getElementById("ts3").value;
                var ts4=document.getElementById("ts4").value;

                var wo2=document.getElementById("wo2").value;
                var wo3=document.getElementById("wo3").value;
                var wo4=document.getElementById("wo4").value;

                if (ge2== '') {
                    document.getElementById("ge2").value=0;
                }
                if (ge3== '') {
                    document.getElementById("ge3").value=0;
                }
                if (ge4== '') {
                    document.getElementById("ge4").value=0;
                }
                if (sc2== '') {
                    document.getElementById("sc2").value=0;
                }
                if (sc3== '') {
                    document.getElementById("sc3").value=0;
                }
                if (sc4== '') {
                    document.getElementById("sc4").value=0;
                }
                if (ts2== '') {
                     
                    document.getElementById("ts2").value=0;
                }
                if (ts3== '') {
                    document.getElementById("ts3").value=0;
                }
                if (ts4== '') {
                    document.getElementById("ts4").value=0;
                }
                if (wo2== '') {
                    document.getElementById("wo2").value=0;
                }
                if (wo3== '') {
                    document.getElementById("wo3").value=0;
                }
                if (wo4== '') {
                    document.getElementById("wo4").value=0;
                }
                document.forms[0].action = "ISOAction.do?method=update"

            }

            function sum1()
            {
                var b1=parseInt(document.getElementById("ge2").value);
                var b2=parseInt(document.getElementById("sc2").value);
                var b3=parseInt(document.getElementById("ts2").value);
                var b4=parseInt(document.getElementById("wo2").value);

                
                
                if (!isNaN(b1)) {
                    document.getElementById("ge5").value=((parseInt(b1))-(parseInt(general[0])))+parseInt(g5);
                    document.getElementById("tt2").value=parseInt(b1)+parseInt(b2)+parseInt(b3);
                    var c1=parseInt(document.getElementById("ge5").value);
                    var c2=parseInt(document.getElementById("sc5").value);
                    var c3=parseInt(document.getElementById("ts5").value);
                    var c4=parseInt(document.getElementById("wo5").value);
                    document.getElementById("tt5").value=parseInt(c1)+parseInt(c2)+parseInt(c3);
                }

            }
            function sum2()
            {
                var b1=parseInt(document.getElementById("ge3").value);
                var b2=parseInt(document.getElementById("sc3").value);
                var b3=parseInt(document.getElementById("ts3").value);
                var b4=parseInt(document.getElementById("wo3").value);
 
                if (!isNaN(b1)) {
                    document.getElementById("ge6").value=((parseInt(b1))-(parseInt(general[1])))+parseInt(g6);
                    document.getElementById("tt3").value=parseInt(b1)+parseInt(b2)+parseInt(b3);
                    var c1=parseInt(document.getElementById("ge6").value);
                    var c2=parseInt(document.getElementById("sc6").value);
                    var c3=parseInt(document.getElementById("ts6").value);
                    var c4=parseInt(document.getElementById("wo6").value);
                    document.getElementById("tt6").value=parseInt(c1)+parseInt(c2)+parseInt(c3);
                }
            }
            function sum3()
            {
                var b1=parseInt(document.getElementById("ge4").value);
                var b2=parseInt(document.getElementById("sc4").value);
                var b3=parseInt(document.getElementById("ts4").value);
                var b4=parseInt(document.getElementById("wo4").value);

                


                if (!isNaN(b1)) {
                     document.getElementById("ge7").value=((parseInt(b1))-(parseInt(general[2])))+parseInt(g7);
                    document.getElementById("tt4").value=parseInt(b1)+parseInt(b2)+parseInt(b3);
                    var c1=parseInt(document.getElementById("ge7").value);
                    var c2=parseInt(document.getElementById("sc7").value);
                    var c3=parseInt(document.getElementById("ts7").value);
                    var c4=parseInt(document.getElementById("wo7").value);
                    document.getElementById("tt7").value=parseInt(c1)+parseInt(c2)+parseInt(c3);
                    document.getElementById("bal1").value=parseInt(balance1)-((parseInt(b1))-(parseInt(general[2])));
                    document.getElementById("bal5").value=parseInt(document.getElementById("bal1").value)+parseInt(document.getElementById("bal2").value)+parseInt(document.getElementById("bal3").value);
                }
            }
            function sum4()
            {
                var b1=parseInt(document.getElementById("sc2").value);
                var b2=parseInt(document.getElementById("ge2").value);
                var b3=parseInt(document.getElementById("ts2").value);
                var b4=parseInt(document.getElementById("wo2").value);

               

                if (!isNaN(b1)) {
                    document.getElementById("sc5").value=((parseInt(b1))-(parseInt(scsp[0])))+parseInt(s5);
                    document.getElementById("tt2").value=parseInt(b1)+parseInt(b2)+parseInt(b3) ;
                    var c1=parseInt(document.getElementById("ge5").value);
                    var c2=parseInt(document.getElementById("sc5").value);
                    var c3=parseInt(document.getElementById("ts5").value);
                    var c4=parseInt(document.getElementById("wo5").value);
                    document.getElementById("tt5").value=parseInt(c1)+parseInt(c2)+parseInt(c3);
                }
            }
            function sum5()
            {
                var b1=parseInt(document.getElementById("sc3").value);
                var b2=parseInt(document.getElementById("ge3").value);
                var b3=parseInt(document.getElementById("ts3").value);
                var b4=parseInt(document.getElementById("wo3").value);

               

                if (!isNaN(b1)) {
                    document.getElementById("sc6").value=((parseInt(b1))-(parseInt(scsp[1])))+parseInt(s6);
                    document.getElementById("tt3").value=parseInt(b1)+parseInt(b2)+parseInt(b3);
                    var c1=parseInt(document.getElementById("ge6").value);
                    var c2=parseInt(document.getElementById("sc6").value);
                    var c3=parseInt(document.getElementById("ts6").value);
                    var c4=parseInt(document.getElementById("wo6").value);
                    document.getElementById("tt6").value=parseInt(c1)+parseInt(c2)+parseInt(c3);
                }
            }
            function sum6()
            {
                var b1=parseInt(document.getElementById("sc4").value);
                var b2=parseInt(document.getElementById("ge4").value);
                var b3=parseInt(document.getElementById("ts4").value);
                var b4=parseInt(document.getElementById("wo4").value);

               


                if (!isNaN(b1)) {
                     document.getElementById("sc7").value=((parseInt(b1))-(parseInt(scsp[2])))+parseInt(s7);
                    document.getElementById("tt4").value=parseInt(b1)+parseInt(b2)+parseInt(b3);
                    var c1=parseInt(document.getElementById("ge7").value);
                    var c2=parseInt(document.getElementById("sc7").value);
                    var c3=parseInt(document.getElementById("ts7").value);
                    var c4=parseInt(document.getElementById("wo7").value);
                    document.getElementById("tt7").value=parseInt(c1)+parseInt(c2)+parseInt(c3);
                    document.getElementById("bal2").value=parseInt(balance2)-((parseInt(b1))-(parseInt(scsp[2])));
                    document.getElementById("bal5").value=parseInt(document.getElementById("bal1").value)+parseInt(document.getElementById("bal2").value)+parseInt(document.getElementById("bal3").value);
                }
            }
            function sum7()
            {
                var b1=parseInt(document.getElementById("ts2").value);
                var b2=parseInt(document.getElementById("ge2").value);
                var b3=parseInt(document.getElementById("sc2").value);
                var b4=parseInt(document.getElementById("wo2").value);

                

                if (!isNaN(b1)) {
                    document.getElementById("ts5").value=((parseInt(b1))-(parseInt(scsp[0])))+parseInt(t5);
                    document.getElementById("tt2").value=parseInt(b1)+parseInt(b2)+parseInt(b3);
                    var c1=parseInt(document.getElementById("ge5").value);
                    var c2=parseInt(document.getElementById("sc5").value);
                    var c3=parseInt(document.getElementById("ts5").value);
                    var c4=parseInt(document.getElementById("wo5").value);
                    document.getElementById("tt5").value=parseInt(c1)+parseInt(c2)+parseInt(c3);
                }
            }
            function sum8()
            {
                var b1=parseInt(document.getElementById("ts3").value);
                var b2=parseInt(document.getElementById("ge3").value);
                var b3=parseInt(document.getElementById("sc3").value);
                var b4=parseInt(document.getElementById("wo3").value);

               

                if (!isNaN(b1)) {
                      document.getElementById("ts6").value=((parseInt(b1))-(parseInt(scsp[1])))+parseInt(t6);
                    document.getElementById("tt3").value=parseInt(b1)+parseInt(b2)+parseInt(b3);
                    var c1=parseInt(document.getElementById("ge6").value);
                    var c2=parseInt(document.getElementById("sc6").value);
                    var c3=parseInt(document.getElementById("ts6").value);
                    var c4=parseInt(document.getElementById("wo6").value);
                    document.getElementById("tt6").value=parseInt(c1)+parseInt(c2)+parseInt(c3);
                }
            }
            function sum9()
            {
                var b1=parseInt(document.getElementById("ts4").value);
                var b2=parseInt(document.getElementById("ge4").value);
                var b3=parseInt(document.getElementById("sc4").value);
                var b4=parseInt(document.getElementById("wo4").value);

               


                if (!isNaN(b1)) {
                     document.getElementById("ts7").value=((parseInt(b1))-(parseInt(scsp[2])))+parseInt(t7);
                    document.getElementById("tt4").value=parseInt(b1)+parseInt(b2)+parseInt(b3);
                    var c1=parseInt(document.getElementById("ge7").value);
                    var c2=parseInt(document.getElementById("sc7").value);
                    var c3=parseInt(document.getElementById("ts7").value);
                    var c4=parseInt(document.getElementById("wo7").value);
                    document.getElementById("tt7").value=parseInt(c1)+parseInt(c2)+parseInt(c3);
                    document.getElementById("bal3").value=parseInt(balance3)-((parseInt(b1))-(parseInt(scsp[2])))
                     document.getElementById("bal5").value=parseInt(document.getElementById("bal1").value)+parseInt(document.getElementById("bal2").value)+parseInt(document.getElementById("bal3").value);
                }
            }
            function sum10()
            {
                var b1=parseInt(document.getElementById("wo2").value);
                var b2=parseInt(document.getElementById("ge2").value);
                var b3=parseInt(document.getElementById("sc2").value);
                var b4=parseInt(document.getElementById("ts2").value);

               

                if (!isNaN(b1)) {
                    document.getElementById("wo5").value=((parseInt(b1))-(parseInt(scsp[0])))+parseInt(w5);
                    document.getElementById("tt2").value=parseInt(b2)+parseInt(b3)+parseInt(b4);
                    var c1=parseInt(document.getElementById("ge5").value);
                    var c2=parseInt(document.getElementById("sc5").value);
                    var c3=parseInt(document.getElementById("ts5").value);
                    var c4=parseInt(document.getElementById("wo5").value);
                    document.getElementById("tt5").value=parseInt(c1)+parseInt(c2)+parseInt(c3);
                }
            }
            function sum11()
            {
                var b1=parseInt(document.getElementById("wo3").value);
                var b2=parseInt(document.getElementById("ge3").value);
                var b3=parseInt(document.getElementById("sc3").value);
                var b4=parseInt(document.getElementById("ts3").value);


              

                if (!isNaN(b1)) {
                    document.getElementById("wo6").value=((parseInt(b1))-(parseInt(scsp[1])))+parseInt(w6);
                    document.getElementById("tt3").value=parseInt(b2)+parseInt(b3)+parseInt(b4);
                    var c1=parseInt(document.getElementById("ge6").value);
                    var c2=parseInt(document.getElementById("sc6").value);
                    var c3=parseInt(document.getElementById("ts6").value);
                    var c4=parseInt(document.getElementById("wo6").value);
                    document.getElementById("tt6").value=parseInt(c1)+parseInt(c2)+parseInt(c3);
                }
            }
            function sum12()
            {
                var b1=parseInt(document.getElementById("wo4").value);
                var b2=parseInt(document.getElementById("ge4").value);
                var b3=parseInt(document.getElementById("sc4").value);
                var b4=parseInt(document.getElementById("ts4").value);


               

                if (!isNaN(b1)) {
                    document.getElementById("wo7").value=((parseInt(b1))-(parseInt(scsp[2])))+parseInt(w7);
                    document.getElementById("tt4").value=parseInt(b2)+parseInt(b3)+parseInt(b4);
                    var c1=parseInt(document.getElementById("ge7").value);
                    var c2=parseInt(document.getElementById("sc7").value);
                    var c3=parseInt(document.getElementById("ts7").value);
                    var c4=parseInt(document.getElementById("wo7").value);
                    document.getElementById("tt7").value=parseInt(c1)+parseInt(c2)+parseInt(c3);
                }
            }
 
        </script>
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
    <body bgcolor="#FBFBFB">
        <form name="fname" method="post" action=" ">

            <br/>

            <div style="font-size:large;font-family:Verdana;font-weight:bold" align="center"><font color="#990000"> <%= institute_name%></font></div>
            <% if (!(instId.equals("I70"))) {%>
            <input type="hidden" name="institute" id="institute" value=<%= instId%> />
            <% }%>
            <div style="font-size:large;font-family:Verdana;font-weight:bold;  " align="center" ><font color="#990000">Certification Reimbursement Scheme</font></div>

            <table  align="center"   width="47%" bordercolordark="#990000">


                <tr>
                    <% if ("I70".equals(instId)) {
                    %>
                    <td width="26%" height="48"><font color="#990000">MSME-DIs</font></td>
                    <td>
                        <select name="institute" id="institute" style="width: 120px" onchange="makeRequest()" >
                            <option value="-1">- - - Select - - -</option>

                            <%

                                 Connection conn = null;


                                 int sumcount = 0;
                                 Statement st;
                                 try {
                                     conn = ConnectionManager.getConnectionDirectForMySQL();
                                     if (conn != null) {
                                         Statement stmt = conn.createStatement();
                                         String userSql = null;
                                         if (role.equalsIgnoreCase("SU")) {
                                             userSql = "select INST_ID,INST_NAME,ID from tbl_di_institute order by INST_NAME ";
                                             System.out.println(userSql);
                                         }


                                         ResultSet resultSet = stmt.executeQuery(userSql);
                                         while (resultSet.next()) {
                            %>
                            <option value='<%=resultSet.getString("INST_ID")%>'><%=resultSet.getString("INST_NAME")%></option>
                            <%}
                                     }
                                 } catch (SQLException e) {
                                     System.out.println(e.getErrorCode() + " = " + e.getMessage());
                                 } catch (Exception e) {
                                     System.out.println(e.getMessage());
                                 }

                            %>
                        </select></td>
                        <%
                                    }
                        %>
                    <td width="26%" height="48"><font color="#990000">Year</font></td>
                    <td width="30%">
                        <select name="cmbYear" id="cmbYear" style="width: 120px" onchange="makeRequest()">
                            <option value="2011-2012">2011-2012</option>
<option value="2012-2013">2012-2013</option>
<option value="2013-2014">2013-2014</option>
<option value="2014-2015">2014-2015</option>
<option value="2015-2016">2015-2016</option>
<option value="2016-2017">2016-2017</option>
<option value="2017-2018">2017-2018</option>
<option value="2018-2019">2018-2019</option>
<option value="2019-2020">2019-2020</option>
<option value="2020-2021">2020-2021</option>
                        </select></td>
                    <td width="16%">
                        <font color="#990000">Month</font></td>
                    <td width="28%">
                        <select name="cmbMonth" id="cmbMonth" style="width:120px" onchange="makeRequest()">
                            <option value="13">Select month</option>
                            <option value="1">April</option>
                            <option value="2">May</option>
                            <option value="3">June</option>
                            <option value="4">July</option>
                            <option value="5">August</option>
                            <option value="6">September</option>
                            <option value="7">October</option>
                            <option value="8">November</option>
                            <option value="9">December</option>
                            <option value="10">January</option>
                            <option value="11">February</option>
                            <option value="12">March</option>
                        </select>
                    </td>
                </tr>

                <table width="70%" border="0" align="center">


                    <tr>
                        <td width="50" rowspan="2" class="tableheader">Name Of Program </td>
                        <td width="50" rowspan="2" class="tableheader">&nbsp;&nbsp;&nbsp;&nbsp;Amount Sanctioned</td>
                        <td colspan="3"  align="center" class="tableheader">Durring The Month </td>
                        <td colspan="3"  align="center" class="tableheader">Cumulative Value  </td>
                        <td width="50" rowspan="2" class="tableheader">&nbsp;&nbsp;&nbsp;&nbsp;Balance Amount</td>
                    </tr>
                    <tr>

                        <td  align="center" class="tableheader">No of Application Received </td>
                        <td  align="center" class="tableheader">No of Application processed </td>
                        <td align="center" class="tableheader">Amount Disbursed </td>
                        <td  align="center" class="tableheader">No of Application Received </td>
                        <td  align="center" class="tableheader">No of Application processed </td>
                        <td align="center" class="tableheader">Amount Disbursed </td>
                    </tr>


                    <tr >
                        <td class="tablecontent11" >&nbsp;&nbsp;GENERAL&nbsp;&nbsp;</td>
                        <input type="hidden" name="program1" value="GENERAL"/>
                        <td class="tablecontent1"><input type="text" style="width: 80px" name="g1" id="ge1" value="0" size="4" readonly /></td>
                        <td class="tablecontent1"><input type="text"  style="width: 80px"   name="g2" id="ge2" value="0" size="4"  onkeyup="sum1()" /></td>
                        <td class="tablecontent1"><input type="text" style="width: 80px"   name="g3" id="ge3" value="0" size="4" onkeyup="sum2()"/></td>
                        <td class="tablecontent1"><input type="text" style="width: 80px" name="g4"   id="ge4" value="0" size="4" onkeyup="sum3()"/></td>
                        <td class="tablecontent1"><input type="text" style="width: 80px" name="g5"   id="ge5" value="0" size="4" readonly /></td>
                        <td class="tablecontent1"><input type="text"  style="width: 80px" name="g6"  id="ge6" value="0" size="4" readonly /></td>
                        <td class="tablecontent1"><input type="text"  style="width: 80px" name="g7" id="ge7"   value="0" size="4" readonly /></td>
                        <td class="tablecontent1"><input type="text" style="width: 80px" name="bal1" id="bal1" value="0" size="4" readonly /></td>
                    </tr>


                    <tr>
                        <td class="tablecontent11" >&nbsp;&nbsp;SCSP&nbsp;&nbsp;</td>
                        <input type="hidden" name="program2" value="SCSP"/>
                        <td class="tablecontent1"><input type="text" style="width: 80px" name="s1" id="sc1" value="0" size="4" readonly /></td>
                        <td class="tablecontent1"><input type="text"  style="width: 80px"   name="s2" id="sc2" value="0" size="4" onkeyup="sum4()"/></td>
                        <td class="tablecontent1"><input type="text" style="width: 80px"   name="s3" id="sc3" value="0" size="4" onkeyup="sum5()"/></td>
                        <td class="tablecontent1"><input type="text" style="width: 80px" name="s4"   id="sc4" value="0" size="4" onkeyup="sum6()"/></td>
                        <td class="tablecontent1"><input type="text" style="width: 80px" name="s5"   id="sc5" value="0" size="4" readonly/></td>
                        <td class="tablecontent1"><input type="text"  style="width: 80px" name="s6"   id="sc6" value="0" size="4" readonly/></td>
                        <td class="tablecontent1"><input type="text"  style="width: 80px" name="s7" id="sc7"   value="0" size="4" readonly/></td>
                        <td class="tablecontent1"><input type="text" style="width: 80px" name="bal2" id="bal2" value="0" size="4" readonly /></td>
                    </tr>

                    <tr>
                        <td class="tablecontent11" >&nbsp;&nbsp;TSP&nbsp;&nbsp;</td>
                        <input type="hidden" name="program3" value="TSP"/>
                        <td class="tablecontent1"><input type="text" style="width: 80px"  name="t1" id="ts1" value="0" size="4" readonly /></td>
                        <td class="tablecontent1"><input type="text"  style="width: 80px"   name="t2" id="ts2" value="0" size="4" onkeyup="sum7()"/></td>
                        <td class="tablecontent1"><input type="text" style="width: 80px"   name="t3" id="ts3" value="0" size="4"onkeyup="sum8()"/></td>
                        <td class="tablecontent1"><input type="text" style="width: 80px" name="t4"   id="ts4" value="0" size="4"onkeyup="sum9()"/></td>
                        <td class="tablecontent1"><input type="text" style="width: 80px" name="t5"    id="ts5" value="0" size="4" readonly /></td>
                        <td class="tablecontent1"><input type="text"  style="width: 80px" name="t6"   id="ts6" value="0" size="4" readonly /></td>
                        <td class="tablecontent1"><input type="text"  style="width: 80px" name="t7" id="ts7"   value="0" size="4" readonly /></td>
                        <td class="tablecontent1"><input type="text" style="width: 80px" name="bal3" id="bal3" value="0" size="4" readonly /></td>
                    </tr>

                    <tr>
                        <td class="tablecontent11" ><font size="3px">*</font> WOMEN</td>
                        <input type="hidden" name="program4" value="WOMEN"/>
                        <td class="tablecontent1"> </td>
                        <td class="tablecontent1"><input type="text"  style="width: 80px"   name="w2" id="wo2" value="0" size="4" onkeyup="sum10()"/></td>
                        <td class="tablecontent1"><input type="text" style="width: 80px"   name="w3" id="wo3" value="0" size="4" onkeyup="sum11()"/></td>
                        <td class="tablecontent1"><input type="text" style="width: 80px" name="w4"   id="wo4" value="0" size="4"  onkeyup="sum12()"/></td>
                        <td class="tablecontent1"><input type="text" style="width: 80px" name="w5"    id="wo5" value="0" size="4" readonly /></td>
                        <td class="tablecontent1"><input type="text"  style="width: 80px" name="w6"   id="wo6" value="0" size="4" readonly  /></td>
                        <td class="tablecontent1"><input type="text"  style="width: 80px" name="w7" id="wo7"  value="0" size="4" readonly /></td>
                        <input type="hidden" name="bal4" id="bal4" value="0"/>
                    </tr>
                    <tr>
                        <td class="tablecontent11" >&nbsp;&nbsp;Total&nbsp;&nbsp;</td>
                        <input type="hidden" name="program4" value="WOMEN"/>
                        <td class="tablecontent1"><input type="text" style="width: 80px" name="tt1" id="tt1" value="0" size="4" readonly /></td>
                        <td class="tablecontent1"><input type="text"  style="width: 80px"   name="tt2" id="tt2" value="0" size="4" readonly /></td>
                        <td class="tablecontent1"><input type="text" style="width: 80px"   name="tt3" id="tt3" value="0" size="4"readonly /></td>
                        <td class="tablecontent1"><input type="text" style="width: 80px" name="tt4"  id="tt4" value="0" size="4" readonly /></td>
                        <td class="tablecontent1"><input type="text" style="width: 80px" name="tt5"   id="tt5" value="0" size="4" readonly /></td>
                        <td class="tablecontent1"><input type="text"  style="width: 80px" name="tt6"   id="tt6" value="0" size="4" readonly /></td>
                        <td class="tablecontent1"><input type="text"  style="width: 80px" name="tt7" id="tt7"  value="0" size="4" readonly /></td>
                        <td class="tablecontent1"><input type="text" style="width: 80px" name="bal5" id="bal5" value="0" size="4" readonly /></td>
                    </tr>

                </table>

                </body>
                <br/>
                <div align="center" id="add" style="display:block">
                    <input   type="submit"   value="&nbsp;&nbsp;&nbsp;&nbsp;Add&nbsp;&nbsp;&nbsp;&nbsp;" onclick="return AddData()" />
                </div>
                <div align="center" id="update" style="display: none">
                    <input  type="submit"  value="Update"  onclick=" return Updatedata()" />
                </div>
                <br/>
                <div style="font-size:11px;font-family:Verdana;font-weight:bold" align="center"><font color="#990000">

                   NOTE : -     Entry in general, scsp and tsp should be incliding women applicants.<br/>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Women field is given seperatly only for the purpose of monitoring<br/>
                                &nbsp;&nbsp;Re-imbursement to women applicants and not added in total.

                    </font>
                </div>

        </form>

</html>
