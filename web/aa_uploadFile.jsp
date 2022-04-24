<%-- 
    Document   : aa_uploadFile
    Created on : Apr 14, 2018, 11:50:34 AM
    Author     : Senet
--%>

<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<%@page import="java.util.Random" %>
<%
String saveFile="";

Random rand = new Random();
int num = rand.nextInt(9000000) + 1000000;

 String email=(String)session.getAttribute("email");
System.out.println("---upload jsp is working----"+email);
String contentType = request.getContentType();
if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0)){
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
String test="";
int totalBytesRead = 0;
while(totalBytesRead < formDataLength){
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
saveFile = file.substring(file.indexOf("filename=\"") + 10);
//System.out.println("---upload jsp is working----" +saveFile);
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



int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;

int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
File ff = new File("C:/UploadedFiles/"+rename);

test=ff.getPath();
FileOutputStream fileOut = new FileOutputStream(ff);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();
%><br><table border="2"><tr><td><b>You have successfully upload the file:</b>
<%out.println(saveFile);%></td></tr></table>
<%
Connection connection = null;
String connectionURL = "jdbc:mysql://localhost:3306/mpr_dcmsme";
PreparedStatement psmnt = null;
try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "220047");
psmnt = connection.prepareStatement("insert into file(file_path) values(?)");
psmnt.setString(1, ff.getPath());
int s = psmnt.executeUpdate();
if(s>0){
System.out.println("Uploaded successfully !");
}
else{
System.out.println("Error!");
}
Statement st=connection.createStatement();
ResultSet rs=st.executeQuery("Select file_path from file");
  %>
 <table cellpadding="15" border="1">
 <%
  while(rs.next()){

 %>
 <tr>
<td><a href="aa_download.jsp?f=<%=test%>"><%=rs.getString("file_path")%></a></td>
 </tr>
  <%}%>
 </table>
 <%
}
catch(Exception e){
    e.printStackTrace();
}

}
%>
