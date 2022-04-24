<%-- 
    Document   : di_report01
    Created on : Dec 20, 2017, 11:43:56 AM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<body>

<p>
Depending on browser support:<br>
A date picker can pop-up when you enter the input field.
</p>

<form action="/action_page.php">
  Birthday:
  <input type="date" name="bday">
  <input type="submit">
</form>

<p><strong>Note:</strong> type="date" is not supported in Internet Explorer 11 and earlier versions.</p>

</body>
</html>