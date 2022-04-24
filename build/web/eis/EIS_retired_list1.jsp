<%-- 
    Document   : EIS_retired_list1
    Created on : 2 Dec, 2019, 10:48:40 AM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, common.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<!DOCTYPE html>
<%@include file="EIS_menu_header.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Retired List</title>
        <style>

            #head
            {
                font: normal normal 15px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 8px;
                background-color:  #afafaf ;
                text-align: left;
            }
            #head1
            {
                font: normal normal 15px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 8px;
                background-color:  #d8d8d8 ;
            }
           table tr td
            {
                border: 1px  #cacaca  solid;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 2px;
            }
            #mytable{
                width: 65%;
            }
            #data{
                width: 60%;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 2px;
            }
            #data1
            {
                width: 29%;
                font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
                padding: 2px;
            }
            #sno{
                width: 9%;
            }
 
#url-table
{
   width: 1050px;
   margin: auto;
   align:center;
   border: 1px  #cacaca  solid;
   min-height: 72vh;
   background-color: #ffffff;
}
a:visited
{
    color: blue ;
}
        </style>
    </head>
    <%
        String Session=(String)session.getAttribute("Session");
        String username=(String)session.getAttribute("username");
        session.setAttribute("username",username);
        session.setAttribute("Session",Session);
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        System.out.println("session value is="+Session);
       
        if(!Session.equals(null))
            {
    %>
    <body bgcolor="#ccc">
        <div id="url-table" align="center">
        <%
            Connection con=null;
            ResultSet rs=null;
            Statement st=null;
           
            
            int rdir=0,rdd=0,raia=0,rad1=0,rad2=0,rinvest=0,ros=0;
            
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date = new Date();
            String current_time=dateFormat.format(date);
            
            DateFormat formatter;
            formatter = new SimpleDateFormat("dd/MM/yyyy");
            
            
            Calendar current_date_format = Calendar.getInstance();
            
                    try{
                        current_date_format.setTime(dateFormat.parse(current_time));
                        }catch(ParseException da)
                        {
                        da.printStackTrace();
                        }
            
            String ret_Date="";
            Date date_temp=null;
            
            int retlist=0;
            int sno=0;
            try
            {
                con=ConnectionManager.getConnectionDirectForMySQL();
                st=con.createStatement();
                String Query="select a.name as name, a.email as email, a.bas_designation as designation, a.bas_descipline as discipline, a.dat_ret as dateOfRetirement from eis_basicinfo a";
                rs=st.executeQuery(Query);
                while(rs.next())
                {
                    sno=sno+1;
                    ret_Date=rs.getString("dateOfRetirement");
                    date_temp = (Date) formatter.parse(ret_Date);
                    
                   // System.out.println(sno+"=date output is"+date_temp+"=="+rs.getString("email"));
                   // try{
                   //     RetDateFormat.setTime(dateFormat.parse(ret_Date));
                   //     }catch(ParseException da)
                   //     {
                    //    da.printStackTrace();
                    //    }
                if(date_temp.before(current_date_format.getTime()) || date_temp.equals(current_date_format.getTime()))
                {
                    retlist=retlist+1;
                  //  System.out.println(retlist+"=="+rs.getString("name")+"=="+rs.getString("email")+"==="+rs.getString("designation"));
                
                    if(rs.getString("designation").equals("AIA"))
                    {
                        
                        raia=raia+1;
                    }
                    else if(rs.getString("designation").equals("Director"))
                    {
                        rdir=rdir+1;
                    }
                    else if(rs.getString("designation").equals("Dy. Director"))
                        {
                        rdd=rdd+1;
                    }
                    else if(rs.getString("designation").equals("Asstt. Director Grade-I"))
                        {
                        rad1=rad1+1;
                    }
                    else if(rs.getString("designation").equals("Asstt. Director Grade-II"))
                        {
                        rad2=rad2+1;
                    }
                    else if(rs.getString("designation").equals("Investigator"))
                        {
                        rinvest=rinvest+1;
                    }
                    else if(rs.getString("designation").equals("Office Superitendent"))
                    {
                        ros=ros+1;
                    }
                }
                }
            }
            catch(Exception exp)
            {
                exp.printStackTrace();
            }
            
            DateFormat cur_format;
            cur_format = new SimpleDateFormat("dd/MM/yyyy");
            
            Date date_temp1 = (Date) cur_format.parse(current_time);
            
            Calendar cal = Calendar.getInstance();
            cal.setTime(date_temp1);
            int month = cal.get(Calendar.MONTH);
            int year = cal.get(Calendar.YEAR);
            String monthName="";
            if(month==1){monthName="January";}
            if(month==2){monthName="February";}
            if(month==3){monthName="March";}
            if(month==4){monthName="April";}
            if(month==5){monthName="May";}
            if(month==6){monthName="June";}
            if(month==7){monthName="July";}
            if(month==8){monthName="August";}
            if(month==9){monthName="September";}
            if(month==10){monthName="October";}
            if(month==11){monthName="November";}
            if(month==12){monthName="December";}
            
            
            System.out.println("Current month and year="+month+"-"+year);
            
            
            
        %>
        <div id="mainDiv">
            <h3 id="head">Retirement List :</h3> 
            <div id="list">
                <table align="center" id="mytable">
                    <tr>
                        <td colspan="3" id="head1">Officers Retired up to <b><%=monthName%>-<%=year%> </b> :</td>
                    </tr>
                    <%
                        long a = 4534545345345445L;
                        String rand = Long.toString((long) (Math.random() * a));
                        String director="gahs-gd$b-dasf-hdra-tdeh";
                        String dd="gahs-gd$b-dajf-hdra-tdeh";
                        String aia="gahs-gd$b-dasf-hdnb-tdeh";
                        String ad1="gahs-gd$b-dasf-hdra-ddeh";
                        String ad2="gahs-gd$b-dasf-hdra-tdih";
                        String os="gahs-gd$b-da8f-hdra-tdeh";
                        String inv="ga4s-g7$b-das5-hd5a-t48h";
                        
                        //String userAgent = request.getHeader("User-Agent");
                        
                       // System.out.println("===browser=="+userAgent);
                    %>
                    <tr>
                        <td id="sno">1.</td>
                        <td id="data">AIA</td>
                        <td align="center" id="data1"><a href="retired_officer_detail.jsp?s=OxZc&de=gahs-gd$b-dasf-hdnb-tdeh&b=<%=rand%>"><%=raia%></a></td>
                    </tr>
                    <tr>
                        <td id="sno">2.</td>
                        <td>Director</td>
                        <td align="center"><a href="retired_officer_detail.jsp?s=OxZc&de=gahs-gd$b-dasf-hdra-tdeh"><%=rdir%></a></td>
                    </tr>
                    <tr>
                        <td id="sno">3.</td>
                        <td>Dy. Director</td>
                        <td align="center"><a href="retired_officer_detail.jsp?s=OxZc&de=gahs-gd$b-dajf-hdra-tdeh"><%=rdd%></a></td>
                    </tr>
                    <tr>
                        <td id="sno">4.</td>
                        <td>Asstt. Director Grade-I</td>
                        <td align="center"><a href="retired_officer_detail.jsp?s=OxZc&de=gahs-gd$b-dasf-hdra-ddeh"><%=rad1%></a></td>
                    </tr>
                    <tr>
                        <td id="sno">5.</td>
                        <td>Asstt. Director Grade-II</td>
                        <td align="center"><a href="retired_officer_detail.jsp?s=OxZc&de=gahs-gd$b-dasf-hdra-tdih"><%=rad2%></a></td>
                    </tr>
                    <tr>
                        <td id="sno">6.</td>
                        <td>Investigator</td>
                        <td align="center"><a href="retired_officer_detail.jsp?s=OxZc&de=ga4s-g7$b-das5-hd5a-t48h"><%=rinvest%></a></td>
                    </tr>
                    <tr>
                        <td id="sno">7.</td>
                        <td>Office Superitendent</td>
                        <td align="center"><a href="retired_officer_detail.jsp?s=OxZc&de=gahs-gd$b-da8f-hdra-tdeh"><%=ros%></a></td>
                    </tr>                    
                </table>
                    <br/>
                    <%
                        String next_ret="";
                        Calendar cal1 = Calendar.getInstance();
                        Calendar current = Calendar.getInstance();
                        DateFormat cur_format1;
                        Date date_ret=null;
                        cur_format1 = new SimpleDateFormat("dd/MM/yyyy");
                        
                        int ndir=0,ndd=0,naia=0,nad1=0,nad2=0,ninvest=0,nos=0;
                        
                        String sql="select a.name as name, a.email as email, a.bas_designation as designation, a.bas_descipline as discipline, a.dat_ret as dateOfRetirement from eis_basicinfo a ";
                        rs=st.executeQuery(sql);
                        while(rs.next())
                        {
                            
                            next_ret=rs.getString("dateOfRetirement");
                            
                            date_ret = (Date) formatter.parse(next_ret);
                           
                            try{

                                        cal1.setTime(dateFormat.parse(current_time));
                                        }catch(ParseException e){
                                                e.printStackTrace();
                                         }
                            Date cur=cal1.getTime();
                                   cal1.add(Calendar.MONTH,1);
                             Date curplus30=cal1.getTime();
                             
                             
                            // System.out.println("============"+(date_ret.after(cur) && date_ret.before(curplus30)));
                                   
                             //      System.out.println("email is ="+rs.getString("email"));
                             //      System.out.println("date of retirement==a=="+next_ret);
                             //      System.out.println("current date after add one month==curr+1=="+cal1.getTime());
                             //      System.out.println("current date==curr=="+current_time);

                           
                           if(date_ret.after(cur) && date_ret.before(curplus30))
                           {
                               if(rs.getString("designation").equals("AIA"))
                                {

                                    naia=naia+1;
                                }
                                else if(rs.getString("designation").equals("Director"))
                                {
                                    ndir=ndir+1;
                                }
                                else if(rs.getString("designation").equals("Dy. Director"))
                                    {
                                    ndd=ndd+1;
                                }
                                else if(rs.getString("designation").equals("Asstt. Director Grade-I"))
                                    {
                                    nad1=nad1+1;
                                }
                                else if(rs.getString("designation").equals("Asstt. Director Grade-II"))
                                    {
                                    nad2=nad2+1;
                                }
                                else if(rs.getString("designation").equals("Investigator"))
                                    {
                                    ninvest=ninvest+1;
                                }
                                else if(rs.getString("designation").equals("Office Superitendent"))
                                {
                                 nos=nos+1;
                                }
                           }
                        }

                    %>
                    <table align="center" id="mytable">
                    <tr>
                        <td colspan="3" id="head1">Officenrs going to be Retire Next Month :</td>
                    </tr>
                    <tr>
                        <td id="sno">1.</td>
                        <td id="data">AIA</td>
                        <td align="center" id="data1"><a href="retired_officer_detail.jsp?s=OxZg&de=gahs-gd$b-dasf-hdnb-tdeh"><%=naia%></a></td>
                    </tr>
                    <tr>
                        <td id="sno">2.</td>
                        <td>Director</td>
                        <td align="center"><a href="retired_officer_detail.jsp?s=OxZg&de=gahs-gd$b-dasf-hdra-tdeh"><%=ndir%></a></td>
                    </tr>
                    <tr>
                        <td id="sno">3.</td>
                        <td>Dy. Director</td>
                        <td align="center"><a href="retired_officer_detail.jsp?s=OxZg&de=gahs-gd$b-dajf-hdra-tdeh"><%=ndd%></a></td>
                    </tr>
                    <tr>
                        <td id="sno">4.</td>
                        <td>Asstt. Director Grade-I</td>
                        <td align="center"><a href="retired_officer_detail.jsp?s=OxZg&de=gahs-gd$b-dasf-hdra-ddeh"><%=nad1%></a></td>
                    </tr>
                    <tr>
                        <td id="sno">5.</td>
                        <td>Asstt. Director Grade-II</td>
                        <td align="center"><a href="retired_officer_detail.jsp?s=OxZg&de=gahs-gd$b-dasf-hdra-tdih"><%=nad2%></a></td>
                    </tr>
                    <tr>
                        <td id="sno">6.</td>
                        <td>Investigator</td>
                        <td align="center"><a href="retired_officer_detail.jsp?s=OxZg&de=ga4s-g7$b-das5-hd5a-t48h"><%=ninvest%></a></td>
                    </tr>
                    <tr>
                        <td id="sno">7.</td>
                        <td>Office Superitendent</td>
                        <td align="center"><a href="retired_officer_detail.jsp?s=OxZg&de=gahs-gd$b-da8f-hdra-tdeh"><%=nos%></a></td>
                    </tr>                    
                </table>
                <br/><br/>
            </div>
        </div>
                    <br/><br/>
                      </div>
                   
                    </div>
                    
                    <%
                        if(!con.equals(null))
                        {
                            con.close();
                            rs.close();
                            st.close();
                        }
                    %>
    </body>
    <%}else
                {
            %>
            <jsp:forward page="EIS_adError.jsp" />
            <%
                }
            %>
</html>
