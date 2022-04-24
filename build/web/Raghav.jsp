<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*,java.util.*" errorPage="" %>
<%@ taglib uri="http://www.owasp.org/index.php/Category:OWASP_CSRFGuard_Project/Owasp.CsrfGuard.tld" prefix="csrf" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ page autoFlush="true" buffer="1094kb"%>
<%@page errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>NewMprPageOne</title>
        <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css" rel="stylesheet"/>
        <link rel="stylesheet" type="text/css" media="screen"
              href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css"/>
        <script src="new2.js" type="text/javascript"></script>
        <script type="text/javascript" src="jquery-1.11.3.js"></script>
        <link href="inb.css" rel="stylesheet" type="text/css"/>
        <script language="javascript" type="text/javascript" src="datetimepicker.js"></script>
        <script language="javascript" type="text/javascript">

            function doReset(a)
            {
                document.getElementById(a).reset();
            }

            function doAjaxPost() {
                var name=document.getElementById("instname").value;
                if (name == null || name == "") {
                    alert("Please select the institute");
                    return false;
                }
                document.getElementById("add1").disabled = true;
                var data1 = $('form').serialize();
                $.ajax({
                    type: "POST",
                    url: "/dcmsme/mprpms/NewMprAction.do?method=pageone&button=one",
                    data: data1,
                    dataType: 'json',
                    success: function(response){
                        doReset("target");
                        $("#add2").text(response[0]);
                        setTimeout(function() {
                            document.getElementById("add1").disabled = false;
                            $("#add2").text(" ");
                        }, 3000);
                    },
                    error: function(e){
                        alert('Error: ' + e);
                    }
                });
            }

            function doAjaxPost1() {
                var name=document.getElementById("instname1").value;
                if (name == null || name == "") {
                    alert("Please select the institute");
                    return false;
                }
                document.getElementById("add3").disabled = true;
                var data1 = $('form').serialize();
                $.ajax({
                    type: "POST",
                    url: "/dcmsme/mprpms/NewMprAction.do?method=pageone&button=two",
                    data: data1,
                    dataType: 'json',
                    success: function(response){
                        doReset("target1");
                        $("#add4").text(response[0]);
                        setTimeout(function() {
                            document.getElementById("add3").disabled = false;
                            $("#add4").text(" ");
                        }, 3000);
                    },
                    error: function(e){
                        alert('Error: ' + e);
                    }
                });
            }


        </script>
        <%

                    String intid = (String) session.getAttribute("ins");
                   
        %>
    </head>
    <body>
        <h1>Hello World!</h1>
        <table align="center"><tr>
                                <td> </td>
                                <td  ><strong>Name of Institute :</strong> </td>

                                <td  ><select name="instname" id="instname" Style="width:200px;"> <%--shashi start--%>
                                        <option value=''>Please select</option>
                                        <%
                                                    Connection conn1 = null;
                                                    ResultSet resultSet1 = null;
                                                    ArrayList <String> instname = new ArrayList<String>();
                                                    try {
                                                        conn1 = ConnectionManager.getConnectionDirectForMySQL();
                                                        if (conn1 != null) {
                                                            Statement stmt = conn1.createStatement();
                                                            String userSql = "select name from ordervalue where instId=" + "'" + intid + "'" + "order by orderno asc";
                                                            resultSet1 = stmt.executeQuery(userSql);
                                                            while (resultSet1.next()) {
                                                                instname.add(resultSet1.getString("name"));
                                        %>

                                        <option value='<%=resultSet1.getString("name")%>'><%=resultSet1.getString("name")%></option>

                                        <%}
                                                                                                }
                                                                                            } catch (Exception e) {
                                                                                                System.out.println("page NewMprPageOne : " + e);
                                        %>
                                        <jsp:forward page="stat.jsp"></jsp:forward>
                                        <%
                                                    }
                                        %>

                                    </select></td>

                                <td > </td>
                                <td > </td>
                            </tr>
                        </table>

        <form action="raghav1.jsp">
        <input type="text" name="Username" placeholder="Name" ><br/><br/>
        <input type="email" name="email" placeholder="Email"><br/><br/>
        <input type="password" name="password" placeholder="Password"><br/>
        <input type="submit" value="register">
        </form>


    </body>
</html>
