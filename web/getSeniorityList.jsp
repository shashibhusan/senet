<%-- 
    Document   : getSeniorityList
    Created on : 12 Dec, 2019, 5:13:36 PM
    Author     : msme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="common.*, java.sql.*" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<%
    String designation=request.getParameter("designation");
    System.out.println("designation======"+designation);
    
    ArrayList<String> allEmail= new ArrayList<String>();
    String buffer="";
    String buffer2="";
    
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
            
            String buffer1="<tr>"
                    + "<td id='head'>Sno</td>"
                    + "<td id='head'>Name</td>"
                    + "<td id='head'>Designation</td>"
                    + "<td id='head'>Discipline</td>"
                   // + "<td id='head'>Training Name</td>"
                   // + "<td id='head'>Dt. From</td>"
                   // + "<td id='head'>Dt. To</td>"
                    + "</tr>";
            response.getWriter().println(buffer1);
            int n=0,sno=0;
            int i=0;
            System.out.println("first loop started");
            
                String sql = "SELECT email as email from eis_basicinfo where bas_designation='"+designation+"'";
                rs=st.executeQuery(sql);
                System.out.println("Query fired===="+sql);
                while(rs.next())
                {
                    allEmail.add(rs.getString("email"));
                }
            
            System.out.println("the lenght of email arrayLIST is ="+allEmail.size());
            
       //     for(n=0; n<allEmail.size(); n++)
        //    {
                int rowCount=0, listId=0;
                String name="",desig="",discipline="";
            //String query="select a.name as name, a.designation as designation, a.discipline as discipline from eis_seniority_list a left JOIN eis_trainingcompleted b ON a.email=b.email where a.email='"+allEmail.get(n)+"'";
            
                String query="select a.listId as ListId, a.name as name, a.designation as designation, a.discipline as discipline from eis_seniority_list a where a.designation='"+designation+"' order by listId asc";
                
                rs=st.executeQuery(query);
            while(rs.next())
            {
                
                sno=sno+1;
                //System.out.println("Query Fired="+query);
                rowCount=rowCount+1;
                name=rs.getString("name");
                desig=rs.getString("designation");
                listId=rs.getInt("ListId");
                discipline=rs.getString("discipline");
                if(listId>0)
                {
                buffer=buffer+"<tr id='content'>"
                        + "<td id='data'>"+listId+"</td>"
                        + "<td id='data'>"+name+"</td>"
                        + "<td id='data'>"+desig+"</td>"
                        + "<td id='data'>"+discipline+"</td>"
                        + "</tr>";
                }
                else if(listId==0)
                {
                    buffer2=buffer2+"<tr id='content'>"
                        + "<td id='data'>"+listId+"</td>"
                        + "<td id='data'>"+name+"</td>"
                        + "<td id='data'>"+desig+"</td>"
                        + "<td id='data'>"+discipline+"</td>"
                        + "</tr>";
                }
            }
          //  sno=sno+1;
            
           // buffer=buffer+"<tr id='content'>"
           //         + "<td rowspan="+rowCount+" id='data'>"+sno+"</td>"
           //         + "<td rowspan="+rowCount+" id='data'>"+name+"</td>"
           //         + "<td rowspan="+rowCount+" id='data'>"+desig+"</td>"
           //         + "<td rowspan="+rowCount+" id='data'>"+discipline+"</td>"
           //         + "<tr>";            
           
                    //String query1="Select a.trainingName as training, a.tcFrom as tf , a.tcTo as tt  from eis_trainingcompleted a where email='"+allEmail.get(n)+"'";
                   //rs=st.executeQuery(query1);
                    //while(rs.next())
                    //{
                    //buffer=buffer+"<td id='data'>"+rs.getString("training")+"</td>"
                    //        + "<td id='data'>"+rs.getString("tf")+"</td>"
                    //        + "<td id='data'>"+rs.getString("tt")+"</td>"
                    //        + "</tr>";      
                    //}
       //     }
            response.getWriter().println(buffer);
            response.getWriter().println(buffer2);
%>
