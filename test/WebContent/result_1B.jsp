<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styles.css" />
<title>Ergebnis!</title>
</head>
<body bgcolor="#C0C0C0">
<%

	int userAge = 0;
	int ageMinus = 18;
	 int agePlus = 26;
	//System.out.println("session.getAttribute(userAge).toString()" + session.getAttribute("userAge").toString());
	if(session.getAttribute("userAge")!= null||!session.getAttribute("userAge").toString().equals(""))
	{
		 userAge = Integer.parseInt( session.getAttribute("userAge").toString());
		 agePlus = userAge + 2; 
		 ageMinus = userAge - 2;
	}
	
	
	
	/* int waitingtime = 10;
	response.setHeader("Refresh", waitingtime + ";url=result_1Adetailed.jsp");  */
		
%>
<center> <br> <br>
<table width="60%" style="border-collape:collapse;	border: 2px solid black;" 
	cellpadding="0" cellspacing="0" width="100%" >
<tr align="center" > 
	<td style="border: 1px solid black; font-size: 25px;" width="40%" > </td>
	<td style="border: 1px solid black;font-size: 25px; " width="35%"> <b>Durchschnittlicher Leistungsbereich*
	</b><br> studentische Stichprobe <%=ageMinus%> - <%=agePlus%>
	  Jahre (N=618 Personen) </td>
	<td style="border: 1px solid black;font-size: 25px;" width="25%"> <b> Ihr Ergebnis </b> <br> 
	 <% if (userAge!= 0 ) 
	 {
	 %>
	 <%=userAge %> Jahre 
	 <%
	 }
	  %> 
	</td>
</tr>

<tr align="center" > 
	<td  align="left" style="border: 1px solid black; font-size: 25px;"> <br> <b>Leistungsquantität </b><br> (=Anzahl der bearbeiteten Durchgänge) <br> </td>
	<td style="border: 1px solid black; font-size: 25px; " ><br/> 26 - 30 </td>
	<td style="border: 1px solid black; font-size: 25px; "> <br/> 28 </td>
</tr>

<tr align="center"> 
	<td  align="left" style="border: 1px solid black; font-size: 25px;"> <br/><b> Leistungsqualität </b> <br>(=Anteil der richtig bearbeiteten Durchgänge gemessen an allen bearbeiteten Durchgängen)<br> </td>
	<td style="border: 1px solid black; font-size: 25px; " > <br/> 71 - 80% </td>
	<td style="border: 1px solid black; font-size: 25px; "> <br/> 78% </td>
</tr>
</table>
<table width="60%" cellpadding="0" cellspacing="0" >
<tr align="left" colspan="3" > 
<td colspan="3" > 
<p style="font-size: 21px" >* Erläuterung: <br>
Die Angaben für den durchschnittlichen Leistungsbereich beruhen auf den Ergebnissen in der Figurerkennungsaufgabe von 
insgesamt N=618 studierenden Personen zwischen <%=ageMinus %> und <%=agePlus %> Jahren. <br> 
Werte unterhalb dieses Leistungsbereichs gelten als "unterdurchschnittlich", Werte oberhalb dieses Leistungsbereichs gelten als "überdurchschnittlich".
</p>
</td>
</tr>
</table>
</center>
<form  action="result_1Bdetailed.jsp" method="post">
<center> <br> <br>
<button style="font-size: 20px" name="submit" type="submit">  &nbsp; Weiter  &nbsp;</button>
</center>
</form>
</body>
</html>