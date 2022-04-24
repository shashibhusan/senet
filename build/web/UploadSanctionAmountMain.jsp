<%-- 
    Document   : UploadSanctionAmountMain
    Created on : 20 Jul, 2020, 4:40:58 PM
    Author     : msme
--%>

<%
String sessionid = request.getSession().getId();
response.setHeader("SET-COOKIE", "JSESSIONID=" + sessionid + "; HttpOnly");
%>
<%
           // Set to expire far in the past.
     response.setDateHeader("Expires", 0);
  // Set standard HTTP/1.1 no-cache headers.
     response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
  // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
     response.addHeader("Cache-Control", "post-check=0, pre-check=0");
  // Set standard HTTP/1.0 no-cache header.
     response.setHeader("Pragma", "no-cache");
          request.getSession(false);
        %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, common.*" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page errorPage="" %>
<!DOCTYPE html>
<script>
var ss =  sessionStorage.getItem('uniqueIdSessionStorage');
if(ss==='' || ss===null)
{
window.location='slogin.jsp';
}
</script>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Sanction Amount</title>
        <style>
            #head{
                width: 95%;
                font: normal normal 16px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 10px;
                border: 1px solid  #0073df ;
                background-color:  #f3f3f3 ;
                text-align: center;
            } 
            .mytable{
                width: 600px;
                background-color:  #ecf2ff ;
                font-family: times new roman;
                text-align: center;
                
            }
            .mainFormDI,.mainFormDI1
            {
                float: left;
                border: 1px dotted #d2f3d2;
                margin: 0px;
            }
            #heading
            {
                font: normal normal 16px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 6px 0px 6px 0px;
                text-align: center;
                width: 500px;
                background-color:  #d2f3d2 ;              
                
            }
            .lebel-data
            {
                width: 200px;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 5px 0px 5px 5px;
            }
            .SanctionData{
                padding: 2px 2px 2px 2px;
                width: 60%;
            }
            select{
                padding: 2px 2px 2px 2px;
                width: 350px;
            }
            #FormTable
            {
                display: none;
            }
            #AgartalaTable,#AhmedabadTable,#AllahabadTable,#BangaloreTable,#MumbaiTable,#KolkataTable,#CuttackTable,#GuwahatiTable,#HubliTable,#HyderabadTable,#IndoreTable,#ImphalTable,#KarnalTable,#ChennaiTable,#RanchiTable,JammuTable
            {
                display: none;
            }
            input[type=submit],[type=button]{
                padding: 4px 15px 4px 15px;
                width: 100px;
                cursor: url;
                background:  #dfdfdf ;
                border-radius: 3px;                
            }
        </style>
      
    </head>
    <body>
        <%
            String mnm = request.getParameter("mnm");
            String instId=(String)session.getAttribute("CmbIns");
            String role=(String)session.getAttribute("rol");
            String years=(String)session.getAttribute("CmbYear");
            String months=(String)session.getAttribute("CmbMonth");
            String user=(String)session.getAttribute("user");
            String Random5=(String)session.getAttribute("Random5");
            
            if(Random5.equals(mnm))
            {
        %>
        <h2 id="head">Upload Sanction Amount For the Financial Year <%=years%></h2>
        <%
          
            
            
          
            Connection con=null;
            Statement st=null;
            ResultSet res=null;
            try
            {
                con=ConnectionManager.getConnectionDirectForMySQL();
                st=con.createStatement();
            }catch(Exception er)
            {
                er.printStackTrace();
            }
        %>
        <form action="/uploadSanctionSenet.do" id="sanctionAmountUpdateForm" name="sanctionAmountUpdateForm" class="updateForm" method="POST"  onsubmit="FormValidate()"> 
         
        <table class="mytable" align="left">
            <tr><td>&nbsp</td></tr>
            <tr>
                <td>
                    <strong>Institute Name</strong>    
                </td>
                <td>:&nbsp;&nbsp;&nbsp;&nbsp;
                           
                    <select name="selInst" id="selInst" class="selInst" onchange="updateSanctionAmount(this,amc,webMaint,internet,contgs,others,total);">
                        <option value="">Select</option>
                        <%
                        String sql="select INST_ID as InstId,INST_NAME as instName,ID as id from tbl_di_institute where INST_NAME not in('ADMIN','Hqrs-Office','SEC-MSME') order by INST_NAME";
                        res=st.executeQuery(sql);
                        while(res.next())
                        {
                        %>
                        <option value="<%=res.getString("InstId")%>"><%=res.getString("InstName")%></option>
                        <%}%>
                    </select>
               <%--     
                    <input type="submit" name="SubmitForm" value="Submit" >
               --%>
                </td>
            </tr>
            <tr><td>&nbsp</td></tr>
        </table><br/>
        
        <div style="height: 8px;"></div>
        <table id="FormTable" style="width: 600px"><tr><td align='center'>
                    
                    <div style="width: 500px;" align='center' class="mainTable">
                        <h2 id="heading">Sanction Amount of <strong><span id="Instname"></span></strong></h2>
                        <table  style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="amc" name="amc" placeholder="--" maxlength="6" tabindex="1" value='' autocomplete="off"
                                     onblur="javascript:addTotal(this.value,webMaint.value,internet.value,contgs.value,others.value,total);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data" >
                                    <lebel>Web Maintenance</lebel>
                                </td>
                                <td align='center'>   
                                    <input type="text" class="SanctionData" id="webMaint" name="webMaint" placeholder="--" maxlength="6" tabindex="2" value='' autocomplete="off"
                                     onblur="javascript:addTotal(amc.value,this.value,internet.value,contgs.value,others.value,total);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="internet" type="text" name="internet" placeholder="--" maxlength="6" tabindex="3" value='' autocomplete="off"
                                     onblur="javascript:addTotal(amc.value,webMaint.value,this.value,contgs.value,others.value,total);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="contgs" name="contgs" placeholder="--" maxlength="6" tabindex="4" value='' autocomplete="off"
                                     onblur="javascript:addTotal(amc.value,webMaint.value,internet.value,this.value,others.value,total);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="others" name="others" placeholder="--" maxlength="6" tabindex="5" value='' autocomplete="off"
                                     onblur="javascript:addTotal(amc.value,webMaint.value,internet.value,contgs.value,this.value,total);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="total" name="total" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                        </table>
                        </div>
                    
                        <div style="width: 500px;" align='center' id="AgartalaTable">
                            <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Aizwal</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc2" name="br_amc2" placeholder="--" maxlength="6" tabindex="6" value=''
                                     onblur="javascript:addTotalBr(this.value, br_internet2.value,br_contgs2.value,br_others2.value,br_total2);"/>
                                </td>
                            </tr>
                           
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet2" type="text" name="br_internet2" placeholder="--" maxlength="6" tabindex="8" value=''
                                     onblur="javascript:addTotalBr(br_amc2.value, this.value,br_contgs2.value,br_others2.value,br_total2);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs2" name="br_contgs2" placeholder="--" maxlength="6" tabindex="9" value=''
                                     onblur="javascript:addTotalBr(br_amc2.value, br_internet2.value,this.value,br_others2.value,br_total2);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others2" name="br_others2" placeholder="--" maxlength="6" tabindex="10" value=''
                                     onblur="javascript:addTotalBr(br_amc2.value, br_internet2.value,br_contgs2.value,this.value,br_total2);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 " >
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total2" name="br_total2" type="text" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        </div>
                    
                        <div style="width: 500px;" align='center' id="AhmedabadTable">
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Rajkot</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc3" name="br_amc3" placeholder="--" maxlength="6" tabindex="6" value=''
                                     onblur="javascript:addTotalBr(this.value, br_internet3.value,br_contgs3.value,br_others3.value,br_total3);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet3" type="text" name="br_internet3" placeholder="--" maxlength="6" tabindex="8" value=''
                                     onblur="javascript:addTotalBr(br_amc3.value, this.value,br_contgs3.value,br_others3.value,br_total3);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs3" name="br_contgs3" placeholder="--" maxlength="6" tabindex="9" value=''
                                     onblur="javascript:addTotalBr(br_amc3.value, br_internet3.value,this.value,br_others3.value,br_total3);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others3" name="br_others3" placeholder="--" maxlength="6" tabindex="10" value=''
                                     onblur="javascript:addTotalBr(br_amc3.value,br_internet3.value,br_contgs3.value,this.value,br_total3);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 " >
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total3" name="br_total3" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Silvassa</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc4" name="br_amc4" placeholder="--" maxlength="6" tabindex="11" value=''
                                     onblur="javascript:addTotalBr(this.value, br_internet4.value,br_contgs4.value,br_others4.value,br_total4);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet4" type="text" name="br_internet4" placeholder="--" maxlength="6" tabindex="13" value=''
                                     onblur="javascript:addTotalBr(br_amc4.value, this.value,br_contgs4.value,br_others4.value,br_total4);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs4" name="br_contgs4" placeholder="--" maxlength="6" tabindex="14" value=''
                                     onblur="javascript:addTotalBr(br_amc4.value, br_internet4.value,this.value,br_others4.value,br_total4);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others4" name="br_others4" placeholder="--" maxlength="6" tabindex="15" value=''
                                     onblur="javascript:addTotalBr(br_amc4.value, br_internet4.value,br_contgs4.value,this.value,br_total4);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 " >
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total4" name="br_total4" type="text" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        </div>
                    
                        <div style="width: 500px;" align='center' id="AllahabadTable">
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Varanasi</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc5" name="br_amc5" placeholder="--" maxlength="6" tabindex="6" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet5.value,br_contgs5.value,br_others5.value,br_total5);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet5" type="text" name="br_internet5" placeholder="--" maxlength="6" tabindex="8" value=''
                                     onblur="javascript:addTotalBr(br_amc5.value, this.value,br_contgs5.value,br_others5.value,br_total5);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs5" name="br_contgs5" placeholder="--" maxlength="6" tabindex="9" value=''
                                     onblur="javascript:addTotalBr(br_amc5.value, br_internet5.value,this.value,br_others5.value,br_total5);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others5" name="br_others5" placeholder="--" maxlength="6" tabindex="10" value=''
                                     onblur="javascript:addTotalBr(br_amc5.value, br_internet5.value,br_contgs5.value,this.value,br_total5);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total5" name="br_total5" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        </div>
                    
                    <div style="width: 500px;" align='center' id="BangaloreTable">
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Manglore</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc6" name="br_amc6" placeholder="--" maxlength="6" tabindex="6" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet6.value,br_contgs6.value,br_others6.value,br_total6);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet6" type="text" name="br_internet6" placeholder="--" maxlength="6" tabindex="7" value=''
                                     onblur="javascript:addTotalBr(br_amc6.value, this.value,br_contgs6.value,br_others6.value,br_total6);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs6" name="br_contgs6" placeholder="--" maxlength="6" tabindex="8" value=''
                                     onblur="javascript:addTotalBr(br_amc6.value, br_internet6.value,this.value,br_others6.value,br_total6);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others6" name="br_others6" placeholder="--" maxlength="6" tabindex="9" value=''
                                     onblur="javascript:addTotalBr(br_amc6.value, br_internet6.value,br_contgs6.value,this.value,br_total6);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total6" name="br_total6" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        </div>
                    
                    <div style="width: 500px;" align='center' id="MumbaiTable">
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Aurangabad</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc27" name="br_amc27" placeholder="--" maxlength="6" tabindex="6" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet27.value,br_contgs27.value,br_others27.value,br_total27);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet27" type="text" name="br_internet27" placeholder="--" maxlength="6" tabindex="7" value=''
                                     onblur="javascript:addTotalBr(br_amc27.value, this.value,br_contgs27.value,br_others27.value,br_total27);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs27" name="br_contgs27" placeholder="--" maxlength="6" tabindex="8" value=''
                                     onblur="javascript:addTotalBr(br_amc27.value, br_internet27.value,this.value,br_others27.value,br_total27);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others27" name="br_others27" placeholder="--" maxlength="6" tabindex="9" value=''
                                     onblur="javascript:addTotalBr(br_amc27.value, br_internet27.value,br_contgs27.value,this.value,br_total27);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total27" name="br_total27" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        </div>
                    
                    <div style="width: 500px;" align='center' id="KolkataTable">
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Durgapur</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc23" name="br_amc23" placeholder="--" maxlength="6" tabindex="6" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet23.value,br_contgs23.value,br_others23.value,br_total23);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet23" type="text" name="br_internet23" placeholder="--" maxlength="6" tabindex="7" value=''
                                     onblur="javascript:addTotalBr(br_amc23.value, this.value,br_contgs23.value,br_others23.value,br_total23);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs23" name="br_contgs23" placeholder="--" maxlength="6" tabindex="8" value=''
                                     onblur="javascript:addTotalBr(br_amc23.value, br_internet23.value,this.value,br_others23.value,br_total23);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others23" name="br_others23" placeholder="--" maxlength="6" tabindex="9" value=''
                                     onblur="javascript:addTotalBr(br_amc23.value, br_internet23.value,br_contgs23.value,this.value,br_total23);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total23" name="br_total23" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Siliguri</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc24" name="br_amc24" placeholder="--" maxlength="6" tabindex="10" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet24.value,br_contgs24.value,br_others24.value,br_total24);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet24" type="text" name="br_internet24" placeholder="--" maxlength="6" tabindex="11" value=''
                                     onblur="javascript:addTotalBr(br_amc24.value, this.value,br_contgs24.value,br_others24.value,br_total24);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs24" name="br_contgs24" placeholder="--" maxlength="6" tabindex="12" value=''
                                     onblur="javascript:addTotalBr(br_amc24.value, br_internet24.value,this.value,br_others24.value,br_total24);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others24" name="br_others24" placeholder="--" maxlength="6" tabindex="13" value=''
                                     onblur="javascript:addTotalBr(br_amc24.value, br_internet24.value,br_contgs24.value,this.value,br_total24);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total24" name="br_total24" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Suri</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc25" name="br_amc25" placeholder="--" maxlength="6" tabindex="14" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet25.value,br_contgs25.value,br_others25.value,br_total25);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet25" type="text" name="br_internet25" placeholder="--" maxlength="6" tabindex="15" value=''
                                     onblur="javascript:addTotalBr(br_amc25.value, this.value,br_contgs25.value,br_others25.value,br_total25);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs25" name="br_contgs25" placeholder="--" maxlength="6" tabindex="16" value=''
                                     onblur="javascript:addTotalBr(br_amc25.value, br_internet25.value,this.value,br_others25.value,br_total25);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others25" name="br_others25" placeholder="--" maxlength="6" tabindex="17" value=''
                                     onblur="javascript:addTotalBr(br_amc25.value, br_internet25.value,br_contgs25.value,this.value,br_total25);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total25" name="br_total25" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Port Blair</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc26" name="br_amc26" placeholder="--" maxlength="6" tabindex="18" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet26.value,br_contgs26.value,br_others26.value,br_total26);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet26" type="text" name="br_internet26" placeholder="--" maxlength="6" tabindex="19" value=''
                                     onblur="javascript:addTotalBr(br_amc26.value, this.value,br_contgs26.value,br_others26.value,br_total26);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs26" name="br_contgs26" placeholder="--" maxlength="6" tabindex="20" value=''
                                     onblur="javascript:addTotalBr(br_amc26.value, br_internet26.value,this.value,br_others26.value,br_total26);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others26" name="br_others26" placeholder="--" maxlength="6" tabindex="21" value=''
                                     onblur="javascript:addTotalBr(br_amc26.value, br_internet26.value,br_contgs26.value,this.value,br_total26);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total26" name="br_total26" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        </div>
                    
                    <div style="width: 500px;" align='center' id="CuttackTable">
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Rayagada</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc9" name="br_amc9" placeholder="--" maxlength="6" tabindex="6" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet9.value,br_contgs9.value,br_others9.value,br_total9);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet9" type="text" name="br_internet9" placeholder="--" maxlength="6" tabindex="7" value=''
                                     onblur="javascript:addTotalBr(br_amc9.value, this.value,br_contgs9.value,br_others9.value,br_total9);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs9" name="br_contgs9" placeholder="--" maxlength="6" tabindex="8" value=''
                                     onblur="javascript:addTotalBr(br_amc9.value, br_internet9.value,this.value,br_others9.value,br_total9);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others9" name="br_others9" placeholder="--" maxlength="6" tabindex="9" value=''
                                     onblur="javascript:addTotalBr(br_amc9.value, br_internet9.value,br_contgs9.value,this.value,br_total9);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total9" name="br_total9" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Rourkela</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc10" name="br_amc10" placeholder="--" maxlength="6" tabindex="10" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet10.value,br_contgs10.value,br_others10.value,br_total10);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet10" type="text" name="br_internet10" placeholder="--" maxlength="6" tabindex="11" value=''
                                     onblur="javascript:addTotalBr(br_amc10.value, this.value,br_contgs10.value,br_others10.value,br_total10);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs10" name="br_contgs10" placeholder="--" maxlength="6" tabindex="12" value=''
                                     onblur="javascript:addTotalBr(br_amc10.value, br_internet10.value,this.value,br_others10.value,br_total10);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others10" name="br_others10" placeholder="--" maxlength="6" tabindex="13" value=''
                                     onblur="javascript:addTotalBr(br_amc10.value, br_internet10.value,br_contgs10.value,this.value,br_total10);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total10" name="br_total10" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        </div>
                    
                     <div style="width: 500px;" align='center' id="GuwahatiTable">
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Tezpur</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc11" name="br_amc11" placeholder="--" maxlength="6" tabindex="6" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet11.value,br_contgs11.value,br_others11.value,br_total11);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet11" type="text" name="br_internet11" placeholder="--" maxlength="6" tabindex="7" value=''
                                     onblur="javascript:addTotalBr(br_amc11.value, this.value,br_contgs11.value,br_others11.value,br_total11);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs11" name="br_contgs11" placeholder="--" maxlength="6" tabindex="8" value=''
                                     onblur="javascript:addTotalBr(br_amc11.value, br_internet11.value,this.value,br_others11.value,br_total11);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others11" name="br_others11" placeholder="--" maxlength="6" tabindex="9" value=''
                                     onblur="javascript:addTotalBr(br_amc11.value, br_internet11.value,br_contgs11.value,this.value,br_total11);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total11" name="br_total11" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Silchar</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc12" name="br_amc12" placeholder="--" maxlength="6" tabindex="10" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet12.value,br_contgs12.value,br_others12.value,br_total12);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet12" type="text" name="br_internet12" placeholder="--" maxlength="6" tabindex="11" value=''
                                     onblur="javascript:addTotalBr(br_amc12.value, this.value,br_contgs12.value,br_others12.value,br_total12);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs12" name="br_contgs12" placeholder="--" maxlength="6" tabindex="12" value=''
                                     onblur="javascript:addTotalBr(br_amc12.value, br_internet12.value,this.value,br_others12.value,br_total12);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others12" name="br_others12" placeholder="--" maxlength="6" tabindex="13" value=''
                                     onblur="javascript:addTotalBr(br_amc12.value, br_internet12.value,br_contgs12.value,this.value,br_total12);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total12" name="br_total12" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Diphu</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc13" name="br_amc13" placeholder="--" maxlength="6" tabindex="14" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet13.value,br_contgs13.value,br_others13.value,br_total13);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet13" type="text" name="br_internet13" placeholder="--" maxlength="6" tabindex="15" value=''
                                     onblur="javascript:addTotalBr(br_amc13.value, this.value,br_contgs13.value,br_others13.value,br_total13);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs13" name="br_contgs13" placeholder="--" maxlength="6" tabindex="16" value=''
                                     onblur="javascript:addTotalBr(br_amc13.value, br_internet13.value,this.value,br_others13.value,br_total13);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others13" name="br_others13" placeholder="--" maxlength="6" tabindex="17" value=''
                                     onblur="javascript:addTotalBr(br_amc13.value, br_internet13.value,br_contgs13.value,this.value,br_total13);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total13" name="br_total13" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Shilong</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc14" name="br_amc14" placeholder="--" maxlength="6" tabindex="18" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet14.value,br_contgs14.value,br_others14.value,br_total14);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet14" type="text" name="br_internet14" placeholder="--" maxlength="6" tabindex="19" value=''
                                     onblur="javascript:addTotalBr(br_amc14.value, this.value,br_contgs14.value,br_others14.value,br_total14);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs14" name="br_contgs14" placeholder="--" maxlength="6" tabindex="20" value=''
                                     onblur="javascript:addTotalBr(br_amc14.value, br_internet14.value,this.value,br_others14.value,br_total14);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others14" name="br_others14" placeholder="--" maxlength="6" tabindex="21" value=''
                                     onblur="javascript:addTotalBr(br_amc14.value, br_internet14.value,br_contgs14.value,this.value,br_total14);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total14" name="br_total14" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Tura</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc15" name="br_amc15" placeholder="--" maxlength="6" tabindex="22" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet15.value,br_contgs15.value,br_others15.value,br_total15);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet15" type="text" name="br_internet15" placeholder="--" maxlength="6" tabindex="23" value=''
                                     onblur="javascript:addTotalBr(br_amc15.value, this.value,br_contgs15.value,br_others15.value,br_total15);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs15" name="br_contgs15" placeholder="--" maxlength="6" tabindex="24" value=''
                                     onblur="javascript:addTotalBr(br_amc15.value, br_internet15.value,this.value,br_others15.value,br_total15);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others15" name="br_others15" placeholder="--" maxlength="6" tabindex="25" value=''
                                     onblur="javascript:addTotalBr(br_amc15.value, br_internet15.value,br_contgs15.value,this.value,br_total15);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total15" name="br_total15" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Itanagar</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc16" name="br_amc16" placeholder="--" maxlength="6" tabindex="26" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet16.value,br_contgs16.value,br_others16.value,br_total16);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet16" type="text" name="br_internet16" placeholder="--" maxlength="6" tabindex="27" value=''
                                     onblur="javascript:addTotalBr(br_amc16.value, this.value,br_contgs16.value,br_others16.value,br_total16);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs16" name="br_contgs16" placeholder="--" maxlength="6" tabindex="28" value=''
                                     onblur="javascript:addTotalBr(br_amc16.value, br_internet16.value,this.value,br_others16.value,br_total16);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others16" name="br_others16" placeholder="--" maxlength="6" tabindex="29" value=''
                                     onblur="javascript:addTotalBr(br_amc16.value, br_internet16.value,br_contgs16.value,this.value,br_total16);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total16" name="br_total16" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        </div>
                    
                    <div style="width: 500px;" align='center' id="HubliTable">
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Gulbarga</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc17" name="br_amc17" placeholder="--" maxlength="6" tabindex="6" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet17.value,br_contgs17.value,br_others17.value,br_total17);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet17" type="text" name="br_internet17" placeholder="--" maxlength="6" tabindex="7" value=''
                                     onblur="javascript:addTotalBr(br_amc17.value, this.value,br_contgs17.value,br_others17.value,br_total17);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs17" name="br_contgs17" placeholder="--" maxlength="6" tabindex="8" value=''
                                     onblur="javascript:addTotalBr(br_amc17.value, br_internet17.value,this.value,br_others17.value,br_total17);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others17" name="br_others17" placeholder="--" maxlength="6" tabindex="9" value=''
                                     onblur="javascript:addTotalBr(br_amc17.value, br_internet17.value,br_contgs17.value,this.value,br_total17);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total17" name="br_total17" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                       </div>
                    
                     <div style="width: 500px;" align='center' id="HyderabadTable">
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Visakhapatnam</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc18" name="br_amc18" placeholder="--" maxlength="6" tabindex="6" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet18.value,br_contgs18.value,br_others18.value,br_total18);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet18" type="text" name="br_internet18" placeholder="--" maxlength="6" tabindex="7" value=''
                                     onblur="javascript:addTotalBr(br_amc18.value, this.value,br_contgs18.value,br_others18.value,br_total18);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs18" name="br_contgs18" placeholder="--" maxlength="6" tabindex="8" value=''
                                     onblur="javascript:addTotalBr(br_amc18.value, br_internet18.value,this.value,br_others18.value,br_total18);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others18" name="br_others18" placeholder="--" maxlength="6" tabindex="9" value=''
                                     onblur="javascript:addTotalBr(br_amc18.value, br_internet18.value,br_contgs18.value,this.value,br_total18);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total18" name="br_total18" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                       </div>
                    
                    <div style="width: 500px;" align='center' id="IndoreTable">
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Gwalior</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc20" name="br_amc20" placeholder="--" maxlength="6" tabindex="6" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet20.value,br_contgs20.value,br_others20.value,br_total20);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet20" type="text" name="br_internet20" placeholder="--" maxlength="20" tabindex="7" value=''
                                     onblur="javascript:addTotalBr(br_amc20.value, this.value,br_contgs20.value,br_others20.value,br_total20);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs20" name="br_contgs20" placeholder="--" maxlength="6" tabindex="8" value=''
                                     onblur="javascript:addTotalBr(br_amc20.value, br_internet20.value,this.value,br_others20.value,br_total20);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others20" name="br_others20" placeholder="--" maxlength="6" tabindex="9" value=''
                                     onblur="javascript:addTotalBr(br_amc20.value, br_internet20.value,br_contgs20.value,this.value,br_total20);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total20" name="br_total20" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Rewa</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc21" name="br_amc21" placeholder="--" maxlength="6" tabindex="10" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet21.value,br_contgs21.value,br_others21.value,br_total21);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet21" type="text" name="br_internet21" placeholder="--" maxlength="6" tabindex="11" value=''
                                     onblur="javascript:addTotalBr(br_amc21.value, this.value,br_contgs21.value,br_others21.value,br_total21);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs21" name="br_contgs21" placeholder="--" maxlength="6" tabindex="12" value=''
                                     onblur="javascript:addTotalBr(br_amc21.value, br_internet21.value,this.value,br_others21.value,br_total21);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others21" name="br_others21" placeholder="--" maxlength="6" tabindex="13" value=''
                                     onblur="javascript:addTotalBr(br_amc21.value, br_internet21.value,br_contgs21.value,this.value,br_total21);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total21" name="br_total21" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        </div>
                    
                    <div style="width: 500px;" align='center' id="ImphalTable">
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Dimapur</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc19" name="br_amc19" placeholder="--" maxlength="6" tabindex="6" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet19.value,br_contgs19.value,br_others19.value,br_total19);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet19" type="text" name="br_internet19" placeholder="--" maxlength="6" tabindex="7" value=''
                                     onblur="javascript:addTotalBr(br_amc19.value, this.value,br_contgs19.value,br_others19.value,br_total19);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs19" name="br_contgs19" placeholder="--" maxlength="6" tabindex="8" value=''
                                     onblur="javascript:addTotalBr(br_amc19.value, br_internet19.value,this.value,br_others19.value,br_total19);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others19" name="br_others19" placeholder="--" maxlength="6" tabindex="9" value=''
                                     onblur="javascript:addTotalBr(br_amc19.value, br_internet19.value,br_contgs19.value,this.value,br_total19);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total19" name="br_total19" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                       </div>
                    
                    <div style="width: 500px;" align='center' id="KarnalTable">
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Bhiwani</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc1" name="br_amc1" placeholder="--" maxlength="6" tabindex="6" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet1.value,br_contgs1.value,br_others1.value,br_total1);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet1" type="text" name="br_internet1" placeholder="--" maxlength="6" tabindex="7" value=''
                                     onblur="javascript:addTotalBr(br_amc1.value, this.value,br_contgs1.value,br_others1.value,br_total1);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs1" name="br_contgs1" placeholder="--" maxlength="6" tabindex="8" value=''
                                     onblur="javascript:addTotalBr(br_amc1.value, br_internet1.value,this.value,br_others1.value,br_total1);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others1" name="br_others1" placeholder="--" maxlength="6" tabindex="9" value=''
                                     onblur="javascript:addTotalBr(br_amc1.value, br_internet1.value,br_contgs1.value,this.value,br_total1);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total1" name="br_total1" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                       </div>
                    
                    <div style="width: 500px;" align='center' id="ChennaiTable">
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Coimbatore</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc7" name="br_amc7" placeholder="--" maxlength="6" tabindex="6" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet7.value,br_contgs7.value,br_others7.value,br_total7);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet7" type="text" name="br_internet7" placeholder="--" maxlength="7" tabindex="7" value=''
                                     onblur="javascript:addTotalBr(br_amc7.value, this.value,br_contgs7.value,br_others7.value,br_total7);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs7" name="br_contgs7" placeholder="--" maxlength="6" tabindex="8" value=''
                                     onblur="javascript:addTotalBr(br_amc7.value, br_internet7.value,this.value,br_others7.value,br_total7);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others7" name="br_others7" placeholder="--" maxlength="6" tabindex="9" value=''
                                     onblur="javascript:addTotalBr(br_amc7.value, br_internet7.value,br_contgs7.value,this.value,br_total7);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total7" name="br_total7" type="text" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Tuticorin</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc8" name="br_amc8" placeholder="--" maxlength="6" tabindex="10" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet8.value,br_contgs8.value,br_others8.value,br_total8);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet8" type="text" name="br_internet8" placeholder="--" maxlength="6" tabindex="11" value=''
                                     onblur="javascript:addTotalBr(br_amc8.value, this.value,br_contgs8.value,br_others8.value,br_total8);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs8" name="br_contgs8" placeholder="--" maxlength="6" tabindex="12" value=''
                                     onblur="javascript:addTotalBr(br_amc8.value, br_internet8.value,this.value,br_others8.value,br_total8);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others8" name="br_others8" placeholder="--" maxlength="6" tabindex="13" value=''
                                     onblur="javascript:addTotalBr(br_amc8.value, br_internet8.value,br_contgs8.value,this.value,br_total8);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total8" name="br_total8" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                        </div>
                    
                     <div style="width: 500px;" align='center' id="RanchiTable">
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Dhanbad</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc28" name="br_amc28" placeholder="--" maxlength="6" tabindex="6" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet28.value,br_contgs28.value,br_others28.value,br_total28);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet28" type="text" name="br_internet28" placeholder="--" maxlength="6" tabindex="7" value=''
                                     onblur="javascript:addTotalBr(br_amc28.value, this.value,br_contgs28.value,br_others28.value,br_total28);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs28" name="br_contgs28" placeholder="--" maxlength="6" tabindex="8" value=''
                                     onblur="javascript:addTotalBr(br_amc28.value, br_internet28.value,this.value,br_others28.value,br_total28);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others28" name="br_others28" placeholder="--" maxlength="6" tabindex="9" value=''
                                     onblur="javascript:addTotalBr(br_amc28.value, br_internet28.value,br_contgs28.value,this.value,br_total28);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total28" name="br_total28" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                       </div>
                    
                    <div style="width: 500px;" align='center' id="JammuTable">
                        <h2 id="heading">Sanction Amount for <strong>Branch MSME-DI Jammu Tawi</strong></h2>
                       <table style="width: 100%;">
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >AMC</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_amc22" name="br_amc22" placeholder="--" maxlength="6" tabindex="6" value=''
                                     onblur="javascript:addTotalBr(this.value,br_internet22.value,br_contgs22.value,br_others22.value,br_total22);"/>
                                </td>
                            </tr>
                            <tr >
                                <td class="lebel-data">
                                    <lebel >Internet</lebel>
                                </td>
                                <td align='center'>  
                                    <input class="SanctionData" id="br_internet22" type="text" name="br_internet22" placeholder="--" maxlength="6" tabindex="7" value=''
                                     onblur="javascript:addTotalBr(br_amc22.value, this.value,br_contgs22.value,br_others22.value,br_total22);"/>
                                </td>
                            </tr>
                            <tr style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Contgs.</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_contgs22" name="br_contgs22" placeholder="--" maxlength="6" tabindex="8" value=''
                                     onblur="javascript:addTotalBr(br_amc22.value, br_internet22.value,this.value,br_others22.value,br_total22);"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="lebel-data">
                                    <lebel >Other Items</lebel>
                                </td>
                                <td align='center'> 
                                    <input type="text" class="SanctionData" id="br_others22" name="br_others22" placeholder="--" maxlength="6" tabindex="9" value=''
                                     onblur="javascript:addTotalBr(br_amc22.value, br_internet22.value,br_contgs22.value,this.value,br_total22);"/>
                                </td>
                            </tr>
                            <tr  style="background: #f3f9f0 ">
                                <td class="lebel-data">
                                    <lebel >Total Sanction Amount</lebel>
                                </td>
                                <td align='center'> 
                                    <input class="SanctionData" id="br_total22" name="br_total22" type="text" name="contgs" placeholder="--" readonly="2"/>
                                </td>
                            </tr>
                         </table>
                       </div>
                        
                </td>
                
            </tr>
            <tr >
                <td>
                            <div  style="background: #f3f9f0" align='center' style="width: 500px; ">
                            <%--    <input type="button" id="btn" onclick="myFunction()" value="Reset">  --%>
                                <input type="submit" id="FormSubmit" class="FormSubmit" tabindex="85" name="FormSubmit" value="Submit"/>
                            </div>
                        
                </td>
            </tr>
            </table>
                    </form> 
                    <script src="UploadSanctionAmountMain.js"></script>
                    
<%	
} else {
    response.sendRedirect("/senet/stat.jsp");
}


 %>
    </body>
</html>
