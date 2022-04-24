<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Untitled Document</title>

        <script type="text/javascript" src="jquery-1.11.3.js"></script>
<script>
	$(function() {
	var d = new Date(),

    n = d.getMonth(),

    y = d.getFullYear();
    var m=(n-3);

$('#cmbMonth option:eq('+m+')').prop('selected', true);

$('#cmbYear option[value="'+y+'"]').prop('selected', true);
	});
</script>


        <link href="inb.css" rel="stylesheet" type="text/css"></link>
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
            /*
             * AJAX call starts with this function
             */
            function makeRequest() {
                 
                var year=document.getElementById("cmbYear").value;
                var msme=document.getElementById("institute").value;
                var pageName="target";
                if(!(year==null || year==""))
                {

                    var xmlHttpRequest = getXMLHttpRequest();
                    xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest);
                    xmlHttpRequest.open("POST", "HelloWorld.do?institute="+msme+"&page="+pageName+"&cmbYear="+year, true);
                    xmlHttpRequest.setRequestHeader("Content-Type",
                    "application/x-www-form-urlencoded");
                    xmlHttpRequest.send(null);
                }
            }
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
                            document.getElementById("GENERAL").value=scheme[0];
                            document.getElementById("SCSP").value=scheme[1];
                            document.getElementById("TSP").value=scheme[2];
                             
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
                var msme=document.getElementById("institute").value;
     
                var GENERAL=document.getElementById("GENERAL").value;
                var SCSP=document.getElementById("SCSP").value;
                var TSP=document.getElementById("TSP").value;

        
                if((msme<0))
                {
                    alert("Please select  MSME-DIs");

                    return false;
                }

                if((year<0))
                {
                    alert("Please select  Year");
                    return false;
                }

                if(isNaN(GENERAL)){
                    alert("Please Enter the Numeric Value for GENERAL");
                    return false;
                }
                if(isNaN(SCSP)){
                    alert("Please Enter the Numeric Value for SCSP");
                    return false;
                }
                if(isNaN(TSP)){
                    alert("Please Enter the Numeric Value for TSP");
                    return false;
                }

                if (GENERAL== '') {
                    document.getElementById("GENERAL").value=0;
                }
                if (SCSP== '') {
                    document.getElementById("SCSP").value=0;
                }
                if (TSP== '') {
                    document.getElementById("TSP").value=0;
                }
                document.forms[0].action ="ISOTargetAction.do?method=add"
            }
            function update()
            {
                if (GENERAL== '') {
                    document.getElementById("GENERAL").value=0;
                }
                if (SCSP== '') {
                    document.getElementById("SCSP").value=0;
                }
                if (TSP== '') {
                    document.getElementById("TSP").value=0;
                }
                document.forms[0].action ="ISOTargetAction.do?method=update"
            }

        </script>
    </head>

    <body bgcolor="#FFFFFF">

        <form action=" " name="fname" method="post">

            <br />
            <%
                        String role = (String) session.getAttribute("rol");
            %>

            <div style="font-size:large;font-family:Verdana;font-weight:bold;  " align="center" ><font color="#990000"> ISO Amount Sanctioned</font></div>
            
            <table  align="center"   width="47%" bordercolordark="#990000">


                <tr>

                    <td width="26%" height="48"><font color="#990000">MSME-DIs</font></td>
                    <td>
                        <select name="institute" id="institute" style="width: 120px" onchange="makeRequest()">
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
                </tr>
            </table>
            <table width="674" border="0" align="center" class="style1" style="width: 686; height: 145px; background-color: gainsboro;" cellpadding="0" cellspacing="0">
                <tr class="tablecontent1">
                    <td width="574" class="tableheader">Amount Sanctioned for </td>
                    <td width="100"  align="center" class="tableheader">Amount Sanctioned </td>
                </tr>

                <tr>
                    <td class="tablecontent11">GENERAL</td>
                    <td  class="tablecontent1" ><input type="text" name="GENERAL" id="GENERAL" size="15" value="0"/></td>
                </tr>
                <tr>
                    <td class="tablecontent12">SCSP</td>
                    <td  class="tablecontent2" ><input type="text" name="SCSP" id="SCSP" size="15" value="0" /></td>
                </tr>
                <tr>
                    <td class="tablecontent11">TSP</td>
                    <td  class="tablecontent1" ><input type="text" name="TSP" id="TSP" size="15" value="0" /></td>
                </tr>

                <tr align="center"  style="background: white">

                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                </tr>
                <tr align="center" style="background: white">
                </tr>
            </table>
            <div align="center" id="add" style="display:block">
                <input   type="submit"   value="&nbsp;&nbsp;&nbsp;&nbsp;Add&nbsp;&nbsp;&nbsp;&nbsp;" onclick="return AddData()" />
            </div>
            <div align="center" id="update" style="display: none">
                <input  type="submit"  value="Update" onclick="return update()"/>
            </div>
        </form>

    </body>

</html>
