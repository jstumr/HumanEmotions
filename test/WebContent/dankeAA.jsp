<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styles.css" />
<title>Teil:2 - Ende</title>
  
</head>
<body bgcolor="#C0C0C0">
<form id="userForm" method="post" action="post_task2A1.jsp">
<center>
<%
response.setHeader("Refresh", "15;url=post_task2A1.jsp"); 
%>
<br> <br> <br> <br>
<p id="msg" class="thanks"> <b>
 Herzlichen Dank!
</b>
</p>
<p class="bigFont"> Jetzt geht es weiter!</p>
<p class="bigFont"> <b>Die Erfassung der Konzentrationsleistung ist aber noch nicht beendet! </b> </p>
<!-- <button style="font-size: 20px" name="submit" type="submit">  &nbsp; Weiter  &nbsp;</button> -->
</center>
</form>
</body>
</html>

