<%-- 
    Document   : aa_testview
    Created on : Apr 19, 2018, 4:41:24 PM
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
        <title>JSP Page</title>
    </head>
     <%
        String Session=(String)session.getAttribute("nmm");
         String email=(String)session.getAttribute("email");
        session.setAttribute("Session",Session);
        if(!Session.equals(null))
            {
            String grType=request.getParameter("val");
    String otherDetail=request.getParameter("val1");
    String test="";
  //  String token=request.getParameter("token");
out.println(Session);
SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Date date = new Date();
String time=dateFormat.format(date);
String today=time.substring(0, 11);
String name="";
    String designation="";
    String dob="";
    String discipline="";
    String cur_posting="";
    String doj="";
    String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "mpr_dcmsme";
String userId = "root";
String password = "220047";
Connection con=null;
    ResultSet rs=null;
    Statement st=null;
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
    String sql="select * from eis_basicinfo a join eis_postinginfo b on a.email=b.email where a.email='"+email+"'";
    rs=st.executeQuery(sql);
    while(rs.next())
        {
        token=rs.getInt("token");
        name=rs.getString("name");
        designation=rs.getString("bas_designation");
        dob=rs.getString("dob");
        discipline=rs.getString("bas_descipline");
        cur_posting=rs.getString("state");
        doj=rs.getString("curr_doj");
        }
    }
catch(Exception ex){
ex.printStackTrace();
}

String key = UUID.randomUUID().toString();
String mainKey=key.substring(0, 8);


String saveFile="";
String contentType = request.getContentType();

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
String file = new String(dataBytes);
saveFile = file.substring(file.indexOf("filename=\"") + 10);

saveFile = saveFile.substring(0, saveFile.indexOf("\n"));

saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));

String rename=saveFile.substring(0, saveFile.indexOf("."));



int index = saveFile.lastIndexOf(".");

String extension=saveFile.substring(index);
System.out.println(" we get name of file ::"+rename+ " // "+extension);
rename="grv_"+num+extension;
System.out.println("Name of file after change==="+rename);
int lastIndex = contentType.lastIndexOf("=");


String boundary = contentType.substring(lastIndex + 1,contentType.length());

String uploadedPathLocation="/docs/dcmsme/mprsenet/";

int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
out.println("till pos its working");

int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
out.println("Here is working till file ff"+endPos);

File ff = new File(uploadedPathLocation,rename);
out.println("Here is working till file after location "+ff.getPath());

test=ff.getPath();
//FileOutputStream fileOut = new FileOutputStream(ff);
//fileOut.write(dataBytes, startPos, (endPos - startPos));
//fileOut.flush();
//fileOut.close();
/*out.println("gjhsdgfkshdkf===="+ff.getPath());

out.println("---value we get--- //"+mainKey+"-//"+email+"//"+token+"//"+ff.getPath());

Connection connection = null;
String connectionURL = "jdbc:mysql://10.25.140.121:3306/mpr_dcmsme";
PreparedStatement psmnt = null;
try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "mpr_dcmsme", "Q5#Y8rL^4J");
psmnt = connection.prepareStatement("insert into egs_file(egsId, email, token, file, time) values(?, ?, ?, ?, ?)");
psmnt.setString(1, mainKey);
psmnt.setString(2, email);
psmnt.setInt(3, token);
psmnt.setString(4, ff.getPath());
psmnt.setString(5, time);
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
*/
}
%>
    <body>
        <h1>Hello World!</h1>
        <h1>vIEW PAGE IS WORKING<br/> <%=token%>//<%=name%>//<%=designation%></h1>
    </body>
    <%
}else
    {
%>
<jsp:forward page="EGS_error.jsp" />

 <%}%>
</html>
