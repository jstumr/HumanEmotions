<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styles.css" />
<title>Welcome!</title>
</head>
<body bgcolor="#C0C0C0">

<table width="80%" cellpadding="0" cellspacing="0">
<tr> 
<td align="left"> 
<img src="logo.jpg" alt="logo"> 
</td>
<td align="left" class="heading"> 
Universität Konstanz<br> 
Geisteswissenschaftliche Sektion<br>
Empirische Bildungsforschung
</td>
</tr>
</table>


<hr/>
<%-- <p>Test Type: <%= request.getSession().getAttribute("testType") %></p> --%>

<form  action="intructions_teil1.jsp" method="post">
<center>
<table width="50%">
<tr>
<td >
<h1>Liebe Teilnehmerin, lieber Teilnehmer, </h1>
</td>
</tr>
<tr>
<td>
<h1>herzlich willkommen zu unserer Studie </br>
 "Lern -und Leistungskriterien auf dem Prüfstand". </h1>
</br>
</br>
<h2>Sie werden mit Hilfe der Instruktionen auf Ihrem Bildschirm Schritt für Schritt durch die Studie geleitet. 
</br>
</br>Bitte lesen Sie alle Instruktionen aufmerksam durch.
</br>
 Klicken Sie bitte mit der Maustaste auf Weiter, um zur nachfolgenden Seite zu gelangen. </h2>
 </h2>
</td>

</tr>
</table>
</br>
<button style="font-size: 20px" name="submit" type="submit">  &nbsp; Weiter  &nbsp;</button>
</center>
</form>
</body>
</html>