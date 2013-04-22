<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styles.css" />
<title>Watch Video</title>
  
</head>
<body bgcolor="#C0C0C0">
<form method="post" action="SaveFeedbackOpinion" width="70%">
<center>
<%-- <%
response.setHeader("Refresh", "10;url=feedback1"); 
%> --%>
<br> <br>



<table width="68%">
<tr> <td align="left">
<p style="font-size: 22px;" > Nun möchten wir gern Ihre Meinung  darüber erfahren, worum es in unserer Studie geht. <br>
Bitte geben Sie Ihre Meinung in das untere Feld ein.Klicken sie danach auf Weiter.</p>
 
<textarea style=" font-size: 22px;" rows="8" cols="70" name="expr_feedback"></textarea>

</td></tr>
</table>

<br> 
<button style="font-size: 20px" name="submit" type="submit">  &nbsp; Weiter  &nbsp;</button>
</center>
</form>
</body>
</html>
