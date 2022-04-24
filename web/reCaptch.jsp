<%@ page import="java.io.*" 
%><%@ page import="java.awt.*"
%><%@ page import="java.awt.image.*"
%><%@ page import="javax.imageio.ImageIO"
%><%@ page import="java.util.*"%>
<%
        Random dac =new Random();
        int num=dac.nextInt();
        String hash1 = Integer.toHexString(num);

        String capstr =hash1.substring(0,2);

        session.setAttribute("key",capstr);

        response.setContentType("image/jpg");
        OutputStream raghav = response.getOutputStream();
        Color background = new Color(235,236,230);
        BufferedImage image = new BufferedImage(145, 50, BufferedImage.TYPE_BYTE_INDEXED);

        Graphics2D graphics = image.createGraphics();

        // Set back ground of the generated image to white
        graphics.setColor(background);
        graphics.fillRect(0, 0, 200, 50);

        // set gradient font of text to be converted to image
        GradientPaint gradientPaint = new GradientPaint(10, 3, Color.BLUE, 20, 10, Color.LIGHT_GRAY, true);

        graphics.setPaint(gradientPaint);
        Font font = new Font("Comic Sans MS", Font.BOLD, 30);
        graphics.setFont(font);
        
        graphics.drawString(capstr, 26, 35);
        
        // close the stream
        ImageIO.write(image,"jpeg",raghav);
        out.clear();
        raghav.close();
%>
