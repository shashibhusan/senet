<%-- 
    Document   : EGS_SS_reply_by_user
    Created on : May 21, 2018, 2:45:21 PM
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
<style>
            #msg{
                font-family: Bookman Old Style;
                font-style: normal;
                color: green;
                border: 1px green dashed;
                padding-bottom: 8px;
                padding-top: 8px;
}
        </style>
    </head>
    <body>
<%
      //  String adEmail=(String)session.getAttribute("adEmail");
        String Session=(String)session.getAttribute("Session");
        String email=(String)session.getAttribute("email");

        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        System.out.println("session value is="+Session);

        if(!Session.equals(null))
            {


        String contentType = request.getContentType();
String replyType="user Reply";
System.out.println("=======user reply page is working======="+email);
SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Date date = new Date();
String time=dateFormat.format(date);
int iCount=0;
Connection con=null;
    ResultSet rs=null;
    Statement st=null;

    Random rand = new Random();
int num = rand.nextInt(9000000) + 1000000;
int token=0;
String grvId="";
String test="";
String userEmail="";
try{
    con=ConnectionManager.getConnectionDirectForMySQL();
    st=con.createStatement();
    String sql="select * from egs_ss_basic where email='"+email+"'";
    rs=st.executeQuery(sql);
    while(rs.next())
        {
        token=rs.getInt("token");
        grvId=rs.getString("grvId");
        userEmail=rs.getString("email");
        }
    }
catch(Exception ex){
ex.printStackTrace();
}


String saveFile="";

System.out.println("Content type ::"+contentType);
try
        {
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


String boundary = contentType.substring(lastIndex + 1,contentType.length());

String fileUploadPath="C:/UploadedFiles/";

int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;

int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes("CP1256")).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes("CP1256")).length;
File ff = new File(fileUploadPath,rename);

test=ff.getPath();
FileOutputStream fileOut = new FileOutputStream(ff);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();

System.out.println("---value we get--- //"+grvId+"-//"+email+"//"+token+"//"+ff.getPath());

Connection connection = null;
String connectionURL = "jdbc:mysql://localhost:3306/mpr_dcmsme";
PreparedStatement psmnt = null;
try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "220047");
psmnt = connection.prepareStatement("insert into egs_ss_file(egsId, email, token, file, time, replyType) values(?, ?, ?, ?, ?, ?)");
psmnt.setString(1, grvId);
psmnt.setString(2, email);
psmnt.setInt(3, token);
psmnt.setString(4, ff.getPath());
psmnt.setString(5, time);
psmnt.setString(6, replyType);
int s = psmnt.executeUpdate();
if(s>0){
System.out.println("Uploaded successfully !");
iCount=1;
}
else{
System.out.println("Error!");
}
connection.close();
}

catch(Exception e){
    e.printStackTrace();
}

String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "mpr_dcmsme";
String userId = "root";
String password = "220047";
String reply="yes";
               try{
 Connection con3 = DriverManager.getConnection(connectionUrl+dbName, userId, password);

Statement st3=con3.createStatement();
String sql ="insert into egs_ss_reply values ('"+email+"','"+grvId+"','"+userEmail+"','"+token+"','"+reply+"','"+time+"')";

int rs4 = st3.executeUpdate(sql);

con3.close();
}

catch (Exception e) {
e.printStackTrace();
}

}
}
catch(Exception dataInput){
   System.out.println("Error catched ::"+dataInput);
   }
        %>
        <br><br><br>
        <center>
            <table>
            <tr>

                <td width="450px;" id="msg" align="center">
                    Your Reply Submitted Successfully.
                </td>
            </tr>
            <tr>
                <td>
                    <table width="450px;" id="msg" align="center">
                        <tr>

                            <td align="center"><a href="EGS_SS_userView.jsp">Home </a></td>
                            <td align="center"><a href="EGS_ss_logout.jsp">Logout </a></td>
                        </tr>
                    </table>

                </td>
            </tr>
          </table>
            </center>

        <%
}else
    {
%>
<jsp:forward page="EIS_ss_error.jsp" />

 <%}%>

    </body>
</html>
