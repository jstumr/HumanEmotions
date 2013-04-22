<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styles.css" />
<title>Feedback 4</title>

<script type="text/javascript"> 
	/* function validateForm()
	{
		alert("Form has been submitted!") ;
        return true;
	} */
</script>
</head>
<body bgcolor="#C0C0C0">
<form id="userForm align="left" " method="post" action="SaveFeedback4">
<center> <br> <br>
<table cellpadding="10" cellspacing="0" border="0" width="70%" >
<tr> <td  align="left" class="bigFont" >
Und nun die letzten Fragen... Bitte lesen Sie diese aufmerksam durch und geben Sie eine der vorgegebenen Alternativantworten an.
</td>
</tr></table>


<table cellpadding="10" cellspacing="0" border="0" width="80%">

<tr style="background-color: #E1EEF4; font-size: 25px"> 
<td class="numColumn">1. </td>
<td class="userdataQTable"  align="left" colspan="3"> Welches Ergebnis bezüglich Ihrer Konzentrationsleistung haben Sie 
in der Figurerkennungsaufgabe erzielt?</td>
</tr>
<tr style="background-color: #E1EEF4;  font-size: 21px">
	<td> </td>
	<td align="center"><input style="background-color: #E1EEF4;  font-size: 21px" type="radio" name="Q1" value="UNTER"><br>unterdurchschnittliche Leistung</td> 
	<td align="center"><input style="background-color: #E1EEF4;  font-size: 21px" type="radio" name="Q1" value="DURCH"><br>durchschnittliche Leistung </td>
	<td align="center"><input style="background-color: #E1EEF4;  font-size: 21px" type="radio" name="Q1" value="UEBER"><br> überdurchschnittliche Leistung</td>
</tr>

<tr style="background-color: #FFFFFF; font-size: 25px">
<td class="numColumn">2. </td>
<td class="userdataQTable"  align="left" colspan="3">Welches Ergebnis <b> im Vergleich </b> zu dem Ergebnis der Studierendengruppe Ihres Alters
 haben Sie in der Figurerkennungsaufgabe erzielt?</td>
</tr>
<tr style="background-color: #FFFFFF;  font-size: 21px">
	<td> </td>
	<td align="center"><input type="radio" name="Q2" value="UEBER"><br> über dem Ergebnis der Studierendengruppe Ihres Alters</td> 
	<td align="center"><input type="radio" name="Q2" value="ENTSPRECHEND"><br> entsprechend dem Ergebnis der Studierendengruppe Ihres Alters</td>
	<td align="center"><input type="radio" name="Q2" value="UNTER"><br>unter dem Ergebnis der Studierendengruppe Ihres Alters</td>
</tr>

<tr style="background-color: #E1EEF4; font-size: 25px"> 
<td class="numColumn">3. </td>
<td class="userdataQTable"  align="left" colspan="3">Was müssen Sie als Nächstes tun?</td>
</tr>

<tr style="background-color: #E1EEF4;  font-size: 21px">
	<td> </td>
	<td align="center"><input style="background-color: #E1EEF4;  font-size: 21px" type="radio" name="Q3" value="KEINE_ERKENNUNG"><br>keine weitere Erkennungaufgabe bearbeiten</td> 
	<td align="center"><input style="background-color: #E1EEF4;  font-size: 21px" type="radio" name="Q3" value="ERKENNUNG"><br>eine weitere Erkennungsaufgabe bearbeiten</td>
	<td>   </td>
</tr>

<tr style="background-color: #FFFFFF; font-size: 25px"> 
<td class="numColumn">4. </td>
<td class="userdataQTable"  align="left" colspan="3">Haben Sie in der Vergangenheit, d.h. vor dieser Studie, bereits eine Konzentrationsaufgabe bearbeitet?</td>
</tr>

<tr style="background-color: #FFFFFF;  font-size: 21px">
	<td> </td>
	<td align="center"><input type="radio" name="Q4" value="JA">Ja</td> 
	<td align="center"><input type="radio" name="Q4" value="NEIN">Nein</td>
	<td align="left"></td>
</tr>



</table>
<br>
<button style="font-size: 20px" name="submit" type="submit" onclick="validateForm();">  &nbsp; Weiter  &nbsp;</button>

</form>
</body>
</html>