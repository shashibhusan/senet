<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*,java.util.*;" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>ISO Report</title>
        <link href="inc.css" rel="stylesheet" type="text/css"></link>
    </head>
    <%
   String MsmeArray[]={"MSME-DI  Gangtok (Sikkim)",
"MSME-DI  Karnal (Haryana)",
"MSME-DI  Muzaffarpur (Bihar)",
"MSME-DI  New Delhi (New Delhi)",
"MSME-DI  Patna (Bihar)",
"MSME-DI  Solan (H.P.)",
"MSME-DI Agartala (Tripura)",
"MSME-DI Agra (UP) ",
"MSME-DI Ahmedabad (Gujarat)",
"MSME-DI Allahabad (UP)",
"MSME-DI Bangalore (Karnataka)",
"MSME-DI Chennai (Tamil Nadu)",
"MSME-DI Cuttack (Orissa)",
"MSME-DI Guwahati (Assam)",
"MSME-DI Haldwani (Uttranchal)",
"MSME-DI Hubli (Karnataka)",
"MSME-DI Hyderabad (A.P.)",
"MSME-DI Imphal (Manipur)",
"MSME-DI Indore (M.P.)",
"MSME-DI Jaipur (Rajasthan)",
"MSME-DI Jammu (J & K)",
"MSME-DI Kanpur (U.P.)",
"MSME-DI Kolkatta(West Bengal)",
"MSME-DI Ludhiana (Punjab)",
"MSME-DI Margoa (Goa)",
"MSME-DI Mumbai (Maharashtra)",
"MSME-DI Nagpur (Maharashtra)",
"MSME-DI Raipur (Chattisgarh)",
"MSME-DI Ranchi (Jharkhand)",
"MSME-DI Thrissur (Kerala)"};
    
                String mon = "";
                String ReportDes = "";
                String years = request.getParameter("cmbYear");
                int months = Integer.parseInt(request.getParameter("cmbMonth"));
                String ReportType = request.getParameter("report");
                if (ReportType.equals("monthly")) {
                    ReportDes = "OF";
                } else {
                    ReportDes = "UP TO ";
                }
                String general = request.getParameter("general");
                String generalFix = "GENERAL";
                String scsp = request.getParameter("scsp");
                String scspFix = "SCSP";
                String tsp = request.getParameter("tsp");
                String tspFix = "TSP";
                String women = request.getParameter("women");
                String womenFix = "WOMEN";
                ResultSet resultsetGeneral = null;
                ResultSet resultsetScsp = null;
                ResultSet resultsetTsp = null;
                ResultSet resultsetWomen = null;
                ResultSet sanctioned = null;

                try {
                    Connection con = ConnectionManager.getConnectionDirectForMySQL();
                    Statement stmt = (Statement) con.createStatement();
                    Statement stmt1 = (Statement) con.createStatement();
                    Statement stmt2 = (Statement) con.createStatement();
                    Statement stmt3 = (Statement) con.createStatement();
                    Statement stmt4 = (Statement) con.createStatement();
                    Statement stmt5 = (Statement) con.createStatement();
                    String strsql2 = "select * from tbl_month where months='" + months + "'";
                    System.out.println("months" + strsql2);
                    ResultSet rs_month = stmt4.executeQuery(strsql2);
                    if (rs_month.next()) {
                        mon = rs_month.getString("mon");
                    }

    %>
    <body bgcolor="#FBFBFB">
 
        <div style="font-size:large;font-family:Verdana;font-weight:bold;  " align="center" ><font color="#990033">MONTHLY PROGRESS REPORT OF ISO 9000/14001/HACCP CERTIFICATION REIBURSEMENT SCHEME <%=ReportDes%> MONTH <%=mon%> , Year <%=years%></font></div>
        <br/>
        <center>
            
            <table border="1" cellspacing="1" cellpadding="1" width="100%">
  <tr style=" background:#1f62a9; color:#ffffff; " >
      
    <td width="50px">
        
        <div >
                            <center> <font>S.No </font> </center>
                        </div>
    </td>
    <td  >

        <center> <font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSME-DIs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font> </center>


    </td>
      <% if (general != null) { %>
    <td width="300px">
        <table width="100%" style="height: 100%;"  border="1">
                            <tr>
                                <td colspan="4"  align="center" class="tableheader" id="general">GENERAL </td>

                            </tr>
                            <tr>
                                <%--           <td width="30" align="center" class="tableheader" id="general">No of Application Received </td>  --%>
                                <td width="30" align="center" class="tableheader" id="general">No of Application Disbursed </td>
                                <td width="30" align="center" class="tableheader" id="general">Amount Disbursed </td>
                                <%--    <td width="30" align="center" class="tableheader" id="bal1">Balance Amount</td>   --%>
                            </tr>
    </table>
    </td>
      <%} %>
      <% if (scsp != null) { %>
    <td width="300px">

     <table  width="100%" style="height: 100%;" border="1">
                            <tr>
                                <td colspan="4"  align="center" class="tableheader" id="general">SCSP</td>

                            </tr>
                            <tr>
                                <%--          <td width="30" align="center" class="tableheader" id="general">No of Application Received </td>   --%>
                                <td width="30" align="center" class="tableheader" id="general">No of Application Disbursed </td>
                                <td width="30" align="center" class="tableheader" id="general">Amount Disbursed </td>
                                <%--         <td width="30" align="center" class="tableheader" id="bal1">Balance Amount</td>   --%>
                            </tr>
    </table>

    </td>
    <% } %>
    <% if (tsp != null) { %>
    <td width="300px">

     <table width="100%" style="height: 100%;"  border="1">
                            <tr>
                                <td colspan="4"  align="center" class="tableheader" id="general">TSP</td>

                            </tr>
                            <tr>
                                <%--       <td width="30" align="center" class="tableheader" id="general">No of Application Received </td>   --%>
                                <td width="30" align="center" class="tableheader" id="general">No of Application Disbursed </td>
                                <td width="30" align="center" class="tableheader" id="general">Amount Disbursed </td>
                                <%--    <td width="30" align="center" class="tableheader" id="bal1">Balance Amount</td>   --%>
                            </tr>
    </table>
    </td>
    <% } %>
    <%--  <% if (women != null) { %>
    <td width="300px">

     <table  width="100%" style="height: 100%;" border="1">
                            <tr>
                                <td colspan="3"  align="center" class="tableheader" id="general">WOMEN</td>

                            </tr>
                            <tr>
                                <td width="30" align="center" class="tableheader" id="general">No of Application Received </td>
                                <td width="30" align="center" class="tableheader" id="general">No of Application Disbursed </td>
                                <td width="30" align="center" class="tableheader" id="general">Amount Disbursed </td>
                            </tr>
    </table>

    </td>
<% } %>   --%>
    <td width="150px" >
        <center> <font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Remark&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font> </center>

    </td>
  </tr>
  <%
  int generalSanctionTotal=0,scspSanctionTotal=0,tspSanctionTotal=0;
  int Totalc1=0,Totalc2=0,Totalc3=0,Totalc4=0,Totalc5=0,Totalc6=0,Totalc7=0,Totalc8=0,Totalc9=0,Totalc10=0,Totalc11=0,Totalc12=0;
  for(int d=0;d<30;d++)
      {
         int generalSanction=0,scspSanction=0,tspSanction=0;
         
         int c1=0,c2=0,c3=0,c4=0,c5=0,c6=0,c7=0,c8=0,c9=0,c10=0,c11=0,c12=0;
         
      // For monthy Report Start
      if (ReportType.equals("monthly")) {
                        String generalQuery = "select  c2,c3,c4 from ISO_DATA1 where years='" + years + "' and months=" + months + " and name_program='" + generalFix + "' and institute_name='" + MsmeArray[d] + "'";
                        String scspQuery = "select   c2,c3,c4  from ISO_DATA1 where years='" + years + "' and months=" + months + " and name_program='" + scspFix + "' and institute_name='" + MsmeArray[d] + "'";
                        String tspQuery = "select   c2,c3,c4  from ISO_DATA1 where years='" + years + "' and months=" + months + " and name_program='" + tspFix + "' and institute_name='" + MsmeArray[d] + "'";
                        String womenQuery = "select  c2,c3,c4 from ISO_DATA1 where years='" + years + "' and months=" + months + " and name_program='" + womenFix + "' and institute_name='" + MsmeArray[d] + "'";
                        String Sanction="select general, scsp, tsp  from ISO_TARGET where years='" + years + "' and institute='" + MsmeArray[d] + "'";


                      //   System.out.println("generalQuery   "+generalQuery);
                       //  System.out.println("scspQuery   "+scspQuery);
                        // System.out.println("tspQuery   "+tspQuery);
                      //   System.out.println("womenQuery   "+womenQuery);
                      //   System.out.println("Sanction    "+Sanction);

                        resultsetGeneral = stmt.executeQuery(generalQuery);

                         while(resultsetGeneral.next())
                            {
                            c1= resultsetGeneral.getInt("c2");
                            Totalc1=Totalc1+c1;
                            c2= resultsetGeneral.getInt("c3");
                            Totalc2=Totalc2+c2;
                            c3= resultsetGeneral.getInt("c4");
                            Totalc3=Totalc3+c3;
                            }

                        resultsetScsp = stmt1.executeQuery(scspQuery);

                         while(resultsetScsp.next())
                            {
                            c4= resultsetScsp.getInt("c2");
                            Totalc4=Totalc4+c4;
                            c5= resultsetScsp.getInt("c3");
                            Totalc5=Totalc5+c5;
                            c6= resultsetScsp.getInt("c4");
                             Totalc6=Totalc6+c6;
                            }

                        resultsetTsp = stmt2.executeQuery(tspQuery);
                         while(resultsetTsp.next())
                            {
                            c7= resultsetTsp.getInt("c2");
                             Totalc7=Totalc7+c7;
                            c8= resultsetTsp.getInt("c3");
                             Totalc8=Totalc8+c8;
                            c9= resultsetTsp.getInt("c4");
                             Totalc9=Totalc9+c9;
                            }
                        resultsetWomen = stmt3.executeQuery(womenQuery);

                         while(resultsetWomen.next())
                            {
                            c10= resultsetWomen.getInt("c2");
                             Totalc10=Totalc10+c10;
                            c11= resultsetWomen.getInt("c3");
                             Totalc11=Totalc11+c11;
                            c12= resultsetWomen.getInt("c4");
                             Totalc12=Totalc12+c12;
                            }

                        sanctioned=stmt5.executeQuery(Sanction);

                        while(sanctioned.next())
                            {
                            generalSanction=Integer.parseInt(sanctioned.getString("general"));
                            generalSanctionTotal=generalSanctionTotal+generalSanction;
                            scspSanction=Integer.parseInt(sanctioned.getString("scsp"));
                            scspSanctionTotal=scspSanctionTotal+scspSanction;
                            tspSanction=Integer.parseInt(sanctioned.getString("tsp"));
                            tspSanctionTotal=tspSanctionTotal+tspSanction;

                            }

                    }
      // For monthy Report End

      // For cummulative start

      if (ReportType.equals("cumulative")) {
                        System.out.println("In cumulative report section");

                        String generalQuery = "select  sum(c2) as c5,sum(c3) as c6, sum(c4) as c7 from ISO_DATA1  where years='" + years + "' and months<=" + months + " and name_program='" + generalFix + "' and institute_name='" + MsmeArray[d] + "'";
                        String scspQuery = "select  sum(c2) as c5,sum(c3) as c6, sum(c4) as c7 from ISO_DATA1 where years='" + years + "' and months<=" + months + " and name_program='" + scspFix + "' and institute_name='" + MsmeArray[d] + "'";
                        String tspQuery = "select sum(c2) as c5,sum(c3) as c6, sum(c4) as c7 from ISO_DATA1 where years='" + years + "' and months<=" + months + " and name_program='" + tspFix + "' and institute_name='" + MsmeArray[d] + "'";
                        String womenQuery = "select sum(c2) as c5,sum(c3) as c6, sum(c4) as c7 from ISO_DATA1 where years='" + years + "' and months<=" + months + " and name_program='" + womenFix + "' and institute_name='" + MsmeArray[d] + "'";
                        String Sanction="select general, scsp, tsp  from ISO_TARGET where years='" + years + "' and institute='" + MsmeArray[d] + "'";

                      //   System.out.println("generalQuery   "+generalQuery);
                     //    System.out.println("scspQuery   "+scspQuery);
                     //    System.out.println("tspQuery   "+tspQuery);
                      //   System.out.println("womenQuery   "+womenQuery);
                       //  System.out.println("Sanction    "+Sanction);
                         resultsetGeneral = stmt.executeQuery(generalQuery);

                         while(resultsetGeneral.next())
                            {
                            c1= resultsetGeneral.getInt("c5");
                             Totalc1=Totalc1+c1;
                           //  System.out.println("Totalc1"+"   "+Totalc1+"  "+"c1"+"  "+c1+"="+(Totalc1+c1)+"for"+"  "+MsmeArray[d]);
                            c2= resultsetGeneral.getInt("c6");
                             Totalc2=Totalc2+c2;
                            c3= resultsetGeneral.getInt("c7");
                             Totalc3=Totalc3+c3;
                            }

                        resultsetScsp = stmt1.executeQuery(scspQuery);

                         while(resultsetScsp.next())
                            {
                            c4= resultsetScsp.getInt("c5");
                             Totalc4=Totalc4+c4;
                            c5= resultsetScsp.getInt("c6");
                             Totalc5=Totalc5+c5;
                            c6= resultsetScsp.getInt("c7");
                             Totalc6=Totalc6+c6;
                            }

                        resultsetTsp = stmt2.executeQuery(tspQuery);
                         while(resultsetTsp.next())
                            {
                            c7= resultsetTsp.getInt("c5");
                             Totalc7=Totalc7+c7;
                            c8= resultsetTsp.getInt("c6");
                             Totalc8=Totalc8+c8;
                            c9= resultsetTsp.getInt("c7");
                             Totalc9=Totalc9+c9;
                            }
                        resultsetWomen = stmt3.executeQuery(womenQuery);

                         while(resultsetWomen.next())
                            {
                            c10= resultsetWomen.getInt("c5");
                             Totalc10=Totalc10+c10;
                            c11= resultsetWomen.getInt("c6");
                             Totalc11=Totalc11+c11;
                            c12= resultsetWomen.getInt("c7");
                             Totalc12=Totalc12+c12;
                            }

                         sanctioned=stmt5.executeQuery(Sanction);

                         while(sanctioned.next())
                            {
                            generalSanction=Integer.parseInt(sanctioned.getString("general"));
                            generalSanctionTotal=generalSanctionTotal+generalSanction;
                            scspSanction=Integer.parseInt(sanctioned.getString("scsp"));
                             scspSanctionTotal=scspSanctionTotal+scspSanction;
                            tspSanction=Integer.parseInt(sanctioned.getString("tsp"));
                            tspSanctionTotal=tspSanctionTotal+tspSanction;
                            }


                    }


      // For cummulative ends
         

  %>
     <tr>
          

        <td class="tablecontent11">

            <%=d+1%>

        </td>
        <td class="tablecontent11">

            <%=MsmeArray[d]%>
        </td>
         <% if (general != null) {%>
        <td>
            <table width="100%">
           <tr>
               <%--    <td  class="tablecontent11" width="25%" align="center"> <%=c1 %> </td>   --%>
                <td  class="tablecontent11"  width="25%" align="center"> <%=c2 %> </td>
                <td  class="tablecontent11"  width="25%" align="center"> <%=c3 %> </td>
                <%--       <td  class="tablecontent11"  width="25%" align="center"> <%=(generalSanction-(c3+c12))%></td>   --%>
            </tr>
         </table>
        </td>
            <% } %>
            <% if (scsp != null) { %>
        <td>

            <table width="100%">
           <tr>
               <%--        <td  class="tablecontent11" width="25%" align="center"> <%=c4 %> </td>   --%>
                <td  class="tablecontent11"  width="25%" align="center"> <%=c5 %> </td>
                <td  class="tablecontent11"  width="25%" align="center"> <%=c6 %> </td>
                <%--    <td  class="tablecontent11"  width="25%" align="center" > <%=(scspSanction-c6)%> </td>   --%>
            </tr>
         </table>
        </td>
            <% } %>
             <% if (tsp != null) { %>
        <td>

           <table width="100%">
           <tr>
               <%--     <td  class="tablecontent11" width="25%" align="center"> <%=c7 %> </td>   --%>
                <td  class="tablecontent11"  width="25%" align="center"> <%=c8 %> </td>
                <td  class="tablecontent11"  width="25%" align="center"> <%=c9 %> </td>
                <%--   <td  class="tablecontent11"  width="25%" align="center"><%=(tspSanction-c9)%></td>  --%>
            </tr>
         </table>

        </td>
            <% } %>
            <%--       <% if (women != null) { %>
        <td>

           <table width="100%">
           <tr>
               <td  class="tablecontent11" width="25%" align="center" > <%=c10 %> </td>
                <td  class="tablecontent11"  width="25%" align="center" > <%=c11 %> </td>
                <td  class="tablecontent11"  width="25%" align="center"> <%=c12 %> </td>
            </tr>
         </table>
        </td>
      <% } %>    --%>

     </tr>
               

     <% } %>
      <%-- start of total --%>
                <tr>


        <td class="tablecontent11">



        </td>
        <td class="tablecontent11">

            Total
        </td>
                     <% if (general != null) { %>
        <td>
            <table width="100%">
           <tr>
               <%--  <td  class="tablecontent11" width="25%" align="center"> <%=Totalc1 %> </td>  --%>
<td  class="tablecontent11"  width="25%" align="center"> <%=Totalc2 %> </td>  
                <td  class="tablecontent11"  width="25%" align="center"> <%=Totalc3 %> </td>
                <%--     <td  class="tablecontent11"  width="25%" align="center"> <%=generalSanctionTotal%></td> --%>
            </tr>
         </table>
        </td>
            <% } %>
            <% if (scsp != null) { %>
        <td>

            <table width="100%">
           <tr>
               <%--    <td  class="tablecontent11" width="25%" align="center"> <%=Totalc4 %> </td>  --%>
                 <td  class="tablecontent11"  width="25%" align="center"> <%=Totalc5 %> </td>
                <td  class="tablecontent11"  width="25%" align="center"> <%=Totalc6 %> </td>
                <%--    <td  class="tablecontent11"  width="25%" align="center" > <%=scspSanctionTotal%> </td>  --%>
            </tr>
         </table>
        </td>
            <% } %>
            <% if (tsp != null) { %>
        <td>

           <table width="100%">
           <tr>
               <%--   <td  class="tablecontent11" width="25%" align="center"> <%=Totalc7 %> </td>  --%>
                <td  class="tablecontent11"  width="25%" align="center"> <%=Totalc8 %>5555 </td>
                <td  class="tablecontent11"  width="25%" align="center"> <%=Totalc9 %> 8888</td>
                <%--   <td  class="tablecontent11"  width="25%" align="center"><%=tspSanctionTotal%></td>  --%>
            </tr>
         </table>

        </td>
            <%}%>
            <% if (women != null) { %>
        <td>

           <table width="100%">
           <tr>
               <td  class="tablecontent11" width="25%" align="center" > <%=Totalc10 %> </td>
                <td  class="tablecontent11"  width="25%" align="center" > <%=Totalc11 %> </td>
                <td  class="tablecontent11"  width="25%" align="center"> <%=Totalc12 %> </td>
            </tr>
         </table>
        </td>
<%}%>

     </tr>
                <%-- END of total --%>
</table>
             

        </center>
       
        <div align="center">
            <input name="button2" type="button" onClick="window.print();return false;" value=" Print" />
        </div>
        <% } catch (Exception e) {
                        System.out.println("Following error occurs durring the display of repory : " + e);
                    }%>

    </body>

</html>
