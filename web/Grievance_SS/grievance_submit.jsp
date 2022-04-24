<%-- 
    Document   : EIS_SS_grievance_submit
    Created on : May 21, 2018, 12:10:35 PM
    Author     : Senet
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,common.*" errorPage="" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.UUID" %>
<%@page import="java.util.Random" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Details</title>
        <style>
            #mainTable{
                border-radius: 6px;
                border: 2px  #7646f7 solid;
                font-family: Bookman Old Style;
}
.head{
    font-family: Bookman Old Style;
    font-size: 32px;
    color: #7646f7;
    font-style: normal;
    margin-bottom: 0px;
}
.data{
    padding-left: 25px;
    font-family: Bookman Old Style;
    font-size: 15px;
   padding-bottom: 3px;
   padding-top: 3px;
}
.data1{
  padding-left: 25px;
    font-family: Bookman Old Style;
    padding-bottom: 15px;
    padding-top: 15px;
}
.onedata{
    margin-top: 8px;
    padding-bottom: 5px;
    padding-top: 5px;
    font-family: Bookman Old Style;
    border: 1px black solid;
}
.ss{
    display: inline;
width: 150px;
}

.pdf{
    padding-left: 55px;
    padding-top: 35px;
    color:  #FF5733 ;
}
.daata{
 margin-bottom: 25px;
padding-bottom: 25px;
}
.mainHeading
{
    font-family: Bookman Old Style;
    font-size: 20px;
    color: #7646f7;
    font-style: normal;
    margin-bottom: -10px;
    margin-top: 0px;
    font-weight: normal;
}
        </style>
    </head>
    <%
    System.out.println("submit page is working");
         String Session=(String)session.getAttribute("Session");
         String email=(String)session.getAttribute("email");
         session.setAttribute("Session",Session);
         response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        System.out.println("session value is="+Session);
         if(!Session.equals(null))
            {
             String InstId="";
         String saveFile="";
         String mainKey="";
         String startName="";
         String submit_ofc_name="";
         String contentType = request.getContentType();
         String grType=request.getParameter("v");
    String otherDetail=request.getParameter("vl");
    String test="";
  //  String token=request.getParameter("token");

SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Date date = new Date();
String time=dateFormat.format(date);
String today=time.substring(0, 11);



String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "mpr_dcmsme";
String userId = "root";
String password = "220047";
Connection con=null;
    ResultSet rs=null;
    Statement st=null;
    String name="";
    String designation="";
    String dob="";
    String gender="";
    String cur_posting="";
    String category="";

    String dsplay="";
    if(otherDetail=="" || otherDetail==null)
        {
        otherDetail="0";
        }
    String Status="1";
Random rand = new Random();
int num = rand.nextInt(9000000) + 1000000;
int token=0;
try{
    con=ConnectionManager.getConnectionDirectForMySQL();
    st=con.createStatement();
    String sql="select * from eis_ss_registration where email='"+email+"'";
    rs=st.executeQuery(sql);
    while(rs.next())
        {
        token=rs.getInt("token");
        name=rs.getString("name");
        designation=rs.getString("designation");
        dob=rs.getString("dob");
        gender=rs.getString("gender");
        cur_posting=rs.getString("inst_id");
        category=rs.getString("category");
        }
    }
catch(Exception ex){
ex.printStackTrace();
}

//String key = UUID.randomUUID().toString();
//String mainKey=key.substring(0, 8);



try{
if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0)){
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;


int totalBytesRead = 0;
while(totalBytesRead < formDataLength){
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}
System.out.println("Token we get==="+token);
String file = new String(dataBytes,"CP1256");
saveFile = file.substring(file.indexOf("filename=\"") + 10);

saveFile = saveFile.substring(0, saveFile.indexOf("\n"));

saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));

String rename=saveFile.substring(0, saveFile.indexOf("."));



int index = saveFile.lastIndexOf(".");

String extension=saveFile.substring(index);
System.out.println(" we get name of file ::"+rename+ " // "+extension);
rename="grv_ss_"+num+extension;
System.out.println("Name of file after change==="+rename);
int lastIndex = contentType.lastIndexOf("=");

//String workingDirectory = System.getProperty("user.dir");
String boundary = contentType.substring(lastIndex + 1,contentType.length());

File ff = new File("C:/UploadFiles_SS/"+rename);

int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;


int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes("CP1256")).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes("CP1256")).length;

test=ff.getPath();

FileOutputStream fileOut = new FileOutputStream(ff);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();


    try{
        con=ConnectionManager.getConnectionDirectForMySQL();
        st=con.createStatement();
        String sql="select * from eis_branch_list where Inst_Name='"+cur_posting+"'";
        rs=st.executeQuery(sql);
        while(rs.next())
            {
            InstId=rs.getString("Inst_id");
            }
        con.close();
        }
    catch(Exception data){
        data.printStackTrace();
        }
