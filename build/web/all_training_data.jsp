<%-- 
    Document   : all_training_data
    Created on : 30 Nov, 2019, 11:10:14 AM
    Author     : rgvjee
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="common.*, java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Training Data</title>
    <style>
        #mainDiv
        {
            width: 1050px;
            margin: auto;
            
        }
        #mytable
        {
            width: 100%;
        }
        #header
        {
            padding: 8px 3px 6px 8px;
            font: normal normal 14px Verdana, Geneva, Arial, Helvetica, sans-serif;
            background-color:  #e1e1e1 ;
        }
        table tr td{
            border: 1px  #9f9f9f solid;
        }
        #data{
            padding: 4px 3px 4px 4px;
            font: normal normal 12px Verdana, Geneva, Arial, Helvetica, sans-serif;
            
        }
        table, th, tr,td { border-collapse: collapse;}
        
    </style>
    </head>
    <body>
        <%
          //  response.setContentType("application/vnd.ms-excel");
          //  response.setHeader("Content-Disposition", "attachment; filename=training_Data.xls");
            
            ArrayList<String> designation= new ArrayList<String>();
            ArrayList<String> allEmail= new ArrayList<String>();
            
            designation.add("AIA");
            designation.add("Director");
            designation.add("Dy. Director");
            designation.add("Asstt. Director Grade-I");
            designation.add("Asstt. Director Grade-II");
            designation.add("Investigator");
            designation.add("Office Superitendent");
            
            Connection con = null;
            Statement st=null;
            ResultSet rs=null;
            try
            {
                con=ConnectionManager.getConnectionDirectForMySQL();
                st=con.createStatement();
            }
            catch(Exception error)
            {
                error.printStackTrace();
                System.out.println("error is at first block is="+error.getMessage());
            }
            
            
            
            
        %>
        <div id="mainDiv">
            <table id="mytable" class="mytable">
                <tr>
                    <td id="header">sno</td>
                    <td id="header">Name</td>
                    <td id="header">Designation</td>
                    <td id="header">Discipline</td>
                    <td id="header">Training Name</td>
                    <td id="header">Dt. From</td>
                    <td id="header">Dt. To</td>
                </tr>
                <%
            int n=0,sno=0;
            int i=0;
            System.out.println("first loop started");
            for( i=0; i<designation.size(); i++)
            {
                String sql = "SELECT email as email from eis_basicinfo where bas_designation='"+designation.get(i)+"'";
                rs=st.executeQuery(sql);
                System.out.println("Query fired===="+sql);
                while(rs.next())
                {
                    allEmail.add(rs.getString("email"));
                }
            }
            System.out.println("the lenght of email arrayLIST is ="+allEmail.size());
            
            for(n=0; n<allEmail.size(); n++){
                int rowCount=0;
                String name="",desig="",discipline="";
            String query="select a.name as name, a.bas_designation as designation, a.bas_descipline as discipline from eis_basicinfo a left JOIN eis_trainingcompleted b ON a.email=b.email where a.email='"+allEmail.get(n)+"'";
            rs=st.executeQuery(query);
            while(rs.next())
            {
                System.out.println("Query Fired="+query);
                rowCount=rowCount+1;
                name=rs.getString("name");
                desig=rs.getString("designation");
                discipline=rs.getString("discipline");
            }
            sno=sno+1;
            %>
            <tr id="content">
                <td rowspan="<%=rowCount%>" id="data"><%=sno%></td> 
                <td rowspan="<%=rowCount%>" id="data"><%=name%></td> 
                <td rowspan="<%=rowCount%>" id="data"><%=desig%></td> 
                <td rowspan="<%=rowCount%>" id="data"><%=discipline%></td> 
           <%
                String trainingname=null,tcFrom=null,tcTo=null;
                String query1="Select a.trainingName as training, a.tcFrom as tf , a.tcTo as tt  from eis_trainingcompleted a where email='"+allEmail.get(n)+"'";
                rs=st.executeQuery(query1);
                while(rs.next())
                {
           %>     
           <td id="data"><%=rs.getString("training")%></td>
           <td id="data"><%=rs.getString("tf")%></td>
           <td id="data"><%=rs.getString("tt")%></td>
            </tr>
            
            <%
            }
            }
               %>
            </table>
            
        </div>
    </body>
</html>
