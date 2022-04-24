<%@ page import="java.io.*" 
%><%@ page import="java.awt.*"
%><%@ page import="java.awt.image.*"
%><%@ page import="javax.imageio.ImageIO"
%><%@ page import="java.util.*"
%>
<%
int width=125;
int height=45;
Random rdm=new Random();
int rl=rdm.nextInt();

String hash1 = Integer.toHexString(rl);

String capstr=hash1.substring(0,5);

session.setAttribute("key",capstr);

Color background = new Color(225,227,242);

Color fbl = new Color(30,48,180);

Font fnt=new Font("SansSerif",1,22);

BufferedImage cpimg =new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);

Graphics g = cpimg.createGraphics();

g.setColor(background);

g.fillRect(0,0,width,height);

g.setColor(fbl);

g.setFont(fnt);

g.drawString(capstr,23,28);

g.setColor(background);

g.drawLine(35,43,120,43);

g.drawLine(35,48,120,47);

response.setContentType("image/jpeg");

OutputStream strm = response.getOutputStream();

ImageIO.write(cpimg,"jpeg",strm);
strm.close();
%>
