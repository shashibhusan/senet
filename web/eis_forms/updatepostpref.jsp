<%-- 
    Document   : updatepostpref
    Created on : 31 Jan, 2019, 2:51:49 PM
    Author     : Raghavendra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,common.*,java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Info</title>
        <style>
            #mainDiv
            {
                width: 100%;
                border: 1px #e2e2e2 solid;
                align:center;
                margin: auto;
                height: 612px;
            }
            #head
            {
                line-height: 18px;
                font: normal normal 19px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 6px;
                width: 98%;
                background-color: #f1f1f1;
            }
            .head
            {
                font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
                background-color: #f1f1f1;
                color: #000000;
            }
            #myTable
            {
                width: 63%;
                display: none;
            }
            #myTable1
            {
                width: 70%;
            }
            table tr td 
            {
                border: 1px #f1f1f1 solid;
                font: normal normal 11px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 4px;
            }
            input[type=submit]
            {
                width: 100px;
                background-color:  #e2e2e2 ;
                color:  #000000 ;
                padding: 9px 14px;
                margin: 8px 0;
                border: 1px  #b4b4b4 solid;
                cursor: pointer;
            }
            input[type=submit]:hover
            {
                background-color:  #cacaca ;
            }
            select {
    width: 92%;
    padding: 8px 10px;
    display: inline-block;
    font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
}