System.out.println("inst id is=="+InstId);

if(InstId.equals("I1")){ startName="DAG";}
else if(InstId.equals("I2")){startName="DHL";}
else if(InstId.equals("I3")){startName="DAH";}
else if(InstId.equals("I4")){startName="DAL";}
else if(InstId.equals("I5")){startName="DAG";}
else if(InstId.equals("I6")){startName="DBL";}
else if(InstId.equals("I7")){startName="DMM";}
else if(InstId.equals("I8")){startName="DKK";}
else if(InstId.equals("I9")){startName="DCT";}
else if(InstId.equals("I10")){startName="DGW";}
else if(InstId.equals("I11")){startName="DHB";}
else if(InstId.equals("I12")){startName="DHD";}
else if(InstId.equals("I13")){startName="DIN";}
else if(InstId.equals("I14")){startName="DIM";}
else if(InstId.equals("I15")){startName="DJP";}
else if(InstId.equals("I16")){startName="DKP";}
else if(InstId.equals("I17")){startName="DKN";}
else if(InstId.equals("I18")){startName="DLD";}
else if(InstId.equals("I19")){startName="DCH";}
else if(InstId.equals("I20")){startName="DGA";}
else if(InstId.equals("I21")){startName="DMZ";}
else if(InstId.equals("I22")){startName="DRC";}
else if(InstId.equals("I23")){startName="DSL";}
else if(InstId.equals("I24")){startName="DJM";}
else if(InstId.equals("I25")){startName="DGT";}
else if(InstId.equals("I26")){startName="DTH";}
else if(InstId.equals("I27")){startName="DRP";}
else if(InstId.equals("I28")){startName="DPT";}
else if(InstId.equals("I29")){startName="DDL";}
else if(InstId.equals("I30")){startName="DNP";}
else if(InstId.equals("b1")){startName="BBH";}
else if(InstId.equals("b2")){startName="BAZ";}
else if(InstId.equals("b3")){startName="BRJ";}
else if(InstId.equals("b4")){startName="BSL";}
else if(InstId.equals("b5")){startName="BVR";}
else if(InstId.equals("b6")){startName="BMG";}
else if(InstId.equals("b7")){startName="BCB";}
else if(InstId.equals("b8")){startName="BTT";}
else if(InstId.equals("b9")){startName="BRG";}
else if(InstId.equals("b10")){startName="BRK";}
else if(InstId.equals("b11")){startName="BTZ";}
else if(InstId.equals("b13")){startName="BDP";}
else if(InstId.equals("b14")){startName="BSH";}
else if(InstId.equals("b15")){startName="BTR";}
else if(InstId.equals("b16")){startName="BIT";}
else if(InstId.equals("b17")){startName="BGB";}
else if(InstId.equals("b18")){startName="BVP";}
else if(InstId.equals("b19")){startName="BDM";}
else if(InstId.equals("b20")){startName="BGL";}
else if(InstId.equals("b21")){startName="BRW";}
else if(InstId.equals("b22")){startName="BJT";}
else if(InstId.equals("b23")){startName="BDG";}
else if(InstId.equals("b24")){startName="BSG";}
else if(InstId.equals("b25")){startName="BSR";}
else if(InstId.equals("b26")){startName="BPB";}
else if(InstId.equals("b27")){startName="BAU";}
else if(InstId.equals("b28")){startName="BDB";}
else if(InstId.equals("I100")){startName="TKK";}
else if(InstId.equals("I101")){startName="TCH";}
else if(InstId.equals("I103")){startName="TMM";}
else if(InstId.equals("I104")){startName="TDL";}
else if(InstId.equals("I122")){startName="SHD";}
else if(InstId.equals("I123")){startName="SBL";}
else if(InstId.equals("I124")){startName="SCC";}
else if(InstId.equals("I125")){startName="SBP";}
else if(InstId.equals("I126")){startName="SKH";}
else if(InstId.equals("I127")){startName="SJP";}
else if(InstId.equals("I128")){startName="SPC";}
else if(InstId.equals("I105")){startName="ITV";}
else if(InstId.equals("I106")){startName="IEM";}
else if(InstId.equals("I107")){startName="HNG";}
else if(InstId.equals("I70")){startName="HQDL";}
else {startName="NLD";}

 mainKey=startName+token;

