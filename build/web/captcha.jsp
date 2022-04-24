<%@ page import="java.io.*" %>

<%@ page import="java.awt.*" %>

<%@ page import="java.awt.image.*"%>

<%@ page import="javax.imageio.ImageIO"%>

<%@ page import="java.util.*"%>

<%@ page import="java.awt.image.BufferedImage" %>

<%@ page import ="java.awt.font.TextAttribute" %>

<%@ page import ="java.awt.Font.*" %>



<%

int width=75;

int height=35;

Random rdm=new Random();

int rl=rdm.nextInt(); // Random numbers are generated. 



String hash1 = Integer.toHexString(rl); // Random numbers are converted to Hexa Decimal.



String capstr=hash1.substring(0,5); // Only 5 characters of HexString which is a captcha string



session.setAttribute("captchatxt",capstr); // Captcha string is stored in session for verifying the user entered text 



Color background = new Color(204,204,204);



Color fbl = new Color(0,100,0);



Font fnt=new Font("Verdana", Font.CENTER_BASELINE , 16);



BufferedImage cpimg =new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);



Graphics2D g = cpimg.createGraphics();



g.setColor(background);



g.fillRect(0,0,width,height);



g.setColor(fbl);



g.setFont(fnt);



g.drawString(capstr,10,25);    



// The above lines are generating image of captcha string.



response.setContentType("image/jpeg");



OutputStream strm = response.getOutputStream();



ImageIO.write(cpimg,"jpeg",strm);

strm.close();

%>

