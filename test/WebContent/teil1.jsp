<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styles.css" />
<title>Teil 1</title>
</head>
<body bgcolor="#C0C0C0">
<%-- <p>Test Type: <%= request.getSession().getAttribute("testType")%></p> --%>
<%
/* response.setHeader("Refresh", "5;url=Teil1Questions");  */
session.setAttribute("startQuesNo", "0");
%>

<!--  <meta http-equiv="refresh" content="5;questions.jsp"> -->
<form action="Teil1Questions" method="post">
<center>
<br> <br> <br> <br> 
<P style="font-size: 45px" > <b>  Teil 1 </b> </P>

<br> 


<table width="60%" align="center">
<tr align="left"> <td style="font-family:; font-size: 25px; padding-top:10px; padding-bottom:15px;"> 
 Im Folgenden finden Sie einige Aussagen, die sich auf Ihre Person, Ihre Lernstrategien und Ihre Konzentrationsleistung beziehen.
 
 <br> Bitte geben Sie diejenige Antwort an, die Ihre Sichtweise am besten ausdrückt.
 <br> Sie können Ihre Antwort von <b>"stimme überhaupt nicht zu" bis "stimme voll und ganz zu"</b> abstufen.
 <br> Bitte antworten Sie offen und ehrlich. Lassen Sie keine Aussage aus.
	</td> </tr>
</table>

 <br>   <br> 
 <button style="font-size: 20px" name="submit" type="submit"> &nbsp; Weiter  &nbsp;</button>
 </center>
 
</form>
</body>
</html>