System.out.println("start key="+startName);
String replyType="user";
Connection connection = null;
String connectionURL = "jdbc:mysql://localhost/mpr_dcmsme";
PreparedStatement psmnt = null;
try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "220047");
psmnt = connection.prepareStatement("insert into egs_ss_file(egsId, email, token, file, time, replyType) values(?, ?, ?, ?, ?, ?)");
psmnt.setString(1, mainKey);
psmnt.setString(2, email);
psmnt.setInt(3, token);
psmnt.setString(4, ff.getPath());
psmnt.setString(5, time);
psmnt.setString(6, replyType);
int s = psmnt.executeUpdate();
if(s>0){
System.out.println("Uploaded successfully !");
}
else{
System.out.println("Error!");
}
}
catch(Exception e){
    e.printStackTrace();
}

}
}
catch(Exception except){
System.out.println("Error is="+except);
}

String decleration="yes";


    try
            {
        con=DriverManager.getConnection(connectionUrl+dbName, userId, password);
        st=con.createStatement();
        String sql="insert into egs_ss_basic values('"+email+"','"+mainKey+"','"+token+"','"+name+"','"+gender+"','"+designation+"','"+cur_posting+"','"+dob+"','"+category+"','"+time+"','"+InstId+"')";
        int res=st.executeUpdate(sql);

        String sql1="insert into egs_ss_data values('"+token+"','"+mainKey+"','"+email+"','"+grType+"','"+otherDetail+"','"+decleration+"')";
        int res1=st.executeUpdate(sql1);

        String sql3="insert into egs_ss_logindata values('"+token+"','"+mainKey+"','"+email+"','"+Status+"')";
        int res3=st.executeUpdate(sql3);

        if(res>0 && res1>0 && res3>0)
        {
            System.out.println("Data saved Successfully");
        }
    }
    catch(Exception ex){
        ex.printStackTrace();
    }
if(InstId.equals("I1") || InstId.equals("b2")){ submit_ofc_name="MSME-DI Agartala";}
else if(InstId.equals("I2")){submit_ofc_name="MSME-DI Haldwani";}
else if(InstId.equals("I3") || InstId.equals("b3") || InstId.equals("b4")){submit_ofc_name="MSME-DI Ahmedabad";}
else if(InstId.equals("I4") || InstId.equals("b5")){submit_ofc_name="MSME-DI Allahabad";}
else if(InstId.equals("I5")){submit_ofc_name="MSME-DI Agartala";}
else if(InstId.equals("I6") || InstId.equals("b6") || InstId.equals("I123")){submit_ofc_name="MSME-DI Bangalore";}
else if(InstId.equals("I7") || InstId.equals("b27") || InstId.equals("I126")){submit_ofc_name="MSME-DI Mumbai";}
else if(InstId.equals("I8") || InstId.equals("b23") || InstId.equals("b24") || InstId.equals("b25") || InstId.equals("b26")){submit_ofc_name="MSME-DI Kolkata";}
else if(InstId.equals("I9") || InstId.equals("b9") || InstId.equals("b10")){submit_ofc_name="MSME-DI Cuttack";}
else if(InstId.equals("I10") || InstId.equals("b11") || InstId.equals("b12") || InstId.equals("b13") || InstId.equals("b14")
        || InstId.equals("b15") || InstId.equals("b16")){submit_ofc_name="MSME-DI Guwahati";}
