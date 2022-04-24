<%-- 
    Document   : success_01
    Created on : Dec 16, 2017, 12:12:03 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success</title>
        <style>
            body {font-family:Arial, Helvetica, sans-serif;}
            .box {
                width: 100%;
                height: 225px;
                background:  #f1f5f1 ;
                color:  #199f19 ;
                border: 4px red solid;
                border-style: double;
                
}
.success {
    font-size: 19px;
}
.menu1 {
    width: 100%;
    height: 80px;
    background:  #175fd6  ;
    color: white;
}
      </style>
    </head>
     <body>
         <div class="menu1" align="center">Ministry of MSME <br/>(Government of India)<br/>EMPLOYEE MONITORING SYSTEM</div>
         <div align="center" title="Reciept" class="box">
    <table>
        <br/><br/>
         
    <%
    //* Get the value from current posting *//
    String curr_ofc =request.getParameter("curr_ofc");
    String curr_dur_yr =request.getParameter("curr_dur_yr");
    String curr_dur_mnth =request.getParameter("curr_dur_mnth");
    if(curr_ofc=="" || curr_ofc.equals(null))
        {
        curr_ofc="0";
    }
if(curr_dur_yr=="" || curr_dur_yr.equals(null))
        {
        curr_dur_yr="0";
    }
    if(curr_dur_mnth=="" || curr_dur_mnth.equals(null))
        {
        curr_dur_mnth="0";
    }
   // System.out.println("Current Office  "+curr_ofc);
   // System.out.println("Working Period  "+curr_dur_yr+" year-"+curr_dur_mnth+" month");
    // get value from posting history
    //1
    String pos_his_ofc1 =request.getParameter("pos_his_ofc1");
    String pos_his_dur_yr1 =request.getParameter("pos_his_dur_yr1");
    String pos_his_dur_mnt1 =request.getParameter("pos_his_dur_mnt1");

    if(pos_his_ofc1=="" || pos_his_ofc1.equals(null))
        {
        pos_his_ofc1="0";
    }
    if(pos_his_dur_yr1=="" || pos_his_dur_yr1.equals(null))
        {
        pos_his_dur_yr1="0";
    }
    if(pos_his_dur_mnt1=="" || pos_his_dur_mnt1.equals(null))
        {
        pos_his_dur_mnt1="0";
    }

    //System.out.println("posting history 1  "+pos_his_ofc1);
   // System.out.println("Working Period  "+pos_his_dur_yr1+" year-"+pos_his_dur_mnt1+" month");

    //2
    String pos_his_ofc2 =request.getParameter("pos_his_ofc2");
    String pos_his_dur_yr2 =request.getParameter("pos_his_dur_yr2");
    String pos_his_dur_mnt2 =request.getParameter("pos_his_dur_mnt2");

    if(pos_his_ofc2=="" || pos_his_ofc2.equals(null))
        {
        pos_his_ofc2="0";
    }
    if(pos_his_dur_yr2=="" || pos_his_dur_yr2.equals(null))
        {
        pos_his_dur_yr2="0";
    }
    if(pos_his_dur_mnt2=="" || pos_his_dur_mnt2.equals(null))
        {
        pos_his_dur_mnt2="0";
    }

    //System.out.println("posting history 2  "+pos_his_ofc2);
    //System.out.println("Working Period  "+pos_his_dur_yr2+" year-"+pos_his_dur_mnt2+" month");

    //3
    String pos_his_ofc3 =request.getParameter("pos_his_ofc3");
    String pos_his_dur_yr3 =request.getParameter("pos_his_dur_yr3");
    String pos_his_dur_mnt3 =request.getParameter("pos_his_dur_mnt3");

    if(pos_his_ofc3=="" || pos_his_ofc3.equals(null))
        {
        pos_his_ofc3="0";
    }
    if(pos_his_dur_yr3=="" || pos_his_dur_yr3.equals(null))
        {
        pos_his_dur_yr3="0";
    }
    if(pos_his_dur_mnt3=="" || pos_his_dur_mnt3.equals(null))
        {
        pos_his_dur_mnt3="0";
    }


   // System.out.println("posting history 3  "+pos_his_ofc3);
    //System.out.println("Working Period  "+pos_his_dur_yr3+" year-"+pos_his_dur_mnt3+" month");
    //4
    String pos_his_ofc4 =request.getParameter("pos_his_ofc4");
    String pos_his_dur_yr4 =request.getParameter("pos_his_dur_yr4");
    String pos_his_dur_mnt4 =request.getParameter("pos_his_dur_mnt4");

    if(pos_his_ofc4=="" || pos_his_ofc4.equals(null))
        {
        pos_his_ofc4="0";
    }
    if(pos_his_dur_yr4=="" || pos_his_dur_yr4.equals(null))
        {
        pos_his_dur_yr4="0";
    }
    if(pos_his_dur_mnt4=="" || pos_his_dur_mnt4.equals(null))
        {
        pos_his_dur_mnt4="0";
    }

    System.out.println("posting history 4  "+pos_his_ofc4);
    System.out.println("Working Period  "+pos_his_dur_yr4+" year-"+pos_his_dur_mnt4+" month");

    //5
    String pos_his_ofc5 =request.getParameter("pos_his_ofc5");
    String pos_his_dur_yr5 =request.getParameter("pos_his_dur_yr5");
    String pos_his_dur_mnt5 =request.getParameter("pos_his_dur_mnt5");

    if(pos_his_ofc5=="" || pos_his_ofc5.equals(null))
        {
        pos_his_ofc5="0";
    }
    if(pos_his_dur_yr5=="" || pos_his_dur_yr5.equals(null))
        {
        pos_his_dur_yr5="0";
    }
    if(pos_his_dur_mnt5=="" || pos_his_dur_mnt5.equals(null))
        {
        pos_his_dur_mnt5="0";
    }


   // System.out.println("posting history 5  "+pos_his_ofc5);
   // System.out.println("Working Period  "+pos_his_dur_yr5+" year-"+pos_his_dur_mnt5+" month");

    // get the value from trining history
    //1
    String train_1=request.getParameter("train_1");
    String trn_his_dur_yr1 =request.getParameter("trn_his_dur_yr1");
    String trn_his_dur_mnt1 =request.getParameter("trn_his_dur_mnt1");

    if(train_1=="" || train_1.equals(null))
        {
        train_1="0";
    }
    if(trn_his_dur_yr1=="" || trn_his_dur_yr1.equals(null))
        {
        trn_his_dur_yr1="0";
    }
    if(trn_his_dur_mnt1=="" || trn_his_dur_mnt1.equals(null))
        {
        trn_his_dur_mnt1="0";
    }

    //System.out.println("training history 1  "+train_1);
    // System.out.println("Working Period  "+trn_his_dur_yr1+" year-"+trn_his_dur_mnt1+" month");
    //2
    String train_2=request.getParameter("train_2");
    String trn_his_dur_yr2 =request.getParameter("trn_his_dur_yr2");
    String trn_his_dur_mnt2 =request.getParameter("trn_his_dur_mnt2");

    if(train_2=="" || train_2.equals(null))
        {
        train_2="0";
    }
    if(trn_his_dur_yr2=="" || trn_his_dur_yr2.equals(null))
        {
        trn_his_dur_yr2="0";
    }
    if(trn_his_dur_mnt2=="" || trn_his_dur_mnt2.equals(null))
        {
        trn_his_dur_mnt2="0";
    }

     // System.out.println("training history 2  "+train_2);
  //  System.out.println("Working Period  "+trn_his_dur_yr2+" year-"+trn_his_dur_mnt2+" month");
    //3
    String train_3=request.getParameter("train_3");
    String trn_his_dur_yr3 =request.getParameter("trn_his_dur_yr3");
    String trn_his_dur_mnt3 =request.getParameter("trn_his_dur_mnt3");

    if(train_3=="" || train_3.equals(null))
        {
        train_3="0";
    }
    if(trn_his_dur_yr3=="" || trn_his_dur_yr3.equals(null))
        {
        trn_his_dur_yr3="0";
    }
    if(trn_his_dur_mnt3=="" || trn_his_dur_mnt3.equals(null))
        {
        trn_his_dur_mnt3="0";
    }

  //  System.out.println("training history 3  "+train_3);
  //   System.out.println("Working Period  "+trn_his_dur_yr3+" year-"+trn_his_dur_mnt3+" month");

    //4
    String train_4=request.getParameter("train_4");
    String trn_his_dur_yr4 =request.getParameter("trn_his_dur_yr4");
    String trn_his_dur_mnt4 =request.getParameter("trn_his_dur_mnt4");

    if(train_4=="" || train_4.equals(null))
        {
        train_4="0";
    }
    if(trn_his_dur_yr4=="" || trn_his_dur_yr4.equals(null))
        {
        trn_his_dur_yr4="0";
    }
    if(trn_his_dur_mnt4=="" || trn_his_dur_mnt4.equals(null))
        {
        trn_his_dur_mnt4="0";
    }

  //  System.out.println("training history 4  "+train_4);
  //  System.out.println("Working Period  "+trn_his_dur_yr4+" year-"+trn_his_dur_mnt4+" month");

    //5
    String train_5=request.getParameter("train_5");
    String trn_his_dur_yr5 =request.getParameter("trn_his_dur_yr5");
    String trn_his_dur_mnt5 =request.getParameter("trn_his_dur_mnt5");

    if(train_5=="" || train_5.equals(null))
        {
        train_5="0";
    }
    if(trn_his_dur_yr5=="" || trn_his_dur_yr5.equals(null))
        {
        trn_his_dur_yr5="0";
    }
    if(trn_his_dur_mnt5=="" || trn_his_dur_mnt5.equals(null))
        {
        trn_his_dur_mnt5="0";
    }

  //  System.out.println("training history 5  "+train_5);
  //   System.out.println("Working Period  "+trn_his_dur_yr5+" year-"+trn_his_dur_mnt5+" month");

  //* training required
    String train_req_1 =request.getParameter("train_req_1");

    if(train_req_1=="" || train_req_1.equals(null))
        {
        train_req_1="0";
    }
