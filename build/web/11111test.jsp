<%-- 
    Document   : 11111test
    Created on : Apr 13, 2018, 2:35:46 PM
    Author     : Senet
--%>

<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert an Image into MySQL Database</title>
    </head>
    <body>
        <h1>Insert an Image into MySQL Database!</h1>
        <%--
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String url = "jdbc:mysql://localhost:3306/mpr_dcmsme";//Here the "test" is the Database name
            FileInputStream fis = null;
        //    String image=request.getParameter("upload");
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection(url, "root", "220047");
                File image = new File("C:/Users/Senet/Desktop/gr1.JPG");
                pstmt = conn.prepareStatement("insert into image(firstname, lastname, image, email) " + "values(?,?,?,?)");
                pstmt.setString(1, "Sumanth");
                pstmt.setString(2, "Garakarajula");
                pstmt.setString(4, "sumanth@codesuggestions.com");
                fis = new FileInputStream(image);
                pstmt.setBinaryStream(3, (InputStream) fis, (int) (image.length()));

                int count = pstmt.executeUpdate();
                if (count > 0) {
                    System.out.println("The image has been inserted successfully");
                } else {
                    System.out.println("The image did not insert successfully");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                        rs = null;
                    }
                    if (pstmt != null) {
                        pstmt.close();
                        pstmt = null;
                    }
                    if (conn != null) {
                        conn.close();
                        conn = null;
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }

        --%>
        <%
String captcha=(String)session.getAttribute("key");
String input=request.getParameter("captcha");
System.out.println("Captcha we get="+captcha);
System.out.println("input we get="+input);


%>
    </body>
</html>
