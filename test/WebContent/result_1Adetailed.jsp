<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styles.css" />
<title>Teil 2 - Introduction</title>
</head>
<body bgcolor="#C0C0C0">

<%


int userAge = 0;
int ageMinus = 18;
int agePlus = 26;
System.out.println("session.getAttribute(userAge).toString()" + session.getAttribute("userAge").toString());
if(!session.getAttribute("userAge").toString().equals(""))
{
	 userAge = Integer.parseInt( session.getAttribute("userAge").toString());
	 agePlus = userAge + 2; 
	 ageMinus = userAge - 2;
}


	
	
	String testType = session.getAttribute("testType").toString();
	if(testType.equals("A"))
	{		
		%> 
		<form  method="post" action= "dankeAA.jsp"> 
		<% 
	}
	else if (testType.equals("B"))
	{
		%> 
		<form  method="post" action= "dankeAB.jsp"> 
		<% 
	}
	
%>
<br> <br>  <br> </br>
<center>
<table width="60%" align="center">

<tr align="left"> 
<!--  <td class="heading"> <b> *  &nbsp;</b> </td>  -->
<td class="heading"> 
<p id="msg" class="thanks"> <b>
 Auswertung der Figurerkennungsaufgabe:
</b> </br>

<p> - Ihr Ergebnis in der Figurerkennungsaufgabe entspricht dem höchsten Leistungsbereich auf der Basis der Ergebnisse der studentischen Vergleichsstichprobe.
</p>
</td> </tr>

<tr align="left"> 
<!-- <td class="heading"> <b> *  &nbsp;</b> </td> -->
<td class="heading"> 
<p> - Ihre Konzentrationsleistung, d.h. Ihr Tempo und Ihre Genauigkeit des konzentrierten Arbeitens, liegen in der Figurerkennungsaufgabe im Bereich "überdurchschnittlich".</p>
</td> </tr>
</table>
 <br> <br></br> </br>
<button style="font-size: 20px" name="submit" type="submit">  &nbsp; Weiter  &nbsp;</button>

</center>
</form>
</body>
</html>