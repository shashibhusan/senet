<%-- 
    Document   : updatetraining
    Created on : 21 Nov, 2019, 10:41:29 AM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="common.*,java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">        
        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <title>update training</title>
         
       
        <style>
            #mainDiv
            {
                width: 100%;
                border: 1px #e2e2e2 solid;
                align:center;
                margin: auto;
            }
            #myTable
            {
                 width: 93%;
                 
            }
            #head
            {
                line-height: 18px;
                font: normal normal 19px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 8px;
                width: 98%;
                background-color: #f1f1f1;
            } 
            #data 
            {
                border: 1px #f1f1f1 solid;
                font: normal normal 13px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 4px;
            }
            #myTableUpdate
            {
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                width: 90%;
            }
            #heading
            {
                background-color: #f1f1f1;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 4px;
            }
            #heading1
            {
                background-color:  #e8e8e8 ;
                font: normal normal 20px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            input[type=submit],[type=button]
            {
                width: 100px;
                background-color:  #e2e2e2 ;
                color:  #000000 ;
                padding: 9px 14px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            input[type=submit]:hover,[type=button]:hover
            {
                background-color:  #cacaca ;
            }
            #button, #finalbtn,#button1,#err,#err1
            {
                border: none;
                color:  #ea1c00 ;
                font: normal normal 15px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            #updateData
            {
                
            }
            #test{
                
                border: 1px #e2e2e2 solid;
                align:center;
                margin: auto;
                width: 90%;
                display: none;
            }
            input[type=text]
            {
                width: 95%;
                padding: 4px;
                display: inline-block;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            select
            {
                
                padding: 8px 10px;
                display: inline-block;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            }
            #error1
            {
                padding: 5px;
                background:  #f9e1e1 ;
                width: 90%;
                margin: auto;
                align: center;
                color: #bb0000;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                display: none;
            }
            #delete
            {
              border: 1px #e2e2e2 solid;
              width: 30px;
            }
            
            
        </style>
        <script>
            $(function () {

                $(".datepicker").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    yearRange: "-68:+42",
                    dateFormat: "dd/mm/yy"
              /*     monthNamesShort  : fullmonth_array         */

                });
            });
            function doUpdate()
            {
                //alert('======working======');
                var TrainingName=document.formUpdateTraining.trainingName.value;
                var SelectedDateFrom=document.formUpdateTraining.DateFrom.value;
                var SelectedDateTo=document.formUpdateTraining.DateTo.value;
                
                if(TrainingName==="" || TrainingName===null)
                    {
                        document.getElementById('error1').innerHTML='Please enter the training details.'
                        document.getElementById('trainingName').focus();
                        document.getElementById('error1').style.display='block';
                        return false;
                    }
                    else if(SelectedDateFrom==="" || SelectedDateFrom===null)
                        {
                            document.getElementById('error1').innerHTML='Please select the training start date.'
                            document.getElementById('DateFrom').focus();
                            document.getElementById('error1').style.display='block'; 
                            return false;
                        }
                        else if(SelectedDateTo==="" || SelectedDateTo===null)
                            {
                                document.getElementById('error1').innerHTML='Please select the training End date.'
                                document.getElementById('DateTo').focus();
                                document.getElementById('error1').style.display='block';
                                return false;
                            }
                            else
                                {
                                    TrainingUpdate();
                                    return true;
                                }
            }
           var request;
            function TrainingUpdate()
            {
                var TrainingName=document.formUpdateTraining.trainingName.value;
                var SelectedDateFrom=document.formUpdateTraining.DateFrom.value;
                var SelectedDateTo=document.formUpdateTraining.DateTo.value;
                
                var url="updateTrainingMain.jsp?tn="+TrainingName+"&df="+SelectedDateFrom+"&dt="+SelectedDateTo;
                
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
                if(request.readyState===4){
                var val=request.responseText;
                document.getElementById('msg').innerHTML=val;
                window.location.reload();
                var frm = document.getElementsByName('formUpdateTraining')[0];
                frm.reset();  // Reset all form data
                return false;
                }
            }
            
            function refreshPage()
            {
               window.location.reload();
            }
            function deleteTrainingData(row)
            {
               // var sno=document.getElementById('rowfordelete').value;
                var sno=Number(row);
                alert('serial no is ='+sno);
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
            
            session.setAttribute("token", token);
            session.setAttribute("emp_name", emp_name);
            session.setAttribute("emp_email", emp_email);
            session.setAttribute("emp_desig", emp_desig);
            session.setAttribute("emp_cur_ofc", emp_cur_ofc);
            
            
    %>
    <body>
        <div  id="mainDiv">
            <h3 id="head">Training Information</h3>
            <%
            Connection con=null;
            ResultSet rs = null;
            Statement st = null;  
            int flagCount = 0;
            int i=0;
            con = ConnectionManager.getConnectionDirectForMySQL();
            st = con.createStatement();
            
            String QueryFlag = "select * from eis_trainingcompleted where email = '"+emp_email+"' ";
            rs = st.executeQuery(QueryFlag);
            if(rs.next())
            {
                flagCount=1;
            }
            
           //     System.out.println("You didn't have training  data till now");
                %>  
            <form name="formUpdateTraining" action="#" method="POST">
            <table align="center" id="myTable">
                <tr id="heading">
                    <td id="heading" style="width: 20px">Sno</td>
                    <td id="heading" style="width: 300px"> Training Name</td>
                    <td id="heading" style="width: 80px"> Dt. From</td>
                    <td id="heading" style="width: 80px"> Dt. To</td>
                    <%--        <td id="heading" style="width: 30px"> </td>--%>
                </tr>
            <%
            
            if(flagCount==0)
            {
            %>    
            <tr id="nodata">
                <td align="center" colspan="4" style="color:#a00000; border: 2px #a00000 solid;  padding: 5px 5px 5px 5px">
                 You did not uploaded any training data yet.   
                </td>
            </tr>
                    <%
            }else
            {
                rs.beforeFirst();
                while(rs.next())
                {
                i=i+1;
          %>
          <tr id="display">
              <td id="data"><%=i%></td> 
              <td id="data"><%=rs.getString("trainingName")%></td> 
              <td id="data"><%=rs.getString("tcFrom")%></td> 
              <td id="data"><%=rs.getString("tcTo")%></td> 
    <%--          <input type="hidden" name="rowfordelete" id="rowfordelete" value="<%=rs.getInt("sno")%>"/>
              <td align="center" id="delete"><a href="#" onclick="deleteTrainingData(rowfordelete.value);">
                <img src="eis_image/delete1.png" width="16" height="16"/></a></td> --%>
          </tr>
          <%
                }
            }
          %>
         </table>
         <div id="msg"></div>
         
         <h3 id="head">Update Your Training Information</h3>
         <table align="center" id="myTableUpdate">
             <tr id="heading">
                    <td id="heading" style="width: 10px">Sno</td>
                    <td id="heading" style="width: 300px"> Training Name</td>
                    <td id="heading" style="width: 80px"> Dt. From</td>
                    <td id="heading" style="width: 80px"> Dt. To</td>
                </tr>
             <tr>
                 <td ><%=i+1%>.</td>
                 <td>
                 <input type="text" name="trainingName" id="trainingName" placeholder="Name of Training" required="1"/>
             </td>  
             <td>
                 <input type="text" name="DateFrom" class="datepicker" id="DateFrom" placeholder="DD/MM/YYYY" required="1"/>
             </td>
             <td>
                 <input type="text" name="DateTo" class="datepicker" id="DateTo" placeholder="DD/MM/YYYY" required="1"/>
             </td>
             </tr>
             
             <tr>
                 <td align="center" colspan="4">
                     <input type="button" name="updateTrainig" id="btn" value="UPDATE" onclick="return doUpdate()"/>
                 </td>
             </tr>
         </table>
                 <div id="error1"></div>
          </form>   
        </div>
    </body>
    <%
        }
        else {
    response.sendRedirect("stat.jsp");
}
    %>
</html>