#err{
    width: 60%;
    align : center;
    text-align: left;
    margin: auto;
    color: #cf1111;
    font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;

}
.btn1
            {
                width: 100px;
                background-color:  #e2e2e2 ;
                color:  #000000 ;
                padding: 4px 10px 4px 10px;
                border: none;
                border: 1px #000000 solid;
                cursor: pointer;
            }
        </style>
        <script>
            function validate()
            {
                var pref_one=document.formUpdate.prefone.value;
                var pref_two=document.formUpdate.preftwo.value;
                var pref_three=document.formUpdate.prefthree.value;
                
                if((pref_one==null || pref_one=="") && (pref_two==null || pref_two=="") && (pref_three==null || pref_three==""))
                    {
                        document.getElementById("err").innerHTML="Please select posting preferences !!";
                        return false;
                    }
                    else if(pref_one==null || pref_one=="")
                        {
                            document.getElementById("err").innerHTML="Please select 1st posting preference !!";
                            return false;
                        }
                        else if(pref_two==null || pref_two=="")
                            {
                                document.getElementById("err").innerHTML="Please select 2nd posting preference !!";
                                return false;
                            }
                            else if(pref_three==null || pref_three=="")
                                {
                                    document.getElementById("err").innerHTML="Please select 3rd posting preference !!";
                                    return false;
                                }
                                else if((pref_one==pref_two) || (pref_one==pref_three))
                                    {
                                        document.getElementById("err").innerHTML="preferences should not be same !!";
                                        return false;
                                    }
                                    else if((pref_two==pref_one) || (pref_two==pref_three))
                                        {
                                            document.getElementById("err").innerHTML="preferences should not be same !!";
                                            return false;
                                        }
                                        else if((pref_three==pref_one) || (pref_three==pref_two))
                                        {
                                            document.getElementById("err").innerHTML="preferences should not be same !!";
                                            return false;
                                        }
                
            }
        </script>
    </head>
    <%
        String crosssite = (String)session.getAttribute("crosssite");
        session.setAttribute("crosssite", crosssite);
        
     //   System.out.println("session value on updatepostpref page = " +crosssite);
        
        if(!crosssite.equals(null))
        {
            
            String token = (String)session.getAttribute("token");
            String emp_name = (String)session.getAttribute("emp_name");
            String emp_email = (String)session.getAttribute("emp_email");
            String emp_desig = (String)session.getAttribute("emp_desig");
            String emp_cur_ofc = (String)session.getAttribute("emp_cur_ofc");
            
        //session.setAttribute("token", token);
        //session.setAttribute("emp_name", emp_name);
        //session.setAttribute("emp_email", emp_email);
        //session.setAttribute("emp_desig", emp_desig);
        //session.setAttribute("emp_cur_ofc", emp_cur_ofc);
         //   System.out.println(" value on updatepostpref page = " +token+ "//" +emp_name+ "//" +emp_email);
            ResultSet res = null;
            Statement stm = null;
            Connection con = null;
            int flagCount=0;
            String time="";
            String one="";
            String two="";
            String three="";
            
    %>
    <body>
        <div id="mainDiv">
        <form name="formUpdate" action="postingupdate.jsp" method="POST">
         
            <h3 id="head">Update Posting Preference</h3>
            
            <div id="err" align="left"></div>
            <%
                                    con = ConnectionManager.getConnectionDirectForMySQL();
                                    stm = con.createStatement();
                                    String Query = "select flag from eis_postinginfo_new where email = '"+emp_email+"' and token = '"+token+"'";
                                    res = stm.executeQuery(Query);
                                    while(res.next())
                                    {
                                        flagCount=1;                                       
                                    }
                                    
                                    
                                    
                                        %>
                                        <table align="center" id="myTable1">
                                      <%
                                    if(flagCount==1)
                                    {
                                        String Query1 = "select * from eis_postinginfo_new where email = '"+emp_email+"' and token = '"+token+"'";
                                        res = stm.executeQuery(Query1);
                                        while(res.next())
                                        {
                                        one=res.getString("pref_one");
                                        two=res.getString("pref_two");
                                        three=res.getString("pref_three");
                                        }
                                    }else
                                    {
                                        String Query1 = "select * from eis_postinginfo where email = '"+emp_email+"' ";
                                        res = stm.executeQuery(Query1);
                                        while(res.next())
                                        {
                                        one=res.getString("pst_pref_1");
                                        two=res.getString("pst_pref_2");
                                        three=res.getString("pst_pref_3");
                                        }
                                    }
                                      %>      
                                      <tr><td colspan="4" style="padding: 5px; color: #389006; line-height: 25px">Your last selection of posting preferences is given below : </td></tr>
                                      <input type="hidden" name="alreadyupdatedornot" value="<%=flagCount%>"/>    
                                      <tr>
                                          <td class="head">Nos</td>
                                          <td class="head">1st </td>
                                          <td class="head">2nd</td>
                                          <td class="head">3rd</td>
                                        
                                      </tr>
                                      
                                      <tr>
                                          <td class="head">Preference</td>
                                          <td><%=one%></td>
                                          <td><%=two%></td>
                                          <td><%=three%></td>
                                      </tr> 
                                      <tr>
                                          <td align="center" colspan="4">
                                              <input type="submit" name="update" value="Update" class="btn1" onclick="return showUpdateDiv();"
                                          </td>
                                      </tr>
                                      
                                        </table>
                                        
                                        <%
                                   
            %>
            
            <table align="center" id="myTable">
                
                <tr>
                    <td>1.</td>
                    <td>1st Posting Preference</td>
                    <td>:&nbsp;&nbsp; 
                        <select name="prefone" id="prefone">
                            <option value="">Select</option>
                            <%
                               
                                    
                                    String sql = "select * from eis_branch_list";
                                    res = stm.executeQuery(sql);
                                    while(res.next())
                                    {
                                        %>
                                        <option value="<%=res.getString("Inst_Name")%>"><%=res.getString("Inst_Name")%></option>
                                        <%
                                    }
                                
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>2.</td>
                    <td>2nd Posting Preference</td>
                    <td>:&nbsp;&nbsp; 
                        <select name="preftwo" id="preftwo">
                            <option value="">Select</option>
                    <%
                                    String sql1 = "select * from eis_branch_list";
                                    res = stm.executeQuery(sql1);
                                    while(res.next())
                                    {
                                        %>
                                        <option value="<%=res.getString("Inst_Name")%>"><%=res.getString("Inst_Name")%></option>
                                        <%
                                    }
                    %>
                       </select>
                    </td>
                </tr>
                <tr>
                    <td>3.</td>
                    <td>3rd Posting Preference</td>
                    <td>:&nbsp;&nbsp; 
                        <select name="prefthree" id="prefthree">
                            <option value="">Select</option>
                    <%
                                    String sql3 = "select * from eis_branch_list";
                                    res = stm.executeQuery(sql3);
                                    while(res.next())
                                    {
                                        %>
                                        <option value="<%=res.getString("Inst_Name")%>"><%=res.getString("Inst_Name")%></option>
                                        <%
                                    }
                                    con.close();
                    %>
                       </select>
                    </td>
                </tr>
                
                
                
                <tr>
                    <td colspan="3">                       
                        
                        <div align="right">
                           <input type="submit" name="submitdata" value="Update" onclick="return validate();"/> 
                        </div>
                        
                    </td>
                </tr>
                
            </table>
                       <%
                               
                       %>
                        
        </form>
                       </div>
<script>
    function showUpdateDiv()
    {
        document.getElementById("myTable1").style.display='none';
        document.getElementById("myTable").style.display='block';
        return false;
    }
</script>
    </body>
    <%
        }else {
    response.sendRedirect("stat.jsp");
}
    %>
</html>
