<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="nl.captcha.Captcha"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Simple CAPTCHA Example</title>
<link href="styles.css" type="text/css" rel="stylesheet" />
</head>

<body>
<center>
<h3>Simple CAPTCHA Example</h3>
<form action="captchasubmit.jsp" method="post">
username : <input type="text" name="user"/>
password : <input type="text" name="pass"/>
<img id="captcha" src="<c:url value="simpleCaptcha.jpg"  />" width="150">
<input type="text"name="answer" /><br>
<input type="submit" value="Submit"></form>
</center>
</body>
</html>