//System.out.println("training required  :"+train_req_1);
    //* End * //
    String ofcType =request.getParameter("ofcType");
//System.out.println("Office Type :"+ofcType);
        String name =request.getParameter("name");
        String designation =request.getParameter("degin");
        String DOB =request.getParameter("dob");
        String DOJ =request.getParameter("doj-G");
        String DOJMSME =request.getParameter("doj-msme");
        String DOR =request.getParameter("doR");
        String Crosssite = (String) session.getAttribute("Crosssite");
        String opt_pos_1 = request.getParameter("name");
        String opt_pos_2 = request.getParameter("name");
        String opt_pos_3 = request.getParameter("name");
        String institute_name = (String) session.getAttribute("institute_name");
         session.setAttribute("institute_name",institute_name);

       // String instId=(String)session.getAttribute("instId");
        //String instId="I20";
        int token=11538;
        String new_Token="";
        int new_token=0;
         Connection con= null;
         Statement st= null;
         ResultSet rs= null;
         String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "mpr_dcmsme";
String userId = "root";
String password = "220047";
if (!Crosssite.equals(null))
    {
try
        {
    Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}


try{
    con = DriverManager.getConnection(connectionUrl+dbName, userId, password);
    st=con.createStatement();
    String sql1="SELECT * FROM eis_general01 ;";
    rs=st.executeQuery(sql1);
    while(rs.next())
        {
         new_Token=rs.getString("token");
        }
  }
catch(Exception e){
    e.printStackTrace();
    }
//if (new_Token.equals(null) || new_Token=="")
 //   {
 //    new_Token=token;
 //   }
System.out.println("Old last Token is : "+new_Token);
new_token=Integer.parseInt(new_Token) ;
token=new_token+73;


try {
con = DriverManager.getConnection(connectionUrl+dbName, userId, password);
st=con.createStatement();
String sql ="insert into eis_general01 values ('"+token+"','"+ofcType+"','"+institute_name+"','"+name+"'," +
        "'"+designation+"','"+DOB+"','"+DOJ+"','"+DOJMSME+"','"+DOR+"','"+curr_ofc+"','"+curr_dur_yr+"'," +
        "'"+curr_dur_mnth+"','"+opt_pos_1+"','"+opt_pos_2+"','"+opt_pos_3+"','"+pos_his_ofc1+"'," +
        "'"+pos_his_dur_yr1+"','"+pos_his_dur_mnt1+"','"+pos_his_ofc2+"','"+pos_his_dur_yr2+"','"+pos_his_dur_mnt2+"'," +
        "'"+pos_his_ofc3+"','"+pos_his_dur_yr3+"','"+pos_his_dur_mnt3+"','"+pos_his_ofc4+"','"+pos_his_dur_yr4+"'," +
        "'"+pos_his_dur_mnt4+"','"+pos_his_ofc5+"','"+pos_his_dur_yr5+"','"+pos_his_dur_mnt5+"','"+train_1+"'," +
        "'"+trn_his_dur_yr1+"','"+trn_his_dur_mnt1+"','"+train_2+"','"+trn_his_dur_yr2+"','"+trn_his_dur_mnt2+"'," +
        "'"+train_3+"','"+trn_his_dur_yr3+"','"+trn_his_dur_mnt3+"','"+train_4+"','"+trn_his_dur_yr4+"','"+trn_his_dur_mnt4+"'," +
        "'"+train_5+"','"+trn_his_dur_yr5+"','"+trn_his_dur_mnt5+"','"+train_req_1+"');";

int rs1 = st.executeUpdate(sql);
if(rs1>0){

    %>
    <tr>
        <td class="success">
            Data has been submitted successfully.
        </td>
    </tr>
    <%
    }

}
catch (Exception e) {
e.printStackTrace();
}

%>
  
        <form method="post" action="" onsubmit="return myFunction()">
           
            <tr>
                <td class="success"><br/> Your token no is : <a style=" color: #FF5733"> <%=token%><br/> </a></td>
            </tr>
           
        
        <%--   <h3>name=<%=name%></h3>
        <h3>Designation=<%=designation%></h3>
        <h3>Date of Birth=<%=DOB%></h3>
        <h3>Date of Joining=<%=DOJ%></h3>
        <h3>Date of Joining to Govt. Office =<%=DOJMSME%></h3>
        <h3>Date of Retirement=<%=DOR%></h3>
        <h3>Institute Code=<%=instId%></h3>   --%>
        <tr>
            <td align="center" class="success"><br/>
                <button type="submit" size="43" value="OK" > &nbsp;&nbsp;&nbsp;&nbsp;OK&nbsp;&nbsp;&nbsp;&nbsp;</button>
            </td>
        </tr>
        
        </form>

        <script>
            function myFunction(){
                 document.forms[0].action = "EIS_01.jsp"
                 return true;
            }
        </script>
        <%
        }
else
    {
%>
<div align="center" style="font-family: Arial, Helvetica, sans-serif; border: 2px; border-style: double ">
    <tr>
        <td>Please login again or Contact to administrator. </td>
    </tr>              </div>
<%}



%>


    </table>
        </div>
    </body>
</html>