else if(InstId.equals("I11") || InstId.equals("b17")){submit_ofc_name="MSME-DI Hubli";}
else if(InstId.equals("I12") || InstId.equals("b18") || InstId.equals("I122")){submit_ofc_name="MSME-DI Hyderabad";}
else if(InstId.equals("I13") || InstId.equals("b20") || InstId.equals("b21") || InstId.equals("I125")){submit_ofc_name="MSME-DI Indore";}
else if(InstId.equals("I14") || InstId.equals("b19")){submit_ofc_name="MSME-DI Imphal";}
else if(InstId.equals("I15") || InstId.equals("I127")){submit_ofc_name="MSME-DI Jaipur";}
else if(InstId.equals("I16")){submit_ofc_name="MSME-DI Kanpur";}
else if(InstId.equals("I17") || InstId.equals("b1")){submit_ofc_name="MSME-DI Karnal";}
else if(InstId.equals("I18")){submit_ofc_name="MSME-DI Ludhiana";}
else if(InstId.equals("I19") || InstId.equals("b7") || InstId.equals("b8") || InstId.equals("I128")){submit_ofc_name="MSME-DI Chennai";}
else if(InstId.equals("I20")){submit_ofc_name="MSME-DI Goa";}
else if(InstId.equals("I21")){submit_ofc_name="MSME-DI Muzaffarpur";}
else if(InstId.equals("I22") || InstId.equals("b28")){submit_ofc_name="MSME-DI Ranchi";}
else if(InstId.equals("I23")){submit_ofc_name="MSME-DI Solan";}
else if(InstId.equals("I24") || InstId.equals("b22")){submit_ofc_name="MSME-DI Jammu";}
else if(InstId.equals("I25")){submit_ofc_name="MSME-DI Gangtok";}
else if(InstId.equals("I26") || InstId.equals("I124")){submit_ofc_name="MSME-DI Thrissur";}
else if(InstId.equals("I27")){submit_ofc_name="MSME-DI Raipur";}
else if(InstId.equals("I28")){submit_ofc_name="MSME-DI Patna";}
else if(InstId.equals("I29")){submit_ofc_name="MSME-DI New Delhi";}
else if(InstId.equals("I30")){submit_ofc_name="MSME-DI Nagpur";}
else if(InstId.equals("I100")){submit_ofc_name="MSME-TC Kolkata";}
else if(InstId.equals("I101")){submit_ofc_name="MSME-TC Chennai";}
else if(InstId.equals("I103")){submit_ofc_name="MSME-TC Mumbai";}
else if(InstId.equals("I104")){submit_ofc_name="MSME-TC New Delhi";}
else if(InstId.equals("I105")){submit_ofc_name="MSME-TI Tiruvalla";}
else if(InstId.equals("I106")){submit_ofc_name="MSME-TI Ettumanoor";}
else if(InstId.equals("I107")){submit_ofc_name="HTTDC-Nagaur";}
else if(InstId.equals("I70")){submit_ofc_name="HQ Office New Delhi";}


    %>
    <body>
        <form action="" name="" id="">
            <br>
            <h2 class="head" align="center">Grievance Details </h2>
            <center><p class="mainHeading">Acknowledgement (System Generated)</center>
            <table align="center" width="1050px"  id="mainTable1">
                <tr>
                    <td class="logout" align="right"><a HREF="EGS_ss_Grievance_register.jsp" >Home</a>&nbsp;&nbsp;&nbsp;<a HREF="EIS_ss_logout.jsp" >Logout</a></td>
                </tr>
            </table>
            <table align="center" width="1050px"  id="mainTable">

                <tr>
                <br/>
                <td align="" class="data1" bgcolor="#d0f0f8">
           Hello <%=name%> ! <br>
           Your Grievance Registration No is :  <b>  <%=mainKey%></b>. and submitted successfully at <b><%=submit_ofc_name%></b>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td width="550px" align="left" style=" border-right:  2px black dashed" class="Div_one">

                                    <div class="data">
                                        Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=name%>
                                    </div>
                                    <div class="data">
                                        Designation &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=designation%>
                                    </div>
                                    <div class="data">
                                        Date Of Birth &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=dob%>
                                    </div>

                                </td>
                                <td width="550px" align="left" class="Div_two">
                                  <div class="data">
                                        Gender &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=gender%>
                                    </div>
                                    <div class="data">
                                        Current Posting &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=cur_posting%>
                                    </div>
                                    <div class="data">
                                        Category &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=category%>
                                    </div>
                                    <br/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="" class="data">Grievance Category&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;<%=grType%></td>
                                 <td class="data" rowspan="2"> Date of Submission <br> in the System&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=today%></td>
                            </tr>
                             <tr>
                                <td colspan="2" class="data">Grievance Detail&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;<%=otherDetail%></td>
                            </tr>

                            <tr>
                                <td class="pdf" colspan="">Uploaded Document &nbsp;&nbsp; : </td>
                            </tr>
                             <tr>
                            <%
                                String user="";
                                String printUser="";
                                try{
                                    con=ConnectionManager.getConnectionDirectForMySQL();
                                    st=con.createStatement();
                                    String data="Select * from egs_ss_file where email='"+email+"'";
                                    rs=st.executeQuery(data);
                                    while(rs.next())
                                        {
                                       user=rs.getString("email");
                                %>

                                <table width="40%" align="center">
                                    <tr>
                                        <%
                                        if(email.equals(user))
                                            {
                                            printUser="Grievance";
                                            }
                                       else{
                                           printUser="Grievance Reply";
                                           }
                                        %>
                                        <td class="daata" width="150px" align="right"><%=printUser%>&nbsp; :-</td>
                                    <td class="daata"><a href="download.jsp?f=<%=rs.getString("file")%>">&nbsp;&nbsp;&nbsp;View Document</a></td>

                                    </tr>
                                </table>



                                <%
                                }
                                    }
                                catch(Exception java){
                                    java.printStackTrace();
                                }
                                %>
                                 </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </form>

    </body>
    <%
}else
    {
%>
<jsp:forward page="error.jsp" />

 <%}%>
</html>

